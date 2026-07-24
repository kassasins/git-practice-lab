# Challenge 08 — Rebase onto main

**Level:** Branching · **Skills:** rebase

## Story

`feature/docs` was started from an old `main`. Meanwhile `main` moved forward. Rebuild the feature branch so it sits **on top of** the latest `main` (linear history, no merge commit on the feature branch).

## Goals

1. `feature/docs` is based on current `main` (first parent ancestry includes latest main tip before your feature commits).
2. Feature commit that adds `docs/guide.txt` is still present.
3. No merge commit on `feature/docs`.
4. Working tree clean.

## Setup

```bash
./scripts/start.sh 08
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- `git switch feature/docs`
- `git rebase main`
- If conflicts appear, fix, `git add`, `git rebase --continue`

</details>

## Verify

```bash
./scripts/verify.sh 08
```
