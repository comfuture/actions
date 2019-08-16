FROM node:buster

RUN npm i slack-cli@latest
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

