VERSION 0.7

run-all:
    BUILD +run-pre-commit-hooks
    BUILD +run-bats-hooks-test

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

setup-bats:
    FROM +install-hooks
    RUN git clone https://github.com/bats-core/bats-core.git /bats/test/bats
    RUN ln -s /bats/test/bats/bin/bats /usr/local/bin/bats

run-bats-hooks-test:
    FROM +setup-bats
    WORKDIR /test
    COPY ./bats/tests/successful-test.bats .
    COPY pre-commit-config-hooks-for-testing.yaml .pre-commit-config.yaml
    RUN git init
    RUN git add .
    RUN pre-commit run -a
