# Replication Package Agent Prompt

Use this prompt when starting a new replication-package audit or repair task. Replace the bracketed fields before giving it to any AI assistant.

```text
Please prepare, audit, or repair this replication package using the AI-Assisted Research Project Management and Replication Guide instructions.

Before changing files, read both of the following in full:
1. The target journal's most up-to-date official replication-package instructions. Treat those current journal requirements as controlling when they conflict with the general replication guide.
2. The current AI Collaboration Guide at https://yhoriuchi.github.io/ai-collaboration-guide/. Treat it as the authoritative source for recording AI usage and maintaining project history.

Record both sources and their access dates. Then inspect the project and identify the public replication path.

If the root already contains `AGENTS.md`, preserve it and append or carefully merge the new instructions. Never replace, overwrite, truncate, or discard an existing `AGENTS.md`. The analysis repository/root is named `analysis/` regardless of whether the project uses R, Python, Stata, Julia, MATLAB, or another toolchain.

Recommend placing the common root in an institutionally approved synchronized storage service when the project's rules permit it. Keep data out of Git and GitHub by default. Inspect `.gitignore`, tracked files, and staged files before committing or pushing. Add only deliberately approved, redistributable public replication data; prefer an appropriate release archive or data repository for large public data.

Promote transparency and reproducibility only within applicable law, regulation, consent, ethics/IRB requirements, privacy, confidentiality, security, contracts, licenses, data-use agreements, funder rules, and institutional policy. These obligations take priority over journal requirements and this guide. When disclosure is prohibited, document the restriction and reproducibility limit without revealing protected content. Stop and ask before transferring or disclosing material when governing requirements are unclear or conflict.

Project context:
- Common research-project parent: [path]
- Synchronized storage service and restrictions: [Dropbox / Google Drive / iCloud / SharePoint / Box / another approved service, or none; list any prohibited data]
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
1. Maintain one private active project history at the common root and append a detailed, task-specific entry after every substantive task. If you cannot write local files, return a concise record for the user to save there.
2. Preserve substantive analysis choices unless a change is needed for reproducibility, logging, paths, or documentation.
3. Use relative paths from the public package root.
4. Create or repair one software-appropriate public entry point; use master.R for an R project.
5. Create or repair one authoritative public-package README.md.
6. Add or repair one detailed log file for every public script.
7. Run the public replication path when feasible.
8. Record a software-environment file from a successful full run; use session_info.log for an R project.
9. Build a complete paper-order figure/table crosswalk.
10. Check paper-replication consistency when paper source files are available.
11. Document restricted data, manual steps, and remaining risks.
12. Generate and verify MANIFEST-SHA256.txt after the final run and cleanup.
13. Create the release ZIP, extract it into a new temporary directory, verify it, and run the extracted package without outside files.
14. Keep internal readiness reports outside the public package unless the journal requires them.
15. Return a readiness report summarizing what changed, what was verified, and what could not be verified.
16. Confirm that raw, received, restricted, licensed, confidential, working, and unapproved analysis-ready data are not tracked or staged in Git.
17. Confirm that the public package, logs, and project history contain no protected content prohibited by law, regulation, consent, ethics/IRB requirements, privacy, confidentiality, security, contract, license, data-use agreement, or institutional policy.

Do not use absolute personal paths in public scripts, create competing README files within the same scope, silently delete raw data or manuscript source files, hide failed scripts or warnings, or treat previews as a substitute for a figure/table crosswalk.
```
