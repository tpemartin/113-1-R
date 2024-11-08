
survey <- read_csv("https://raw.githubusercontent.com/tpemartin/113-1-R/refs/heads/main/Lecture-notes/ee-survey.csv")

glimpse(survey)

library(lubridate)

# parse date time
survey <- survey %>%
  mutate(
    `Timestamp` = mdy_hms(`Timestamp`, tz="Asia/Taipei")
  )

glimpse(survey)

# time zone
tz(survey$Timestamp)

# change time zone
tz(survey$Timestamp) <- "Asia/Taipei"

glimpse(survey)

library(dplyr)

# Create a sample data frame
example_data <- data.frame(
  date_time_string = c("2023-01-01 140800", "2023-01-02 153000", "2023-01-03 101500")
)

# Display the example data frame
print(example_data)

library(dplyr)
library(lubridate)

library(dplyr)
library(lubridate)

example_data <- example_data %>%
  mutate(
    date_time_string = ymd_hms(paste0(substr(date_time_string, 1, 10), " ", 
                                      substr(date_time_string, 12, 13), ":", 
                                      substr(date_time_string, 14, 15), ":", 
                                      substr(date_time_string, 16, 17))),
    tz = "Asia/Taipei"
  )

# Display the modified data frame
print(example_data)


# Display the modified data frame
print(example_data)

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
    `日期時間` = ymd(`發生日期`, tz="Asia/Taipei") + hms(`發生時間`)
  )


# 檢查新生成的日期時間欄位
glimpse(trafficAccidents$日期時間)


# 檢查time zone
tz(trafficAccidents$日期時間)

tz(trafficAccidents$日期時間) <- "Asia/Taipei"

tz(trafficAccidents$日期時間)

glimpse(trafficAccidents$日期時間)


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
