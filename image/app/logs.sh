#!/bin/sh
set -e

echo "Start clean postgres logs: $(date '+%Y-%m-%d %H:%M:%S')"
if [ -n "$(ls -A /opt/docker/postgres/data/postgres/pg_log/)" ]; then
    rm /opt/docker/postgres/data/postgres/pg_log/* ||:
else
    echo "No files to remove."
fi
echo "End clean postgres logs: $(date '+%Y-%m-%d %H:%M:%S')"
