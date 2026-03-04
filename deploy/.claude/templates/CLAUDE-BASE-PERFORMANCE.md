# Performance Optimization - Service Base

## Performance Targets

| Metric | Target | Description |
|--------|--------|-------------|
| Performance Score | >= 90 | Mobile PageSpeed Insights |
| FCP | < 1800ms | First Contentful Paint |
| LCP | < 2500ms | Largest Contentful Paint |
| TBT | < 200ms | Total Blocking Time |
| CLS | < 0.1 | Cumulative Layout Shift |
| SI | < 3400ms | Speed Index |

## Standard Stack for Optimization

- **Perfmatters**: Primary performance plugin (WP-CLI enabled)
- **ShortPixel**: Image optimization (AVIF, WebP, responsive)
- **Kinsta Cache**: Server-level cache (clear via `.claude/scripts/clear-cache.sh`)
- **Cloudflare**: CDN (if configured)

## Optimization Priority Order

1. LCP image preloading
2. DOM size reduction
3. JavaScript delay/deferral (Perfmatters)
4. Render-blocking CSS elimination
5. Font optimization (preload, display:swap)
6. Image optimization (AVIF conversion, proper srcset)
7. Third-party script management

## Perfmatters WP-CLI Commands

```bash
# Enable/disable features
wp perfmatters update --delay-js=1
wp perfmatters update --remove-unused-css=1

# Import/export settings
wp perfmatters export > perfmatters-backup.json
wp perfmatters import < perfmatters-settings.json
```

## Kinsta Cache Rules

- **NEVER** run `wp kinsta cache purge` - it causes performance degradation
- Use `.claude/scripts/clear-cache.sh` which coordinates Perfmatters + Kinsta properly
- Wait for `X-Kinsta-Cache: HIT` before re-testing

## Image Optimization

```bash
# Convert to AVIF
ffmpeg -i input.jpg -c:v libaom-av1 -crf 30 output.avif

# Resize oversized images
ffmpeg -i input.jpg -vf "scale=1920:-1" output.jpg
```

## Code Conventions

- Function prefix: `blaze_` for performance fixes
- Always add to child theme `functions.php`, never parent theme
- Use Code Snippets Pro for small, isolated fixes
