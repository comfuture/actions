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

### upload file to slack

```yaml
# ...
      args: |
        file upload dist/bundle.zip \
          --title "Built new bundle:" \
          --comment "Size: ${stat -f%z dist/bundle.zip} bytes" \
          --channels "#build"
```

Please refer to [slack-cli][slack-cli] github page



[slack-cli]: https://github.com/rockymadden/slack-cli
