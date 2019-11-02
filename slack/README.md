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

### upload file to slack

```yaml
# ...
    with:
      file: dist/bundle.zip
      args: |
        file upload dist/bundle.zip \
          --title "Built new bundle:" \
          --comment "Size: ${stat -f%z dist/bundle.zip} bytes" \
          --channels "#build"
```

Please refer to [slack-cli][slack-cli] github page



[slack-cli]: https://github.com/rockymadden/slack-cli
