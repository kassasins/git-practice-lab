#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
source "$(dirname "$0")/_common.sh"
init_playground_repo

printf 'base\n' > "$PLAY/README.md"
git -C "$PLAY" add README.md
git -C "$PLAY" commit -m "Base"

printf 'treasure\n' > "$PLAY/important.dat"
git -C "$PLAY" add important.dat
git -C "$PLAY" commit -m "Add important data"

git -C "$PLAY" reset --hard HEAD~1
# important commit only in reflog
