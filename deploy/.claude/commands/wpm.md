---
description: "Run WordPress maintenance update workflow - core, plugins, themes with maintenance mode"
---

# /wpm - WordPress Maintenance Update

Run the full WordPress maintenance update workflow for this Kinsta-hosted site.

## Pre-Flight Checks

Before starting:
1. Confirm you are in the correct site directory
2. Check the site is accessible: `curl -sI $(wp option get siteurl) | head -1`
3. Note the current WordPress version: `wp core version`
4. Note plugin count: `wp plugin list --status=active --format=count`

## Procedure

### 1. Enable Maintenance Mode

Use a 3-tier priority system:

**Tier 1 - WooCommerce Coming Soon** (preferred for WooCommerce sites):
```bash
wp option update woocommerce_coming_soon "yes"
```

**Tier 2 - ASE Pro Maintenance Mode** (if available):
```bash
wp option update admin_site_enhancements_maintenance_mode "1"
```

**Tier 3 - Custom .maintenance file** (fallback):
```bash
echo '<?php $upgrading = time(); ?>' > .maintenance
```

### 2. Update WordPress Core

```bash
wp core update
wp core update-db
```

### 3. Update Free Plugins

```bash
wp plugin update --all --exclude=premium-plugin-1,premium-plugin-2
```

Exclude premium plugins that are managed separately.

### 4. Update Premium Plugins

```bash
.claude/scripts/update-premium-plugins.sh update-all
```

### 5. Update Themes

```bash
wp theme update --all
```

### 6. Disable Maintenance Mode

Reverse whatever was enabled in Step 1:

**Tier 1**: `wp option update woocommerce_coming_soon "no"`
**Tier 2**: `wp option update admin_site_enhancements_maintenance_mode "0"`
**Tier 3**: `rm .maintenance`

### 7. Post-Update Verification

1. Check site is accessible: `curl -sI $(wp option get siteurl) | head -1`
2. Check for errors: `wp eval "echo 'PHP OK';"`
3. Note updated versions

### 8. Update CLAUDE.md Plugin Inventory

Update the plugin list in CLAUDE.md to reflect current versions.

### 9. Update Site CHANGELOG.md

Append a new entry to the site's `CHANGELOG.md` documenting:
- Date and time
- What was updated (core version, plugins, themes)
- Any issues encountered

### 10. Notify Slack (Optional)

If `SLACK_WEBHOOK_URL` is configured in `.env`:
```bash
.claude/scripts/notify-slack.sh "WPM Complete: [site-name] - Core [version], [N] plugins updated"
```

## Failure Protocol

If any step fails:
1. **DO NOT** continue with remaining updates
2. Document the error in CHANGELOG.md
3. Disable maintenance mode immediately
4. Report the failure to the user
5. If Slack is configured, send a failure notification
