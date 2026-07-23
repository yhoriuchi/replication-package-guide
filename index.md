---
title: Replication Package Guide
---

<link rel="stylesheet" href="{{ '/assets/site.css' | relative_url }}?v={{ site.github.build_revision }}">

<main class="page-shell" markdown="1">

<section class="hero" markdown="1">

# Replication Package Guide

- **Author:** Yusaku Horiuchi
- **Affiliation:** Syde P. Deeb Eminent Scholar in Political Science, Florida State University
- **Created:** May 10, 2026
- **Last revised:** July 23, 2026

![Page views](https://hits.sh/yhoriuchi.github.io/replication-package-guide.svg?label=page%20views)

A practical guide and template collection for building high-quality social science replication packages that coding agents and human researchers can inspect, run, and verify.

<div class="hero-actions" markdown="1">
<button type="button" class="button button-primary" id="copy-agent-instructions">Copy Agent Instructions</button>
<span class="copy-status" id="copy-agent-instructions-status" aria-live="polite"></span>
</div>

</section>

## How to Use This Guide

1. Find the most up-to-date replication-package, data, and code instructions issued by the journal to which the manuscript will be submitted.
2. Tell the agent to read those journal instructions in full before inspecting or changing the package. Provide the official URL or files and the date accessed.
3. Click **Copy Agent Instructions** and paste the instructions into Codex, Claude Code, or another coding agent before it changes files.
4. Give the agent the replication package root and, when available, the paper source files, manuscript-ready figures, manuscript-ready tables, appendices, bibliography files, and source-data notes.
5. Give the agent access to the common parent of the manuscript and analysis repositories when both exist.
6. Decide whether the public package should use the compact structure or the build/analyze structure.
7. Require one public entry point, script-specific logs, `session_info.log`, one authoritative `README.md`, and a complete figure/table crosswalk.
8. Ask the agent to run the final audit on an extracted copy of the release ZIP and return a readiness report covering remaining mismatches, restricted-data limits, and manual steps.

## Check the Journal's Current Instructions First

This guide is a general workflow, not a substitute for a journal's submission requirements. Requirements change. At the start of every replication-package task, the user should direct the AI agent to locate or open the journal's most up-to-date official replication-package, data-availability, code, disclosure, archive, and file-format instructions and read them in full.

Record the official source URL or supplied file, the date accessed, and any journal-specific requirements. When the journal's current instructions conflict with this guide, follow the journal. If no target journal has been selected, say so explicitly and repeat this check once the venue is known. Do not rely on remembered requirements, an earlier submission's checklist, or an undated local copy.

## Use ReproAI Before Submission

This guide and [ReproAI](https://reproai.org/) serve complementary purposes. This guide is an authoring framework: it helps researchers build traceability and reproducibility into a project from the outset through a clear structure, one public entry point, script-level logs, data-restriction documentation, and a paper-to-output crosswalk. ReproAI, developed by Yiqing Xu and Leo Yang Yang, is an author-facing diagnostic tool for existing replication packages, with an emphasis on pre-submission checks, venue compliance, smoke testing, and identifying common reproducibility problems.

After preparing a package with this guide, I encourage authors to run ReproAI before journal or repository submission. It provides a valuable final preflight check and may identify structural, environment, or venue-specific issues that remain. The two projects are independent, but they fit naturally into the same workflow: build a transparent package from the beginning, then use ReproAI near submission to diagnose and resolve remaining problems.

<section class="summary-grid" markdown="1">

<div class="summary-card" markdown="1">

## What the Agent and User Must Do

- Identify the public replication path before reorganizing files.
- Preserve the author's substantive analysis choices.
- Use relative paths and one reproducibility entry point.
- Keep one authoritative `README.md`.
- Record one log per public script and one `session_info.log`.
- Trace every reported figure, table, and number to code, output, or documentation.
- Check the paper source against replication outputs when source files are available.

</div>

<div class="summary-card" markdown="1">

## What to Avoid

- Absolute personal paths.
- Multiple competing README files.
- Hidden manual steps.
- Unlogged public scripts.
- Stale figures, tables, or copied manuscript-ready files.
- Deleting raw data, manuscript source, or restricted-data documentation without approval.
- Treating generated previews as a substitute for a crosswalk.

</div>

</section>

## Core Workflow

<ol class="workflow">
  <li><strong>Identify the four artifacts.</strong> Locate the private research workspace, manuscript repository, public replication package, and journal production/submission files. Do not collapse them into one folder.</li>
  <li><strong>Inspect the project.</strong> Identify scripts, inputs, outputs, figures, tables, logs, helper functions, documents, and visible paper source files before editing.</li>
  <li><strong>Inspect the paper source.</strong> When LaTeX, Overleaf, appendix, figure, table, or bibliography files are available, treat them as part of the working context.</li>
  <li><strong>Choose the structure.</strong> Use the compact structure for direct public inputs and modest workflows; use build/analyze when data construction is complex, restricted, or conceptually separate.</li>
  <li><strong>Organize without losing context.</strong> Move or copy files into the chosen structure only after understanding what produces the reported results.</li>
  <li><strong>Create the public entry point.</strong> Add or repair <code>master.R</code> so the public replication path can run from a clean R session.</li>
  <li><strong>Add script logs.</strong> Every public script should create a matching log with start/end time, sample sizes, reported statistics, and warnings.</li>
  <li><strong>Run every public path.</strong> Execute every public script from a fresh session, plus optional reconstruction and authorized raw-data build paths when available.</li>
  <li><strong>Record the environment.</strong> Write <code>session_info.log</code> and summarize the computing environment in the README.</li>
  <li><strong>Build the crosswalk.</strong> Map each manuscript and appendix figure/table to output files, scripts, logs, LaTeX labels, and notes.</li>
  <li><strong>Check reported claims.</strong> Compare every table numerically, every figure visually or pixel by pixel, and every in-text numerical claim against logs, generated outputs, and scripts.</li>
  <li><strong>Document restrictions.</strong> Explain any non-redistributable source, public replacement, and limits on rebuilding.</li>
  <li><strong>Audit the release archive.</strong> Rebuild the SHA-256 manifest, create the ZIP, extract it into a new temporary directory, verify the manifest, and run the extracted package without outside files.</li>
  <li><strong>Report readiness.</strong> Return readiness status, remaining risks, and exact files that still need attention. Keep the internal report outside the public package unless the journal requests it.</li>
</ol>

## What This Repository Provides

<section class="resource-grid" markdown="1">

<div class="resource-card" markdown="1">

### Instruction Source

[`AGENTS.md`](https://github.com/yhoriuchi/replication-package-guide/blob/main/AGENTS.md) contains the instructions copied by the button above.

</div>

<div class="resource-card" markdown="1">

### README Template

[`templates/README_TEMPLATE.md`](https://github.com/yhoriuchi/replication-package-guide/blob/main/templates/README_TEMPLATE.md) is a copyable starting point for a project's one authoritative `README.md`.

</div>

<div class="resource-card" markdown="1">

### Agent Prompt

[`prompts/replication-package-agent.md`](https://github.com/yhoriuchi/replication-package-guide/blob/main/prompts/replication-package-agent.md) is a short starter prompt for giving the agent project-specific paths and constraints.

</div>

<div class="resource-card" markdown="1">

### Readiness Report

[`templates/release-readiness-report.md`](https://github.com/yhoriuchi/replication-package-guide/blob/main/templates/release-readiness-report.md) is a structured final-report template for documenting what was changed, verified, and left unresolved.

</div>

<div class="resource-card" markdown="1">

### Compact Template

[`templates/compact/`](https://github.com/yhoriuchi/replication-package-guide/tree/main/templates/compact) is the starter structure for small and medium projects.

</div>

<div class="resource-card" markdown="1">

### Build/Analyze Template

[`templates/build-analyze/`](https://github.com/yhoriuchi/replication-package-guide/tree/main/templates/build-analyze) is the starter structure for larger projects with a separate data-build stage.

</div>

</section>

The guide assumes an R-based workflow, with `master.R`, R scripts, and `session_info.log` as the default examples. The underlying standard is not limited to R. For Stata, Python, Julia, MATLAB, or another toolchain, ask the agent to prepare an analogous package with the appropriate single entry point, logs, software-environment record, and figure/table crosswalk.

## Before You Start

Before asking an AI agent to polish a replication package for publication, clean the project as much as possible yourself. AI is useful for checking, reorganizing, documenting, and catching inconsistencies, but it should not be treated as a substitute for the author's judgment about which files, scripts, data sources, and results are actually part of the replication record.

At minimum, remove clearly obsolete files, label exploratory scripts, identify the scripts that generate reported results, gather the paper source files when available, and decide which data can legally be shared. The cleaner the starting point, the more reliable the AI-assisted audit will be.

For a new replication package:

1. Read the target journal's current official replication-package instructions.
2. Read this guide once before organizing files.
3. Decide whether the project needs the compact structure or the build/analyze structure.
4. If starting from scratch, copy either `templates/compact/` or `templates/build-analyze/` into the new project and use its included `README.md` as the starting README.
5. If reorganizing an existing project, copy `templates/README_TEMPLATE.md` to the project root as `README.md`.
6. Delete any unused folder-tree option inside `README.md`.
7. Replace every placeholder with project-specific information.
8. Fill in the figure/table crosswalk in paper order.
9. Run `source("master.R")` from a fresh R session.
10. Confirm that `session_info.log` and one log per public script were created.
11. Commit only one README file: `README.md`.

## Separate the Research, Manuscript, Release, and Submission Artifacts

A research project normally produces four related but different artifacts:

1. **Private research/build workspace.** The complete working environment for data construction, analysis, validation, and internal documentation.
2. **Manuscript and Overleaf repository.** Only files needed to compile and maintain the paper and active supplement.
3. **Public replication package.** A deliberately staged, de-identified, self-contained release that reproduces every published result.
4. **Journal production and submission files.** Submission snapshots, proofs, forms, cover letters, and production-specific exports.

Do not treat these as one folder. In particular, internal archives, complete replication staging directories, raw data, and submission snapshots do not belong in the manuscript repository or public package.

## Recommended Two-Repository Architecture

Keep two Git repositories under one local parent folder:

```text
Research-Project/
|-- manuscript/       # Git repository 1
`-- analysis/         # Git repository 2
```

The **manuscript repository** should contain only LaTeX and bibliography sources, manuscript tables and figures, active supplementary-material sources, small compile-time assets, and manuscript-specific documentation. It can connect to Overleaf through GitHub integration. Exclude raw data, R intermediate files, complete replication-package staging, archives, and submission snapshots.

The **analysis repository** should normally remain private during active research. It should contain R scripts and functions, data-construction and analysis code, codebooks, replication-package staging, validation scripts, generated results, and internal project documentation. Restricted raw data must remain outside Git even when this repository is private. Ignore those files and document their expected secure local paths.

A Codex local project can select `Research-Project/` as its working folder. This gives the agent access to both child repositories even though the desktop project picker accepts only one folder. Before editing, check the branch, commit, synchronization, and review conventions in each repository.

Generated results may be copied from `analysis/` into `manuscript/` only through a documented promotion step. The crosswalk should record both the generated package output and the manuscript-ready file, especially when a table is formatted or edited after generation.

## Overleaf Size, Scope, and Privacy

Overleaf's 50 MB limit concerns an individual uploaded file, not the total size of the project. That does not make Overleaf an appropriate research-data store. Keep an Overleaf-connected repository limited to compilation-relevant materials.

Never store raw or restricted data in an Overleaf-synchronized folder. Beyond file size, the important concerns are privacy, collaborator access, synchronization reliability, and project bloat. Keep restricted inputs in an authorized secure location outside both Git repositories and record the expected path in private documentation.

Keep local and session files out of Git and, when Dropbox is used, out of Dropbox sync. Git and Dropbox have separate ignore mechanisms:

- `rules.dropboxignore` belongs at the applicable Dropbox root and controls synchronization.
- `.gitignore` belongs inside each Git repository and controls version tracking.

The simplest setup is to adapt this repository's [`rules.dropboxignore`](rules.dropboxignore) and add appropriate rules to each repository's `.gitignore`. Append to existing files rather than replacing project-specific rules.

Suggested base rules for both `rules.dropboxignore` and project-level `.gitignore` files:

```text
# R and RStudio local/session files
**/.Rproj.user/
**/.Rhistory
**/.RData
**/.Ruserdata

# macOS and temporary files
**/.DS_Store
**/*.tmp
**/*.temp
**/*.bak

# package/cache folders
**/renv/library/
**/renv/staging/
**/*_cache/
**/*_files/

# R graphics leftovers
**/Rplots.pdf
```

Dropbox ignore rules apply only going forward. Files that already synced may need to be removed and recreated after `rules.dropboxignore` is added. Git ignore rules also do not automatically untrack files that were already committed; after checking carefully, remove such files from Git tracking with `git rm --cached [file]`.

Do not ignore the whole analysis repository. Ignore only restricted inputs, machine-specific caches, histories, package libraries, temporary files, and other explicitly excluded artifacts. The `.Rproj` file, scripts, redistributable data, generated logs, and reproducibility metadata such as `renv.lock` should usually remain visible.

The final paper-integration check should verify that:

- every figure and table cited in the paper or appendix appears in the README crosswalk;
- every figure/table path in the paper points to the intended manuscript-ready file in root-level `figures/` or `tables/`;
- every manuscript-ready figure or table can be traced back to the R-generated source file, script, and log, especially when files are copied, renamed, or manually edited after generation;
- every in-text number reported in the paper, including estimates, standard errors, p-values, sample sizes, sampling dates, completion times, response rates, and descriptive statistics, can be traced to a script, log file, generated table, or generated figure;
- the values in the paper match the values produced by the replication scripts;
- any conceptual figure, hand-made table, or non-replicated item is clearly identified in the README crosswalk.

For public release, include paper source files only when appropriate and permitted. If the paper source cannot be included in the public archive, use it during preparation for the consistency check and document in `README.md` that the manuscript source was checked against the replication outputs.

## Core Standard

A replication package is successful when a reader can unzip it, open the project root, run one command, and see exactly how the reported results were produced.

Every package should include:

- One public entry point: `master.R`.
- Exactly one authoritative `README.md` that explains the package, the workflow, the required software, and every figure/table output.
- One log file for each script that is part of the public replication path.
- One `session_info.log` file from a successful full run.
- De-identified analysis-ready data sufficient for every published result.
- Exact survey instruments and response options, ethics/IRB documentation appropriate for public release, and variable-level codebooks.
- Data citations, licenses, access dates, and provenance.
- One `MANIFEST-SHA256.txt` inventory generated after the final run and cleanup.
- Relative paths only. Scripts must run from the project root.
- No hidden manual steps. If a step cannot be automated, document why and say exactly what file is affected.
- Raw or received data should be treated as read-only.
- Generated files should be reproducible from scripts, except when restricted data prevent public rebuilding.
- All reported numerical results should appear in logs, tables, figures, or the README crosswalk.
- When paper source files are available, the replication package should be checked against the manuscript and appendix for consistency in figures, tables, and in-text numerical claims.
- Restricted, proprietary, or non-redistributable data must be documented explicitly.

## Choose the Structure

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

## Project Structures

The repository contains two starter structures. Copy one, then replace every placeholder with project-specific information.

### Compact Structure

Use [`templates/compact/`](https://github.com/yhoriuchi/replication-package-guide/tree/main/templates/compact) for smaller packages.

```text
r/
|-- README.md
|-- .gitignore
|-- master.R
|-- project.Rproj               # optional but recommended
|-- session_info.log
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
|-- functions/                  # optional helper functions
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

### Build/Analyze Structure

Use [`templates/build-analyze/`](https://github.com/yhoriuchi/replication-package-guide/tree/main/templates/build-analyze) for larger packages with a separate data-build stage.

```text
r/
|-- README.md
|-- .gitignore
|-- master.R
|-- project.Rproj               # optional but recommended
|-- session_info.log
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
|   `-- logs/                   # use if build scripts are public and runnable
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

The README is the user's map. It should be complete enough that a reader can understand and verify the package without opening every script. Start from [`templates/README_TEMPLATE.md`](https://github.com/yhoriuchi/replication-package-guide/blob/main/templates/README_TEMPLATE.md) when reorganizing an existing project.

Every replication README should include:

- paper title and authors;
- short description of what the package reproduces;
- instructions for running `master.R`;
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

Use exactly one `README.md` regardless of package size. Do not commit generated `README.html` or `README.pdf` files unless an archive or journal specifically requires them.

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

Commit only one README-style documentation file: `README.md`. If an archive or journal requires HTML or PDF documentation, generate those files from `README.md` at release time and make clear that `README.md` remains the source.

## Crosswalk and Data Rules

The README must include a paper-order crosswalk that maps every reported manuscript and appendix figure/table to its output file, script, log, LaTeX label, and notes. Embedded previews are optional; they are not a substitute for the crosswalk.

- Use `## Figures And Tables` as the section heading, with `### Manuscript` and `### Appendix` subsections.
- Add one `####` entry for every individual figure or table number used in the manuscript or appendix.
- Do not group multiple figures or tables under one `####` heading.
- Do not put descriptive titles or LaTeX labels in the `####` heading. Put descriptive context in `Notes` and put labels in `LaTeX Label`.
- Each `####` entry should contain exactly five fields, in this order: `Output`, `Script`, `Log`, `LaTeX Label`, and `Notes`.
- If a field contains multiple files or labels, list them as indented sub-items. Do not put multiple file paths on one line separated by commas or semicolons.
- Use `No output file`, `No code`, or `Not applicable` when an item is conceptual, hand-made, or retained from the manuscript source rather than generated by public scripts.

Use Markdown lists rather than a wide table for data sources. Long file paths and restriction notes are easier to scan when each source gets its own entry.

For every restricted, proprietary, confidential, licensed, or otherwise non-redistributable source, document:

- source name;
- location or restricted-path description;
- why the source cannot be redistributed;
- which scripts originally used it;
- which public analysis-ready file replaces it;
- whether licensed users can rebuild it;
- whether the published results can be reproduced without access to it.

## Scripts, Logs, and Environment

Use script names that make the execution order and purpose obvious:

```text
00_list_inputs.R
01_prepare_data.R
02_analyze_results.R
03_make_figures_tables.R
```

- Prefix public replication scripts with two-digit numbers.
- Use lowercase file names with underscores.
- Keep exploratory, obsolete, or non-paper scripts out of the public replication path.
- If such scripts are retained, place them in `scripts/not_in_paper/` or `scripts/archive/` and explain that they are not required.
- Avoid spaces and special characters in file names.
- Use the template logging helper rather than ad hoc `sink()` calls when possible.
- Make the log filename match the script filename, such as `scripts/02_analyze_results.R` and `logs/02_analyze_results.log`.

Every public script should write a log file. Logs are part of the replication record and should include:

- script name;
- start and end time;
- inputs;
- outputs and file sizes;
- important row counts after filters or merges;
- sample sizes used in reported analyses;
- treatment or group counts and field dates when relevant;
- summary statistics, estimates, standard errors, test statistics, p-values, and warnings reported in the paper;
- any warnings or failures at the end of the run.

Every package should include `master.R`. It should run the full public replication path from a clean R session, write `session_info.log`, and record start time, end time, elapsed time, platform, and package versions. For a build/analyze package, `master.R` should normally run the public analysis path only unless a public subset of the build stage can be rebuilt without restricted inputs.

Avoid workspace-wide serialization such as `save.image()`. Save only explicitly named objects. When legacy `.RData` or workspace files must be inspected, load them into an isolated environment so they cannot silently replace objects in the running session.

## Code and Output Hygiene

Before staging the release, remove or archive obsolete scripts, dead commented-out exploratory code, development-only outputs, duplicate tables and figures, stale logs, RStudio caches, `.DS_Store`, conflicted copies, raw identifiers, temporary LaTeX build products, and files not referenced by the README, execution workflow, or manuscript crosswalk. Preserve explanatory comments that document reasoning, assumptions, or non-obvious code; they are not dead code.

## Formal Final Audit

Complete this audit only after the intended release contents have stabilized:

1. Run every public script from a fresh session and confirm that each finishes without warnings or errors.
2. Run optional source-reconstruction paths and the authorized raw-data build when available.
3. Compare authorized rebuilt data with the public data by checksum.
4. Verify that the codebooks cover every released variable and accurately report variable names, order, types, coding, labels, and observed ranges.
5. Compare every manuscript/package table numerically.
6. Compare every manuscript/package figure visually or pixel by pixel.
7. Trace every in-text estimate, sample size, date, percentage, significance claim, and subgroup count.
8. Compile and visually inspect the complete manuscript.
9. Screen public data for direct and indirect identifiers and unnecessary sensitive fields.
10. Rebuild `MANIFEST-SHA256.txt` after the final run and cleanup.
11. Create the final ZIP, extract it into a new temporary directory, and verify every manifest entry.
12. Run the extracted package successfully without relying on files outside the extracted directory.

Internal validation and readiness reports should normally remain in the private analysis workspace, not in the public archive, unless the journal requests them.

## Dataverse Preparation

For a Dataverse deposit:

- Upload only the final verified archive.
- Confirm the uploaded checksum, file size, and date.
- Leave the Dataverse file path blank for a single self-contained ZIP.
- Add a concise reviewer-facing file description and remove all repository-template help text.
- Do not invent an article DOI before one exists.
- Check related-publication metadata for empty or incomplete identifier artifacts.
- Confirm authors, ORCIDs, affiliations, contact information, description, subject, license, and deposit date.
- Keep internal validation and readiness reports local unless requested.
- Submit for review only after checking the saved public metadata display.

## Quality Checklist

Before releasing a replication package, verify:

- `source("master.R")` runs from a fresh R session.
- All scripts use relative paths from the project root.
- Every public script creates a matching log file.
- `session_info.log` exists and comes from a successful full run.
- Every public script completes without warnings or errors.
- Authorized rebuilt and public analysis-ready data match by checksum when both are available.
- Codebooks completely and accurately cover every public variable.
- Every manuscript/package table matches numerically.
- Every manuscript/package figure matches visually or pixel by pixel.
- Public data contain no unnecessary identifiers or sensitive fields.
- `MANIFEST-SHA256.txt` covers and verifies every released file other than itself.
- The final ZIP was extracted and run successfully without outside dependencies.
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

For a compact package:

```text
README.md
.gitignore
master.R
session_info.log
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
build/
analyze/
```

The final archive should have obvious structure, one command to run, traceable outputs, and no surprises.

<script id="agent-instructions-text" type="text/plain">{% include_relative AGENTS.md %}</script>
<script>
(function () {
  var button = document.getElementById("copy-agent-instructions");
  var source = document.getElementById("agent-instructions-text");
  var status = document.getElementById("copy-agent-instructions-status");

  if (!button || !source) {
    return;
  }

  function setStatus(message) {
    if (!status) {
      return;
    }
    status.textContent = message;
    window.clearTimeout(setStatus.timeout);
    setStatus.timeout = window.setTimeout(function () {
      status.textContent = "";
    }, 2400);
  }

  function fallbackCopy(text) {
    var textarea = document.createElement("textarea");
    textarea.value = text;
    textarea.setAttribute("readonly", "");
    textarea.style.position = "fixed";
    textarea.style.top = "-9999px";
    document.body.appendChild(textarea);
    textarea.select();
    document.execCommand("copy");
    document.body.removeChild(textarea);
  }

  button.addEventListener("click", function () {
    var text = source.textContent.trim();

    if (navigator.clipboard && window.isSecureContext) {
      navigator.clipboard.writeText(text).then(function () {
        setStatus("Copied");
      }).catch(function () {
        fallbackCopy(text);
        setStatus("Copied");
      });
      return;
    }

    fallbackCopy(text);
    setStatus("Copied");
  });
})();
</script>

</main>
