---
description: Distill session content and archive knowledge to PersonalKnowledge
---

# /archive-session — Knowledge Archive

Archive this session's key insights, decisions, and solutions for long-term reference.

## Steps

### 1. Analyze Session
Review the conversation and identify:
- **Decisions**: Architecture choices, tech selections, approach decisions
- **Solutions**: Problems solved with their implementations
- **Discoveries**: Technical insights, patterns recognized
- **Gotchas**: Pitfalls encountered, edge cases found
- **Resources**: Useful files, docs, tools referenced

### 2. Structure Content

Format as:
```markdown
# Session Archive - YYYY-MM-DD - [Topic]

## Decisions
| Decision | Rationale | Impact |
|----------|-----------|--------|
| ... | ... | ... |

## Solutions
| Problem | Solution | Files |
|---------|----------|-------|
| ... | ... | ... |

## Key Insights
- [Insight with context]

## Gotchas
- [Warning with how to avoid]
```

### 3. Archive Location

Write to `~/Documents/PersonalKnowledge/projects/[project-name]/sessions/`

File naming: `YYYY-MM-DD-[brief-topic].md`

### 4. Update Index

Update `~/Documents/PersonalKnowledge/projects/[project-name]/index.md` with:
- Session reference
- Key decisions summary
- New patterns added

## When to Archive

Archive when session includes:
- ✅ Architecture decisions
- ✅ Complex problem solving
- ✅ New patterns established
- ⚠️ Skip: Routine maintenance, simple fixes

## Delegate to SubAgent

For thorough archival, delegate to `knowledge-archivist` SubAgent.
