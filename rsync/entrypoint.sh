#!/bin/sh
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
sh -c "rsync $INPUT_OPTIONS -e 'ssh -i $HOME/.ssh/deploy_key -o StrictHostKeyChecking=no -p $SSH_PORT' $SOURCE $INPUT_DEST"

# run after command!
if [[ $INPUT_COMMAND ]]; then
  ssh -i $HOME/.ssh/deploy_key -o StrictHostKeyChecking=no -p ${PORT:-22} $INPUT_HOST "$INPUT_COMMAND"
fi
