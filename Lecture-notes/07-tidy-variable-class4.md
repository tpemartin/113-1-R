# Tidy Variable Classes: Datetime class

## Date time information

Date time string is like "2021-10-01 12:00:00". It includes year, month, day, hour, minute, and second. Again, it is important to specify the format of the date time string when parsing it. When ask AI to how to parse, 

  - Describe your current date time string format using y, m, d, h, m, s (描述日期時間格式). For example, "2021-10-01 12:00:00" can be specified as "yyyy-mm-dd hh:mm:ss".  
  - Specify time zone (指定時區) -- unless the date time string already includes time zone information.  


## Example

Ask AI: 

Parse a date time string "2021-10-01 12:00:00" into datetime class. It is currently in "yyyy-mm-dd hh:mm:ss" format. The time zone is Taiwan time zone.

## Example

<https://github.com/tpemartin/113-1-R/blob/915dfc9992da70f2069069b4aade9f6f24a507fe/R/week9-ee-preparation.R#L2-L4>

`survey$Timestamp`目前為character class, 以"mm/dd/yyyy hh:mm:ss"寫法表示的日期時間，如"01/01/2023 14:08:00"代表"2023-01-01 14:08:00", 時區為台灣時區。將它parse成datetime class。

<details>
<summary>Parsing code</summary>

<https://github.com/tpemartin/113-1-R/blob/915dfc9992da70f2069069b4aade9f6f24a507fe/R/week9-ee-preparation.R#L9-L12>

</details>

## hms string format

When parsing time, the time string format must be "hh:mm:ss". For example, "14:08:00". If the time string format is not "hh:mm:ss", you need to convert it to "hh:mm:ss" before parsing.

We use AI preset to ensure that the string format is "hh:mm:ss" before parsing.
> For time, use `hms` to parse. But if the value before parsing is not in "hh:mm:ss" format, change it to that format before parsing.

***

### example

<https://github.com/tpemartin/113-1-R/blob/a72eee0d8a77b7017effbed26223afde403605eb/R/week9-ee-preparation.R#L27-L29>

`example_data$date_time_string`目前為character class, 以"yyyy-mm-dd hhmmss"寫法表示的日期時間，如"20230101 140800"代表"2023-01-01 14:08:00"的台灣時區日期時間。將它parse成datetime class。

<details>
<summary>Parsing code</summary>

<https://github.com/tpemartin/113-1-R/blob/a72eee0d8a77b7017effbed26223afde403605eb/R/week9-ee-preparation.R#L40-L47>

</details>

### example

<https://github.com/tpemartin/113-1-R/blob/a72eee0d8a77b7017effbed26223afde403605eb/R/week9-ee-preparation.R#L57-L58>


`trafficAccidents` data frame 有以下欄位：
$ 發生日期      <dbl> 20230101, 20230101
$ 發生時間      <chr> "140800", "140800"

產生一個新的欄位"日期時間"，它是由"發生日期"和"發生時間"組成的台灣時區date time class，其中：

  - 發生日期: 目前為numberic class, 以yyyymmdd格式表示的日期，如20230101代表"2023-01-01"日 
  - 發生時間: 目前為character class且以hhmmss寫法表示的時間， 如"140800"代表"14:08:00"

<details>
<summary>Parsing code</summary>

<https://github.com/tpemartin/113-1-R/blob/a72eee0d8a77b7017effbed26223afde403605eb/R/week9-ee-preparation.R#L69-L75>

</details>

