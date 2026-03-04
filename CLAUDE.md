# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Blaze Dev Kit is a deployable `.claude/` configuration package that transforms Claude Code into a WordPress expert for Kinsta-hosted sites. The repo itself is NOT a WordPress site — it builds and maintains the toolkit that gets deployed to sites.

## Repository Layout (4 Categories)

| Label | Directory | Purpose |
|-------|-----------|---------|
| `[DEPLOY]` | `deploy/` | Contents of the downloadable zip — becomes `.claude/` on target sites |
| `[DOCS]` | `docs/` | MkDocs Material site → GitHub Pages |
| `[QA]` | `qa/` | Playwright visual regression tests (local only) |
| `[REPO]` | Root, `.github/`, `scripts/`, `eval/` | CI/CD, repo maintenance — never deployed |

**File placement is enforced by CI** (`verify-pr.yml` + `FILE_MAPPING.md`). Deploy files go in `deploy/`, docs in `docs/`, tests in `qa/`. No exceptions.

## Key Commands

```bash
# Build deploy zip
./scripts/create-deploy-zip.sh        # Outputs blaze-dev-kit-vX.X.X.zip

# Verify zip contents match FILE_MAPPING.md
./scripts/verify-deploy-zip.sh blaze-dev-kit-vX.X.X.zip

# Scaffold a new skill
./scripts/scaffold-skill.sh skill-name

# Serve docs locally
cd docs && pip install -r requirements.txt && mkdocs serve

# Run QA tests (requires Playwright setup)
cd qa && npx playwright test
```

## Deploy Kit Architecture (`deploy/.claude/`)

The zip contains a `.claude/` folder with these components:

- **2 hooks** (`hooks/PreToolUse/`) — Safety enforcement. `block-dangerous-commands.sh` prevents destructive ops, `block-protected-files.sh` prevents WordPress core edits. Exit code 2 = blocked.
- **9 commands** (`commands/`) — Slash commands like `/init`, `/wpm`, `/pagespeed`. YAML frontmatter + procedural markdown.
- **14 skills** (`skills/`) — 3-layer router pattern. `wordpress-router` classifies intent and routes to 13 specialist skills. Each skill has YAML frontmatter + Procedure + Verification + Failure Modes + Escalation sections.
- **7 agents** (`agents/`) — Subagents with model routing: opus (orchestrator, migration), sonnet (security, performance, WooCommerce), haiku (read-only auditors).
- **9 scripts** (`scripts/`) — Shell automation for maintenance, caching, PageSpeed API, version checking, self-update.
- **6 templates** (`templates/`) — `/init` command uses these to generate site-specific CLAUDE.md files. `CLAUDE.md.template` is the main template; `CLAUDE-BASE-*.md` files are service-specific sections.

### Router Pattern

```
User request → wordpress-router (runs detect-wp-project.sh) → maps intent to specialist skill
```

The router runs deterministic WP-CLI queries to gather site context, then routes to the appropriate specialist based on task classification.

### No CLAUDE.md in the Zip

This is intentional. The `/init` command generates a site-specific CLAUDE.md from templates + live WP-CLI data (site name, PHP version, plugins, theme, etc.). The zip must never contain a CLAUDE.md.

## Branching and PRs

```
main (protected) ← develop (protected) ← feature|fix|docs|chore|qa branches
```

- Branch off `develop`, name as `{type}/{short-description}`
- PRs require CODEOWNER approval (@jarutosurano or @jaborjkath)
- Branches auto-delete after merge
- Conventional commits: `type(scope): description`
- PR template requires: category label, what/why, testing, FILE_MAPPING.md impact

## Versioning

Semantic versioning in `deploy/VERSION` and root `VERSION`:
- **MAJOR**: Breaking changes to deploy structure or `/init` behavior
- **MINOR**: New skills, commands, agents, or scripts
- **PATCH**: Bug fixes, docs, minor improvements

Tagging a version (e.g., `v0.1.0`) triggers `release.yml` which builds the zip and creates a GitHub Release.

## Code Standards

- Shell scripts: `set -euo pipefail`, shellcheck-compliant
- Skills/Commands: Must include YAML frontmatter + all mandatory sections (see existing files for format)
- Agents: Must specify name, description, tools list, and model in YAML frontmatter
- `FILE_MAPPING.md` is the single source of truth for file inventory — auto-updated by CI on merges to main

## Important Constraints

- **Kinsta hosting assumed everywhere** — all scripts, skills, and agents target Kinsta's environment
- **The deploy zip is the product** — treat `deploy/` contents as production artifacts
- **Non-destructive updates** — `update-dev-kit.sh` uses rsync to preserve site-specific files (CLAUDE.md, CHANGELOG.md, local configs)
- **Eval scenarios** in `eval/scenarios/` are JSON files with expected_behavior and success_criteria arrays — used to validate skill quality
