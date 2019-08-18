FROM alpine:latest

LABEL "com.github.actions.name"="Slack notification"
LABEL "com.github.actions.description"="Post some message to slack channel"
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="https://github.com/comfuture/actions/slack"
LABEL "homepage"="https://github.com/comfuture/actions/slack"
LABEL "maintainer"="Changkyun Kim <comfuture@gmail.com>"

RUN apk --update add bash sed jq && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

ADD slack /slack
RUN ["chmod", "+x", "/slack"]

ENTRYPOINT ["/slack"]

