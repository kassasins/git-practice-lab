#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

git -C "$PLAY" rev-parse --abbrev-ref HEAD | grep -qx main || fail "must be on main"
[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "working tree not clean"
count=$(git -C "$PLAY" rev-list --count HEAD)
[[ "$count" == "1" ]] || fail "expected exactly 1 commit, got $count"
msg=$(git -C "$PLAY" log -1 --pretty=%s)
[[ "$msg" == "Initial project notes" ]] || fail "bad message: $msg"
git -C "$PLAY" cat-file -e "HEAD:notes/welcome.txt" || fail "missing welcome.txt"
git -C "$PLAY" cat-file -e "HEAD:notes/todo.txt" || fail "missing todo.txt"
echo "OK"
