# Replication Package Guide

This repository contains the public GitHub Pages guide and lightweight templates for preparing high-quality social science replication packages.

The publishable guide is in [`index.md`](index.md). The copy button on the site embeds [`AGENTS.md`](AGENTS.md), which contains the plain-text instructions for Codex, Claude Code, or another coding agent.

## What This Repo Provides

- [`AGENTS.md`](AGENTS.md): full agent/user instructions copied by the site button.
- [`assets/site.css`](assets/site.css): the custom GitHub Pages stylesheet.
- [`prompts/replication-package-agent.md`](prompts/replication-package-agent.md): optional starter prompt for providing project-specific paths and constraints.
- [`templates/README_TEMPLATE.md`](templates/README_TEMPLATE.md): a copyable starting point for a project's one authoritative `README.md`.
- [`templates/release-readiness-report.md`](templates/release-readiness-report.md): structured final-report template for replication-package audits.
- [`templates/compact/`](templates/compact/): compact project structure for smaller replication packages.
- [`templates/build-analyze/`](templates/build-analyze/): larger structure with separate `build/` and `analyze/` stages.
- [`rules.dropboxignore`](rules.dropboxignore): Dropbox-root ignore rules for R/RStudio local and session files.

The guide recommends two sibling Git repositories under one research-project parent: a compilation-focused `manuscript/` repository and a private `analysis/` repository. The public replication archive and journal production files are staged as separate artifacts.

## Public Site

The guide is designed to publish at:

<https://yhoriuchi.github.io/replication-package-guide/>

The site is intentionally a single practical homepage rather than a multi-page documentation site. Keep `index.md` as the Pages entry point and `AGENTS.md` as the source copied by the primary button.

## Suggested Use

Give an agent:

1. The target journal's most up-to-date official replication-package instructions and their access date.
2. The replication package root.
3. The paper source files when available.
4. Any source-data restrictions.
5. The instructions copied from the public guide.

Require the agent to return a runnable package with `master.R`, per-script logs, `session_info.log`, one authoritative `README.md`, a complete figure/table crosswalk, a verified `MANIFEST-SHA256.txt`, and an extracted-archive test. Keep the readiness report private unless the journal requests it.
