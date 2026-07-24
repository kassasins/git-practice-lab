#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
source "$(dirname "$0")/_common.sh"
init_playground_repo

printf 'GOOD\n' > "$PLAY/service.txt"
git -C "$PLAY" add service.txt
git -C "$PLAY" commit -m "Good start"

for i in 1 2 3; do
  printf 'GOOD\n' > "$PLAY/service.txt"
  echo "change $i" >> "$PLAY/extra.log"
  git -C "$PLAY" add service.txt extra.log
  git -C "$PLAY" commit -m "Still good $i"
done

printf 'BROKEN\n' > "$PLAY/service.txt"
git -C "$PLAY" add service.txt
git -C "$PLAY" commit -m "Introduce breakage"

for i in 1 2; do
  echo "later $i" >> "$PLAY/extra.log"
  git -C "$PLAY" add extra.log
  git -C "$PLAY" commit -m "Later commit $i"
done

cat > "$PLAY/check.sh" <<'EOF'
#!/usr/bin/env bash
if grep -qx 'BROKEN' service.txt 2>/dev/null; then
  exit 1
fi
exit 0
EOF
chmod +x "$PLAY/check.sh"
