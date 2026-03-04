---
name: wordpress-master
description: "WordPress and WooCommerce architecture expertise - hooks, Blocksy theme, caching, general WP development"
compatibility: "WordPress 6.4+, PHP 8.0+, Blocksy theme, Kinsta hosting"
---

## When to Use

When the task involves general WordPress development, architecture questions, or WooCommerce customization that doesn't fit a more specific skill.

## Inputs Required

- WordPress version and active plugins (from triage)
- The specific task or question

## Procedure

1. Review the site's environment (from CLAUDE.md or triage)
2. Identify the WordPress subsystem involved (hooks, template hierarchy, database, REST API, etc.)
3. Apply WordPress best practices for the task
4. Implement using the Blaze Commerce conventions (child theme, function prefixes, etc.)
5. Test the implementation

## Key Knowledge Areas

- WordPress hook system (actions and filters)
- Template hierarchy and theme structure
- Blocksy theme customization patterns
- WooCommerce hooks and template overrides
- WordPress database schema and $wpdb
- Transients API for caching
- Options API for settings
- Custom Post Types and Taxonomies
- WordPress Cron (wp-cron)
- User roles and capabilities

## Standard Site Stack

- **Theme**: Blocksy (or Blocksy Pro) with child theme
- **E-commerce**: WooCommerce
- **Performance**: Perfmatters
- **Images**: ShortPixel
- **SEO**: Rank Math
- **Hosting**: Kinsta
- **Snippets**: Code Snippets Pro

## Verification

- Code follows WordPress coding standards
- All custom functions use `blaze_` prefix
- No direct modifications to parent theme or core files
- Proper sanitization, escaping, and nonce verification
- Tested on the target site

## Failure Modes

| Problem | Fix |
|---------|-----|
| Hook not firing | Check priority, verify hook name, check if plugin loaded |
| Template override not working | Verify child theme template path matches parent |
| WooCommerce hook deprecated | Check WooCommerce changelog for replacement hook |

## Escalation

Escalate to a human developer when:
- Changes require wp-config.php modifications
- Server-level configuration is needed
- The task involves payment gateway integration (test on staging first)

## References

See `references/` directory for detailed documentation on specific WordPress subsystems.
