---
description: "Autonomous accessibility optimization - fix issues until 90+ score"
---

# /accessibility {url}

Autonomous accessibility optimization loop targeting 90+ score.

## Procedure

### Round Loop (max 3 rounds)

1. **AUDIT**: `.claude/scripts/accessibility.sh {url}`
2. **VERIFY**: `.claude/scripts/validate.sh {url} dom` for DOM-level checks
3. **ANALYZE**: If score >= 90, exit with success report
4. **IMPLEMENT**: Apply fixes using child theme (prefix: `blaze_a11y_`)
5. **CLEAR CACHE**: `.claude/scripts/clear-cache.sh`
6. **RE-TEST**: Run audit again

### Common Fixes
- Form labels (WooCommerce quantity, variation selects, search)
- Link names (Read More, Add-to-Cart, icon-only links)
- ARIA fixes (broken references, mobile menu)
- Image alt text (decorative fallback, product image fallback)
- Language attribute
- Skip navigation link
- Image dimensions (Perfmatters setting)

### Post-Optimization
1. Document changes in site CHANGELOG.md
2. Report before/after scores

## Reference
Load `.claude/skills/wordpress-master/SKILL.md` for WordPress-specific accessibility patterns.
