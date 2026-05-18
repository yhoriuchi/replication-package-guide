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

Update this crosswalk so every manuscript and appendix figure/table has an output file, script, and log. Embedded previews are optional. Use description-list entries instead of a wide table so long output paths remain readable.

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
<dd><code>figures/example_figure.png</code></dd>
<dt>Script</dt>
<dd><code>scripts/03_make_figures_tables.R</code></dd>
<dt>Log</dt>
<dd><code>logs/03_make_figures_tables.log</code></dd>
<dt>Notes</dt>
<dd>Example figure.</dd>
</dl>

<dl>
<dt>Manuscript item</dt>
<dd>Table 1</dd>
<dt>Output</dt>
<dd><code>tables/example_results.csv</code></dd>
<dt>Script</dt>
<dd><code>scripts/03_make_figures_tables.R</code></dd>
<dt>Log</dt>
<dd><code>logs/03_make_figures_tables.log</code></dd>
<dt>Notes</dt>
<dd>Example table.</dd>
</dl>

### Appendix / Supplementary Figures And Tables

<dl>
<dt>Manuscript item</dt>
<dd>Figure A.1</dd>
<dt>Output</dt>
<dd><code>[path/to/output]</code></dd>
<dt>Script</dt>
<dd><code>[path/to/script.R]</code></dd>
<dt>Log</dt>
<dd><code>[path/to/log.log]</code></dd>
<dt>Notes</dt>
<dd>Replace or delete this entry.</dd>
</dl>

## Recommended Citation

If you use or adapt the analysis code, please cite the replication data archive associated with the published article.

## Last Verified

Replace with the date of the last successful full run.
