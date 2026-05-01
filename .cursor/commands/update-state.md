---
description: Update STATE.md, wip.md, and handoff.md state documents
---

# /update-state — Update State Board

Synchronize project state across three documents.

## Documents Updated

### 1. STATE.md (Public, Git-tracked, ≤30 lines)
Location: `STATE.md`

Format:
```markdown
# Project State Board

## Current Status
| Field | Value |
|-------|-------|
| Phase | [Current phase] |
| Active Branch | `main` |
| Next Milestone | [What's next] |
| Last Commit | `[hash]` - [message] |

## In Progress
| Item | Status |
|------|--------|
| [Task 1] | [status] |

## Recent Decisions
- [YYYY-MM-DD]: [Decision summary]
```

### 2. wip.md (Private, Cross-session)
Location: `docs/private/state/wip.md`

Format:
```markdown
# WIP — Cross-Session Work

## Current Status: [Phase]

| Item | Status | Last Updated |
|------|--------|--------------|
| [Task] | [status] | YYYY-MM-DD |

## Backlog
- [ ] [Future task]

## Notes
[Context for next session]
```

### 3. handoff.md (Private, Session-specific)
Location: `docs/private/state/handoff.md`

Format:
```markdown
# Handoff — Session Memo

## Session: YYYY-MM-DD

### Completed
- [x] [What was done]

### Next Priority
- [ ] [Next task]

### Blockers
- [None / Blocker description]

### Context for Next Session
[Key context to remember]
```

## Execution Order

1. Read current `wip.md` and `handoff.md`
2. Update based on session context
3. Condense to `STATE.md` (≤30 lines)
4. Write all three files

## Rules
- STATE.md: Always ≤30 lines, concise
- wip.md: Keep ongoing tasks, archive completed
- handoff.md: Replace entirely (only latest session)
