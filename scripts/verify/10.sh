#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "working tree not clean"
local_tip=$(git -C "$PLAY" rev-parse main)
remote_tip=$(git -C "$PLAY" rev-parse origin/main)
[[ "$local_tip" == "$remote_tip" ]] || fail "main and origin/main must match"
git -C "$PLAY" cat-file -e "HEAD:local-only.txt" || fail "missing local-only.txt"
git -C "$PLAY" cat-file -e "HEAD:remote-only.txt" || fail "missing remote-only.txt"
upstream=$(git -C "$PLAY" rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null || true)
[[ "$upstream" == "origin/main" ]] || fail "tracking should be origin/main"
echo "OK"
