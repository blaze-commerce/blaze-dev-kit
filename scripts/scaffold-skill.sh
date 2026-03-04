#!/bin/bash
# Blaze Dev Kit - Scaffold New Skill
# Generates a new skill directory with SKILL.md template and optional references/ folder.
# Usage: ./scripts/scaffold-skill.sh <skill-name>

set -euo pipefail

SKILL_NAME="${1:?Usage: scaffold-skill.sh <skill-name>}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILL_DIR="$REPO_ROOT/deploy/.claude/skills/$SKILL_NAME"

# Validate name (lowercase-kebab-case)
if ! echo "$SKILL_NAME" | grep -qE '^[a-z][a-z0-9]*(-[a-z0-9]+)*$'; then
  echo "ERROR: Skill name must be lowercase-kebab-case (e.g., wp-new-feature)"
  exit 1
fi

# Check if already exists
if [[ -d "$SKILL_DIR" ]]; then
  echo "ERROR: Skill '$SKILL_NAME' already exists at $SKILL_DIR"
  exit 1
fi

# Create directories
mkdir -p "$SKILL_DIR/references"

# Create SKILL.md
cat > "$SKILL_DIR/SKILL.md" << EOF
---
name: $SKILL_NAME
description: "TODO: Describe when this skill should be used"
compatibility: "WordPress 6.4+, PHP 8.0+, Kinsta hosting"
---

## When to Use

TODO: Describe the trigger conditions for this skill.

## Inputs Required

- TODO: What information does the agent need before starting?

## Procedure

1. TODO: Step-by-step checklist
2. ...
3. ...

## Verification

- TODO: How to confirm the procedure was successful

## Failure Modes

| Problem | Fix |
|---------|-----|
| TODO | TODO |

## Escalation

TODO: When should the agent ask a human for help?
EOF

# Create placeholder reference
cat > "$SKILL_DIR/references/.gitkeep" << EOF
EOF

echo "Skill scaffolded: $SKILL_DIR"
echo ""
echo "Files created:"
echo "  $SKILL_DIR/SKILL.md"
echo "  $SKILL_DIR/references/.gitkeep"
echo ""
echo "Next steps:"
echo "  1. Edit SKILL.md - fill in all TODO sections"
echo "  2. Add reference docs in references/ if needed"
echo "  3. Update FILE_MAPPING.md"
echo "  4. Create a PR to develop"
