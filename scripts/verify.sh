#!/usr/bin/env bash
# Verify challenge NN
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
NUM="${1:-}"

if [[ -z "$NUM" ]]; then
  echo "Usage: ./scripts/verify.sh <nn>"
  exit 1
fi

if [[ "$NUM" =~ ^[0-9]$ ]]; then
  NUM="0${NUM}"
fi

VERIFY="$ROOT/scripts/verify/${NUM}.sh"
if [[ ! -f "$VERIFY" ]]; then
  echo "No verify script for challenge ${NUM}"
  exit 1
fi

if [[ ! -d "$ROOT/playground/.git" ]]; then
  echo "playground/ is missing. Run: ./scripts/start.sh ${NUM}"
  exit 1
fi

echo "Verifying challenge ${NUM}..."
if bash "$VERIFY"; then
  echo
  echo "✅ Challenge ${NUM} PASSED — mark it in PROGRESS.md and continue!"
  exit 0
else
  echo
  echo "❌ Challenge ${NUM} not complete yet. Re-read the goals and try again."
  echo "   Reset with: ./scripts/start.sh ${NUM}"
  exit 1
fi
