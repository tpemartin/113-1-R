# Tidy Variable Classes: Date/DateTime

  - Date class format
  - Datetime class format
  - Taiwan date format

## Date/DateTime

:exclamation: :exclamation: :exclamation:
  1. **Source (源頭) variable** should be in **character** class. (if not convert it to character class through  `as.character()`  )
  2. Must specify **writing format**, using (**Y, M, D, h, m, s**) to represent the year, month, day, hour, minute, and second digit.
  3. For date**time** parsing, must specify the **time zone** (時區) information.

## Date class

### Example: 112年傷亡道路交通事故資料 (112 Road Traffic Accident Data)

  - <https://data.gov.tw/dataset/167905>

<https://github.com/tpemartin/113-1-R/blob/a0ecb2a662b153a57fc5f9f6040591487aadaa68/R/week7-ee-preparation.R#L24-L27>

<details>
<summary>AI prompt</summary>

The task is to parse the "accident_date" column of the `trafficAccidents` data frame, which is currently in numeric format, into date class. The current format is `yyyymmdd`, meaning that `20160101` represents "2016-01-01".

Parse data frame `trafficAccidents` 的"發生日期"欄位（目前為數值格式）成為date class, 它目前的格式為yyyymmdd，例如20160101則代表"2016-01-01"。
</details>

<details>

<summary>code </summary>

<https://github.com/tpemartin/113-1-R/blob/a0ecb2a662b153a57fc5f9f6040591487aadaa68/R/week7-ee-preparation.R#L29-L32>

</details>

### Non daily date data

When the data is not daily, you need to specify the frequency of the date variable. For example, if the data is monthly, you need to specify the date format as "YYYY-MM". If the data is quarterly, you need to specify the date format as "YYYY-Qn". If the data is yearly, you need to specify the date format as "YYYY".

#### Monthly: 商品類期貨每月平均成交金額

  - <https://data.gov.tw/dataset/52801>
 
  
<details>

<summary>AI prompt</summary>  
Parse data frame `future` 的"資料年月"變數成為datet class，它目前的格式為"yyyymm", 例如"202409"為西元2024年9月。

</details>

#### Quarterly/Yearly

Similar just clearly specify your date format in the variable. 


### Taiwan Date

  - 經濟成長率（季）.csv

<details>

<summary>AI prompt</summary>

Parse data frame `growth` 裡的"統計期"變數成為date class, 它目前為台灣的日期且格式寫法為"ttt年第q季":
  1. 先將ttt轉成yyyy
  2. 形成yyyy-q格式 再去parse成date class

</details>

## Datetime class

 - <https://docs.google.com/spreadsheets/d/1nqjK0V_HHl1R5To8A2-G7p9YQAjfGgSwoawx2WEU4-8/edit?gid=0#gid=0>

<details>

<summary>AI prompt</summary>

Parse data frame `survey` 的"Timestamp"變數成為datetime class，它目前的格式為"mm/dd/yyyy hh:mm:ss", 例如"12/01/2016 12:00:00"

</details>

### time zone

  - value must show year, month and day.   
  - different countries have different date formats. For example, in the United States, the date format is MM/DD/YYYY, while in Europe, the date format is DD/MM/YYYY. In Taiwan, it is 西元YYYY年MM月DD日. Therefore, it is important to specify the date format when parsing date variables. 

> Before parsing,  
> If 民國年, you need to add 1911 to each year.
> When asking AI to parse date, always provide the date frequency annually, quarterly, monthly or daily.

> always provide the glimpse result of your data.

### Taiwan Macro database

  - <https://nstatdb.dgbas.gov.tw/dgbasall/webMain.aspx?k=dgmain>

Select a monthly or quarterly dataset, and parse the date variable.

## Datetime 

  - value must show year, month, day, and hour, minute, second, etc. Sometimes it also includes time zone information, such as "2021-10-01 12:00:00+UTC".   
  - if the time zone information is not provided, you need to specify. 


> You can use YYYY, MM, DD, hh, mm, ss, and timezone to specify the format of the datetime variable.


## Exercise

  - fill out the form <https://docs.google.com/forms/d/e/1FAIpQLSc0uF9KFXBRNeRukdPq-T-jQiCUDBAho4-UoyUNsNfLBBrMLw/viewform>  
  - Download the result <https://docs.google.com/spreadsheets/d/1nqjK0V_HHl1R5To8A2-G7p9YQAjfGgSwoawx2WEU4-8/edit?gid=0#gid=0>  
  
Import the data and parse it.