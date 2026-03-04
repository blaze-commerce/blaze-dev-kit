#!/bin/bash
# Blaze Dev Kit - Create Deploy Zip
# Builds a versioned deploy zip from the deploy/ directory.
# Usage: ./scripts/create-deploy-zip.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Read version
VERSION=$(cat "$REPO_ROOT/deploy/VERSION" | tr -d '[:space:]')
ZIP_NAME="blaze-dev-kit-${VERSION}.zip"

echo "Building $ZIP_NAME..."
echo "========================"

# Build from deploy/ directory
cd "$REPO_ROOT/deploy"

zip -r "$REPO_ROOT/$ZIP_NAME" \
  .claude/ \
  VERSION \
  -x "*.DS_Store" \
  -x "*__MACOSX*" \
  -x "*.git*"

echo ""
echo "Zip created: $ZIP_NAME"
echo "Size: $(du -h "$REPO_ROOT/$ZIP_NAME" | cut -f1)"
echo ""

# Run verification
echo "Running verification..."
"$REPO_ROOT/scripts/verify-deploy-zip.sh" "$REPO_ROOT/$ZIP_NAME"
