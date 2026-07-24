# Challenge 20 — Ref cleanup

**Level:** Advanced · **Skills:** refs, for-each-ref

## Story

Policy forbids leftover refs under `refs/backup/` and `refs/original/`. They pollute the repo. Delete the forbidden refs; keep `main` and tag `v-ok`.

## Goals

1. No refs under `refs/backup/` or `refs/original/`.
2. `main` still exists.
3. Tag `v-ok` still exists.
4. Working tree clean.

## Setup

```bash
./scripts/start.sh 20
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- List: `git for-each-ref`
- Delete: `git update-ref -d refs/backup/...` or `git tag -d` / `git branch -D` as appropriate
- Backup refs are often deleted with `git update-ref -d <refname>`

</details>

## Verify

```bash
./scripts/verify.sh 20
```
