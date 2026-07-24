---
title: AI-Assisted Research Project Management and Replication Guide
---

<link rel="stylesheet" href="{{ '/assets/site.css' | relative_url }}?v={{ site.github.build_revision }}">

<main class="page-shell" markdown="1">

<section class="hero" markdown="1">

# AI-Assisted Research Project Management and Replication Guide

- **Author:** Yusaku Horiuchi
- **Affiliation:** Syde P. Deeb Eminent Scholar in Political Science, Florida State University
- **Created:** May 10, 2026
- **Last revised:** July 23, 2026

![Page views](https://hits.sh/yhoriuchi.github.io/replication-package-guide.svg?label=page%20views)

Use AI to organize a research project from Day 1 and to build its replication package before publication. You only need to choose the step that matches your project today.

</section>

<section class="steps-grid" aria-label="Two-step guide" markdown="1">

<article class="step-card" markdown="1">
<div class="step-number">Step 1</div>

## Set Up the Research Project

**When:** At the beginning of a project—or whenever an existing project needs a clear structure.

**Do one thing:** Open the project's common root folder in your AI assistant, click the button below, and paste the copied instruction.

The AI will inspect the folder, preserve existing work, and help establish the recommended project environment.

<button type="button" class="button button-primary copy-instruction" data-prompt="step-1-prompt">Copy Step 1 Instruction</button>
<span class="copy-status" aria-live="polite"></span>
</article>

<article class="step-card" markdown="1">
<div class="step-number">Step 2</div>

## Build the Replication Package

**When:** As soon as analyses begin producing results intended for the manuscript. Do not wait for acceptance or the submission deadline.

**Do one thing:** Open the same project root, click the button below, and paste the copied instruction into your AI assistant.

The AI will inspect the research workflow and help build, document, run, and validate the public replication package.

<button type="button" class="button button-primary copy-instruction" data-prompt="step-2-prompt">Copy Step 2 Instruction</button>
<span class="copy-status" aria-live="polite"></span>
</article>

</section>

## Two Guides, Two Jobs

- The [AI Collaboration Guide](https://yhoriuchi.github.io/ai-collaboration-guide/) provides the universal standard for recording substantive AI use in any kind of project and may install that convention in an AI tool's global instruction location.
- This guide applies that standard to research-project organization and replication-package preparation.

The AI—not the user—is expected to read and apply the detailed instructions. There is **one and only one research-guide [`AGENTS.md`](https://github.com/yhoriuchi/replication-package-guide/blob/main/AGENTS.md) for both steps**. Each button copies that same research-specific operational standard with a different short instruction in front: Step 1 activates project-setup mode, and Step 2 activates replication-package mode.

The universal/global instructions and the research-project instructions have different scopes; they are not competing files. Each research project maintains one canonical root `AGENTS.md`. If the AI Collaboration recording convention is already installed globally or present in the root file, the AI preserves it and merges only missing research-specific requirements without creating duplicate recording sections.

## Three Rules That Always Apply

1. **Preserve existing instructions.** Append or carefully merge into `AGENTS.md`; never replace, overwrite, truncate, or discard it.
2. **Use a software-neutral analysis repository.** Name it `analysis/`, whether the project uses R, Python, Stata, Julia, MATLAB, multiple languages, or another toolchain.
3. **Follow the journal.** During Step 2, the target journal's most up-to-date official requirements take priority over this general guide.

## What Happens in Step 1?

Step 1 creates one durable workspace for the whole research project:

```text
Research-Project/
|-- AGENTS.md                  # shared instructions
|-- README.md                  # private project map
|-- manuscript/                # Git repository 1
|-- analysis/                  # Git repository 2
|-- project_history/
|   `-- Person_Name/
|       `-- YYYY-MM-DD by Agent.md
`-- others/                    # optional
```

### The AI inspects before organizing

The AI first identifies existing files, repositories, instructions, data locations, and synchronization arrangements. It does not silently delete, move, or overwrite substantive work.

### The AI preserves the instruction history

If `AGENTS.md` already exists, the AI appends or carefully merges the new instructions. It never replaces, overwrites, truncates, or discards the existing file. The resulting root file governs both repositories and records project-specific boundaries, data restrictions, synchronization rules, and output-promotion procedures.

### The AI separates synchronization from Git

The common root may live in Dropbox, Google Drive, iCloud, SharePoint, Box, or another institutionally approved synchronized location. Git versions files inside `manuscript/` and `analysis/`; the synchronized parent is not normally a third Git repository. Restricted data stay outside Git and outside any storage service prohibited by consent, license, IRB, data-use agreement, or institutional policy.

### The AI establishes one project history

The AI follows the current [AI Collaboration Guide](https://yhoriuchi.github.io/ai-collaboration-guide/) and maintains one private `project_history/` at the common root. It records substantive AI work, exact available model/runtime metadata, files and sources used, changes, verification, limitations, and unresolved questions.

### The two repositories have different jobs

- `manuscript/` contains compilation-relevant paper and supplement sources and may connect to Overleaf through GitHub.
- `analysis/` contains the software-neutral research workflow: data construction, analysis, validation, generated results, codebooks, and future public-package staging.

Generated figures and tables move from `analysis/` to `manuscript/` through a documented promotion step.

## What Happens in Step 2?

Step 2 begins while the paper is still being developed, once analyses produce results intended for the manuscript.

### The AI reads the controlling requirements

Before changing the package, the AI reads:

1. the root `AGENTS.md` and `README.md`;
2. the current AI Collaboration Guide; and
3. the target journal's most up-to-date official replication-package, data, code, disclosure, archive, and file-format instructions.

The journal's current requirements control when they conflict with this general guide.

### The AI identifies four distinct artifacts

The AI keeps the private research workspace, manuscript repository, public replication package, and journal production/submission files conceptually and physically distinct.

### The AI builds the public replication path

Depending on project complexity, the AI uses a compact package or separates data building from analysis. The public package should have:

- one software-appropriate entry point;
- one authoritative `README.md`;
- relative paths;
- one detailed log per public script;
- a software-environment record;
- analysis-ready public data and codebooks when legally permitted;
- clear restricted-data documentation; and
- a paper-order crosswalk connecting every figure and table to output, code, and logs.

R projects may use `master.R` and `session_info.log`; Python, Stata, Julia, MATLAB, mixed-language, and other projects use equivalent entry points and environment records.

### Two ways to structure `analysis/`

Use the **compact structure** for small or medium projects when public data can be included directly, data preparation and analysis are closely connected, and the complete workflow can run end to end:

```text
analysis/
|-- README.md
|-- master.R                  # or equivalent entry point
|-- data/
|-- documents/
|-- scripts/
|-- functions/
|-- figures/
|-- tables/
|-- output/
`-- logs/
```

Use the **build/analyze structure** when data construction is long or conceptually separate, inputs are restricted or licensed, or the public package should begin with analysis-ready data:

```text
analysis/
|-- README.md
|-- master.R                  # or equivalent entry point
|-- build/
|   |-- data/
|   |-- documents/
|   |-- scripts/
|   |-- output/
|   |   `-- analysis_ready/
|   `-- logs/
`-- analyze/
    |-- scripts/
    |-- functions/
    |-- figures/
    |-- tables/
    |-- output/
    `-- logs/
```

When uncertain, use the compact structure. Choose build/analyze only when the data-building stage creates real complexity, access restrictions, or a meaningful boundary for users.

### The AI checks the paper against the package

When manuscript source is available, the AI traces figures, tables, labels, estimates, uncertainty measures, sample sizes, dates, percentages, significance statements, and appendix results back to scripts, logs, and generated outputs.

### The AI validates the release

The AI runs every authorized public path from a clean session, records warnings and limitations, generates `MANIFEST-SHA256.txt`, creates the release archive, extracts it into a new temporary directory, verifies its checksums, and runs it without relying on files outside the archive.

### The researcher uses ReproAI before submission

This guide is an authoring and project-management framework. [ReproAI](https://reproai.org/), developed by Yiqing Xu and Leo Yang Yang, is a complementary author-facing diagnostic tool for checking an existing replication package, venue compliance, and common reproducibility problems. After preparing and validating the package with this guide, the researcher should run ReproAI as a final pre-submission check and resolve any additional issues it identifies.

The final readiness report states whether the package is ready, ready with caveats, or not ready—and identifies exactly what still needs the researcher's attention.

## Templates

- [Private project-root README](https://github.com/yhoriuchi/replication-package-guide/blob/main/templates/PROJECT_ROOT_README_TEMPLATE.md)
- [Public replication-package README](https://github.com/yhoriuchi/replication-package-guide/blob/main/templates/README_TEMPLATE.md)
- [Compact package structure](https://github.com/yhoriuchi/replication-package-guide/tree/main/templates/compact)
- [Build/analyze package structure](https://github.com/yhoriuchi/replication-package-guide/tree/main/templates/build-analyze)
- [Release-readiness report](https://github.com/yhoriuchi/replication-package-guide/blob/main/templates/release-readiness-report.md)

<script id="agent-instructions-text" type="text/plain">{% include_relative AGENTS.md %}</script>

<script id="step-1-prompt" type="text/plain">
Please complete Step 1 of the AI-Assisted Research Project Management and Replication Guide: set up or organize this research project.

First inspect the current folder and preserve all existing work. Create AGENTS.md only if it does not exist. If it exists, append or carefully merge the shared instructions below; never replace, overwrite, truncate, or discard existing instructions. Resolve conflicts explicitly and avoid duplicate sections.

Help me establish one common research-project root with:
- a private root README.md that maps the project;
- manuscript/ as Git repository 1;
- analysis/ as the software-neutral Git repository 2;
- one root project_history/ following the current AI Collaboration Guide; and
- optional others/ for non-core materials.

Check before initializing or changing Git repositories. Do not reorganize or delete substantive files until you understand their roles. Identify storage restrictions and keep restricted data outside Git and any prohibited synchronization service. Do not begin the full replication-package build unless I request Step 2.

At the end, explain what you created or changed, what you preserved, what still needs my decision, and where future AI-use history will be recorded.
</script>

<script id="step-2-prompt" type="text/plain">
Please complete Step 2 of the AI-Assisted Research Project Management and Replication Guide: begin or continue building this project's replication package.

Before changing files:
1. Read the root AGENTS.md and README.md in full.
2. Read the current AI Collaboration Guide at https://yhoriuchi.github.io/ai-collaboration-guide/ and record its access date.
3. Find or ask me for the target journal, then read its most up-to-date official replication-package, data, code, disclosure, archive, and file-format requirements in full. Record the official source and access date. Current journal requirements take priority.
4. Inspect the manuscript and analysis repositories and identify the private research workspace, manuscript files, public replication-package staging area, and journal submission files.

Start this work before acceptance. Preserve substantive analysis choices unless a documented correction is necessary. Build a software-appropriate public workflow with one entry point, one authoritative package README, one detailed log per public script, an environment record, a complete paper-order figure/table crosswalk, restricted-data documentation, and relative paths. Run all authorized public paths, generate and verify the final SHA-256 manifest, and test an extracted release archive without outside files.

After the package passes these checks, recommend that I run ReproAI at https://reproai.org/ as a complementary final pre-submission diagnostic and help me address any issues it reports.

At the end, return a readiness report stating exactly what changed, what ran successfully, what could not be verified, and what still requires my attention.
</script>

<script>
(function () {
  var instructions = document.getElementById("agent-instructions-text");
  var buttons = document.querySelectorAll(".copy-instruction");

  if (!instructions || !buttons.length) {
    return;
  }

  function fallbackCopy(text) {
    var textarea = document.createElement("textarea");
    textarea.value = text;
    textarea.setAttribute("readonly", "");
    textarea.style.position = "fixed";
    textarea.style.top = "-9999px";
    document.body.appendChild(textarea);
    textarea.select();
    document.execCommand("copy");
    document.body.removeChild(textarea);
  }

  function setStatus(button, message) {
    var status = button.nextElementSibling;
    if (!status) {
      return;
    }
    status.textContent = message;
    window.clearTimeout(status.copyTimeout);
    status.copyTimeout = window.setTimeout(function () {
      status.textContent = "";
    }, 2400);
  }

  Array.prototype.forEach.call(buttons, function (button) {
    button.addEventListener("click", function () {
      var prompt = document.getElementById(button.getAttribute("data-prompt"));
      var text = prompt.textContent.trim() +
        "\n\n--- Shared project and replication instructions ---\n\n" +
        instructions.textContent.trim();

      if (navigator.clipboard && window.isSecureContext) {
        navigator.clipboard.writeText(text).then(function () {
          setStatus(button, "Copied");
        }).catch(function () {
          fallbackCopy(text);
          setStatus(button, "Copied");
        });
        return;
      }

      fallbackCopy(text);
      setStatus(button, "Copied");
    });
  });
})();
</script>

</main>
