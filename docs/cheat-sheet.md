# Cheat sheet

## Everyday

```bash
git status
git log --oneline --graph --all -20
git diff
git diff --staged
git add <file>
git add -p                  # stage hunks
git commit -m "message"
git restore <file>          # discard worktree changes
git restore --staged <file> # unstage
```

## Branches

```bash
git branch
git switch <name>
git switch -c <new-branch>
git merge <branch>
git rebase <branch>
git cherry-pick <sha>
```

## Undo (choose carefully)

```bash
git commit --amend          # only if not pushed / ok to rewrite
git reset --soft HEAD~1     # undo commit, keep staged
git reset HEAD~1            # undo commit, keep in worktree
git revert <sha>            # new commit that undoes an old one (safe for shared history)
```

## Remotes

```bash
git remote -v
git fetch origin
git pull --rebase origin main
git push -u origin HEAD
git push origin <tag>
```

## Recovery

```bash
git reflog
git stash list
git stash pop
git bisect start
git bisect bad
git bisect good <sha>
```

## Inspection

```bash
git show <sha>
git cat-file -t <sha>
git ls-files -u             # unmerged (conflict) entries
```
