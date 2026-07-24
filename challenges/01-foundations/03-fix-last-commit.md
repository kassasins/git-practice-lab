# Challenge 03 — Fix the last commit

**Level:** Foundations · **Skills:** amend, staged changes

## Story

You just committed, then noticed two problems: the message is wrong, and you forgot to include `README.md`. The commit has **not** been pushed. Fix the last commit in place.

## Goals

1. Still **one** commit on `main` (do not add a second commit).
2. Commit message is exactly: `Add handbook and readme`
3. `handbook.txt` and `README.md` are both in that commit.
4. Working tree is clean.

## Setup

```bash
./scripts/start.sh 03
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- Stage the missing file: `git add README.md`
- Rewrite the tip commit: `git commit --amend -m "Add handbook and readme"`
- Only amend when the commit is yours and not shared yet.

</details>

## Verify

```bash
./scripts/verify.sh 03
```
