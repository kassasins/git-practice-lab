#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
source "$(dirname "$0")/_common.sh"
init_playground_repo
printf 'base\n' > "$PLAY/README.md"
git -C "$PLAY" add README.md
git -C "$PLAY" commit -m "Base"

git -C "$PLAY" switch -c feature/docs
mkdir -p "$PLAY/docs"
printf 'How to practice\n' > "$PLAY/docs/guide.txt"
git -C "$PLAY" add docs/guide.txt
git -C "$PLAY" commit -m "Add guide"

git -C "$PLAY" switch main
printf 'base\nupdate\n' > "$PLAY/README.md"
git -C "$PLAY" add README.md
git -C "$PLAY" commit -m "Advance main"

# feature/docs is now behind main
git -C "$PLAY" switch feature/docs
