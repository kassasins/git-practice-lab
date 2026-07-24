# Git Practice Lab

Learn Git by fixing **real broken repository situations** — the same kinds of messes teams hit at work.

You do not need prior Git skills. Start at Challenge 01 and move forward. Each challenge plants a broken (or incomplete) repo in `playground/`, gives you a mission, and lets you check your work with a verify script.

## Quick start

### 1. Clone this repo

```bash
git clone git@github.com:kassasins/git-practice-lab.git
cd git-practice-lab
```

On Windows, use **Git Bash** (comes with Git for Windows) for the plant/verify scripts.

### 2. Start Challenge 01

```bash
./scripts/start.sh 01
```

That wipes `playground/` and plants Challenge 01.

### 3. Read the mission

Open:

```text
challenges/01-foundations/01-first-commit.md
```

### 4. Work inside the playground

```bash
cd playground
# run git commands here
```

### 5. Check your solution

```bash
cd ..   # back to repo root
./scripts/verify.sh 01
```

When verify passes, mark it in [`PROGRESS.md`](PROGRESS.md) and go to the next challenge.

## How the lab is organized

| Path | Purpose |
|------|---------|
| `challenges/` | Mission briefs (what to achieve — not always how) |
| `scripts/plant/` | Sets up each broken/incomplete scenario |
| `scripts/verify/` | Checks that your Git state matches the goal |
| `playground/` | Your disposable practice repo (safe to break) |
| `docs/` | Concept notes when you want deeper explanation |
| `PROGRESS.md` | Your checklist |

## Learning path

| Level | Challenges | Skills |
|-------|------------|--------|
| **1 · Foundations** | 01–04 | status, add, commit, log, ignore, undo |
| **2 · Branching** | 05–08 | branches, merge, conflicts, cherry-pick, rebase |
| **3 · Remotes** | 09–12 | clone, push/pull, diverge, tags, PR-style flow |
| **4 · Recovery** | 13–16 | detached HEAD, reflog, stash, bisect |
| **5 · Advanced** | 17–20 | worktrees, attributes, hooks, ref cleanup |

Do them **in order**. Later challenges assume earlier habits.

## Rules of the lab

1. **Only use Git commands** (and light shell) to fix playground state — do not edit plant scripts to “cheat.”
2. **Read `git status` and `git log --oneline --graph --all -20` often.** That is half the skill.
3. **Hints are optional.** Try first; open the Hints section only when stuck.
4. **playground/ is disposable.** Re-run `./scripts/start.sh NN` anytime to reset a challenge.
5. Prefer understanding *why* a command works over memorizing flags.

## Need help?

- Concept notes: [`docs/concepts.md`](docs/concepts.md)
- Command cheat sheet: [`docs/cheat-sheet.md`](docs/cheat-sheet.md)
- Stuck on a challenge? Ask in chat: *“I’m on challenge NN, here’s my `git status`…”*

## Author

Built for progressive, hands-on Git practice under [@kassasins](https://github.com/kassasins).
