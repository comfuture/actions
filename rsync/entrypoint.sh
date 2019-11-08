#!/bin/sh
set -eu

# setup variables
SSH_PORT=${INPUT_SSH_PORT:-22}
SOURCE=${INPUT_SOURCE:-.}
HOST=$(echo $INPUT_DEST | cut -d ':' -f 1)

# copy private keys temporary
mkdir $HOME/.ssh
chmod 0700 $HOME/.ssh
echo "$SSH_KEY" > $HOME/.ssh/deploy_key
chmod 0400 "$HOME/.ssh/deploy_key"

# run!
sh -c "rsync $INPUT_OPTIONS -e 'ssh -i $HOME/.ssh/deploy_key -o StrictHostKeyChecking=no -p $SSH_PORT' $SOURCE $INPUT_DEST"

# run after command!
if [[ $INPUT_COMMAND ]]; then
  sh -c "ssh -i $HOME/.ssh/deploy_key -o StrictHostKeyChecking=no -p ${PORT:-22} $HOST '$INPUT_COMMAND'"
fi
