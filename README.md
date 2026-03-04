# Blaze Dev Kit

**Blaze Commerce Claude Code Development Kit** - A deployable AI-powered WordPress toolkit for Kinsta-hosted sites.

## What is the Blaze Dev Kit?

The Blaze Dev Kit is a portable `.claude/` configuration package that transforms Claude Code into a WordPress expert for your Kinsta-hosted site. It includes safety hooks, maintenance automation, performance optimization, security auditing, and specialist AI agents - all pre-configured and ready to deploy.

## Services Covered

| Service | Command | Description |
|---------|---------|-------------|
| **WordPress Maintenance (WPM)** | `/wpm` | Automated core, plugin, and theme updates with maintenance mode |
| **Site Optimization** | `/pagespeed`, `/accessibility`, `/bestpractices` | Autonomous performance optimization targeting 90+ Lighthouse scores |
| **Web Development** | Skills + Agents | Full WordPress development with safety guardrails |
| **SEO & Marketing** | Skills | Technical SEO auditing and optimization |

## Quick Start

### For Developers (Site Deployment)

1. **Download** the latest `blaze-dev-kit-vX.X.X.zip` from [Releases](../../releases)
2. **Upload** the zip to your Kinsta site root via SFTP/SSH
3. **Extract** the zip:
   ```bash
   cd ~/public
   unzip blaze-dev-kit-vX.X.X.zip
   ```
4. **Verify** the `.claude/` folder exists in your site root
5. **Delete** the zip file:
   ```bash
   rm blaze-dev-kit-vX.X.X.zip
   ```
6. **Initialize** Claude Code:
   ```bash
   claude
   /init
   ```
   This generates a site-specific `CLAUDE.md` with your site's details.
7. **Start working** - run `/wpm`, `/pagespeed`, or any available command.

### Checking for Updates

```bash
.claude/scripts/check-version.sh
```

### Updating an Existing Installation

```bash
.claude/scripts/update-dev-kit.sh
```

This performs a **non-destructive update** - framework files are updated, site-specific files (CLAUDE.md, local configs) are preserved.

## What's Inside the Kit

```
.claude/
├── settings.json          # Claude Code permissions and hook registration
├── hooks/                 # Safety enforcement (blocks dangerous commands)
├── commands/              # Slash commands (/wpm, /init, /pagespeed, etc.)
├── skills/                # Specialist knowledge (WordPress, PHP, security, etc.)
├── agents/                # AI subagents (performance, security, WooCommerce, etc.)
├── scripts/               # Shell tools (maintenance, testing, cache clearing)
└── templates/             # CLAUDE.md templates and service-specific bases
```

## Documentation

Full documentation: **[blaze-commerce.github.io/blaze-dev-kit](https://blaze-commerce.github.io/blaze-dev-kit/)**

## Version

Current version: **v0.1.0**

Check the [CHANGELOG](CHANGELOG.md) for release history.

## Architecture

This repository separates concerns into four categories:

| Label | Directory | Purpose |
|-------|-----------|---------|
| `[DEPLOY]` | `deploy/` | Files packaged into the downloadable zip |
| `[DOCS]` | `docs/` | MkDocs Material site deployed to GitHub Pages |
| `[QA]` | `qa/` | Playwright visual regression tests (local only) |
| `[REPO]` | Root + `scripts/` + `.github/` | CI/CD, repo maintenance, contribution guides |

See [FILE_MAPPING.md](FILE_MAPPING.md) for the complete file inventory.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for branch strategy, PR workflow, and code standards.

**All changes require PR approval from repository maintainers.**

## License

Proprietary - Blaze Commerce. All rights reserved.
