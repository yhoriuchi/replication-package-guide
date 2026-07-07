# Replication Package Guide

This repository contains the public GitHub Pages guide and lightweight templates for preparing high-quality social science replication packages.

The publishable guide is in [`index.md`](index.md). The copy button on the site embeds [`AGENTS.md`](AGENTS.md), which contains the plain-text instructions for Codex, Claude Code, or another coding agent.

## What This Repo Provides

- [`AGENTS.md`](AGENTS.md): full agent/user instructions copied by the site button.
- [`assets/site.css`](assets/site.css): the custom GitHub Pages stylesheet.
- [`templates/README_TEMPLATE.md`](templates/README_TEMPLATE.md): a copyable starting point for a project's one authoritative `README.md`.
- [`templates/compact/`](templates/compact/): compact project structure for smaller replication packages.
- [`templates/build-analyze/`](templates/build-analyze/): larger structure with separate `build/` and `analyze/` stages.
- [`examples/horiuchi_tago/`](examples/horiuchi_tago/): a completed compact package example.
- [`rules.dropboxignore`](rules.dropboxignore): Dropbox-root ignore rules for R/RStudio local and session files.

## Public Site

The guide is designed to publish at:

<https://yhoriuchi.github.io/replication-package-guide/>

The site is intentionally a single practical homepage rather than a multi-page documentation site. Keep `index.md` as the Pages entry point and `AGENTS.md` as the source copied by the primary button.

## Suggested Use

Give an agent:

1. The replication package root.
2. The paper source files when available.
3. Any source-data restrictions.
4. The instructions copied from the public guide.

Require the agent to return a runnable package with `master.R`, per-script logs, `session_info.log`, one authoritative `README.md`, and a complete figure/table crosswalk.
