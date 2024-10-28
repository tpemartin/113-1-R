# Tidy Variable Classes: Date/DateTime

  - Date class format
  - Datetime class format
  - Taiwan date format

## Date/DateTime

:exclamation: :exclamation: :exclamation:
  1. **Source (源頭) variable** should be in **character** class. (if not convert it to character class through  `as.character()`  )
  2. Must specify **writing format**, using (**Y, M, Q, D, h, m, s**) to represent the year, month, quarter (季), day, hour, minute, and second digit.

## AI preset

> When parse date or date time, always use `lubridate` package's parsing function rather than using `as.Date`. To parse monthly data, use `ym` function. To parse quarterly data, use `yq` function. If the date is in Taiwan date format, remember to add 1911 to the year before parsing.

## Date class

### 1. Daily data

#### Example: 112年傷亡道路交通事故資料 (112 Road Traffic Accident Data)

  - <https://data.gov.tw/dataset/167905>

<https://github.com/tpemartin/113-1-R/blob/9fc3f5460400194af22414d899725ba7656fafbd/R/week7-preparation.R#L14-L17>

<details>
<summary>AI prompt</summary>

The task is to parse the "accident_date" column of the `trafficAccidents` data frame, which is currently in numeric class, into date class. The current format is `yyyymmdd`, meaning that `20160101` represents "2016-01-01".

Parse data frame `trafficAccidents` 的"發生日期"欄位（目前為數值格式）成為date class, 它目前的格式為yyyymmdd，例如20160101則代表"2016-01-01"。
</details>


### 2. Non daily date data

When the data is not daily, you need to specify the frequency of the date variable. For example, if the data is monthly, you need to specify the date format as "YYYY-MM". If the data is quarterly, you need to specify the date format as "YYYY-Qn". If the data is yearly, you need to specify the date format as "YYYY".

#### Monthly: 商品類期貨每月平均成交金額 (Monthly average trading volume of commodity futures)

  - <https://data.gov.tw/dataset/52801>
 
 <https://github.com/tpemartin/113-1-R/blob/9fc3f5460400194af22414d899725ba7656fafbd/R/week7-preparation.R#L36-L39>
  
<details>

<summary>AI prompt</summary>  

The task is to parse the "YEARMONTH" variable of the `future` data frame, which is currently in numeric class, into date class. The current format is `yyyymm`, meaning that `202409` represents September of the year 2024.

Parse data frame `future` 的"資料年月"變數（目前為數值變數）成為datet class，它目前的格式為yyyymm, 例如202409即為西元2024年9月。
</details>

#### Quarterly/Yearly: US GDP Growth Rate (Quarterly)

  - growth_us.csv

<https://github.com/tpemartin/113-1-R/blob/9fc3f5460400194af22414d899725ba7656fafbd/R/week7-preparation.R#L58-L61>

<details>  
<summary>AI prompt</summary>  

The task is to parse the "DATE" variable of the `growth_us` data frame into date class. The current format is "YYYY-QQ", meaning that "2024-Q1" represents the quarter 1 of 2024.

Parse data frame `growth_use` 的"DATE"變數成為date class，它目前的格式為"YYYY-QQ", 例如"2024-Q1"即為"西元2024年的第1季"。
</details>


### 3. Taiwan Date

  - growth_tw.csv

<https://github.com/tpemartin/113-1-R/blob/9fc3f5460400194af22414d899725ba7656fafbd/R/week7-preparation.R#L86-L88>

<details>

<summary>AI prompt</summary>

Parse `PERIOD` variable of `growth_tw` data frame into date class. The current format is Taiwan date and the format is "ttt年第Q季", meaning "108年第1季" represents the first quarter of Taiwan year 108 (which is 2019).

Parse data frame `growth_tw` 裡的"統計期"變數成為date class, 它目前為台灣的日期且格式寫法為"ttt年第q季"，例如"108年第1季"即為西元2019年的第1季。
</details>
