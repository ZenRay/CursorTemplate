---
description: Run multiple Agents in parallel for maximum throughput
---

# /parallel-agents — Parallel Agent Execution

Run up to 8 Agents simultaneously for maximum productivity.

## Overview

Cursor supports running multiple Agents in parallel:
- **Max 8 agents** simultaneously
- Each in separate git worktree
- Independent contexts
- Compare results across agents

## Use Cases

### 1. A/B Testing Approaches

```
Agent 1: Implement feature using Approach A
Agent 2: Implement feature using Approach B
→ Compare and pick best
```

### 2. Multiple Workstreams

```
Agent 1: Frontend work
Agent 2: Backend API
Agent 3: Documentation
Agent 4: Tests
```

### 3. Best-of-N Generation

```
/parallel-agents --best-of-3 "Implement user dashboard"

Runs same prompt with 3 different models/strategies
Picks best result or combines good parts
```

## Commands

### Launch Multiple Agents

```
/parallel-agents launch

1. "Build login page" → worktree/login-page
2. "Build signup page" → worktree/signup-page
3. "Build password reset" → worktree/password-reset
```

### Monitor All

```
/parallel-agents status

Shows table of all running agents:
| Agent | Task | Status | Progress |
|-------|------|--------|----------|
| pa-1 | Login page | 80% | Running |
| pa-2 | Signup page | Done | Complete |
```

### Compare Results

```
/parallel-agents compare pa-1 pa-2 pa-3

Generates comparison report:
- Lines of code
- Test coverage
- Complexity metrics
- Best practices score
```

### Merge Results

```
/parallel-agents merge pa-1 pa-2

Selectively merge changes from multiple agents:
- Cherry-pick specific files
- Resolve conflicts
- Create unified PR
```

## Worktree Architecture

Each parallel agent gets isolated worktree:

```
main/
├── .git
├── src/ (your current work)
└── worktrees/
    ├── agent-1/ (login page)
    ├── agent-2/ (signup page)
    └── agent-3/ (password reset)
```

Benefits:
- No interference between agents
- Easy to discard individual results
- Clean merge workflow

## Best Practices

### Task Independence

✅ **Good**: Separate, unrelated tasks
- Login page
- Signup page
- Password reset

❌ **Bad**: Dependent tasks
- Database schema change
- API using that schema
- Frontend using that API

### Clear Specifications

Each agent needs:
- Clear requirements
- Acceptance criteria
- Test expectations
- Interface contracts (if interacting)

### Resource Planning

| Agents | CPU/Memory | Best For |
|--------|------------|----------|
| 2-3 | Low | Standard parallel work |
| 4-5 | Medium | Major feature split |
| 6-8 | High | Best-of-N, large refactors |

## Advanced: Best-of-N Pattern

Run same task multiple ways:

```
/parallel-agents --best-of-3 "Optimize database queries"

Strategy A: Use caching
Strategy B: Add indexes
Strategy C: Rewrite queries

Compare:
- Performance benchmarks
- Code complexity
- Maintenance burden
→ Pick winner or hybrid approach
```

## Monitoring Dashboard

```
/parallel-agents dashboard

Real-time view:
[Agent 1] ████████░░ 80% - Login page
[Agent 2] ██████████ 100% - Signup page ✓
[Agent 3] ██████░░░░ 60% - Password reset
[Agent 4] Waiting for input...
```

## Error Handling

### One Agent Fails
```
Others continue unaffected
Fix failed agent or discard
```

### Resource Exhaustion
```
Cursor automatically queues excess agents
Runs as resources available
```

## Integration with Cloud Agents

Combine for maximum power:

```
Local:     UI work
Cloud 1:   Backend (30 min task)
Cloud 2:   Database migration (1 hr task)
Parallel:  Multiple frontend components locally
```

## Tips

1. **Start small** - 2-3 agents first
2. **Clear interfaces** - Define how components interact
3. **Version lock** - Ensure consistent dependencies
4. **Communication** - Use shared docs for coordination
5. **Review each** - Don't blindly merge, review individually
