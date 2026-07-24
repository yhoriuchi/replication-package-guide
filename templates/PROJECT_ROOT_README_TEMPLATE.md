# [Research Project Name]

This is the common local workspace for the manuscript, analysis, AI collaboration history, and non-core project materials. Use it as the single AI workspace regardless of the assistant or interface.

## Project

- Working title: [Title]
- Authors: [Authors]
- Target journal: [Journal or not yet selected]
- Journal instructions: [Official URL or local file]
- Instructions accessed: [Date]
- Synchronized storage service: [Dropbox / Google Drive / iCloud / SharePoint / Box / another institutionally approved service]
- Cloud-data restrictions: [Any files that must remain outside the sync service]
- Storage recommendation status: [Common root synchronized / secure exception documented / decision pending]
- Governing requirements: [Law/regulation, consent, ethics/IRB, privacy/security, contract/license, data-use agreement, funder, and institutional rules]
- AI Collaboration Guide: `https://yhoriuchi.github.io/ai-collaboration-guide/`
- AI Collaboration Guide accessed: [Date]

## Instructions

- Canonical instruction file: `AGENTS.md`
- Update policy: append or carefully merge new instructions; never replace, overwrite, truncate, or discard the existing file.
- Conflict policy: preserve existing requirements and resolve conflicts explicitly without duplicating equivalent sections.
- Analysis repository name: `analysis/` regardless of the software or programming language used.

## Folder Map

```text
Research-Project/
|-- AGENTS.md
|-- README.md
|-- manuscript/
|-- analysis/
|-- project_history/
`-- others/
```

## Manuscript Repository

- Local path: `manuscript/`
- Remote: [Repository URL]
- Default branch: [Branch]
- Overleaf: [GitHub Sync status and project name]
- Contents: LaTeX, bibliography, active supplementary materials, and compilation assets only.

## Analysis Repository

- Local path: `analysis/`
- Remote: [Private repository URL]
- Default branch: [Branch]
- Secure local data: [Expected path or policy]
- Analysis Git data exclusions: [Expected ignored paths]
- Intentionally Git-tracked public data: [Approved paths or none]
- Public replication-package staging: [Path or not yet created]
- Main execution entry point: [Path or not yet created]

## Analysis-to-Manuscript Promotion

Describe the documented or automated process that promotes manuscript-ready figures and tables from `analysis/` into `manuscript/`. Record generated source files, destination files, scripts, logs, and any manual formatting.

## Project History

- Active history root: `project_history/`
- Human collaborator folder: `project_history/[Person_Name]/`
- Filename convention: `YYYY-MM-DD by Agent.md`
- Policy: one active history for the whole project; append after every substantive AI task.
- Privacy: keep history private by default; do not copy sensitive content into it without authorization.
- Tools without file access: manually export or copy a concise substantive-task record here.
- Full recording instructions: the AI assistant must read the current AI Collaboration Guide before substantive work; users may read it for context but need not study the operational details.

## Other Materials

The optional `others/` folder contains [presentations, DAG sources, reading materials, archives, submission files, or other non-core materials]. Files here are not part of the public replication workflow unless explicitly documented.

## Current Status

- Manuscript synchronization:
- Analysis reproducibility:
- Data classification:
- Privacy/legal/ethics compliance:
- Public replication package:
- Known risks or open tasks:
