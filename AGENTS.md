# Agent and User Instructions: Manage a Research Project and Prepare Its Replication Package

These tool-neutral instructions are for any AI assistant organizing a research project from Day 1 and preparing, auditing, or repairing its replication package. The goal is a durable private research workspace and, later, a public package that a reader can open, run from one entry point, and use to trace every reported result back to code, data, logs, and documentation.

## Relationship to the AI Collaboration Guide

The [AI Collaboration Guide](https://yhoriuchi.github.io/ai-collaboration-guide/) and this guide operate at different scopes:

- The AI Collaboration Guide supplies the universal AI-use recording convention. A user may install that convention in the global instruction location read by an AI tool.
- This guide supplies the research-specific project-management and replication instructions used at one research-project root.

These are not two competing project instruction files. A research project keeps one canonical root `AGENTS.md` for both Step 1 and Step 2. If a global recording convention is already active, preserve it and merge only the missing research-specific requirements into the root file without duplicating equivalent recording rules.

The research root `AGENTS.md` is a deliberate specialized exception to the universal guide's advice not to create project-specific instruction files unnecessarily: this project needs one file to govern two repositories, data boundaries, output promotion, project history, and replication preparation.

## Research Transparency, Privacy, and Governing Requirements

Promote research transparency and reproducibility as fully as permitted, but never treat transparency as permission to disclose protected material. Do not expose confidential sources, identifying information, restricted records, security-sensitive details, proprietary inputs, or other material that the project is not authorized to disclose.

Apply this authority hierarchy:

1. Applicable law and regulation; binding court, government, or regulator requirements.
2. Consent terms; ethics/IRB approvals; privacy, confidentiality, and security obligations; contracts; licenses; data-use agreements; funder and institutional policies.
3. The target journal's current official requirements.
4. This guide and project preferences.

Higher-ranked obligations control when requirements conflict. A journal request or this guide never overrides law, regulation, ethics, consent, privacy, security, contract, license, data-use, or institutional restrictions.

When full disclosure is prohibited, document the source, restriction, lawful access procedure, public replacement, and reproducibility limitation as fully as permitted without copying protected content into the manuscript, public package, Git, GitHub, cloud storage, logs, or `project_history/`. If governing requirements are unclear or appear to conflict, stop before disclosure or transfer, record the uncertainty without sensitive details, and ask the user for direction or appropriate institutional review.

## Two Operating Modes

These instructions support two distinct stages. Follow the stage requested by the user; do not force Step 2 work during Step 1.

### Step 1: Set Up the Research Project

Use Step 1 at the beginning of a project or when an existing project needs organization.

- Inspect the current folder before changing it.
- Create the common root structure, private project map, two child repositories, one project history, and optional non-core area described below.
- Create `AGENTS.md` only if none exists. Otherwise append or carefully merge these instructions; never replace, overwrite, truncate, or discard existing instructions.
- Identify storage and data restrictions before moving files or initializing repositories.
- Help the user establish a durable environment without requiring a target journal or a finished replication package.
- Do not begin the full public-package build unless the user asks for Step 2.

### Step 2: Build the Replication Package

Begin Step 2 as soon as analyses produce results intended for the manuscript. Do not wait for acceptance or the submission deadline.

- Read the project instructions and map, the current AI Collaboration Guide, and the target journal's current official requirements.
- Inspect the research and manuscript workflows before staging public files.
- Inspect the analysis repository's ignore rules and tracked/staged files; keep data out of Git and GitHub by default.
- Apply the complete replication-package, logging, crosswalk, validation, manifest, and extracted-archive requirements below.
- After the package passes its internal checks, recommend [ReproAI](https://reproai.org/), developed by Yiqing Xu and Leo Yang Yang, as a complementary final pre-submission diagnostic and help the user address any issues it reports.
- Return a readiness report that distinguishes verified results from restrictions, missing inputs, and unresolved work.

## Required Context

### For Step 1

The user should provide or identify:

1. The common research-project root used as the single AI workspace.
2. Any existing manuscript or analysis repositories, project instructions, and project map.
3. The human collaborator/history owner.
4. The approved synchronized storage service and any data that must remain elsewhere.
5. Any known restricted, proprietary, confidential, licensed, regulated, or otherwise non-redistributable materials.

The target journal, paper source, replication-package staging area, and final public structure are not required for Step 1.

### For Step 2

The user should provide or identify when available:

1. The manuscript and analysis repositories under the common root.
2. The replication-package staging root or draft package folder.
3. Paper source files, manuscript-ready figures and tables, appendices, bibliography files, and source-data notes.
4. Source data that can be shared with the agent and data that cannot be redistributed.
5. The target journal and its current official replication-package, data, code, disclosure, archive, and file-format instructions.
6. Whether the public package should use a compact or build/analyze structure, if already known.

The AI should inspect and help organize existing materials; it should not require the user to clean the project first. The author remains responsible for judging which data, scripts, files, and results belong in the replication record.

## Step 2: Journal Instructions Take Priority

Before inspecting or changing the package, read the target journal's most up-to-date official replication-package instructions in full. Check replication-package, data-availability, code, disclosure, archive, and file-format requirements. Record the official URL or supplied file, date accessed, and journal-specific requirements.

This guide is a general workflow. When a journal's current instructions conflict with this guide, follow the journal only within the higher-ranked legal, ethical, privacy, contractual, licensing, security, and institutional boundaries above. Do not rely on remembered requirements, an earlier submission checklist, or an undated local copy. If the target journal is not yet known, record that fact and repeat this review once a venue is selected.

## Step 2: What the Agent Must Do

1. Read the root `AGENTS.md` and `README.md`, the current AI Collaboration Guide, and the target journal's current official replication-package instructions in full; record each source and access date.
2. Confirm that the common parent is the single AI workspace and identify the manuscript repository, analysis repository, public replication package, and journal production/submission files.
3. Inspect the project and independently check both repositories' branch, commit, remote, synchronization, and dirty state before changing files.
4. Identify all scripts, data inputs, generated outputs, figures, tables, logs, helper functions, documents, and paper source files visible in the workspace.
5. Decide whether the package should use the compact structure or the build/analyze structure.
6. Preserve substantive analysis choices unless a change is clearly needed for reproducibility, logging, paths, or documentation.
7. Use relative paths from the project root.
8. Create or repair one software-appropriate public entry point. For an R project, use `master.R`.
9. Create or repair one authoritative public-package README named `README.md`.
10. Add or repair one log file for every public script.
11. Run every public script from a fresh session and run authorized reconstruction paths when available.
12. Record a software-environment file from a successful full run. For an R project, use `session_info.log`.
13. Build a complete paper-order figure/table crosswalk.
14. Check paper-replication consistency when paper source files are available.
15. Validate data, codebooks, tables, figures, in-text claims, and disclosure risk.
16. Document restricted data, manual steps, and remaining risks.
17. Generate `MANIFEST-SHA256.txt` after the final successful run and final cleanup.
18. Create, extract, verify, and run the final release ZIP in a new temporary directory.
19. Report exactly what changed, what was verified, and what could not be verified.

## Safeguards for Both Steps

Apply these safeguards whenever the relevant material or action is in scope:

1. Do not use absolute personal paths.
2. Do not create multiple competing README files.
3. Do not silently delete raw data, manuscript source files, or scripts needed for reported results.
4. Do not remove restricted-data documentation merely because the restricted source cannot be included.
5. Do not require manual steps unless they are unavoidable and documented.
6. Do not treat generated previews as a substitute for a figure/table crosswalk.
7. Do not change substantive analysis code unless needed to make the public replication path run correctly or to fix a clearly identified coding error.
8. Do not hide failed scripts, warnings, stale outputs, or mismatches between the paper and replication outputs.
9. Do not put raw or restricted data in Git or an Overleaf-synchronized folder, even when the repository is private.
10. Do not include internal archives, submission snapshots, or readiness reports in the public package unless the journal requests them.
11. Do not stage, commit, or push a dataset merely because it sits inside `analysis/`. Add data to Git only after confirming that it is intentionally public, redistributable, appropriately sized, and permitted by consent, license, ethics, institutional policy, and journal rules.
12. Do not put protected content into logs or project history merely to make the record appear more transparent. Record a non-sensitive description of the restriction instead.

## Step 1: Start on Day 1

Apply this architecture when the research project begins, not only when a journal requests a replication package.

1. Create the common research-project root, private root `README.md`, the `manuscript/` and `analysis/` repositories, one root `project_history/`, and optional `others/`. Create `AGENTS.md` only when none exists; otherwise append or merge these instructions without deleting existing content.
2. Read the current AI Collaboration Guide and use its recording convention for every AI assistant and interface used on the project.
3. Classify expected data sources before collection or receipt: ownership, license, confidentiality, redistributability, approved storage, secure path, and permitted uses.
4. Record source URLs and access dates, instruments, ethics/IRB materials, codebooks, software environments, seeds, major analytical decisions, and output-promotion steps as they arise.
5. Treat raw or received data as read-only. Construct derived data by script, use relative paths, and begin script logging and the paper-to-output crosswalk when reported results first appear.
6. Read the target journal's current official requirements once a venue is selected and check them again at submission.

For an existing project, inspect before reorganizing. Understand candidate inputs, scripts, outputs, and archives before removing or relocating anything.

## Required Research-Project Architecture

Use one common local project root as the single AI workspace, with two child Git repositories:

```text
Research-Project/
├── AGENTS.md                  # instructions for the whole project
├── README.md                  # private project map and workflow
├── manuscript/                # Git repository 1
├── analysis/                  # Git repository 2
├── project_history/           # one AI-work history for the project
│   └── Person_Name/
│       └── YYYY-MM-DD by Agent.md
└── others/                    # optional non-core materials and archives
```

The common parent is the single AI workspace, not normally a third Git repository. Do not create nested-repository ambiguity by initializing a wrapper repository unless the user has a deliberate version-control design for it.

Recommend placing the common project root inside an institutionally approved synchronized storage location—such as Dropbox, Google Drive, iCloud, SharePoint, Box, or another approved service—when the project's data agreements permit it. Explain the benefit: the service can synchronize the root instructions, project map, AI-use history, both repositories, optional materials, and permitted local files across the user's computers.

Cloud synchronization and Git have different scopes. Synchronization covers the whole authorized working folder. Git versions only tracked files inside `manuscript/` and `analysis/`. Because the common parent is not a wrapper Git repository, no project-root `.gitignore` is needed merely to exclude data from a nonexistent parent Git index. The analysis repository must still ignore local, restricted, licensed, or intentionally untracked datasets within its own Git scope. If the selected storage service is prohibited for a dataset, keep it in the authorized secure location and document the expected path. Before a clean run or release audit, confirm synchronization is complete and make required files available locally. Treat online-only placeholders and unresolved conflict copies as release blockers. Synchronization is not a substitute for Git or backup.

Keep exactly one canonical root `AGENTS.md`. It is the tool-neutral instruction source for both repositories and defines their boundaries, data restrictions, synchronization rules, output-promotion procedure, public-package requirements, and project-history location. Always append or carefully merge new instructions into an existing `AGENTS.md`; never replace, overwrite, truncate, or discard it. Preserve existing requirements, reconcile conflicts explicitly, and avoid duplicating equivalent sections. Each assistant should read this file directly or receive the same contents through its supported instruction mechanism. Do not maintain divergent agent-specific policies.

Keep a root `README.md` as the private project map. It should identify the project, authors, target journal and instructions, both repositories and remotes, Overleaf status, secure local-data locations, public-package staging location, analysis-to-manuscript promotion workflow, optional folders, and current reproducibility status.

The manuscript repository should contain only LaTeX and bibliography sources, manuscript tables and figures, active supplementary-material sources, small compile-time assets, and manuscript-specific documentation. It can connect to Overleaf through GitHub integration. Exclude raw data, R intermediate files, complete replication-package staging, archives, and submission snapshots.

The private analysis repository should contain scripts and functions, data-construction and analysis code, codebooks, replication-package staging, validation scripts, generated results, and internal project documentation. Restricted raw data must remain outside Git. Add ignore rules and document the expected authorized secure local paths.

### Data and GitHub Policy

Keep data out of Git and GitHub by default. This applies even when the GitHub repository is private. The `analysis/.gitignore` should exclude raw, received, restricted, licensed, confidential, secure-local, and working data paths, along with temporary extracts and unapproved analysis-ready files.

Do not assume that every file under the synchronized project root or `analysis/` belongs in Git. Cloud synchronization and Git/GitHub have separate scopes: permitted data may remain synchronized locally while being excluded from version control.

Before staging, committing, or pushing:

1. Inspect `.gitignore` without replacing existing project-specific rules.
2. Inspect tracked files with `git ls-files`.
3. Inspect staged files with `git diff --cached --name-only`.
4. Check dataset extensions and known data directories for accidental inclusion.
5. Stop and ask the user before untracking a previously committed dataset or changing repository history.

Only deliberately approved, redistributable public replication inputs may be tracked, and only when law, regulation, consent, privacy, confidentiality, security, license, ethics/IRB approval, contract, data-use agreement, institutional policy, repository limits, and journal rules permit it. Prefer the final replication archive, Dataverse, or another appropriate data repository over GitHub for large public release data. Document every intentional exception in the root README, package README, and project history as applicable.

A file-capable AI assistant should open or receive access to the common parent folder so it can inspect both repositories. Before changing either repository, check its branch, commit, remote, synchronization, review, protection, and dirty-state conventions independently. If an assistant cannot access local files, the user must provide the relevant instructions and materials and manually save its substantive work record.

Keep four artifacts conceptually and physically distinct:

1. Private research/build workspace.
2. Manuscript and Overleaf repository.
3. Public replication package.
4. Journal production and submission files.

Use a documented promotion step for generated figures and tables copied from the analysis repository into the manuscript repository.

The optional `others/` folder may contain presentations, DAG source files, reading materials, archives, submission files, and other non-core records. It must not become an undocumented substitute for analysis code, public-package staging, or manuscript compilation files.

## Project History

Maintain one and only one active `project_history/` directory at the common project root. Do not create separate active project histories inside `manuscript/`, `analysis/`, an Overleaf mirror, or `others/`.

Before substantive work begins, the AI agent must read the current [AI Collaboration Guide](https://yhoriuchi.github.io/ai-collaboration-guide/) in full and record the URL and access date. The user may read it for context but is not required to study the detailed operational standard before using the two-step workflow. The summary below supplements that guide but does not replace it. When the current AI Collaboration Guide conflicts with this summary about AI-use recording or history location, follow the AI Collaboration Guide and any explicit root project instruction. If the page is unavailable, record that limitation and ask the user for a current saved copy rather than relying on memory or an undated version.

Use one subfolder per human collaborator, with spaces converted to underscores. Use the human collaborator's name for the subfolder and the AI agent/tool name in the filename:

```text
project_history/
├── Yusaku_Horiuchi/
│   ├── 2026-07-23 by Codex.md
│   └── 2026-07-23 by Claude.md
└── Another_Collaborator/
    └── 2026-07-23 by Codex.md
```

Use the local date and time zone. Append a new entry when a same-day file already exists; never overwrite earlier entries. At the end of every substantive task, update the history before the final response, including tasks that only inspect, diagnose, decide, or verify.

Every appended task or follow-up must include its own task-specific model and runtime metadata; do not assume an earlier entry's metadata still applies. If the assistant cannot write local files, return a concise record that the user can copy into the correct history file.

Record as much metadata as the agent can access. For unavailable model or runtime fields, write `Not exposed in this session`; use `Unknown` only for non-runtime facts whose status is genuinely unknown. Preserve specific user-selected model and reasoning values rather than replacing them with generic labels.

Each entry should record, when available:

- date, time, and time zone;
- AI surface and source task/thread description;
- common working directory and human collaborator/history owner;
- exact model display name, family, slug, reasoning level/effort, and raw/config value;
- verbosity, speed mode, service tier, collaboration/planning mode, sandbox/permissions, approval policy, and network/web-access mode;
- active skills, plugins, connectors, MCP servers, browser/computer-use tools, shell, OS, and relevant runtime versions;
- project, manuscript, analysis, deck, dataset, or artifact title;
- the user's goal, instructions, constraints, target journal, and journal requirements;
- applicable legal, contractual, ethics/IRB, funder, institutional, publication, repository, and platform requirements;
- manuscript and analysis repository branches, commits, remotes, ahead/behind state, and dirty-state summaries;
- data files, source files, scripts, TeX files, PDFs, images, and other inputs used;
- external sources checked, including URLs and access dates;
- commands run and important tool actions;
- files created, changed, removed, relocated, staged, committed, pushed, or otherwise affected;
- tests, package runs, compilation, rendering, link checks, checksum verification, comparison results, and other concrete evidence;
- outputs and deliverables, including paths, sizes, page counts, checksums, or counts when relevant;
- notes, assumptions, unresolved risks, open questions, manual steps, and next actions.

Use this structure unless the user requests another:

```md
# YYYY-MM-DD by Agent

## Metadata

- Date:
- Time:
- Time zone:
- AI surface:
- Source task/thread:
- Model display name:
- Model family:
- Model slug:
- Reasoning level/effort:
- Reasoning raw/config value:
- Verbosity:
- Speed mode:
- Service tier:
- Collaboration/planning mode:
- Sandbox/permissions:
- Approval policy:
- Network/web access:
- Working directory:
- Human collaborator / history owner:
- History file path:
- Manuscript repository branch/commit/status:
- Analysis repository branch/commit/status:
- Manuscript/artifact:
- Primary work type:
- User goal:
- Active tools/skills/plugins/connectors:
- Data and inputs used:
- Main commands:
- Verification status:

## Summary of User Instructions

-

## Summary of Agent Work

-

## Files Inspected

-

## Files Changed

-

## Files Created

-

## Files Removed or Relocated

-

## Outputs / Deliverables

-

## Verification

-

## External Sources Checked

-

## Notes, Assumptions, and Open Questions

-

## End-of-Day Status

-
```

Keep project history private by default and outside the manuscript repository, public replication package, and journal submission unless disclosure is specifically required. Do not record confidential, proprietary, embargoed, personally identifying, or otherwise sensitive content unless authorized. Keep `.Rhistory`, `.DS_Store`, caches, temporary files, credentials, and secrets out of `project_history/`. Project history supplements rather than replaces journal disclosure statements, data-availability statements, preregistrations, ethics documentation, or version control.

## Step 2: Core Workflow

1. Identify the four artifacts and inspect both repositories when available.
2. Inspect the project files and identify all candidate inputs, scripts, outputs, figures, tables, and documents.
3. Inspect the paper source files when they are available in the same working directory.
4. Decide whether to use the compact structure or the build/analyze structure.
5. Move or copy files into the chosen structure without deleting original work until the user approves.
6. Create or repair the software-appropriate public entry point (`master.R` for R).
7. Add or repair per-script logging.
8. Run the public replication path.
9. Record the software environment (`session_info.log` for R).
10. Build the README figure/table crosswalk in paper order.
11. Complete the formal data, codebook, table, figure, in-text claim, manuscript, and disclosure audit.
12. Add embedded previews only if they make the README easier to inspect.
13. Re-run the package after documentation changes.
14. Complete final cleanup and generate `MANIFEST-SHA256.txt`.
15. Create the release ZIP, extract it into a new temporary directory, verify the manifest, and run the extracted package.
16. Complete the Dataverse checklist when Dataverse is the target.
17. Report any files that cannot be reproduced because of restricted data or missing inputs.

## Final Readiness Report

When the work is complete, return a concise readiness report. The report should be specific enough that the user can decide whether the package is ready for public release.

Include:

- overall status: ready, ready with caveats, or not ready;
- files changed and why;
- command used to run the public replication path;
- whether the public entry point ran successfully;
- whether every public script produced a matching log;
- whether the software-environment record was created from a successful full run;
- whether `MANIFEST-SHA256.txt` covers and verifies every released file other than itself;
- whether the README folder tree, data-source notes, and figure/table crosswalk match the package;
- whether manuscript and appendix figures, tables, and in-text numerical claims were checked against logs, outputs, and scripts when paper source files were available;
- restricted-data limits, manual steps, missing inputs, warnings, failures, or remaining mismatches;
- exact files or sections that still need user attention.

## Core Standard

A replication package is successful when a reader can unzip it, open the project root, run one command, and see exactly how the reported results were produced.

The package should satisfy these requirements:

- One software-appropriate public entry point (`master.R` for R).
- Exactly one authoritative `README.md` inside the public package that explains the package, the workflow, the required software, and every figure/table output.
- One log file for each script that is part of the public replication path.
- One software-environment record from a successful full run (`session_info.log` for R).
- One `MANIFEST-SHA256.txt` checksum inventory generated from the final release contents.
- De-identified analysis-ready data sufficient for every published result.
- Exact survey instruments and response options, appropriate ethics/IRB documentation, and variable-level codebooks.
- Data citations, licenses, access dates, and provenance.
- Relative paths only. Scripts must run from the project root.
- No hidden manual steps. If a step cannot be automated, document why and say exactly what file is affected.
- Raw or received data should be treated as read-only.
- Generated files should be reproducible from scripts, except when restricted data prevent public rebuilding.
- All reported numerical results should appear in logs, tables, figures, or the README crosswalk.
- When paper source files are available, the replication package should be checked against the manuscript and appendix for consistency in figures, tables, and in-text numerical claims.
- Restricted, proprietary, or non-redistributable data must be documented explicitly.

## Choosing a Structure

The research-project analysis repository and the root shown in public-package examples should be named `analysis/`, not `r/`. This name is deliberately software-neutral: a project may use R, Python, Stata, Julia, MATLAB, several languages, or another toolchain. R-specific filenames below are defaults, not a requirement to rename the repository after a programming language.

Use the compact structure for small or medium projects when:

- the raw or cleaned public data can be included directly;
- data wrangling and analysis are closely connected;
- the package has a modest number of scripts;
- there are no major restricted-data or expensive upstream collection steps;
- the full public replication path can reasonably run end-to-end.

Use the `build/` and `analyze/` structure for larger projects when:

- data construction is long, fragile, expensive, or conceptually separate from analysis;
- the project uses restricted data, licensed data, APIs, web scraping, or data that cannot be redistributed;
- the public replication package should rely on analysis-ready datasets;
- many scripts create intermediate data before any paper results are produced;
- users need to understand data provenance without necessarily rerunning the full build stage.

When uncertain, choose the simpler structure unless the build stage creates real complexity for users.

## Compact Structure

Recommended for smaller packages:

```text
analysis/
|-- README.md
|-- .gitignore
|-- master.R
|-- project.Rproj
|-- session_info.log
|-- MANIFEST-SHA256.txt
|
|-- data/
|   `-- public input data
|
|-- documents/
|   |-- paper/
|   |-- questionnaires/
|   `-- other supporting documents
|
|-- scripts/
|   |-- 01_prepare_data.R
|   |-- 02_analyze_results.R
|   `-- 03_make_figures_tables.R
|
|-- functions/
|
|-- figures/
|   `-- generated figures
|
|-- tables/
|   `-- generated tables
|
|-- output/
|   `-- intermediate reproducible objects
|
`-- logs/
    `-- one log per script
```

The compact structure should still include `logs/`. A `functions/` folder is optional, but recommended when multiple scripts reuse the same helpers.

## Build/Analyze Structure

Recommended for larger packages:

```text
analysis/
|-- README.md
|-- .gitignore
|-- master.R
|-- project.Rproj
|-- session_info.log
|-- MANIFEST-SHA256.txt
|
|-- build/
|   |-- data/
|   |   `-- raw or received inputs, when distributable
|   |-- documents/
|   |   `-- source documentation and data provenance files
|   |-- scripts/
|   |   `-- scripts that create analysis-ready data
|   |-- output/
|   |   |-- analysis_ready/
|   |   `-- other build outputs
|   `-- logs/
|
`-- analyze/
    |-- scripts/
    |-- functions/
    |-- figures/
    |-- tables/
    |-- output/
    `-- logs/
```

The `build/` stage constructs analysis-ready datasets. The `analyze/` stage produces the manuscript and appendix results. The public replication workflow should normally run from `build/output/analysis_ready/` into `analyze/`.

If the build stage depends on restricted data, do not force users to run it. Keep the build scripts for transparency, remove restricted inputs, include the analysis-ready public files when legally permitted, and explain the limitation in `README.md`.

## README Requirements

The README is the user's map. It should be complete enough that a reader can understand and verify the package without opening every script.

Every replication README should include:

- paper title and authors;
- short description of what the package reproduces;
- instructions for running the public entry point;
- instructions for running individual scripts, if useful;
- folder tree;
- files included in the package;
- data sources and restrictions;
- build-stage documentation, if using the build/analyze structure;
- analysis-stage documentation;
- paper source and consistency-check status;
- figure/table crosswalk in paper order;
- optional figure/table previews when useful;
- software requirements;
- session information and computing environment summary;
- recommended citation;
- final verification date.

Use this section order unless a project-specific reason makes another order clearer:

1. `## Description`
2. `## How To Run`
3. `## Folder Tree`
4. `## Files Included In This Package`
5. `## Data Sources And Restrictions`
6. `## Build Stage`, for build/analyze packages only
7. `## Analysis Stage`
8. `## Paper Source And Consistency Checks`
9. `## Figures And Tables`
10. `## Software Requirements`
11. `## Session Information`
12. `## Recommended Citation`
13. `## Last Verified`

Commit only one README-style documentation file inside the public package: `README.md`. If an archive or journal requires HTML or PDF documentation, generate those files from `README.md` at release time and make clear that `README.md` remains the source.

This package-level rule does not prohibit the common project-root `README.md` or a private analysis-repository `README.md`. The root README maps the private working project; the analysis README documents the private code repository; the public-package README is authoritative for archive users. State each file's scope clearly and do not duplicate contradictory instructions.

## Data Sources and Restrictions

Use Markdown lists rather than a wide table for data sources. Long file paths and restriction notes are easier to scan when each source gets its own entry.

```markdown
## Data Sources And Restrictions

- **[Source name]**
  - Location: `[path/to/file-or-folder]`
  - Redistributable: Yes/No
  - Notes: [License, access, provenance, or other source notes.]
```

If any source is restricted, proprietary, confidential, licensed, or otherwise non-redistributable, explain in the same entry:

```markdown
- **[Restricted source name]**
  - Location: `[restricted/path-or-description]`
  - Redistributable: No
  - Restriction: [Why the source cannot be redistributed.]
  - Scripts using this source: `[path/to/script.R]`
  - Public replacement: `[path/to/analysis_ready_file]`
  - Licensed rebuild: [Whether licensed users can rebuild the data.]
  - Public reproducibility: [Whether published results can be reproduced without access to the restricted source.]
```

## Figures and Tables

The README must include a paper-order crosswalk that maps every reported manuscript and appendix figure/table to its output file, script, log, LaTeX Label, and notes. Embedded previews are optional; they are not a substitute for the crosswalk.

Use this structure:

```markdown
## Figures And Tables

### Manuscript

#### Figure 1

- Output:
  - `figures/main_effect.pdf`
- Script:
  - `scripts/02_analyze_results.R`
- Log:
  - `logs/02_analyze_results.log`
- LaTeX Label:
  - `fig:main_effect`
- Notes: main treatment effect.

#### Table 1

- Output:
  - `tables/main_results.tex`
  - `tables/main_results.csv`
- Script:
  - `scripts/03_make_figures_tables.R`
- Log:
  - `logs/03_make_figures_tables.log`
- LaTeX Label:
  - `tab:main_results`
- Notes: manuscript-ready LaTeX table and machine-readable CSV generated from the same model output.

### Appendix

#### Figure A.1

- Output:
  - `figures/appendix_balance.pdf`
- Script:
  - `scripts/04_appendix_checks.R`
- Log:
  - `logs/04_appendix_checks.log`
- LaTeX Label:
  - `fig:appendix_balance`
- Notes: appendix balance check.
```

Formatting rules:

- Use `## Figures And Tables` as the section heading.
- Use `### Manuscript` and `### Appendix` as subsections.
- Add one `####` entry for every individual figure or table number used in the manuscript or appendix.
- Do not group multiple figures or tables under one `####` heading.
- Do not put descriptive titles or LaTeX labels in the `####` heading. Put descriptive context in `Notes` and put labels in `LaTeX Label`.
- Each `####` entry should contain exactly five fields, in this order: `Output`, `Script`, `Log`, `LaTeX Label`, and `Notes`.
- If a field contains multiple files or labels, list them as indented sub-items. Do not put multiple file paths on one line separated by commas or semicolons.
- Use `No output file`, `No code`, or `Not applicable` when an item is conceptual, hand-made, or retained from the manuscript source rather than generated by public scripts.

## Script Naming

Use script names that make the execution order and purpose obvious:

```text
00_list_inputs.R
01_prepare_data.R
02_analyze_results.R
03_make_figures_tables.R
04_robustness_checks.R
```

Rules:

- Prefix public replication scripts with two-digit numbers.
- Use lowercase file names with underscores.
- Keep exploratory, obsolete, or non-paper scripts out of the public replication path.
- If such scripts are retained, place them in `scripts/not_in_paper/` or `scripts/archive/` and explain that they are not required.
- Avoid spaces and special characters in file names.

## Logs

Every public script should write a log file. Logs are part of the replication record.

Logs should include:

- script name;
- start and end time, time zone, elapsed time, and completion status;
- working directory, invocation or execution path, and relevant Git commit when available;
- inputs with paths, file sizes, access dates or versions, and checksums when identity matters;
- outputs with paths, file sizes, and checksums when identity matters;
- user-set parameters, random seeds, and important package or external-tool versions;
- important package versions if script-specific;
- row counts after major filters or merges;
- merge diagnostics, exclusions, missing-data handling, and transformation checkpoints needed to audit the analysis;
- sample sizes used in each reported analysis;
- treatment or group counts when relevant;
- field dates when relevant;
- summary statistics reported in the paper;
- model estimates, standard errors, test statistics, and p-values reported in text;
- warnings, errors, and unresolved messages at the end of the script.

Avoid workspace-wide serialization such as `save.image()`. Save only explicitly named objects. Load legacy workspace files into isolated environments.

## Code and Output Hygiene

Remove or archive obsolete scripts, dead commented-out exploratory code, development-only outputs, duplicate tables and figures, stale logs, RStudio caches, `.DS_Store`, conflicted copies, raw identifiers, temporary LaTeX build products, and files not referenced by the README, public execution workflow, or manuscript crosswalk. Retain useful explanatory comments that document reasoning, assumptions, or non-obvious code.

## Required Final Validation

Before release:

1. Run every public script from a fresh session.
2. Run optional source-reconstruction paths.
3. Run the authorized raw-data build when available.
4. Confirm that every script finishes without warnings or errors.
5. Compare authorized rebuilt data with public data by checksum.
6. Validate that codebooks cover every variable and accurately report names, order, types, coding, labels, and ranges.
7. Compare every manuscript/package table numerically.
8. Compare every manuscript/package figure visually or pixel by pixel.
9. Trace every in-text estimate, sample size, date, percentage, significance claim, and subgroup count.
10. Compile and visually inspect the complete manuscript.
11. Screen public data for identifiers and unnecessary sensitive fields.
12. Rebuild the SHA-256 manifest.
13. Create the final ZIP.
14. Extract it into a new temporary directory.
15. Verify every manifest entry.
16. Run the extracted package without relying on files outside it.

## Dataverse Preparation

When preparing a Dataverse deposit:

- Upload only the final verified archive.
- Confirm the uploaded checksum, file size, and date.
- Leave the Dataverse file path blank for a single self-contained ZIP.
- Add a concise reviewer-facing file description.
- Remove all repository-template help text.
- Do not invent an article DOI before one exists.
- Check related-publication metadata for incomplete identifier artifacts.
- Confirm authors, ORCIDs, affiliations, contact, description, subject, license, and deposit date.
- Keep internal validation and readiness reports local unless requested.
- Submit for review only after checking the saved public metadata display.

## Overleaf Size and Privacy

Overleaf's 50 MB limit concerns an individual upload or file, not total project size. Nevertheless, an Overleaf-connected repository should contain only compilation-relevant materials. Never store raw or restricted data in an Overleaf-synchronized folder because of privacy, collaborator access, synchronization reliability, and project bloat.

The log filename should match the script filename:

```text
scripts/02_analyze_results.R
logs/02_analyze_results.log
```

For a build/analyze package:

```text
analyze/scripts/01_analyze_results.R
analyze/logs/01_analyze_results.log
```

## Suggested Logging Helper

Place a logging helper in `functions/logging.R` for compact packages or `analyze/functions/logging.R` for build/analyze packages.

```r
start_script_log <- function(script_name, log_dir = "logs", inputs = character()) {
  dir.create(log_dir, recursive = TRUE, showWarnings = FALSE)
  log_file <- file.path(log_dir, paste0(script_name, ".log"))

  sink(log_file, split = TRUE)

  cat("############################################################\n")
  cat("Script:", paste0(script_name, ".R"), "\n")
  cat("Started:", format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z"), "\n")
  cat("Inputs:\n")
  if (length(inputs) == 0) {
    cat("  None declared\n")
  } else {
    for (input in inputs) cat(" ", input, "\n")
  }
  cat("############################################################\n\n")

  invisible(log_file)
}

end_script_log <- function(outputs = character()) {
  cat("\n--- outputs ---\n")
  if (length(outputs) == 0) {
    cat("None declared\n")
  } else {
    for (output in outputs) {
      size <- if (file.exists(output)) file.info(output)$size else NA_real_
      cat(output, "| bytes:", if (is.na(size)) "missing" else size, "\n")
    }
  }
  cat("\n############################################################\n")
  cat("Ended:", format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z"), "\n")
  cat("############################################################\n")

  cat("\n--- warnings() at end of script ---\n")
  w <- warnings()
  if (is.null(w) || length(w) == 0) {
    cat("None\n")
  } else {
    print(w)
  }

  while (sink.number() > 0) sink()
}
```

Use this pattern in each public script:

```r
source("functions/logging.R")
start_script_log("02_analyze_results")

tryCatch({
  # Script body goes here.
}, error = function(e) {
  cat("\nERROR:", conditionMessage(e), "\n")
  stop(e)
}, finally = {
  end_script_log()
})
```

For build/analyze packages, adjust paths:

```r
source("analyze/functions/logging.R")
start_script_log("01_analyze_results", log_dir = "analyze/logs")

tryCatch({
  # Script body goes here.
}, error = function(e) {
  cat("\nERROR:", conditionMessage(e), "\n")
  stop(e)
}, finally = {
  end_script_log()
})
```

## R Entry-Point Example

For an R project, use `master.R` as the reproducibility entry point and run the full public replication path from a clean R session. For another software stack, implement the equivalent behavior in its conventional entry-point format.

The master script should:

- assert that no sink is already open;
- create required output folders;
- source scripts in the correct order;
- continue or stop according to a clear policy;
- write `session_info.log`;
- record start time, end time, and elapsed time.

Suggested skeleton:

```r
# Master file
# Run from the project root after restarting R.

start_time <- Sys.time()
stopifnot(sink.number() == 0)

safe_source <- function(file) {
  if (!file.exists(file)) stop("File not found: ", file)

  cat("\n============================================================\n")
  cat("Running:", file, "\n")
  cat("============================================================\n")

  source(file, echo = FALSE, print.eval = FALSE)
}

scripts <- c(
  "scripts/01_prepare_data.R",
  "scripts/02_analyze_results.R",
  "scripts/03_make_figures_tables.R"
)

for (script in scripts) {
  safe_source(script)
}

end_time <- Sys.time()

while (sink.number() > 0) sink()

sink("session_info.log", split = FALSE)
cat("Run Time\n")
cat("Started: ", format(start_time, "%Y-%m-%d %H:%M:%S"), "\n", sep = "")
cat("Ended:   ", format(end_time, "%Y-%m-%d %H:%M:%S"), "\n", sep = "")
cat("Elapsed: ", format(end_time - start_time), "\n\n", sep = "")

cat("Session Information\n")
print(sessionInfo())
sink()
```

For large packages, `master.R` should normally run the public analysis path only:

```r
scripts <- c(
  "analyze/scripts/00_list_inputs.R",
  "analyze/scripts/01_analyze_results.R",
  "analyze/scripts/02_make_figures_tables.R"
)
```

If a small public subset of the build stage can be rebuilt, `master.R` may check for missing required files and rebuild only those public inputs. Do not require restricted data in the public run.

## Data Rules

Use clear data layers:

- `data/`: public raw or received data for compact packages.
- `build/data/`: raw or received data for large packages.
- `build/output/analysis_ready/`: authoritative analysis inputs for large public replication packages.
- `output/` or `analyze/output/`: reproducible intermediate objects.
- `figures/` and `tables/`: final generated results.

Data rules:

- Never overwrite raw data.
- Prefer scripts that read raw data and write new files to `output/`.
- Use stable identifiers and codebooks.
- Include questionnaires, survey instruments, coding rules, data dictionaries, and source notes in `documents/`.
- Use `set.seed()` before simulations, bootstraps, random splits, random forests, MCMC starts, or any stochastic procedure.
- Document any nondeterministic source such as Google Trends, APIs, web scraping, or data that changes over time.

## Restricted Data

If any source cannot be redistributed, document it inside `## Data Sources And Restrictions` using the restricted-source fields described above. The entry should explain:

- source name;
- owner or vendor;
- why the source is restricted;
- which scripts originally used it;
- which public analysis-ready files replace it;
- whether a licensed user can rebuild the data;
- whether results can be reproduced without access to the restricted source.

The public package should be designed so that users can reproduce published results without restricted access whenever legally and ethically possible.

## Paper Consistency Checks

When manuscript source files are available, treat them as part of the working context for package preparation. Selecting the common project root lets the agent inspect the local manuscript repository and analysis repository together even when the manuscript is synchronized with Overleaf through GitHub.

The final consistency pass should check:

- figure and table labels in the paper against the README crosswalk;
- manuscript figure/table file paths against the manuscript-ready files included by LaTeX;
- manuscript-ready figures and tables against the corresponding R-generated files, scripts, and logs, especially when tables are manually edited after generation;
- in-text estimates, standard errors, p-values, sample sizes, sampling dates, completion times, response rates, and descriptive statistics against logs and generated tables;
- appendix items against scripts, outputs, and logs;
- notes for any conceptual, hand-made, or non-replicated items.

If the paper source files are not included in the public replication archive, state in `README.md` whether they were used during preparation for consistency checks.

## Software Environment

At minimum, include a short computing-environment summary in `README.md` and a machine-readable or plain-text environment record from a successful full run. For R, use `session_info.log`.

Suggested README format:

```text
### Computing Environment

Software: R version [version]
Platform: [R platform]
Computer Operating System: [operating system and version]
Additional details: [RAM, processor/GPU, external tools, or other project-specific requirements when relevant.]
```

The values should come from the successful run that produced the environment record. Some projects should report additional computing details when they affect reproducibility or runtime, such as RAM, CPU/GPU, external command-line tools, licensed software, high-performance-computing settings, or language/runtime versions.

For stronger reproducibility, also consider:

- `renv.lock` for R package versions;
- a short package installation script;
- operating system notes when required by external dependencies;
- clear instructions for LaTeX, Quarto, pandoc, or command-line tools if they are needed.

Do not assume the user has the same local folder structure. Avoid `setwd()` to personal paths.

## Release Integrity Manifest

Every final replication package should include `MANIFEST-SHA256.txt` at the package root. This file is a checksum inventory for release integrity and auditing. It is not required to run the replication scripts and should not be sourced by `master.R`.

Generate the manifest only after the final successful replication run, documentation edits, and cleanup. It should:

- list every file included in the public release except `MANIFEST-SHA256.txt` itself;
- use paths relative to the package root;
- use one SHA-256 checksum and file path per line;
- use deterministic path ordering;
- exclude files and directories that are not part of the public release, such as `.git/`, local caches, and operating-system metadata;
- be regenerated whenever any released file changes.

On macOS or Linux, generate it from the package root with an equivalent of:

```sh
find . -type f \
  ! -path './MANIFEST-SHA256.txt' \
  ! -path './.git/*' \
  -print |
  LC_ALL=C sort |
  while IFS= read -r file; do shasum -a 256 "$file"; done \
  > MANIFEST-SHA256.txt
```

Verify it from the package root with:

```sh
shasum -a 256 -c MANIFEST-SHA256.txt
```

Use a platform-appropriate SHA-256 tool when `shasum` is unavailable, while preserving the same relative-path inventory. Record the generation and verification commands in the release notes or final readiness report. If the archive is modified after manifest generation, regenerate and re-verify the manifest.

## Quality Checklist

Before releasing a replication package, verify:

- The software-appropriate public entry point runs from a fresh session; for R, `source("master.R")` succeeds.
- All scripts use relative paths from the project root.
- Every public script creates a matching log file.
- The software-environment record exists and comes from a successful full run; for R, this is `session_info.log`.
- `MANIFEST-SHA256.txt` was generated after the final run and cleanup.
- Every released file other than `MANIFEST-SHA256.txt` appears exactly once in the manifest.
- All checksums in `MANIFEST-SHA256.txt` verify successfully.
- The README folder tree matches the actual package.
- The README crosswalk lists every figure and table in paper order.
- Every figure/table has an output path, script path, and log path, or an explicit `No output file`, `No code`, or `Not applicable` entry.
- Every reported number in the paper source has been checked against logs, tables, figures, or scripts when the paper source is available.
- All reported text numbers can be traced to a log, table, figure, or script.
- All restricted data sources are documented.
- All temporary, personal, and cache files are removed.
- The package contains no absolute personal paths.
- File names are stable and readable.
- The package opens cleanly on another computer.

## Minimal Release Contents

The following trees use the repository's R templates. Other software stacks should substitute an equivalent entry point and environment record while preserving the same functional roles.

For a compact package:

```text
README.md
.gitignore
master.R
session_info.log
MANIFEST-SHA256.txt
data/
documents/
scripts/
functions/
figures/
tables/
output/
logs/
```

For a large package:

```text
README.md
.gitignore
master.R
session_info.log
MANIFEST-SHA256.txt
build/
analyze/
```

The final archive should have obvious structure, one command to run, traceable outputs, and no surprises.
