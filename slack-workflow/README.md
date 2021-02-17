# slack-workflow

send a post request to slack workflow webhook

## Usage

```yaml
on:
  release:
    types: [published]

runs-on: ubuntu-latest

jobs:
  notify:
    uses: comfuture/actions/slack-workflow@master
    with:
      webhook: https://hook.slack.com/workflows/AABBCCDD
      variables: >
        message: Release ${{ github.event.release.name }} published!
        tag: ${{ github.event.release.tag_name }}
```

## parameters

* webhook: webhook url of workflow
* variables: additional variables in YAML **string**
