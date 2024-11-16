# recap

library(tibble) 
 library(lubridate) 
  
 df <- tibble( 
   Chr = as.character(1:10), 
   Num = c(1:5, 6:10), 
   Lgl = c(TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE), 
   Date1 = as.character(seq.Date(from = as.Date("2021-10-01"),  
                                 by = "day",  
                                 length.out = 10)), 
   Date2 = format(seq.Date(from = as.Date("2021-01-01"),  
                           by = "day",  
                           length.out = 10), "%b %d, %Y"), 
   DateTime1 = as.character(seq.POSIXt(from = as.POSIXct("2021-10-01 12:00:00"),  
                                       by = "day",  
                                       length.out = 10)), 
   DateTime2 = format(seq.POSIXt(from = as.POSIXct("2021-01-01 12:00:00"),  
                                 by = "day",  
                                 length.out = 10), "%b %d, %Y %H:%M:%S"), 
   Factor = rep(c("cat", "dog", "bird"), length.out = 10), 
   OrderFactor = rep(c("less than 10", "more than 10"), length.out = 10) 
 ) 
  
 glimpse(df) 

# parse df 
 df <- df |> 
   mutate( 
     Date1 = ymd(Date1), 
     Date2 = mdy(Date2), 
     DateTime1 = ymd_hms(DateTime1, tz="Asia/Taipei"),   
     DateTime2 = mdy_hms(DateTime2, tz="Asia/Taipei"),   
     Factor = factor(Factor, levels = c("cat", "dog", "bird")), 
     OrderFactor = factor(OrderFactor, levels = c("less than 10", "more than 10"), ordered=TRUE) 
   ) 
glimpse(df[1:2,]) 



# save df as csv---- 

write_csv(df, "df.csv")

df2 <- read_csv("df.csv") 
glimpse(df2)

glimpse(df$DateTime1)
tz(df$DateTime1)

glimpse(df2$DateTime1)
tz(df2$DateTime1)


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
glimpse(survey[1:2, ])
survey$Gener == "Male"


library(googlesheets4)
survey_ee <- read_sheet("https://docs.google.com/spreadsheets/d/1nqjK0V_HHl1R5To8A2-G7p9YQAjfGgSwoawx2WEU4-8/edit?gid=0#gid=0",
  sheet = "Sheet1"
)

glimpse(survey_ee)

# Parsing ----
survey_ee <- survey_ee |>
  mutate(
    Timestamp = ymd_hms(Timestamp, tz = "Asia/Taipei"),
    工作狀態 = factor(
      工作狀態,
      levels = c("全職工作者", "兼職工作者", "無工作")
    ),
    年齡 = factor(
      年齡,
      levels = c("18-22", "23-30", "31-40", "40+"),
      ordered = TRUE
    ),
    性別 = factor(
      性別,
      levels = c("男", "女")
    )
  )

glimpse(survey_ee[1:2, ])

# 相等，不等，大於，小於 ----



student_survey1 <- read_sheet("https://docs.google.com/spreadsheets/d/1HMkgqr-VyN6Q8faBqg6aRvkNGI0DlilzfwlJjJ-xJ8c/edit?gid=1656812417#gid=1656812417",
  sheet = "資料科學程式設計"
)
student_survey2 <- read_sheet("https://docs.google.com/spreadsheets/d/1jb6D-Pi0Ol9tYMbK1MQiTR7v-Q4VRHPpeK7rx6VR9ng/edit?gid=699875337#gid=699875337",
  sheet = "Form Responses 1"
)
student_survey3 <- read_sheet("https://docs.google.com/spreadsheets/d/1y4aJxP5-Rpco17gflA3Ho68pM0XubfENJyATGElfx0w/edit?gid=1678725407#gid=1678725407",
  sheet = "表單回應 1"
)

# 等值，與不等值 ----
glimpse(survey_ee)

# `==`
# <dbl> <int> ----
survey_ee$一週工時 == 40
survey_ee$一週工時 != 40
survey_ee$一週工時 > 40
survey_ee$一週工時 >= 40

survey_ee |>
  filter(一週工時 > 40)

## <fct>
survey_ee$性別 == "男"

survey_ee |>
  filter(性別 == "男")

survey_ee |>
  filter(性別 != "男")

## <ord>
survey_ee$年齡 == "18-22"
survey_ee$年齡 > "18-22"

survey_ee |>
  filter(年齡 == "18-22")

survey_ee |>
  filter(年齡 != "18-22")

# <dttm> ----
# 不會去管時區，只會比較時間, 當做比同時區 ----
survey_ee$Timestamp == "2024-10-05 10:31:41"  
survey_ee$Timestamp >= "2024-10-05 10:31:41"

survey_ee |>
  filter(Timestamp == "2024-10-05 10:31:41")

survey_ee |>
  filter(Timestamp >= "2024-10-05 10:31:41")

# 如果要跟不同時區比較，使用ymd_hms ----
survey_ee$Timestamp == ymd_hms("2024-10-05 10:31:41", tz="UTC")
survey_ee$Timestamp != ymd_hms("2024-10-05 10:31:41", tz="UTC")

survey_ee |>
  filter(Timestamp == ymd_hms("2024-10-05 10:31:41", tz="UTC"))
survey_ee |>
  filter(Timestamp < ymd_hms("2024-10-05 10:31:41", tz="UTC"))

# <chr> ----
survey_ee$接觸過的程式 == "Python"

survey_ee |>
  filter(接觸過的程式 == "Python")

# dplyr::filter() ----  
## 多個條件 ----
survey_ee |>
  filter(性別 == "男", 年齡 == "18-22")


## checked box
library(stringr)

# 提取並找出被勾選的題項
checked_items <- survey_ee %>%
  pull(`接觸過的程式`) %>%
  str_split(", ") %>%
  unlist() %>%
  unique()

checked_items
