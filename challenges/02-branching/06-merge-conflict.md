# Challenge 06 — Merge conflict

**Level:** Branching · **Skills:** merge, conflict resolution

## Story

A merge was started between `main` and `feature/colors` and left unfinished. Conflict markers are still in `theme.txt`. Finish the merge with a sensible resolved file.

## Goals

1. No merge in progress (`MERGE_HEAD` gone).
2. Working tree clean.
3. `theme.txt` on `main` contains **both** colors on separate lines, exactly:

```text
blue
green
```

4. Latest commit on `main` is a merge commit.

## Setup

```bash
./scripts/start.sh 06
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- Open `theme.txt`, remove conflict markers, keep both lines.
- `git add theme.txt`
- `git commit` (default merge message is fine)

</details>

## Verify

```bash
./scripts/verify.sh 06
```
