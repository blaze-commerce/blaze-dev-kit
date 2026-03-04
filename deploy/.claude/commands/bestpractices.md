---
description: "Autonomous best practices optimization - fix issues until 90+ score"
---

# /bestpractices {url}

Autonomous best practices optimization loop targeting 90+ score.

## Procedure

### Round Loop (max 3 rounds)

1. **AUDIT**: `.claude/scripts/bestpractices.sh {url}`
2. **VERIFY**: `.claude/scripts/validate.sh {url} all`
3. **ANALYZE**: If score >= 90, exit with success report
4. **IMPLEMENT**: Apply fixes using child theme (prefix: `blaze_bp_`)
5. **CLEAR CACHE**: `.claude/scripts/clear-cache.sh`
6. **RE-TEST**: Run audit again

### Common Fixes
- Console error resolution (Perfmatters exclusions, JS patching)
- Mixed content / HTTPS enforcement
- Security headers (CSP, X-Content-Type-Options, etc.)
- Image aspect ratio (CSS object-fit, missing dimensions)
- Responsive images (ShortPixel, WordPress srcset)
- Source maps configuration
- DOCTYPE/charset

### Post-Optimization
1. Document changes in site CHANGELOG.md
2. Report before/after scores
