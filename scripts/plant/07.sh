#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
source "$(dirname "$0")/_common.sh"
init_playground_repo
printf 'Welcome aborad\n' > "$PLAY/banner.txt"
git -C "$PLAY" add banner.txt
git -C "$PLAY" commit -m "Add banner with typo"

git -C "$PLAY" switch -c hotfix/typo
printf 'Welcome aboard\n' > "$PLAY/banner.txt"
git -C "$PLAY" add banner.txt
git -C "$PLAY" commit -m "Fix banner typo"

# extra commit that should NOT be required on main via merge
printf 'notes\n' > "$PLAY/extra.txt"
git -C "$PLAY" add extra.txt
git -C "$PLAY" commit -m "Unrelated extra"

git -C "$PLAY" switch main
