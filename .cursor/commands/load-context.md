---
description: Load architecture docs from docs/context/ on demand
---

# /load-context — Load Context Documents

Load Layer 2 architecture documents into context.

## Parameters

| Param | Loads |
|-------|-------|
| (none) | `architecture.md` + `constraints.md` |
| `arch` | `architecture.md` only |
| `constraints` | `constraints.md` only |
| `adr` | All files in `docs/context/adr/` |
| `adr-001` | Specific ADR (e.g., `adr-001`) |
| `all` | All context documents |

## Usage

### Basic
```
/load-context
```
Loads architecture and constraints.

### Specific Document
```
/load-context adr
```
Loads all Architecture Decision Records.

### Specific ADR
```
/load-context adr-001
```
Loads `docs/context/adr/001-*.md`.

## Layer System

```
Layer 1 (Auto):  AGENTS.md + Always Apply Rules
       ↓
Layer 2 (On-demand):  docs/context/ (this command)
       ↓
Layer 3 (External):  ~/PersonalKnowledge/ (via MCP)
```

## When to Use

- **Architecture decisions**: `/load-context arch`
- **Constraint evaluation**: `/load-context constraints`
- **Historical context**: `/load-context adr`
- **Full context**: `/load-context all`

## Document Structure

### architecture.md
- Project background
- Problem domain
- System architecture
- Key design decisions

### constraints.md
- Technical limitations
- Business rules
- Integration requirements
- Non-functional requirements

### adr/NNN-*.md
- One ADR per significant decision
- Date, status, context, decision, consequences
