source("analyze/functions/logging.R")
start_script_log("02_make_figures_tables")

tryCatch({
  dir.create("analyze/figures", recursive = TRUE, showWarnings = FALSE)
  dir.create("analyze/tables", recursive = TRUE, showWarnings = FALSE)

  analysis_data <- readRDS("build/output/analysis_ready/example_analysis_data.rds")
  results <- readRDS("analyze/output/model_results.rds")

  write.csv(results, "analyze/tables/example_results.csv", row.names = FALSE)

  png("analyze/figures/example_figure.png", width = 900, height = 600, res = 120)
  boxplot(
    outcome ~ treatment,
    data = analysis_data,
    names = c("Control", "Treatment"),
    xlab = "Group",
    ylab = "Outcome",
    main = "Example Figure"
  )
  dev.off()

  cat("Wrote table: analyze/tables/example_results.csv\n")
  cat("Wrote figure: analyze/figures/example_figure.png\n")
}, error = function(e) {
  cat("\nERROR:", conditionMessage(e), "\n")
  stop(e)
}, finally = {
  end_script_log()
})
