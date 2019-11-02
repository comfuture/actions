const core = require('@actions/core');
const YAML = require('yaml');
const { WebClient } = require('@slack/web-api');

function getInput(name) {
  return core.getInput(name);
}

function getJSON(name) {
  let ret;
  try {
    let param = getInput(name);
    if (param && (ret = YAML.parse(param))) {
      return ret;
    }
  } catch (e) {
    // pass
  }
  return ret;
}

(async () => {
  const token = process.env.SLACK_TOKEN;
  const client = new WebClient(token);

  let text = core.getInput('message');
  let channel = core.getInput('channel');
  if (!channel.startsWith('#')) {
    channel = `#${channel}`;
  }
  let payload = { channel, text, as_user: true, mrkdwn: true, parse: 'full' }

  // attachments
  payload['attachments'] = getJSON('attachments');

  let res;
  let ts = getInput('update');
  if (ts) {
    // update
    payload['ts'] = ts;
    res = await client.chat.update(payload);
  } else {
    // post
    res = await client.chat.postMessage(payload);
  }
  core.setOutput('ts', res.ts);
  core.setOuutput('channel', res.channel);
})().catch(e => {
  core.setFailed(e.toString());
});
