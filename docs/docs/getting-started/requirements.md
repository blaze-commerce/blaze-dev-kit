---
icon: material/clipboard-check
---

# Requirements

Before deploying the Blaze Dev Kit, ensure you have the following.

## Required

| Requirement | Details |
|-------------|---------|
| **Claude Code** | Installed on your local machine ([claude.ai/claude-code](https://claude.ai/claude-code)) |
| **Kinsta Hosting** | Active Kinsta hosting account with SSH access |
| **SSH Access** | SSH credentials for the target site |
| **SFTP Client** | For uploading the zip file (or use `scp` via terminal) |
| **WP-CLI** | Available on the Kinsta server (pre-installed on all Kinsta sites) |

## Recommended

| Requirement | Details |
|-------------|---------|
| **PageSpeed API Key** | For `/pagespeed` command - [Get one here](https://developers.google.com/speed/docs/insights/v5/get-started) |
| **Browserless Token** | For `validate.sh` script - [browserless.io](https://www.browserless.io/) |
| **Slack Webhook URL** | For `/wpm` Slack notifications |

## Standard Site Stack

The kit is optimized for sites running this stack:

- **WordPress** 6.4+
- **PHP** 8.0+
- **Theme**: Blocksy (or Blocksy Pro)
- **Performance**: Perfmatters
- **Images**: ShortPixel
- **E-commerce**: WooCommerce (if applicable)
- **Hosting**: Kinsta
- **CDN**: Cloudflare (if applicable)

!!! note "Other stacks"
    The kit works with other themes and plugins, but the optimization playbooks and automation scripts are specifically tuned for the standard Blaze Commerce stack above.

## Environment Variables

Some scripts require API keys stored in a `.env` file at the site root:

```bash
# .env (create at site root, add to .gitignore)
PAGESPEED_API_KEY=your-api-key-here
BROWSERLESS_TOKEN=your-token-here
SLACK_WEBHOOK_URL=https://hooks.slack.com/services/xxx/yyy/zzz
```

!!! warning "Security"
    Never commit `.env` files. The safety hooks will block Claude from reading `.env` files directly.
