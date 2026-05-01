---
description: Analyze and improve test coverage for the codebase
---

# /test-coverage — Test Coverage Analysis

Analyze test coverage and identify gaps.

## Analysis Areas

### Coverage Metrics
- Line coverage percentage
- Branch coverage
- Function coverage
- Uncovered code identification

### Test Quality
- Missing test files
- Empty/placeholder tests
- Tests that don't assert
- Brittle tests (implementation-dependent)

### Critical Paths
- Core business logic coverage
- Error handling coverage
- Edge case coverage
- Integration points

## Steps

1. **Run Coverage Report**
   ```bash
   # JavaScript/TypeScript
   npm test -- --coverage
   
   # Python
   pytest --cov=src --cov-report=html
   
   # Go
   go test -coverprofile=coverage.out ./...
   ```

2. **Analyze Results**
   - Identify low-coverage files (<70%)
   - Find uncovered branches
   - Check critical path coverage

3. **Generate Report**
   ```markdown
   ## Coverage Analysis

   ### Overall: [X]%

   ### Low Coverage Files (< 70%)
   | File | Coverage | Missing | Priority |
   |------|----------|---------|----------|
   | [file.ts] | 45% | Lines 45-89 | High |

   ### Critical Uncovered Paths
   - [file.ts:45]: Error handling in [function]
   - [file.ts:120]: Edge case [condition]

   ### Recommended Tests
   1. [file.ts]:
      - Test: [specific scenario]
      - Assert: [expected outcome]
   ```

4. **Prioritize**
   - High: Core business logic
   - Medium: Error paths
   - Low: Simple getters/setters

## Coverage Goals

| Component | Target | Minimum |
|-----------|--------|---------|
| Core logic | 90% | 80% |
| API handlers | 85% | 70% |
| Utilities | 80% | 60% |
| UI components | 70% | 50% |

## When to Run
- Before releases
- After major refactoring
- Adding new features
- Code review preparation

## Integration
Delegate to `@test-generator` Skill for creating missing tests.
