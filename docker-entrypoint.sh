#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# If no command is supplied, usually in produciton,
# then just start the serve using the port provided.
# If a command is supplied, usually in development, 
# use it instead.
if [ "$#" -eq 0 ]; then 
  bundle exec rails s -p $PORT -b 0.0.0.0
else
  exec "$@"
fi