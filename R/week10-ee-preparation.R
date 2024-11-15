library(tidyverse)
growth <- read_csv("growth_tw.csv")

CPI <- read_csv("CPI2.csv")

glimpse(CPI$統計期)
library(dplyr)
library(stringr)
library(lubridate)

library(lubridate)
library(dplyr)
library(lubridate)

# 將民國日期字串轉換為 Date 類型
CPI <- CPI %>%
  mutate(
    western_date = 統計期 %>%
      str_extract_all("\\d+") %>% # 提取數字
      map_chr(~ paste(as.integer(.x[1]) + 1911, .x[2], sep = "-")) %>%
      ym()
  )

glimpse(CPI)

# 多類字串處理
library(tidyverse)
library(googlesheets4)
survey <- read_csv("https://raw.githubusercontent.com/tpemartin/113-1-R/refs/heads/main/Lecture-notes/ee-survey.csv")

glimpse(survey)
survey$Gender |>
  unique() |>
  dput()

survey <- survey |>
  mutate(
    Timestamp = mdy_hms(Timestamp, tz = "Asia/Taipei"),
    Gender = factor(Gender,
      levels = c("Male", "Female")
    ),
    `Do you have a job?` = factor(`Do you have a job?`,
      levels = c(
        "No job. (Full-time student)",
        "Part-time job",
        "Full-time job"
      )
    ),
    `How many accumulative course credits have you acquired so far?` =
      factor(`How many accumulative course credits have you acquired so far?`,
        levels = c(
          "0 (Freshman, 一年級新生）",
          "1-30", "31-60",
          "61-90", "91-120",
          "121-140"
        )
      ),
    `Which year are you in?` = factor(`Which year are you in?`,
      levels = c(
        "Freshman (一年級）",
        "Sophomore （二年級）",
        "Junior  (三年級）",
        "Year 5 and above",
        "Senior（四年級）"
      ),
      ordered = TRUE
    )
  )
glimpse(survey)

# 一模一樣的相等 ----

## survey$Gener who is "Male"
glimpse(survey[1:2,])
survey$Gener == "Male"


library(googlesheets4)
survey <- read_sheet("https://docs.google.com/spreadsheets/d/1nqjK0V_HHl1R5To8A2-G7p9YQAjfGgSwoawx2WEU4-8/edit?gid=0#gid=0",
  sheet = "Sheet1"
)

student_survey1 <- read_sheet("https://docs.google.com/spreadsheets/d/1HMkgqr-VyN6Q8faBqg6aRvkNGI0DlilzfwlJjJ-xJ8c/edit?gid=1656812417#gid=1656812417",
  sheet = "資料科學程式設計"
)
student_survey2 <- read_sheet("https://docs.google.com/spreadsheets/d/1jb6D-Pi0Ol9tYMbK1MQiTR7v-Q4VRHPpeK7rx6VR9ng/edit?gid=699875337#gid=699875337",
  sheet = "Form Responses 1"
)
student_survey3 <- read_sheet("https://docs.google.com/spreadsheets/d/1y4aJxP5-Rpco17gflA3Ho68pM0XubfENJyATGElfx0w/edit?gid=1678725407#gid=1678725407",
  sheet = "表單回應 1"
)

# 一模一樣的相等 ----

# `==`





glimpse(survey$選這門課原因)
