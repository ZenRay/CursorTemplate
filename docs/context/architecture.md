# Architecture

> Layer 2 document: Load on demand via `/load-context arch` or `@architecture.md`

---

## Project Positioning

[Describe what this project does, its purpose, and target users]

- **Domain**: [e.g., E-commerce, SaaS, Data Pipeline]
- **Scale**: [e.g., Startup MVP, Enterprise System]
- **Team**: [e.g., Solo, Small Team, Large Org]

## Problem Domain

[Describe the problems this project solves]

### Key Challenges
1. [Challenge 1]
2. [Challenge 2]
3. [Challenge 3]

## System Architecture

[Describe high-level architecture]

```
[Diagram or text description of system components]

Example:
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Frontend  │────▶│    API      │────▶│  Database   │
│  (Next.js)  │     │  (FastAPI)  │     │(PostgreSQL) │
└─────────────┘     └─────────────┘     └─────────────┘
```

## Key Components

| Component | Tech | Responsibility |
|-----------|------|----------------|
| [Name] | [Tech] | [What it does] |

## Data Flow

[Describe how data moves through the system]

## Integration Points

| System | Integration Type | Purpose |
|--------|------------------|---------|
| [External] | [API/DB/Queue] | [Why] |

## Future Considerations

[Architectural decisions deferred or planned]

---

*Last updated: 2026-05-02*
