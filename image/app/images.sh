#!/bin/sh
# see: https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430
set -e

echo "Start clean docker images: $(date '+%Y-%m-%d %H:%M:%S')"
if docker ps -qa --filter "status=exited" | grep -q . ; then
    # Remove dangling images
    docker rmi $(docker images --filter "dangling=true" -q --no-trunc) ||:
    # Remove images with name "none"
    # You may want to avoid this part to prevent accidental removal of untagged but necessary images. Only enable if you're sure they are safe to delete.
    # docker rmi $(docker images | grep "none" | awk '/ / { print $3 }') ||:
else
    echo "No exited images to remove."
fi
echo "End clean docker images: $(date '+%Y-%m-%d %H:%M:%S')"
