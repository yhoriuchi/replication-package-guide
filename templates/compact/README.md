# Replication of "[Paper Title]"

## [Author 1], [Author 2], and [Author 3]

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

## Replication Guide: Figures And Tables

Update this crosswalk so every manuscript and appendix figure/table has an output file, script, and log. Embedded previews are optional.

### Manuscript Figures And Tables

| Paper item | Output | Script | Log | Notes |
|---|---|---|---|---|
| Figure 1 | No output file | No code | Not applicable | Conceptual figure. |
| Figure 2 | `figures/example_figure.png` | `scripts/03_make_figures_tables.R` | `logs/03_make_figures_tables.log` | Example figure. |
| Table 1 | `tables/example_results.csv` | `scripts/03_make_figures_tables.R` | `logs/03_make_figures_tables.log` | Example table. |

### Appendix / Supplementary Figures And Tables

| Paper item | Output | Script | Log | Notes |
|---|---|---|---|---|
| Figure A.1 | `[path/to/output]` | `[path/to/script.R]` | `[path/to/log.log]` | Replace or delete this row. |

## Recommended Citation

If you use or adapt the analysis code, please cite the replication data archive associated with the published article.

## Last Verified

Replace with the date of the last successful full run.
