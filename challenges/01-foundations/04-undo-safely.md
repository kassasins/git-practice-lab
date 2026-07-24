# Challenge 04 — Undo safely

**Level:** Foundations · **Skills:** restore, unstage, keep wanted work

## Story

The workspace is messy on purpose:

- `keep-me.txt` has good edits that should become a commit.
- `scratch.tmp` was staged by accident — unstage it (file may remain).
- `accident.txt` has bad unstaged edits — discard them back to HEAD.

Then make **one** clean commit with only the good work.

## Goals

1. `keep-me.txt` changes are committed.
2. `accident.txt` matches HEAD (bad edits discarded).
3. `scratch.tmp` is **not** in the new commit (untracked or ignored is fine).
4. Latest commit message is exactly: `Save keep-me improvements`
5. Working tree has no staged changes; `accident.txt` is clean.

## Setup

```bash
./scripts/start.sh 04
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- Unstage: `git restore --staged scratch.tmp`
- Discard worktree edits: `git restore accident.txt`
- Stage and commit only `keep-me.txt`.

</details>

## Verify

```bash
./scripts/verify.sh 04
```
