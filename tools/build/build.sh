#!/bin/sh
set -e
cd "$(dirname "$0")"
bash ../build_rust_celadon.sh "$@" # Celadon ADDITION
exec ../bootstrap/javascript.sh build.ts "$@"
