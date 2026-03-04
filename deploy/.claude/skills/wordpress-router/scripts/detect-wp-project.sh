#!/bin/bash
# Blaze Dev Kit - WordPress Project Triage
# Deterministic detection of WordPress environment.
# Outputs structured JSON for the router skill.

set -euo pipefail

# Initialize output
OUTPUT="{}"

# WordPress version
WP_VERSION=$(wp core version 2>/dev/null || echo "unknown")

# PHP version
PHP_VERSION=$(php -r "echo PHP_VERSION;" 2>/dev/null || echo "unknown")

# Active theme
ACTIVE_THEME=$(wp theme list --status=active --field=name 2>/dev/null || echo "unknown")

# Check for child theme
CHILD_THEME="none"
if [[ -f "wp-content/themes/${ACTIVE_THEME}/style.css" ]]; then
  TEMPLATE=$(grep -i "^Template:" "wp-content/themes/${ACTIVE_THEME}/style.css" 2>/dev/null | sed 's/Template:\s*//' | tr -d '\r')
  if [[ -n "$TEMPLATE" ]]; then
    CHILD_THEME="$ACTIVE_THEME"
    ACTIVE_THEME="$TEMPLATE"
  fi
fi

# WooCommerce
WOOCOMMERCE="false"
wp plugin is-active woocommerce 2>/dev/null && WOOCOMMERCE="true"

# Multisite
MULTISITE="false"
wp core is-installed --network 2>/dev/null && MULTISITE="true"

# Plugin count
PLUGIN_COUNT=$(wp plugin list --status=active --format=count 2>/dev/null || echo "0")

# Site URL
SITE_URL=$(wp option get siteurl 2>/dev/null || echo "unknown")

# Blaze Dev Kit version
KIT_VERSION="unknown"
if [[ -f ".claude/../VERSION" ]]; then
  KIT_VERSION=$(cat .claude/../VERSION 2>/dev/null | tr -d '\n')
elif [[ -f "VERSION" ]]; then
  KIT_VERSION=$(cat VERSION 2>/dev/null | tr -d '\n')
fi

# Key plugins detection
HAS_PERFMATTERS=$(wp plugin is-active perfmatters 2>/dev/null && echo "true" || echo "false")
HAS_RANK_MATH=$(wp plugin is-active seo-by-rank-math 2>/dev/null && echo "true" || echo "false")
HAS_BLOCKSY=$(echo "$ACTIVE_THEME" | grep -qi "blocksy" && echo "true" || echo "false")
HAS_ELEMENTOR=$(wp plugin is-active elementor 2>/dev/null && echo "true" || echo "false")

# Output JSON
cat <<EOF
{
  "wordpress_version": "${WP_VERSION}",
  "php_version": "${PHP_VERSION}",
  "active_theme": "${ACTIVE_THEME}",
  "child_theme": "${CHILD_THEME}",
  "woocommerce": ${WOOCOMMERCE},
  "multisite": ${MULTISITE},
  "plugin_count": ${PLUGIN_COUNT},
  "site_url": "${SITE_URL}",
  "kit_version": "${KIT_VERSION}",
  "stack": {
    "perfmatters": ${HAS_PERFMATTERS},
    "rank_math": ${HAS_RANK_MATH},
    "blocksy": ${HAS_BLOCKSY},
    "elementor": ${HAS_ELEMENTOR}
  },
  "hosting": "kinsta"
}
EOF
