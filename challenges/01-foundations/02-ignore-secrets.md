# Challenge 02 — Ignore secrets

**Level:** Foundations · **Skills:** `.gitignore`, untrack without deleting

## Story

A teammate committed `secrets.env` by mistake. Local config must stay on disk but must **not** be in Git anymore. Future secret files matching `*.env` should be ignored.

## Goals

1. `secrets.env` is **not** tracked by Git (not in HEAD).
2. The file still exists on disk in the playground.
3. A root `.gitignore` ignores `*.env`.
4. Working tree is clean.
5. Latest commit message is exactly: `Stop tracking local env secrets`

## Setup

```bash
./scripts/start.sh 02
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- Add `*.env` to `.gitignore`.
- `git rm --cached secrets.env` untracks without deleting the file.
- Commit the ignore + index change together.

</details>

## Verify

```bash
./scripts/verify.sh 02
```
