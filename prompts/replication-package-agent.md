# Replication Package Agent Prompt

Use this prompt when starting a new replication-package audit or repair task. Replace the bracketed fields before sending it to Codex, Claude Code, or another coding agent.

```text
Please prepare, audit, or repair this replication package using the Replication Package Guide instructions.

Before changing files, read both of the following in full:
1. The target journal's most up-to-date official replication-package instructions. Treat those current journal requirements as controlling when they conflict with the general replication guide.
2. The current AI Collaboration Guide at https://yhoriuchi.github.io/ai-collaboration-guide/. Treat it as the authoritative source for recording AI usage and maintaining project history.

Record both sources and their access dates. Then inspect the project and identify the public replication path.

Project context:
- Common research-project parent: [path]
- Cloud-sync service and restrictions: [Dropbox / Google Drive / iCloud / approved alternative and any prohibited data]
- Root project instructions: [path to AGENTS.md]
- Root project map: [path to README.md]
- Root project history: [path to project_history/]
- AI Collaboration Guide accessed on: [date]
- Manuscript repository: [path or not available]
- Private analysis repository: [path]
- Replication package root: [path]
- Paper source files: [path or not available]
- Manuscript-ready figures/tables: [path or not available]
- Source data available to the agent: [path or status]
- Restricted, proprietary, confidential, licensed, or non-redistributable data: [list or none known]
- Target archive, journal, or repository requirements: [requirements or none known]
- Official journal-instructions URL or files: [URL/path or target journal not yet selected]
- Journal instructions accessed on: [date]
- Preferred structure: [compact / build-analyze / agent should decide]

Required outcome:
1. Maintain one active project history at the common root and append a detailed entry after every substantive task.
2. Preserve substantive analysis choices unless a change is needed for reproducibility, logging, paths, or documentation.
3. Use relative paths from the public package root.
4. Create or repair one public entry point named master.R.
5. Create or repair one authoritative public-package README.md.
6. Add or repair one detailed log file for every public script.
7. Run the public replication path when feasible.
8. Record session_info.log from a successful full run.
9. Build a complete paper-order figure/table crosswalk.
10. Check paper-replication consistency when paper source files are available.
11. Document restricted data, manual steps, and remaining risks.
12. Generate and verify MANIFEST-SHA256.txt after the final run and cleanup.
13. Create the release ZIP, extract it into a new temporary directory, verify it, and run the extracted package without outside files.
14. Keep internal readiness reports outside the public package unless the journal requires them.
15. Return a readiness report summarizing what changed, what was verified, and what could not be verified.

Do not use absolute personal paths in public scripts, create competing README files within the same scope, silently delete raw data or manuscript source files, hide failed scripts or warnings, or treat previews as a substitute for a figure/table crosswalk.
```
