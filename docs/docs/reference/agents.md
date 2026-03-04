---
icon: material/robot
---

# Agents Reference

AI subagents in the Blaze Dev Kit, organized by model tier.

## What Are Agents?

Agents are specialist AI subprocesses that Claude Code spawns for specific tasks. Each agent has:

- **Restricted tool access** (principle of least privilege)
- **Assigned model tier** (opus for deep reasoning, sonnet for everyday, haiku for quick tasks)
- **Domain expertise** defined in its instruction file

## Model Routing

| Model | Cost | Speed | Use Case |
|-------|------|-------|----------|
| **opus** | High | Slower | Architecture, security, complex migrations |
| **sonnet** | Medium | Balanced | Everyday development, optimization |
| **haiku** | Low | Fast | Quick audits, lookups, simple analysis |

## Agent Inventory

### Orchestrator

| Agent | Model | Tools | Purpose |
|-------|-------|-------|---------|
| **wp-orchestrator** | opus | All | Meta-agent that routes complex tasks to the right specialist |

### Auditors (Read-Only)

| Agent | Model | Tools | Purpose |
|-------|-------|-------|---------|
| **wp-theme-auditor** | haiku | Read, Grep, Glob | Theme structure analysis, standards compliance |
| **wp-plugin-auditor** | haiku | Read, Grep, Glob | Plugin code review, security patterns |

### Specialists

| Agent | Model | Tools | Purpose |
|-------|-------|-------|---------|
| **wp-security-auditor** | sonnet | Read, Grep, Glob, Bash | Vulnerability scanning, security hardening |
| **wp-performance-optimizer** | sonnet | Read, Write, Edit, Bash, Glob, Grep | Performance implementation |
| **wp-woo-specialist** | sonnet | Read, Write, Edit, Bash, Glob, Grep | WooCommerce development |
| **wp-migration-specialist** | opus | All | Site migrations, data imports, URL mapping |

## How Agents Are Invoked

Agents are invoked automatically by Claude Code when it determines a task matches the agent's description. You can also reference them explicitly:

> "Use the wp-security-auditor agent to scan this plugin for vulnerabilities"

The **wp-orchestrator** acts as the default router for complex tasks, delegating to the appropriate specialist.

## Agent File Format

Each agent is a single `.md` file in `.claude/agents/`:

```yaml
---
name: agent-name
description: "When to invoke this agent"
tools: Read, Grep, Glob
model: haiku
---

You are a senior [role] specializing in [domain]...

## Initialization Protocol
## Procedure
## Verification
## Integration with Other Agents
```

## Security

- **Auditor agents** only have read access - they cannot modify files
- **Specialist agents** have write access scoped to their domain
- **All agents** inherit the safety hooks (block-dangerous-commands, block-protected-files)
