# actions/python

Runs python and pip

## Usage

### HCL Syntax

```HCL
workflow "Test" {
    on = "push"
    resolves = [
        "Run test"
    ]
}

action "Install deps" {
    uses = "comfuture/actions/python@master"
    args = "pip install -r requirements.txt"
}

action "Run test" {
    uses = "comfuture/actions/python@master"
    args = "pytest"
    needs = [ "Install deps" ]
}
```

### CICD workflow

```yaml
name: Test
on:
- push
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Install deps
      uses: comfuture/actions/python@master
      run: |
        pip install -r requirements.txt
    - name: Run test
      uses: comfuture/actions/python@master
      run: |
        pytest
````

