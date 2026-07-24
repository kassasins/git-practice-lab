#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
source "$(dirname "$0")/_common.sh"
init_playground_repo

mkdir -p "$PLAY/app"
printf '0.9.0\n' > "$PLAY/app/version.txt"
git -C "$PLAY" add app/version.txt
git -C "$PLAY" commit -m "Version 0.9.0"

printf '1.0.0\n' > "$PLAY/app/version.txt"
git -C "$PLAY" add app/version.txt
git -C "$PLAY" commit -m "Bump to 1.0.0"

printf '1.0.1-dev\n' > "$PLAY/app/version.txt"
git -C "$PLAY" add app/version.txt
git -C "$PLAY" commit -m "Start 1.0.1-dev"

# wrong lightweight tag on tip
git -C "$PLAY" tag v1.0.0
