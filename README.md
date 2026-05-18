# Replication Package Guide

**Author:** Yusaku Horiuchi  
**Affiliation:** Syde P. Deeb Eminent Scholar in Political Science, Florida State University  
**Created:** May 10, 2026  
**Last revised:** May 18, 2026

[![Page views](https://hits.sh/yhoriuchi.github.io/replication-package-guide.svg?label=page%20views&color=007ec6)](https://hits.sh/yhoriuchi.github.io/replication-package-guide/)

This repository is an instruction page and template collection for building high-quality replication packages for social science research projects. It is designed to be read by humans and by coding agents such as Codex or Claude Code before they prepare, audit, or repair a replication package.

The guide and templates assume an R-based workflow, with `master.R`, R scripts, and `session_info.log` as the default examples. The underlying standard is not limited to R. If a project uses Stata, Python, Julia, MATLAB, or another toolchain, users can ask an agentic AI to read this guide and prepare an analogous replication package with the appropriate single entry point, logs, software-environment record, and figure/table crosswalk.

The lightweight templates in this repository illustrate the recommended package designs:

- `templates/README_TEMPLATE.md`: a copyable starting point for a project's one and only `README.md`.
- `templates/compact/`: compact project structure for smaller projects.
- `templates/build-analyze/`: larger project structure with separate `build/` and `analyze/` stages.
- `examples/horiuchi_tago/`: a finished compact replication package example.

The structure templates intentionally contain only folder structure and essential example files such as `.Rproj`, `README.md`, `master.R`, script stubs, and logging helpers. They do not include full replication packages or large data files.

The example package shows what a completed compact package can look like after applying the guide. It includes a real `README.md`, `master.R`, numbered scripts, logs, generated figures and outputs, and a paper-source consistency note.

Use standard Markdown as the authoritative instruction format. Markdown is easiest for agents to read, easiest to host on GitHub or another static site, and does not require R to render. Each replication package should commit one and only one README file: `README.md`.

## Using This As A Site

The public guide is available at:

<https://yhoriuchi.github.io/replication-package-guide/>

When using Codex, Claude Code, or another coding agent, give the agent this URL and ask it to read the guide before changing any files. The GitHub repository is available at:

<https://github.com/yhoriuchi/replication-package-guide>

Keep this Markdown file as the authoritative source so the public page, repository, agents, and human readers use the same instructions.

## How To Use This Repository

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

To see a concrete finished package, inspect `examples/horiuchi_tago/`. It is included as an example, not as a template to copy blindly.

## Recommended Paper Integration

When preparing a replication package with Codex, Claude Code, or another coding agent, set the agent's working directory so it can see both:

- the R replication package; and
- the paper source files, such as Overleaf/LaTeX files, manuscript tables, figure references, bibliography files, and appendix files.

For Overleaf users, one practical workflow is to use Overleaf's Dropbox integration and create the replication package inside, or immediately beside, the synced Overleaf project folder. This lets the agent inspect the manuscript source and the replication package in one workspace.

This integration makes the most important final check much easier: consistency between the paper and the replication package. The agent should verify that:

- every figure and table cited in the paper or appendix appears in the README crosswalk;
- every figure/table path in the paper points to the corresponding replicated output;
- every in-text number reported in the paper, including estimates, standard errors, p-values, sample sizes, sampling dates, completion times, response rates, and descriptive statistics, can be traced to a script, log file, generated table, or generated figure;
- the values in the paper match the values produced by the replication scripts;
- any conceptual figure, hand-made table, or non-replicated item is clearly identified in the README crosswalk.

For public release, include paper source files only when appropriate and permitted. If the paper source cannot be included in the public archive, use it during preparation for the consistency check and document in `README.md` that the manuscript source was checked against the replication outputs.

## Common Agent Prompts

Use these copy-paste prompts with Codex, Claude Code, or another coding agent. Each prompt assumes the agent can read this guide and inspect the project files. Use one prompt at a time so the task is specific and easy to verify.

### Prepare Or Reorganize A Replication Package

```text
Please read the Replication Package Guide before making changes. Then inspect my project and prepare a complete replication package. If the paper source files are available in the working directory, also check consistency between the paper and the replication outputs.
First decide whether the project should use the compact structure or the build/analyze structure. Use the compact structure when the project is small and all public inputs can be shared directly. Use the build/analyze structure when data construction is complex, uses restricted sources, involves scraping/APIs, or produces analysis-ready datasets that should be treated as the public replication inputs.
Every replication package must include master.R, script-specific log files, session_info.log, a self-contained README, and a complete crosswalk for all figures and tables reported in the paper or appendix. Check that every figure, table, and in-text numerical claim in the paper can be traced to the replication package, including estimates, standard errors, p-values, sample sizes, sampling dates, completion times, response rates, and descriptive statistics. Do not use absolute paths. Do not require manual steps unless they are documented as unavoidable.
Use templates/compact/ or templates/build-analyze/ as the starting structure. Use the selected template's README.md, or templates/README_TEMPLATE.md, as the starting point for README.md. Replace all placeholder text with project-specific documentation.
```

### Add Or Repair Script Logs

```text
Please read the Replication Package Guide, then inspect all public R scripts in this project. Add or repair per-script logging so every public script writes a matching log file to logs/ or analyze/logs/.
Each log should record the script name, start and end time, important row counts, sample sizes, reported estimates or test results, warnings, and any other numbers reported in the paper.
Use the project's existing logging style if one exists. Do not change substantive analysis code unless needed to make logging reliable. After editing, run the public replication path and confirm that every public script produces its expected log file.
```

### Prepare Or Repair README.md

```text
Please read the Replication Package Guide and prepare or repair the project's single authoritative README.md. Use templates/README_TEMPLATE.md as the model.
The README must include the paper title and authors, description, folder tree, files included, data sources and restrictions, paper source consistency status, how to run master.R, computing environment, session information, recommended citation, last verified date, and a paper-order crosswalk for every figure and table.
Do not create additional README files. Do not include README.html or README.pdf in the repository. Embedded figure/table previews are optional; the crosswalk is required.
```

### Remove Unnecessary Files And Script Parts

```text
Please read the Replication Package Guide, then audit the project for files and code that should not be in the public replication package.
Identify and remove temporary files, caches, old exploratory outputs, obsolete scripts, unused helper functions, personal files, absolute-path artifacts, and generated files that can be recreated by scripts. Keep source data, public scripts, documentation, final outputs, logs, and files needed to reproduce results.
Before deleting anything substantial, list what you plan to remove and why. Do not remove raw data, analysis-ready public inputs, manuscript source files, or scripts needed for reported results unless I explicitly approve.
```

### Check Paper And Log Consistency

```text
Please read the Replication Package Guide, then compare the paper source files with the replication package outputs and logs.
Check every figure, table, and in-text numerical claim in the paper and appendix, including estimates, standard errors, p-values, confidence intervals, sample sizes, sampling dates, field dates, completion times, response rates, missing-data counts, and descriptive statistics.
For each reported item, verify that the value in the paper matches a script, log file, generated table, or generated figure. Report any mismatch with the paper source location, the replication source location, the paper value, and the replication value. Do not silently change paper text or analysis code; explain the discrepancy first.
```

### Review Code For Coding Errors

```text
Please read the Replication Package Guide, then review the public replication scripts for coding errors that could affect reported results.
Focus on data filtering, merges, joins, recoding, factor levels, missing-data handling, weights, clustered or robust standard errors, random seeds, model formulas, multiple-testing adjustments, output paths, and whether scripts run in the documented order from a clean R session.
Prioritize bugs, reproducibility risks, and missing tests or logs. Report findings with file paths, line references, severity, and suggested fixes. Make fixes only when they are clearly safe and within the replication package standard.
```

### Check Overleaf Reporting Errors

```text
Please read the Replication Package Guide, then inspect the Overleaf/LaTeX source files and compare them with the replication package.
Check figure references, table references, labels, captions, file paths, appendix numbering, citations to results, and all in-text numerical claims. Verify that the manuscript points to the correct generated figures and tables and that the reported values match logs or generated outputs.
Report likely reporting errors with the TeX file path, label or nearby text, the value or reference in the paper, the corresponding replication source, and a recommended correction. Do not rewrite the manuscript unless I explicitly ask you to make the edits.
```

### Final Pre-Release Audit

```text
Please read the Replication Package Guide and perform a final pre-release audit of this replication package.
Verify that source("master.R") runs from a fresh R session; every public script creates a log; session_info.log exists; README.md is the only README file; the figure/table crosswalk is complete; paper source consistency has been checked when source files are available; no absolute paths, personal files, caches, or temporary files remain; and restricted data are documented.
Return a concise release-readiness report with pass/fail items, remaining risks, and exact files that need attention.
```

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

## Choosing A Structure

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

Recommended for smaller packages. See `templates/compact/` for a lightweight starter version.

```text
replication_package/
|-- README.md
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

Recommended for larger packages. See `templates/build-analyze/` for a lightweight starter version.

```text
replication_package/
|-- README.md
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

- citation and paper title;
- short description of what the package reproduces;
- folder tree;
- software requirements;
- computing environment summary;
- instructions for running `master.R`;
- instructions for running individual scripts, if useful;
- explanation of all data sources;
- note on restricted or omitted data, if relevant;
- note on whether paper source files were checked against replication outputs;
- description of logs and session information;
- figure/table crosswalk in paper order;
- optional figure/table previews when useful;
- final verification date.

Use exactly one `README.md` regardless of package size. For build/analyze packages, keep the documentation in one file and organize it with internal sections:

- Overview and how to run.
- Directory structure.
- Data sources and restricted-data notes.
- Build-stage documentation.
- Analysis-stage documentation.
- Paper-order figure/table crosswalk.
- Session information and verification date.

Commit only `README.md`. If an archive or journal requires HTML or PDF documentation, generate those files from `README.md` at release time and make clear that `README.md` remains the source.

## Figure And Table Crosswalk

The README must include a crosswalk that maps every reported figure and table to its output file, script, and log. Embedded previews are optional. Use them only when they make the package easier to inspect; they are not required when the crosswalk is complete.

For figures:

- save the publication format required by the journal, such as `.pdf` or `.eps`;
- include the output path in the crosswalk;
- include the script that produced the figure;
- include the log file for that script;
- note when a figure is conceptual or otherwise has no code.

Use a description-list style instead of a wide table, especially when
paths are long:

```markdown
<dl>
<dt>Manuscript item</dt>
<dd>Figure 1</dd>
<dt>Output</dt>
<dd>No output file</dd>
<dt>Script</dt>
<dd>No code</dd>
<dt>Log</dt>
<dd>Not applicable</dd>
<dt>Notes</dt>
<dd>Conceptual figure.</dd>
</dl>

<dl>
<dt>Manuscript item</dt>
<dd>Figure 2</dd>
<dt>Output</dt>
<dd><code>figures/main_effect.pdf</code></dd>
<dt>Script</dt>
<dd><code>scripts/02_analyze_main_results.R</code></dd>
<dt>Log</dt>
<dd><code>logs/02_analyze_main_results.log</code></dd>
<dt>Notes</dt>
<dd>Main treatment effect.</dd>
</dl>
```

For tables:

- save machine-readable output when possible, such as `.csv`;
- save publication output when needed, such as `.tex`, `.html`, or `.docx`;
- include the output path in the crosswalk;
- include the script that produced the table;
- include the log file for that script.

Example:

```markdown
<dl>
<dt>Manuscript item</dt>
<dd>Table 1</dd>
<dt>Output</dt>
<dd><code>tables/main_results.csv</code></dd>
<dt>Script</dt>
<dd><code>scripts/03_make_tables.R</code></dd>
<dt>Log</dt>
<dd><code>logs/03_make_tables.log</code></dd>
<dt>Notes</dt>
<dd>Main regression table.</dd>
</dl>
```

For compact projects, this can be one crosswalk section. For large projects, separate manuscript and appendix items if that makes the README easier to scan:

```markdown
## Replication Guide: Figures And Tables

### Manuscript

<dl>
<dt>Manuscript item</dt>
<dd>Figure 1</dd>
<dt>Output</dt>
<dd><code>figures/main_effect.pdf</code></dd>
<dt>Script</dt>
<dd><code>scripts/02_analyze_main_results.R</code></dd>
<dt>Log</dt>
<dd><code>logs/02_analyze_main_results.log</code></dd>
<dt>Notes</dt>
<dd>Main result.</dd>
</dl>

<dl>
<dt>Manuscript item</dt>
<dd>Table 1</dd>
<dt>Output</dt>
<dd><code>tables/main_results.csv</code></dd>
<dt>Script</dt>
<dd><code>scripts/03_make_tables.R</code></dd>
<dt>Log</dt>
<dd><code>logs/03_make_tables.log</code></dd>
<dt>Notes</dt>
<dd>Main regression table.</dd>
</dl>

### Appendix

<dl>
<dt>Manuscript item</dt>
<dd>Figure A.1</dd>
<dt>Output</dt>
<dd><code>figures/appendix_balance.pdf</code></dd>
<dt>Script</dt>
<dd><code>scripts/04_appendix_checks.R</code></dd>
<dt>Log</dt>
<dd><code>logs/04_appendix_checks.log</code></dd>
<dt>Notes</dt>
<dd>Balance check.</dd>
</dl>
```

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

update_readme_environment <- function(readme = "README.md") {
  if (!file.exists(readme)) return(invisible(FALSE))

  session <- sessionInfo()
  r_version <- paste("R version", paste(R.version$major, R.version$minor, sep = "."))
  operating_system <- session$running

  if (length(operating_system) == 0 || is.na(operating_system[1]) || !nzchar(operating_system[1])) {
    sys <- Sys.info()
    operating_system <- paste(sys[["sysname"]], sys[["release"]])
  }

  environment_block <- c(
    "### Computing Environment",
    "",
    paste("Software:", r_version),
    paste("Platform:", session$platform),
    paste("Computer Operating System:", operating_system)
  )

  lines <- readLines(readme, warn = FALSE)
  existing <- which(grepl("^#{1,6} Computing Environment$", lines))

  trim_blank_edges <- function(x) {
    if (length(x) == 0) return(x)

    nonblank <- which(nzchar(x))
    if (length(nonblank) == 0) return(character())

    x[seq.int(min(nonblank), max(nonblank))]
  }

  if (length(existing) > 0) {
    start <- existing[1]
    following_heading <- which(seq_along(lines) > start & grepl("^#{1,6} ", lines))
    end <- if (length(following_heading) > 0) following_heading[1] - 1 else length(lines)
    existing_block <- if (start < end) lines[(start + 1):end] else character()
    extra_environment_lines <- existing_block[
      !grepl("^(Software:|Platform:|Computer Operating System:)", existing_block)
    ]
    extra_environment_lines <- trim_blank_edges(extra_environment_lines)

    if (length(extra_environment_lines) > 0) {
      environment_block <- c(environment_block, "", extra_environment_lines)
    }
    environment_block <- c(environment_block, "")

    before <- if (start > 1) lines[seq_len(start - 1)] else character()
    after <- if (end < length(lines)) lines[(end + 1):length(lines)] else character()
    lines <- c(before, environment_block, after)
  } else {
    environment_block <- c(environment_block, "")
    session_heading <- which(grepl("^## .*Session Information$", lines))

    if (length(session_heading) > 0) {
      following_section <- which(seq_along(lines) > session_heading[1] & grepl("^## ", lines))
      insert_before <- if (length(following_section) > 0) following_section[1] else length(lines) + 1
      before <- if (insert_before > 1) lines[seq_len(insert_before - 1)] else character()
      after <- if (insert_before <= length(lines)) lines[insert_before:length(lines)] else character()

      if (length(before) > 0 && nzchar(tail(before, 1))) before <- c(before, "")
      lines <- c(before, environment_block, after)
    } else {
      if (length(lines) > 0 && nzchar(tail(lines, 1))) lines <- c(lines, "")

      lines <- c(
        lines,
        "## Session Information",
        "",
        "The file `session_info.log` records the R version, platform, loaded packages, and runtime from a successful full run.",
        "",
        environment_block
      )
    }
  }

  writeLines(lines, readme, useBytes = TRUE)
  invisible(TRUE)
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

update_readme_environment("README.md")
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

If any source cannot be redistributed, include a restricted-data section in `README.md`.

It should explain:

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
- manuscript figure/table file paths against generated outputs;
- in-text estimates, standard errors, p-values, sample sizes, sampling dates, completion times, response rates, and descriptive statistics against logs and generated tables;
- appendix items against scripts, outputs, and logs;
- notes for any conceptual, hand-made, or non-replicated items.

If the paper source files are not included in the public replication archive, state in `README.md` whether they were used during preparation for consistency checks.

## Software Environment

At minimum, include a short computing environment summary in `README.md` and `session_info.log` from a successful full run. The template `master.R` files automatically refresh the software, platform, and operating-system lines after writing `session_info.log`.

Suggested README format:

```text
### Computing Environment

Software: R version [version]
Platform: [R platform]
Computer Operating System: [operating system and version]
Additional details: [RAM, processor/GPU, external tools, or other project-specific requirements when relevant.]
```

The values should come from the run that produced `session_info.log`. For example, use the `R version`, `Platform`, and `Running under` lines printed by `sessionInfo()`.

Some projects should report additional computing details when they affect reproducibility or runtime, such as RAM, CPU/GPU, external command-line tools, licensed software, high-performance-computing settings, or non-R language versions.

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
- Every figure/table has an output path, script path, and log path.
- Every reported number in the paper source has been checked against logs, tables, figures, or scripts when the paper source is available.
- All reported text numbers can be traced to a log, table, figure, or script.
- All restricted data sources are documented.
- All temporary, personal, and cache files are removed.
- The package contains no absolute personal paths.
- File names are stable and readable.
- The package opens cleanly on another computer.

## Recommended Workflow For Agents

When an agent prepares a package, it should follow this sequence:

1. Inspect the project files and identify all scripts, data inputs, figures, tables, and documents.
2. Inspect the paper source files when they are available in the same working directory.
3. Decide whether to use the compact or build/analyze structure.
4. Move or copy files into the chosen structure without deleting original work until the user approves.
5. Create or repair `master.R`.
6. Add per-script logging.
7. Run the public replication path.
8. Record `session_info.log`.
9. Build the README figure/table crosswalk.
10. Check paper-replication consistency for figures, tables, and in-text numerical claims.
11. Add embedded previews only if they make the README easier to inspect.
12. Re-run the package after documentation changes.
13. Report any files that cannot be reproduced because of restricted data or missing inputs.

## Minimal Release Contents

For a compact package:

```text
README.md
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
master.R
session_info.log
build/
analyze/
```

The final archive should feel boring in the best way: obvious structure, one command to run, traceable outputs, and no surprises.
