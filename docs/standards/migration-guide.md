# Migration Guide

Migrate to or update CursorHarness paradigm.

---

## Scenario A: New Project (Greenfield)

### When
- Starting project from scratch
- Empty repository

### Command
```
/paradigm-init
```

### Steps
1. Answer 5 setup questions
2. AI executes 7-step auto-configuration
3. Review created files
4. Initial commit

### What Gets Created
- `.cursor/` configuration
- `docs/` structure
- `AGENTS.md`, `STATE.md`
- Sample rules adapted to project type

---

## Scenario B: Existing Project (Brownfield)

### When
- Project with existing code
- Want to adopt gradually

### Command
```
/paradigm-adopt
```

### Approach

Per-module adoption with user confirmation:

| Phase | Module | Action |
|-------|--------|--------|
| 1 | Core | `.cursor/`, `AGENTS.md`, `STATE.md` |
| 2 | Hooks T1 | Security hooks first |
| 3 | Rules | Priority rules |
| 4 | Commands | Essential commands |
| 5 | Docs | Architecture structure |
| 6 | Full | Remaining components |

### Conservative Strategy

For sensitive production code:

1. Start with read-only: rules, docs
2. Add hooks in monitor-only mode
3. Gradually enable enforcement
4. Full adoption over time

---

## Scenario C: Template Updates

### When
- Already using CursorHarness
- Want latest improvements

### Command
```
/paradigm-sync
```

### Tiered Changes

| Tier | Type | Action |
|------|------|--------|
| T1 | Security fixes | Auto-apply |
| T2 | Bug fixes | Auto-apply |
| T3 | Enhancements | Ask first |
| T4 | Breaking changes | Manual review |

### Conflict Resolution

If local customizations exist:

1. View 3-way diff
2. Choose: keep local / use template / merge
3. Document customizations for future syncs

---

## Manual Migration

If commands unavailable, manual steps:

### 1. Copy Template Files

Copy to project root:
- `.cursor/` directory
- `docs/standards/` directory
- `AGENTS.md`, `STATE.md`

### 2. Adapt Configuration

Edit `AGENTS.md`:
- Project name
- Description
- Repository URL

Edit `.cursor/rules/00-project-overview.mdc`:
- Tech stack
- Project type

### 3. Setup Hooks

```bash
# Make executable
chmod +x .cursor/hooks/*.sh

# Verify jq installed (for JSON parsing)
which jq
```

### 4. Initialize State

Create `docs/private/state/`:
- `wip.md` — cross-session tasks
- `handoff.md` — session handoff

### 5. First Commit

```bash
git add .
git commit -m "feat: init CursorHarness paradigm"
```

---

## Rollback

If issues after migration:

```bash
# View recent commits
git log --oneline -10

# Revert specific commit
git revert [commit-hash]

# Or reset to before migration
git reset --hard [pre-migration-commit]
```

---

## Post-Migration Checklist

- [ ] Hooks working (test with safe command)
- [ ] Commands available (type `/` to verify)
- [ ] Rules loaded (check context gauge)
- [ ] STATE.md readable
- [ ] Private docs ignored by Git
- [ ] First successful AI session

---

*Reference: `/paradigm-init`, `/paradigm-adopt`, `/paradigm-sync` commands*
