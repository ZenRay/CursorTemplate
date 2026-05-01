---
description: Clean up Git repository - squash commits, remove large files, optimize history
---

# /git-cleanup — Git Repository Cleanup

Clean up and optimize Git repository.

## Cleanup Tasks

### Commit History
- Identify fixup commits
- Find WIP/debug commits
- Detect merge commits that could be linear
- Suggest squash opportunities

### Large Files
- Find files >100KB in history
- Identify binaries that shouldn't be tracked
- Detect accidentally committed secrets

### Branches
- List stale branches (>30 days old)
- Identify merged branches for deletion
- Find branches with no commits ahead of main

### Repository Size
- Check .git directory size
- Identify bloat causes
- Suggest garbage collection

## Steps

1. **Analyze Repository**
   ```bash
   # Repository size
   du -sh .git
   
   # Large files in history
   git rev-list --objects --all | git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(restpath)' | awk '$1 == "blob" && $3 > 100000 {print $3, $4}' | sort -rn | head -20
   
   # Stale branches
   git branch -a --merged main | grep -v main
   
   # Commit stats
   git shortlog -sn --all
   ```

2. **Generate Report**
   ```markdown
   ## Git Cleanup Report

   ### Repository Size: [X]MB
   (Healthy if < 100MB)

   ### Large Files in History
   | Size | File | Commit |
   |------|------|--------|
   | 5MB | data/backup.sql | abc123 |

   ### Stale Branches (30+ days)
   - [ ] `feat/old-feature` - Last commit: 2024-01-01

   ### Cleanup Recommendations
   1. **High Priority**:
      - [Action]: [Reason]
   
   2. **Medium Priority**:
      - [Action]: [Reason]
   ```

3. **Safe Cleanup**
   ```bash
   # Garbage collect
   git gc --aggressive
   
   # Prune remote tracking
   git remote prune origin
   
   # Delete local merged branches
   git branch --merged main | grep -v main | xargs git branch -d
   ```

4. **History Rewriting** (if needed, with warning)
   - Use `git-filter-repo` for large file removal
   - Requires coordination with team
   - Changes commit hashes

## Safety Warnings
⚠️ **Never rewrite history on shared branches without team coordination**

## When to Run
- Monthly maintenance
- Before repository migration
- When clone is slow
- Storage quota issues
