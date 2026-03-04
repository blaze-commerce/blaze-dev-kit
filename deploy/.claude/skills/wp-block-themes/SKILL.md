---
name: wp-block-themes
description: "Block theme development - theme.json, templates, template parts, style variations"
compatibility: "WordPress 6.4+, PHP 8.0+, Blocksy theme"
---

## When to Use
When working with block themes, Full Site Editing, theme.json configuration, or template customization.

## Inputs Required
- Theme structure (parent/child)
- Desired customization scope

## Procedure
1. Review theme.json configuration (settings, styles, customTemplates)
2. Identify template hierarchy for the target page
3. Create/modify templates in child theme
4. Configure style variations if needed
5. Test with Site Editor

## Verification
- Templates load correctly in Site Editor
- Style cascade: user > child theme.json > parent theme.json > core
- No PHP errors in template rendering
- Responsive design intact

## Failure Modes
| Problem | Fix |
|---------|-----|
| Template not overriding | Check file naming matches parent exactly |
| Styles not applying | Verify theme.json path and specificity |
| Block patterns missing | Check pattern registration and categories |

## Escalation
Escalate for complex Blocksy-specific FSE integrations that may conflict with the Blocksy Companion plugin.
