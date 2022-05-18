#!/bin/bash
set -e

export PYTHONUNBUFFERED=1

export REDASH_HOST="$RENDER_EXTERNAL_HOSTNAME"
export REDASH_REDIS_URL="redis://${REDIS_HOSTPORT}/0"

exec /app/bin/docker-entrypoint "$@"
