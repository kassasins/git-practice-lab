# Challenge 19 — Hook rejection loop

**Level:** Advanced · **Skills:** hooks

## Story

`pre-commit` rejects every commit because it expects `ALLOWED=1` in file `policy.env`. The hook itself should stay enabled. Satisfy the policy and create the required commit.

## Goals

1. Latest commit message is exactly: `Policy compliant change`
2. `policy.env` contains `ALLOWED=1`
3. Hook file `.git/hooks/pre-commit` still exists and is executable (or has a shebang runner on Windows).
4. Working tree clean.

## Setup

```bash
./scripts/start.sh 19
cd playground
```

## Hints (optional)

<details>
<summary>Click if stuck</summary>

- Read `.git/hooks/pre-commit` to learn the rule.
- Fix `policy.env`, then commit with the required message.
- Do not delete the hook permanently.

</details>

## Verify

```bash
./scripts/verify.sh 19
```
