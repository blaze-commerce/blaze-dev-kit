#!/bin/bash
# Blaze Dev Kit - Version Checker
# Compares local version against latest GitHub release.
# Usage: .claude/scripts/check-version.sh

set -euo pipefail

REPO="blaze-commerce/blaze-dev-kit"

# Get local version
LOCAL_VERSION="unknown"
if [[ -f "VERSION" ]]; then
  LOCAL_VERSION=$(cat VERSION | tr -d '[:space:]')
elif [[ -f ".claude/../VERSION" ]]; then
  LOCAL_VERSION=$(cat .claude/../VERSION | tr -d '[:space:]')
fi

# Get latest release version from GitHub API
LATEST_VERSION=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" | \
  grep '"tag_name"' | \
  sed -E 's/.*"tag_name":\s*"([^"]+)".*/\1/' || echo "unknown")

echo "Blaze Dev Kit Version Check"
echo "============================"
echo "Local:  $LOCAL_VERSION"
echo "Latest: $LATEST_VERSION"

if [[ "$LOCAL_VERSION" == "$LATEST_VERSION" ]]; then
  echo "Status: UP TO DATE"
elif [[ "$LATEST_VERSION" == "unknown" ]]; then
  echo "Status: UNABLE TO CHECK (GitHub API unreachable)"
  echo ""
  echo "Check manually: https://github.com/${REPO}/releases"
else
  echo "Status: UPDATE AVAILABLE"
  echo ""
  echo "Run .claude/scripts/update-dev-kit.sh to update."
  echo "Or download from: https://github.com/${REPO}/releases/latest"
fi
