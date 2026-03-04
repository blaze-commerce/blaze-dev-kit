#!/bin/bash
# Blaze Dev Kit - Non-Destructive Self-Updater
# Downloads latest release and updates .claude/ while preserving site-specific files.
# Usage: .claude/scripts/update-dev-kit.sh

set -euo pipefail

REPO="blaze-commerce/blaze-dev-kit"
SITE_ROOT="$(pwd)"

echo "Blaze Dev Kit Updater"
echo "====================="

# Get current version
CURRENT_VERSION="unknown"
if [[ -f "VERSION" ]]; then
  CURRENT_VERSION=$(cat VERSION | tr -d '[:space:]')
fi

# Get latest release info
echo "Checking for latest release..."
RELEASE_INFO=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest")
LATEST_VERSION=$(echo "$RELEASE_INFO" | grep '"tag_name"' | sed -E 's/.*"tag_name":\s*"([^"]+)".*/\1/')
DOWNLOAD_URL=$(echo "$RELEASE_INFO" | grep '"browser_download_url"' | grep '\.zip"' | head -1 | sed -E 's/.*"browser_download_url":\s*"([^"]+)".*/\1/')

if [[ -z "$LATEST_VERSION" || -z "$DOWNLOAD_URL" ]]; then
  echo "ERROR: Could not fetch release information from GitHub."
  echo "Check: https://github.com/${REPO}/releases"
  exit 1
fi

echo "Current: $CURRENT_VERSION"
echo "Latest:  $LATEST_VERSION"

if [[ "$CURRENT_VERSION" == "$LATEST_VERSION" ]]; then
  echo "Already up to date. Nothing to do."
  exit 0
fi

# Confirm
echo ""
echo "Updating $CURRENT_VERSION -> $LATEST_VERSION"
echo "This will update framework files but preserve site-specific files."
echo ""

# Create backup
BACKUP_DIR=".claude/.backup-${CURRENT_VERSION}"
echo "Backing up current .claude/ to $BACKUP_DIR..."
if [[ -d "$BACKUP_DIR" ]]; then
  rm -rf "$BACKUP_DIR"
fi
cp -r .claude/ "$BACKUP_DIR"

# Download latest release
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

echo "Downloading $LATEST_VERSION..."
curl -sL "$DOWNLOAD_URL" -o "$TEMP_DIR/update.zip"

# Extract
echo "Extracting..."
unzip -q "$TEMP_DIR/update.zip" -d "$TEMP_DIR/extracted"

# Update using rsync (non-destructive)
echo "Applying update..."
rsync -av --update \
  "$TEMP_DIR/extracted/.claude/" \
  "$SITE_ROOT/.claude/" \
  --exclude=".backup-*" \
  --exclude="config.local.json" \
  2>&1 | grep -v "^$" | head -50

# Update VERSION
if [[ -f "$TEMP_DIR/extracted/VERSION" ]]; then
  cp "$TEMP_DIR/extracted/VERSION" "$SITE_ROOT/VERSION"
fi

# Remove old backups (keep only the latest)
find .claude/ -maxdepth 1 -type d -name ".backup-*" ! -name ".backup-${CURRENT_VERSION}" -exec rm -rf {} + 2>/dev/null || true

echo ""
echo "========================"
echo "Update complete: $CURRENT_VERSION -> $LATEST_VERSION"
echo "Backup saved: $BACKUP_DIR"
echo ""
echo "Next steps:"
echo "  1. Run /init to refresh CLAUDE.md with new capabilities"
echo "  2. Check the changelog: https://github.com/${REPO}/blob/main/CHANGELOG.md"
echo ""
echo "To rollback:"
echo "  rm -rf .claude/ && mv $BACKUP_DIR .claude/"
