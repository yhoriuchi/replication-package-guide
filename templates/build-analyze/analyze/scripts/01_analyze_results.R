source("analyze/functions/logging.R")
start_script_log("01_analyze_results")

tryCatch({
  dir.create("analyze/output", recursive = TRUE, showWarnings = FALSE)

  analysis_data <- readRDS("build/output/analysis_ready/example_analysis_data.rds")
  fit <- lm(outcome ~ treatment, data = analysis_data)
  summary_fit <- summary(fit)

  cat("Sample size:", nobs(fit), "\n")
  cat("\nModel summary:\n")
  print(summary_fit)

  results <- data.frame(
    term = rownames(coef(summary_fit)),
    estimate = coef(summary_fit)[, "Estimate"],
    std_error = coef(summary_fit)[, "Std. Error"],
    p_value = coef(summary_fit)[, "Pr(>|t|)"],
    row.names = NULL
  )

  saveRDS(results, "analyze/output/model_results.rds")
}, error = function(e) {
  cat("\nERROR:", conditionMessage(e), "\n")
  stop(e)
}, finally = {
  end_script_log()
})
