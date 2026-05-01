# AI-Assisted Development Workflow

Standard workflow for working with Cursor AI.

---

## Session Lifecycle

### Start Phase

| Step | Action | Must Do |
|------|--------|---------|
| 1 | Read `STATE.md` | ✅ Always |
| 2 | Read `handoff.md` | If continuing task |
| 3 | Load context | If architecture involved |

### Work Phase

| Task | Mode | Approach |
|------|------|----------|
| Understand code | **Ask** | Read-only exploration |
| Plan feature | **Plan** | Generate → Review → Build |
| Implement | **Agent** | Auto-run enabled |
| Debug issue | **Debug** | Runtime analysis |

#### Mode Selection

```
"How does auth work?" → Ask mode
"Add Stripe checkout" → Plan mode → Agent mode
"Fix failing test" → Agent mode
"Why is this slow?" → Debug mode
```

### End Phase

| Step | Command | When |
|------|---------|------|
| 1 | `/update-state` | Every session |
| 2 | `/archive-session` | Milestones/decisions |
| 3 | `git commit` | When ready |

## Context Management

### Three Layers

```
Layer 1: Always Loaded
├── AGENTS.md
├── .cursor/rules/ (Always Apply)
└── STATE.md

Layer 2: On-Demand
├── docs/context/architecture.md
├── docs/context/constraints.md
└── docs/context/adr/*.md

Layer 3: External
└── ~/PersonalKnowledge/ (via MCP)
```

### Loading Context

```
/load-context         → Load architecture + constraints
/load-context arch    → Load architecture only
/load-context adr      → Load all ADRs
/load-context adr-001  → Load specific ADR
/load-context all      → Load all context docs
```

## SubAgent Usage

### When to Delegate

| Task | SubAgent |
|------|----------|
| Deep exploration | `@explore-enhanced` |
| Verify implementation | `@verifier` |
| Security review | `@security-audit` |
| Archive knowledge | `@knowledge-archivist` |

### Example

```
"Implement user authentication, then delegate to @verifier
for code review and test verification."
```

## Command Usage

### Available Commands

Type `/` in chat to see commands:

| Command | Use When |
|---------|----------|
| `/archive-session` | Session has valuable insights |
| `/update-state` | End of any session |
| `/load-context` | Need architecture context |
| `/review-hooks` | Modifying hooks or debugging |
| `/paradigm-init` | New project setup |
| `/paradigm-adopt` | Existing project migration |
| `/paradigm-sync` | Template updates |

## Best Practices

### Keep Sessions Focused

- One feature per session
- Restart for new tasks (fresh context)
- Use queued messages for follow-ups

### Verify Work

- Review diffs before accepting
- Run tests after implementation
- Use `@verifier` for complex changes

### Maintain Knowledge

- Archive significant decisions
- Update handoff.md each session
- Keep STATE.md ≤30 lines

### Security First

- Hooks run automatically — respect them
- Ask before sensitive operations
- Never bypass security gates

---

*Applies to: All AI-assisted development*
