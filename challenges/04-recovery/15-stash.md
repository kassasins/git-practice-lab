# Challenge 15 — Stash debt

**Level:** Recovery · **Skills:** stash

## Story

There is a stash with needed work. Applying it will conflict with the current `notes.txt`. Resolve the conflict, keep **both** ideas, and clear the stash list when done.

## Goals

1. `notes.txt` contains both lines (order matters):

```text
stable line
stashed idea
```

2. No merge/stash conflict state left open.
3. `git stash list` is empty.
4. Working tree clean (commit the result with message exactly: `Apply stashed idea`).

## Setup

```bash
./scripts/start.sh 15
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- `git stash pop` (or `apply` then `drop`)
- Fix conflict markers in `notes.txt`
- Commit, ensure stash list empty

</details>

## Verify

```bash
./scripts/verify.sh 15
```
