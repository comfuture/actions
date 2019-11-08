# actions/ssh

Run a thing on your server.

This action will run the command on your $HOST via SSH.

## Secret keys

- SSH_KEY
  > content of private key

## Options

```yaml
command:
  description: ssh command that you want to run
  required: true
host:
  description: remote server in `user@server` pattern
  required: true
port:
  description: ssh port (default=22)
  required: false
  default: 22
```

## Usage

```yaml
on:
  [push]
jobs:
  ls:
    runs-on: ubuntu-latest
    steps:
    - uses: comfuture/actions/ssh@master
      with:
        command: ls -al
        host: user@me.com
      env:
        SSH_KEY: ${{ secrets.SSH_KEY }}
```
