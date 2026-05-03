---
description: Greenfield initialization - apply CursorHarness to new empty project with automatic cleanup of template artifacts
---

# /paradigm-init — Initialize New Project

Apply CursorHarness engineering paradigm to a new (empty) project with automatic cleanup.

## Exclusion List (Files NOT copied from template)

The following files/directories are **automatically excluded** during initialization:

| Pattern | Reason | Location |
|---------|--------|----------|
| `.cursor/logs/*` | Runtime logs (history from template) | `.cursor/logs/` |
| `.cursor/notes/*` | Session notes (template drafts) | `.cursor/notes/` |
| `docs/private/*` | Private docs (template state) | `docs/private/` |
| `*.log` | All log files | Anywhere |
| `.git/` | Git history (template's commits) | Root |
| `failure.log` | Hook failure logs | `.cursor/logs/` |
| `Cursor方案.md` | Template design doc (internal) | `docs/private/` |
| `wip.md` | Template work-in-progress | `docs/private/state/` |
| `handoff.md` | Template session handoff | `docs/private/state/` |

**Preserved**: `.gitkeep` files (maintain directory structure)

## Phase 1: Template Path Detection (No Input Required)

Default behavior works without user input:

### Auto-Detection Order

1. **Remote template** (GitHub): `https://github.com/ZenRay/CursorTemplate.git`
2. **Local template** (if exists): `~/Documents/CursorTemplate`
3. **Current fallback**: Use current `.cursor/` if already present

### Default Values (when no input provided)

| Field | Default Value |
|-------|---------------|
| Project name | Current directory name (kebab-case) |
| Description | "Project initialized with CursorHarness paradigm" |
| Type | `code` (auto-detect from existing files) |
| Tech stack | Auto-detect from `package.json`, `go.mod`, etc. |
| Source dirs | `src/`, `tests/` (if not exist, will note) |
| Repo URL | `https://github.com/<user>/<project>.git` (placeholder) |

## Phase 2: Auto-Execution (7 Steps)

### Step 1: Copy Template with Exclusions

```bash
# Copy with automatic exclusions
cp -r $TEMPLATE/.cursor .
cp -r $TEMPLATE/docs .

# Clean excluded content (default behavior)
rm -f .cursor/logs/*.log
rm -f .cursor/notes/*.md
rm -f docs/private/*.md
rm -rf docs/private/state/*

# Preserve .gitkeep
find .cursor/logs .cursor/notes docs/private -name ".gitkeep" -exec touch {} \;
```

### Step 2: Copy Core Config Files

```bash
cp $TEMPLATE/AGENTS.md .
cp $TEMPLATE/STATE.md .
cp $TEMPLATE/.gitignore .
cp $TEMPLATE/.cursorignore .
cp $TEMPLATE/.cursorindexingignore .
```

### Step 3: Update AGENTS.md

Replace placeholders:
- `[Your Project Name]` → Actual project name
- `[Brief description]` → Default or user-provided
- `V0.1` → Reset version
- Template repo URL → Placeholder

### Step 4: Reset STATE.md

```markdown
# Project State Board

## Current Status
| Field | Value |
|-------|-------|
| Phase | **Initialization** |
| Active Branch | `main` |
| Next Milestone | Complete project structure, start first task |
| Last Commit | `Init (CursorHarness paradigm)` |

## In Progress
| Item | Status |
|------|--------|
| Paradigm initialization | ✅ Complete |

## Recent Decisions
- YYYY-MM-DD: Adopt CursorHarness engineering paradigm
```

### Step 5: Create docs/private/state/ Skeleton

Create empty template files (not copy from template):

**`docs/private/state/wip.md`**:
```markdown
# WIP — Cross-Session Work

> Private file, not tracked by Git.

---

## Current Status: Initialization

| Item | Status | Priority | Notes |
|------|--------|----------|-------|
| Project setup | ✅ Complete | High | CursorHarness initialized |

## Backlog

- [ ] Define project structure
- [ ] First feature implementation

## Notes

Initialized with CursorHarness V0.7
```

**`docs/private/state/handoff.md`**:
```markdown
# Handoff — Session Memo

> Private file, not tracked by Git. Only latest session kept.

---

## Session: YYYY-MM-DD

### Completed
- [x] CursorHarness paradigm initialization
- [x] Project structure setup

### Next Priority
- [ ] Start first development task

### Context for Next Session
Project initialized with CursorHarness template.
```

### Step 6: Reset docs/context/

- Clear template ADRs (if any copied)
- Create `001-adopt-cursorharness.md` with current date
- Reset `architecture.md` to skeleton
- Reset `constraints.md` to skeleton

### Step 7: Verify & Report

Checklist:
- [ ] Template files copied (excluding exclusion list)
- [ ] Excluded content cleaned (logs, private docs)
- [ ] AGENTS.md customized for project
- [ ] STATE.md reset to initial state
- [ ] docs/private/state/ created with skeleton files
- [ ] Hooks executable (`chmod +x .cursor/hooks/*.sh`)
- [ ] No template runtime artifacts present

## Phase 3: Completion Report

Output:
```
✅ /paradigm-init Complete

Project: [name]
Type: [code/docs/mixed]
Path: [absolute path]

Excluded (template artifacts):
  🗑️ .cursor/logs/failure.log
  🗑️ .cursor/notes/*.md (drafts)
  🗑️ docs/private/Cursor方案.md
  🗑️ docs/private/state/wip.md
  🗑️ docs/private/state/handoff.md

Created (fresh for new project):
  ✅ docs/private/state/wip.md (empty template)
  ✅ docs/private/state/handoff.md (empty template)

Done:
  ✅ AGENTS.md — Customized for project
  ✅ STATE.md — Reset to initial state
  ✅ Hooks — T1-T4 configured
  ✅ Rules — 8 rule files
  ✅ Commands — 17 commands available
  ✅ Exclusions applied — Clean template

Next Steps:
  → Run /update-state to sync
  → Fill in architecture.md
  → git init && git add . && git commit
  → Start first task
```

## Manual Override (Advanced)

If you need to customize exclusions:

```bash
# Custom exclusion pattern
/paradigm-init --exclude="*.custom"

# Include normally excluded (not recommended)
/paradigm-init --include-private-docs
```

## Troubleshooting

### "Logs directory not empty"
Normal - `.gitkeep` is preserved. Only `*.log` files are removed.

### "Private docs missing"
By design. Template's private docs are internal. Create your own in `docs/private/`.

### "Want template's Cursor方案.md"
Not recommended - it's specific to template development. Check GitHub repo instead.

## Verification Command

After init, verify cleanliness:

```
/verify-init

Checks:
- ✓ No *.log files in .cursor/logs/
- ✓ No template-specific docs in docs/private/
- ✓ AGENTS.md customized (not template placeholders)
- ✓ STATE.md shows "Initialization" phase
- ✓ wip.md and handoff.md are skeleton (not template content)
```
