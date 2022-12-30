#!/bin/sh
set -e

echo "Start clean postgres logs: $(date '+%Y-%m-%d %H:%M:%S')"
sh -c -x `rm /opt/docker/postgres/data/postgres/pg_log/*` ||:
echo "End clean postgres logs: $(date '+%Y-%m-%d %H:%M:%S')"
