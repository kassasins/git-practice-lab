#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
source "$(dirname "$0")/_common.sh"
init_playground_repo

rm -rf "$ROOT/remote.git"
git init --bare -b main "$ROOT/remote.git"

printf 'base\n' > "$PLAY/README.md"
git -C "$PLAY" add README.md
git -C "$PLAY" commit -m "Base"
git -C "$PLAY" remote add origin "$ROOT/remote.git"
git -C "$PLAY" push -u origin main

# mistaken commits on main
printf 'oauth-ready\n' > "$PLAY/login.txt"
git -C "$PLAY" add login.txt
git -C "$PLAY" commit -m "Add login feature"

# empty feature branch at old tip
git -C "$PLAY" branch feature/login origin/main
# main is ahead with feature commits — student must move them
