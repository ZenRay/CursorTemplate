---
description: Verify that paradigm-init was executed correctly and no template artifacts remain
---

# /verify-init — Verify Clean Initialization

Verify that `/paradigm-init` was executed correctly and no template artifacts remain.

## Purpose

After running `/paradigm-init`, use this command to verify:
- Template artifacts were properly excluded
- Project files are customized (not template placeholders)
- No sensitive template data leaked into new project

## Verification Checklist

### 1. Excluded Content (Should NOT exist)

| Check | Path | Expected |
|-------|------|----------|
| No log files | `.cursor/logs/*.log` | Only `.gitkeep` |
| No session notes | `.cursor/notes/*.md` | Only `.gitkeep` |
| No private docs | `docs/private/*.md` | Only `.gitkeep` or user files |
| No template state | `docs/private/state/*` | Only skeleton files |

### 2. Customized Content (Should be project-specific)

| Check | File | Expected |
|-------|------|----------|
| Project name | `AGENTS.md` | Not "[Your Project Name]" |
| Version | `AGENTS.md` | V0.1 (not template version) |
| Phase | `STATE.md` | "Initialization" (not template phase) |
| Description | `AGENTS.md` | Project-specific text |

### 3. Skeleton Files (Should be empty templates)

| File | Should Contain | Should NOT Contain |
|------|---------------|-------------------|
| `docs/private/state/wip.md` | "Initialization" status | Template's task list |
| `docs/private/state/handoff.md` | Generic structure | Template's session history |

## Output Format

```
## Initialization Verification

### ✅ Excluded Content (Clean)
- [✓] .cursor/logs/ — No log files (only .gitkeep)
- [✓] .cursor/notes/ — No draft files (only .gitkeep)
- [✓] docs/private/ — No template docs

### ✅ Customized Content
- [✓] AGENTS.md — Project name: "MyProject" (not placeholder)
- [✓] STATE.md — Phase: "Initialization" (not template state)
- [✓] Description — Project-specific

### ✅ Skeleton Files
- [✓] wip.md — Empty template structure
- [✓] handoff.md — Empty template structure

### Verification Result: ✅ PASS

Your project is properly initialized with no template artifacts.
```

## Failure Cases

### Case 1: Template Artifacts Present

```
### ❌ Excluded Content (Issues Found)
- [✗] .cursor/logs/failure.log — 12KB (should be removed)
- [✗] docs/private/Cursor方案.md — 14KB (template design doc)

⚠️ Recommendation:
Run cleanup:
  rm .cursor/logs/*.log
  rm docs/private/Cursor方案.md
  rm docs/private/state/wip.md
  rm docs/private/state/handoff.md
```

### Case 2: Not Customized

```
### ❌ Customized Content (Issues Found)
- [✗] AGENTS.md — Still has "[Your Project Name]"
- [✗] STATE.md — Shows "V0.7 Released" (template state)

⚠️ Recommendation:
Re-run paradigm-init or manually update:
  - Replace placeholders in AGENTS.md
  - Reset STATE.md to "Initialization" phase
```

## Quick Fix Commands

If verification fails, quick fix:

```bash
# Clean template artifacts
rm -f .cursor/logs/*.log
rm -f .cursor/notes/*.md
touch .cursor/logs/.gitkeep
touch .cursor/notes/.gitkeep

rm -f docs/private/*.md
rm -f docs/private/state/*.md
mkdir -p docs/private/state
touch docs/private/.gitkeep
touch docs/private/state/.gitkeep

# Reset skeleton files
cat > docs/private/state/wip.md << 'EOF'
# WIP — Cross-Session Work

> Private file, not tracked by Git.

---

## Current Status: Initialization

| Item | Status |
|------|--------|
| Project setup | ✅ Complete |
EOF

cat > docs/private/state/handoff.md << 'EOF'
# Handoff — Session Memo

> Private file, not tracked by Git.

---

## Session: $(date +%Y-%m-%d)

### Completed
- [x] CursorHarness initialization

### Next Priority
- [ ] First development task
EOF
```

## Integration with paradigm-init

Recommended workflow:

```
1. /paradigm-init        → Initialize project
2. /verify-init          → Verify cleanliness
3. (Fix if issues)       → Manual or re-init
4. git init && git add . → Start tracking
```

## CI/CD Integration

Add to pre-commit hook:

```bash
#!/bin/bash
# .cursor/hooks/verify-init.sh

if [ -f ".cursor/logs/failure.log" ]; then
    echo "⚠️  Template artifact detected: .cursor/logs/failure.log"
    echo "Run: rm .cursor/logs/*.log"
    exit 1
fi

if grep -q "V0.7 Released" STATE.md 2>/dev/null; then
    echo "⚠️  STATE.md not customized (still has template version)"
    exit 1
fi
```
