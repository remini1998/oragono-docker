#!/bin/sh

set -e

if [ ! -f ./ircd.yaml ]; then
  cp oragono.yaml ircd.yaml
fi

./oragono genpasswd

if [ ! -f ircd.db ]; then
  ./oragono initdb
fi

if [ ! -f tls.crt ]; then
  ./oragono mkcerts
fi

exec ./oragono run
