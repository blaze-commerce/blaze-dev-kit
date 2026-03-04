---
description: "Autonomous PageSpeed performance optimization - test, analyze, implement fixes, re-test until 90+"
---

# /pagespeed {url}

Autonomous performance optimization loop targeting 90+ mobile PageSpeed score.

## Procedure

### Round Loop (max 5 rounds)

#### 1. TEST
Run 5 PageSpeed Insights tests:
```bash
.claude/scripts/pagespeed.sh {url} 5
```

#### 2. ANALYZE
Review averaged results. If score >= 90, exit with success report.

Prioritize fixes by impact:
1. LCP image preloading
2. DOM size reduction
3. JavaScript delay/deferral (Perfmatters)
4. Render-blocking CSS
5. Font optimization
6. Image optimization (AVIF, srcset)
7. Third-party script management

#### 3. IMPLEMENT
Apply fixes using:
- **Perfmatters WP-CLI** for performance settings
- **Child theme functions.php** for code-based fixes (prefix: `blaze_`)
- **ffmpeg** for image optimization (AVIF conversion, resize)

#### 4. CLEAR CACHE
```bash
.claude/scripts/clear-cache.sh
```

#### 5. WAIT
Allow 30 seconds for CDN propagation.

#### 6. RE-TEST
Run 5 tests again. If score >= 90, exit. Otherwise, next round.

### Exit Conditions
- Score >= 90 average
- Max 5 rounds reached
- No more auto-fixable issues identified

### Post-Optimization
1. Document changes in site CHANGELOG.md
2. Report before/after scores
3. List remaining manual recommendations (if any)

## Safety
- Always verify changes with `validate.sh dom` before and after
- Never edit parent theme files
- Backup modified files before changing

## Reference
Load `.claude/skills/wp-performance/SKILL.md` for detailed optimization playbooks.
