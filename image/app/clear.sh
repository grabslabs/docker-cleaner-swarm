#!/bin/sh
set -e

echo "Start clear jobs: $(date '+%Y-%m-%d %H:%M:%S')"

if [[ -z "$CLEAR_CONTAINERS" ]]; then
   sh -x /app/containers.sh
else
	if [ "$CLEAR_CONTAINERS" = "true" ]; then
		sh -x /app/containers.sh
	fi
fi

if [[ -z "$CLEAR_IMAGES" ]]; then
   sh -x /app/images.sh
else
	if [ "$CLEAR_IMAGES" = "true" ]; then
		sh -x /app/images.sh
	fi
fi

if [[ -z "$CLEAR_VOLUMES" ]]; then
   sh -x /app/volumes.sh
else
	if [ "$CLEAR_VOLUMES" = "true" ]; then
		sh -x /app/volumes.sh
	fi
fi

if [[ -z "$CLEAR_NETWORKS" ]]; then
   sh -x /app/networks.sh
else
	if [ "$CLEAR_NETWORKS" = "true" ]; then
		sh -x /app/networks.sh
	fi
fi

if [[ -z "$CLEAR_LOGS" ]]; then
   sh -x /app/logs.sh
else
	if [ "$CLEAR_LOGS" = "true" ]; then
		sh -x /app/logs.sh
	fi
fi

if [[ -z "$CLEAR_CACHE" ]]; then
   sh -x /app/cache.sh
else
	if [ "$CLEAR_CACHE" = "true" ]; then
		sh -x /app/cache.sh
	fi
fi

echo "End clear jobs: $(date '+%Y-%m-%d %H:%M:%S')"
