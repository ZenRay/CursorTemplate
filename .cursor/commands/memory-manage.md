---
description: Manage Cursor Native Memories - view, edit, and organize AI memory
---

# /memory-manage — Native Memories Management

Manage Cursor's built-in memory feature for persistent context.

## What are Native Memories?

Cursor Memories (v1.0+) automatically remember facts from conversations:
- Persist across sessions
- Stored per project, per user
- AI suggests, user approves
- Managed in Settings → Rules → Memories

## vs KnowledgeExtractor Skill

| Feature | Native Memories | KnowledgeExtractor Skill |
|---------|-----------------|-------------------------|
| Location | Cursor Settings | `~/Documents/PersonalKnowledge/` |
| Creation | AI suggests, user approves | `/archive-session` command |
| Scope | Per project | Cross-project |
| Format | Key-value pairs | Markdown documents |
| Management | Settings UI | File system |

## Commands

### View Memories

```
/memory-manage list
```

Shows:
```
## Native Memories

| Key | Value | Created |
|-----|-------|---------|
| user-auth | Uses JWT with 15min expiry | 2024-01-15 |
| db-schema | Users table has email_verified | 2024-01-20 |
| api-limit | Rate limit 100req/min | 2024-02-01 |
```

### Add Memory

```
/memory-manage add

Key: auth-method
Value: JWT with refresh tokens in httpOnly cookies
Tags: authentication, security
```

### Edit Memory

```
/memory-manage edit auth-method

New value: OAuth2 + JWT hybrid with PKCE
```

### Delete Memory

```
/memory-manage delete auth-method
```

### Search Memories

```
/memory-manage search "authentication"

Returns matching keys and values.
```

## Integration with Workflow

### Session Start

Before starting work:
```
/memory-manage list
→ Review what Cursor already knows
```

### During Session

When AI learns important fact:
```
AI: "I'll remember we use Redis for caching"

/memory-manage add
Key: caching-strategy
Value: Redis with 1hr TTL for user sessions
```

### Session End

After important decisions:
```
/memory-manage add
Key: architecture-decision
Value: Migrated from REST to GraphQL for mobile optimization
Tags: architecture, 2024-03-01
```

## Best Practices

### What to Remember

✅ **Good Memories**:
- Architecture decisions with rationale
- Tech stack versions and constraints
- API contracts and formats
- Business logic rules
- Debugging solutions to recurring issues

❌ **Avoid**:
- Temporary workarounds
- Code snippets (keep in codebase)
- Complete documentation (keep in docs/)
- Personal preferences

### Memory Structure

Clear, searchable format:

```
Key: auth-flow-v2
Value: 
  - OAuth2 with Google/Apple providers
  - Access token: 15min, JWT
  - Refresh token: 7days, httpOnly cookie
  - PKCE for mobile apps
  - Fallback to email/password
Tags: authentication, oauth, v2, 2024-03
```

### Regular Cleanup

Monthly review:
```
/memory-manage list --outdated

Delete:
- Obsolete versions
- Superseded decisions
- Temporary fixes that are now permanent
```

## Settings Integration

Enable in Cursor:

```
Settings → Rules → Memories → "Generate Memories"
```

Options:
- Auto-suggest: AI proposes memories
- Manual only: You create all memories
- Import/Export: Backup to JSON

## Export/Backup

```
/memory-manage export

Saves to:
- `.cursor/memories-backup.json`
- Can commit to git (safe, no secrets)
```

## Migration from Skills

If using KnowledgeExtractor Skill:

```
1. Keep Skill for cross-project knowledge
2. Add Native Memories for project-specific facts
3. Use both together:
   - `/memory-manage list` (native)
   - `@knowledge-extractor` (cross-project)
```

## Example Memories

```yaml
# Project: E-commerce API

auth-strategy:
  value: "JWT access + refresh tokens"
  created: 2024-01-15

rate-limits:
  value: "100 req/min auth, 10 req/min unauth"
  created: 2024-01-20

payment-flow:
  value: "Stripe → Webhook → Order confirmed → Email"
  created: 2024-02-01

database-constraints:
  value: "Users.email unique, Orders.user_id FK"
  created: 2024-02-15
```

## Tips

1. **Consistent naming**: Use kebab-case keys
2. **Date important ones**: For tracking decisions
3. **Tags**: Group related memories
4. **Regular review**: Delete stale memories
5. **Sync with team**: Share critical memories
