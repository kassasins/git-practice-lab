#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

[[ ! -d "$PLAY/.git/BISECT_LOG" && ! -f "$PLAY/.git/BISECT_START" ]] || fail "bisect still in progress"
branch=$(git -C "$PLAY" symbolic-ref -q --short HEAD || true)
[[ "$branch" == "main" ]] || fail "must be on main"
git -C "$PLAY" show-ref --verify --quiet refs/heads/bug/first-bad || fail "missing bug/first-bad"

# compute first bad: oldest commit where service.txt is BROKEN
first_bad=""
while read -r sha; do
  ver=$(git -C "$PLAY" show "${sha}:service.txt" 2>/dev/null | tr -d '\r' || true)
  if [[ "$ver" == "BROKEN" ]]; then
    first_bad="$sha"
  fi
done < <(git -C "$PLAY" rev-list --reverse main)

[[ -n "$first_bad" ]] || fail "could not determine first bad commit"
got=$(git -C "$PLAY" rev-parse bug/first-bad)
[[ "$got" == "$first_bad" ]] || fail "bug/first-bad points to wrong commit"
[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "working tree not clean"
echo "OK"
