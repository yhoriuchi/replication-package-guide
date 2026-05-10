source("analyze/functions/logging.R")
start_script_log("01_build_analysis_ready_data", log_dir = "build/logs")

tryCatch({
  dir.create("build/output/analysis_ready", recursive = TRUE, showWarnings = FALSE)

  analysis_data <- data.frame(
    id = 1:10,
    treatment = rep(c(0, 1), each = 5),
    outcome = c(2.0, 2.4, 2.2, 2.6, 2.5, 3.1, 3.4, 3.3, 3.5, 3.8)
  )

  cat("Rows in analysis-ready data:", nrow(analysis_data), "\n")
  cat("Columns in analysis-ready data:", ncol(analysis_data), "\n")

  saveRDS(analysis_data, "build/output/analysis_ready/example_analysis_data.rds")
}, error = function(e) {
  cat("\nERROR:", conditionMessage(e), "\n")
  stop(e)
}, finally = {
  end_script_log()
})
