# Replication Package Agent Prompt

Use this prompt when starting a new replication-package audit or repair task. Replace the bracketed fields before sending it to Codex, Claude Code, or another coding agent.

```text
Please prepare, audit, or repair this replication package using the Replication Package Guide instructions.

Before changing files, inspect the project and identify the public replication path.

Project context:
- Replication package root: [path]
- Paper source files: [path or not available]
- Manuscript-ready figures/tables: [path or not available]
- Source data available to the agent: [path or status]
- Restricted, proprietary, confidential, licensed, or non-redistributable data: [list or none known]
- Target archive, journal, or repository requirements: [requirements or none known]
- Preferred structure: [compact / build-analyze / agent should decide]

Required outcome:
1. Preserve substantive analysis choices unless a change is needed for reproducibility, logging, paths, or documentation.
2. Use relative paths from the project root.
3. Create or repair one public entry point named master.R.
4. Create or repair one authoritative README.md.
5. Add or repair one log file for every public script.
6. Run the public replication path when feasible.
7. Record session_info.log from a successful full run.
8. Build a complete paper-order figure/table crosswalk.
9. Check paper-replication consistency when paper source files are available.
10. Document restricted data, manual steps, and remaining risks.
11. Return a readiness report summarizing what changed, what was verified, and what could not be verified.

Do not use absolute personal paths, create competing README files, silently delete raw data or manuscript source files, hide failed scripts or warnings, or treat previews as a substitute for a figure/table crosswalk.
```
