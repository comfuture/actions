# slack

![](https://github.com/comfuture/actions/workflows/Test%20slack%20action/badge.svg)

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
    uses: comfuture/actions/slack@latest
    with:
      message: Hello!
      channel: general
    env:
      SLACK_TOKEN: ${{ secrets.SLACK_TOKEN }}
```

## Advenced usage

### format message and attachment

attachment should be a multiline text block that contains YAML or JSON structure.

```yaml
# ...
jobs:
  preview:
    uses: comfuture/actions/slack@latest
    with:
      channel: general
      attachments: >
        - pretext: 서버 상태
          color: good
          fields:
          - title: 'Kubernetes
            value: Everything OK
            short: false
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
