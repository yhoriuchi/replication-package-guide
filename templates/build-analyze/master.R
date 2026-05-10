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
