#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

git -C "$PLAY" show-ref --verify --quiet refs/heads/feature/greeting || fail "missing feature/greeting"
git -C "$PLAY" rev-parse --abbrev-ref HEAD | grep -qx main || fail "must be on main"
[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "working tree not clean"
content=$(git -C "$PLAY" show HEAD:greeting.txt | tr -d '\r')
[[ "$content" == "Hello, Git Practice Lab" ]] || fail "greeting.txt content wrong: $content"
parents=$(git -C "$PLAY" rev-list --parents -n 1 HEAD | awk '{print NF-1}')
[[ "$parents" == "2" ]] || fail "HEAD should be a merge commit (2 parents)"
echo "OK"
