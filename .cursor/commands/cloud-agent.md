---
description: Launch and manage Background/Cloud Agents for long-running tasks
---

# /cloud-agent — Background & Cloud Agents

Launch and manage Cloud Agents for long-running or asynchronous tasks.

## What are Cloud Agents?

Cloud Agents (formerly Background Agents) run in Cursor's cloud environment:
- Continue working when local machine is off
- Run on separate git branches
- Notify when complete
- Ideal for long-running tasks

## When to Use

| Scenario | Local Agent | Cloud Agent |
|----------|-------------|-------------|
| Quick edits (< 5 min) | ✅ | ❌ Overkill |
| Medium tasks (5-30 min) | ✅ | ✅ Either |
| Long tasks (30+ min) | ❌ Blocks IDE | ✅ Recommended |
| Overnight processing | ❌ | ✅ Essential |
| Multi-branch work | ❌ | ✅ Parallel |

## Commands

### Launch Cloud Agent

```
/cloud-agent launch "Refactor authentication system"
```

Options:
- `--branch feature/auth-refactor` - Specific branch
- `--worktree` - Use git worktree isolation
- `--notify` - Notify on completion

### List Running Agents

```
/cloud-agent list
```

Output:
```
## Cloud Agents

| ID | Task | Branch | Status | Runtime |
|----|------|--------|--------|---------|
| ca-123 | Auth refactor | feature/auth | Running | 45 min |
| ca-124 | API migration | feature/api | Complete | 2 hrs |
```

### Check Status

```
/cloud-agent status ca-123
```

Shows:
- Current progress
- Files modified
- Commits made
- Any blockers

### Get Results

```
/cloud-agent results ca-124
```

Downloads:
- Changed files
- Commit history
- Summary report

### Cancel Agent

```
/cloud-agent cancel ca-123
```

## Best Practices

### Task Preparation

1. **Clear scope** - Define what needs to be done
2. **Test strategy** - How to verify results
3. **Rollback plan** - If results are unsatisfactory

### Example: Large Refactor

```
/cloud-agent launch "Migrate all API routes to new middleware pattern"

Task details:
- Update 50 route files
- Migrate auth middleware
- Update tests
- Verify no breaking changes

Options:
--branch feature/middleware-migration
--worktree
--notify slack/email
```

### Monitoring

Check periodically:
```
/cloud-agent status ca-123
```

Or wait for notification.

## Worktree Mode

Creates isolated git worktree:

```
main branch:    working on feature X
worktree:       cloud agent working on feature Y
```

Benefits:
- No interference with local work
- Clean separation
- Easy to discard if needed

## Integration with Workflow

### Plan Mode → Cloud Agent

```
1. /plan "Design new architecture"
2. Review plan locally
3. /cloud-agent launch "Implement architecture"
4. Continue local work
5. Review results when notified
```

### Parallel Development

```
Local Agent:    Working on UI components
Cloud Agent 1:  Refactoring backend API
Cloud Agent 2:  Updating documentation
```

## Cost Considerations

- Cloud Agents use Cursor usage credits
- Longer tasks = more credits
- Monitor usage in Settings

## Troubleshooting

### Agent Stuck
```
/cloud-agent status ca-123
→ Check for input requests or errors
```

### Agent Failed
```
/cloud-agent logs ca-123
→ Review error messages
→ Relaunch if needed
```

### Results Not As Expected
```
1. Review changes in worktree
2. Cherry-pick desired changes
3. Discard unwanted changes
4. Relaunch with clearer instructions
```

## Security

- Cloud Agents run in isolated environments
- No access to local secrets
- Git credentials handled securely
- Changes only in designated branches
