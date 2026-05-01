---
description: Deep analysis of hooks configuration and effectiveness
---

# /review-hooks — Review Hooks

Analyze the hooks system for coverage, effectiveness, and potential improvements.

## Review Areas

### 1. Security Hooks (T1)
- `security-gate.sh`: Check danger patterns
- `prompt-guard.sh`: Check injection patterns

**Verify:**
- Are all dangerous commands covered?
- Any false positives?
- Exit codes correct (0=pass, 2=block)?

### 2. Quality Hooks (T2)
- `auto-lint.sh`: Linter integration
- `log-failure.sh`: Failure logging

**Verify:**
- All file types covered?
- Linters installed and working?
- Logs written correctly?

### 3. Experience Hooks (T3)
- `notify-done.sh`: Desktop notifications

**Verify:**
- Notifications working on OS?
- Stop reasons handled?

### 4. Knowledge Hooks (T4)
- `knowledge-trigger.sh`: Archive reminders

**Verify:**
- Triggering correctly?
- Message clear?

## Output Format

```
## Hooks Review Report

### Security Analysis
| Hook | Status | Coverage | Notes |
|------|--------|----------|-------|
| security-gate | [OK/Warning] | [List] | [Notes] |
| prompt-guard | [OK/Warning] | [List] | [Notes] |

### Quality Analysis
| Hook | Status | Effectiveness | Notes |
|------|--------|---------------|-------|
| auto-lint | [OK/Warning] | [List] | [Notes] |
| log-failure | [OK/Warning] | [List] | [Notes] |

### Recommendations
1. [Specific improvement]
2. [Specific improvement]

### Missing Coverage
- [What should be added]
```

## Delegate to SubAgent

For thorough review:
```
Delegate to @verifier SubAgent to test each hook with sample inputs
and verify correct behavior.
```
