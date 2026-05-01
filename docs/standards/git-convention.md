# Git Convention

Git workflow and commit message standards.

---

## Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

## Types

| Type | Use For |
|------|---------|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation only changes |
| `style` | Code style changes (formatting, semicolons, etc.) |
| `refactor` | Code change that neither fixes bug nor adds feature |
| `test` | Adding or correcting tests |
| `chore` | Build process, tooling, dependencies |

## Examples

```
feat(auth): implement JWT-based authentication

fix(api): resolve race condition in user lookup
- Add mutex for concurrent access
- Add test for race condition

docs(readme): update installation instructions

refactor(utils): extract date formatting to helper
- Reduces duplication across 4 files
- Adds unit tests for edge cases

chore(deps): upgrade TypeScript to 5.2
```

## Subject Rules

- Use imperative mood: "add" not "added"
- No period at end
- Max 50 characters
- Describe what changed, not why (why goes in body)

## Body Rules

- Wrap at 72 characters
- Explain what and why, not how
- Reference issues: `Fixes #123`, `Relates to #456`

## Scope Guidelines

Common scopes:
- `api` — API routes/handlers
- `ui` — User interface
- `auth` — Authentication
- `db` — Database
- `test` — Tests
- `deps` — Dependencies
- `config` — Configuration
- `ci` — CI/CD

## Branch Naming

| Pattern | Use For |
|---------|---------|
| `feat/description` | New features |
| `fix/description` | Bug fixes |
| `refactor/description` | Refactoring |
| `docs/description` | Documentation |
| `chore/description` | Maintenance |

## Workflow

### Before Commit

1. Stage changes: `git add`
2. Review diff: `git diff --staged`
3. Ensure quality: All tests pass, lint clean

### Commit

```bash
# Good
 git commit -m "feat(auth): add password reset flow"

# Bad
 git commit -m "update"  # ❌ Too vague
 git commit -m "fixed stuff"  # ❌ Past tense, no scope
```

### Before Push

- [ ] All tests pass
- [ ] Code reviewed (if required)
- [ ] Documentation updated
- [ ] No secrets in code

### After Push

- Update related issues
- Notify team if significant change
- Monitor for issues

## Reverting

```bash
# Revert specific commit
git revert abc123

# Revert but don't commit yet
git revert -n abc123
```

---

*Applies to: All Git operations*
