---
description: Manage Git worktrees for parallel development, code review, and isolated experimentation
---

# /worktree-manage — Git Worktree Management

Manage Git worktrees for parallel development, code review, and isolated experimentation.

## What is Git Worktree?

Git worktree allows multiple working directories attached to the same repository:
- Each worktree is an independent working directory
- All worktrees share the same `.git` database
- Switch between contexts instantly (no `git checkout`)
- Perfect for parallel development and isolation

## Common Scenarios

### Scenario 1: Hotfix + Feature Development

```
main/                    # Your main development
├── worktree/hotfix/     # Emergency production fix
│   └── Checkout from: main
│   └── Branch: hotfix/payment-fix
│   └── Status: 2 files changed
│
└── worktree/feature/    # New feature (unaffected)
    └── Checkout from: main  
    └── Branch: feature/coupon-system
    └── Status: 15 files changed
```

**Benefit**: Fix production bug without stashing your feature work.

### Scenario 2: Code Review

```
main/
└── worktree/review-pr-456/   # Review colleague's PR
    └── Checkout: pull/456/head
    └── Can run, test, modify
    └── Completely isolated from your work
```

**Benefit**: Full IDE experience reviewing PRs (not just web view).

### Scenario 3: Technical Spikes

```
main/
├── worktree/spike-graphql/   # Experiment with GraphQL
│   └── May fail, easy to discard
│
├── worktree/spike-trpc/      # Compare with tRPC
│   └── Alternative approach
│
└── main/                     # Stable development continues
```

**Benefit**: Try risky refactors without affecting main work.

### Scenario 4: Multi-Version Maintenance

```
main/
├── worktree/v1.x/       # Maintain old version
├── worktree/v2.x/       # Current stable
├── worktree/v3-dev/     # Next major version
└── main/               # Standard development
```

**Benefit**: Support multiple versions simultaneously.

## Commands

### List Worktrees

```
/worktree-manage list
```

Output:
```
## Git Worktrees

| Path | Branch | Status | Last Commit |
|------|--------|--------|-------------|
| main/ | master | ✓ Clean | 2 hours ago |
| worktree/hotfix/ | hotfix/auth | ⚡ 3 changed | 30 min ago |
| worktree/feature/ | feature/api | ✓ Clean | 1 day ago |
| worktree/review/ | pull/123/head | ⚡ Unmerged | 2 hours ago |

Legend: ✓ Clean | ⚡ Uncommitted changes | 🔴 Conflicts
```

### Create Worktree

```
/worktree-manage create [name] [from-branch]

Examples:
/worktree-manage create feature/login
→ Creates: worktree/feature-login/
→ Branch: feature/login (from current)

/worktree-manage create hotfix/payment main
→ Creates: worktree/hotfix-payment/
→ Branch: hotfix/payment (from main)

/worktree-manage create review-pr-123 pull/123/head
→ Creates: worktree/review-pr-123/
→ For reviewing PR #123
```

### Sync Worktree

```
/worktree-manage sync [name]

Pull latest changes from source branch:
/worktree-manage sync feature/login
→ Fetches latest from origin/main
→ Merges into worktree/feature-login/
→ Reports any conflicts
```

### Compare Worktrees

```
/worktree-manage diff [name1] [name2]

Compare two worktrees:
/worktree-manage diff main feature/login
→ Shows file-level differences
→ Shows line-level diff summary
→ Highlights potential conflicts
```

### Move Changes

```
/worktree-manage move [from] [to] [files...]

Move specific files between worktrees:
/worktree-manage move feature/login main src/auth.ts src/login.tsx
→ Copies changes from worktree to main
→ Preserves git history
→ Creates commit in target
```

### Finish Worktree

```
/worktree-manage finish [name] [--merge|--discard]

Complete work on a worktree:

/worktree-manage finish hotfix/payment --merge
→ Creates PR from hotfix/payment
→ After merge: deletes worktree directory
→ Cleans up branch

/worktree-manage finish spike/graphql --discard
→ Deletes worktree directory
→ Deletes spike/graphql branch
→ Preserves any notes in docs/
```

### Clean Up

```
/worktree-manage prune

Remove stale worktrees:
- Lists worktrees not touched in 30 days
- Shows which branches are merged
- Prompts for confirmation before deletion
```

## Best Practices

### Naming Convention

```
worktree/
├── feature-[name]/          # New features
├── hotfix-[description]/     # Production fixes
├── review-[pr-number]/       # Code reviews
├── spike-[technology]/       # Experiments
└── client-[name]/            # Customer customizations
```

### Workflow Integration

**Daily Development**:
```
1. Start day:
   /worktree-manage list
   → See all contexts at a glance

2. Pick up hotfix:
   cd worktree/hotfix-payment/
   → Fix the issue
   /worktree-manage finish hotfix-payment --merge

3. Continue feature:
   cd worktree/feature-coupon/
   → Uninterrupted development
```

**Code Review**:
```
1. New PR to review:
   /worktree-manage create review-456 pull/456/head

2. Review in full IDE:
   cd worktree/review-456/
   → Run tests
   → Check edge cases
   → Add comments

3. Clean up:
   /worktree-manage finish review-456 --discard
```

### VS Code Integration

Open multiple worktrees in separate windows:

```bash
# Window 1: Main development
code main/

# Window 2: Hotfix
code worktree/hotfix-payment/

# Window 3: Review
code worktree/review-456/
```

Each window has:
- Independent extensions
- Separate terminal
- Isolated debugging

### Disk Space Management

```
/worktree-manage size

Shows disk usage:
| Worktree | Size | Last Used |
|----------|------|-----------|
| main/ | 45MB | Current |
| worktree/hotfix/ | 12MB | 2 days ago |
| worktree/spike/ | 38MB | 1 week ago |

Recommendation: /worktree-manage prune
→ Will free ~50MB
```

## Comparison: Worktree vs Stash vs Clone

| Approach | Switch Time | Isolation | Disk Space | Best For |
|----------|-------------|-----------|------------|----------|
| **Worktree** | Instant | Full | Shared .git | Parallel work |
| **Stash** | Medium | Limited | Same dir | Quick switch |
| **Clone** | Slow | Complete | Duplicated | True isolation |
| **Branch** | Slow | Limited | Same dir | Sequential work |

## Integration with Parallel Agents

Cloud/Parallel Agents use worktrees automatically:

```
/parallel-agents launch
1. "Build login page"    → worktree/agent-1/
2. "Build signup page"   → worktree/agent-2/
3. "Build password reset" → worktree/agent-3/

/worktree-manage list
→ Shows agent worktrees
→ Can inspect/compare results
→ Selectively merge changes
```

## Troubleshooting

### "Worktree already exists"
```
/worktree-manage create feature/login
→ Error: feature-login already exists

Fix:
/worktree-manage list
→ Check if you want to reuse or rename
```

### "Cannot delete worktree with uncommitted changes"
```
/worktree-manage finish feature/login --discard
→ Error: Uncommitted changes

Fix:
1. /worktree-manage sync feature/login
2. Manually commit or stash
3. Retry finish
```

### "Worktree out of sync"
```
/worktree-manage sync feature/login
→ Reports conflicts

Fix:
1. Open worktree: cd worktree/feature-login/
2. Resolve conflicts manually
3. Mark resolved: git add .
4. Continue: git rebase --continue
```

## Configuration

### Default Base Branch

Set in `.cursor/settings.local.json`:
```json
{
  "worktree": {
    "defaultBase": "main",
    "autoPrune": true,
    "pruneAfterDays": 30
  }
}
```

### Exclusions

Add to `.gitignore`:
```gitignore
# Worktree directories (optional - if you don't want to see them)
# worktree/*/node_modules/
# worktree/*/.env.local
```

## Tips

1. **Keep main clean**: Use worktrees for all experiments
2. **Regular prune**: Monthly cleanup of stale worktrees
3. **Descriptive names**: `feature/login` not `feature/test`
4. **Commit before finish**: Don't lose work when discarding
5. **Use for reviews**: Better than web-based PR reviews
6. **Multiple IDE windows**: One per active worktree
7. **Sync regularly**: Keep feature branches up to date

---

## Quick Reference

```
/worktree-manage list              → Show all worktrees
/worktree-manage create [name]     → New worktree
/worktree-manage sync [name]       → Update from base
/worktree-manage diff [a] [b]      → Compare worktrees
/worktree-manage finish [name]     → Complete & cleanup
/worktree-manage prune             → Remove stale worktrees
```
