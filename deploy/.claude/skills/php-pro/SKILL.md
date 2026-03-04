---
name: php-pro
description: "Modern PHP development expertise - PHP 8.0+, WordPress coding standards, security patterns"
compatibility: "PHP 8.0-8.3+, WordPress 6.4+"
---

## When to Use

When the task involves PHP code quality, security patterns, coding standards, or PHP-specific optimization.

## Inputs Required

- PHP version (from triage)
- The code or task to review/implement

## Procedure

1. Determine PHP version constraints
2. Apply WordPress PHP Coding Standards
3. Implement security best practices
4. Validate with proper error handling

## Key Patterns

### Security (MANDATORY)
- `sanitize_text_field()` for text input
- `esc_html()`, `esc_attr()`, `esc_url()` for output
- `wp_nonce_field()` / `wp_verify_nonce()` for forms
- `$wpdb->prepare()` for ALL database queries
- `current_user_can()` for capability checks

### Modern PHP
- Typed properties and return types (PHP 8.0+)
- Named arguments
- Match expressions
- Null-safe operator (`?->`)
- Enums (PHP 8.1+)

### WordPress Standards
- `snake_case` for function names
- `$snake_case` for variables
- `UPPER_CASE` for constants
- Yoda conditions: `if ( 'value' === $var )`
- Spaces inside parentheses: `if ( condition )`

## Verification

- Code follows WordPress PHP Coding Standards
- All user input is sanitized
- All output is escaped
- Database queries use prepared statements
- Capability checks on privileged operations

## Failure Modes

| Problem | Fix |
|---------|-----|
| Deprecated function warning | Check WP Code Reference for replacement |
| Type error on PHP 8+ | Add proper type declarations |
| SQL injection risk | Use `$wpdb->prepare()` |

## Escalation

Escalate when the code involves direct file system operations or server configuration changes.
