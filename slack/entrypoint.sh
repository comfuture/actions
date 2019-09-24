#!/usr/bin/env bash

set -e

RESULT=$(slack $@)
TS=$(echo $RESULT | jq -r '.ts')
echo "##[set-output name=message_ts]$TS"
exit 0
