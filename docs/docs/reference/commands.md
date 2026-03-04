---
icon: material/console
---

# Commands Reference

All slash commands available in the Blaze Dev Kit.

## Core Commands

### `/init`

Generate a site-specific CLAUDE.md file.

```
/init
```

- **When to use**: After fresh installation or after a kit update
- **What it does**: Runs WP-CLI triage, generates CLAUDE.md and CHANGELOG.md
- **Safe to re-run**: Yes (CHANGELOG.md is preserved)

### `/version-check`

Check if your kit is up to date.

```
/version-check
```

- **When to use**: To check if a newer version is available
- **What it does**: Compares local VERSION against latest GitHub Release

---

## WordPress Maintenance

### `/wpm`

Run the full WordPress maintenance update workflow.

```
/wpm
```

- **When to use**: Scheduled maintenance windows
- **What it does**: Enables maintenance mode, updates core/plugins/themes, disables maintenance mode, notifies Slack
- **Duration**: 5-15 minutes depending on update count

---

## Site Optimization

### `/pagespeed {url}`

Autonomous performance optimization.

```
/pagespeed https://your-site.com
```

- **When to use**: When PageSpeed score needs improvement
- **What it does**: Tests, analyzes, implements fixes, clears cache, re-tests (up to 5 rounds)
- **Target**: 90+ mobile PageSpeed score

### `/pagespeed-recommend {url}`

Advisory performance audit (no changes made).

```
/pagespeed-recommend https://your-site.com
```

### `/accessibility {url}`

Autonomous accessibility optimization.

```
/accessibility https://your-site.com
```

- **Target**: 90+ accessibility score
- **Max rounds**: 3

### `/accessibility-recommend {url}`

Advisory accessibility audit (no changes made).

```
/accessibility-recommend https://your-site.com
```

### `/bestpractices {url}`

Autonomous best practices optimization.

```
/bestpractices https://your-site.com
```

- **Target**: 90+ best practices score
- **Max rounds**: 3

### `/bestpractices-recommend {url}`

Advisory best practices audit (no changes made).

```
/bestpractices-recommend https://your-site.com
```

---

## Command Comparison

| Command | Mode | Makes Changes? | Max Rounds |
|---------|------|---------------|------------|
| `/pagespeed` | Autonomous | Yes | 5 |
| `/pagespeed-recommend` | Advisory | No | 1 |
| `/accessibility` | Autonomous | Yes | 3 |
| `/accessibility-recommend` | Advisory | No | 1 |
| `/bestpractices` | Autonomous | Yes | 3 |
| `/bestpractices-recommend` | Advisory | No | 1 |
