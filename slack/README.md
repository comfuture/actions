# slack

performs simple slack command via cli.

## prerequirement

secret `SLACK_TOKEN` is needed.

## Usage

```yaml
on:
  push:
    branches:
    - master

runs-on: ubuntu-latest

jobs:
  shout:
    uses: comfuture/actions/slack@master
    with:
      args: chat send "pushed!" "#general"
    env:
      SLACK_TOKEN: ${{ secrets.SLACK_TOKEN }}
```

## Advenced usage

### format message and attachment

```yaml
# ...
jobs:
  preview:
    uses: comfuture/actions/slack@master
    with:
      args: |
        chat send \
          --image https://lorempixel.com/400/200/ \
          --color good \
          --fields '{"title": "Status", "value": "Normal"}' \
          --text "Hello, world!" \
          --channel "#notification"
```

### update message with ts output

```yaml
jobs:
  greeting:
    runs-on: ubuntu-latest
    steps:
    - uses: comfuture/actions/slack@latest
      id: hello
      with:
        channel: general
        message: Hello?
    - runs: sleep 3
    - uses: comfuture/actions/slack@latest
      with:
        channel: ${{ steps.hello.outputs.channel }}
        message: Bye~
        update: ${{ steps.hello.outputs.ts }}

```
