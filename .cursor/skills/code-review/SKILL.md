---
name: code-review
description: Structured code review following team standards. Use when reviewing code, PRs, or changes.
disable-model-invocation: true
---

# Code Review

Perform structured code review following project standards.

## Review Checklist

### Correctness
- [ ] Logic is correct
- [ ] Edge cases handled
- [ ] Error paths covered
- [ ] No obvious bugs

### Security
- [ ] Input validation present
- [ ] No injection vulnerabilities
- [ ] No hardcoded secrets
- [ ] Proper error handling (no info leak)

### Quality
- [ ] Code follows project conventions
- [ ] Functions appropriately sized
- [ ] Naming is clear
- [ ] Comments explain "why", not "what"

### Maintainability
- [ ] Code is readable
- [ ] Not overly complex
- [ ] Test coverage adequate
- [ ] Documentation updated

## Review Process

### 1. Understand Context
- Read related files
- Understand the change purpose
- Check requirements/ticket

### 2. Review Files
Go through each file changed:
- Check logic correctness
- Verify standards compliance
- Look for security issues
- Check test coverage

### 3. Categorize Findings

| Severity | Action Required | Example |
|----------|-----------------|---------|
| 🔴 Critical | Must fix before merge | Security vulnerability |
| 🟡 Warning | Should fix, can discuss | Code smell |
| 🟢 Suggestion | Optional improvement | Refactoring idea |

### 4. Provide Feedback

Format feedback as:
```
## Review: [File/Feature]

### 🔴 Critical
1. [Issue]: [Explanation] - Suggest: [Fix]

### 🟡 Warnings
1. [Issue]: [Explanation] - Consider: [Improvement]

### 🟢 Suggestions
1. [Idea]: [Rationale]

### ✅ Good
- [What was done well]
```

### 5. Follow Up
- Address responses
- Re-review after changes
- Approve when satisfied

## Special Cases

### Security Review
For auth/data handling changes, also check:
- Authentication flow
- Authorization checks
- Data sanitization
- Audit logging

### Performance Review
For performance-critical changes:
- Algorithm complexity
- Query efficiency
- Resource usage
- Caching strategy

### API Review
For API changes:
- Backward compatibility
- Documentation accuracy
- Error response format
- Rate limiting

## Tone Guidelines

- Be constructive, not critical
- Explain why, not just what
- Suggest specific improvements
- Acknowledge good practices
