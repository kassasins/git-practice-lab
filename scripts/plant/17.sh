#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
source "$(dirname "$0")/_common.sh"
init_playground_repo

printf 'main\n' > "$PLAY/README.md"
git -C "$PLAY" add README.md
git -C "$PLAY" commit -m "Main base"

# create branch without worktree yet — student adds worktree and patch
git -C "$PLAY" branch hotfix/urgent
# leave urgent.txt missing so student must add patch on that branch
rm -rf "$ROOT/wt-hotfix"
