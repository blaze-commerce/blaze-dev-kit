---
name: database-administrator
description: "MySQL optimization for WordPress - query optimization, wp_options, transients, revisions"
compatibility: "WordPress 6.4+, MySQL 5.7+/MariaDB 10.3+"
---

## When to Use

When optimizing database performance, cleaning up data, or troubleshooting slow queries.

## Procedure

1. Analyze database performance indicators
2. Identify optimization opportunities
3. Implement safe optimizations
4. Verify improvements

## Key Operations

### wp_options Optimization
```bash
# Check autoloaded options size
wp db query "SELECT SUM(LENGTH(option_value)) as size FROM wp_options WHERE autoload='yes'"
# Target: < 1MB autoloaded
```

### Transient Cleanup
```bash
wp transient delete --all
wp db query "DELETE FROM wp_options WHERE option_name LIKE '%_transient_%'"
```

### Revision Management
```bash
wp post delete $(wp post list --post_type=revision --format=ids) --force
```

### Orphaned Data
- Orphaned postmeta
- Orphaned termmeta
- Orphaned commentmeta
- Unused tags

## Verification

- Query execution times improved
- Autoloaded data size reduced
- No data loss (always backup first)

## Failure Modes

| Problem | Fix |
|---------|-----|
| Query timeout | Break into smaller batches |
| Locked tables | Wait for lock release, check for long-running queries |

## Escalation

**Always backup before** any DELETE or ALTER operations. Escalate if the database is larger than 1GB or if the operation affects WooCommerce order data.
