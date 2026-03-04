---
name: senior-architect
description: "Architectural decision framework - code review, trade-off evaluation, design patterns"
compatibility: "WordPress 6.4+, PHP 8.0+"
---

## When to Use

When making architectural decisions, reviewing code for design quality, or evaluating trade-offs between approaches.

## Procedure

1. Understand the requirement and constraints
2. Identify 2-3 viable approaches
3. Evaluate each against: maintainability, performance, security, scalability
4. Recommend with clear reasoning
5. Document the decision

## Decision Framework

For each approach, evaluate:

| Criterion | Weight | Notes |
|-----------|--------|-------|
| Maintainability | High | Can the team understand and modify this? |
| Performance | High | Does it meet Core Web Vitals targets? |
| Security | Critical | Does it follow OWASP best practices? |
| WordPress Standards | High | Does it follow WP conventions? |
| Scalability | Medium | Will it work as the site grows? |
| Complexity | Medium | Is it the simplest solution that works? |

## Verification

- Decision is documented with reasoning
- Chosen approach follows WordPress standards
- Security implications reviewed
- Performance impact assessed

## Escalation

Escalate when the decision has irreversible consequences (database schema changes, API contract changes, third-party integrations).
