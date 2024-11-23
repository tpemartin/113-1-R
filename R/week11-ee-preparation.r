
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
        "411263011"),
    skill = 
        c("C++, R",
        "R, Python",
        "R",
        "Python, Java")
)


# location -----
string_df %>% 
    mutate(
        location = str_sub(taiwan_address, 1, 3),
        department = str_sub(school_id, 5, 6)
    )

# target pattern -----

## exact pattern 

string_df |>
    filter(str_detect(skill,"Python"))

## 1. taiwan_address's subdivision 2 (區里鄉鎮)
library(stringr)

extracted_addresses <- string_df %>%
  filter(str_detect(taiwan_address, "[\u4e00-\u9fff]{3,5}(鄉|鎮|區|里)")) %>%
  mutate(extracted = str_extract(taiwan_address, "[\u4e00-\u9fff]{3,5}(鄉|鎮|區|里)"))

extracted_addresses |> glimpse()

library(stringr)

extracted_addresses <- string_df %>%
  filter(str_detect(taiwan_address, "[\u4e00-\u9fff]{2,4}(鄉|鎮|區|里)")) %>%
  mutate(extracted = str_extract(taiwan_address, "[\u4e00-\u9fff]{2,4}(鄉|鎮|區|里)"))

extracted_addresses |> glimpse()

library(stringr)

extracted_addresses <- string_df %>%
  mutate(trimmed_address = str_sub(taiwan_address, 4)) %>%
  filter(str_detect(trimmed_address, "^[\u4e00-\u9fff]{3,5}(鄉|鎮|區|里)$")) %>%
  mutate(extracted = str_extract(trimmed_address, "^[\u4e00-\u9fff]{3,5}(鄉|鎮|區|里)$"))

extracted_addresses |> glimpse()


library(dplyr)
library(stringr)

extracted_addresses <- string_df %>%
  mutate(extracted = str_extract(taiwan_address, "[\u4e00-\u9fff]{2,4}(鄉|鎮|區|里)")) %>%
  filter(!is.na(extracted))

extracted_addresses |> glimpse()

library(dplyr)
library(stringr)

extracted_addresses <- string_df %>%
  mutate(trimmed_taiwan_address = str_sub(taiwan_address, 4)) %>%
  mutate(extracted = str_extract(trimmed_taiwan_address, "[\u4e00-\u9fff]{2,4}(鄉|鎮|區|里)")) %>%
  filter(!is.na(extracted))

extracted_addresses |> glimpse()

library(dplyr)
library(stringr)

extracted_addresses <- string_df %>%
  mutate(extracted = str_extract(taiwan_address, ".{2,4}(鄉|鎮|區|里)")) %>%
  filter(!is.na(extracted))

extracted_addresses |> glimpse()
