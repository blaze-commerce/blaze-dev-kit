# Changelog

All notable changes to the Blaze Dev Kit will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v0.1.0] - 2026-03-04

### Added
- Initial pre-release combining `claude-wpm` and `blz-performance` repos
- MkDocs Material documentation site with GitHub Pages deployment
- Subagent architecture with specialist WordPress agents
- Router pattern for deterministic project classification
- 3-layer skill structure (SKILL.md + references/ + scripts/)
- Service-specific CLAUDE base templates (WPM, Performance, Web Dev)
- Dynamic CLAUDE.md generation via `/init` command
- Auto-generated site CHANGELOG.md for tracking per-site changes
- Non-destructive version update system (`update-dev-kit.sh`)
- Eval scenarios for skill quality assurance
- `verify-pr.yml` GitHub Action to enforce file placement rules
- `scaffold-skill.sh` for consistent new skill creation
- CODEOWNERS enforcement for all changes
- Comprehensive FAQ and Roadmap in documentation

### Changed
- Restructured from two separate repos into unified `deploy/` boundary
- Skills now use YAML frontmatter and mandatory sections
- FILE_MAPPING.md auto-updates via GitHub Action

### Migration
- See [Migration Guide](https://blaze-commerce.github.io/blaze-dev-kit/workflows/migration/) for upgrading from `claude-wpm` or `blz-performance`
