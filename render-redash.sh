#!/bin/bash
set -e

export PYTHONUNBUFFERED=1

export REDASH_HOST="$RENDER_EXTERNAL_HOSTNAME"
export REDASH_REDIS_URL="redis://${REDIS_HOSTPORT}/0"

NCPUS="$(nproc)"
export REDASH_WEB_WORKERS="${REDASH_WEB_WORKERS:-$NCPUS}"
export WORKERS_COUNT="${WORKERS_COUNT:-$NCPUS}"

exec /app/bin/docker-entrypoint "$@"
