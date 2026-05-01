# Project Instructions

Quick reference for AI agent working on this project.

---

## Identity
- **Name**: [Your Project Name]
- **Type**: [code/docs/mixed]
- **Stack**: [Tech stack]

## Quick Links
| Document | Location | Purpose |
|----------|----------|---------|
| Current State | `@STATE.md` | Project status, phase, milestones |
| Architecture | `@docs/context/architecture.md` | System design, decisions |
| Constraints | `@docs/context/constraints.md` | Limitations, rules |
| WIP Tasks | `@docs/private/state/wip.md` | Cross-session work |
| Last Handoff | `@docs/private/state/handoff.md` | Previous session memo |

## Available Commands
Type `/` in chat to see all commands:

| Command | Purpose |
|---------|---------|
| `/archive-session` | Archive knowledge to PersonalKnowledge |
| `/update-state` | Sync STATE.md, wip.md, handoff.md |
| `/load-context` | Load architecture documents |
| `/review-hooks` | Analyze hooks configuration |
| `/paradigm-init` | Initialize new project |
| `/paradigm-adopt` | Adopt paradigm in existing project |
| `/paradigm-sync` | Sync with template updates |

## Rules Quick Access
| Rule | File | Use When |
|------|------|----------|
| Project Overview | `.cursor/rules/00-project-overview.mdc` | Always loaded |
| Core Standards | `.cursor/rules/01-core-standards.mdc` | Always loaded |
| Code Style | `.cursor/rules/02-code-style.mdc` | Coding |
| Git Convention | `.cursor/rules/03-git-convention.mdc` | Git operations |
| Comment Style | `.cursor/rules/04-comment-style.mdc` | Documentation |
| Workflow | `.cursor/rules/05-workflow.mdc` | Planning |
| Migration | `.cursor/rules/06-migration-guide.mdc` | Template migration |
| Security | `.cursor/rules/07-security-practices.mdc` | Security tasks |

## SubAgents
| Agent | Use For |
|-------|---------|
| `@explore-enhanced` | Deep codebase analysis |
| `@verifier` | Code verification, tests |
| `@security-audit` | Security review |
| `@knowledge-archivist` | Knowledge archiving |

## Constraints
- Source edits: `./src/**`, `./tests/**`
- Config edits: Ask first (`.cursor/**`)
- Private docs: Never commit (`docs/private/`)
- Dangerous ops: Hooks will block (`rm -rf`, `sudo`, `DROP`)

## Session Start Checklist
- [ ] Read `STATE.md`
- [ ] Read `handoff.md` if continuing task
- [ ] Load context if needed: `/load-context`

## Session End Checklist
- [ ] Run `/update-state`
- [ ] Archive if milestone: `/archive-session`
- [ ] Commit if ready: `git commit` (with confirmation)
