# Challenge 12 — Collaboration simulation

**Level:** Remotes · **Skills:** branch hygiene for PRs

## Story

You finished work on `feature/login`, but commits landed on `main` by mistake. Move the feature commits onto `feature/login`, reset `main` back to match `origin/main`, and push the feature branch.

## Goals

1. `main` matches `origin/main` (same tip).
2. `feature/login` contains `login.txt` with `oauth-ready`.
3. `feature/login` is pushed to `origin`.
4. Working tree clean.

## Setup

```bash
./scripts/start.sh 12
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- Create/update `feature/login` pointing at the commit(s) with the login work.
- Reset `main` to `origin/main` (`git reset --hard origin/main` while on main — careful, only here).
- `git push -u origin feature/login`

</details>

## Verify

```bash
./scripts/verify.sh 12
```
