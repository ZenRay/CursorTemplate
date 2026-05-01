---
name: test-generator
description: Generate comprehensive tests for code changes. Use when writing tests or ensuring test coverage.
disable-model-invocation: true
---

# Test Generator

Generate comprehensive tests for code implementations.

## Test Strategy

### What to Test

| Aspect | Test Type | Priority |
|--------|-----------|----------|
| Happy path | Unit test | Required |
| Edge cases | Unit test | Required |
| Error handling | Unit test | Required |
| Integration | Integration test | Recommended |
| User flows | E2E test | For critical paths |

### Test Levels

```
E2E (High)
  └── User flows, critical paths
Integration (Medium)
  └── Component interactions
Unit (Low)
  └── Functions, edge cases
```

## Generation Process

### Step 1: Analyze Code
Read the implementation and identify:
- Public functions/methods
- Input parameters
- Return values
- Error conditions
- Side effects
- Dependencies

### Step 2: Design Test Cases

For each function, design:

| Case | Input | Expected | Purpose |
|------|-------|----------|---------|
| Happy path | Valid input | Expected output | Verify core logic |
| Edge - null | null/undefined | Error/defaults | Null safety |
| Edge - empty | Empty string/array | Expected behavior | Empty input |
| Edge - boundary | Min/max values | Expected behavior | Boundary testing |
| Error - invalid | Invalid input | Error thrown | Error handling |
| Error - exception | Exception case | Graceful handling | Resilience |

### Step 3: Write Tests

Follow project test conventions:
- Test file location (`.test.ts`, `__tests__/`, etc.)
- Naming convention
- Assertion library style
- Mocking approach

Example structure:
```typescript
describe('functionName', () => {
  describe('happy path', () => {
    it('should [expected behavior]', () => {
      // Arrange
      const input = ...;
      
      // Act
      const result = functionName(input);
      
      // Assert
      expect(result).toBe(expected);
    });
  });
  
  describe('edge cases', () => {
    it('should handle [edge case]', () => {
      // ...
    });
  });
  
  describe('error handling', () => {
    it('should throw when [condition]', () => {
      // ...
    });
  });
});
```

### Step 4: Verify Coverage

Check:
- All public functions tested
- All branches covered
- Error paths included
- Edge cases handled

### Step 5: Run Tests

Execute tests and fix failures:
```bash
# Run all tests
npm test

# Run specific test
npm test -- functionName

# Run with coverage
npm test -- --coverage
```

## Test Quality Checklist

- [ ] Tests are deterministic
- [ ] Tests are independent (no shared state)
- [ ] Tests are readable (clear arrange/act/assert)
- [ ] Mock external dependencies
- [ ] Test names describe behavior
- [ ] Assertions are specific
- [ ] No test logic in production code

## Frameworks by Language

| Language | Common Frameworks |
|----------|-------------------|
| TypeScript | Jest, Vitest, Mocha |
| Python | pytest, unittest |
| Go | testing (built-in) |
| Rust | built-in test |

## Best Practices

1. **Test behavior, not implementation**
   - Test what the code does, not how it does it
   
2. **One assertion per test** (mostly)
   - Keeps tests focused and clear
   
3. **Use descriptive names**
   - `it('should return user when valid ID')` not `it('test1')`
   
4. **Mock at boundaries**
   - DB, API, filesystem - not internal functions
   
5. **Maintain tests**
   - Update when requirements change
   - Delete obsolete tests
