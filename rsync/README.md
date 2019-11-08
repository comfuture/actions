# actions/rsync

![](https://github.com/comfuture/actions/workflows/Test%20rsync%20action/badge.svg)

performs rsync command

## Secret keys

- SSH_KEY
  > content of private key

## Options

```yaml
source:
  description: source location `.`
  required: false
  default: .
dest:
  description: target location `user@server:path`
  required: true
command:
  description: ssh command that runs on remote server after rsync is done.
  required: false
ssh-port:
  description: ssh port (default=22)
  required: false
  default: 22
options:
  description: rsync options
  required: false
  default: -avzO --exclude=".git"
```

## Usage

### Simply copy entire files to destination server

```yaml
on:
  [push]

jobs:
  deploy:

    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v1
    - uses: comfuture/actions/rsync@master
      with:
        dest: user@server.com:path/to/publish
      env:
        SSH_KEY: ${{ secrets.SSH_KEY }}
```

### with some options

```yaml

...
    steps:
    - uses: actions/checkout@v1
    - uses: comfuture/actions/rsync@master
      with:
        options: >
          -avvvvzOH
          --exclude=".git"
          --exclude="__pycache__"
          --exclude="config.py"
          --delete
        source: dist
        dest: user@server.com:path/to/publish
      env:
        SSH_KEY: ${{ secrets.SSH_KEY }}
...
```