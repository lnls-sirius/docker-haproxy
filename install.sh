#!/bin/bash
set -x
set -e

# Docker files
SRC_DOCKER_COMPOSE_FILE=docker-compose.yml
SERVICE_NAME=lnls-haproxy

# Service files
SRC_SERVICE_FILE=${SERVICE_NAME}.service
SERVICE_FILE_DEST=/etc/systemd/system
DOCKER_FILES_DEST=${SERVICE_FILE_DEST}/${SRC_SERVICE_FILE}.d/

mkdir -p ${DOCKER_FILES_DEST}
cp --preserve=mode haproxy.cfg ${DOCKER_FILES_DEST}
cp --preserve=mode haproxy.pem ${DOCKER_FILES_DEST}
cp --preserve=mode ${SRC_DOCKER_COMPOSE_FILE} ${DOCKER_FILES_DEST}
cp --preserve=mode ${SRC_SERVICE_FILE} ${SERVICE_FILE_DEST}
sed -i "s#/etc/systemd/system/lnls-haproxy.d/#${DOCKER_FILES_DEST}#g" ${SERVICE_FILE_DEST}/${SRC_SERVICE_FILE}
systemctl daemon-reload
systemctl stop ${SERVICE_NAME}
systemctl start ${SERVICE_NAME}

