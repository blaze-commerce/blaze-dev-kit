# File Mapping - Blaze Dev Kit

> **Single Source of Truth** - Auto-updated by GitHub Actions on every merge to `main`.
> Last updated: 2026-03-04 | Version: v0.1.0

This document maps every file in the repository to its deployment category.
It is used by `scripts/verify-deploy-zip.sh` to validate releases and by
CI to enforce file placement rules.

## Categories

| Label | Directory | Destination |
|-------|-----------|-------------|
| `[DEPLOY]` | `deploy/` | Packaged into `blaze-dev-kit-vX.X.X.zip` → deployed to Kinsta sites as `.claude/` |
| `[DOCS]` | `docs/` | Built and deployed to GitHub Pages via MkDocs Material |
| `[QA]` | `qa/` | Playwright visual regression tests - runs locally, never deployed |
| `[REPO]` | Root, `.github/`, `scripts/`, `eval/` | Repository maintenance - never deployed or published |

---

## [DEPLOY] Files

These files are included in the downloadable zip. After extraction, they become the `.claude/` directory on a Kinsta site.

### Core Configuration
| File | Purpose |
|------|---------|
| `deploy/VERSION` | Kit version identifier |
| `deploy/.claude/settings.json` | Claude Code permissions and hook registration |

### Hooks
| File | Purpose |
|------|---------|
| `deploy/.claude/hooks/PreToolUse/block-dangerous-commands.sh` | Blocks destructive bash commands |
| `deploy/.claude/hooks/PreToolUse/block-protected-files.sh` | Blocks edits to WordPress core files |

### Commands (Slash Commands)
| File | Purpose |
|------|---------|
| `deploy/.claude/commands/init.md` | `/init` - Generate site-specific CLAUDE.md |
| `deploy/.claude/commands/wpm.md` | `/wpm` - WordPress maintenance update workflow |
| `deploy/.claude/commands/pagespeed.md` | `/pagespeed {url}` - Autonomous performance optimization |
| `deploy/.claude/commands/pagespeed-recommend.md` | `/pagespeed-recommend {url}` - Advisory performance audit |
| `deploy/.claude/commands/accessibility.md` | `/accessibility {url}` - Autonomous accessibility fixes |
| `deploy/.claude/commands/accessibility-recommend.md` | `/accessibility-recommend {url}` - Advisory accessibility audit |
| `deploy/.claude/commands/bestpractices.md` | `/bestpractices {url}` - Autonomous best practices fixes |
| `deploy/.claude/commands/bestpractices-recommend.md` | `/bestpractices-recommend {url}` - Advisory best practices audit |
| `deploy/.claude/commands/version-check.md` | `/version-check` - Check for kit updates |

### Skills (3-Layer Structure)
| Directory | Purpose |
|-----------|---------|
| `deploy/.claude/skills/wordpress-router/` | Entry-point: classifies project, routes to skills |
| `deploy/.claude/skills/wordpress-master/` | WordPress/WooCommerce architecture expertise |
| `deploy/.claude/skills/php-pro/` | Modern PHP and WordPress coding standards |
| `deploy/.claude/skills/security-auditor/` | Security audit checklists and vulnerability patterns |
| `deploy/.claude/skills/database-administrator/` | MySQL optimization and WP database management |
| `deploy/.claude/skills/senior-architect/` | Architectural decision framework |
| `deploy/.claude/skills/wp-performance/` | Performance diagnostics and optimization |
| `deploy/.claude/skills/wp-block-development/` | Gutenberg block creation |
| `deploy/.claude/skills/wp-block-themes/` | Block theme structure and theme.json |
| `deploy/.claude/skills/wp-plugin-development/` | Plugin architecture and best practices |
| `deploy/.claude/skills/wp-rest-api/` | REST API endpoints and authentication |
| `deploy/.claude/skills/wp-interactivity-api/` | Client-side interactivity directives |
| `deploy/.claude/skills/wp-wpcli-ops/` | WP-CLI operations and safety protocols |
| `deploy/.claude/skills/wp-playground/` | WordPress Playground for local testing |

### Agents (Subagents)
| File | Model | Purpose |
|------|-------|---------|
| `deploy/.claude/agents/wp-orchestrator.md` | opus | Meta-agent: routes tasks to specialists |
| `deploy/.claude/agents/wp-theme-auditor.md` | haiku | Read-only theme analysis |
| `deploy/.claude/agents/wp-plugin-auditor.md` | haiku | Read-only plugin analysis |
| `deploy/.claude/agents/wp-security-auditor.md` | sonnet | Security vulnerability scanning |
| `deploy/.claude/agents/wp-performance-optimizer.md` | sonnet | Performance implementation |
| `deploy/.claude/agents/wp-woo-specialist.md` | sonnet | WooCommerce expertise |
| `deploy/.claude/agents/wp-migration-specialist.md` | opus | Site migration workflows |

### Scripts
| File | Purpose |
|------|---------|
| `deploy/.claude/scripts/blz-wpm.sh` | WordPress maintenance automation via SSH |
| `deploy/.claude/scripts/update-premium-plugins.sh` | Premium plugin management from private repo |
| `deploy/.claude/scripts/pagespeed.sh` | PageSpeed Insights API testing (multi-run average) |
| `deploy/.claude/scripts/accessibility.sh` | Accessibility audit via PSI API |
| `deploy/.claude/scripts/bestpractices.sh` | Best practices audit via PSI API |
| `deploy/.claude/scripts/validate.sh` | Live page validation via Browserless.io |
| `deploy/.claude/scripts/clear-cache.sh` | Perfmatters + Kinsta cache clear and warm |
| `deploy/.claude/scripts/check-version.sh` | Compare local version against latest release |
| `deploy/.claude/scripts/update-dev-kit.sh` | Non-destructive self-updater |

### Templates
| File | Purpose |
|------|---------|
| `deploy/.claude/templates/CLAUDE.md.template` | Main template for /init CLAUDE.md generation |
| `deploy/.claude/templates/CLAUDE-BASE-WPM.md` | WPM service-specific base instructions |
| `deploy/.claude/templates/CLAUDE-BASE-PERFORMANCE.md` | Performance service-specific base instructions |
| `deploy/.claude/templates/CLAUDE-BASE-WEBDEV.md` | Web development service-specific base instructions |
| `deploy/.claude/templates/CLAUDE-BASE-SEO.md` | SEO/Marketing service-specific base instructions |
| `deploy/.claude/templates/CHANGELOG.md.template` | Template for per-site changelog generation |

---

## [DOCS] Files

MkDocs Material site source. Built and deployed to GitHub Pages.

| File/Directory | Purpose |
|----------------|---------|
| `docs/mkdocs.yml` | MkDocs Material configuration |
| `docs/requirements.txt` | Python dependencies |
| `docs/docs/index.md` | Homepage |
| `docs/docs/getting-started/` | Installation, initialization, requirements |
| `docs/docs/services/` | WPM, optimization, development, SEO docs |
| `docs/docs/workflows/` | Dev setup, updating, contributing, releasing |
| `docs/docs/reference/` | Commands, skills, agents, scripts, file mapping |
| `docs/docs/roadmap/` | Product roadmap |
| `docs/docs/faq/` | Frequently asked questions |
| `docs/docs/sites/` | Per-client site documentation |

---

## [QA] Files

Playwright visual regression tests. Run locally on developer machines, never deployed.

| File/Directory | Purpose |
|----------------|---------|
| `qa/config/` | Playwright configuration |
| `qa/shared/utils/` | Test helpers and utilities |
| `qa/shared/selectors/` | WooCommerce CSS selectors |
| `qa/sites/` | Per-site test suites and baselines |

---

## [REPO] Files

Repository maintenance files. Never deployed or published.

| File | Purpose |
|------|---------|
| `README.md` | Repository overview |
| `FILE_MAPPING.md` | This file - single source of truth |
| `VERSION` | Repo-level version |
| `CHANGELOG.md` | Release history |
| `CONTRIBUTING.md` | Contribution guide |
| `LICENSE` | License |
| `.gitignore` | Git ignore rules |
| `.github/CODEOWNERS` | Required reviewers |
| `.github/PULL_REQUEST_TEMPLATE.md` | PR template |
| `.github/workflows/release.yml` | Build deploy zip on version tag |
| `.github/workflows/deploy-docs.yml` | Build + deploy GitHub Pages |
| `.github/workflows/security-check.yml` | Secret scanning and validation |
| `.github/workflows/update-mapping.yml` | Auto-update this file |
| `.github/workflows/verify-pr.yml` | Enforce file placement rules |
| `scripts/create-deploy-zip.sh` | Build versioned deploy zip |
| `scripts/verify-deploy-zip.sh` | Validate zip against this file |
| `scripts/scaffold-skill.sh` | Generate new skill from template |
| `eval/scenarios/` | Skill evaluation test scenarios |
