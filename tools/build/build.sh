#!/bin/sh
set -e
cd "$(dirname "$0")"
bash ../build_rust_1984.sh "$@" # SS1984 ADDITION
exec ../bootstrap/javascript.sh build.ts "$@"
