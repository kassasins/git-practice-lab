# Git concepts (short)

## Snapshot model

Git stores **snapshots** (commits), not file diffs as the main unit. Each commit points to a tree of files and to parent commit(s).

## Three areas

| Area | What it is | Common commands |
|------|------------|-----------------|
| Working tree | Files you edit | edit files |
| Index (staging) | Next commit draft | `git add`, `git restore --staged` |
| HEAD commit | Last committed snapshot | `git commit`, `git show` |

## Branches are pointers

A branch name is a movable label on a commit. `main` is not special to Git — teams just agree to treat it as the default line.

## HEAD

`HEAD` is “where you are.” Normally it points at a branch. **Detached HEAD** means it points at a commit directly — new commits can be easy to lose if you switch away without a branch.

## Remotes

`origin` is a conventional nickname for the server copy. `git fetch` downloads; `git pull` fetches then integrates; `git push` uploads your commits.

## Reflog

Your personal diary of where HEAD moved. Great for recovery: `git reflog`. Not shared with remotes by default.

## When things feel stuck

Run these three:

```bash
git status
git log --oneline --graph --all -20
git branch -vv
```

Most “mysteries” become obvious from those outputs.
