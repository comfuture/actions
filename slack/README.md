# slack

performs simple slack command via cli.

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
    env:
    - SLACK_TOKEN: ${{ secrets.SLACK_TOKEN }}
    args: -h general -m "new commits pushed to master!!!"
```

## options

```bash
  -u, --username <ARG1>         Specify the name of the bot.
  -i, --icon_url <ARG1>         Specify the URL to an image to use as the icon for this message.
  -e, --icon_emoji <ARG1>       Specify the emoji to use as the icon for this message.  This cannot be used together with icon_url.
  -m, --message <ARG1>          Specify the text of the message to send.
  -g, --group <ARG1>            Specify the group name.
  -h, --channel <ARG1>          Specify the channel name.
  -f, --file <ARG1>             Specify the name of the file to send.
  -t, --token <ARG1>            Specify the Slack API token.
  -v, --verbose                 Set to verbose mode.
  -c, --console                 Use console to input message.
  -w, --waitForText <ARG1>      Specify the text message to wait.  Default timeout is 30 seconds.
  -s, --timeout <ARG1>          Specify the seconds to timeout when using --waitForText.
  -l, --linkNames               Link names in messages.
  -r, --read                    Read to stdout.
  -a, --asUser                  Post message as a user for which API Token belongs to.
  -p, --pin                     Pin message after sending.
```

Please refer to [slack-cli][slack-cli] npm package



[slack-cli]: https://www.npmjs.com/package/slack-cli
