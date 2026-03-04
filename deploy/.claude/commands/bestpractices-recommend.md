---
description: "Advisory best practices audit - analyze and recommend without making changes"
---

# /bestpractices-recommend {url}

Advisory best practices audit. Analyzes and recommends but does NOT implement changes.

## Procedure

1. **AUDIT**: `.claude/scripts/bestpractices.sh {url}`
2. **VERIFY**: `.claude/scripts/validate.sh {url} all`
3. **RECOMMEND**: Provide WordPress stack-specific fixes grouped by Trust & Safety, UX, Browser Compatibility

## Output Format

Grouped by category with severity ratings and specific fix instructions for the Blaze Commerce stack.
