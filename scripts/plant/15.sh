#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
source "$(dirname "$0")/_common.sh"
init_playground_repo

printf 'stable line\n' > "$PLAY/notes.txt"
git -C "$PLAY" add notes.txt
git -C "$PLAY" commit -m "Stable notes"

# stash work
printf 'stable line\nstashed idea\n' > "$PLAY/notes.txt"
git -C "$PLAY" stash push -m "idea"

# diverge worktree so pop conflicts
printf 'stable line\nconflicting edit\n' > "$PLAY/notes.txt"
git -C "$PLAY" add notes.txt
git -C "$PLAY" commit -m "Conflicting edit on branch"
