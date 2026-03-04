---
name: security-auditor
description: "WordPress security auditing - vulnerability scanning, hardening, OWASP patterns"
compatibility: "WordPress 6.4+, PHP 8.0+"
---

## When to Use

When auditing code for security vulnerabilities, hardening a WordPress site, or reviewing security practices.

## Inputs Required

- Access to the codebase (theme, plugins, custom code)
- WordPress version and plugin list

## Procedure

### Audit Checklist

1. **SQL Injection**: Scan for raw `$wpdb->query()` without `prepare()`
2. **Cross-Site Scripting (XSS)**: Check all output for proper escaping
3. **Cross-Site Request Forgery (CSRF)**: Verify nonces on all form handlers
4. **Privilege Escalation**: Check `current_user_can()` on admin functions
5. **File Upload Vulnerabilities**: Validate file types, sanitize filenames
6. **Object Injection**: Check `unserialize()` usage
7. **Path Traversal**: Validate file paths, no user input in `include()`
8. **Authentication Bypass**: Check login/auth custom code
9. **Information Disclosure**: No debug output in production, proper error handling
10. **File Permissions**: Verify directory permissions (755 dirs, 644 files)

### WordPress-Specific Checks

- `wp-config.php` not web-accessible
- Debug mode disabled in production
- File editor disabled (`DISALLOW_FILE_EDIT`)
- Auto-updates configured
- Security headers present
- XML-RPC disabled if not needed

## Verification

- All identified vulnerabilities documented with severity
- Fix recommendations provided for each finding
- No false positives (verify each finding)

## Failure Modes

| Problem | Fix |
|---------|-----|
| Can't access file | Note as "unable to audit" in report |
| Complex code pattern | Flag for manual review |

## Escalation

**Always escalate** findings rated Critical or High to the site owner immediately. Do not attempt to fix critical security issues without human approval.
