---
name: wp-interactivity-api
description: "WordPress Interactivity API - data-wp-* directives, stores, state synchronization"
compatibility: "WordPress 6.5+, PHP 8.0+"
---

## When to Use
When implementing client-side interactivity in WordPress blocks using the Interactivity API.

## Inputs Required
- Interactive behavior requirements
- Block context (which block needs interactivity)
- State management needs

## Procedure
1. Register interactivity store with namespace
2. Add `data-wp-interactive` to root element
3. Implement directives: `data-wp-bind`, `data-wp-on`, `data-wp-text`, `data-wp-class`
4. Define store with state and actions
5. Handle server-side state initialization
6. Test hydration and reactivity

## Verification
- Directives bind correctly on page load
- State updates reflect in DOM
- Server-rendered HTML hydrates without flicker
- No console errors related to interactivity

## Failure Modes
| Problem | Fix |
|---------|-----|
| Directives not working | Check `data-wp-interactive` on parent, verify namespace |
| State not syncing | Verify store registration, check action names |
| Hydration mismatch | Ensure server render matches initial state |

## Escalation
Escalate when interactivity conflicts with Perfmatters JS delay or other script optimization.
