#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

git -C "$PLAY" show-ref --verify --quiet refs/heads/rescue/detached || fail "missing rescue/detached"
content=$(git -C "$PLAY" show rescue/detached:discovery.txt | tr -d '\r')
[[ "$content" == "found-it" ]] || fail "discovery.txt missing on rescue/detached"
branch=$(git -C "$PLAY" symbolic-ref -q --short HEAD || true)
[[ "$branch" == "main" ]] || fail "must be on main (not detached); got: ${branch:-detached}"
[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "working tree not clean"
echo "OK"
