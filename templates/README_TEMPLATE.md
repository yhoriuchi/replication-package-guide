# Replication of "[Paper Title]"

**Authors:** [Author 1], [Author 2], and [Author 3]

## Description

- This replication package reproduces [all / selected] figures and tables reported in "[Paper Title]" and its supplementary materials.
- All public scripts write console output and messages to per-script log files saved in `logs/` or `analyze/logs/`.
- The file `session_info.log` records the R version, platform, loaded packages, and runtime from a successful full run.

## Folder Tree

Choose the tree that matches the project structure and delete the other one.

### Compact Structure

Use this structure when the project is small enough that data, scripts, figures, tables, and outputs can live in one project root.

```text
replication_package/
|-- project.Rproj
|-- master.R
|-- README.md
|-- session_info.log
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
replication_package/
|-- project.Rproj
|-- master.R
|-- README.md
|-- session_info.log
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

| Source | Location | Redistributable? | Notes |
|---|---|---|---|
| [Source name] | `[path/to/file]` | Yes/No | [License, access, or provenance notes.] |

If any source is restricted, proprietary, confidential, licensed, or otherwise non-redistributable, explain:

- why the source cannot be redistributed;
- which scripts originally used it;
- which public analysis-ready file replaces it;
- whether licensed users can rebuild the data;
- whether published results can be reproduced without access to the restricted source.

## Paper Source And Consistency Checks

State whether the paper source files were available during preparation. If the paper was written in Overleaf and synced through Dropbox, note whether the replication package was prepared inside or alongside the synced Overleaf folder.

Paper source status:

- [Paper source files were available and checked against the replication outputs.]
- [Paper source files were not included in the public archive but were used during package preparation.]
- [Paper source files were not available for this replication package.]

The consistency check should verify:

- every figure and table cited in the paper or appendix appears in the crosswalk below;
- every figure/table path in the paper points to the corresponding replicated output;
- manuscript-ready figures and tables are checked against the corresponding generated files, scripts, and logs, especially when publication tables are manually edited after generation;
- every in-text estimate, standard error, p-value, sample size, sampling date, completion time, response rate, and descriptive statistic can be traced to a script, log file, generated table, or generated figure;
- conceptual figures, hand-made tables, or non-replicated items are clearly identified in the crosswalk.

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

## Session Information

The file `session_info.log` records the R version, platform, loaded packages, and runtime from a successful full run of the replication package.

The master script updates the software, platform, and operating-system lines below after a successful full run. Add project-specific hardware or software details when they affect reproducibility.

### Computing Environment

Software: R version [version]
Platform: [R platform]
Computer Operating System: [operating system and version]
Additional details: [RAM, processor/GPU, external tools, or other project-specific requirements when relevant.]

## Replication Guide: Figures And Tables

Every manuscript and appendix figure/table should appear in the crosswalk below. Embedded previews are optional; the crosswalk is required. Use description-list entries instead of a wide table so long output paths remain readable.

### Manuscript Figures And Tables

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
<dd><code>figures/[figure_file].pdf</code></dd>
<dt>Script</dt>
<dd><code>scripts/[script_name].R</code></dd>
<dt>Log</dt>
<dd><code>logs/[script_name].log</code></dd>
<dt>Notes</dt>
<dd>[Brief description.]</dd>
</dl>

<dl>
<dt>Manuscript item</dt>
<dd>Table 1</dd>
<dt>Output</dt>
<dd><code>tables/[table_file].csv</code></dd>
<dt>Script</dt>
<dd><code>scripts/[script_name].R</code></dd>
<dt>Log</dt>
<dd><code>logs/[script_name].log</code></dd>
<dt>Notes</dt>
<dd>[Brief description.]</dd>
</dl>

### Appendix / Supplementary Figures And Tables

<dl>
<dt>Manuscript item</dt>
<dd>Figure A.1</dd>
<dt>Output</dt>
<dd><code>figures/[appendix_figure].pdf</code></dd>
<dt>Script</dt>
<dd><code>scripts/[script_name].R</code></dd>
<dt>Log</dt>
<dd><code>logs/[script_name].log</code></dd>
<dt>Notes</dt>
<dd>[Brief description.]</dd>
</dl>

<dl>
<dt>Manuscript item</dt>
<dd>Table A.1</dd>
<dt>Output</dt>
<dd><code>tables/[appendix_table].csv</code></dd>
<dt>Script</dt>
<dd><code>scripts/[script_name].R</code></dd>
<dt>Log</dt>
<dd><code>logs/[script_name].log</code></dd>
<dt>Notes</dt>
<dd>[Brief description.]</dd>
</dl>

## Recommended Citation

If you use or adapt the analysis code, please cite the replication data archive associated with the published article.

## Last Verified

- **[Month Year]**
