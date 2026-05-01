---
name: knowledge-extractor
description: 7-step knowledge extraction and archival workflow. Use when archiving session insights or running /archive-session.
disable-model-invocation: true
---

# Knowledge Extractor

Extract and archive valuable knowledge from coding sessions.

## 7-Step Process

### Step 1: Analyze Session
Read the conversation and identify:
- What was built/fixed/changed
- What problems were encountered
- What decisions were made
- What insights were discovered

### Step 2: Categorize Insights

| Category | Description | Example |
|----------|-------------|---------|
| Decision | Architecture/tech choice | "Adopted Zod for validation" |
| Solution | Problem-solving approach | "Fixed race condition with mutex" |
| Pattern | Reusable pattern | "Error handling wrapper pattern" |
| Gotcha | Pitfall to avoid | "Remember to close DB connections" |
| Resource | Reference material | "Useful library: date-fns" |

### Step 3: Extract Decisions

For each decision, capture:
- What was decided
- Why (rationale)
- Alternatives considered
- Impact/consequences

### Step 4: Extract Solutions

For each problem solved:
- Problem description
- Solution approach
- Files changed
- Verification method

### Step 5: Structure Content

Format as markdown:
```markdown
# Session Archive - YYYY-MM-DD - [Brief Topic]

## Decisions
| Decision | Rationale | Impact |
|----------|-----------|--------|
| [What] | [Why] | [Result] |

## Solutions
| Problem | Solution | Files |
|---------|----------|-------|
| [What] | [How] | `[file]` |

## Patterns
- [Pattern]: [Description and usage]

## Gotchas
- [Issue]: [How to avoid]

## Resources
- [Link/name]: [What it's for]
```

### Step 6: Write to Archive

Location: `~/Documents/PersonalKnowledge/projects/[project]/sessions/`

File naming: `YYYY-MM-DD-[kebab-topic].md`

### Step 7: Update Index

Update `~/Documents/PersonalKnowledge/projects/[project]/index.md`:
- Add session link
- Summarize key decisions
- Tag topics

## Reference: Archive Structure

```
PersonalKnowledge/
├── projects/
│   └── [project]/
│       ├── index.md              # Project summary + links
│       ├── decisions/            # Architecture decisions
│       ├── solutions/            # Problem solutions
│       ├── patterns/             # Reusable patterns
│       ├── gotchas/              # Pitfalls
│       └── sessions/             # Session archives
├── topics/                       # Cross-project topics
└── areas/                        # Domain knowledge
```

## When to Use

- After completing significant feature
- After solving complex problem
- After making architectural decision
- When session has reusable insights
