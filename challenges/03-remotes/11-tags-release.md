# Challenge 11 — Tags and a release

**Level:** Remotes · **Skills:** annotated tags

## Story

Release `v1.0.0` must point at the commit that introduced `app/version.txt` with content `1.0.0`. Someone created a lightweight tag on the wrong commit. Fix it with an **annotated** tag.

## Goals

1. Annotated tag `v1.0.0` exists.
2. It points at the commit whose `app/version.txt` is exactly `1.0.0`.
3. Tag message is exactly: `Release 1.0.0`
4. Working tree clean.

## Setup

```bash
./scripts/start.sh 11
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- Delete wrong tag: `git tag -d v1.0.0`
- Find correct commit: `git log --oneline -- app/version.txt`
- `git tag -a v1.0.0 <sha> -m "Release 1.0.0"`

</details>

## Verify

```bash
./scripts/verify.sh 11
```
