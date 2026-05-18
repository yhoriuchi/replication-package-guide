# Replication of "[Paper Title]"

**Authors:** [Author 1], [Author 2], and [Author 3]

## Description

- This replication package reproduces [all / selected] figures and tables reported in "[Paper Title]" and its supplementary materials.
- All scripts write console output and messages to per-script log files saved in `logs/`.

This compact template is for smaller projects where the public data, analysis scripts, figures, and tables can live in one project root.

## Folder Tree

```text
replication_package/
|-- README.md
|-- master.R
|-- project.Rproj
|-- session_info.log
|
|-- data/
|-- documents/
|   |-- paper/
|   `-- questionnaires/
|-- scripts/
|-- functions/
|-- figures/
|-- tables/
|-- output/
`-- logs/
```

## Files

- `master.R`: public entry point for the full replication run.
- `README.md`: one authoritative documentation file.
- `scripts/`: numbered scripts in execution order.
- `functions/logging.R`: shared helper for script-level logs.
- `data/`: public input data.
- `output/`: reproducible intermediate objects.
- `figures/`: generated figures.
- `tables/`: generated tables.
- `logs/`: one log file per script.

## Paper Source And Consistency Checks

State whether the paper source files were available during preparation. If the paper was written in Overleaf and synced through Dropbox, note whether this replication package was prepared inside or alongside the synced Overleaf folder.

Paper source status:

- [Paper source files were available and checked against the replication outputs.]
- [Paper source files were not included in the public archive but were used during package preparation.]
- [Paper source files were not available for this replication package.]

The consistency check should verify that every figure, table, and in-text number reported in the paper can be traced to the scripts, logs, generated tables, or generated figures in this package.

## How To Run

From a fresh R session at the project root:

```r
source("master.R")
```

Alternatively, run individual public scripts in order:

```r
source("scripts/01_prepare_data.R")
source("scripts/02_analyze_results.R")
source("scripts/03_make_figures_tables.R")
```

## Session Information

The file `session_info.log` records the R version, platform, loaded packages, and runtime from a successful full run.

The master script updates the software, platform, and operating-system lines below after a successful full run. Add project-specific hardware or software details when they affect reproducibility.

### Computing Environment

Software: R version [version]
Platform: [R platform]
Computer Operating System: [operating system and version]
Additional details: [RAM, processor/GPU, external tools, or other project-specific requirements when relevant.]

## Replication Guide: Figures And Tables

Update this crosswalk so every manuscript and appendix figure/table has an output file, script, and log. Embedded previews are optional. Use a heading-plus-bullet structure instead of a wide table so long output paths remain readable. Do not put LaTeX labels in parentheses next to figure/table titles. Add `LaTeX label` after `Log` and before `Notes`. If a field lists multiple outputs, scripts, logs, or labels, use indented sub-items inside that field.

### Manuscript Figures And Tables

#### Figure: Conceptual Figure

- Paper item: manuscript figure.
- Output: No output file.
- Script: No code.
- Log: Not applicable.
- LaTeX label:
  - `fig:[label]`
- Notes: conceptual figure.

#### Figure: Example Figure

- Paper item: manuscript figure.
- Output:
  - `figures/example_figure.png`
- Script:
  - `scripts/03_make_figures_tables.R`
- Log:
  - `logs/03_make_figures_tables.log`
- LaTeX label:
  - `fig:example_figure`
- Notes: example figure.

#### Table: Example Results

- Paper item: manuscript table.
- Output:
  - `tables/example_results.csv`
- Script:
  - `scripts/03_make_figures_tables.R`
- Log:
  - `logs/03_make_figures_tables.log`
- LaTeX label:
  - `tab:example_results`
- Notes: example table.

### Appendix / Supplementary Figures And Tables

#### Figure: Appendix Figure

- Paper item: appendix figure.
- Output:
  - `[path/to/output]`
- Script:
  - `[path/to/script.R]`
- Log:
  - `[path/to/log.log]`
- LaTeX label:
  - `fig:[appendix_label]`
- Notes: replace or delete this entry.

## Recommended Citation

If you use or adapt the analysis code, please cite the replication data archive associated with the published article.

## Last Verified

Replace with the date of the last successful full run.
