# Challenge 17 — Linked worktree

**Level:** Advanced · **Skills:** worktree

## Story

A linked worktree was added for branch `hotfix/urgent` but the metadata is confusing / the branch tip lacks the fix. Ensure worktree list shows a worktree for `hotfix/urgent`, and that branch contains `urgent.txt` with `patched`.

## Goals

1. `git worktree list` shows a worktree (besides main) using branch `hotfix/urgent`.
2. `hotfix/urgent` has `urgent.txt` content `patched`.
3. Primary playground checkout is clean.

## Setup

```bash
./scripts/start.sh 17
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- `git worktree list`
- `git worktree add ../wt-hotfix hotfix/urgent` (create branch if needed)
- Commit the patch on that branch from the linked worktree or from playground after switching carefully

</details>

## Verify

```bash
./scripts/verify.sh 17
```
