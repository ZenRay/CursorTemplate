---
name: pr-review
description: Comprehensive pull request review workflow - code, tests, documentation, and impact analysis
disable-model-invocation: true
---

# PR Review Skill

Comprehensive pull request review workflow.

## Review Phases

### Phase 1: Overview
- [ ] Read PR description
- [ ] Understand purpose and scope
- [ ] Check linked issues
- [ ] Note affected areas

### Phase 2: Code Review
- [ ] Logic correctness
- [ ] Code style compliance
- [ ] Error handling
- [ ] Edge cases
- [ ] Security concerns

### Phase 3: Test Review
- [ ] Tests exist for changes
- [ ] Test quality (assertions, coverage)
- [ ] Edge case coverage
- [ ] No brittle tests

### Phase 4: Documentation
- [ ] Code comments updated
- [ ] README/API docs updated (if needed)
- [ ] Changelog entry (if applicable)

### Phase 5: Impact Analysis
- [ ] Breaking changes identified
- [ ] Migration path (if breaking)
- [ ] Performance impact
- [ ] Dependency changes

## Review Output

```markdown
## PR Review: #[Number] - [Title]

### Summary
- **Status**: [Approved / Request Changes / Comment]
- **Scope**: [Files changed]
- **Risk**: [Low/Medium/High]

### 🔴 Must Fix
1. [Issue]: [Description] → [How to fix]

### 🟡 Suggestions
1. [Suggestion]: [Rationale]

### ✅ Good
- [What was done well]

### 📝 Notes
- [Additional context]
```

## Review Checklist

### For Authors
Before requesting review:
- [ ] Self-reviewed
- [ ] Tests pass
- [ ] Lint passes
- [ ] Documentation updated
- [ ] Description explains "why"

### For Reviewers
- [ ] Understand the change
- [ ] Check related tests
- [ ] Verify error handling
- [ ] Consider edge cases
- [ ] Check security (if applicable)
- [ ] Approve or request changes clearly

## Tone Guidelines
- Be constructive
- Explain reasoning
- Suggest alternatives
- Acknowledge good work
- Separate must-fix from nice-to-have

## Automation Integration
- Can delegate to `@verifier` for code verification
- Can delegate to `@security-audit` for security review
- Can use `@test-generator` for test suggestions
