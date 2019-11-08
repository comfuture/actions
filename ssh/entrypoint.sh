#!/bin/sh
set -eu

# setup variables
PORT=${INPUT_PORT:-22}

# copy private keys temporary
mkdir $HOME/.ssh
chmod 0700 $HOME/.ssh
echo "$SSH_KEY" > $HOME/.ssh/deploy_key
chmod 0400 "$HOME/.ssh/deploy_key"

# run after command!
ssh -i $HOME/.ssh/deploy_key -o StrictHostKeyChecking=no -A -tt -p ${PORT:-22} $INPUT_HOST "$INPUT_COMMAND"
