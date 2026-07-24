#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

[[ -f "$PLAY/.git/hooks/pre-commit" ]] || fail "pre-commit hook missing"
grep -qx 'ALLOWED=1' "$PLAY/policy.env" || fail "policy.env must contain ALLOWED=1"
msg=$(git -C "$PLAY" log -1 --pretty=%s)
[[ "$msg" == "Policy compliant change" ]] || fail "bad message: $msg"
[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "working tree not clean"
echo "OK"
