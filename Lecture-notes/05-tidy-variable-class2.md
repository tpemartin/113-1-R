# Tidy Variable Classes

## Example 

 - <https://docs.google.com/spreadsheets/d/1nqjK0V_HHl1R5To8A2-G7p9YQAjfGgSwoawx2WEU4-8/edit?gid=0#gid=0>


<https://github.com/tpemartin/113-1-R/blob/83de67627537dfab152844b98996bf8c2ffaf07f/R/week6-ee-preparation.R#L2-L3>


```
Rows: 17
Columns: 8
$ Timestamp                      <chr> "10/5/2024 10:31:…
$ 性別                           <chr> "男", "男", "男",…
$ 工作狀態                       <chr> "全職工作者", "兼…
$ 年齡                           <chr> "40+", "23-30", "…
$ 接觸過的程式                   <chr> "R, Python, JavaS…
$ 選這門課原因                   <chr> "興趣, 覺得對未來…
$ `課程建議（包含想學什麼課題）` <chr> NA, NA, NA, NA, N…
$ 一週工時                       <dbl> 40, 36, 35, 40, 5…
```

> :computer: For a **character class** variable, you can use `unique()` to find out all possible values.

### Exercise

使用`unique()`找出"年齡"變數（variable）的所有可能值。

## Factor  

  - a factor variable is a categorical variable.
  
## Ordered factor  

  - an ordered factor is a categorical variable with a specific order.  
  


### Exercise  

`survey`裡那些變數應該要是factor class? 那些變數應該是ordered factor class? 該如何要求ChatGPT得到 「將它們轉換成factor/ordered factor class的程式碼」?   
  


## Levels of Factor/Ordered Factor

Available categories are called **levels**.  

  - use `levels()` to check the levels of a **factor class** variable.
  
### Exercise   

  1. 使用`levels()`查看所有factor/ordered factor變數的levels。  
  2. `年齡`變數的levels是什麼？有包含問卷所有年齡的可能值嗎？

<img src="../img/2024-10-17-11-44-05.png" width="10%"/>

![](../img/2024-10-17-11-44-05.png)



> If you don't provide level sequence, R will automatically design levels based on the data. (most of time it is wrong.)

> :exclamation: When parsing factor values always specify your level sequence, no matter it is ordered or not.

### Exercise

Which variables in `tidy_survey` are ordered factor variables? How do you ask ChatGPT to parse them into ordered factor?

## Factor levels

  - Can be reordered.  
  - Can be renamed.   
  - Can be grouped.  

### Exercise

  - Reorder the levels of `year` to "Freshman (一年級）", "Sophomore （二年級）", "Junior  (三年級）", "Senior（四年級）", and "Year 5 and above".
  - Rename the levels of `year` into "year 1", "year 2", "year 3", "year 4", and "year 5+".
  - Regroup the levels of  `total_credits` into the following three levels:  
    - "Less than 30", "30 to 90", and "More than 90".

## Numeric Cut
 
  - a numeric variable can be cut into groups, as a ordered factor variable.
  
### Exercise

In `tidy_survey`, cut the `credits_taken` variable into three groups: "Less than 22" and "22 to 24", and "More than 24", and saved under a new variable named `credits_taken_group`.

## Date

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