#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Start the server
bundle exec rails s -p $PORT -b 0.0.0.0
