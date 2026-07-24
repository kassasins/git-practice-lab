#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
source "$(dirname "$0")/_common.sh"
init_playground_repo

rm -rf "$ROOT/remote.git"
git init --bare -b main "$ROOT/remote.git"

printf 'shared\n' > "$PLAY/shared.txt"
git -C "$PLAY" add shared.txt
git -C "$PLAY" commit -m "Shared base"
git -C "$PLAY" remote add origin "$ROOT/remote.git"
git -C "$PLAY" push -u origin main

# remote-only commit via temp clone
TMP=$(mktemp -d)
git clone "$ROOT/remote.git" "$TMP/r"
git -C "$TMP/r" config user.name "Remote Bot"
git -C "$TMP/r" config user.email "bot@practice.local"
printf 'from remote\n' > "$TMP/r/remote-only.txt"
git -C "$TMP/r" add remote-only.txt
git -C "$TMP/r" commit -m "Remote unique commit"
git -C "$TMP/r" push origin main
rm -rf "$TMP"

# local-only commit (no fetch yet — then fetch to create divergence awareness)
printf 'from local\n' > "$PLAY/local-only.txt"
git -C "$PLAY" add local-only.txt
git -C "$PLAY" commit -m "Local unique commit"
git -C "$PLAY" fetch origin
# now diverged
