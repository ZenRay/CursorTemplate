---
description: Analyze code for performance issues and optimization opportunities
---

# /performance-check — Performance Analysis

Analyze code for performance bottlenecks and optimization opportunities.

## Analysis Areas

### Algorithm Efficiency
- Time complexity (Big O)
- Nested loops and recursion depth
- Unnecessary computations

### Data Structures
- Appropriate structure selection
- Memory usage patterns
- Object creation overhead

### I/O Operations
- Database query efficiency
- API call batching
- File operation optimization

### Caching
- Cacheable computations
- Redundant data fetching
- Cache invalidation strategy

### Browser/Client (if frontend)
- Render optimization
- Bundle size
- Lazy loading opportunities

## Steps

1. **Identify Target Code**
   - Specific functions/modules
   - Hot paths from profiling
   - User-reported slow operations

2. **Analyze**
   - Read implementation
   - Check complexity
   - Identify bottlenecks
   - Compare with best practices

3. **Generate Report**
   ```markdown
   ## Performance Analysis

   ### Critical Issues
   | Location | Issue | Impact | Fix |
   |----------|-------|--------|-----|
   | [file.ts:42] | O(n²) loop | High | Use Map |

   ### Optimization Opportunities
   | Location | Current | Suggested | Benefit |
   |----------|---------|-----------|---------|
   | [file.ts:55] | Sequential DB calls | Batch | 3x faster |

   ### Quick Wins
   - [ ] [Specific change with low effort, high impact]
   ```

4. **Suggest Improvements**
   - Prioritize by impact/effort
   - Provide code examples
   - Note trade-offs

## When to Run
- Before performance-sensitive releases
- When profiling reveals hotspots
- User reports performance issues
- Code review for performance-critical paths

## Integration
Can delegate to `@explore-enhanced` for deep analysis of complex performance issues.
