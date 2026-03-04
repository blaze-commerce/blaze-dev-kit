#!/bin/bash
# Blaze Dev Kit - Verify Deploy Zip
# Validates a deploy zip against expected structure.
# Usage: ./scripts/verify-deploy-zip.sh <path-to-zip>

set -euo pipefail

ZIP_PATH="${1:?Usage: verify-deploy-zip.sh <path-to-zip>}"

if [[ ! -f "$ZIP_PATH" ]]; then
  echo "ERROR: File not found: $ZIP_PATH"
  exit 1
fi

echo "Verifying: $ZIP_PATH"
echo "========================"

ERRORS=0
WARNINGS=0

# Create temp directory for extraction
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

# Extract
unzip -q "$ZIP_PATH" -d "$TEMP_DIR"

# Check required structure
REQUIRED_FILES=(
  ".claude/settings.json"
  ".claude/hooks/PreToolUse/block-dangerous-commands.sh"
  ".claude/hooks/PreToolUse/block-protected-files.sh"
  ".claude/commands/init.md"
  ".claude/commands/wpm.md"
  ".claude/commands/pagespeed.md"
  ".claude/commands/accessibility.md"
  ".claude/commands/bestpractices.md"
  ".claude/commands/version-check.md"
  ".claude/templates/CLAUDE.md.template"
  ".claude/templates/CLAUDE-BASE-WPM.md"
  ".claude/templates/CLAUDE-BASE-PERFORMANCE.md"
  ".claude/templates/CLAUDE-BASE-WEBDEV.md"
  ".claude/templates/CLAUDE-BASE-SEO.md"
  ".claude/templates/CHANGELOG.md.template"
  "VERSION"
)

echo ""
echo "Checking required files..."
for required in "${REQUIRED_FILES[@]}"; do
  if [[ -f "$TEMP_DIR/$required" ]]; then
    echo "  OK: $required"
  else
    echo "  MISSING: $required"
    ERRORS=$((ERRORS + 1))
  fi
done

# Check for forbidden files
echo ""
echo "Checking for forbidden files..."
FORBIDDEN_PATTERNS=(
  "*.test.*"
  "*.spec.*"
  "playwright*"
  "mkdocs*"
  ".github"
  "CONTRIBUTING.md"
  "README.md"
  ".gitignore"
)

for pattern in "${FORBIDDEN_PATTERNS[@]}"; do
  FOUND=$(find "$TEMP_DIR" -name "$pattern" -type f 2>/dev/null || true)
  if [[ -n "$FOUND" ]]; then
    echo "  FORBIDDEN: $FOUND"
    ERRORS=$((ERRORS + 1))
  fi
done
echo "  No forbidden files found." 2>/dev/null

# Check zip size
ZIP_SIZE=$(du -m "$ZIP_PATH" | cut -f1)
echo ""
echo "Zip size: ${ZIP_SIZE}MB"
if [[ "$ZIP_SIZE" -gt 5 ]]; then
  echo "  WARNING: Zip is larger than 5MB"
  WARNINGS=$((WARNINGS + 1))
fi

# Check shell scripts are present
echo ""
echo "Checking scripts..."
SCRIPT_COUNT=$(find "$TEMP_DIR/.claude/scripts" -name "*.sh" -type f 2>/dev/null | wc -l | tr -d ' ')
echo "  Found $SCRIPT_COUNT shell scripts"

# Check skills
SKILL_COUNT=$(find "$TEMP_DIR/.claude/skills" -name "SKILL.md" -type f 2>/dev/null | wc -l | tr -d ' ')
echo "  Found $SKILL_COUNT skills"

# Check agents
AGENT_COUNT=$(find "$TEMP_DIR/.claude/agents" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
echo "  Found $AGENT_COUNT agents"

# Check VERSION content
VERSION_CONTENT=$(cat "$TEMP_DIR/VERSION" | tr -d '[:space:]')
echo ""
echo "Version: $VERSION_CONTENT"

# Summary
echo ""
echo "========================"
if [[ "$ERRORS" -gt 0 ]]; then
  echo "FAILED: $ERRORS error(s), $WARNINGS warning(s)"
  exit 1
else
  echo "PASSED: 0 errors, $WARNINGS warning(s)"
  echo "Zip is valid and ready for release."
fi
