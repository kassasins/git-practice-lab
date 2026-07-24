#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

[[ ! -f "$PLAY/.git/MERGE_HEAD" ]] || fail "merge still in progress"
[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "working tree not clean"
content=$(git -C "$PLAY" show HEAD:theme.txt | tr -d '\r')
expected=$'blue\ngreen'
[[ "$content" == "$expected" ]] || fail "theme.txt should be exactly blue then green"
parents=$(git -C "$PLAY" rev-list --parents -n 1 HEAD | awk '{print NF-1}')
[[ "$parents" == "2" ]] || fail "HEAD should be a merge commit"
echo "OK"
