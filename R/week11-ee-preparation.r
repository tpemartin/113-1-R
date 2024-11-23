
library(tidyverse)
# a data frame with 4 observations
string_df <- tibble(
    # 台灣地址
    taiwan_address = 
        c("新竹市東區食品路228號",
        "台中市大甲區蔣公路140號",
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


# maynot be there----

library(dplyr)
library(stringr)

# Define the regex pattern
pattern <- "^台?北市立第?一女(?:子)?(?:高)?(?:級)?(?:中)?(?:學)?$"

# Filter rows that match the pattern
matching_schools <- string_df %>%
  mutate(matches_pattern = str_detect(high_school, pattern)) %>%
  filter(matches_pattern == TRUE)

matching_schools |> glimpse()

library(dplyr)
library(stringr)

# Define the regex pattern using capturing groups (instead of non-capturing groups)
pattern <- "^台?北市?(立第)?一女(子)?(高)?(級)?(中)?(學)?$"

# Filter rows that match the pattern
matching_schools <- string_df %>%
  mutate(matches_pattern = str_detect(high_school, pattern))

# Display the result
matching_schools

string_df$matches_pattern <- stringr::str_detect(
  string_df$high_school,
  "台?北(市立第)?一女子?高?級?中?學?"
)

string_df |> glimpse()

string_df$matches_pattern <- stringr::str_detect(
  string_df$high_school,
  "^台?北(市立第)?一女子?高?級?中?學?$"
)

string_df |> glimpse()

