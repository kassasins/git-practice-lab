#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"
fail() { echo "FAIL: $*"; exit 1; }

[[ "$(git -C "$PLAY" status --porcelain)" == "" ]] || fail "working tree not clean"
main=$(git -C "$PLAY" rev-parse main)
origin=$(git -C "$PLAY" rev-parse origin/main)
[[ "$main" == "$origin" ]] || fail "main must match origin/main"
git -C "$PLAY" show-ref --verify --quiet refs/heads/feature/login || fail "missing feature/login"
content=$(git -C "$PLAY" show feature/login:login.txt | tr -d '\r')
[[ "$content" == "oauth-ready" ]] || fail "feature/login missing login.txt content"
remote_feat=$(git -C "$PLAY" rev-parse origin/feature/login 2>/dev/null || true)
feat=$(git -C "$PLAY" rev-parse feature/login)
[[ "$remote_feat" == "$feat" ]] || fail "feature/login not pushed to origin"
echo "OK"
