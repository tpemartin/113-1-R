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

`survey`裡哪些變數應該要是factor class? 那些變數應該是ordered factor class? 該如何要求ChatGPT得到 「將它們轉換成factor/ordered factor class的程式碼」?   

## Levels of Factor/Ordered Factor

Available categories are called **levels**.  

  - use `levels()` to check the levels of a **factor class** variable.
  
### Exercise   

  1. 使用`levels()`查看所有factor/ordered factor變數的levels。  
  2. `年齡`變數的levels是什麼？有包含問卷所有年齡的可能值嗎（見下圖）？
  3. 

<img src="../img/2024-10-18-13-59-51.png" width="20%"/>


> If you don't provide level sequence, R will automatically design levels based on the data. (most of time it is wrong.)

> :exclamation: When parsing factor values always specify your level sequence, no matter it is ordered or not.

## Factor levels

  - **更改呈現順序**： Can be reordered, like previous exercise 2. （:exclamation:重新Parse一次，指定level順序）  
  - **更改類別名稱**：Can be renamed. (如"18歲以下"改成"0-17")  
  - **合併類別成大類別**：Can be grouped. (如"無工作", "兼職工作者", "全職工作者"改成"無工作", "有工作"兩類) 


### Exercise

  1. Parse `年齡`變數成為有"18歲以下", "18-22", "23-30", "31-40", "41+"四個levels的ordered factor。  
  2. Parse `工作狀態`變數成為levels順序為"無工作", "兼職工作者", "全職工作者"的factor。
  3. 將`年齡`變數的"18歲以下"改成"0-17"。  
  4. 將`工作狀態`變數的"全職工作"和"兼職工作者"合併成"有工作"。


## Numeric Cut
 
  - a numeric variable can be cut into groups, as a ordered factor variable.
  
### Exercise

將`survey`裡的`一週工時`變數用0, 6, 25, 30, 40, 100切成"0-6", "7-25", "26-30", "31-40", "40+"五個levels的ordered factor。

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