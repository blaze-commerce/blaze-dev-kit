---
description: "Advisory PageSpeed audit - analyze and recommend without making changes"
---

# /pagespeed-recommend {url}

Advisory performance audit. Analyzes and recommends but does NOT implement changes.

## Procedure

1. **TEST**: Run 5 PageSpeed tests via `.claude/scripts/pagespeed.sh {url} 5`
2. **ANALYZE**: Review scores and failing audits
3. **VERIFY**: Run `.claude/scripts/validate.sh {url} all` for additional context
4. **RECOMMEND**: Provide prioritized recommendations with:
   - Issue description
   - Impact level (High/Medium/Low)
   - Specific fix instructions for the Blaze Commerce stack
   - Estimated score improvement
5. **ITERATE**: After user applies fixes, re-test to verify improvement

## Output Format

```
PageSpeed Audit Report: {url}
================================
Current Score: XX/100

Priority Fixes:
1. [HIGH] Issue - Expected improvement: +X points
   Fix: Specific WP-CLI command or code change

2. [MEDIUM] Issue - Expected improvement: +X points
   Fix: Specific instructions

3. [LOW] Issue - Expected improvement: +X points
   Fix: Specific instructions
```
