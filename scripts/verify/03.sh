#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

count=$(git -C "$PLAY" rev-list --count HEAD)
[[ "$count" == "1" ]] || fail "expected exactly 1 commit (amend), got $count"
msg=$(git -C "$PLAY" log -1 --pretty=%s)
[[ "$msg" == "Add handbook and readme" ]] || fail "bad message: $msg"
git -C "$PLAY" cat-file -e "HEAD:handbook.txt" || fail "missing handbook.txt"
git -C "$PLAY" cat-file -e "HEAD:README.md" || fail "missing README.md"
[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "working tree not clean"
echo "OK"
