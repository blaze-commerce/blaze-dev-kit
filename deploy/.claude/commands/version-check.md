---
description: "Check if the Blaze Dev Kit is up to date"
---

# /version-check

Check the installed Blaze Dev Kit version against the latest release.

## Procedure

1. Run `.claude/scripts/check-version.sh`
2. Report the results:
   - Current local version
   - Latest available version
   - Whether an update is available
3. If an update is available, instruct the user to run `.claude/scripts/update-dev-kit.sh`
