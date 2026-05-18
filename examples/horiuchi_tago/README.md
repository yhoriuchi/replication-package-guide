# Replication Package

## Description

This replication package reproduces the main survey-experiment results for:

**Civilian Control and Casualty Sensitivity in a Pacifist Democracy: Evidence from Japan's 2021 Exigent Evacuation Mission**

Authors: Yusaku Horiuchi and Atsushi Tago

The package uses a Qualtrics survey file and quota-reference files to rebuild the analysis-ready data, check manipulation and quota diagnostics, estimate the main regression models, and generate the figures and regression outputs used to support the manuscript.

## How To Run

1. Open R in the replication package root.
2. Restart R so no objects or sinks are left from a prior session.
3. Run:

```r
source("master.R")
```

The master script runs the public scripts in this order:

- **Step 1**
  - Script: `scripts/step01_read_data.R`
  - Purpose: reads and wrangles the Qualtrics survey data.
  - Log: `logs/step01_read_data.log`

- **Step 2**
  - Script: `scripts/step02_check_manipulation.R`
  - Purpose: reports survey timing, missingness, attention checks, and manipulation checks.
  - Log: `logs/step02_check_manipulation.log`

- **Step 3**
  - Script: `scripts/step03_check_quotas.R`
  - Purpose: compares sample demographics to quota/population benchmarks.
  - Log: `logs/step03_check_quotas.log`

- **Step 4**
  - Script: `scripts/step04_test_hypotheses.R`
  - Purpose: estimates regression models and creates the support bar charts.
  - Log: `logs/step04_test_hypotheses.log`

After a successful run, `master.R` writes `session_info.log`.

## Folder Tree

```text
r/
|-- README.md
|-- .gitignore
|-- master.R
|-- R.Rproj
|-- session_info.log
|
|-- data/
|   |-- HHT+-+Evacuation+from+Afghanistan+-+Civilian+Control+&+Casualty+Sensitivity_August+31,+2021_06.18.csv
|   `-- quota_calculation/
|
|-- documents/
|   |-- HHT_-_Evacuation_from_Afghanistan_-_Civilian_Control__Casualty_Sensitivity.docx
|   |-- HHT_-_Evacuation_from_Afghanistan_-_Civilian_Control__Casualty_Sensitivity.pdf
|   `-- quota_calculation/
|
|-- scripts/
|   |-- step01_read_data.R
|   |-- step02_check_manipulation.R
|   |-- step03_check_quotas.R
|   `-- step04_test_hypotheses.R
|
|-- functions/
|   |-- logging.R
|   `-- read_Qualtrics.R
|
|-- figures/
|   `-- generated figures
|
|-- output/
|   `-- generated analysis objects and tables
|
`-- logs/
    `-- one log per public script
```

## Files Included In This Package

- **`master.R`**
  Public entry point for the full replication run.

- **`README.md`**
  One authoritative documentation file.

- **`R.Rproj`**
  RStudio project file.

- **`.gitignore`**
  Git ignore rules for local/session files and machine-specific caches.

- **`data/`**
  Public survey input data and quota-comparison files.

- **`documents/`**
  Survey questionnaire files and quota-calculation documentation.

- **`scripts/`**
  Numbered public scripts that prepare data, run diagnostics, check quotas, and estimate the reported models.

- **`functions/`**
  Shared helper functions for logging and Qualtrics import.

- **`figures/` and `output/`**
  Generated figures, regression outputs, and reproducible intermediate files.

- **`logs/` and `session_info.log`**
  Per-script logs and full-run session information.

## Data Sources And Restrictions

- **Main survey input**
  - Location: `data/HHT+-+Evacuation+from+Afghanistan+-+Civilian+Control+&+Casualty+Sensitivity_August+31,+2021_06.18.csv`
  - Redistributable: Yes
  - Notes: Qualtrics survey export used to rebuild the analysis-ready data.

- **Quota-comparison input**
  - Location: `data/quota_calculation/quotas (Afghanistan).xlsx`
  - Redistributable: Yes
  - Notes: quota workbook used for sample-population comparisons.

- **Additional quota-calculation files**
  - Location:
    - `data/quota_calculation/original and modified sheets/`
    - `documents/quota_calculation/`
  - Redistributable: Yes
  - Notes: source and supporting files for quota calculations.

- **Survey questionnaire**
  - Location:
    - `documents/HHT_-_Evacuation_from_Afghanistan_-_Civilian_Control__Casualty_Sensitivity.docx`
    - `documents/HHT_-_Evacuation_from_Afghanistan_-_Civilian_Control__Casualty_Sensitivity.pdf`
  - Redistributable: Yes
  - Notes: questionnaire files documenting the survey instrument.

No restricted or omitted data source is required to reproduce the public results in this package. Files in `data/` should be treated as read-only inputs. Files in `output/`, `figures/`, `logs/`, and `session_info.log` are generated or refreshed by the replication workflow.

## Analysis Stage

The figure and table outputs used by the paper are listed in `Figures And Tables`. The main generated analysis file that is not itself a manuscript figure or table is:

- **Analysis-ready survey data**
  - Output: `output/wrangled_data.rds`
  - Script: `scripts/step01_read_data.R`
  - Log: `logs/step01_read_data.log`
  - Notes: cleaned survey data used by the later diagnostic and hypothesis-testing scripts.

## Paper Source And Consistency Checks

The manuscript source files in the parent Overleaf directory were checked while preparing this README. The public archive can be run without those manuscript source files.

The consistency check confirmed:

- every manuscript and appendix figure/table reproduced by this package appears in `Figures And Tables`;
- manuscript-ready figures are traced to the corresponding generated figures, scripts, and logs;
- manuscript-ready tables that were separately formatted in LaTeX are traced to generated outputs or logs;
- reported Study 2 manipulation checks, quota diagnostics, regression estimates, and support-by-condition figures are traceable to public scripts and logs.

Scope note: this package reproduces the Study 2 survey-experiment results reported in the manuscript and supporting information. The manuscript and supporting information also mention contextual facts that are not generated by the replication scripts, including Afghanistan evacuation mission statistics, the Study 1 fielding date and sample size, and preregistration text describing analyses not reported in this manuscript. These items are included in the paper for background or documentation, but they are outside the public Study 2 replication path.

## Figures And Tables

### Manuscript

#### Figure 1

- Output:
  - `figures/barchart1.pdf`
- Script:
  - `scripts/step04_test_hypotheses.R`
- Log:
  - `logs/step04_test_hypotheses.log`
- LaTeX Label:
  - `fig:h1bar`
- Notes: included in the manuscript through `figures_tex/barchart1.tex`.

#### Table 1

- Output:
  - `output/regression_table.tex`
  - `output/regression_table.txt`
- Script:
  - `scripts/step04_test_hypotheses.R`
- Log:
  - `logs/step04_test_hypotheses.log`
- LaTeX Label:
  - `tb:regression`
- Notes: the manuscript uses a separately formatted LaTeX table in the paper source. The generated outputs reproduce the regression estimates.

#### Figure 2

- Output:
  - `figures/barchart2.pdf`
- Script:
  - `scripts/step04_test_hypotheses.R`
- Log:
  - `logs/step04_test_hypotheses.log`
- LaTeX Label:
  - `fig:h2bar`
- Notes: included in the manuscript through `figures_tex/barchart2.tex`.

### Appendix

#### Table A.1

- Output:
  - values reported in `logs/step02_check_manipulation.log`
- Script:
  - `scripts/step02_check_manipulation.R`
- Log:
  - `logs/step02_check_manipulation.log`
- LaTeX Label:
  - `tb:manipulation`
- Notes: the manuscript source contains a separately formatted LaTeX table. The public script prints the underlying counts and percentages.

#### Figure A.1

- Output:
  - `figures/population_vs_sample.pdf`
- Script:
  - `scripts/step03_check_quotas.R`
- Log:
  - `logs/step03_check_quotas.log`
- LaTeX Label:
  - `fig:comparison2`
- Notes: included in the supporting information through `appendix_other_results.tex`.

## Software Requirements

This package was verified on May 14, 2026 with R 4.6.0 on macOS. Package versions from the successful run are recorded in `session_info.log`.

Required R packages:

```r
install.packages(c(
  "tidyverse",
  "readxl",
  "ggthemes",
  "ggrepel",
  "estimatr",
  "cowplot",
  "modelsummary",
  "patchwork"
))
```

## Session Information

Every public script writes a matching log file in `logs/`. Each log records the script name, start time, end time, key row counts or analysis diagnostics, generated files, and warnings captured during the run.

The file `session_info.log` records the full-run start time, end time, elapsed time, scripts run, R version, platform, attached packages, and loaded namespaces.

The master script updates the software, platform, and operating-system lines below after a successful full run.

### Computing Environment

Software: R version 4.6.0
Platform: x86_64-apple-darwin20
Computer Operating System: macOS Tahoe 26.4

## Recommended Citation

If you use or adapt the analysis code, please cite the replication data archive associated with the published article.

## Last Verified

Verified on May 14, 2026 by running:

```r
source("master.R")
```

from the replication package root. The run completed successfully and regenerated the analysis-ready file and the paper outputs listed above.
