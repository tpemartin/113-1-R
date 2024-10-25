library(tidyverse)
survey <- read_csv("113-1 learning R (Responses) - public - Sheet1.csv")

survey <- readr::read_csv("113-1 learning R (Responses) - public - Sheet1.csv")


native <- read_csv("data/112native_A1-1.csv")

glimpse(survey)

summary(survey)

flightDestination <- read_csv("歷年中華民國國民出國目的地人數統計2002-2023.csv")
glimpse(flightDestination)
summary(flightDestination)

# Class survey -----

class_survey1 <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1jb6D-Pi0Ol9tYMbK1MQiTR7v-Q4VRHPpeK7rx6VR9ng/edit?gid=699875337#gid=699875337",
                                           sheet="Form Responses 1")


# Factor/ordered factor parsing -----

tidy_survey <- survey %>%
  mutate(
    `性別` = factor(`性別`),
    `工作狀態` = factor(`工作狀態`),
    `年齡` = factor(`年齡`, ordered = TRUE)
  )

glimpse(survey)
glimpse(tidy_survey)

summary(survey)
summary(tidy_survey)

## parsing II -----
tidy_survey <- survey %>%
  mutate(
    `性別` = factor(`性別`, levels = c("男", "女")),
    `工作狀態` = factor(`工作狀態`, levels = c("無工作", "全職工作者", "兼職工作者")),
    `年齡` = factor(`年齡`, levels = c("18歲以下", "18-22", "23-30", "31-40", "40+"), ordered = TRUE)
  )



## graph -----
library(ggplot2)

# 性別分佈
ggplot(tidy_survey, aes(x = `性別`)) +
  geom_bar(fill = "steelblue") +
  labs(title = "性別分佈", x = "性別", y = "人數") +
  theme_minimal()

# 工作狀態分佈
ggplot(tidy_survey, aes(x = `工作狀態`)) +
  geom_bar(fill = "darkorange") +
  labs(title = "工作狀態分佈", x = "工作狀態", y = "人數") +
  theme_minimal()

# 年齡分佈
ggplot(tidy_survey, aes(x = `年齡`)) +
  geom_bar(fill = "forestgreen") +
  labs(title = "年齡分佈", x = "年齡", y = "人數") +
  theme_minimal()

## Student's surveys ----

class_feedback <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1HMkgqr-VyN6Q8faBqg6aRvkNGI0DlilzfwlJjJ-xJ8c/edit?gid=1656812417#gid=1656812417",
                                             sheet="資料科學程式設計")
job <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1jb6D-Pi0Ol9tYMbK1MQiTR7v-Q4VRHPpeK7rx6VR9ng/edit?gid=699875337#gid=699875337",
                                             sheet="Form Responses 1")
hobby <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1y4aJxP5-Rpco17gflA3Ho68pM0XubfENJyATGElfx0w/edit?gid=1678725407#gid=1678725407",
                                             sheet="表單回應 1")

glimpse(student_survey1)
glimpse(student_survey2)
glimpse(student_survey3)

#### rename -----
tidy_student_survey3 <- student_survey3 %>%
  rename_with(~ c(
    "timestamp",
    "email",
    "gender",
    "age",
    "weekly_work_hours",
    "monthly_salary_range",
    "interest_field",
    "weekly_interest_hours",
    "weekly_investment"
  ))

