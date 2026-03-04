# Contributing to Blaze Dev Kit

## Branch Strategy

```
main (protected - release-ready)
  └── develop (protected - integration/staging)
        ├── feature/description    # New features
        ├── fix/description        # Bug fixes
        ├── docs/description       # Documentation changes
        ├── chore/description      # Maintenance tasks
        └── qa/description         # Test additions/updates
```

### How It Works

1. **Create a branch** off `develop` using the naming convention: `{type}/{short-description}`
2. **Make your changes** in the correct directory (see File Placement Rules below)
3. **Open a PR** to `develop` - fill out the PR template completely
4. **Get approval** from a CODEOWNER (@jarutosurano or @jaborjkath)
5. **Merge** - the branch auto-deletes after merge
6. When `develop` is stable, maintainers PR `develop` → `main` for release

### Branch Naming

| Type | Use For | Example |
|------|---------|---------|
| `feature/` | New functionality | `feature/add-seo-skill` |
| `fix/` | Bug fixes | `fix/hook-permission-error` |
| `docs/` | Documentation only | `docs/update-installation-guide` |
| `chore/` | Maintenance, deps | `chore/update-mkdocs-version` |
| `qa/` | Test changes | `qa/add-birdbusta-tests` |

## File Placement Rules

**This is strictly enforced by CI.** Files in the wrong place will fail the PR check.

| Change Type | Directory | Label |
|-------------|-----------|-------|
| Deployable kit files | `deploy/` | `[DEPLOY]` |
| Documentation pages | `docs/` | `[DOCS]` |
| Playwright tests | `qa/` | `[QA]` |
| CI/CD, repo scripts | `.github/`, `scripts/` | `[REPO]` |
| Root configs | Root (`README.md`, etc.) | `[REPO]` |

**Do NOT:**
- Place documentation files inside `deploy/`
- Place test files inside `deploy/`
- Place deploy files outside `deploy/`
- Add files to the root directory without approval

## Commit Messages

Use [Conventional Commits](https://www.conventionalcommits.org/):

```
type(scope): description

feat(wpm): add Slack notification after update
fix(hooks): correct permission check for wp-config
docs(installation): update Kinsta SSH instructions
chore(deps): update MkDocs Material to v9.6
```

## PR Template

Every PR must specify:
1. **Category**: `[DEPLOY]`, `[DOCS]`, `[QA]`, or `[REPO]`
2. **What changed** and why
3. **Testing done**
4. **FILE_MAPPING.md impact** - does this add/remove/move files?

## Semantic Versioning

- **MAJOR** (v1.0.0): Breaking changes to deploy structure or /init behavior
- **MINOR** (v0.2.0): New skills, commands, agents, or scripts
- **PATCH** (v0.1.1): Bug fixes, documentation updates, minor improvements

## Code Standards

- Shell scripts: Use `shellcheck` compliance, `set -euo pipefail`
- Skills/Commands: Must include YAML frontmatter + all mandatory sections
- Agents: Must follow the subagent template format (name, description, tools, model)
