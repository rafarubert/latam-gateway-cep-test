FROM ruby:3.0.2-alpine

ARG USER
ARG UID

RUN test -n "$USER"
RUN test -n "$UID"

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --no-create-home \
    --uid "$UID" \
    "$USER" "$USER" && \
    apk update && \
    apk add alpine-sdk git ruby-full ruby-dev \ 
    postgresql-dev libpq tzdata

WORKDIR /app

RUN mkdir /tmp/gems

ENV BUNDLE_PATH="/tmp/gems"

COPY Gemfile /app/Gemfile
RUN cp Gemfile.lock /app || echo 'Gemfile.lock does not exist'

RUN gem install bundler && gem install pg && bundle install
USER "$USER"

COPY --chown=${USER} . /app