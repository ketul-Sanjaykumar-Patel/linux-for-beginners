# Git Cheatsheet

## Setup (One Time)
```bashgit config --global user.name "Your Name"
git config --global user.email "you@email.com"
git config --global init.defaultBranch main

## Starting a Repo
```bashgit init                            # New repo in current folder
git clone git@github.com/user/repo  # Clone existing repo

## Daily Workflow
```bashgit status                          # What changed?
git add file.txt                    # Stage one file
git add .                           # Stage everything
git commit -m "feat: add feature"   # Save locally
git push                            # Upload to GitHub
git pull                            # Download from GitHub

## Branches
```bashgit branch                          # List branches
git branch feature-x                # Create branch
git checkout feature-x              # Switch to branch
git checkout -b feature-x           # Create + switch
git merge feature-x                 # Merge into current
git branch -d feature-x             # Delete branch
git push origin feature-x           # Push branch to GitHub

## Viewing History
```bashgit log                             # Full history
git log --oneline                   # Compact history
git log --oneline --graph           # Visual branch graph
git diff                            # Unstaged changes
git diff --staged                   # Staged changes
git show abc1234                    # Show a commit

## Undoing Things
```bashgit restore file.txt                # Undo unsaved changes
git restore --staged file.txt       # Unstage a file
git reset --soft HEAD~1             # Undo last commit, keep changes
git reset --hard HEAD~1             # Undo last commit, lose changes
git revert abc1234                  # Safely undo a past commit

## Tags & Releases
```bashgit tag v1.0.0                          # Create tag
git tag -a v1.0.0 -m "Release 1.0.0"   # Annotated tag
git push origin v1.0.0                  # Push tag
git push origin --tags                  # Push all tags

## Commit Message Format
```bashfeat:     # New feature
fix:      # Bug fix
docs:     # Documentation only
style:    # Formatting, no logic change
refactor: # Code restructure
test:     # Adding tests
chore:    # Build process, dependenciesExamples:
git commit -m "feat: add user login"
git commit -m "fix: resolve memory leak"
git commit -m "docs: update README"

## The 3 Commands You Use Every Day
```bashgit add .
git commit -m "your message"
git push
