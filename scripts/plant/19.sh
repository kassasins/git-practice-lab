#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
source "$(dirname "$0")/_common.sh"
init_playground_repo

printf 'ALLOWED=0\n' > "$PLAY/policy.env"
printf 'work\n' > "$PLAY/change.txt"
git -C "$PLAY" add policy.env change.txt
git -C "$PLAY" commit -m "Seed"

# install rejecting hook
mkdir -p "$PLAY/.git/hooks"
cat > "$PLAY/.git/hooks/pre-commit" <<'EOF'
#!/usr/bin/env bash
if ! grep -qx 'ALLOWED=1' policy.env 2>/dev/null; then
  echo "pre-commit: policy.env must contain ALLOWED=1" >&2
  exit 1
fi
exit 0
EOF
chmod +x "$PLAY/.git/hooks/pre-commit"

printf 'more work\n' > "$PLAY/change.txt"
# leave uncommitted — student must fix policy and commit
