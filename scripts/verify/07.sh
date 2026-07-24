#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

git -C "$PLAY" rev-parse --abbrev-ref HEAD | grep -qx main || fail "must be on main"
[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "working tree not clean"
content=$(git -C "$PLAY" show HEAD:banner.txt | tr -d '\r')
[[ "$content" == "Welcome aboard" ]] || fail "banner.txt not fixed"
# should not have merged hotfix (no merge commit required); extra.txt should NOT be on main
if git -C "$PLAY" cat-file -e "HEAD:extra.txt" 2>/dev/null; then
  fail "extra.txt from hotfix branch should not be on main (use cherry-pick of typo fix only)"
fi
echo "OK"
