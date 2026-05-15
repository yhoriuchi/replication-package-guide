# Horiuchi-Tago (Evacuation from Afghanistan)
# Step 02: Check manipulation

source("functions/logging.R")
start_script_log("step02_check_manipulation")

run_logged_script({
# Initial settings --------------------------------------------------------

library(tidyverse)
library(estimatr)
library(ggthemes)
library(patchwork)

fig_w <- 10
fig_h <- 5

# Load data ---------------------------------------------------------------

df <- read_rds("output/wrangled_data.rds")
cat("Rows in loaded data:", nrow(df), "\n")

# Check the number of respondents ----------------------------------------

cat("\nNumber of respondents in Study 2 analysis data:\n")
print(
  df |>
    summarise(
      rows = n(),
      unique_respondents = n_distinct(rid)
    )
)

cat("\nNumber of respondents by treatment cell:\n")
print(
  df |>
    count(who, result, casualty, name = "n") |>
    arrange(who, result, casualty)
)

# Check the attention check -----------------------------------------------

print(df |> count(Q4.1, screener))

# Check time to complete the survey ---------------------------------------

print(
  df |>
    mutate(
      start = ymd_hms(StartDate),
      end = ymd_hms(EndDate),
      time = end - start
    ) |>
    summarise(
      mean = mean(time),
      median = median(time)
    ) |>
    t()
)

print(
  df |>
    mutate(start = ymd_hms(StartDate, tz = "America/New_York") |> with_tz("Japan")) |>
    summarise(start = min(start))
)

print(
  df |>
    mutate(end = ymd_hms(EndDate, tz = "America/New_York") |> with_tz("Japan")) |>
    summarise(end = max(end))
)

# Check NAs ---------------------------------------------------------------

print(
  df |>
    map_df(function(x) sum(is.na(x))) |>
    gather(variable, num_NAs) |>
    filter(num_NAs != 0) |>
    as.data.frame()
)

df |>
  count(Q6.1, Q6.2, Q6.3) |>
  print(n = Inf)
print(df |> count(Q8.6))

# Manipulation check ------------------------------------------------------

print(df |> count(who, `Added - Q7`))
print(df |> count(outcome, `Added - Q8`))
print(df |> count(casualty, `Added - Q9`))

print(
  df |>
    count(correctA, correctB, correctC) |>
    mutate(pct = n / sum(n))
)

print(
  df |>
    count(correct_sum) |>
    mutate(pct = round(100 * n / sum(n), digits = 1))
)
})
