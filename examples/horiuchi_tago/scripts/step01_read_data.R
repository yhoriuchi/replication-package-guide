# Horiuchi-Tago (Evacuation from Afghanistan)
# Step 01: Read and wrangle data

source("functions/logging.R")
start_script_log("step01_read_data")

run_logged_script({
# Initial settings --------------------------------------------------------

library(tidyverse)

source("functions/read_Qualtrics.R")

# Load data ---------------------------------------------------------------

file <- "HHT+-+Evacuation+from+Afghanistan+-+Civilian+Control+&+Casualty+Sensitivity_August+31,+2021_06.18.csv"

df <- read_Qualtrics(file, "data") |>
  filter(Finished == TRUE) |>
  mutate(id = rid) |>
  mutate(prefecture = Q8.5) |>
  mutate(area = case_when(
    prefecture == "北海道" ~ "1) Hokkaido",
    prefecture %in% c(
      "青森県",
      "岩手県",
      "宮城県",
      "秋田県",
      "山形県",
      "福島県"
    ) ~ "2) Tohoku",
    prefecture %in% c(
      "茨城県",
      "栃木県",
      "群馬県",
      "埼玉県",
      "千葉県",
      "東京都",
      "神奈川県"
    ) ~ "3) Kanto",
    prefecture %in% c(
      "新潟県",
      "富山県",
      "石川県",
      "福井県",
      "山梨県",
      "長野県",
      "岐阜県",
      "静岡県",
      "愛知県"
    ) ~ "4) Chubu",
    prefecture %in% c(
      "三重県",
      "滋賀県",
      "京都府",
      "大阪府",
      "兵庫県",
      "奈良県",
      "和歌山県"
    ) ~ "5) Kinki",
    prefecture %in% c(
      "鳥取県",
      "島根県",
      "岡山県",
      "広島県",
      "山口県"
    ) ~ "6) Chugoku",
    prefecture %in% c(
      "徳島県",
      "香川県",
      "愛媛県",
      "高知県"
    ) ~ "7) Shikoku",
    prefecture %in% c(
      "福岡県",
      "佐賀県",
      "長崎県",
      "熊本県",
      "大分県",
      "宮崎県",
      "鹿児島県",
      "沖縄県"
    ) ~ "8) Kyushu-Okinawa"
  )) |>
  mutate(age = Q8.3) |>
  mutate(age_group = case_when(
    age %in% 18:29 ~ "1) 18-29",
    age %in% 30:39 ~ "2) 30-39",
    age %in% 40:49 ~ "3) 40-49",
    age %in% 50:59 ~ "4) 50-59",
    age %in% 60:74 ~ "5) 60-74"
  )) |>
  mutate(sex = ifelse(Q8.2 == "男", "1) Male", "2) Female")) |>
  mutate(
    correct1a = if_else(who == "自衛隊の統合任務部隊指揮官" & `Added - Q7` == "自衛隊の統合任務部隊指揮官", 1, 0),
    correct1b = if_else(who == "菅首相" & `Added - Q7` == "菅首相", 1, 0),
    correct2a = if_else(outcome == "作戦は失敗し、１台を除いて無事に空港まで護送することができませんでした" & `Added - Q8` == "作戦は失敗し、１台を除いて無事に空港まで護送することができなかった", 1, 0),
    correct2b = if_else(outcome == "作戦は成功し、５台すべてを無事に空港まで護送することができました" & `Added - Q8` == "作戦は成功し、５台すべてを無事に空港まで護送することができた", 1, 0),
    correct3a = if_else(casualty == "死傷者は出ませんでした" & `Added - Q9` == "出なかった", 1, 0),
    correct3b = if_else(casualty == "複数の死傷者が出ました" & `Added - Q9` == "出た", 1, 0)
  ) |>
  mutate(
    correctA = if_else(correct1a == 0 & correct1b == 0, 0, 1),
    correctB = if_else(correct2a == 0 & correct2b == 0, 0, 1),
    correctC = if_else(correct3a == 0 & correct3b == 0, 0, 1)
  ) |>
  mutate(correct_sum = correctA + correctB + correctC) |>
  mutate(
    who = case_when(
      who == "自衛隊の統合任務部隊指揮官" ~ 1,
      who == "菅首相" ~ 0
    ),
    result = case_when(
      outcome == "作戦は失敗し、１台を除いて無事に空港まで護送することができませんでした" ~ 1,
      outcome == "作戦は成功し、５台すべてを無事に空港まで護送することができました" ~ 0
    ),
    casualty = case_when(
      casualty == "死傷者は出ませんでした" ~ 0,
      casualty == "複数の死傷者が出ました" ~ 1
    ),
    y1 = case_when(
      `Added - Q1` == "評価する" ~ 5,
      `Added - Q1` == "どちらかといえば、評価する" ~ 4,
      `Added - Q1` == "どちらともいえない" ~ 3,
      `Added - Q1` == "どちらかといえば、評価しない" ~ 2,
      `Added - Q1` == "評価しない" ~ 1
    ),
    y2 = case_when(
      `Added - Q2` == "支持する" ~ 5,
      `Added - Q2` == "どちらかといえば、支持する" ~ 4,
      `Added - Q2` == "どちらともいえない" ~ 3,
      `Added - Q2` == "どちらかといえば、支持しない" ~ 2,
      `Added - Q2` == "支持しない" ~ 1
    )
  )


# Save data ---------------------------------------------------------------

dir.create("output", recursive = TRUE, showWarnings = FALSE)
write_rds(df, "output/wrangled_data.rds")

cat("Rows in wrangled data:", nrow(df), "\n")
cat("Columns in wrangled data:", ncol(df), "\n")
cat("Saved: output/wrangled_data.rds\n")
})
