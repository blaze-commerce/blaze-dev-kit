---
icon: material/brain
---

# Skills Reference

All specialist knowledge modules in the Blaze Dev Kit.

## Skill Structure

Each skill follows a 3-layer pattern:

```
skills/<skill-name>/
├── SKILL.md          # Short procedural checklist (loaded first)
├── references/       # Deep-dive documentation (loaded on demand)
└── scripts/          # Deterministic helpers (run, don't reason)
```

Every SKILL.md includes YAML frontmatter and mandatory sections:

- **When to use** - Trigger conditions
- **Inputs required** - What's needed before starting
- **Procedure** - Step-by-step checklist
- **Verification** - How to confirm success
- **Failure modes** - Common problems and fixes
- **Escalation** - When to ask a human

## Entry Point

### wordpress-router

The entry-point skill that classifies the project and routes to the correct specialist.

1. Runs deterministic triage (`detect-wp-project.sh`)
2. Classifies project type, theme, plugins, PHP version
3. Routes to the appropriate skill based on task + project type
4. Intent overrides classification (e.g., REST API question in a plugin project → `wp-rest-api`)

## Core Skills

| Skill | Expertise |
|-------|-----------|
| **wordpress-master** | WordPress/WooCommerce architecture, hooks, Blocksy theme, caching |
| **php-pro** | PHP 7.4-8.3+, WordPress coding standards, security patterns |
| **security-auditor** | SQLi, XSS, CSRF, privilege escalation, file permission audits |
| **database-administrator** | MySQL optimization, wp_options, transients, revision management |
| **senior-architect** | Architectural decision framework, code review, trade-off evaluation |

## WordPress-Specific Skills

| Skill | Expertise |
|-------|-----------|
| **wp-performance** | Performance diagnostics, object caching, Core Web Vitals |
| **wp-block-development** | Gutenberg blocks, apiVersion 3, block.json |
| **wp-block-themes** | Block themes, theme.json, templates, style variations |
| **wp-plugin-development** | Plugin architecture, Settings API, data storage |
| **wp-rest-api** | REST endpoints, authentication (cookie/app passwords/OAuth) |
| **wp-interactivity-api** | `data-wp-*` directives, stores, state synchronization |
| **wp-wpcli-ops** | WP-CLI operations, domain migration, multisite admin |
| **wp-playground** | WordPress Playground for rapid local testing |

## How Skills Load

Skills use **progressive disclosure** to respect context window limits:

1. Claude reads `SKILL.md` (short checklist) first
2. Deep-dive `references/` are only loaded when the task requires them
3. `scripts/` are executed, not reasoned about

This keeps token usage efficient while maintaining access to comprehensive knowledge.
