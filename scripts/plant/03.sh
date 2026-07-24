#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
source "$(dirname "$0")/_common.sh"
init_playground_repo
printf 'Chapter 1\n' > "$PLAY/handbook.txt"
git -C "$PLAY" add handbook.txt
git -C "$PLAY" commit -m "wip wrong message"
printf '# Handbook\n' > "$PLAY/README.md"
# README left unstaged / uncommitted
