# GitHub Action to Deploy Static Assets to GitHub Actions

This action simply lets you deploy arbitrary folders of static content from your web content to [GitHub pages](https://pages.github.com).

## Arguments

- build_dir: The directory to deploy.

No other arguments are required. The action will automatically deploy to the `gh-pages` branch of the repository. also it will use the `GITHUB_TOKEN` secret to authenticate with GitHub.

## Example Usage

```
- name: build pages
  run: |
    npm install
    npm run build
- name: Deploy to GitHub Pages
  uses: comfuture/actions/ghpages@v2
  with:
    build_dir: dist
```
