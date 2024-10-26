survey <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1nqjK0V_HHl1R5To8A2-G7p9YQAjfGgSwoawx2WEU4-8/edit?gid=0#gid=0",
                                    sheet="Sheet1")
survey <- survey %>%
  mutate(
    `性別` = factor(`性別`, levels = c("男", "女")),
    `工作狀態` = factor(`工作狀態`, levels = c("無工作", "全職工作者", "兼職工作者")),
    `年齡` = factor(`年齡`, levels = c("18歲以下", "18-22", "23-30", "31-40", "40+"), ordered = TRUE)
  )

# Cut

## 查看四分位數
summary(survey$一週工時)

survey <- survey %>%
  mutate(一週工時類別 = factor(case_when(
    `一週工時` <= 2 ~ "0-2",
    `一週工時` >= 3 & `一週工時` <= 36 ~ "3-36",
    `一週工時` >= 37 & `一週工時` <= 40 ~ "37-40",
    `一週工時` > 40 ~ "40+"
  ), levels = c("0-2", "3-36", "37-40", "40+")))

# date class----
##  YYYYMMDD ----
trafficAccidents <- read_csv("data/112年傷亡道路交通事故資料/112年度A1交通事故資料.csv")

glimpse(trafficAccidents)

trafficAccidents <- trafficAccidents %>%
  mutate(發生日期 = as.Date(as.character(發生日期), format = "%Y%m%d"))

summary(trafficAccidents$發生日期)

## YYMM ----
future <- read_csv("data/商品類期貨每月平均成交金額.csv",
locale = locale(encoding = "BIG5"))

library(lubridate)

future <- future %>%
  mutate(`資料年月` = ym(`資料年月`))

### Taiwan date----

growth <- growth %>%
  mutate(`統計期` = {
    # Extract TTT and Q from the string
    year_q <- str_extract(`統計期`, "\\d{3}")  # Extract the TTT year
    quarter <- str_extract(`統計期`, "第(\\d)季") %>% str_extract("\\d") # Extract the quarter number
    
    # Convert TTT to YYYY by adding 1911
    year_YYYY <- as.integer(year_q) + 1911
    
    # Determine the start month of the quarter
    start_month <- case_when(
      quarter == "1" ~ 1,   # Q1 starts in January
      quarter == "2" ~ 4,   # Q2 starts in April
      quarter == "3" ~ 7,   # Q3 starts in July
      quarter == "4" ~ 10    # Q4 starts in October
    )
    
    # Create a date representing the first day of the quarter
    make_date(year_YYYY, start_month, 1)
  })



# Datetime class ----
survey <- read_csv("data/113-1 learning R (Responses) - public - Sheet1.csv")
 

survey <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1nqjK0V_HHl1R5To8A2-G7p9YQAjfGgSwoawx2WEU4-8/edit?gid=0#gid=0",
                                    sheet="Sheet1")
