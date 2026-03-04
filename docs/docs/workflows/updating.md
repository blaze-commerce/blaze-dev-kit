---
icon: material/update
---

# Updating Sites

How to update the Blaze Dev Kit on an existing Kinsta site installation.

## Version Checking

### Quick Check

```bash
.claude/scripts/check-version.sh
```

Output:
```
Blaze Dev Kit Version Check
Local:  v0.1.0
Latest: v2.1.0
Status: UPDATE AVAILABLE

Run .claude/scripts/update-dev-kit.sh to update.
```

### Via Claude Code

```bash
claude
/version-check
```

## Update Process

### Automatic (Recommended)

```bash
.claude/scripts/update-dev-kit.sh
```

This script performs a **non-destructive update**:

1. Downloads the latest release zip from GitHub
2. Backs up current `.claude/` to `.claude/.backup-v{current}/`
3. Extracts new files over existing installation
4. Uses `rsync` to:
    - **Update** framework files (hooks, commands, skills, agents, scripts)
    - **Preserve** site-specific files (CLAUDE.md, local configs)
    - **Add** new files that didn't exist before
    - **Never delete** existing files
5. Updates `VERSION` to the new version
6. Reports what changed

### Manual Update

If the automatic updater isn't working:

1. Download the latest release zip
2. Upload to Kinsta site root
3. Back up your current `.claude/` directory
4. Extract the zip (overwrites `.claude/`)
5. Delete the zip
6. Re-run `/init` to refresh CLAUDE.md

## What Gets Preserved

| File | Updated? | Notes |
|------|----------|-------|
| `.claude/settings.json` | Yes | Framework defaults restored |
| `.claude/hooks/*` | Yes | Latest safety rules applied |
| `.claude/commands/*` | Yes | New/updated commands |
| `.claude/skills/*` | Yes | New/updated knowledge |
| `.claude/agents/*` | Yes | New/updated agents |
| `.claude/scripts/*` | Yes | New/updated tools |
| `.claude/templates/*` | Yes | New/updated templates |
| `CLAUDE.md` (site root) | **No** | Site-specific, never touched |
| `CHANGELOG.md` (site root) | **No** | Site history, never touched |
| `.env` | **No** | Credentials, never touched |

## After Updating

After an update, it's recommended to:

1. Re-run `/init` to pick up any new commands or skills in your CLAUDE.md
2. Check the [CHANGELOG](https://github.com/blaze-commerce/blaze-dev-kit/blob/main/CHANGELOG.md) for what changed
3. Test a quick command to verify everything works

## Rollback

If an update causes issues:

```bash
# Restore from backup
rm -rf .claude/
mv .claude/.backup-v0.1.0 .claude/
```

!!! note "Backups"
    The updater keeps one backup per version. Updating from v0.1.0 to v0.2.0 creates `.claude/.backup-v0.1.0/`. Updating again to v0.3.0 creates `.claude/.backup-v0.2.0/` (previous backup is removed to save space).
