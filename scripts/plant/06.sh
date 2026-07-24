#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
source "$(dirname "$0")/_common.sh"
init_playground_repo
printf 'blue\n' > "$PLAY/theme.txt"
git -C "$PLAY" add theme.txt
git -C "$PLAY" commit -m "Start with blue"

git -C "$PLAY" switch -c feature/colors
printf 'green\n' > "$PLAY/theme.txt"
git -C "$PLAY" add theme.txt
git -C "$PLAY" commit -m "Prefer green"

git -C "$PLAY" switch main
printf 'blue\nteal\n' > "$PLAY/theme.txt"
git -C "$PLAY" add theme.txt
git -C "$PLAY" commit -m "Experiment on main"

# start merge and leave conflicts
set +e
git -C "$PLAY" merge feature/colors --no-commit
set -e
# ensure conflict markers present
