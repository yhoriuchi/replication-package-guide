# Master file
# Run from the project root after restarting R.
# This runs the public replication path. The build script is used only if
# the tiny template input is missing.

start_time <- Sys.time()
stopifnot(sink.number() == 0)

dir.create("build/output/analysis_ready", recursive = TRUE, showWarnings = FALSE)
dir.create("build/logs", recursive = TRUE, showWarnings = FALSE)
dir.create("analyze/figures", recursive = TRUE, showWarnings = FALSE)
dir.create("analyze/tables", recursive = TRUE, showWarnings = FALSE)
dir.create("analyze/output", recursive = TRUE, showWarnings = FALSE)
dir.create("analyze/logs", recursive = TRUE, showWarnings = FALSE)

safe_source <- function(file) {
  if (!file.exists(file)) stop("File not found: ", file)

  cat("\n============================================================\n")
  cat("Running:", file, "\n")
  cat("============================================================\n")

  source(file, echo = FALSE, print.eval = FALSE)
}

update_readme_environment <- function(readme = "README.md") {
  if (!file.exists(readme)) return(invisible(FALSE))

  session <- sessionInfo()
  r_version <- paste("R version", paste(R.version$major, R.version$minor, sep = "."))
  operating_system <- session$running

  if (length(operating_system) == 0 || is.na(operating_system[1]) || !nzchar(operating_system[1])) {
    sys <- Sys.info()
    operating_system <- paste(sys[["sysname"]], sys[["release"]])
  }

  environment_block <- c(
    "### Computing Environment",
    "",
    paste("Software:", r_version),
    paste("Platform:", session$platform),
    paste("Computer Operating System:", operating_system),
    ""
  )

  lines <- readLines(readme, warn = FALSE)
  existing <- which(grepl("^#{1,6} Computing Environment$", lines))

  if (length(existing) > 0) {
    start <- existing[1]
    following_heading <- which(seq_along(lines) > start & grepl("^#{1,6} ", lines))
    end <- if (length(following_heading) > 0) following_heading[1] - 1 else length(lines)
    before <- if (start > 1) lines[seq_len(start - 1)] else character()
    after <- if (end < length(lines)) lines[(end + 1):length(lines)] else character()
    lines <- c(before, environment_block, after)
  } else {
    session_heading <- which(grepl("^## .*Session Information$", lines))

    if (length(session_heading) > 0) {
      following_section <- which(seq_along(lines) > session_heading[1] & grepl("^## ", lines))
      insert_before <- if (length(following_section) > 0) following_section[1] else length(lines) + 1
      before <- if (insert_before > 1) lines[seq_len(insert_before - 1)] else character()
      after <- if (insert_before <= length(lines)) lines[insert_before:length(lines)] else character()

      if (length(before) > 0 && nzchar(tail(before, 1))) before <- c(before, "")
      lines <- c(before, environment_block, after)
    } else {
      if (length(lines) > 0 && nzchar(tail(lines, 1))) lines <- c(lines, "")

      lines <- c(
        lines,
        "## Session Information",
        "",
        "The file `session_info.log` records the R version, platform, loaded packages, and runtime from a successful full run.",
        "",
        environment_block
      )
    }
  }

  writeLines(lines, readme, useBytes = TRUE)
  invisible(TRUE)
}

required_input <- "build/output/analysis_ready/example_analysis_data.rds"

if (!file.exists(required_input)) {
  safe_source("build/scripts/01_build_analysis_ready_data.R")
}

scripts <- c(
  "analyze/scripts/00_list_inputs.R",
  "analyze/scripts/01_analyze_results.R",
  "analyze/scripts/02_make_figures_tables.R"
)

for (script in scripts) {
  safe_source(script)
}

end_time <- Sys.time()

while (sink.number() > 0) sink()

sink("session_info.log", split = FALSE)
cat("Run Time\n")
cat("Started: ", format(start_time, "%Y-%m-%d %H:%M:%S"), "\n", sep = "")
cat("Ended:   ", format(end_time, "%Y-%m-%d %H:%M:%S"), "\n", sep = "")
cat("Elapsed: ", format(end_time - start_time), "\n\n", sep = "")

cat("Session Information\n")
print(sessionInfo())
sink()

update_readme_environment("README.md")
