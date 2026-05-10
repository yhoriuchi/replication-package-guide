source("analyze/functions/logging.R")
start_script_log("00_list_inputs")

tryCatch({
  dir.create("analyze/output", recursive = TRUE, showWarnings = FALSE)

  inputs <- list.files(
    "build/output/analysis_ready",
    full.names = TRUE,
    recursive = TRUE
  )

  inventory <- data.frame(
    file = inputs,
    size_bytes = file.info(inputs)$size,
    row.names = NULL
  )

  print(inventory)
  write.csv(inventory, "analyze/output/inputs_inventory.csv", row.names = FALSE)
}, error = function(e) {
  cat("\nERROR:", conditionMessage(e), "\n")
  stop(e)
}, finally = {
  end_script_log()
})
