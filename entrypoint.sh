#!/bin/sh

bundle check || bundle install
bundle exec rake db:migrate || bundle exec rake db:create db:migrate

exec "$@"
