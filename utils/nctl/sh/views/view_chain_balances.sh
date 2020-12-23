#!/usr/bin/env bash

source $NCTL/sh/utils.sh
source $NCTL/sh/views/funcs.sh

log "---- faucet balance ----"
render_account_balance $NCTL_ACCOUNT_TYPE_FAUCET

log "---- validator balances ----"
for NODE_ID in $(seq 1 $(get_count_of_nodes))
do
    render_account_balance $NCTL_ACCOUNT_TYPE_NODE $NODE_ID
done

log "---- user balances ----"
for USER_ID in $(seq 1 $(get_count_of_users))
do
    render_account_balance $NCTL_ACCOUNT_TYPE_USER $USER_ID
done