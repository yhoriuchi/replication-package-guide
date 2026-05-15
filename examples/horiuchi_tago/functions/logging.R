start_script_log <- function(script_name, log_dir = "logs") {
  dir.create(log_dir, recursive = TRUE, showWarnings = FALSE)
  log_file <- file.path(log_dir, paste0(script_name, ".log"))

  assign(".script_log_sink_level", sink.number(), envir = .GlobalEnv)
  sink(log_file, split = TRUE)

  cat("############################################################\n")
  cat("Script:", paste0(script_name, ".R"), "\n")
  cat("Started:", format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z"), "\n")
  cat("############################################################\n\n")

  invisible(log_file)
}

end_script_log <- function() {
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

  target_level <- if (exists(".script_log_sink_level", envir = .GlobalEnv)) {
    get(".script_log_sink_level", envir = .GlobalEnv)
  } else {
    0
  }

  while (sink.number() > target_level) sink()

  if (exists(".script_log_sink_level", envir = .GlobalEnv)) {
    rm(".script_log_sink_level", envir = .GlobalEnv)
  }
}

run_logged_script <- function(expr) {
  tryCatch(
    withCallingHandlers(
      eval.parent(substitute(expr)),
      warning = function(w) {
        cat("\nWARNING:", conditionMessage(w), "\n")
        invokeRestart("muffleWarning")
      }
    ),
    error = function(e) {
      cat("\nERROR:", conditionMessage(e), "\n")
      stop(e)
    },
    finally = {
      end_script_log()
    }
  )
}
