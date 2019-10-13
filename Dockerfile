FROM ruby:2.6.4-alpine3.10

# If true then development gems and libraries are included
# in the container.
ARG INCLUDE_DEV_ITEMS=true

# Environment and port when running the container.  Override
# for other envrionments other then development.
ENV RAILS_ENV=development
ENV PORT=3000

# Working directory.
RUN mkdir /app
WORKDIR /app

# build-base: Build some gems.
# postgressql-dev: Connect to Postgres DB.
# nodejs: Used by Rails.
# tzdata: Used by Rails.
# yarn: Used by Rails to manage node packages.
RUN apk update && \
    apk add --no-cache "build-base=0.5-r1" \
                       "postgresql-dev=11.5-r1" \
                       "nodejs=10.16.3-r0" \
                       "tzdata=2019b-r0" \
                       "yarn=1.16.0-r0"

# Sorbet type checker is only required for development.
# There is no glibc Alpine Linux package so it must be
# installed manually.
RUN if [ "$INCLUDE_DEV_ITEMS" = "true" ] ; then \
    apk add --no-cache "bash=5.0.0-r0" "git=2.22.0-r0" "wget=1.20.3-r0" "chromium=73.0.3683.103-r0" && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-2.30-r0.apk && \
    apk add --no-cache "glibc-2.30-r0.apk" ; \
    fi

# Install the gems.
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.0.2
RUN if [ "$INCLUDE_DEV_ITEMS" = "true" ] ; then \
    bundle install ; \
    else \
    bundle install --without development test ; \
    fi

# Yarn packages.
COPY package.json yarn.lock .yarnrc ./
RUN if [ "${INCLUDE_DEV_ITEMS}" = "true" ] ; then \
    yarn install --check-files --frozen-lockfile ; \
    else \
    yarn install --check-files --frozen-lockfile --no-cache --production ; \
    fi

# Add the code.
COPY . .

# Expose the port.
EXPOSE $PORT

# Rubymine does not respect the working directory
# so can't find the entrypoint if you don't put
# the full path of the entry point.
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["/app/docker-entrypoint.sh"]
