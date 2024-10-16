# Tidy Variable Classes

## Example 

 - <https://docs.google.com/spreadsheets/d/1R8KcVs3VxG9V5yoDOex7g8b03m3DgZww845zUu3pGfM/edit?usp=sharing>

![](../img/2024-10-16-09-40-13.png)

Import the data as `survey` data frame, then run the following code.

```r
tidy_survey <- survey %>%
  rename(
    timestamp = `Timestamp`,
    gender = `Gender`,
    has_job = `Do you have a job?`,
    credits_taken = `How many course credits do you take in this semester?`,
    total_credits = `How many accumulative course credits have you acquired so far?`,
    year = `Which year are you in?`,
    programming_languages = `Have you learnt any of the following programming language(s)?`,
    registration_reason = `The reason you register at this course`
  )
```

> The code above is obtained through the following prompt:
> https://github.com/tpemartin/113-1-R/blob/1d40e207fccb9f22f2c84a77ef08823bb9491897/chat/survey-rename.txt#L14-L23


## Factor  

  - a factor variable is a categorical variable.
  - available categories are called **levels**.  

> If you don't provide levels, R will automatically generate levels based on the data.  
  
## Ordered factor  

  - an ordered factor is a categorical variable with a specific order.  
  - available categories are called **levels**.  
  
> If you don't provide level sequence, R will automatically generate levels based on the data. (most of time it is wrong.)

> :exclamation: When parsing factor values always specify your level sequence, no matter it is ordered or not.

## Factor levels

  - Can be renamed.   
  - Can be reordered.  
  - Can be grouped.  

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