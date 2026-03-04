---
hide:
  - navigation
  - toc
---

# Blaze Dev Kit

<div class="hero" markdown>

**AI-Powered WordPress Development Toolkit**
{ .hero-subtitle }

The Blaze Dev Kit transforms Claude Code into a WordPress expert for your Kinsta-hosted site. Deploy once, and get automated maintenance, performance optimization, security auditing, and specialist AI agents - all pre-configured and ready to work.

<span class="version-badge">v0.1.0</span>

[Get Started](getting-started/installation.md){ .md-button .md-button--primary }
[View on GitHub](https://github.com/blaze-commerce/blaze-dev-kit){ .md-button }

</div>

---

## What You Get

<div class="grid-cards" markdown>

<div class="card" markdown>

### :material-wrench: WordPress Maintenance

Automated core, plugin, and theme updates with maintenance mode, Slack notifications, and premium plugin management.

**Command:** `/wpm`

</div>

<div class="card" markdown>

### :material-speedometer: Site Optimization

Autonomous performance optimization targeting 90+ Lighthouse scores across PageSpeed, Accessibility, and Best Practices.

**Commands:** `/pagespeed` `/accessibility` `/bestpractices`

</div>

<div class="card" markdown>

### :material-code-braces: Web Development

Full WordPress development with safety guardrails, specialist skills for blocks, themes, plugins, REST API, and more.

**Skills:** 14 specialist knowledge modules

</div>

<div class="card" markdown>

### :material-chart-line: SEO & Marketing

Technical SEO auditing, schema markup, and performance-focused optimization for search visibility.

**Skills:** SEO specialist knowledge

</div>

</div>

---

## How It Works

```mermaid
graph LR
    A[Download Kit] --> B[Upload to Kinsta]
    B --> C[Extract .claude/]
    C --> D[Delete zip]
    D --> E[Run /init]
    E --> F[Claude Code Ready]
```

1. **Download** the latest release zip from GitHub
2. **Upload** to your Kinsta site root
3. **Extract** - creates the `.claude/` directory
4. **Initialize** - run `/init` to generate a site-specific `CLAUDE.md`
5. **Work** - use any command: `/wpm`, `/pagespeed`, `/accessibility`, and more

---

## Architecture

The kit includes:

| Component | Count | Purpose |
|-----------|-------|---------|
| **Safety Hooks** | 2 | Block destructive commands and protected file edits |
| **Commands** | 9 | Slash commands for maintenance, optimization, auditing |
| **Skills** | 14 | Specialist knowledge modules (WordPress, PHP, security, etc.) |
| **Agents** | 7 | AI subagents with model routing (opus/sonnet/haiku) |
| **Scripts** | 9 | Shell tools for testing, caching, updating |
| **Templates** | 6 | Service-specific bases for CLAUDE.md generation |

---

## Repository Structure

The Blaze Dev Kit repo separates concerns into four strictly enforced categories:

```
blaze-dev-kit/
├── deploy/                          # [DEPLOY] Packaged into downloadable zip
│   └── .claude/
│       ├── settings.json            # Claude Code permissions + hooks
│       ├── hooks/PreToolUse/        # Safety enforcement (2 hooks)
│       ├── commands/                # Slash commands (9 commands)
│       ├── skills/                  # Specialist knowledge (14 skills)
│       ├── agents/                  # AI subagents (7 agents)
│       ├── scripts/                 # Shell tools (9 scripts)
│       └── templates/               # CLAUDE.md + service bases (6 templates)
│
├── docs/                            # [DOCS] MkDocs Material → GitHub Pages
│   └── docs/
│       ├── getting-started/         # Installation, init, requirements
│       ├── services/                # WPM, optimization, dev, SEO
│       ├── workflows/               # Setup, updating, contributing, releasing
│       ├── reference/               # Commands, skills, agents, scripts
│       ├── roadmap/                 # Product roadmap
│       └── faq/                     # Frequently asked questions
│
├── qa/                              # [QA] Playwright visual regression (local only)
├── eval/                            # [REPO] Skill evaluation scenarios
├── scripts/                         # [REPO] Zip builder, verifier, scaffolder
├── .github/                         # [REPO] CI/CD workflows, CODEOWNERS
│
├── FILE_MAPPING.md                  # Single source of truth (auto-updated)
├── VERSION                          # v0.1.0
├── CHANGELOG.md                     # Release history
├── CONTRIBUTING.md                  # Branch strategy + PR workflow
└── README.md                        # Repo overview
```

!!! info "File Mapping"
    The [FILE_MAPPING.md](https://github.com/blaze-commerce/blaze-dev-kit/blob/main/FILE_MAPPING.md) is the **single source of truth** for every file in the repo. It auto-updates via GitHub Actions on every merge to `main` and is used by CI to enforce file placement rules. See the full [File Mapping Reference](reference/file-mapping.md).

---

## Built for Kinsta

Every component is designed for WordPress sites hosted on Kinsta:

- Cache clearing respects Kinsta's infrastructure (no `wp kinsta cache purge`)
- SSH-based workflows for remote site management
- Perfmatters + Kinsta cache coordination
- Cloudflare CDN-aware performance testing

---

<div style="text-align: center; padding: 2rem 0;" markdown>

**Ready to get started?**

[Installation Guide](getting-started/installation.md){ .md-button .md-button--primary }

</div>
