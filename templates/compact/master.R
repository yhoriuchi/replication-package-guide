# Master file
# Run from the project root after restarting R.

start_time <- Sys.time()
stopifnot(sink.number() == 0)

dir.create("figures", recursive = TRUE, showWarnings = FALSE)
dir.create("tables", recursive = TRUE, showWarnings = FALSE)
dir.create("output", recursive = TRUE, showWarnings = FALSE)
dir.create("logs", recursive = TRUE, showWarnings = FALSE)

safe_source <- function(file) {
  if (!file.exists(file)) stop("File not found: ", file)

  cat("\n============================================================\n")
  cat("Running:", file, "\n")
  cat("============================================================\n")

  source(file, echo = FALSE, print.eval = FALSE)
}

scripts <- c(
  "scripts/01_prepare_data.R",
  "scripts/02_analyze_results.R",
  "scripts/03_make_figures_tables.R"
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
