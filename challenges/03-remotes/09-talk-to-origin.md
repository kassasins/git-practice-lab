# Challenge 09 — Talk to origin

**Level:** Remotes · **Skills:** remote, fetch, push

## Story

You have a local repo and a bare remote at `../remote.git` (simulates GitHub). Local `main` has a commit the remote does not. Publish it and set upstream tracking.

## Goals

1. Remote named `origin` points at `../remote.git` (relative is fine as stored).
2. `main` tracks `origin/main`.
3. Remote `main` has the same tip commit as local `main`.
4. Working tree clean.

## Setup

```bash
./scripts/start.sh 09
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- `git remote add origin ../remote.git` (path may already exist — check `git remote -v`)
- `git push -u origin main`

</details>

## Verify

```bash
./scripts/verify.sh 09
```
