#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
source "$(dirname "$0")/_common.sh"
init_playground_repo
printf 'public info\n' > "$PLAY/readme.txt"
printf 'API_KEY=super-secret\n' > "$PLAY/secrets.env"
git -C "$PLAY" add readme.txt secrets.env
git -C "$PLAY" commit -m "Add readme and secrets (oops)"
