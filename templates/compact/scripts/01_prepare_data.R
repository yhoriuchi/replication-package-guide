source("functions/logging.R")
start_script_log("01_prepare_data")

tryCatch({
  dir.create("output", recursive = TRUE, showWarnings = FALSE)

  analysis_data <- data.frame(
    id = 1:10,
    treatment = rep(c(0, 1), each = 5),
    outcome = c(2.0, 2.4, 2.2, 2.6, 2.5, 3.1, 3.4, 3.3, 3.5, 3.8)
  )

  cat("Rows in analysis data:", nrow(analysis_data), "\n")
  cat("Columns in analysis data:", ncol(analysis_data), "\n")

  saveRDS(analysis_data, "output/analysis_data.rds")
}, error = function(e) {
  cat("\nERROR:", conditionMessage(e), "\n")
  stop(e)
}, finally = {
  end_script_log()
})
