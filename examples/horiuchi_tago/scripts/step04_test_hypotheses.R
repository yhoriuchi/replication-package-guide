# Horiuchi-Tago (Evacuation from Afghanistan)
# Step 04: Test hypotheses

source("functions/logging.R")
start_script_log("step04_test_hypotheses")

run_logged_script({
  # Initial settings --------------------------------------------------------

  library(tidyverse)
  library(ggthemes)
  library(estimatr)
  library(cowplot)
  library(modelsummary)

  fig_h <- 8.5
  fig_w <- 10

  # Load data ---------------------------------------------------------------

  df <- read_rds("output/wrangled_data.rds")
  cat("Rows in loaded data:", nrow(df), "\n")

  # Save regression results as a table --------------------------------------

  save_regTable <- function(.extension) {
    df_num <- df |>
      mutate(outcome = ifelse(outcome == "作戦は失敗し、１台を除いて無事に空港まで護送することができませんでした", 0, 1))

    out1 <- lm_robust(y2 ~ who + outcome + casualty, df_num)
    out2 <- lm_robust(y2 ~ who + casualty * outcome, df_num)
    out3 <- lm_robust(y2 ~ who * casualty + outcome * casualty, df_num)
    out4 <- lm_robust(y2 ~ who * casualty * outcome, df_num)

    modelsummary(list(out1, out2),
      stars = c(
        "*" = .05,
        "**" = .01
      ),
      gof_omit = "DF|Deviance|AIC|BIC",
      coef_rename = c(
        "who" = "SDF decision",
        "outcome" = "Successful outcome",
        "casualty" = "With casualty",
        "casualty:outcome" = "With casualty x Successful outcome"
      ),
      aligh = "lrr",
      output = str_c("output/regression_table.", .extension)
    )

    cat("Saved:", str_c("output/regression_table.", .extension), "\n")
  }


  dir.create("output", recursive = TRUE, showWarnings = FALSE)
  save_regTable("tex")
  save_regTable("txt")

  # Check
  print(df |> count(outcome))
  print(df |> count(casualty))
  print(df |> count(who))

  # Barcharts ---------------------------------------------------------------

  response_labels <- c(
    "Don't support",
    "If anything, I would not support",
    "I can't say either way",
    "If anything, I would support",
    "Support"
  )

  summarize_support_percentages <- function(data, treatment, treatment_labels,
                                            treatment_levels = c(0, 1)) {
    data |>
      transmute(
        treatment = {{ treatment }},
        response_value = y2
      ) |>
      count(treatment, response_value) |>
      group_by(treatment) |>
      mutate(displayed_pct = round(100 * n / sum(n), 1)) |>
      summarise(
        displayed_support_pct = sum(displayed_pct[response_value %in% c(4, 5)]),
        direct_support_pct = round(
          100 * sum(n[response_value %in% c(4, 5)]) / sum(n),
          1
        ),
        .groups = "drop"
      ) |>
      mutate(
        treatment = factor(
          treatment,
          levels = treatment_levels,
          labels = treatment_labels
        )
      )
  }

  make_support_barchart <- function(data, treatment, treatment_labels,
                                    treatment_levels = c(0, 1)) {
    bar_chart <- data |>
      transmute(
        treatment = {{ treatment }},
        response_value = y2
      ) |>
      count(treatment, response_value) |>
      group_by(treatment) |>
      mutate(pct = n / sum(n)) |>
      ungroup() |>
      mutate(
        treatment = factor(
          treatment,
          levels = treatment_levels,
          labels = treatment_labels
        ),
        response = factor(
          response_value,
          levels = 1:5,
          labels = response_labels
        )
      )

    pct_label <- bar_chart |>
      arrange(treatment, desc(response_value)) |>
      group_by(treatment) |>
      mutate(
        label_y = cumsum(pct) - pct / 2,
        pct_label = paste0(format(round(100 * pct, 1), nsmall = 1), "%")
      ) |>
      ungroup()

    ggplot() +
      geom_col(
        data = bar_chart,
        aes(
          x = treatment,
          y = 100 * pct,
          fill = response
        )
      ) +
      geom_text(
        data = pct_label,
        aes(
          x = treatment,
          y = 100 * label_y,
          label = pct_label
        )
      ) +
      labs(
        title = "Do you support or not support this operation?",
        fill = NULL,
        x = NULL,
        y = "%"
      ) +
      theme_few()
  }

  cat("\nSupport percentages by authority condition:\n")
  print(
    summarize_support_percentages(
      df,
      who,
      c("Prime Minister", "Commander of Joint Mission Task Force")
    )
  )

  cat("\nSupport percentages by casualty condition:\n")
  print(
    summarize_support_percentages(
      df,
      casualty,
      c("No casualties", "Several casualties")
    )
  )

barchart1 <- make_support_barchart(
  df,
  who,
    c("Prime Minister", "Commander of \nJoint Mission Task Force")
  )

  dir.create("figures", recursive = TRUE, showWarnings = FALSE)
  ggsave("figures/barchart1.pdf", barchart1, width = 7, height = 4, scale = 1)
  cat("Saved: figures/barchart1.pdf\n")

  barchart2 <- make_support_barchart(
    df,
    casualty,
    c("No casualties\n", "Several casualties\n")
  )

ggsave("figures/barchart2.pdf", barchart2, width = 7, height = 4, scale = 1)
cat("Saved: figures/barchart2.pdf\n")
})
