library(tidyverse)

student_data <- read_csv("https://raw.githubusercontent.com/yeh1229/113-1-R-final-project/refs/heads/master/%E8%87%BA%E5%8C%97%E5%B8%82%E8%A7%80%E5%85%89%E9%81%8A%E6%86%A9.csv")
glimpse(student_data$統計期)

library(dplyr)
library(stringr)
library(lubridate)

student_data <- student_data |>
  mutate(
    `western_year` = as.numeric(str_extract(`統計期`, "\\d+")) + 1911,
    `統計期` = str_replace(`統計期`, "\\d+年", paste0(`western_year`, "年")),
    `統計期` = ym(`統計期`)
  )

