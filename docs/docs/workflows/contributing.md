---
icon: material/source-pull
---

# Contributing

How to contribute changes to the Blaze Dev Kit repository.

## Branch Strategy

```mermaid
graph LR
    F[feature/branch] -->|PR| D[develop]
    D -->|PR when stable| M[main]
    M -->|tag v2.1.0| R[Release]
```

| Branch | Purpose | Protection |
|--------|---------|------------|
| `main` | Production-ready releases | PR + CODEOWNER approval required |
| `develop` | Integration and testing | PR + 1 approval required |
| `feature/*` | Individual work | No protection |
| `fix/*` | Bug fixes | No protection |
| `docs/*` | Documentation changes | No protection |
| `chore/*` | Maintenance tasks | No protection |

## Making Changes

### 1. Create Your Branch

```bash
git checkout develop
git pull origin develop
git checkout -b feature/your-description
```

### 2. Make Changes in the Correct Directory

| Change Type | Directory |
|-------------|-----------|
| Kit files (hooks, skills, commands, etc.) | `deploy/` |
| Documentation | `docs/` |
| Tests | `qa/` |
| CI/CD, repo scripts | `.github/`, `scripts/` |

!!! danger "File Placement is Enforced"
    The `verify-pr.yml` GitHub Action will **reject your PR** if files are in the wrong directory. Check [FILE_MAPPING.md](https://github.com/blaze-commerce/blaze-dev-kit/blob/main/FILE_MAPPING.md) if unsure.

### 3. Commit with Conventional Commits

```bash
git commit -m "feat(wpm): add Slack notification for failed updates"
git commit -m "fix(hooks): correct regex in block-protected-files"
git commit -m "docs(installation): add Kinsta SSH troubleshooting"
```

### 4. Push and Create PR

```bash
git push -u origin feature/your-description
```

Then create a PR to `develop` using the [PR template](https://github.com/blaze-commerce/blaze-dev-kit/blob/main/.github/PULL_REQUEST_TEMPLATE.md).

### 5. Get Approval

All PRs require approval from a CODEOWNER:

- **@jarutosurano** (Jaru)
- **@jaborjkath** (Jax)

### 6. Merge

After approval + CI checks pass, the PR can be merged. Your branch auto-deletes after merge.

## Adding a New Skill

Use the scaffold script:

```bash
./scripts/scaffold-skill.sh wp-new-skill
```

This generates the proper structure:

```
deploy/.claude/skills/wp-new-skill/
├── SKILL.md          # With YAML frontmatter and required sections
└── references/       # For deep-dive docs (optional)
```

## Code Standards

- **Shell scripts**: `shellcheck` compliant, `set -euo pipefail`
- **Skills**: YAML frontmatter + mandatory sections (When to use, Procedure, Verification, Failure modes, Escalation)
- **Agents**: YAML frontmatter (name, description, tools, model) + structured body
- **Docs**: MkDocs Material markdown with proper frontmatter
