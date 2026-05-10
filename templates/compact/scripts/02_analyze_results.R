source("functions/logging.R")
start_script_log("02_analyze_results")

tryCatch({
  dir.create("output", recursive = TRUE, showWarnings = FALSE)

  analysis_data <- readRDS("output/analysis_data.rds")
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

  saveRDS(results, "output/model_results.rds")
}, error = function(e) {
  cat("\nERROR:", conditionMessage(e), "\n")
  stop(e)
}, finally = {
  end_script_log()
})
