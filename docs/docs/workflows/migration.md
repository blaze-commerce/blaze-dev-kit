---
icon: material/swap-horizontal
---

# Migration Guide

How to migrate from `claude-wpm` or `blz-performance` to the unified Blaze Dev Kit.

## Overview

The Blaze Dev Kit (v0.1.0) is the unified successor to two separate repositories:

| Old Repository | Service | Status |
|---------------|---------|--------|
| `blaze-commerce/claude-wpm` | WordPress Maintenance | Merged into Blaze Dev Kit |
| `blaze-commerce/blz-performance` | Site Optimization | Merged into Blaze Dev Kit |

## What Changed

### Merged Components

| Component | claude-wpm | blz-performance | Blaze Dev Kit |
|-----------|-----------|-----------------|---------------|
| Safety hooks | 2 hooks | 2 hooks (duplicated) | 2 hooks (deduplicated) |
| Settings | Narrow permissions | Broad permissions | Unified (merged) |
| Skills | 17 files | 6 files | All combined (deduplicated) |
| Scripts | 8 scripts | 5 scripts | All combined |
| Commands | `/wpm` only | None (skills only) | All commands unified |
| Agents | None | None | **NEW** - 7 specialist agents |
| Templates | CLAUDE-BASE.md | CLAUDE.md | Service-specific bases |

### New in v0.1.0

- Subagent architecture with model routing
- Router pattern for deterministic project classification
- 3-layer skill documentation structure
- Dynamic CLAUDE.md generation via `/init`
- Per-site CHANGELOG.md generation
- Non-destructive version update system
- MkDocs Material documentation site

## Migration Steps

### From claude-wpm

1. **Backup** your current `.claude/` directory:
   ```bash
   cp -r .claude/ .claude-backup-wpm/
   ```

2. **Backup** your current `CLAUDE.md` (if customized):
   ```bash
   cp CLAUDE.md CLAUDE.md.backup
   ```

3. **Remove** the old `.claude/` directory:
   ```bash
   rm -rf .claude/
   ```

4. **Install** Blaze Dev Kit following the [Installation guide](../getting-started/installation.md)

5. **Run** `/init` to generate new CLAUDE.md

6. **Review** the generated CLAUDE.md and merge any custom instructions from your backup

7. **Clean up** backups once satisfied:
   ```bash
   rm -rf .claude-backup-wpm/
   rm CLAUDE.md.backup
   ```

### From blz-performance

Same steps as above. Your `.env` file (API keys) is preserved since it's at the site root, not inside `.claude/`.

### From Both (Site Had Both Installed)

If a site had files from both repos, follow the same steps. The Blaze Dev Kit replaces both completely.

## Verifying Migration

After migration, verify:

- [ ] `/wpm` command works
- [ ] `/pagespeed https://your-site.com` works
- [ ] `/version-check` shows v0.1.0
- [ ] CLAUDE.md contains site details
- [ ] Safety hooks block `rm -rf /` (test safely)

## FAQ

**Q: Will I lose my site-specific CLAUDE.md customizations?**
A: `/init` generates a fresh CLAUDE.md. If you had custom instructions, back them up first and merge them after.

**Q: Are my .env API keys affected?**
A: No. The `.env` file is at the site root, outside `.claude/`. It's never touched.

**Q: Can I run the old and new versions side by side?**
A: No. There should only be one `.claude/` directory per site.
