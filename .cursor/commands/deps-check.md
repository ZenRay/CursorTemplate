---
description: Check dependencies for updates, vulnerabilities, and best practices
---

# /deps-check — Dependency Check

Analyze project dependencies for updates, security, and best practices.

## Check Areas

### Security
- Known vulnerabilities (via `npm audit`, `safety`, etc.)
- Outdated packages with security fixes
- Deprecated packages

### Updates
- Major version updates (breaking changes)
- Minor version updates (features)
- Patch updates (bug fixes)

### Best Practices
- Unused dependencies
- Duplicate dependencies
- Alternative lightweight options
- ESM vs CommonJS compatibility

### License Compliance
- Incompatible licenses
- Commercial use restrictions
- Attribution requirements

## Steps

1. **Detect Package Manager**
   - npm / yarn / pnpm (Node.js)
   - pip / poetry / pipenv (Python)
   - cargo (Rust)
   - go mod (Go)

2. **Run Security Audit**
   ```bash
   npm audit
   # or
   pipenv check
   # or
   cargo audit
   ```

3. **Check for Updates**
   ```bash
   npm outdated
   # or
   pip list --outdated
   ```

4. **Identify Unused**
   ```bash
   npx depcheck
   # or analyze imports
   ```

5. **Generate Report**
   ```markdown
   ## Dependency Check Report

   ### Security Issues
   | Package | Severity | Issue | Action |
   |---------|----------|-------|--------|
   | [pkg] | High | CVE-2024-XXXX | Update to v2.1.0 |

   ### Update Recommendations
   | Package | Current | Latest | Priority |
   |---------|---------|--------|----------|
   | [pkg] | 1.0.0 | 2.0.0 | Medium |

   ### Unused Dependencies
   - [pkg]: Can be removed

   ### Suggestions
   - Replace [heavy-pkg] with [lightweight-alt]
   ```

## Update Strategy

### Immediate (Security fixes)
```bash
npm update [vulnerable-pkg]
```

### Planned (Major versions)
- Review breaking changes
- Update dev dependencies first
- Test thoroughly
- Update production dependencies

### Gradual (Minor/patch)
```bash
npm update
```

## When to Run
- Weekly/bi-weekly maintenance
- Before releases
- When adding new dependencies
- Security incident response
