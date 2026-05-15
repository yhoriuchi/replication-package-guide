# Horiuchi-Tago (Evacuation from Afghanistan)
# Step 03: Check quotas

source("functions/logging.R")
start_script_log("step03_check_quotas")

run_logged_script({
# Initial settings --------------------------------------------------------

library(tidyverse)
library(readxl)
library(ggthemes)
library(ggrepel)

fig_w <- 7
fig_h <- 5
repel_seed <- 20260514

# Load data ---------------------------------------------------------------

df <- read_rds("output/wrangled_data.rds")
cat("Rows in loaded data:", nrow(df), "\n")


# Compare population and sample -------------------------------------------

# % distribution in population

population <- read_xlsx("data/quota_calculation/quotas (Afghanistan).xlsx", skip = 1) |>
  select(variable, category, "n_pop" = n) |>
  filter(!is.na(variable)) |>
  mutate(n_pop = as.numeric(n_pop)) |>
  group_by(variable) |>
  mutate(pct_pop = 100 * n_pop / sum(n_pop)) |>
  ungroup()

# % distribution in sample (region)

region <- df |>
  select(rid, "category" = area) |>
  count(category) |>
  mutate(
    pct_sample = 100 * n / sum(n),
    variable = "region"
  )

# % distribution in sample (age)

age <- df |>
  select(rid, "category" = age_group) |>
  count(category) |>
  mutate(
    pct_sample = 100 * n / sum(n),
    variable = "age"
  )

# % distribution in sample (sex)

sex <- df |>
  select(rid, "category" = sex) |>
  count(category) |>
  mutate(
    pct_sample = 100 * n / sum(n),
    variable = "sex"
  )

sample <- bind_rows(region, age, sex) |>
  mutate(category = str_remove(category, "^\\d\\)\\s"))

# Merge all data frames

balance_check <- population |>
  left_join(sample) |>
  mutate(variable = factor(variable,
    labels = c(
      "Age group",
      "Region",
      "Sex"
    )
  ))

cat("Rows in balance check data:", nrow(balance_check), "\n")
cat("ggrepel seed:", repel_seed, "\n")

# Make figure

set.seed(repel_seed)

population_vs_sample <- ggplot(
  balance_check,
  aes(
    x = pct_pop,
    y = pct_sample
  )
) +
  geom_abline(
    slope = 1,
    linetype = "dashed",
    color = "gray"
  ) +
  geom_point(aes(color = variable),
    size = 3,
    alpha = 0.8
  ) +
  geom_text_repel(
    aes(label = category),
    seed = repel_seed
  ) +
  theme_few() +
  coord_equal() +
  guides(label = NULL) +
  scale_color_manual(values = c("gray", "red", "blue")) +
  labs(
    x = "% in population",
    y = "% in sample %",
    color = "Variable"
  )

# Save figure

dir.create("figures", recursive = TRUE, showWarnings = FALSE)
ggsave(
  "figures/population_vs_sample.pdf",
  population_vs_sample,
  width = fig_w,
  height = fig_h
)
cat("Saved: figures/population_vs_sample.pdf\n")
})
