---
icon: material/code-braces
---

# Web Development

The Web Development service provides Claude Code with comprehensive WordPress development expertise through specialist skills and agents.

## Available Skills

| Skill | Expertise |
|-------|-----------|
| `wordpress-master` | WordPress/WooCommerce architecture, hooks, Blocksy theme |
| `php-pro` | Modern PHP 7.4-8.3+, WordPress coding standards, security |
| `security-auditor` | Full security audit: SQLi, XSS, CSRF, privilege escalation |
| `database-administrator` | MySQL optimization, wp_options, transients, revisions |
| `senior-architect` | Architectural decision framework and code review |
| `wp-block-development` | Gutenberg block creation, apiVersion 3 |
| `wp-block-themes` | Block themes, theme.json, templates, style variations |
| `wp-plugin-development` | Plugin architecture, Settings API, data storage |
| `wp-rest-api` | REST endpoints, authentication strategies |
| `wp-interactivity-api` | Client-side directives, stores, hydration |
| `wp-wpcli-ops` | WP-CLI operations, domain migration, multisite |
| `wp-playground` | WordPress Playground for local testing |

## Available Agents

| Agent | Model | Specialty |
|-------|-------|-----------|
| `wp-orchestrator` | opus | Routes complex tasks to the right specialist |
| `wp-theme-auditor` | haiku | Read-only theme analysis (fast, cheap) |
| `wp-plugin-auditor` | haiku | Read-only plugin analysis (fast, cheap) |
| `wp-security-auditor` | sonnet | Security vulnerability scanning |
| `wp-woo-specialist` | sonnet | WooCommerce-specific development |
| `wp-migration-specialist` | opus | Complex site migration workflows |

## Router Pattern

The `wordpress-router` skill acts as the entry point. When Claude encounters a development task:

1. **Triage script runs** - deterministically detects project type, theme, plugins, PHP version
2. **Router classifies** - maps the task to the correct skill(s)
3. **Specialist executes** - the appropriate skill handles the task

This ensures Claude never guesses your stack - it knows it.

## Safety Guardrails

All development work is protected by:

- **block-dangerous-commands.sh** - Prevents `rm -rf`, `DROP DATABASE`, etc.
- **block-protected-files.sh** - Prevents editing `wp-includes/`, `wp-admin/`, `wp-config.php`, parent themes

## Coding Conventions

- Function prefix: `blaze_` for general, `blaze_a11y_` for accessibility, `blaze_bp_` for best practices
- Child theme modifications only (never edit parent theme)
- Code Snippets Pro for small customizations
- Full sanitization, escaping, and nonce verification on all custom code

## File Mapping

```
.claude/
├── skills/
│   ├── wordpress-router/               # Entry-point router
│   │   ├── SKILL.md                    # Classifies intent, routes to specialist
│   │   └── scripts/
│   │       └── detect-wp-project.sh    # Deterministic project triage
│   ├── wordpress-master/SKILL.md       # WordPress/WooCommerce architecture
│   ├── php-pro/SKILL.md               # Modern PHP 8.0+, coding standards
│   ├── senior-architect/SKILL.md       # Architectural decisions, code review
│   ├── security-auditor/SKILL.md       # Security audit, OWASP patterns
│   ├── wp-block-development/SKILL.md   # Gutenberg block creation
│   ├── wp-block-themes/SKILL.md        # Block themes, theme.json
│   ├── wp-plugin-development/SKILL.md  # Plugin architecture, Settings API
│   ├── wp-rest-api/SKILL.md            # REST endpoints, authentication
│   ├── wp-interactivity-api/SKILL.md   # Interactivity API directives
│   ├── wp-wpcli-ops/SKILL.md           # WP-CLI operations, multisite
│   └── wp-playground/SKILL.md          # WordPress Playground testing
│
├── agents/
│   ├── wp-orchestrator.md              # Routes tasks to specialists (opus)
│   ├── wp-theme-auditor.md             # Read-only theme analysis (haiku)
│   ├── wp-plugin-auditor.md            # Read-only plugin analysis (haiku)
│   ├── wp-security-auditor.md          # Vulnerability scanning (sonnet)
│   ├── wp-woo-specialist.md            # WooCommerce development (sonnet)
│   └── wp-migration-specialist.md      # Site migration (opus)
│
└── templates/
    └── CLAUDE-BASE-WEBDEV.md           # Web dev service base template
```
