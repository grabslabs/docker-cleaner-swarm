#!/bin/sh
set -e

# Run every dat at 3 AM 
echo "0 3 * * * /app/clear.sh" | crontab -

crond -f -L -
