# Horiuchi-Tago (Evacuation from Afghanistan)
# Master file
# Run from the replication package root after restarting R.

start_time <- Sys.time()
stopifnot(sink.number() == 0)

required_dirs <- c("logs", "output", "figures")
for (dir in required_dirs) {
  dir.create(dir, recursive = TRUE, showWarnings = FALSE)
}

safe_source <- function(file) {
  if (!file.exists(file)) stop("File not found: ", file)

  cat("\n============================================================\n")
  cat("Running:", file, "\n")
  cat("============================================================\n")

  source(file, echo = FALSE, print.eval = FALSE)
}

scripts <- c(
  "scripts/step01_read_data.R",
  "scripts/step02_check_manipulation.R",
  "scripts/step03_check_quotas.R",
  "scripts/step04_test_hypotheses.R"
)

for (script in scripts) {
  safe_source(script)
}

end_time <- Sys.time()

while (sink.number() > 0) sink()

sink("session_info.log", split = FALSE)
cat("Run Time\n")
cat("Started: ", format(start_time, "%Y-%m-%d %H:%M:%S %Z"), "\n", sep = "")
cat("Ended:   ", format(end_time, "%Y-%m-%d %H:%M:%S %Z"), "\n", sep = "")
cat("Elapsed: ", format(end_time - start_time), "\n\n", sep = "")

cat("Scripts Run\n")
for (script in scripts) {
  cat("- ", script, "\n", sep = "")
}
cat("\n")

cat("Session Information\n")
print(sessionInfo())
sink()
