#!/bin/sh
set -e

# Install the gems and node moduels in the entrypoint so they
# are added to the containers volume in development.  In
# production, when not using docker compose, these commands will
# still run but just say the dependcies are up to date.
bundle check || bundle install && bundle clean --force
yarn install --check-files --frozen-lockfile

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