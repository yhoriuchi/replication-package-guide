source("functions/logging.R")
start_script_log("03_make_figures_tables")

tryCatch({
  dir.create("figures", recursive = TRUE, showWarnings = FALSE)
  dir.create("tables", recursive = TRUE, showWarnings = FALSE)

  analysis_data <- readRDS("output/analysis_data.rds")
  results <- readRDS("output/model_results.rds")

  write.csv(results, "tables/example_results.csv", row.names = FALSE)

  png("figures/example_figure.png", width = 900, height = 600, res = 120)
  boxplot(
    outcome ~ treatment,
    data = analysis_data,
    names = c("Control", "Treatment"),
    xlab = "Group",
    ylab = "Outcome",
    main = "Example Figure"
  )
  dev.off()

  cat("Wrote table: tables/example_results.csv\n")
  cat("Wrote figure: figures/example_figure.png\n")
}, error = function(e) {
  cat("\nERROR:", conditionMessage(e), "\n")
  stop(e)
}, finally = {
  end_script_log()
})
