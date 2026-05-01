---
description: Greenfield initialization - apply CursorHarness to new empty project
---

# /paradigm-init — Initialize New Project

Apply CursorHarness engineering paradigm to a new (empty) project.

## Phase 1: Information Gathering

Ask user (single round, all questions at once):

1. **Project name**? (default: current directory name)
2. **One-line description**? (10-40 chars)
3. **Project type**?
   - `code` — Source code project
   - `docs` — Documentation/research project
   - `mixed` — Code + documentation
4. **Tech stack**? (if code/mixed)
   - JavaScript/TypeScript, Python, Go, Rust, etc.
5. **Source directories**? (default: `src/`, `tests/`)
6. **Repo URL**? (optional)

## Phase 2: Auto-Execution (7 Steps)

### Step 1: Update AGENTS.md
Replace placeholders with project info:
- Project name
- Description
- Repo URL
- Reset version to V0.1

### Step 2: Configure setting.json
Adjust path permissions based on project type:
- `code`: `Edit(./src/**)`, `Edit(./tests/**)`
- `docs`: `Edit(./topics/**)`, `Edit(./docs/context/**)`
- `mixed`: Combine both

### Step 3: Reset STATE.md
Replace with initial state template:
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

### Step 4: Adjust auto-lint.sh
Add/confirm linter for tech stack:
- TypeScript: ESLint + Prettier
- Python: ruff/flake8
- Go: gofmt + golint
- Rust: rustfmt

### Step 5: Reset docs/context/
- Clear old template ADRs
- Create new ADR-001: "Adopt CursorHarness paradigm"
- Reset architecture.md, constraints.md to skeleton

### Step 6: Create docs/private/state/
Create three files:
- `wip.md` — Cross-session work tracking
- `handoff.md` — Session handoff memo
- Both with initial content

### Step 7: Verify
Checklist:
- [ ] AGENTS.md updated
- [ ] STATE.md reset
- [ ] Hooks executable
- [ ] docs/context/ clean
- [ ] docs/private/state/ created
- [ ] .gitignore excludes private/

## Phase 3: Completion Report

Output:
```
✅ /paradigm-init Complete

Project: [name]
Type: [code/docs/mixed]
Path: [absolute path]

Done:
  ✅ AGENTS.md — Project identity
  ✅ Hooks — T1-T4 configured
  ✅ Rules — 8 rule files
  ✅ STATE.md — Reset to init state
  ✅ docs/context/ — Clean + ADR-001
  ✅ docs/private/state/ — WIP + handoff

Next Steps:
  → Run /update-state to sync
  → Fill in architecture.md
  → Start first task
```

## Error Handling
- Missing directory: Create if not exists
- Existing files: Merge carefully, don't overwrite custom content
- Shellcheck warnings: Report but don't block
