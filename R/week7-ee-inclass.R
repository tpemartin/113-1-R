class_survey1 <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1jb6D-Pi0Ol9tYMbK1MQiTR7v-Q4VRHPpeK7rx6VR9ng/edit?gid=699875337#gid=699875337", 
                                           sheet="Form Responses 1") 

glimpse(class_survey1)


survey <- googlesheets4::read_sheet(
  "https://docs.google.com/spreadsheets/d/1nqjK0V_HHl1R5To8A2-G7p9YQAjfGgSwoawx2WEU4-8/edit?gid=0#gid=0",
  sheet="Sheet1"
)


glimpse(survey)

tidy_survey <- survey %>% 
  mutate( 
    `性別` = factor(`性別`), 
    `工作狀態` = factor(`工作狀態`), 
    `年齡` = factor(`年齡`, ordered = TRUE) 
  ) 

glimpse(tidy_survey)
glimpse(survey)

survey <- survey %>%
  mutate(`年齡` = factor(`年齡`, 
                       levels = c("18歲以下", "18-22", "23-30", "31-40", "40+"), 
                       ordered = TRUE))



class_feedback <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1HMkgqr-VyN6Q8faBqg6aRvkNGI0DlilzfwlJjJ-xJ8c/edit?gid=1656812417#gid=1656812417", 
                                            sheet="資料科學程式設計") 
job <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1jb6D-Pi0Ol9tYMbK1MQiTR7v-Q4VRHPpeK7rx6VR9ng/edit?gid=699875337#gid=699875337", 
                                 sheet="Form Responses 1") 
hobby <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1y4aJxP5-Rpco17gflA3Ho68pM0XubfENJyATGElfx0w/edit?gid=1678725407#gid=1678725407", 
                                   sheet="表單回應 1") 

glimpse(class_feedback) 
glimpse(job) 
glimpse(hobby) 

hobby <- hobby %>% 
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

class_feedback <- class_feedback %>%
  rename(
    timestamp = `时间戳记`,
    email = `电子邮件地址`,
    reason_for_course = `為什麼想修這門課程`,
    diverse_teaching = `課程採用多元化教學`,
    willing_to_take_others = `你還願意選修教授開設的其他課程嗎?(非必填)`,
    expected_grade = `你期望的學期成績`,
    satisfaction = `我很滿意本期教學內容`
  )

job <- job |>
  mutate(
    產業別 = factor(產業別),
    `（此產業）年資` = factor( `（此產業）年資`, ordered=TRUE,
                        levels=c("2年以下","2-5年",
                                 "5年以上")),
    月薪 = factor(as.character(月薪), ordered=TRUE),
    就業狀態 = factor(就業狀態)
)

job$產業別
job$就業狀態
job$`（此產業）年資`
job$月薪


# date ------

library(lubridate)

##  YYYYMMDD ---- 
trafficAccidents <- read_csv("trafficAccidents.csv") 

glimpse(trafficAccidents$發生日期) 


trafficAccidents <- trafficAccidents %>%
  mutate(`發生日期` = ymd(`發生日期`))

glimpse(trafficAccidents$發生日期)

## yyyymm-----

future <- read_csv("future.csv")

glimpse(future$資料年月)

future <- future %>%
  mutate(`資料年月` = ym(`資料年月`))

glimpse(future$資料年月)

## yyyyq ---

growth <- read_csv("growth_tw.csv")

glimpse(growth$統計期)

growth <- growth %>%
  mutate(
    西元年 = as.numeric(str_extract(統計期, "\\d+")) + 1911,
    季別 = str_extract(統計期, "第\\d季") %>% str_extract("\\d"),
    統計期 = yq(paste0(西元年, "Q", 季別))
  )


glimpse(growth$統計期)



## ttt年m月----
CPI <- read_csv("CPI.csv", skip = 2)

glimpse(CPI$統計期)

CPI <- CPI %>%
  mutate(
    西元年 = as.numeric(str_extract(統計期, "\\d+")) + 1911,
    月份 = str_extract(統計期, "\\d+月") %>% str_remove("月"),
    統計期 = ym(paste0(西元年, 月份))
  )

glimpse(CPI$統計期)

## ttt年----
exchangeRate <- read_csv("exchangeRate.csv", skip = 2)

glimpse(exchangeRate$統計期)

exchangeRate <- exchangeRate %>%
  mutate(
    西元年 = as.numeric(str_extract(統計期, "\\d+")) + 1911,
    統計期 = ymd(paste0(西元年, "-01-01"))
  )


glimpse(exchangeRate$統計期)

