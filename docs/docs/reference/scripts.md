---
icon: material/script-text
---

# Scripts Reference

All shell scripts included in the Blaze Dev Kit.

## Maintenance Scripts

### `blz-wpm.sh`

Main WordPress maintenance automation via SSH.

```bash
.claude/scripts/blz-wpm.sh
```

- Manages maintenance mode (3-tier priority)
- Runs core, plugin, and theme updates
- Sends Slack alerts on failure
- Excludes premium plugins (handled separately)

### `update-premium-plugins.sh`

Premium plugin management from private Git repository.

```bash
.claude/scripts/update-premium-plugins.sh [sync|list|update|update-all]
```

| Mode | Action |
|------|--------|
| `sync` | Sync local premium plugins with repo |
| `list` | List available premium plugins |
| `update <name>` | Update a specific premium plugin |
| `update-all` | Update all premium plugins |

## Performance Scripts

### `pagespeed.sh`

PageSpeed Insights API testing with multi-run averaging.

```bash
.claude/scripts/pagespeed.sh <url> [runs]
```

- Default: 5 runs
- Outputs formatted score tables
- Saves JSON reports to `./lighthouse-reports/`
- Requires `PAGESPEED_API_KEY` in `.env`

### `accessibility.sh`

Accessibility audit via PSI API.

```bash
.claude/scripts/accessibility.sh <url>
```

- Single run (deterministic scores)
- Groups findings by ARIA, Contrast, Navigation, etc.
- Saves `accessibility-report.json`

### `bestpractices.sh`

Best practices audit via PSI API.

```bash
.claude/scripts/bestpractices.sh <url>
```

- Single run
- Groups by Trust & Safety, UX, Browser Compatibility
- Saves `bestpractices-report.json`

### `validate.sh`

Live page validation via Browserless.io headless Chrome.

```bash
.claude/scripts/validate.sh <url> <mode>
```

| Mode | Checks |
|------|--------|
| `dom` | Alt text, headings, form labels, ARIA |
| `console` | Console errors, script inventory |
| `images` | Aspect ratios, dimensions, oversized |
| `network` | Mixed content, security headers, third-party |
| `screenshot` | Capture PNG (mobile, desktop, full-page) |
| `block` | Resource blocking experiment |
| `all` | dom + console + images + network |

Requires `BROWSERLESS_TOKEN` in `.env`.

### `clear-cache.sh`

Perfmatters + Kinsta cache clearing and warming.

```bash
.claude/scripts/clear-cache.sh
```

1. Clears Perfmatters used CSS, local fonts, minified JS/CSS
2. Clears Kinsta cache
3. Waits and verifies `X-Kinsta-Cache: HIT`
4. Warms Cloudflare cache via PageSpeed test

## Kit Management Scripts

### `check-version.sh`

Compare local version against latest GitHub Release.

```bash
.claude/scripts/check-version.sh
```

### `update-dev-kit.sh`

Non-destructive self-updater.

```bash
.claude/scripts/update-dev-kit.sh
```

- Downloads latest release zip
- Backs up current `.claude/`
- Extracts with rsync (preserves site-specific files)
- Reports changes

## Environment Variables

Scripts that require API keys read from `.env` at the site root:

| Variable | Used By |
|----------|---------|
| `PAGESPEED_API_KEY` | `pagespeed.sh`, `clear-cache.sh` |
| `BROWSERLESS_TOKEN` | `validate.sh` |
| `SLACK_WEBHOOK_URL` | `blz-wpm.sh` |
