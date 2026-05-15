# Replication of "[Paper Title]"

**Authors:** [Author 1], [Author 2], and [Author 3]

## Description

- This replication package reproduces [all / selected] figures and tables reported in "[Paper Title]" and its supplementary materials.
- All public analysis scripts write console output and messages to per-script log files saved in `analyze/logs/`.
- This build/analyze template is for larger projects where data construction is separated from analysis, but the package still has one and only one authoritative `README.md`.

## Folder Tree

```text
replication_package/
|-- README.md
|-- master.R
|-- project.Rproj
|-- session_info.log
|
|-- build/
|   |-- data/
|   |-- documents/
|   |-- scripts/
|   |-- output/
|   |   `-- analysis_ready/
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

## Data Sources

List raw, received, public, and analysis-ready data sources here.

| Source | Location | Redistributable? | Notes |
|---|---|---|---|
| Example source | `build/data/` | Yes | Replace with actual source documentation. |

## Restricted Data

Use this section when the project has restricted, proprietary, confidential, licensed, or otherwise non-redistributable inputs.

For each restricted source, document:

- source name;
- owner or vendor;
- reason the data cannot be redistributed;
- scripts that originally used the source;
- public analysis-ready files that replace the source;
- whether licensed users can rebuild the data;
- whether published results can be reproduced without access to the restricted source.

| Source | Restriction | Build scripts | Public replacement | Notes |
|---|---|---|---|---|
| None in template | Not applicable | Not applicable | Not applicable | Replace this row. |

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

The public replication path should normally use files in `build/output/analysis_ready/` and run scripts in `analyze/scripts/`.

Alternatively, run individual public analysis scripts in order:

```r
source("analyze/scripts/00_list_inputs.R")
source("analyze/scripts/01_analyze_results.R")
source("analyze/scripts/02_make_figures_tables.R")
```

## Build Stage

This section documents how analysis-ready data are created.

In a public replication package, users should not be required to rerun the build stage when it depends on restricted data, APIs, scraping, or expensive upstream collection. In those cases, include the redistributable analysis-ready files in `build/output/analysis_ready/` and document the original build process here.

| Script | Output | Log | Purpose |
|---|---|---|---|
| `build/scripts/01_build_analysis_ready_data.R` | `build/output/analysis_ready/example_analysis_data.rds` | `build/logs/01_build_analysis_ready_data.log` | Toy template build step. |

## Analysis Stage

This section maps every reported figure and table to the analysis script and log that produced it. Embedded previews are optional.

### Manuscript Figures And Tables

| Paper item | Output | Script | Log | Notes |
|---|---|---|---|---|
| Figure 1 | No output file | No code | Not applicable | Conceptual figure. |
| Figure 2 | `analyze/figures/example_figure.png` | `analyze/scripts/02_make_figures_tables.R` | `analyze/logs/02_make_figures_tables.log` | Example figure. |
| Table 1 | `analyze/tables/example_results.csv` | `analyze/scripts/02_make_figures_tables.R` | `analyze/logs/02_make_figures_tables.log` | Example table. |

### Appendix / Supplementary Figures And Tables

| Paper item | Output | Script | Log | Notes |
|---|---|---|---|---|
| Figure A.1 | `[path/to/output]` | `[path/to/script.R]` | `[path/to/log.log]` | Replace or delete this row. |

## Session Information

The file `session_info.log` records the R version, platform, loaded packages, and runtime from a successful full run.

The master script updates the software, platform, and operating-system lines below after a successful full run. Add project-specific hardware or software details when they affect reproducibility.

### Computing Environment

Software: R version [version]
Platform: [R platform]
Computer Operating System: [operating system and version]
Additional details: [RAM, processor/GPU, external tools, or other project-specific requirements when relevant.]

## Last Verified

Replace with the date of the last successful full run.
