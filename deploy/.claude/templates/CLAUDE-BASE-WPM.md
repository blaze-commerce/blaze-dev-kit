# WordPress Maintenance (WPM) - Service Base

## WPM Overview

This site uses the Blaze Dev Kit `/wpm` command for automated WordPress maintenance.

## Maintenance Mode Priority

For WooCommerce sites, use this priority order:
1. **WooCommerce Coming Soon**: `wp option update woocommerce_coming_soon "yes"`
2. **ASE Pro**: `wp option update admin_site_enhancements_maintenance_mode "1"`
3. **Custom file**: `echo '<?php $upgrading = time(); ?>' > .maintenance`

## Premium Plugins

Premium plugins are managed from a private repository. Do not attempt to update them
via `wp plugin update --all`. Use `.claude/scripts/update-premium-plugins.sh` instead.

## Excluded from Auto-Update

The following plugins are excluded from `wp plugin update --all`:
- elementor-pro
- gp-premium
- perfmatters
- woo-checkout-field-editor-pro
- admin-site-enhancements-pro
- wp-mail-smtp-pro
- surerank-pro

## Post-Update Checklist

After every maintenance update:
- [ ] Verify site is accessible
- [ ] Check for PHP errors
- [ ] Verify WooCommerce checkout (if applicable)
- [ ] Update plugin inventory in CLAUDE.md
- [ ] Document changes in CHANGELOG.md
- [ ] Clear caches: `.claude/scripts/clear-cache.sh`

## Slack Notifications

If `SLACK_WEBHOOK_URL` is set in `.env`, the `/wpm` command will send notifications
for both successful updates and failures.
