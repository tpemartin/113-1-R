
library(tidyverse)
# a data frame with 4 observations
string_df <- tibble(
    # 台灣地址
    taiwan_address = 
        c("新竹市東區食品路228號",
        "台中市大甲區蔣公路140號",
        "台中市大甲區大甲里鎮瀾街102號",
        "嘉義縣大林鎮民權路53號"),
    highschool = 
        c("台北市立第一女子高級中學",
        "北一女中",
        "北一女高",
        "新北市立一級棒女子高級中學"),
    school_id = 
        c("411273008",
        "411382009",
        "411274010",
        "411263011")
)


# location -----
string_df %>% 
    mutate(
        location = str_sub(taiwan_address, 1, 3),
        department = str_sub(school_id, 5, 6)
    )

# target pattern -----

## 1. taiwan_address's subdivision 2 (區里鄉鎮)
string_df %>% 
    mutate(
        subdivision = str_extract(taiwan_address, "市|縣.+[區鎮里]")
    )