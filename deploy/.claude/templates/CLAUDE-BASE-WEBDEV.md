# Web Development - Service Base

## Development Standards

### WordPress Coding Standards
- Follow [WordPress PHP Coding Standards](https://developer.wordpress.org/coding-standards/wordpress-coding-standards/php/)
- Use proper sanitization: `sanitize_text_field()`, `esc_html()`, `esc_attr()`, `esc_url()`
- Always use nonces for form submissions
- Use prepared statements for database queries: `$wpdb->prepare()`

### File Modification Rules
- **Child theme only** - never edit parent theme files
- **Code Snippets Pro** for small customizations
- **Custom plugin** for larger functionality
- **Never edit** `wp-config.php`, `wp-includes/`, `wp-admin/`

### Function Naming
- Prefix: `blaze_` for all custom functions
- Accessibility: `blaze_a11y_`
- Best practices: `blaze_bp_`
- Performance: `blaze_perf_`

### Hook Priority
- Default: 10
- Early execution: 1-5
- Late execution: 99-999

## Blocksy Theme

This site uses the Blocksy theme. Key patterns:
- Use `blocksy_get_theme_mod()` for theme options
- Template customization via child theme
- Blocksy hooks for custom content injection
- Extensions for additional functionality

## WooCommerce (if applicable)

- Use WooCommerce hooks, not template overrides when possible
- Test checkout flow after any WooCommerce-related changes
- Custom product types should extend `WC_Product`
- Payment gateway testing on staging first

## Testing

- Always test changes on staging before production
- Verify mobile and desktop after CSS/JS changes
- Check browser console for JavaScript errors
- Run `/pagespeed-recommend` after significant changes
