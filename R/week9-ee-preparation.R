
survey_csv <- read_csv("https://raw.githubusercontent.com/tpemartin/113-1-R/refs/heads/main/Lecture-notes/ee-survey.csv")

glimpse(survey_csv)

library(lubridate)

# parse date time
survey_csv <- survey_csv %>%
  mutate(
    `Timestamp` = mdy_hms(`Timestamp`)
  )

glimpse(survey_csv)

# time zone
tz(survey$Timestamp)

# change time zone
tz(survey$Timestamp) <- "Asia/Taipei"

glimpse(survey_csv)

# hms format 
trafficAccidents <- read_csv("trafficAccidents.csv")
glimpse(trafficAccidents[1:6]) 

trafficAccidents |>
  select(
    1:5
  ) |>
  head(2) |>
  glimpse()



trafficAccidents <- trafficAccidents %>%
  mutate(
    `發生時間` = paste0(substr(`發生時間`, 1, 2), ":", 
                    substr(`發生時間`, 3, 4), ":", 
                    substr(`發生時間`, 5, 6)),
    `日期時間` = ymd(`發生日期`) + hms(`發生時間`)
  )


# 檢查新生成的日期時間欄位
glimpse(trafficAccidents$日期時間)


# 檢查time zone
tz(trafficAccidents$日期時間)

tz(trafficAccidents$日期時間) <- "Asia/Taipei"

tz(trafficAccidents$日期時間)

glimpse(trafficAccidents$日期時間)


