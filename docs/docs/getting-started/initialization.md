---
icon: material/play-circle
---

# Initialization

After installing the Blaze Dev Kit, run `/init` to configure Claude Code for your specific site.

## What `/init` Does

The `/init` command performs **deterministic site triage** and generates a tailored `CLAUDE.md` file:

1. **Detects your environment** via WP-CLI:
    - WordPress version
    - PHP version
    - Active theme and child theme
    - All installed plugins (active and inactive)
    - Site URL and name
    - WooCommerce status (if applicable)
    - Multisite status

2. **Reads service-specific base templates** from `.claude/templates/`:
    - `CLAUDE-BASE-WPM.md` - Maintenance instructions
    - `CLAUDE-BASE-PERFORMANCE.md` - Optimization playbooks
    - `CLAUDE-BASE-WEBDEV.md` - Development conventions
    - `CLAUDE-BASE-SEO.md` - SEO guidelines

3. **Generates `CLAUDE.md`** in the site root with:
    - Site identity and environment details
    - Available commands, skills, and agents
    - Safety rules and blocked operations
    - Blaze Commerce conventions
    - Link to full documentation
    - Kit version installed

4. **Generates `CHANGELOG.md`** in the site root for tracking all changes made to the site

## Running /init

```bash
# SSH into your Kinsta site, navigate to site root
cd ~/public

# Start Claude Code
claude

# Run initialization
/init
```

## Generated Files

After `/init`, your site root will have:

```
~/public/
├── CLAUDE.md           # <-- Generated site-specific config
├── CHANGELOG.md        # <-- Generated site change log
├── .claude/            # The Blaze Dev Kit
├── wp-config.php
└── ...
```

## Re-running /init

You can safely re-run `/init` at any time to:

- Refresh site details after plugin/theme changes
- Pick up new commands or skills after a kit update
- Reset CLAUDE.md if it was accidentally modified

!!! note "CHANGELOG.md is preserved"
    Re-running `/init` will regenerate `CLAUDE.md` but will **not** overwrite an existing `CHANGELOG.md`. The changelog is append-only.

## What Happens Next

After initialization, Claude Code is fully configured. You can:

- Run `/wpm` to perform WordPress maintenance updates
- Run `/pagespeed https://your-site.com` to optimize performance
- Run `/accessibility https://your-site.com` to fix accessibility issues
- Ask Claude Code any WordPress development question - it has 14 specialist skills loaded
