FROM python:3.7.4-stretch

LABEL "version"="1.0.0"
LABEL "repository"="https://github.com/comfuture/actions/python"
LABEL "homepage"="https://github.com/comfuture/actions/python"
LABEL "maintainer"="Changkyun Kim <comfuture@gmail.com>"

LABEL "com.github.actions.name"="GitHub Action for Python"
LABEL "com.github.actions.description"="Wraps the Python CLI to enable common python/pip commands."
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "--help" ]
