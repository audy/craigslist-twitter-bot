#!/bin/bash

set -euo pipefail

docker build --tag audy/craigslist .

docker run \
  -ti \
  --rm \
  --volume ${PWD}/config.yml:/etc/chatterbot.yml \
  audy/craigslist
