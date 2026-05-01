---
description: Sync with template updates - upgrade existing CursorHarness project
---

# /paradigm-sync — Sync with Template Updates

Update an existing CursorHarness project with latest template improvements.

## Phase 1: Version Detection

1. Check current project version (from `STATE.md` or `AGENTS.md`)
2. Fetch latest template version (from local or remote)
3. Calculate diff scope

## Phase 2: Change Analysis

Categorize changes:

| Tier | Type | Auto-apply? | Risk |
|------|------|-------------|------|
| T1 | Security fixes | ✅ Yes | Low |
| T2 | Bug fixes | ✅ Yes | Low |
| T3 | New features | ⚠️ Ask | Medium |
| T4 | Refactoring | ❌ Manual | High |

## Phase 3: Tiered Application

### Tier 1: Security & Critical Fixes
Auto-apply if safe:
- Security hook improvements
- Critical bug fixes
- Documentation corrections

### Tier 2: Enhancements
Ask before applying:
- New hooks
- New rules
- Command improvements

### Tier 3: Structural Changes
Manual review required:
- Breaking changes
- Architecture changes
- Removed features

## Phase 4: Conflict Resolution

If local customizations exist:
1. Identify conflicts
2. Present 3-way diff
3. User selects: keep local / use template / merge

## Output Format

```
## Paradigm Sync Report

### Version
From: V[X.Y]
To: V[X.Y]

### Changes Summary
| Tier | Type | Count | Status |
|------|------|-------|--------|
| T1 | Security | [N] | ✅ Applied |
| T1 | Bug fix | [N] | ✅ Applied |
| T2 | Enhancement | [N] | ⚠️ Pending approval |
| T3 | Breaking | [N] | ❌ Manual review |

### Applied Changes
- [File]: [Change description]

### Pending Approval
- [File]: [Change description]
  [Approve/Reject/Merge]

### Conflicts Detected
- [File]: Local customizations vs template
  [Keep local / Use template / Manual merge]

### Post-Sync Steps
1. Review applied changes
2. Test hooks and commands
3. Update documentation references
4. Commit with message: `chore: sync CursorHarness to V[X.Y]`
```

## Rollback

If issues after sync:
```bash
git revert [sync-commit]
```

## Best Practices
- Sync regularly (monthly recommended)
- Review all Tier 2+ changes
- Test in staging before production
- Keep notes on local customizations
