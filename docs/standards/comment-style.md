# Comment Style Guide

Code comment and documentation standards.

---

## Language

- **English** for all code comments and docstrings
- Use Chinese only if English causes ambiguity

## Principles

1. **Why, not what** — Explain intent, not mechanics
2. **Context, not narration** — Business logic over code flow
3. **Fresh, not stale** — Update or delete outdated comments

## Docstrings

### TypeScript/JavaScript

```typescript
/**
 * Calculate subscription discount based on user tenure
 * @param userId - User identifier
 * @param planType - Subscription tier (basic/pro/enterprise)
 * @returns Discount percentage (0-100)
 * @throws {NotFoundError} If user doesn't exist
 */
function calculateDiscount(userId: string, planType: PlanType): number
```

### Python

```python
def calculate_discount(user_id: str, plan_type: PlanType) -> int:
    """
    Calculate subscription discount based on user tenure.
    
    Args:
        user_id: User identifier
        plan_type: Subscription tier (basic/pro/enterprise)
    
    Returns:
        Discount percentage (0-100)
    
    Raises:
        NotFoundError: If user doesn't exist
    """
```

### Go

```go
// CalculateDiscount returns the discount percentage for a user
// based on their subscription plan and account tenure.
// Returns error if user not found.
func CalculateDiscount(userID string, planType PlanType) (int, error)
```

## Bad Comments (Avoid)

```typescript
// ❌ Narrates obvious code
let count = 0; // Initialize counter to zero

// ❌ States what, not why
if (user.isActive) { // Check if user is active

// ❌ Outdated/stale
// TODO: Fix this later (from 2 years ago)

// ❌ Redundant with code
// Increment i by 1
i++;
```

## Good Comments

```typescript
// ✅ Explains business logic
// Users with >12 months tenure get automatic upgrade eligibility

// ✅ Documents workarounds
// HACK: API v2 returns dates in inconsistent formats
// We normalize to ISO 8601 here before validation
// Reference: JIRA-1234

// ✅ Explains constraints
// Must retry within 30s window to maintain session consistency
// with distributed cache invalidation

// ✅ Documents complex algorithms
// Using Floyd's cycle detection algorithm
// Time: O(n), Space: O(1)
```

## Shell Scripts

```bash
#!/bin/bash
# .cursor/hooks/security-gate.sh
# Tier 1 (T1) - Security: beforeShellExecution
# Blocks dangerous commands to prevent irreversible operations
# Exit codes: 0 = pass, 2 = block
```

## File Headers

Start each file with:
- Purpose (one line)
- Key dependencies (if non-obvious)
- Any critical notes

```typescript
/**
 * User authentication service
 * Handles login, registration, token refresh
 * Depends on: Auth0 SDK, Redis (sessions)
 */
```

---

*Applies to: All source files*
