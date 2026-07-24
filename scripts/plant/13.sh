#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
source "$(dirname "$0")/_common.sh"
init_playground_repo

printf 'mainline\n' > "$PLAY/README.md"
git -C "$PLAY" add README.md
git -C "$PLAY" commit -m "Main"
OLD=$(git -C "$PLAY" rev-parse HEAD)

printf 'old note\n' > "$PLAY/old.txt"
git -C "$PLAY" add old.txt
git -C "$PLAY" commit -m "Old commit"

# detach at old tip's parent? detach at first commit and make discovery
git -C "$PLAY" checkout "$OLD"
printf 'found-it\n' > "$PLAY/discovery.txt"
git -C "$PLAY" add discovery.txt
git -C "$PLAY" commit -m "Discovery while detached"
# leave detached
