#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "working tree not clean"
msg=$(git -C "$PLAY" log -1 --pretty=%s)
[[ "$msg" == "Apply stashed idea" ]] || fail "bad commit message: $msg"
content=$(git -C "$PLAY" show HEAD:notes.txt | tr -d '\r')
expected=$'stable line\nstashed idea'
[[ "$content" == "$expected" ]] || fail "notes.txt content incorrect"
stash=$(git -C "$PLAY" stash list)
[[ -z "$stash" ]] || fail "stash list must be empty"
[[ ! -f "$PLAY/.git/MERGE_HEAD" ]] || fail "merge still open"
echo "OK"
