---
description: "Initialize Blaze Dev Kit - generate site-specific CLAUDE.md and CHANGELOG.md"
---

# /init - Blaze Dev Kit Initialization

You are initializing the Blaze Dev Kit for a WordPress site on Kinsta hosting.

## Procedure

### Step 1: Site Triage (Deterministic)

Run these WP-CLI commands to gather site information:

```bash
# Site identity
wp option get blogname
wp option get siteurl
wp option get admin_email

# WordPress environment
wp core version
php -v | head -1

# Active theme
wp theme list --status=active --format=json

# All plugins
wp plugin list --format=json

# WooCommerce status
wp plugin is-active woocommerce 2>/dev/null && echo "WooCommerce: Active" || echo "WooCommerce: Not active"

# Multisite status
wp core is-installed --network 2>/dev/null && echo "Multisite: Yes" || echo "Multisite: No"

# Blaze Dev Kit version
cat .claude/../VERSION 2>/dev/null || echo "VERSION file not found"
```

### Step 2: Read Templates

Read the following template files:
- `.claude/templates/CLAUDE.md.template` - Main CLAUDE.md structure
- `.claude/templates/CLAUDE-BASE-WPM.md` - WPM service instructions
- `.claude/templates/CLAUDE-BASE-PERFORMANCE.md` - Performance optimization instructions
- `.claude/templates/CLAUDE-BASE-WEBDEV.md` - Web development instructions
- `.claude/templates/CLAUDE-BASE-SEO.md` - SEO instructions

### Step 3: Generate CLAUDE.md

Using the triage data and templates, generate a `CLAUDE.md` file in the site root (same level as `wp-config.php`).

The generated CLAUDE.md MUST include:
1. **Site Identity** - Name, URL, admin email
2. **Environment** - WP version, PHP version, active theme, plugin list
3. **Blaze Dev Kit Version** - From VERSION file
4. **Available Commands** - All slash commands with brief descriptions
5. **Available Skills** - All skills loaded in .claude/skills/
6. **Available Agents** - All agents in .claude/agents/
7. **Safety Rules** - What the hooks block (reference, not duplicate)
8. **Blaze Commerce Conventions** - Function prefixes, child theme policy, etc.
9. **Documentation Link** - https://blaze-commerce.github.io/blaze-dev-kit/
10. **All service-specific base content** - Merged from the CLAUDE-BASE-*.md templates

### Step 4: Generate CHANGELOG.md (if not exists)

If `CHANGELOG.md` does NOT already exist in the site root, generate one using `.claude/templates/CHANGELOG.md.template`.

If it already exists, DO NOT overwrite it - it contains the site's change history.

### Step 5: Verify

Confirm:
- [ ] `CLAUDE.md` exists in site root
- [ ] `CLAUDE.md` contains correct site name and URL
- [ ] `CLAUDE.md` lists active theme and plugins
- [ ] `CHANGELOG.md` exists in site root
- [ ] Report the Blaze Dev Kit version installed

### Step 6: Report

Output a summary:
```
Blaze Dev Kit Initialized
========================
Site: [name] ([url])
WordPress: [version]
PHP: [version]
Theme: [theme name]
Plugins: [count] active
WooCommerce: [yes/no]
Kit Version: [version]

Files generated:
- CLAUDE.md ✓
- CHANGELOG.md ✓ (new) / ✓ (preserved existing)

Ready to use. Try /wpm, /pagespeed, or /version-check.
```
