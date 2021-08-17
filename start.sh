#!/bin/sh

rm /tmp/rails_server.pid || echo 'Rails stopped' && bundle exec rails s -p 3000 -b 0.0.0.0 --pid /tmp/rails_server.pid