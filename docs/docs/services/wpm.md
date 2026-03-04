---
icon: material/wrench
---

# WordPress Maintenance (WPM)

The WordPress Maintenance service automates the full update workflow for Kinsta-hosted WordPress sites.

## Command: `/wpm`

Runs the complete maintenance update workflow:

1. **Enable maintenance mode** (3-tier priority):
    - WooCommerce Coming Soon page (preferred for WooCommerce sites)
    - ASE Pro maintenance mode
    - Custom `.maintenance` file (fallback)
2. **Update WordPress core**
3. **Run database updates** (`wp core update-db`)
4. **Update free plugins** (excluding premium)
5. **Update premium plugins** (from private repository)
6. **Update themes**
7. **Disable maintenance mode**
8. **Update plugin inventory** in CLAUDE.md
9. **Notify Slack** (optional)

## Why Maintenance Mode?

!!! warning "Critical for WooCommerce"
    WooCommerce sites **must** be in maintenance mode during updates. Without it, customers may experience failed orders, broken checkout, or payment processing errors during the update window.

## Premium Plugin Management

Premium plugins are managed separately from a private Git repository. The `/wpm` command handles:

- Elementor Pro
- GP Premium
- Perfmatters
- WooCommerce Checkout Field Editor Pro
- Admin & Site Enhancements Pro
- WP Mail SMTP Pro
- SureRank Pro

## Scripts Used

| Script | Purpose |
|--------|---------|
| `blz-wpm.sh` | Main maintenance automation |
| `update-premium-plugins.sh` | Premium plugin sync from private repo |
| `notify-slack.sh` | Slack notifications |

## Configuration

The WPM base template (`CLAUDE-BASE-WPM.md`) includes:

- Maintenance mode priority rules
- Plugin update exclusion lists
- Slack webhook configuration
- Post-update verification steps
- Kinsta cache clearing procedures

## Best Practices

1. Always run `/wpm` during low-traffic hours
2. Check the site frontend after updates complete
3. Review the CHANGELOG.md for what was updated
4. If issues arise, the maintenance mode can be manually disabled via WP-CLI

## File Mapping

```
.claude/
├── commands/
│   ├── wpm.md                          # Full maintenance workflow
│   ├── init.md                         # Initialize site-specific config
│   └── version-check.md               # Check kit version
│
├── skills/
│   ├── wordpress-master/SKILL.md       # WordPress/WooCommerce architecture
│   └── wp-wpcli-ops/SKILL.md          # WP-CLI operations, domain migration
│
├── agents/
│   ├── wp-orchestrator.md              # Routes complex tasks to specialists
│   └── wp-migration-specialist.md      # Site migration workflows
│
├── scripts/
│   ├── blz-wpm.sh                      # Main maintenance automation
│   ├── update-premium-plugins.sh       # Premium plugin sync from private repo
│   ├── check-version.sh               # Version comparison against GitHub
│   └── update-dev-kit.sh              # Non-destructive self-updater
│
├── templates/
│   ├── CLAUDE.md.template              # Site-specific CLAUDE.md generator
│   ├── CLAUDE-BASE-WPM.md             # WPM service base template
│   └── CHANGELOG.md.template          # Changelog template
│
└── hooks/PreToolUse/
    ├── block-dangerous-commands.sh     # Blocks destructive commands
    └── block-protected-files.sh        # Prevents WP core edits
```
