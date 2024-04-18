#!/bin/sh

set -e

BUILD_DIR=${INPUT_BUILD_DIR:-'.'}
echo "cd $BUILD_DIR"
cd $BUILD_DIR

REPO="https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
OWNER="$(echo $GITHUB_REPOSITORY | cut -d'/' -f 1)"
REPONAME="$(echo $GITHUB_REPOSITORY | cut -d'/' -f 2)"
PAGES_REPO="${OWNER}.github.io"
if [[ "$REPONAME" == "$PAGES_REPO" ]]; then
  TARGET_BRANCH=$GITHUB_BASE_REF
else
  TARGET_BRANCH="gh-pages"
fi

: "${REMOTE_BRANCH:=$TARGET_BRANCH}"

git config --global init.defaultBranch main
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git config --global --add safe.directory "*"
git init
git branch -m main
if [ -z "$(git status --porcelain)" ]; then
    echo "Nothing to publish"
    exit 0
fi
if git remote | grep -q 'origin'; then
    echo "remove existing origin"
    git remote rm origin
fi
if ! git remote | grep -q 'origin'; then
    echo "add origin"
    git remote add origin "${REPO}"
fi
git add .
git commit --allow-empty -m 'Deploy to GitHub pages'
git push --force $REPO main:$REMOTE_BRANCH
cd $GITHUB_WORKSPACE
echo "Content of $BUILD_DIR has been deployed to GitHub Pages."
