---
name: wp-performance
description: "WordPress performance diagnostics and optimization - Core Web Vitals, caching, asset optimization"
compatibility: "WordPress 6.4+, PHP 8.0+, Perfmatters, Kinsta hosting"
---

## When to Use

When diagnosing performance issues, optimizing Core Web Vitals, or configuring caching strategies.

## Inputs Required

- PageSpeed Insights test results
- Perfmatters configuration status
- Active plugins list

## Procedure

1. Run baseline test: `.claude/scripts/pagespeed.sh {url} 5`
2. Analyze failing audits and their weights
3. Prioritize fixes by impact
4. Implement using Perfmatters WP-CLI or child theme code
5. Clear cache: `.claude/scripts/clear-cache.sh`
6. Re-test and verify improvement

## Optimization Playbook

### LCP (Largest Contentful Paint)
- Preload hero image: `<link rel="preload" as="image" href="...">`
- Exclude hero from lazy loading
- Use AVIF format for hero images
- Inline critical CSS for above-fold content

### TBT (Total Blocking Time)
- Enable Perfmatters JS delay
- Exclude critical scripts from delay
- Defer non-critical JavaScript

### CLS (Cumulative Layout Shift)
- Set explicit width/height on images
- Reserve space for ads/embeds
- Avoid dynamic content injection above fold

### FCP (First Contentful Paint)
- Enable Perfmatters Remove Unused CSS
- Preload critical fonts
- Minimize server response time (Kinsta caching)

## Kinsta-Specific Rules

- Cache clearing: `.claude/scripts/clear-cache.sh` ONLY
- Never use `wp kinsta cache purge` directly
- Wait for `X-Kinsta-Cache: HIT` before re-testing
- Cloudflare CDN propagation: ~30 seconds

## Verification

- PageSpeed score >= 90 mobile
- No regression in other Lighthouse categories
- Site visually intact (no layout breaks)

## Failure Modes

| Problem | Fix |
|---------|-----|
| Score drops after fix | Revert change, analyze what broke |
| Cache not clearing | Check Kinsta dashboard, manual purge |
| RUCSS breaking styles | Add stylesheet to Perfmatters exclusions |

## Escalation

Escalate when optimization requires server-level changes (PHP workers, memory limits, Redis configuration) - these are done via Kinsta dashboard.
