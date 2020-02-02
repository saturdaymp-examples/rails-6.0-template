# By default this Dockefile is setup to create a
# development environment container.  It can be
# overriden for stagin/production by setting the
# RAILS_ENV during the container build and run.

# Note that rebuilding the container can result in a newer
# version of apline.  For example you might have 3.10.0
# then 3.10.1 in a future build.
FROM ruby:2.6.5-alpine3.11

# Argument and envrionemnt so the environment
# can be used when building the container and
# also running it.
ARG RAILS_ENV=development
ENV RAILS_ENV=$RAILS_ENV

# Default for development, override for your staging/production
# environment.
ENV PORT=3000

# Working directory.
RUN mkdir /app
WORKDIR /app

# build-base: Build some gems.
# postgressql-dev: Connect to Postgres DB.
# nodejs: Used by Rails.
# tzdata: Used by Rails.
# yarn: Used by Rails to manage node packages.
# bash, git, wget, chromium: Required by Sorbet and Rails Sorbet
# glibc: Required by Sorbet but there is no Alpine package so it must be installed manullay.
RUN apk update && \
    apk add --no-cache "build-base" \
                       "postgresql-dev" \
                       "nodejs" \
                       "tzdata" \
                       "yarn" \
                       "bash" \
                       "git" \
                       "wget" \
                       "chromium" && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-2.30-r0.apk && \
    apk add --no-cache "glibc-2.30-r0.apk"

# Install the gems.
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.0.2
RUN if [ "$RAILS_ENV" = "development" ] ; then \
    bundle install ; \
    else \
    bundle install --without development test ; \
    fi

# Yarn packages.
COPY package.json yarn.lock ./
RUN if [ "$RAILS_ENV" = "development" ] ; then \
    yarn install --check-files --frozen-lockfile ; \
    else \
    yarn install --check-files --frozen-lockfile --no-cache --production ; \
    fi

# Add the code.
COPY . .

# Precompile the assets if in production.  Need a dummy
# secrect key otherwise Rails will error out with:
#
#  ArgumentError: Missing `secret_key_base` for 'production' environment
#
# https://github.com/rails/rails/issues/32947
RUN if [ "$RAILS_ENV" != "development" ] ; then \
    SECRET_KEY_BASE=dummy rails assets:precompile; \
    fi

# Expose the port.
EXPOSE $PORT

# Rubymine does not respect the working directory
# so can't find the entrypoint if you don't put
# the full path of the entry point.
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["/app/docker-entrypoint.sh"]
