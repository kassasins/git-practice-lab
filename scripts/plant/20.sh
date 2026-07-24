#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
source "$(dirname "$0")/_common.sh"
init_playground_repo

printf 'keep\n' > "$PLAY/README.md"
git -C "$PLAY" add README.md
git -C "$PLAY" commit -m "Keep main"
git -C "$PLAY" tag v-ok

# forbidden refs
SHA=$(git -C "$PLAY" rev-parse HEAD)
git -C "$PLAY" update-ref refs/backup/old-main "$SHA"
git -C "$PLAY" update-ref refs/original/refs/heads/main "$SHA"
git -C "$PLAY" update-ref refs/backup/extra "$SHA"
