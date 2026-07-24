# Challenge 18 — Line endings trap

**Level:** Advanced · **Skills:** gitattributes, line endings

## Story

`data/record.csv` always looks modified because of CRLF/LF mismatch. Add a `.gitattributes` rule so CSV files use `lf`, normalize the file, and get a clean status.

## Goals

1. `.gitattributes` contains a rule for `*.csv` with `text eol=lf`.
2. `git status` is clean.
3. Changes are committed with message exactly: `Normalize CSV line endings`

## Setup

```bash
./scripts/start.sh 18
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- Create `.gitattributes` with `*.csv text eol=lf`
- `git add --renormalize .`
- Commit

</details>

## Verify

```bash
./scripts/verify.sh 18
```
