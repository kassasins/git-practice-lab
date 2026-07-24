#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

bad=$(git -C "$PLAY" for-each-ref --format='%(refname)' | grep -E '^refs/(backup|original)/' || true)
[[ -z "$bad" ]] || fail "forbidden refs still present: $bad"
git -C "$PLAY" show-ref --verify --quiet refs/heads/main || fail "main missing"
git -C "$PLAY" show-ref --verify --quiet refs/tags/v-ok || fail "tag v-ok missing"
[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "working tree not clean"
echo "OK"
