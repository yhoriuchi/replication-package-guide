# AI-Assisted Research Project Management and Replication Guide

This repository contains the public GitHub Pages guide and lightweight templates for managing an AI-assisted research project from Day 1 and preparing a high-quality replication package.

The publishable guide is in [`index.md`](index.md). The copy button on the site embeds [`AGENTS.md`](AGENTS.md), which contains tool-neutral plain-text instructions for AI coding assistants.

## What This Repo Provides

- [`AGENTS.md`](AGENTS.md): full agent/user instructions copied by the site button.
- [`assets/site.css`](assets/site.css): the custom GitHub Pages stylesheet.
- [`prompts/replication-package-agent.md`](prompts/replication-package-agent.md): optional starter prompt for providing project-specific paths and constraints.
- [`templates/README_TEMPLATE.md`](templates/README_TEMPLATE.md): a copyable starting point for the public package's one authoritative `README.md`.
- [`templates/PROJECT_ROOT_README_TEMPLATE.md`](templates/PROJECT_ROOT_README_TEMPLATE.md): a private root-level map for the single AI workspace and its two repositories.
- [`templates/release-readiness-report.md`](templates/release-readiness-report.md): structured final-report template for replication-package audits.
- [`templates/compact/`](templates/compact/): compact project structure for smaller replication packages.
- [`templates/build-analyze/`](templates/build-analyze/): larger structure with separate `build/` and `analyze/` stages.
- [`rules.dropboxignore`](rules.dropboxignore): Dropbox-root ignore rules for R/RStudio local and session files.

The guide recommends one common AI workspace from Day 1, with root `AGENTS.md`, root `README.md`, one `project_history/`, a compilation-focused `manuscript/` Git repository, and a private, software-neutral `analysis/` Git repository. New instructions must be appended or merged into an existing `AGENTS.md`, never substituted for it. When project rules permit, Dropbox, Google Drive, iCloud, SharePoint, Box, or another institutionally approved storage service should synchronize the authorized workspace. Git tracks only approved files inside the two child repositories, and data remain outside Git/GitHub by default. The public replication archive and journal production files remain separately staged artifacts.

The guide promotes transparency and reproducibility within binding privacy, confidentiality, security, consent, ethics/IRB, legal, regulatory, contractual, licensing, data-use, funder, and institutional requirements. Those obligations take priority over journal requirements and the guide.

## Public Site

The guide is designed to publish at:

<https://yhoriuchi.github.io/replication-package-guide/>

The site is intentionally a single two-step homepage rather than a multi-page manual. The top of `index.md` gives users one copy action for project setup and one for replication-package preparation; optional explanatory detail appears below. `AGENTS.md` remains the complete operational source copied with both prompts.

## Suggested Use

Give an agent:

1. The target journal's most up-to-date official replication-package instructions and their access date.
2. The replication package root.
3. The paper source files when available.
4. Any source-data restrictions.
5. The instructions copied from the public guide.

Require the agent to return a runnable package with one software-appropriate public entry point, per-script logs, an environment record, one authoritative public-package `README.md`, a complete figure/table crosswalk, a verified `MANIFEST-SHA256.txt`, and an extracted-archive test. For R, the provided templates use `master.R` and `session_info.log`. Keep the readiness report private unless the journal requests it.
