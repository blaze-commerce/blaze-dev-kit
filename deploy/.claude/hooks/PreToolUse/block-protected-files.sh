#!/bin/bash
# Blaze Dev Kit - Block Protected Files Hook
# Intercepts Edit/Write/NotebookEdit tool calls and blocks modifications
# to WordPress core files, wp-config.php, and parent theme directories.
# Exit code 2 = block, Exit code 0 = allow.

set -euo pipefail

# Read tool input from stdin
INPUT=$(cat)

# Extract the file path from JSON
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.notebook_path // empty' 2>/dev/null)

if [[ -z "$FILE_PATH" ]]; then
  exit 0
fi

# Protected path patterns
PROTECTED_PATTERNS=(
  "wp-includes/"
  "wp-admin/"
  "wp-config.php"
  "wp-settings.php"
  "wp-login.php"
  "wp-cron.php"
  ".htaccess"
  ".htpasswd"
  "php.ini"
  ".user.ini"
)

# Check for parent theme directories (not child themes)
# Block: wp-content/themes/blocksy/ but allow: wp-content/themes/blocksy-child/
PARENT_THEMES=(
  "themes/blocksy/"
  "themes/developer/"
  "themes/developer-developer/"
  "themes/developer developer/"
  "themes/developer developer developer/"
  "themes/developer developer developer developer/"
  "themes/developer developer developer developer developer/"
  "themes/developer developer developer developer developer developer/"
  "themes/developer developer developer developer developer developer developer/"
  "themes/developer developer developer developer developer developer developer developer/"
  "themes/developer developer developer developer developer developer developer developer developer/"
)

for pattern in "${PROTECTED_PATTERNS[@]}"; do
  if echo "$FILE_PATH" | grep -q "$pattern"; then
    echo "BLOCKED: Cannot modify protected file." >&2
    echo "Path: $FILE_PATH" >&2
    echo "Matched pattern: $pattern" >&2
    echo "" >&2
    echo "WordPress core files and server configs must be edited manually." >&2
    exit 2
  fi
done

# Check parent theme (but allow child themes)
if echo "$FILE_PATH" | grep -q "themes/blocksy/" && ! echo "$FILE_PATH" | grep -q "blocksy-child"; then
  echo "BLOCKED: Cannot modify parent theme files." >&2
  echo "Path: $FILE_PATH" >&2
  echo "" >&2
  echo "Use the child theme (blocksy-child) for customizations." >&2
  exit 2
fi

# Allow the operation
exit 0
