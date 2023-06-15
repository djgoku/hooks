VERSION 0.7

run-all:
    BUILD +run-pre-commit-hooks

build:
    FROM python:3.10-alpine
    WORKDIR /
    RUN apk add git musl-dev go gcc bash
    RUN pip install pre-commit

install-hooks:
    FROM +build
    WORKDIR /app
    RUN git init
    COPY .pre-commit-config.yaml .
    COPY .secrets.baseline .
    RUN pre-commit install-hooks

run-pre-commit-hooks:
    FROM +install-hooks
    COPY . .
    RUN pre-commit run -a
