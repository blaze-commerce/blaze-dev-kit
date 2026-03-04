---
name: wp-rest-api
description: "WordPress REST API - endpoint registration, authentication, troubleshooting"
compatibility: "WordPress 6.4+, PHP 8.0+"
---

## When to Use
When creating custom REST endpoints, working with the REST API, or debugging API issues.

## Inputs Required
- Endpoint purpose (CRUD operations, custom logic)
- Authentication requirements
- Data schema

## Procedure
1. Register routes via `register_rest_route()` in `rest_api_init`
2. Define permission callbacks (`current_user_can`)
3. Implement endpoint callbacks with proper validation
4. Define schema for request/response
5. Test with WP REST API client or curl

## Verification
- Endpoints respond correctly at `/wp-json/namespace/v1/route`
- Authentication works (cookie, application passwords, or OAuth)
- Permission callbacks properly restrict access
- Response schema matches documentation
- 401/403/404 errors return proper messages

## Failure Modes
| Problem | Fix |
|---------|-----|
| 401 Unauthorized | Check authentication method, verify nonce for cookie auth |
| 403 Forbidden | Check permission_callback, user capabilities |
| 404 Not Found | Flush rewrite rules, check route registration timing |
| rest_no_route | Verify namespace and route pattern |

## Escalation
Escalate when REST API issues involve server-level caching (Kinsta may cache GET requests).
