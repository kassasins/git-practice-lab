#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

git -C "$PLAY" remote get-url origin >/dev/null || fail "origin remote missing"
[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "working tree not clean"
upstream=$(git -C "$PLAY" rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null || true)
[[ "$upstream" == "origin/main" ]] || fail "main should track origin/main (got: ${upstream:-none})"
local_tip=$(git -C "$PLAY" rev-parse main)
remote_tip=$(git -C "$PLAY" rev-parse origin/main)
[[ "$local_tip" == "$remote_tip" ]] || fail "local main and origin/main differ"
echo "OK"
