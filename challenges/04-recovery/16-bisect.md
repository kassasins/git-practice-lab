# Challenge 16 — Bisect the bad commit

**Level:** Recovery · **Skills:** bisect

## Story

Somewhere after the first commit, `service.txt` became `BROKEN`. Use `git bisect` to find the first bad commit, create branch `bug/first-bad` at that commit, then end the bisect and return to `main`.

## Goals

1. No bisect in progress.
2. You are on `main`.
3. Branch `bug/first-bad` points at the first commit where `service.txt` is `BROKEN`.
4. Working tree clean.

## Setup

```bash
./scripts/start.sh 16
cd playground
```

## Helper

A script is available inside playground:

```bash
./check.sh   # exit 0 if GOOD, 1 if BROKEN
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- `git bisect start`
- `git bisect bad` (current tip is bad)
- `git bisect good <first-commit-sha>`
- Run `./check.sh` each step, mark good/bad
- When found: `git branch bug/first-bad`
- `git bisect reset`

</details>

## Verify

```bash
./scripts/verify.sh 16
```
