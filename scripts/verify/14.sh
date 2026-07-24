#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

git -C "$PLAY" show-ref --verify --quiet refs/heads/recovery/important || fail "missing recovery/important"
content=$(git -C "$PLAY" show recovery/important:important.dat | tr -d '\r')
[[ "$content" == "treasure" ]] || fail "important.dat content wrong"
branch=$(git -C "$PLAY" symbolic-ref -q --short HEAD || true)
[[ -n "$branch" ]] || fail "detached HEAD not allowed"
[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "working tree not clean"
echo "OK"
