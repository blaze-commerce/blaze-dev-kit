---
description: "Advisory accessibility audit - analyze and recommend without making changes"
---

# /accessibility-recommend {url}

Advisory accessibility audit. Analyzes and recommends but does NOT implement changes.

## Procedure

1. **AUDIT**: `.claude/scripts/accessibility.sh {url}`
2. **VERIFY**: `.claude/scripts/validate.sh {url} dom`
3. **RECOMMEND**: Provide WordPress/Blocksy-specific fixes grouped by severity

## Output Format

Grouped by ARIA, Contrast, Names & Labels, Navigation with severity ratings and specific fix instructions.
