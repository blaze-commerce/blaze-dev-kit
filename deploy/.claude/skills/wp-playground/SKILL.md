---
name: wp-playground
description: "WordPress Playground for rapid local testing and prototyping via Blueprints"
compatibility: "WordPress 6.4+, Modern browser"
---

## When to Use
When you need a quick disposable WordPress environment for testing plugins, themes, or code snippets without affecting production.

## Inputs Required
- What needs to be tested (plugin, theme, code snippet)
- WordPress version requirements
- Plugin/theme dependencies

## Procedure
1. Define Blueprint JSON for the test environment
2. Launch WordPress Playground with the Blueprint
3. Execute tests
4. Document results
5. Dispose of environment

## Blueprint Example
```json
{
  "landingPage": "/wp-admin/",
  "preferredVersions": { "wp": "6.5", "php": "8.2" },
  "steps": [
    { "step": "installPlugin", "pluginZipFile": { "resource": "wordpress.org/plugins", "slug": "woocommerce" } },
    { "step": "installTheme", "themeZipFile": { "resource": "wordpress.org/themes", "slug": "blocksy" } }
  ]
}
```

## Verification
- Playground launches with correct WordPress version
- Plugins and themes install correctly
- Test scenario completes without errors

## Failure Modes
| Problem | Fix |
|---------|-----|
| Plugin install fails | Check slug name, try manual zip URL |
| PHP version mismatch | Adjust preferredVersions in Blueprint |

## Escalation
Playground is for prototyping only. Production changes must go through the normal deployment workflow.
