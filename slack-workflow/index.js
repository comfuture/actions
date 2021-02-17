const https = require('https')

/**
 * get an input from action
 * @param {string} key
 * @return {string}
 */
const getInput = key => process.env[`INPUT_${key.replace(/ /g, '_').toUpperCase()}`] || ''

/**
 * report an error to job
 * @param {string} message 
 */
const setFailed = message => {
  process.exitCode = 1
  const m = message.replace(/%/g, '%25').replace(/\r/g, '%0D').replace(/\n/g, '%0A')
  process.stdout.write(`::error::${m}`)
}

/** super tiny YAML parser with potential bugs */
class YAML {
  /**
   * Parses yaml string 
   * @param {string} s YAML string to parse
   */
  static parse(s) {
    const tokens = str.match(/(---|true|false|null|#(.*)|\[(.*?)\]|\{(.*?)\}|[\w\-]+:|-(.+)|\d+\.\d+|\d+|\n+)/g)
    return new this()._traverse(tokens)
  }

  /** @param {string[]} tokens */
  _traverse(tokens) {
    let token, list = /^-(.*)/, key = /^([\w\-]+):/, stack = {}
    while (token = tokens.shift())
      if (token[0] == '#' || token == '---' || token == "\n") 
        continue
      else if (key.exec(token) && tokens[0] == "\n")
        stack[RegExp.$1] = this._traverse(tokens)
      else if (key.exec(token))
        stack[RegExp.$1] = eval('(' + tokens.shift() + ')')
      else if (list.exec(token))
        (stack.constructor == Array ?
          stack : (stack = [])).push(RegExp.$1.replace(/^\s*|\s*$/, ''))
    return stack
  }
}

(async () => {
  const { hostname, path, port = 443 } = new URL(getInput('webhook'))
  const variables = YAML.parse(getInput('variables'))
  const data = JSON.stringify(variables)
  const options = {
    hostname, port, path,
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Content-Length': data.length,
    }
  }

  const req = https.request(options, res => {  
    res.on('data', buff => {
      process.stdout.write(buff)
    })
  })

  req.on('error', e => {
    setFailed(e.toString())
  })

  req.write(data)
  req.end()

})().catch(e => {
  // nothing
  setFailed(e.toString())
})
