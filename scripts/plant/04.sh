#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
source "$(dirname "$0")/_common.sh"
init_playground_repo
printf 'original keep\n' > "$PLAY/keep-me.txt"
printf 'good content\n' > "$PLAY/accident.txt"
git -C "$PLAY" add keep-me.txt accident.txt
git -C "$PLAY" commit -m "Base files"

printf 'original keep\nimproved line\n' > "$PLAY/keep-me.txt"
printf 'CORRUPTED\n' > "$PLAY/accident.txt"
printf 'should not be committed\n' > "$PLAY/scratch.tmp"
git -C "$PLAY" add keep-me.txt scratch.tmp
# keep-me staged+modified path may vary; ensure scratch staged and accident dirty
git -C "$PLAY" add keep-me.txt
