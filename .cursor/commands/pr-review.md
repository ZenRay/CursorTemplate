---
description: Automated PR review with Bugbot integration - security, bugs, style checks
---

# /pr-review — Automated PR Review

Comprehensive PR review with automated checks and Bugbot integration.

## Overview

Bugbot is Cursor's automated PR review agent that checks for:
- Security vulnerabilities
- Potential bugs
- Code style issues
- Best practice violations

## PR Review Workflow

### 1. Before Creating PR

Run local checks:

```bash
# Lint and tests
npm run lint
npm test

# Type checking
npm run type-check
```

### 2. Create PR

Use descriptive title and body:

```
feat(auth): implement OAuth2 login with Google

- Add Google OAuth2 provider
- Implement token refresh logic
- Add session management
- Include unit tests

Fixes: #123
```

### 3. Bugbot Automatic Review

Bugbot runs automatically on PR creation:

| Check | Severity | Action |
|-------|----------|--------|
| Security scan | 🔴 Critical | Must fix |
| Bug detection | 🟡 High | Should fix |
| Style issues | 🟢 Low | Nice to fix |

### 4. Review Checklist

- [ ] Bugbot checks passing
- [ ] Self-review completed
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] Breaking changes documented

## Manual Bugbot Trigger

```
@bugbot review
```

Or in PR description:
```
/bugbot review --strict
```

## Review Categories

### Security (Critical)
- SQL injection risks
- XSS vulnerabilities
- Hardcoded secrets
- Unsafe deserialization
- Authentication bypasses

### Bugs (High)
- Null pointer risks
- Race conditions
- Logic errors
- Resource leaks
- Error handling gaps

### Style (Low)
- Naming conventions
- Code formatting
- Comment quality
- Test coverage
- Documentation

## Responding to Bugbot

### Accept Suggestion
```
@bugbot apply
```

### Dismiss (with reason)
```
@bugbot dismiss -r "This is intentional for X reason"
```

### Ask for clarification
```
@bugbot explain
```

## Integration with Cursor Workflow

### Pre-PR Review
```
/review-hooks      # Check local hooks
/test-coverage     # Verify coverage
/performance-check # Check for regressions
```

### Post-Bugbot
```
If issues found:
  → Fix in Cursor
  → Commit amend
  → Push
  → Bugbot re-runs automatically
```

## PR Templates

Create `.github/pull_request_template.md`:

```markdown
## Description
[What and why]

## Changes
- [ ] Feature
- [ ] Bug fix
- [ ] Refactor

## Checklist
- [ ] Bugbot review requested
- [ ] Self-review completed
- [ ] Tests passing
- [ ] Documentation updated

## Related
Fixes: #
Relates to: #
```

## Best Practices

1. **Small PRs** - Easier to review, faster feedback
2. **Clear descriptions** - Context for reviewers
3. **Screenshots** - For UI changes
4. **Test evidence** - Proof of testing
5. **Link issues** - Traceability

## Metrics

Track review effectiveness:
- Bugbot issues caught pre-merge
- Review turnaround time
- Post-merge bug rate

## Configuration

Enable in repository settings:
- Settings → Security → Bugbot
- Configure severity thresholds
- Set auto-merge policies
