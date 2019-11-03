#!/bin/bash
set -eu

# setup variables
SSH_PORT=${INPUT_SSH_PORT:-22}
SOURCE=${INPUT_SOURCE:-.}

# copy private keys temporary
mkdir $HOME/.ssh
chmod 0700 $HOME/.ssh
echo "$SSH_KEY" > $HOME/.ssh/deploy_key
chmod 0400 "$HOME/.ssh/deploy_key"

# run!
sh -c "rsync $INPUT_OPTIONS -e 'ssh -i $HOME/.ssh/deploy_key -o StrictHostKeyChecking=no -p $SSH_PORT' $GITHUB_WORKSPACE/$SOURCE $INPUT_DEST"
