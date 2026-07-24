#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
source "$(dirname "$0")/_common.sh"
init_playground_repo

mkdir -p "$PLAY/data"
# Create file with CRLF
printf 'a,b\r\n1,2\r\n' > "$PLAY/data/record.csv"
git -C "$PLAY" add data/record.csv
git -C "$PLAY" commit -m "Add csv with CRLF"

# Configure core.autocrlf to create dirty feeling on checkout-ish scenarios
git -C "$PLAY" config core.autocrlf false
# Touch normalization issue: convert worktree to LF while index has CRLF blob weirdness
# Simpler approach: set attributes missing and make working tree differ
printf 'a,b\n1,2\n' > "$PLAY/data/record.csv"
# Now status shows modification — student must add attributes + renormalize
