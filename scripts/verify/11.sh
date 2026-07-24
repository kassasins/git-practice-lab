#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

# annotated tag
type=$(git -C "$PLAY" cat-file -t v1.0.0 2>/dev/null || true)
[[ "$type" == "tag" ]] || fail "v1.0.0 must be an annotated tag (got: ${type:-missing})"
msg=$(git -C "$PLAY" tag -l --format='%(contents:subject)' v1.0.0)
[[ "$msg" == "Release 1.0.0" ]] || fail "bad tag message: $msg"
target=$(git -C "$PLAY" rev-parse 'v1.0.0^{commit}')
ver=$(git -C "$PLAY" show "${target}:app/version.txt" | tr -d '\r')
[[ "$ver" == "1.0.0" ]] || fail "tag points at wrong version: $ver"
[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "working tree not clean"
echo "OK"
