# Challenge 13 — Detached HEAD

**Level:** Recovery · **Skills:** detached HEAD, create branch

## Story

You checked out an old commit to inspect it, then made a new commit while detached. That work is easy to lose. Preserve it on branch `rescue/detached` and return to `main`.

## Goals

1. Branch `rescue/detached` exists and contains file `discovery.txt` with `found-it`.
2. You are on `main` (not detached).
3. Working tree clean.

## Setup

```bash
./scripts/start.sh 13
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- If still detached on the new commit: `git switch -c rescue/detached`
- Then `git switch main`

</details>

## Verify

```bash
./scripts/verify.sh 13
```
