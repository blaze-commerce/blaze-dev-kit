---
icon: material/download
---

# Installation

Step-by-step guide to deploying the Blaze Dev Kit to a Kinsta-hosted WordPress site.

## Step 1: Download the Latest Release

Go to the [Releases page](https://github.com/blaze-commerce/blaze-dev-kit/releases) and download the latest `blaze-dev-kit-vX.X.X.zip`.

!!! important "Download, don't clone"
    **Do NOT clone the repository.** The repo contains documentation, QA tests, and CI/CD files that should not be on your site. Only the release zip contains the deployable kit.

## Step 2: Upload to Kinsta

Upload the zip file to your site's **public root directory** (`~/public/`) using one of these methods:

=== "SFTP"

    1. Connect to your Kinsta site via SFTP (credentials in MyKinsta dashboard)
    2. Navigate to the `public/` directory
    3. Upload `blaze-dev-kit-vX.X.X.zip`

=== "SCP (Terminal)"

    ```bash
    scp blaze-dev-kit-vX.X.X.zip user@your-site.kinsta.cloud:~/public/
    ```

=== "SSH + wget"

    ```bash
    ssh user@your-site.kinsta.cloud
    cd ~/public
    wget https://github.com/blaze-commerce/blaze-dev-kit/releases/download/vX.X.X/blaze-dev-kit-vX.X.X.zip
    ```

## Step 3: Extract the Zip

SSH into your Kinsta site and extract:

```bash
cd ~/public
unzip blaze-dev-kit-vX.X.X.zip
```

This creates the `.claude/` directory in your site root:

```
~/public/
├── .claude/           # <-- The Blaze Dev Kit
│   ├── settings.json
│   ├── hooks/
│   ├── commands/
│   ├── skills/
│   ├── agents/
│   ├── scripts/
│   └── templates/
├── wp-config.php
├── wp-content/
└── ...
```

## Step 4: Verify Extraction

```bash
ls -la .claude/
```

You should see `settings.json`, `hooks/`, `commands/`, `skills/`, `agents/`, `scripts/`, and `templates/`.

## Step 5: Delete the Zip

**Do NOT leave the zip file in your public directory.**

```bash
rm blaze-dev-kit-vX.X.X.zip
```

!!! danger "Security"
    A zip file sitting in your public root is a security risk. Always delete it immediately after extraction.

## Step 6: Initialize

See the [Initialization guide](initialization.md) for the next step.

## Verification Checklist

- [ ] `.claude/` directory exists in site root
- [ ] `VERSION` file inside `.claude/` shows correct version
- [ ] Zip file is deleted from public root
- [ ] `.claude/scripts/` has executable permissions (`chmod +x .claude/scripts/*.sh`)
