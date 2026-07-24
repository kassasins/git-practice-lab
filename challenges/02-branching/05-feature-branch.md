# Challenge 05 — Feature branch

**Level:** Branching · **Skills:** switch, branch, merge

## Story

`main` is stable. Implement a feature on a branch named `feature/greeting`, then merge it into `main` with a merge commit (no fast-forward).

## Goals

1. Branch `feature/greeting` exists.
2. `main` contains a file `greeting.txt` with the exact line: `Hello, Git Practice Lab`
3. `main` history includes a **merge commit** (two parents) that brought the feature in.
4. You are on `main` with a clean working tree.

## Setup

```bash
./scripts/start.sh 05
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- `git switch -c feature/greeting`
- Commit `greeting.txt` on the feature branch.
- `git switch main` then `git merge --no-ff feature/greeting`

</details>

## Verify

```bash
./scripts/verify.sh 05
```
