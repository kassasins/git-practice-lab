# Challenge 14 — Lost commit (reflog)

**Level:** Recovery · **Skills:** reflog, branch restore

## Story

A hard reset dropped an important commit from `main`. The commit is no longer reachable from any branch tip — but the reflog still knows. Recover it onto branch `recovery/important`.

## Goals

1. Branch `recovery/important` points at the recovered commit.
2. That commit contains `important.dat` with content `treasure`.
3. `main` may stay at the reset position.
4. Working tree clean; not detached.

## Setup

```bash
./scripts/start.sh 14
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- `git reflog`
- Find the commit before the reset that added `important.dat`.
- `git branch recovery/important <sha>`

</details>

## Verify

```bash
./scripts/verify.sh 14
```
