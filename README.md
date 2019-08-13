# GitHub Actions

Fun with robots.

This is a collection of [GitHub Actions](https://github.com/features/actions) that I thought might be useful to others.
There aren't many for now, but any general actions I create will get stored here.

# [SSH](ssh)

This action will run the provided argument as a command on your $HOST via SSH.

<img width="303" alt="image" src="https://user-images.githubusercontent.com/260/47310459-3eb48a80-d605-11e8-867f-702182404b51.png">

```
action "Run deploy script" {
  uses = "maddox/actions/ssh@master"
  args = "/opt/deploy/run"
  secrets = [
    "PRIVATE_KEY",
    "HOST",
    "USER"
  ]
}
```

## License

[MIT](LICENSE). Please see additional information in each subdirectory.
