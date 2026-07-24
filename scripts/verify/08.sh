#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "working tree not clean"
git -C "$PLAY" show-ref --verify --quiet refs/heads/feature/docs || fail "missing feature/docs"
git -C "$PLAY" cat-file -e "feature/docs:docs/guide.txt" || fail "guide missing on feature/docs"

main=$(git -C "$PLAY" rev-parse main)
# feature/docs should contain main as ancestor
git -C "$PLAY" merge-base --is-ancestor "$main" feature/docs || fail "feature/docs is not based on latest main"

# no merge commits on feature branch after main
if git -C "$PLAY" rev-list --merges "${main}..feature/docs" | grep -q .; then
  fail "feature/docs should not contain merge commits (rebase instead)"
fi
echo "OK"
