# Templates

This folder contains lightweight starter structures, not full replication packages.

- `README_TEMPLATE.md`: copy this to an existing project root as `README.md`, then replace placeholders and delete the unused folder-tree option.
- `release-readiness-report.md`: use this for the final report after an agent prepares, audits, or repairs a package.
- `compact/`: use for smaller projects where data, analysis scripts, figures, and tables can live in one project root.
- `build-analyze/`: use for larger projects where data construction should be separated from the public analysis workflow.

Each structure template includes example `.Rproj`, `.gitignore`, `README.md`, `master.R`, script stubs, logging helpers, and placeholder folders tracked with `.gitkeep` files.

To test either template, open the template folder as the project root and run:

```r
source("master.R")
```

Generated logs, figures, tables, output objects, and `session_info.log` are ignored by Git in this template repository.
