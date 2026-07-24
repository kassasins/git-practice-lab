#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

[[ -f "$PLAY/secrets.env" ]] || fail "secrets.env must remain on disk"
if git -C "$PLAY" cat-file -e "HEAD:secrets.env" 2>/dev/null; then
  fail "secrets.env still tracked in HEAD"
fi
[[ -f "$PLAY/.gitignore" ]] || fail "missing .gitignore"
grep -q '\*\.env' "$PLAY/.gitignore" || fail ".gitignore must ignore *.env"
[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "working tree not clean"
msg=$(git -C "$PLAY" log -1 --pretty=%s)
[[ "$msg" == "Stop tracking local env secrets" ]] || fail "bad message: $msg"
echo "OK"
