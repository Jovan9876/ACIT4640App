#!/bin/bash

set -ex

envsubst < /app/src/backend.conf.template > /app/src/backend.conf

/app/src/wait-for-it.sh -h -p ${MYSQL_HOST}:${MYSQL_PORT} -t 0

exec /app/.local/bin/gunicorn wsgi:app -b 0.0.0.0:8000
