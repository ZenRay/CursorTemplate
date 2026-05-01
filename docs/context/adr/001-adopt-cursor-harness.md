# ADR-001: Adopt CursorHarness Engineering Paradigm

**Date**: 2026-05-02
**Status**: Decided

## Context

[Project description] needs a standardized AI-assisted development workflow to ensure:
- Consistent code quality across sessions
- Knowledge retention between sessions
- Security guardrails for AI operations
- Team-wide conventions

## Decision

Adopt **CursorHarness Engineering** paradigm, a comprehensive template providing:

| Component | Purpose |
|-----------|---------|
| Hooks (6) | T1-T4 lifecycle automation (security, quality, experience, knowledge) |
| Rules (8) | Layered behavioral guidelines (always/auto/agent/manual) |
| Commands (7) | Workflow automation (`/archive-session`, `/update-state`, etc.) |
| SubAgents (4) | Specialized task delegation |
| Skills (3) | Reusable knowledge extraction, code review, test generation |
| MCP | External tool integration |

## Consequences

### Positive
- Standardized AI-assisted workflow
- Automatic security and quality checks
- Structured knowledge management
- Team collaboration baseline

### Negative
- Learning curve for new team members
- Maintenance of template updates
- Potential over-restriction for simple projects

## Alternatives Considered

| Alternative | Why Not Chosen |
|-------------|----------------|
| Custom setup per project | Inconsistent, time-consuming |
| Cursor defaults only | Missing team conventions |
| Other templates | CursorHarness better fits our needs |

## References

- Template source: [CursorHarness Template]
- `/paradigm-init` command documentation
- `/paradigm-adopt` for migration guidance
