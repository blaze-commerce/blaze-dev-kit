---
name: wp-wpcli-ops
description: "WP-CLI operations - domain migration, database management, multisite, safety protocols"
compatibility: "WordPress 6.4+, WP-CLI 2.8+, Kinsta hosting"
---

## When to Use
When performing site operations via WP-CLI: migrations, bulk updates, database operations, multisite management.

## Inputs Required
- Operation type and scope
- Source and target environments (for migrations)
- Backup confirmation

## Procedure
1. Verify WP-CLI availability and version
2. Create database backup: `wp db export backup-$(date +%Y%m%d).sql`
3. Execute operation
4. Verify results
5. Document in CHANGELOG.md

## Key Operations

### Domain Migration
```bash
wp search-replace 'old-domain.com' 'new-domain.com' --all-tables --precise
```

### Database Management
```bash
wp db optimize
wp db repair
wp transient delete --all
```

### Multisite
```bash
wp site list
wp site create --slug=newsite
```

## Verification
- Operation completed without errors
- Site accessible after changes
- Database integrity maintained
- Backup available for rollback

## Failure Modes
| Problem | Fix |
|---------|-----|
| Search-replace breaks serialized data | Use `--precise` flag, never raw SQL |
| Database timeout | Break into smaller batches |
| Multisite propagation issue | Check `wp site list`, verify blog_id |

## Escalation
**Always backup before** destructive operations. Escalate domain migrations that involve DNS changes or SSL certificate updates (handled via Kinsta dashboard).
