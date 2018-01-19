#!/bin/sh

DOCKER_MANTAINER_NAME=lnlscon
DOCKER_NAME=haproxy
DOCKER_TAG=latest

docker build -t ${DOCKER_MANTAINER_NAME}/${DOCKER_NAME}:${DOCKER_TAG} .
