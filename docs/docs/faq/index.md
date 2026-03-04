---
icon: material/frequently-asked-questions
---

# Frequently Asked Questions

## General

### What is the Blaze Dev Kit?

The Blaze Dev Kit is a portable `.claude/` configuration package that gives Claude Code expert-level WordPress knowledge, automated maintenance workflows, performance optimization tools, and safety guardrails - all pre-configured for Kinsta-hosted sites.

### Why "Dev Kit" and not just "config" or "setup"?

Because it's more than configuration. It includes commands, skills, agents, scripts, and templates - a full toolkit, not just settings.

### Who maintains the Blaze Dev Kit?

The kit is maintained by the Blaze Commerce team. All changes require approval from repository maintainers (Jaru and Jax).

---

## Installation

### Why can't I just clone the repo?

The repository contains documentation, QA tests, CI/CD workflows, and maintenance scripts that should NOT be on your WordPress site. The release zip contains ONLY the deployable `.claude/` directory - nothing else.

### What happens if I forget to delete the zip file?

A zip file in your public root is a security risk - anyone who knows the URL could download it. Always delete immediately after extraction.

### Can I install the kit on a non-Kinsta host?

The kit is specifically designed for Kinsta. Some components (cache clearing, SSH workflows) are Kinsta-specific. Core skills and commands will work elsewhere, but you'll need to adjust the hosting-specific parts.

### Does the kit work with any WordPress theme?

The kit is optimized for the Blocksy theme (the standard Blaze Commerce stack). Skills and optimization playbooks reference Blocksy-specific patterns. It will work with other themes, but some optimization recommendations may not apply.

---

## CLAUDE.md

### Why isn't there a CLAUDE.md in the repository?

Because every site is different. Instead of a generic CLAUDE.md, the `/init` command generates a **site-specific** one by querying your WordPress installation (theme, plugins, WP version, PHP version, etc.). This gives Claude Code accurate context for YOUR site, not a template.

### Can I customize the generated CLAUDE.md?

Yes! After `/init` generates it, you can add site-specific instructions, client preferences, or custom rules. The updater (`update-dev-kit.sh`) will **never overwrite** your CLAUDE.md.

### What if I need to regenerate CLAUDE.md?

Run `/init` again. It will create a fresh CLAUDE.md based on your current site state. Note: any manual customizations will be replaced. Back up first if needed.

---

## Updates & Versioning

### How do I know if my site has an old version?

Run `.claude/scripts/check-version.sh` or use the `/version-check` command inside Claude Code.

### Will updating delete my files?

No. The update process is **non-destructive**:

- Framework files (hooks, skills, commands) are updated
- Site-specific files (CLAUDE.md, CHANGELOG.md, .env) are preserved
- A backup is created before changes
- No files are ever deleted

### How often are updates released?

There's no fixed schedule. Updates are released when:

- New skills or commands are added
- Bug fixes are needed
- Security improvements are available

Check the [CHANGELOG](https://github.com/blaze-commerce/blaze-dev-kit/blob/main/CHANGELOG.md) for release history.

### Can I rollback an update?

Yes. The updater creates a backup at `.claude/.backup-v{version}/`. To rollback:

```bash
rm -rf .claude/
mv .claude/.backup-vX.X.X .claude/
```

---

## Commands & Skills

### What's the difference between commands and skills?

- **Commands** are user-invoked via slash syntax (`/wpm`, `/pagespeed`). They define a specific workflow.
- **Skills** are knowledge modules that Claude loads automatically based on the task context. You don't invoke them directly.

### What's the difference between autonomous and recommend modes?

- **Autonomous** (`/pagespeed`): Claude implements fixes automatically in a test-fix-retest loop
- **Recommend** (`/pagespeed-recommend`): Claude analyzes and reports recommendations but makes no changes

### Can I add custom commands?

Yes. Create a `.md` file in `.claude/commands/` following the existing format. Note that custom commands may be overwritten on kit updates unless you're careful with the update process.

---

## Agents

### What are agents and when are they used?

Agents are specialist AI subprocesses spawned for specific tasks. Claude Code invokes them automatically when it detects a task matching the agent's expertise. For example, a WooCommerce question might spawn the `wp-woo-specialist` agent.

### Why do different agents use different models?

Cost and capability optimization:

- **haiku** (cheap, fast): Quick read-only audits
- **sonnet** (balanced): Everyday development and optimization
- **opus** (powerful, expensive): Complex architecture and migration decisions

### Do agents inherit safety hooks?

Yes. All agents operate within the same safety guardrails (block-dangerous-commands, block-protected-files).

---

## Security

### What do the safety hooks block?

**block-dangerous-commands.sh** blocks:
`rm -rf /`, `DROP DATABASE`, `TRUNCATE TABLE`, `wp db reset`, `wp plugin delete --all`, `mkfs.`, `> /dev/sda`, `wp kinsta cache purge`

**block-protected-files.sh** blocks edits to:
`wp-includes/`, `wp-admin/`, `wp-config.php`, parent theme directories, `.htaccess`, `php.ini`, `.user.ini`

### Can Claude read my .env file?

No. The safety hooks prevent Claude from reading `.env` files and other sensitive credentials.

### Can I disable the safety hooks?

Technically yes (by removing them from `settings.json`), but **strongly discouraged**. The hooks exist to prevent accidental damage to production sites.

---

## Contributing

### How do I contribute changes to the kit?

See the [Contributing workflow](../workflows/contributing.md). In short: create a branch off `develop`, make changes in the correct directory, create a PR, get approval from a CODEOWNER.

### Why was my PR rejected by CI?

The `verify-pr.yml` check enforces file placement rules. Make sure your files are in the correct directory:

- Kit files → `deploy/`
- Documentation → `docs/`
- Tests → `qa/`
- CI/repo scripts → `.github/` or `scripts/`

### Can I push directly to main?

No. `main` and `develop` are protected branches. All changes require a PR with CODEOWNER approval.
