---
icon: material/tag
---

# Releasing

How maintainers cut a new version of the Blaze Dev Kit.

!!! note "Maintainers Only"
    Only @jarutosurano and @jaborjkath can create releases.

## Release Process

### 1. Ensure `develop` is Stable

All features and fixes for this release should be merged to `develop` and tested.

### 2. Create Release PR

```bash
git checkout develop
git pull origin develop
git checkout -b release/v0.2.0
```

Update version files:
```bash
echo "v0.2.0" > VERSION
echo "v0.2.0" > deploy/VERSION
```

Update `CHANGELOG.md` with the new version section.

```bash
git add VERSION deploy/VERSION CHANGELOG.md
git commit -m "chore(release): prepare v0.2.0"
git push -u origin release/v0.2.0
```

Create a PR from `release/v0.2.0` → `main`.

### 3. Merge to Main

After approval and CI checks pass, merge the PR.

### 4. Tag the Release

```bash
git checkout main
git pull origin main
git tag v0.2.0
git push origin v0.2.0
```

### 5. Automated Release

Pushing the tag triggers `release.yml` which:

1. Runs security checks
2. Builds the deploy zip from `deploy/` directory
3. Verifies the zip against `FILE_MAPPING.md`
4. Creates a GitHub Release with:
    - `blaze-dev-kit-v0.2.0.zip` attached
    - Changelog excerpt as release notes

### 6. Merge Back to Develop

```bash
git checkout develop
git merge main
git push origin develop
```

## Versioning Rules

| Change | Version Bump | Example |
|--------|-------------|---------|
| Breaking changes to deploy structure | **MAJOR** | v0.1.0 → v1.0.0 |
| New skills, commands, agents, scripts | **MINOR** | v0.1.0 → v0.2.0 |
| Bug fixes, doc updates, minor tweaks | **PATCH** | v0.1.0 → v0.1.1 |

## Deploy Zip Contents

The zip is built from the `deploy/` directory only:

```bash
# What the release workflow runs:
cd deploy && zip -r ../blaze-dev-kit-v0.2.0.zip .claude/ VERSION
```

The zip extracts to create `.claude/` and `VERSION` in the target directory.

## Verification

After release:

1. Download the zip from the release page
2. Extract and verify structure matches `FILE_MAPPING.md`
3. Test on a staging Kinsta site
4. Run `/init` and verify CLAUDE.md generation
