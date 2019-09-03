# deploy serverless stack

```yaml
steps:
- uses: actions/checkout@v1
- uses: comfuture/actions/serverless@master
  with:
    args: deploy
  env:
    AWS_ACCESS_KEY: ${{ secrets.AWS_ACCESS_KEY }}
    AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```
