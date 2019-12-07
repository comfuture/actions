#!/bin/sh
set -e

# setup variables
PORT=${INPUT_PORT:-22}
SOURCE=${INPUT_SOURCE:-.}
HOST=$(echo $INPUT_DEST | cut -d ':' -f 1)

echo "HOST=$HOST"
echo "PORT=$PORT"
echo "COMMAND=$INPUT_COMMAND"

# copy private keys temporary
mkdir -p $HOME/.ssh
chmod 0700 $HOME/.ssh
echo "$SSH_KEY" > $HOME/.ssh/deploy_key
chmod 0400 "$HOME/.ssh/deploy_key"

# run!
sh -c "rsync $INPUT_OPTIONS -e 'ssh -i $HOME/.ssh/deploy_key -o StrictHostKeyChecking=no -p $PORT' $SOURCE $INPUT_DEST"

# run after command!
if [[ -n "$INPUT_COMMAND" ]]; then
  ssh -i $HOME/.ssh/deploy_key -o StrictHostKeyChecking=no -A -tt -p ${PORT:-22} $HOST "$INPUT_COMMAND"
fi
