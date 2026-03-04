---
name: wp-block-development
description: "Gutenberg block creation - apiVersion 3, block.json, React/JSX in WordPress"
compatibility: "WordPress 6.4+, PHP 8.0+, Node.js 18+"
---

## When to Use
When creating custom Gutenberg blocks, modifying existing blocks, or working with the Block Editor.

## Inputs Required
- Block purpose and functionality requirements
- Whether it's a static or dynamic block

## Procedure
1. Scaffold block with `@wordpress/create-block`
2. Configure `block.json` (apiVersion 3, attributes, supports)
3. Implement Edit component (React/JSX)
4. Implement save function or server-side render
5. Register block in plugin or theme
6. Test in editor and frontend

## Verification
- Block appears in inserter
- No "Invalid block" errors
- Frontend render matches editor preview
- Attributes save and load correctly

## Failure Modes
| Problem | Fix |
|---------|-----|
| Block validation error | Check save output matches stored HTML |
| Attributes not saving | Verify attribute source selectors |
| Styles not loading | Check block.json editorStyle/style paths |

## Escalation
Escalate when blocks require complex server-side rendering with external API calls.
