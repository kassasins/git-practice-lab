#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

msg=$(git -C "$PLAY" log -1 --pretty=%s)
[[ "$msg" == "Save keep-me improvements" ]] || fail "bad message: $msg"
content=$(git -C "$PLAY" show HEAD:keep-me.txt)
echo "$content" | grep -q 'improved line' || fail "keep-me.txt missing improvements in commit"
accident=$(git -C "$PLAY" show HEAD:accident.txt)
[[ "$accident" == "good content" ]] || fail "accident.txt should remain original in HEAD"
if git -C "$PLAY" cat-file -e "HEAD:scratch.tmp" 2>/dev/null; then
  fail "scratch.tmp should not be in the commit"
fi
# accident worktree clean vs HEAD
diff -q <(git -C "$PLAY" show HEAD:accident.txt) "$PLAY/accident.txt" >/dev/null || fail "accident.txt worktree dirty"
staged=$(git -C "$PLAY" diff --cached --name-only)
[[ -z "$staged" ]] || fail "index still has staged files"
echo "OK"
