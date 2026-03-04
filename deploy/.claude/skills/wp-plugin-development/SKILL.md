---
name: wp-plugin-development
description: "WordPress plugin architecture - Settings API, hooks, data storage, activation/deactivation"
compatibility: "WordPress 6.4+, PHP 8.0+"
---

## When to Use
When building custom plugins, extending existing plugins, or implementing plugin-level functionality.

## Inputs Required
- Plugin purpose and requirements
- Data storage needs
- Integration points (hooks, filters, REST API)

## Procedure
1. Define plugin header and structure
2. Implement activation/deactivation hooks
3. Register settings via Settings API or custom admin pages
4. Implement core functionality with proper hooks
5. Add uninstall cleanup (uninstall.php)
6. Test activation, functionality, deactivation

## Verification
- Plugin activates without errors
- Settings save and load correctly
- Hooks fire at correct priority
- Uninstall removes all plugin data
- No conflicts with existing plugins

## Failure Modes
| Problem | Fix |
|---------|-----|
| Fatal error on activation | Check PHP compatibility, missing dependencies |
| Settings not saving | Verify nonce, option name, register_setting() |
| Hook not firing | Check add_action timing and priority |

## Escalation
Escalate when the plugin needs to modify WooCommerce checkout flow or payment processing.
