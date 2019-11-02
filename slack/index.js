const core = require('@actions/core')
const { WebClient } = require('@slack/web-api')

;(async () => {
  const token = process.env.SLACK_TOKEN
  const client = new WebClient(token)

  let text = core.getInput('message')
  let channel = core.getInput('channel')
  if (!channel.startsWith('#')) {
    channel = `#${channel}`
  }
  let payload = { channel, text, mrkdwn: true, parse: 'full' }
  try {
    let attachmentsParam = core.getInput('attachments')
    if (attachmentsParam) {
      let attachments = JSON.parse(attachmentsParam)
      payload['attachments'] = attachments
    }
  } catch (e) {
    // pass
  }
  let res = await client.chat.postMessage()
  core.setOutput('ts', res.ts)
})().catch(e => {
  core.setFailed(e.toString())
})
