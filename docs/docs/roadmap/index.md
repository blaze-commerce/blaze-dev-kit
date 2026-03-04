---
icon: material/map-marker-path
---

# Roadmap

The Blaze Dev Kit development roadmap. Items are organized by status and priority.

---

## Completed

!!! success "Released in v0.1.0"

- [x] **Unified Repository** - Merged `claude-wpm` and `blz-performance` into single repo
- [x] **Deploy/Docs Separation** - Clear boundary between deployable kit and documentation
- [x] **Safety Hooks** - `block-dangerous-commands.sh` and `block-protected-files.sh`
- [x] **WPM Command** - `/wpm` for full maintenance workflow
- [x] **Performance Commands** - `/pagespeed`, `/accessibility`, `/bestpractices` (autonomous + advisory)
- [x] **14 Specialist Skills** - WordPress, PHP, security, database, architecture, and more
- [x] **7 AI Agents** - Orchestrator, auditors, and specialists with model routing
- [x] **Dynamic /init** - Auto-generates site-specific CLAUDE.md via WP-CLI triage
- [x] **Non-Destructive Updates** - `update-dev-kit.sh` with backup and rsync
- [x] **MkDocs Material Docs** - Full documentation on GitHub Pages
- [x] **FILE_MAPPING.md** - Auto-updated single source of truth
- [x] **Branch Protection** - CODEOWNERS, PR requirements, CI enforcement
- [x] **Version Tracking** - `check-version.sh` for site version comparison

---

## In Progress

!!! info "Currently Being Worked On"

- [ ] **Migrate Existing Sites** - Update all current Kinsta sites from old repos to Blaze Dev Kit v0.1.0
- [ ] **QA Framework Integration** - Port Playwright visual regression tests from `claude-wpm`
- [ ] **Eval Scenarios** - JSON test files for validating skill behavior
- [ ] **Premium Plugin Registry** - Formalize the private premium plugin repo workflow

---

## Planned - Next Release (v0.2.0)

!!! note "Targeting Q2 2026"

- [ ] **`/seo-audit` Command** - Dedicated technical SEO auditing command
- [ ] **`wp-seo-specialist` Agent** - SEO-focused subagent
- [ ] **Scaffold Script** - `scaffold-skill.sh` for consistent new skill creation
- [ ] **Per-Site Config** - `.claude/config.local.json` for site-specific overrides (gitignored)
- [ ] **Slack Integration Enhancement** - Rich notifications with before/after metrics
- [ ] **Multi-Site Batch Operations** - Run commands across multiple Kinsta sites

---

## Planned - Future Releases

!!! abstract "Backlog"

- [ ] **`/deploy` Command** - Automated staging-to-production deployment workflow
- [ ] **`/backup` Command** - Kinsta backup management via API
- [ ] **WooCommerce Audit** - Dedicated `/woo-audit` for store health checks
- [ ] **Client Dashboard** - Site health overview across all managed sites
- [ ] **Automated Scheduling** - Cron-based `/wpm` execution
- [ ] **A/B Performance Testing** - Compare optimization strategies
- [ ] **Custom Skill Marketplace** - Team members can contribute and share custom skills
- [ ] **Plugin Compatibility Matrix** - Track which plugin versions work together
- [ ] **Automated Visual Regression** - Trigger QA tests after maintenance updates

---

## Ideas & Research

!!! question "Under Consideration"

- [ ] Cross-platform packaging (Cursor, Copilot support alongside Claude Code)
- [ ] MCP server integration for real-time WordPress data
- [ ] AI-powered changelog generation from git diffs
- [ ] Kinsta API integration for direct hosting management
- [ ] Client-facing reports (PDF generation from optimization results)

---

## How to Suggest Features

1. Create a branch: `feature/your-idea`
2. Add details to the appropriate section in this roadmap
3. Open a PR to `develop`
4. Discuss with the team during review

Or raise it directly with @jarutosurano or @jaborjkath.
