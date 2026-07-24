#!/usr/bin/env bash
# Shared helpers for plant scripts
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PLAY="$ROOT/playground"

init_playground_repo() {
  if [[ -e "$PLAY" ]]; then
    if ! rm -rf "$PLAY" 2>/dev/null; then
      local trash="${PLAY}.trash.$$"
      mv "$PLAY" "$trash" 2>/dev/null || true
      rm -rf "$trash" 2>/dev/null || true
    fi
  fi
  mkdir -p "$PLAY"
  git -C "$PLAY" init -b main
  git -C "$PLAY" config user.name "Practice Student"
  git -C "$PLAY" config user.email "student@practice.local"
  # Avoid editor prompts during automated commits in plants
  git -C "$PLAY" config core.editor true
}
