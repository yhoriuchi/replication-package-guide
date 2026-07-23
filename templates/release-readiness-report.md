# Replication Package Readiness Report

Use this template for the final report after preparing, auditing, or repairing a replication package.

## Metadata

- Project:
- Date checked:
- Agent or model:
- Workspace:
- Cloud-sync service and restrictions:
- Root `AGENTS.md`:
- Root project `README.md`:
- Root `project_history/`:
- Manuscript repository:
- Private analysis repository:
- Public package root:
- Paper source status:
- Target archive, journal, or repository:
- Official journal-instructions source:
- Journal instructions accessed:
- Journal-specific requirements:
- Chosen structure: compact / build-analyze / other
- Manuscript repository branch/commit/status:
- Analysis repository branch/commit/status:
- Project-history entry updated:
- AI Collaboration Guide URL/access date recorded:

## Executive Summary

- Status: ready / ready with caveats / not ready
- Public entry point:
- README status:
- Script logs status:
- `session_info.log` status:
- Figure/table crosswalk status:
- Paper consistency status:
- Restricted-data status:
- Manifest status:
- Extracted-archive run status:

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

## Source Reconstruction and Data Validation

- Optional reconstruction paths run:
- Authorized raw-data build run:
- Rebuilt/public data checksum comparison:
- Codebook variable coverage:
- Names, order, types, coding, and ranges checked:
- Identifier and sensitive-field screen:

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

## Numerical and Visual Output Validation

- Every manuscript/package table compared numerically:
- Every manuscript/package figure compared visually or pixel by pixel:
- Complete manuscript compiled:
- Complete manuscript visually inspected:

## Release Archive and Manifest

- Final cleanup completed:
- `MANIFEST-SHA256.txt` regenerated:
- Manifest coverage:
- Manifest verification:
- ZIP path:
- ZIP checksum:
- ZIP file size and date:
- Extracted into a new temporary directory:
- Extracted manifest verification:
- Extracted package run without outside files:

## Dataverse Metadata Check

- Only the final verified archive selected:
- Dataverse file path left blank for the self-contained ZIP:
- Reviewer-facing description added:
- Template help text removed:
- Article DOI omitted unless issued:
- Related-publication identifiers checked:
- Authors, ORCIDs, affiliations, contact, description, subject, license, and deposit date checked:
- Saved public metadata display checked before review submission:

## Remaining Risks

- [Risk or unresolved item]

## Final Recommendation

[State whether the package is ready for public release, ready after specific fixes, or not ready.]
