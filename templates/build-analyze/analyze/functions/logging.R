start_script_log <- function(script_name, log_dir = "analyze/logs", inputs = character()) {
  dir.create(log_dir, recursive = TRUE, showWarnings = FALSE)
  log_file <- file.path(log_dir, paste0(script_name, ".log"))

  sink(log_file, split = TRUE)

  cat("############################################################\n")
  cat("Script:", paste0(script_name, ".R"), "\n")
  cat("Started:", format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z"), "\n")
  cat("Inputs:\n")
  if (length(inputs) == 0) {
    cat("  None declared\n")
  } else {
    for (input in inputs) cat(" ", input, "\n")
  }
  cat("############################################################\n\n")

  invisible(log_file)
}

end_script_log <- function(outputs = character()) {
  cat("\n--- outputs ---\n")
  if (length(outputs) == 0) {
    cat("None declared\n")
  } else {
    for (output in outputs) {
      size <- if (file.exists(output)) file.info(output)$size else NA_real_
      cat(output, "| bytes:", if (is.na(size)) "missing" else size, "\n")
    }
  }
  cat("\n############################################################\n")
  cat("Ended:", format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z"), "\n")
  cat("############################################################\n")

  cat("\n--- warnings() at end of script ---\n")
  w <- warnings()
  if (is.null(w) || length(w) == 0) {
    cat("None\n")
  } else {
    print(w)
  }

  while (sink.number() > 0) sink()
}
