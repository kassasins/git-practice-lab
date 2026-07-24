# Challenge 07 — Cherry-pick

**Level:** Branching · **Skills:** cherry-pick

## Story

Hotfix commit exists only on `hotfix/typo`. `main` needs that **one** commit — not the whole branch merge.

## Goals

1. `main` contains the fixed text in `banner.txt`: `Welcome aboard`
2. `main` did **not** merge `hotfix/typo` as a merge commit for this fix (cherry-pick only).
3. Working tree clean; you are on `main`.

## Setup

```bash
./scripts/start.sh 07
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- Find the fix: `git log hotfix/typo --oneline`
- `git switch main`
- `git cherry-pick <sha>`

</details>

## Verify

```bash
./scripts/verify.sh 07
```
