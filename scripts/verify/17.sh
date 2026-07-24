#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

list=$(git -C "$PLAY" worktree list)
echo "$list" | grep -q 'hotfix/urgent' || fail "worktree list must include hotfix/urgent"
content=$(git -C "$PLAY" show hotfix/urgent:urgent.txt 2>/dev/null | tr -d '\r' || true)
[[ "$content" == "patched" ]] || fail "hotfix/urgent must contain urgent.txt with patched"
# primary clean
[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "playground working tree not clean"
echo "OK"
