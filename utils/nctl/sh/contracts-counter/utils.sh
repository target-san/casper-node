#!/usr/bin/env bash

#######################################
# COUNTER: get on-chain contract hash.
# Arguments:
#   Contract owner account key.
#######################################
function get_contract_hash ()
{
    local ACCOUNT_KEY=${1}

    $(get_path_to_client) query-state \
        --node-address "$(get_node_address_rpc)" \
        --state-root-hash "$(get_state_root_hash)" \
        --key "$ACCOUNT_KEY" \
        | jq '.result.stored_value.Account.named_keys[] | select(.name == "counter") | .key' \
        | sed -e 's/^"//' -e 's/"$//'
}

#######################################
# COUNTER: get on-chain contract key value.
# Arguments:
#   Contract owner account key.
#   State query path.
#######################################
function get_contract_key_value ()
{
    local QUERY_KEY=${1}
    local QUERY_PATH=${2}

    $(get_path_to_client) query-state \
        --node-address "$(get_node_address_rpc)" \
        --state-root-hash "$(get_state_root_hash)" \
        --key "$QUERY_KEY" \
        --query-path "$QUERY_PATH" \
        | jq '.result.stored_value.CLValue.parsed' \
        | sed -e 's/^"//' -e 's/"$//'
}
