# Challenge 01 — First commit

**Level:** Foundations · **Skills:** `status`, `add`, `commit`, `log`

## Story

You joined a tiny ops notes repo. Someone dropped files into the folder but never made a first commit. Your job is to create a clean initial commit.

## Goals

1. Working tree is clean (`git status` shows nothing to commit).
2. There is **exactly one** commit on `main`.
3. That commit contains both `notes/welcome.txt` and `notes/todo.txt`.
4. Commit message is exactly: `Initial project notes`

## Setup

```bash
./scripts/start.sh 01
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- `git status` tells you what is untracked.
- `git add notes/` stages the folder.
- `git commit -m "Initial project notes"` creates the snapshot.
- Confirm with `git log --oneline` and `git ls-tree -r HEAD --name-only`.

</details>

## Verify

```bash
./scripts/verify.sh 01
```
