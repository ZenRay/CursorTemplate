# Project Agent Instructions

This file provides project-level context and behavioral guidelines for the AI agent.

---

## Project Overview

**[Your Project Name]** — [Brief description, 10-40 chars]

- **Repository**: [URL or placeholder]
- **Current version**: V0.1
- **Template**: CursorHarness Engineering

---

## Context Loading Rules

| Trigger | Must Read |
|---------|-----------|
| Any new session | `STATE.md` — Current project status |
| Continue cross-session task | `docs/private/state/handoff.md` |
| Architecture/constraint questions | `/load-context [arch\|constraints\|adr\|all]` |
| Code standards questions | `.cursor/rules/02-code-style.mdc` |
| Git operations | `.cursor/rules/03-git-convention.mdc` |
| Planning work | `.cursor/rules/05-workflow.mdc` |

---

## SubAgent Broadcast

When delegating to SubAgents, they must read:
1. `AGENTS.md` — Behavioral guidelines (this file)
2. `STATE.md` — Current project status

SubAgent completion: Report any state changes (new files, decisions, phase progress).

---

## Core Behavioral Rules

### Safety (Mandatory)
- Preview changes before editing `.cursor/**` config files
- Never delete files without user confirmation
- Never force-push to `main`/`master`
- Run `git status` and `git diff` before committing
- Ask before `git commit` or `git push`

### Code Standards
- Read comment-style rule before code changes: `.cursor/rules/04-comment-style.mdc`
- Read git-convention before commits: `.cursor/rules/03-git-convention.mdc`
- Public functions must have documentation comments
- Delete dead code (don't comment out)

### File Scope
- Source edits: `./src/**`, `./tests/**` by default
- Private docs (`docs/private/**`): Never commit to Git
- Outside scope: Ask user first

---

## Project Structure

```
.cursor/
├── agents/          # SubAgents (4)
├── commands/          # Slash commands (7)
├── hooks/             # Lifecycle hooks (6)
├── rules/             # Project rules (8 .mdc files)
├── skills/            # Reusable skills (3)
├── hooks.json         # Hook configuration
├── mcp.json           # MCP servers
├── notes/             # Session notes (private)
└── logs/              # Run logs (private)

docs/
├── context/           # Architecture docs
│   ├── architecture.md
│   ├── constraints.md
│   └── adr/
├── standards/         # Engineering standards
└── private/           # Private docs (state/)

STATE.md               # Public status board
AGENTS.md              # This file
instructions.md        # Quick reference
```

---

## Hooks Reference

| Event | Script | Tier | Exit Codes |
|-------|--------|------|------------|
| `beforeSubmitPrompt` | `prompt-guard.sh` | T1 | 0=pass, 2=block |
| `beforeShellExecution` | `security-gate.sh` | T1 | 0=pass, 2=block |
| `afterFileEdit` | `auto-lint.sh` | T2 | 0=pass |
| `postToolUseFailure` | `log-failure.sh` | T2 | 0=pass |
| `stop` | `notify-done.sh` | T3 | 0=pass |
| `preCompact` | `knowledge-trigger.sh` | T4 | 0=pass |

---

## Communication

- Respond in user's preferred language (中文)
- Use tables and code blocks for structured info
- Ask when scope is uncertain
