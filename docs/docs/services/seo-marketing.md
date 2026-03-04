---
icon: material/chart-line
---

# SEO & Marketing

The SEO & Marketing service provides technical SEO expertise and optimization guidance for WordPress sites.

## Current Capabilities

The kit includes SEO knowledge as part of the broader skill set:

- **Technical SEO auditing** via the `wordpress-master` and `wp-performance` skills
- **Schema markup** guidance for WooCommerce products
- **Core Web Vitals** optimization (directly tied to PageSpeed optimization)
- **Structured data** validation
- **Rank Math** plugin configuration (part of the standard Blaze Commerce stack)

## Integration with Other Services

SEO is deeply connected to other services:

| Service | SEO Impact |
|---------|-----------|
| **Site Optimization** | Core Web Vitals directly affect search rankings |
| **WPM** | Keeping plugins updated prevents SEO-impacting bugs |
| **Web Development** | Proper heading hierarchy, semantic HTML, alt text |

## CLAUDE-BASE-SEO.md Template

The SEO base template includes guidelines for:

- Rank Math configuration best practices
- Schema markup patterns for products, articles, local business
- XML sitemap optimization
- Robots.txt configuration
- Canonical URL management
- Open Graph and Twitter Card meta
- Internal linking structure
- Image SEO (alt text, file naming, compression)

## Roadmap

!!! info "Planned Enhancements"
    Dedicated `/seo-audit` command and `wp-seo-specialist` agent are planned for future releases. See the [Roadmap](../roadmap/index.md) for details.

## File Mapping

```
.claude/
├── skills/
│   ├── wp-performance/SKILL.md         # Core Web Vitals (shared with Optimization)
│   └── wordpress-master/SKILL.md       # Technical SEO via WP architecture (shared)
│
└── templates/
    └── CLAUDE-BASE-SEO.md              # SEO service base template (Rank Math, schema, meta)
```
