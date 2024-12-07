library(googlesheets4)  
survey_ee <- read_sheet("https://docs.google.com/spreadsheets/d/1RnT-dD0WAND8lS7v_nkhtnArBqChzLAqPJ3IKe0wSzA/edit?gid=1045486302#gid=1045486302", 
                        sheet = "electronics-usage"  
)  

survey_ee <- survey_ee %>% 
  rename( 
    timestamp = `Timestamp`, 
    email_address = `Email Address`, 
    department = `科系`, 
    grade = `年級`, 
    device_used_last_week = `一周內曾使用裝置`, 
    average_daily_device_usage_hours = `平均每天裝置使用總時數`, 
    type_of_software_used = `使用軟體的類型`, 
    gender = `性別` 
  ) 

glimpse(survey_ee)  


survey_ee |>  
  dplyr::filter(grade == "大一")  

survey_ee |>  
  dplyr::filter(grade != "大一")  

survey_ee |>  
  dplyr::filter(device_used_last_week=="手機")  

survey_ee |> 
  dplyr::filter(str_detect(device_used_last_week,"手機")) 

# Pattern -----
library(tidyverse) 
# a data frame with 4 observations 
string_df <- tibble( 
  # 台灣地址 
  taiwan_address =  
    c("新竹市東區食品路228號", 
      "臺中市大甲區蔣公路140號", 
      "台南市北區中華北路一段85號", 
      "嘉義縣大林鎮民權路53號", 
      "雲林縣西螺鎮福興里中山路70號", 
      "宜蘭縣礁溪鄉德陽路102號", 
      "南投縣竹山鎮集山路一段2071號", 
      "台中市西區精誠路11-4號"), 
  high_school =  
    c("台北市立第一女子高級中學", 
      "北一女", # 台 北 市立第 一 女 子高級中學 
      "北一女中", # 台 北 市立第 一 女 子高級 中 學 
      "北一女高", # 台 北 市立第 一 女 子 高 級 中 學 
      "台北市立松山高級中學",  
      "新北市立一級棒女子高級中學", 
      "新北一女", 
      "一級棒女中"), 
  school_id =  
    c("411273008", 
      "411382009", 
      "411274010", 
      "411263011", 
      "411044103", 
      "411055104", 
      "411066105", 
      "411077106"), 
  skill =  
    c("C++, R", 
      "R, Python", 
      "R", 
      "Python, Java", 
      "Julia, Python", 
      "Julia", 
      "","R") 
) 

string_df %>%  
  mutate( 
    location = str_sub(taiwan_address, 1, 3), 
    department = str_sub(school_id, 5, 6) 
  ) 

## exact pattern  

string_df |> 
  dplyr::filter(
    str_detect(skill,"Python")
    ) 



string_df |>
  dplyr::filter(
    str_detect(taiwan_address, "(台|臺)中市")
  )

# Extract strings with 3 to 5 traditional Chinese characters ending with 鄉, 鎮, 區, or 里
string_df <- string_df |>
  mutate(
    county_city = str_sub(taiwan_address, 1,3),
    remaining_address = str_sub(taiwan_address, 4)
  )

string_df <- string_df |>
  mutate(
    township = str_extract(remaining_address, "[\u4E00-\u9FFF]{1,4}[鄉鎮區里]")
  )


string_df$matches_pattern <- stringr::str_detect( 
  string_df$high_school, 
  "台?北(市立第)?一女子?高?級?中?學?" 
) 

string_df <- string_df |> 
  mutate(
    matches_pattern = str_extract(high_school, "^台?北(市立第)?一女子?高?級?中?學?$")
  ) |>
  relocate(
    matches_pattern
  )










