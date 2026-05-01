---
description: Brownfield adoption - gradually adopt CursorHarness in existing project
---

# /paradigm-adopt — Adopt Paradigm Gradually

Adopt CursorHarness engineering paradigm in an existing (brownfield) project.

## Phase 1: Audit Current State

Analyze existing project:
1. **Structure audit**: Current directory layout
2. **Tech stack detection**: Language, framework
3. **Existing conventions**: Any current standards?
4. **Git state**: Branch, recent commits
5. **Conflicts**: What will need adaptation?

## Phase 2: Module-by-Module Plan

Create phased adoption plan:

| Phase | Module | Action | Confirm? |
|-------|--------|--------|----------|
| 1 | Core config | .cursor/, AGENTS.md, STATE.md | ✅ |
| 2 | Hooks | T1 (security) first | ✅ |
| 3 | Rules | Priority rules only | ✅ |
| 4 | Commands | Essential commands | ✅ |
| 5 | Docs | architecture.md, standards | ✅ |
| 6 | Full adoption | Remaining components | ✅ |

## Phase 3: Execute (Per Module)

For each module, user confirms before proceeding:

### Module 1: Core Configuration
Copy without overwrite:
- `.cursor/` directory
- `AGENTS.md` (adapt project name)
- `STATE.md` (analyze current state)

### Module 2: Security Hooks (T1)
Most critical, adopt first:
- `security-gate.sh`
- `prompt-guard.sh`
- Test with safe commands

### Module 3: Rules (Priority)
Start with 2-3 critical rules:
- `00-project-overview.mdc`
- `01-core-standards.mdc`
- Tech-specific rule (e.g., `02-code-style.mdc`)

### Module 4: Commands
Essential only:
- `update-state.md`
- `load-context.md`

### Module 5: Documentation
- Create `docs/context/` structure
- Migrate existing docs
- Create initial ADR-001

### Module 6: Full Adoption
Add remaining:
- T2-T4 hooks
- All rules
- All commands
- SubAgents
- Skills

## Phase 4: Validation

Per-module verification:
1. Run `git status` — check what's changed
2. Test hooks — verify they work
3. Test commands — ensure `/` works
4. User review — approve changes

## Output

```
## Paradigm Adoption Report

### Modules Adopted
| Module | Status | Files Changed |
|--------|--------|---------------|
| Core | ✅ | [N files] |
| Hooks T1 | ✅ | security-gate, prompt-guard |
| ... | ... | ... |

### Remaining Work
- [ ] Full T2-T4 hooks
- [ ] Complete rule set
- [ ] ...

### Recommendations
- [Specific next steps]
```

## Conservative Approach

For sensitive production projects:
1. Start with **read-only** components (rules, docs)
2. Add hooks in **monitor-only** mode first
3. Gradually enable enforcement
4. Full adoption over multiple sessions
