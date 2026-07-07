---
title: Replication Package Guide
layout: null
---

<link rel="stylesheet" href="{{ '/assets/site.css' | relative_url }}">

<main class="page-shell markdown-page" markdown="1">

<section class="hero" markdown="1">

# Replication Package Guide

- **Author:** Yusaku Horiuchi
- **Affiliation:** Syde P. Deeb Eminent Scholar in Political Science, Florida State University
- **Created:** May 10, 2026
- **Last revised:** July 7, 2026

![Page views](https://hits.sh/yhoriuchi.github.io/replication-package-guide.svg?label=page%20views)

A practical guide and template collection for building high-quality social science replication packages that coding agents and human researchers can inspect, run, and verify.

<div class="hero-actions" markdown="1">
<button type="button" class="button button-primary" id="copy-replication-package-instructions">Copy Replication Package Instructions</button>
<span class="copy-status" id="copy-replication-package-instructions-status" aria-live="polite"></span>
</div>

</section>

## How to Use This Guide

1. Click **Copy Replication Package Instructions** and paste the instructions into Codex, Claude Code, or another coding agent before it changes files.
2. Give the agent the replication package root and, when available, the paper source files, manuscript-ready figures, manuscript-ready tables, appendices, bibliography files, and source-data notes.
3. Decide whether the project should use the compact structure or the build/analyze structure.
4. Require one public entry point, script-specific logs, `session_info.log`, one authoritative `README.md`, and a complete figure/table crosswalk.
5. Ask the agent to run the public replication path and report any remaining mismatches, restricted-data limits, or manual steps.

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
  <li><strong>Inspect the project.</strong> Identify scripts, inputs, outputs, figures, tables, logs, helper functions, documents, and visible paper source files before editing.</li>
  <li><strong>Inspect the paper source.</strong> When LaTeX, Overleaf, appendix, figure, table, or bibliography files are available, treat them as part of the working context.</li>
  <li><strong>Choose the structure.</strong> Use the compact structure for direct public inputs and modest workflows; use build/analyze when data construction is complex, restricted, or conceptually separate.</li>
  <li><strong>Organize without losing context.</strong> Move or copy files into the chosen structure only after understanding what produces the reported results.</li>
  <li><strong>Create the public entry point.</strong> Add or repair `master.R` so the public replication path can run from a clean R session.</li>
  <li><strong>Add script logs.</strong> Every public script should create a matching log with start/end time, sample sizes, reported statistics, and warnings.</li>
  <li><strong>Run the package.</strong> Execute the public replication path when feasible and fix reproducibility issues that are clearly within scope.</li>
  <li><strong>Record the environment.</strong> Write `session_info.log` and summarize the computing environment in the README.</li>
  <li><strong>Build the crosswalk.</strong> Map each manuscript and appendix figure/table to output files, scripts, logs, LaTeX labels, and notes.</li>
  <li><strong>Check reported claims.</strong> Compare figures, tables, and in-text numerical claims against logs, generated outputs, and scripts.</li>
  <li><strong>Document restrictions.</strong> Explain any non-redistributable source, public replacement, and limits on rebuilding.</li>
  <li><strong>Report readiness.</strong> Return pass/fail items, remaining risks, and exact files that still need attention.</li>
</ol>

## What This Repository Provides

<section class="resource-grid" markdown="1">

<div class="resource-card" markdown="1">

### Copy Source

[`AGENTS.md`](https://github.com/yhoriuchi/replication-package-guide/blob/main/AGENTS.md) contains the instructions copied by the button above.

</div>

<div class="resource-card" markdown="1">

### README Template

[`templates/README_TEMPLATE.md`](https://github.com/yhoriuchi/replication-package-guide/blob/main/templates/README_TEMPLATE.md) is a copyable starting point for a project's one authoritative `README.md`.

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

The example package in [`examples/horiuchi_tago/`](https://github.com/yhoriuchi/replication-package-guide/tree/main/examples/horiuchi_tago) shows a completed compact package after applying the guide. It includes a real `README.md`, `master.R`, numbered scripts, logs, generated figures and outputs, and a paper-source consistency note.

The guide assumes an R-based workflow, with `master.R`, R scripts, and `session_info.log` as the default examples. The underlying standard is not limited to R. For Stata, Python, Julia, MATLAB, or another toolchain, ask the agent to prepare an analogous package with the appropriate single entry point, logs, software-environment record, and figure/table crosswalk.

## Before You Start

Before asking an AI agent to polish a replication package for publication, clean the project as much as possible yourself. AI is useful for checking, reorganizing, documenting, and catching inconsistencies, but it should not be treated as a substitute for the author's judgment about which files, scripts, data sources, and results are actually part of the replication record.

At minimum, remove clearly obsolete files, label exploratory scripts, identify the scripts that generate reported results, gather the paper source files when available, and decide which data can legally be shared. The cleaner the starting point, the more reliable the AI-assisted audit will be.

For a new replication package:

1. Read this guide once before organizing files.
2. Decide whether the project needs the compact structure or the build/analyze structure.
3. If starting from scratch, copy either `templates/compact/` or `templates/build-analyze/` into the new project and use its included `README.md` as the starting README.
4. If reorganizing an existing project, copy `templates/README_TEMPLATE.md` to the project root as `README.md`.
5. Delete any unused folder-tree option inside `README.md`.
6. Replace every placeholder with project-specific information.
7. Fill in the figure/table crosswalk in paper order.
8. Run `source("master.R")` from a fresh R session.
9. Confirm that `session_info.log` and one log per public script were created.
10. Commit only one README file: `README.md`.

## Recommended Paper Integration

When preparing a replication package with Codex, Claude Code, or another coding agent, set the agent's working directory so it can see both:

- the R replication package; and
- the paper source files, such as Overleaf/LaTeX files, manuscript tables, figure references, bibliography files, and appendix files.

For Overleaf users, one practical workflow is to use Overleaf's Dropbox integration and create the replication package inside, or immediately beside, the synced Overleaf project folder. This lets the agent inspect the manuscript source and the replication package in one workspace.

Recommended layout for an Overleaf project with a compact replication package:

```text
Dropbox/Apps/Overleaf/[Paper Title]/
|-- main.tex
|-- sections/
|-- references.bib
|-- figures/                  # manuscript-ready figures used by LaTeX
|-- tables/                   # manuscript-ready tables used by LaTeX
`-- r/                        # replication package or future replication package
    |-- README.md
    |-- .gitignore
    |-- master.R
    |-- project.Rproj
    |-- scripts/
    |-- data/
    |-- logs/
    |-- output/
    |-- figures/              # generated replication figures, if kept separately
    `-- tables/               # generated replication tables, if kept separately
```

In this layout, `figures/` and `tables/` at the Overleaf project root are the manuscript-ready files included by LaTeX and submitted with the paper. The `r/` folder contains the reproducible workflow. It can later become the core of the public replication package. If R generates a table that is then manually edited for publication, keep the generated version in `r/tables/` or `r/output/`, keep the edited manuscript-ready version in root-level `tables/`, and document that relationship in the README crosswalk.

Keep local and session files out of both Git and Dropbox sync. Use two ignore files because Git and Dropbox are separate systems:

- `rules.dropboxignore` belongs in the root Dropbox folder, such as `~/Dropbox/rules.dropboxignore`. It tells Dropbox what not to upload or sync anywhere under that Dropbox folder.
- `.gitignore` belongs inside each replication package or Git repository, such as `Dropbox/Apps/Overleaf/[Paper Title]/r/.gitignore`. It tells Git what not to commit for that package.

The simplest setup is to download or copy this repository's [`rules.dropboxignore`](rules.dropboxignore) file into the root Dropbox folder, then copy the same base rules into the `.gitignore` file inside each `r/` replication package. If an `r/.gitignore` already exists, append these rules rather than replacing project-specific rules.

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

Do not ignore the entire `r/` folder if the agent needs to inspect it or if it will become the replication package. Ignore only machine-specific caches, histories, package libraries, and temporary files. The `.Rproj` file, scripts, public data, generated logs, and reproducibility metadata such as `renv.lock` should usually remain visible. See Dropbox's help page on [preventing files from syncing](https://help.dropbox.com/sync/how-to-prevent-files-from-syncing) for Dropbox-specific details.

The final paper-integration check should verify that:

- every figure and table cited in the paper or appendix appears in the README crosswalk;
- every figure/table path in the paper points to the intended manuscript-ready file in root-level `figures/` or `tables/`;
- every manuscript-ready figure or table can be traced back to the R-generated source file, script, and log, especially when files are copied, renamed, or manually edited after generation;
- every in-text number reported in the paper, including estimates, standard errors, p-values, sample sizes, sampling dates, completion times, response rates, and descriptive statistics, can be traced to a script, log file, generated table, or generated figure;
- the values in the paper match the values produced by the replication scripts;
- any conceptual figure, hand-made table, or non-replicated item is clearly identified in the README crosswalk.

Recommended agent request:

```text
Please inspect both the R replication package and the Overleaf/LaTeX source. Check whether every manuscript-ready figure and table used by Overleaf matches the corresponding R-generated figure or table, and flag any copied, renamed, manually edited, stale, or unmatched file.
```

For public release, include paper source files only when appropriate and permitted. If the paper source cannot be included in the public archive, use it during preparation for the consistency check and document in `README.md` that the manuscript source was checked against the replication outputs.

## Agent Request Examples

Use the copy button for the full instructions. For narrower follow-up tasks, ask the agent for one specific pass at a time:

- Prepare or reorganize a complete replication package.
- Add or repair per-script logging.
- Prepare or repair the single authoritative `README.md`.
- Audit unnecessary files and obsolete script parts.
- Check paper, output, and log consistency.
- Review public replication scripts for coding errors.
- Check Overleaf or LaTeX reporting errors.
- Perform a final pre-release audit.

The full copy source in `AGENTS.md` contains detailed prompt language for each of these tasks without making those long prompt blocks visible on the page.

## Core Standard

A replication package is successful when a reader can unzip it, open the project root, run one command, and see exactly how the reported results were produced.

The package should satisfy these requirements:

- One public entry point: `master.R`.
- Exactly one authoritative `README.md` that explains the package, the workflow, the required software, and every figure/table output.
- One log file for each script that is part of the public replication path.
- One `session_info.log` file from a successful full run.
- Relative paths only. Scripts must run from the project root.
- No hidden manual steps. If a step cannot be automated, document why and say exactly what file is affected.
- Raw or received data should be treated as read-only.
- Generated files should be reproducible from scripts, except when restricted data prevent public rebuilding.
- All reported numerical results should appear in logs, tables, figures, or the README crosswalk.
- When paper source files are available, the replication package should be checked against the manuscript and appendix for consistency in figures, tables, and in-text numerical claims.
- Restricted, proprietary, or non-redistributable data must be documented explicitly.

## Choosing a Structure

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

Recommended for smaller packages. See [`templates/compact/`](https://github.com/yhoriuchi/replication-package-guide/tree/main/templates/compact) for a lightweight starter version.

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
|   |-- 02_analyze_main_results.R
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

## Build/Analyze Structure

Recommended for larger packages. See [`templates/build-analyze/`](https://github.com/yhoriuchi/replication-package-guide/tree/main/templates/build-analyze) for a lightweight starter version.

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

The README is the user's map. It should be complete enough that a reader can understand and verify the package without opening every script.

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
  - `scripts/02_analyze_main_results.R`
- Log:
  - `logs/02_analyze_main_results.log`
- LaTeX Label:
  - `fig:main_effect`
- Notes: main treatment effect.

#### Table 1

- Output:
  - `tables/main_results.tex`
  - `tables/main_results.csv`
- Script:
  - `scripts/03_make_tables.R`
- Log:
  - `logs/03_make_tables.log`
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
- Use `### Manuscript` and `### Appendix` as subsections. If the paper calls the appendix "Supplementary Materials," still use `### Appendix` unless journal requirements make another title clearer.
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
02_estimate_main_results.R
03_make_figures.R
04_make_tables.R
05_robustness_checks.R
```

Rules:

- Prefix public replication scripts with two-digit numbers.
- Use lowercase file names with underscores.
- Keep exploratory, obsolete, or non-paper scripts out of the public replication path.
- If such scripts are retained, place them in `scripts/not_in_paper/` or `scripts/archive/` and explain that they are not required.
- Avoid spaces and special characters in file names.

## Logs

Every public script should write a log file. Logs are not just debugging artifacts; they are part of the replication record.

Logs should include:

- script name;
- start and end time;
- important package versions if script-specific;
- row counts after major filters or merges;
- sample sizes used in each reported analysis;
- summary statistics reported in the paper;
- model estimates, standard errors, test statistics, and p-values reported in text;
- warnings at the end of the script.

The log filename should match the script filename:

```text
scripts/02_estimate_main_results.R
logs/02_estimate_main_results.log
```

For a build/analyze package:

```text
analyze/scripts/02_estimate_main_results.R
analyze/logs/02_estimate_main_results.log
```

## Suggested Logging Helper

Place a logging helper in `functions/logging.R` for compact packages or `analyze/functions/logging.R` for build/analyze packages.

```r
start_script_log <- function(script_name, log_dir = "logs") {
  dir.create(log_dir, recursive = TRUE, showWarnings = FALSE)
  log_file <- file.path(log_dir, paste0(script_name, ".log"))

  sink(log_file, split = TRUE)

  cat("############################################################\n")
  cat("Script:", paste0(script_name, ".R"), "\n")
  cat("Started:", format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z"), "\n")
  cat("############################################################\n\n")

  invisible(log_file)
}

end_script_log <- function() {
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
start_script_log("02_estimate_main_results")

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
start_script_log("02_estimate_main_results", log_dir = "analyze/logs")

tryCatch({
  # Script body goes here.
}, error = function(e) {
  cat("\nERROR:", conditionMessage(e), "\n")
  stop(e)
}, finally = {
  end_script_log()
})
```

## Master Script

Every package should include `master.R`. It is the reproducibility entry point and should run the full public replication path from a clean R session.

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
  "scripts/02_estimate_main_results.R",
  "scripts/03_make_figures.R",
  "scripts/04_make_tables.R"
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
  "analyze/scripts/01_estimate_main_results.R",
  "analyze/scripts/02_make_figures.R",
  "analyze/scripts/03_make_tables.R"
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

When manuscript source files are available, treat them as part of the working context for package preparation. This is especially useful for Overleaf projects synced through Dropbox, because the paper source files and the R replication package can be inspected together.

The final consistency pass should check:

- figure and table labels in the paper against the README crosswalk;
- manuscript figure/table file paths against the manuscript-ready files included by LaTeX;
- manuscript-ready figures and tables against the corresponding R-generated files, scripts, and logs, especially when tables are manually edited after generation;
- in-text estimates, standard errors, p-values, sample sizes, sampling dates, completion times, response rates, and descriptive statistics against logs and generated tables;
- appendix items against scripts, outputs, and logs;
- notes for any conceptual, hand-made, or non-replicated items.

If the paper source files are not included in the public replication archive, state in `README.md` whether they were used during preparation for consistency checks.

## Software Environment

At minimum, include a short computing environment summary in `README.md` and `session_info.log` from a successful full run.

Suggested README format:

```text
### Computing Environment

Software: R version [version]
Platform: [R platform]
Computer Operating System: [operating system and version]
Additional details: [RAM, processor/GPU, external tools, or other project-specific requirements when relevant.]
```

The values should come from the run that produced `session_info.log`. Some projects should report additional computing details when they affect reproducibility or runtime.

For stronger reproducibility, also consider:

- `renv.lock` for R package versions;
- a short package installation script;
- operating system notes when required by external dependencies;
- clear instructions for LaTeX, Quarto, pandoc, or command-line tools if they are needed.

Do not assume the user has the same local folder structure. Avoid `setwd()` to personal paths.

## Quality Checklist

Before releasing a replication package, verify:

- `source("master.R")` runs from a fresh R session.
- All scripts use relative paths from the project root.
- Every public script creates a matching log file.
- `session_info.log` exists and comes from a successful full run.
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

The final archive should feel boring in the best way: obvious structure, one command to run, traceable outputs, and no surprises.

<script id="replication-package-instructions-text" type="text/plain">{% include_relative AGENTS.md %}</script>
<script>
(function () {
  var button = document.getElementById("copy-replication-package-instructions");
  var source = document.getElementById("replication-package-instructions-text");
  var status = document.getElementById("copy-replication-package-instructions-status");

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
