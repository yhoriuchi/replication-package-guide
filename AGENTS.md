# Agent and User Instructions: Prepare a Replication Package

These instructions are for Codex, Claude Code, or another coding agent preparing, auditing, or repairing a social science replication package. The goal is a public package that a reader can open, run from one entry point, and use to trace every reported result back to code, data, logs, and documentation.

## Required User Context

Before starting, the user should provide or identify:

1. The replication package root or draft project folder.
2. The paper source files when available, such as Overleaf/LaTeX files, manuscript-ready figures, manuscript-ready tables, appendices, and bibliography files.
3. Any source data that can be shared with the agent.
4. Any data that are restricted, proprietary, confidential, licensed, or otherwise non-redistributable.
5. The target public archive, journal, or repository requirements.
6. Whether the package should use a compact structure or a separate build/analyze structure, if already known.

The user should remove clearly obsolete files when possible, label exploratory scripts, identify the scripts that generate reported results, and decide which data can legally be shared. The agent can help audit and organize, but the author remains responsible for judging which data, scripts, files, and results belong in the replication record.

## What the Agent Must Do

1. Inspect the project before changing files.
2. Identify all scripts, data inputs, generated outputs, figures, tables, logs, helper functions, documents, and paper source files visible in the workspace.
3. Decide whether the package should use the compact structure or the build/analyze structure.
4. Preserve substantive analysis choices unless a change is clearly needed for reproducibility, logging, paths, or documentation.
5. Use relative paths from the project root.
6. Create or repair one public entry point named `master.R`.
7. Create or repair one authoritative package README named `README.md`.
8. Add or repair one log file for every public script.
9. Run the public replication path when feasible.
10. Record `session_info.log` from a successful full run.
11. Build a complete paper-order figure/table crosswalk.
12. Check paper-replication consistency when paper source files are available.
13. Document restricted data, manual steps, and remaining risks.
14. Generate `MANIFEST-SHA256.txt` after the final successful run and final cleanup.
15. Report exactly what changed, what was verified, and what could not be verified.

## What the Agent Must Avoid

1. Do not use absolute personal paths.
2. Do not create multiple competing README files.
3. Do not silently delete raw data, manuscript source files, or scripts needed for reported results.
4. Do not remove restricted-data documentation merely because the restricted source cannot be included.
5. Do not require manual steps unless they are unavoidable and documented.
6. Do not treat generated previews as a substitute for a figure/table crosswalk.
7. Do not change substantive analysis code unless needed to make the public replication path run correctly or to fix a clearly identified coding error.
8. Do not hide failed scripts, warnings, stale outputs, or mismatches between the paper and replication outputs.

## Core Workflow

1. Inspect the project files and identify all candidate inputs, scripts, outputs, figures, tables, and documents.
2. Inspect the paper source files when they are available in the same working directory.
3. Decide whether to use the compact structure or the build/analyze structure.
4. Move or copy files into the chosen structure without deleting original work until the user approves.
5. Create or repair `master.R`.
6. Add or repair per-script logging.
7. Run the public replication path.
8. Record `session_info.log`.
9. Build the README figure/table crosswalk in paper order.
10. Check paper-replication consistency for figures, tables, and in-text numerical claims.
11. Add embedded previews only if they make the README easier to inspect.
12. Re-run the package after documentation changes.
13. Complete final cleanup and generate `MANIFEST-SHA256.txt`.
14. Verify the manifest before release.
15. Report any files that cannot be reproduced because of restricted data or missing inputs.

## Final Readiness Report

When the work is complete, return a concise readiness report. The report should be specific enough that the user can decide whether the package is ready for public release.

Include:

- overall status: ready, ready with caveats, or not ready;
- files changed and why;
- command used to run the public replication path;
- whether `master.R` ran successfully;
- whether every public script produced a matching log;
- whether `session_info.log` was created from a successful full run;
- whether `MANIFEST-SHA256.txt` covers and verifies every released file other than itself;
- whether the README folder tree, data-source notes, and figure/table crosswalk match the package;
- whether manuscript and appendix figures, tables, and in-text numerical claims were checked against logs, outputs, and scripts when paper source files were available;
- restricted-data limits, manual steps, missing inputs, warnings, failures, or remaining mismatches;
- exact files or sections that still need user attention.

## Core Standard

A replication package is successful when a reader can unzip it, open the project root, run one command, and see exactly how the reported results were produced.

The package should satisfy these requirements:

- One public entry point: `master.R`.
- Exactly one authoritative `README.md` that explains the package, the workflow, the required software, and every figure/table output.
- One log file for each script that is part of the public replication path.
- One `session_info.log` file from a successful full run.
- One `MANIFEST-SHA256.txt` checksum inventory generated from the final release contents.
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

Recommended for smaller packages:

```text
r/
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
r/
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
- start and end time;
- important package versions if script-specific;
- row counts after major filters or merges;
- sample sizes used in each reported analysis;
- summary statistics reported in the paper;
- model estimates, standard errors, test statistics, and p-values reported in text;
- warnings at the end of the script.

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

The values should come from the run that produced `session_info.log`. Some projects should report additional computing details when they affect reproducibility or runtime, such as RAM, CPU/GPU, external command-line tools, licensed software, high-performance-computing settings, or non-R language versions.

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

- `source("master.R")` runs from a fresh R session.
- All scripts use relative paths from the project root.
- Every public script creates a matching log file.
- `session_info.log` exists and comes from a successful full run.
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
