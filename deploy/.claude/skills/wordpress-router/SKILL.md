---
name: wordpress-router
description: "Entry-point skill that classifies WordPress projects and routes to specialist skills"
compatibility: "WordPress 6.4+, PHP 8.0+, Kinsta hosting"
---

## When to Use

This skill is the default entry point for any WordPress task. It runs before specialist skills to determine the correct routing.

## Inputs Required

- Access to the WordPress installation via WP-CLI
- The user's task or question

## Procedure

### Step 1: Run Project Triage

Execute `.claude/skills/wordpress-router/scripts/detect-wp-project.sh` to get deterministic project data.

### Step 2: Classify the Task

Map the user's intent to a skill:

| User Intent | Route To |
|-------------|----------|
| Performance, speed, PageSpeed | `wp-performance` |
| Security, vulnerabilities, audit | `security-auditor` |
| Database, queries, optimization | `database-administrator` |
| Block/Gutenberg development | `wp-block-development` |
| Theme, FSE, block theme | `wp-block-themes` |
| Plugin architecture | `wp-plugin-development` |
| REST API, endpoints | `wp-rest-api` |
| Interactivity, client-side | `wp-interactivity-api` |
| WP-CLI, operations, migration | `wp-wpcli-ops` |
| Architecture, code review | `senior-architect` |
| PHP, coding standards | `php-pro` |
| General WordPress | `wordpress-master` |

**Intent overrides project classification.** If someone asks about REST API in a plugin project, route to `wp-rest-api`, not `wp-plugin-development`.

### Step 3: Load the Specialist Skill

Load the appropriate skill's SKILL.md and follow its procedure.

## Verification

- Triage script produces valid output
- Correct specialist skill is identified
- Specialist skill is loaded and followed

## Failure Modes

| Problem | Fix |
|---------|-----|
| WP-CLI not available | Fall back to file-based detection |
| Ambiguous intent | Ask the user to clarify |
| Multiple skills apply | Load primary skill, reference secondary |

## Escalation

If the task doesn't map to any available skill, inform the user and ask for clarification.
