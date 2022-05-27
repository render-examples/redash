#!/bin/bash
set -e

export PYTHONUNBUFFERED=1

export REDASH_HOST="$RENDER_EXTERNAL_HOSTNAME"

exec /app/bin/docker-entrypoint "$@"
