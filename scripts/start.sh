#!/usr/bin/env bash
# Start a challenge: reset playground and plant scenario NN
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
NUM="${1:-}"

if [[ -z "$NUM" ]]; then
  echo "Usage: ./scripts/start.sh <nn>"
  echo "Example: ./scripts/start.sh 01"
  exit 1
fi

# Normalize to two digits if user passed 1
if [[ "$NUM" =~ ^[0-9]$ ]]; then
  NUM="0${NUM}"
fi

PLANT="$ROOT/scripts/plant/${NUM}.sh"
if [[ ! -f "$PLANT" ]]; then
  echo "No plant script for challenge ${NUM}: $PLANT"
  exit 1
fi

# Map number -> challenge doc (best-effort message)
DOC=$(find "$ROOT/challenges" -name "${NUM}-*.md" | head -n 1 || true)

# Reset playground (Windows-safe: rename if delete is locked)
reset_dir() {
  local d="$1"
  if [[ ! -e "$d" ]]; then
    return 0
  fi
  if rm -rf "$d" 2>/dev/null; then
    return 0
  fi
  local trash="${d}.trash.$$"
  mv "$d" "$trash" 2>/dev/null || true
  rm -rf "$trash" 2>/dev/null || rm -rf "$trash" &
}

reset_dir "$ROOT/playground"
reset_dir "$ROOT/wt-hotfix"
reset_dir "$ROOT/remote.git"
mkdir -p "$ROOT/playground"

echo "Planting challenge ${NUM}..."
bash "$PLANT"
echo
echo "Ready. Open the mission brief:"
if [[ -n "${DOC:-}" ]]; then
  echo "  ${DOC#$ROOT/}"
else
  echo "  challenges/**/${NUM}-*.md"
fi
echo
echo "Then:"
echo "  cd playground"
echo "  # solve with git ..."
echo "  cd .."
echo "  ./scripts/verify.sh ${NUM}"
