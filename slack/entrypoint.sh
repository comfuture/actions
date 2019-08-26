#!/usr/bin/env bash

set -e

RESULT=$(slack $*)
echo $RESULT
TS=$(echo $RESULT | jq '.ts')
echo "##[set-output name=message_ts] $TS"
exit 0