library(tidyverse)

# https://data.gov.tw/dataset/146463

sanxia_housing <- read_csv("https://raw.githubusercontent.com/tpemartin/113-1-R/refs/heads/main/data-public/%E4%B8%8D%E5%8B%95%E7%94%A2%E5%AF%A6%E5%83%B9%E7%99%BB%E9%8C%84%E8%B3%87%E8%A8%8A-%E9%A0%90%E5%94%AE%E5%B1%8B%E6%A1%88%E4%BB%B6-%E4%B8%89%E5%B3%BD%E5%8D%80.csv")

glimpse(sanxia_housing)

sanxia_housing <- sanxia_housing |>
  dplyr::rename(
    `鄉鎮市區` = `district`,
    `交易標的` = `rps01`,
    `土地區段位置建物區段門牌` = `rps02`,
    `土地移轉總面積平方公尺` = `rps03`,
    `都市土地使用分區` = `rps04`,
    `非都市土地使用分區` = `rps05`,
    `非都市土地使用編定` = `rps06`,
    `交易年月日` = `rps07`,
    `交易筆棧數` = `rps08`,
    `移轉層次` = `rps09`,
    `總樓層數` = `rps10`,
    `建物型態` = `rps11`,
    `主要用途` = `rps12`,
    `主要建材` = `rps13`,
    `建築完成年月` = `rps14`,
    `建物移轉總面積平方公尺` = `rps15`,
    `建物現況格局-房` = `rps16`,
    `建物現況格局-廳` = `rps17`,
    `建物現況格局-衛` = `rps18`,
    `建物現況格局-隔間` = `rps19`,
    `有無管理組織` = `rps20`,
    `總價元` = `rps21`,
    `單價元平方公尺` = `rps22`,
    `車位類別` = `rps23`,
    `車位移轉總面積平方公尺` = `rps24`,
    `車位總價元` = `rps25`,
    `備註` = `rps26`,
    `編號` = `rps27`,
    `建案名稱` = `rps28`,
    `棟及號` = `rps29`
  )

glimpse(sanxia_housing[1:2,])

library(stringr)

average_price_by_street <- sanxia_housing |>
  dplyr::mutate(
    `路_街` = str_extract(`土地區段位置建物區段門牌`, "(\\w+路|\\w+街)")  # 提取路或街的名稱
  ) |>
  dplyr::group_by(`路_街`) |>
  dplyr::summarize(
    `平均單價元平方公尺` = mean(`單價元平方公尺`, na.rm = TRUE),  # 計算平均單價
    .groups = "drop"
  ) |>
  dplyr::ungroup()

# 查看結果
average_price_by_street

library(lubridate)

sanxia_housing <- sanxia_housing |>
  dplyr::mutate(
    `西元年月日` = ym(paste0(as.numeric(substr(`交易年月日`, 1, 3)) + 1911, 
                              substr(`交易年月日`, 4, 6)))  # 將民國年轉換為西元年，生成yyyy-mm格式
  )

# 查看新增的西元年月日欄位
glimpse(sanxia_housing)

library(lubridate)

sanxia_housing <- sanxia_housing |>
  dplyr::mutate(
    `西元年月日` = ymd(paste0(as.numeric(substr(`交易年月日`, 1, 3)) + 1911, 
                              "-", 
                              substr(`交易年月日`, 4, 5), 
                              "-", 
                              substr(`交易年月日`, 6, 7)))  # 生成 yyyy-mm-dd 格式的日期
  )

# 查看新增的西元年月日欄位
glimpse(sanxia_housing)

library(lubridate)
library(dplyr)

# 生成西元年季欄位
sanxia_housing <- sanxia_housing |>
  dplyr::mutate(
    `西元年季` = paste0(year(`西元年月日`), "-", quarter(`西元年月日`))  # 生成如 "2022-1" 的格式
  )

# 分析不同年份及不同季別下，不同路或街的平均單價
average_price_by_year_quarter_street <- sanxia_housing |>
  dplyr::mutate(
    `路_街` = stringr::str_extract(`土地區段位置建物區段門牌`, "(\\w+路|\\w+街)")  # 提取路或街的名稱
  ) |>
  dplyr::group_by(`西元年季`, `路_街`) |>
  dplyr::summarize(
    `平均單價元平方公尺` = mean(`單價元平方公尺`, na.rm = TRUE),  # 計算平均單價
    .groups = "drop"
  )

# 查看結果
average_price_by_year_quarter_street

glimpse(average_price_by_year_quarter_street[1:2,])

library(dplyr)
library(tidyr)

# 移除 $ 路_街 中的 "新北市三峽區" 字眼
average_price_by_year_quarter_street <- average_price_by_year_quarter_street |>
  dplyr::mutate(
    `路_街` = stringr::str_replace(`路_街`, "新北市三峽區", "")
  )

# 將資料 pivot wider
average_price_wide <- average_price_by_year_quarter_street |>
  tidyr::pivot_wider(
    names_from = `路_街`,  # 從 $ 路_街 生成欄位名稱
    values_from = `平均單價元平方公尺`  # 欄位值來自於 $ 平均單價元平方公尺
  )

# 查看結果
glimpse(average_price_wide)
