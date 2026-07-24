# Challenge 10 — Diverged history

**Level:** Remotes · **Skills:** pull --rebase / merge divergent branches

## Story

Local `main` and `origin/main` have **diverged** — each has a unique commit. Integrate remote changes and publish a reconciled history. Prefer a **rebase** workflow so history stays linear unless you intentionally merge.

## Goals

1. Local `main` and `origin/main` point at the **same** commit.
2. That history contains **both** unique changes: file `local-only.txt` and file `remote-only.txt`.
3. Working tree clean; `main` tracks `origin/main`.

## Setup

```bash
./scripts/start.sh 10
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- `git fetch origin`
- `git rebase origin/main` (or `git pull --rebase`)
- Resolve conflicts if any, then `git push origin main`

</details>

## Verify

```bash
./scripts/verify.sh 10
```
