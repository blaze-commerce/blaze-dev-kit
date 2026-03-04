#!/bin/bash
# Blaze Dev Kit - Block Dangerous Commands Hook
# Intercepts Bash tool calls and blocks destructive patterns.
# Exit code 2 = block the command, Exit code 0 = allow.

set -euo pipefail

# Read tool input from stdin
INPUT=$(cat)

# Extract the command from JSON
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty' 2>/dev/null)

if [[ -z "$COMMAND" ]]; then
  exit 0
fi

# Dangerous patterns to block
BLOCKED_PATTERNS=(
  "rm -rf /"
  "rm -rf ~"
  "rm -rf \."
  "rm -rf \.\."
  "DROP DATABASE"
  "DROP TABLE"
  "TRUNCATE TABLE"
  "wp db reset"
  "wp plugin delete --all"
  "wp theme delete --all"
  "mkfs\."
  "> /dev/sda"
  "dd if=.* of=/dev"
  "wp kinsta cache purge"
  "chmod 777"
  ":(){:|:&};:"
)

for pattern in "${BLOCKED_PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qiE "$pattern"; then
    echo "BLOCKED: Dangerous command detected." >&2
    echo "Pattern matched: $pattern" >&2
    echo "Command: $COMMAND" >&2
    echo "" >&2
    echo "If this is a legitimate operation, run it manually via SSH." >&2
    exit 2
  fi
done

# Allow the command
exit 0
