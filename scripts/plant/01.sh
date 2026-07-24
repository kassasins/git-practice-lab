#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
# shellcheck source=_common.sh
source "$(dirname "$0")/_common.sh"
init_playground_repo
mkdir -p "$PLAY/notes"
printf 'Welcome to the lab.\n' > "$PLAY/notes/welcome.txt"
printf '%s\n' '- learn status' '- learn commit' > "$PLAY/notes/todo.txt"
# intentionally no commit
