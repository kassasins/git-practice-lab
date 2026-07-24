#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

[[ -f "$PLAY/.gitattributes" ]] || fail "missing .gitattributes"
grep -Eq '\*\.csv[[:space:]]+text[[:space:]]+eol=lf' "$PLAY/.gitattributes" || fail ".gitattributes missing *.csv text eol=lf"
[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "working tree not clean"
msg=$(git -C "$PLAY" log -1 --pretty=%s)
[[ "$msg" == "Normalize CSV line endings" ]] || fail "bad message: $msg"
echo "OK"
