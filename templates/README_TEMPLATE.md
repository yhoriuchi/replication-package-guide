# Replication of "[Paper Title]"

**Authors:** [Author 1], [Author 2], and [Author 3]

## Description

- This replication package reproduces [all / selected] figures and tables reported in "[Paper Title]" and its supplementary materials.
- All public scripts write console output and messages to per-script log files saved in `logs/` or `analyze/logs/`.
- The file `session_info.log` records the R version, platform, loaded packages, and runtime from a successful full run.
- The file `MANIFEST-SHA256.txt` inventories every released file other than itself.

## How To Run

1. Open the project directory. Recommended: open `project.Rproj` in RStudio.
2. From the project root, run:

```r
source("master.R")
```

Alternatively, run individual public scripts in order:

```r
source("scripts/01_prepare_data.R")
source("scripts/02_analyze_results.R")
source("scripts/03_make_figures_tables.R")
```

For build/analyze packages, use paths such as:

```r
source("analyze/scripts/00_list_inputs.R")
source("analyze/scripts/01_analyze_results.R")
source("analyze/scripts/02_make_figures_tables.R")
```

## Folder Tree

Choose the tree that matches the project structure and delete the other one.

### Compact Structure

Use this structure when the project is small enough that data, scripts, figures, tables, and outputs can live in one project root.

```text
analysis/
|-- project.Rproj
|-- .gitignore
|-- master.R
|-- README.md
|-- session_info.log
|-- MANIFEST-SHA256.txt
|
|-- data/
|   `-- [public input data]
|
|-- documents/
|   |-- paper/
|   `-- questionnaires/
|
|-- functions/
|   `-- logging.R
|
|-- scripts/
|   |-- 01_prepare_data.R
|   |-- 02_analyze_results.R
|   `-- 03_make_figures_tables.R
|
|-- figures/
|   `-- [generated figures]
|
|-- tables/
|   `-- [generated tables]
|
|-- output/
|   `-- [reproducible intermediate files]
|
`-- logs/
    `-- [one log file per public script]
```

### Build/Analyze Structure

Use this structure when data construction is complex, conceptually separate from analysis, or depends on restricted/non-reproducible upstream sources.

```text
analysis/
|-- project.Rproj
|-- .gitignore
|-- master.R
|-- README.md
|-- session_info.log
|-- MANIFEST-SHA256.txt
|
|-- build/
|   |-- data/
|   |   `-- [raw or received inputs, when distributable]
|   |-- documents/
|   |   `-- [source documentation and provenance files]
|   |-- scripts/
|   |   `-- [scripts that create analysis-ready data]
|   |-- output/
|   |   `-- analysis_ready/
|   `-- logs/
|
`-- analyze/
    |-- functions/
    |-- scripts/
    |-- figures/
    |-- tables/
    |-- output/
    `-- logs/
```

## Files Included In This Package

- **`master.R`**
  Master script that runs the public replication path.

- **`README.md`**
  Documentation describing the replication package, directory structure, how to run the project, data restrictions, and the figure/table crosswalk.

- **`project.Rproj`**
  RStudio project file. Optional but recommended.

- **`.gitignore`**
  Git ignore rules for local/session files and machine-specific caches.

- **`session_info.log`**
  Full-run session information from a successful replication run.

- **`MANIFEST-SHA256.txt`**
  SHA-256 checksum inventory generated after the final run and cleanup.

- **`data/` or `build/data/`**
  Public raw or received input data. Describe each important input file here.

- **`build/output/analysis_ready/`**
  For build/analyze packages, this folder contains the analysis-ready data used by the public replication path.

- **`documents/` or `build/documents/`**
  Supporting documentation such as questionnaires, codebooks, data dictionaries, source notes, and accepted manuscript files.

- **`functions/` or `analyze/functions/`**
  Reusable R functions sourced by the scripts.

- **`scripts/` or `analyze/scripts/`**
  Numbered public scripts that reproduce the results.

- **`figures/` or `analyze/figures/`**
  Generated figures.

- **`tables/` or `analyze/tables/`**
  Generated tables.

- **`output/` or `analyze/output/`**
  Reproducible intermediate objects.

- **`logs/` or `analyze/logs/`**
  Per-script log files created during execution.

## Data Sources And Restrictions

Describe all data sources used in the package.

- **[Source name]**
  - Location: `[path/to/file-or-folder]`
  - Redistributable: Yes/No
  - Notes: [License, access, provenance, or other source notes.]
  - Citation: [Preferred data citation.]
  - License: [License name or terms.]
  - Accessed: [Date accessed.]

If any source is restricted, proprietary, confidential, licensed, or otherwise non-redistributable, explain:

- **[Restricted source name]**
  - Location: `[restricted/path-or-description]`
  - Redistributable: No
  - Restriction: [Why the source cannot be redistributed.]
  - Scripts using this source: `[path/to/script.R]`
  - Public replacement: `[path/to/analysis_ready_file]`
  - Licensed rebuild: [Whether licensed users can rebuild the data.]
  - Public reproducibility: [Whether published results can be reproduced without access to the restricted source.]

### Human-Subjects, Ethics, and Disclosure Review

- Ethics/IRB documentation: `[path or public statement]`
- Survey instruments and exact response options: `[path]`
- Variable-level codebook: `[path]`
- De-identification review: [Date, reviewer, and result.]
- Sensitive fields removed or retained: [Explain.]

## Build Stage

For build/analyze packages, document how analysis-ready data are created. Delete this section for compact packages if it is not needed.

- **[Build script or stage name]**
  - Script: `build/scripts/[script_name].R`
  - Output: `build/output/analysis_ready/[file_name]`
  - Log: `build/logs/[script_name].log`
  - Purpose: [Brief description.]

## Analysis Stage

List public analysis scripts, helper files, or generated outputs when useful. Keep this section concise; the paper-order mapping belongs in `Figures And Tables`.

- **[Analysis script or stage name]**
  - Script: `scripts/[script_name].R` or `analyze/scripts/[script_name].R`
  - Output: `[path/to/output]`
  - Log: `[path/to/log.log]`
  - Purpose: [Brief description.]

## Paper Source And Consistency Checks

State whether the paper source files were available during preparation. If the paper was written in Overleaf and synchronized through GitHub or an approved storage service, note whether the replication package was prepared inside or alongside that synchronized workspace.

Paper source status:

- [Paper source files were available and checked against the replication outputs.]
- [Paper source files were not included in the public archive but were used during package preparation.]
- [Paper source files were not available for this replication package.]

The consistency check should verify:

- every figure and table cited in the paper or appendix appears in `Figures And Tables`;
- every figure/table path in the paper points to the corresponding replicated output;
- manuscript-ready figures and tables are checked against the corresponding generated files, scripts, and logs, especially when publication tables are manually edited after generation;
- every in-text estimate, standard error, p-value, sample size, sampling date, completion time, response rate, and descriptive statistic can be traced to a script, log file, generated table, or generated figure;
- conceptual figures, hand-made tables, or non-replicated items are clearly identified in `Figures And Tables`.
- every manuscript/package table matches numerically and every figure matches visually or pixel by pixel;
- every in-text estimate, sample size, date, percentage, significance claim, and subgroup count is traced;
- the complete manuscript compiles and has been visually inspected.

## Figures And Tables

Every manuscript and appendix figure/table should appear below in paper order. Use one `####` entry for each individual figure or table number used in the manuscript or appendix, even when multiple entries are generated by the same script.

### Manuscript

#### Figure 1

- Output: No output file.
- Script: No code.
- Log: Not applicable.
- LaTeX Label:
  - `fig:[label]`
- Notes: conceptual figure.

#### Figure 2

- Output:
  - `figures/[figure_file].pdf`
- Script:
  - `scripts/[script_name].R`
- Log:
  - `logs/[script_name].log`
- LaTeX Label:
  - `fig:[label]`
- Notes: [Brief description.]

#### Table 1

- Output:
  - `tables/[table_file].csv`
- Script:
  - `scripts/[script_name].R`
- Log:
  - `logs/[script_name].log`
- LaTeX Label:
  - `tab:[label]`
- Notes: [Brief description.]

### Appendix

#### Figure A.1

- Output:
  - `figures/[appendix_figure].pdf`
- Script:
  - `scripts/[script_name].R`
- Log:
  - `logs/[script_name].log`
- LaTeX Label:
  - `fig:[appendix_label]`
- Notes: [Brief description.]

#### Table A.1

- Output:
  - `tables/[appendix_table].csv`
- Script:
  - `scripts/[script_name].R`
- Log:
  - `logs/[script_name].log`
- LaTeX Label:
  - `tab:[appendix_label]`
- Notes: [Brief description.]

## Software Requirements

List required software and packages. Include installation instructions if useful.

```r
install.packages(c(
  "[package1]",
  "[package2]"
))
```

## Session Information

The file `session_info.log` records the R version, platform, loaded packages, and runtime from a successful full run of the replication package.

The master script updates the software, platform, and operating-system lines below after a successful full run. Add project-specific hardware or software details when they affect reproducibility.

### Computing Environment

Software: R version [version]
Platform: [R platform]
Computer Operating System: [operating system and version]
Additional details: [RAM, processor/GPU, external tools, or other project-specific requirements when relevant.]

## Recommended Citation

If you use or adapt the analysis code, please cite the replication data archive associated with the published article.

## Last Verified

Verified on [Month Day, Year] by running:

```r
source("master.R")
```

from the project root.

The final release ZIP was then extracted into a new temporary directory. Every entry in `MANIFEST-SHA256.txt` verified, and the extracted package ran without relying on files outside the archive.
