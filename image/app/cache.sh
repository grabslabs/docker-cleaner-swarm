#!/bin/sh
set -e

# Configuration
DISK_THRESHOLD=80  # Percentage of disk usage to trigger cleanup

# Function to check disk usage and decide whether to prune
should_prune() {
  USAGE=$(df /var/lib/docker | awk 'NR==2 {print $5}' | sed 's/%//')
  if [ "$USAGE" -ge "$DISK_THRESHOLD" ]; then
    return 0  # True, disk usage is above the threshold
  else
    return 1  # False, no need to prune
  fi
}

echo "Start clean docker cache: $(date '+%Y-%m-%d %H:%M:%S')"

# Check if we should prune based on disk usage
if should_prune; then
  echo "Disk usage is above ${DISK_THRESHOLD}%. Proceeding with cache cleanup."
  docker builder prune --force --all --keep-storage 2GB ||:
  echo "Docker builder cache cleanup completed."
else
  echo "Disk usage is below ${DISK_THRESHOLD}%. Skipping cache cleanup."
fi

echo "End clean docker cache: $(date '+%Y-%m-%d %H:%M:%S')"
