# Replication Package Readiness Report

Use this template for the final report after preparing, auditing, or repairing a replication package.

## Metadata

- Project:
- Date checked:
- Agent or model:
- Workspace:
- Public package root:
- Paper source status:
- Target archive, journal, or repository:
- Chosen structure: compact / build-analyze / other

## Executive Summary

- Status: ready / ready with caveats / not ready
- Public entry point:
- README status:
- Script logs status:
- `session_info.log` status:
- Figure/table crosswalk status:
- Paper consistency status:
- Restricted-data status:

## Files Changed

- `[path/to/file]`: [what changed and why]

## Public Replication Run

- Command:

```r
source("master.R")
```

- Result:
- Start/end time:
- Outputs regenerated:
- Logs regenerated:
- Warnings or errors:

## README and Crosswalk Audit

- README has the required section order:
- Folder tree matches the package:
- Every manuscript figure/table is listed:
- Every appendix figure/table is listed:
- Every listed item has Output, Script, Log, LaTeX Label, and Notes:
- Conceptual, hand-made, or non-replicated items are explicitly marked:

## Data and Restriction Audit

- Public data sources documented:
- Restricted or non-redistributable sources documented:
- Public replacements documented:
- Licensed rebuild path documented:
- Public reproducibility limits documented:

## Paper Consistency Checks

- Paper source files inspected:
- Figure/table labels checked:
- Manuscript-ready file paths checked:
- In-text numerical claims checked:
- Mismatches found:
- Mismatches resolved:
- Mismatches remaining:

## Remaining Risks

- [Risk or unresolved item]

## Final Recommendation

[State whether the package is ready for public release, ready after specific fixes, or not ready.]
