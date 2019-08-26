FROM alpine:latest

LABEL "repository"="https://github.com/comfuture/actions/slack"
LABEL "homepage"="https://github.com/comfuture/actions/slack"
LABEL "maintainer"="Changkyun Kim <comfuture@gmail.com>"

RUN apk --update add bash sed curl jq && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

ADD slack /bin
RUN ["chmod", "+x", "/bin/slack"]

ENTRYPOINT ["/bin/slack"]
