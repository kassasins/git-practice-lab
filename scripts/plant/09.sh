#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
source "$(dirname "$0")/_common.sh"
init_playground_repo

# bare remote
rm -rf "$ROOT/remote.git"
git init --bare -b main "$ROOT/remote.git"

printf 'hello remote world\n' > "$PLAY/hello.txt"
git -C "$PLAY" add hello.txt
git -C "$PLAY" commit -m "Local commit to publish"

# origin not added yet — student adds and pushes
# seed remote with empty? leave empty so first push works
