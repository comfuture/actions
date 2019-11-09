# actions/kubectl

This action provides `kubectl` for Github Actions.

## Usage

```yaml
on: [push]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: comfuture/actions/kubectl
      with:
        args: get pods -n default
      env:
        KUBE_CONFIG_DATA: ${{ secrets.KUBE_CONFIG_DATA }}
```

## Secrets

`KUBE_CONFIG_DATA` – **required**: A base64-encoded kubeconfig file with credentials for Kubernetes to access the cluster. You can get it by running the following command:

```bash
cat $HOME/.kube/config | base64
```

**Note**: Do not use kubectl config view as this will hide the certificate-authority-data.

if your cluster is running EKS, aws credentials is needed to use `aws-iam-authenticator`.

`AWS_ACCESS_KEY_ID` - amazon aws access key
`AWS_SECRET_ACCESS_KEY` - aws secret access key

