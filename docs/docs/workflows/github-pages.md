---
icon: material/github
---

# GitHub Pages Workflow

How the documentation site is built and deployed.

## Overview

The Blaze Dev Kit documentation is built with [MkDocs Material](https://squidfunk.github.io/mkdocs-material/) and deployed to GitHub Pages automatically on every merge to `main`.

**Live site**: [blaze-commerce.github.io/blaze-dev-kit](https://blaze-commerce.github.io/blaze-dev-kit/)

## How It Works

```mermaid
graph LR
    A[Merge to main] --> B[deploy-docs.yml triggers]
    B --> C[Install Python + MkDocs]
    C --> D[Build static site]
    D --> E[Deploy to gh-pages branch]
    E --> F[Site live on GitHub Pages]
```

## Local Development

### Setup

```bash
cd docs/
pip install -r requirements.txt
```

### Preview

```bash
mkdocs serve
```

This starts a local server at `http://127.0.0.1:8000/` with live reload.

### Build

```bash
mkdocs build
```

Output goes to `docs/site/` (gitignored).

## Making Documentation Changes

1. Create a `docs/` branch: `git checkout -b docs/update-installation`
2. Edit files in `docs/docs/`
3. Preview locally with `mkdocs serve`
4. Commit and create PR to `develop`
5. After merge to `develop` → `main`, the site auto-deploys

## Adding New Pages

1. Create the `.md` file in the appropriate directory under `docs/docs/`
2. Add the page to the `nav` section in `docs/mkdocs.yml`
3. Update `FILE_MAPPING.md` if needed

## Private Repo + Public Docs

The repository is **private** but GitHub Pages is **public**. This means:

- Source code, skills, hooks, scripts = private (repo access only)
- Documentation website = publicly accessible

This is the expected behavior on GitHub Pro. If you need the docs site itself to be private (restricted to team members only), that requires GitHub Enterprise Cloud.

!!! tip "What NOT to put in docs"
    Never include API keys, credentials, internal URLs, or sensitive client information in the documentation. The docs site is publicly accessible.
