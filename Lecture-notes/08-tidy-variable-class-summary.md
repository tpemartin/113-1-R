# Tidy Variable Classes: Summary


Data frame comes with variables (usually) in `<chr>`, `<dbl>`, `<lgl>` classes. It is important to check the class of each variable and convert them to the correct class if necessary.


glimpse(df) shows:
```            
$ Chr <chr> "1", "2", "3"
$ Num <dbl> 1, 2, 3
$ Lgl <lgl> TRUE, FALSE, TRUE
$ Date1 <chr> "2021-10-01", "2021-10-02", "2021-10-03"
$ Date2 <chr> "Jan 1, 2021", "Jan 2, 2021", "Jan 3, 2021"
$ DateTime1 <chr> "2021-10-01 12:00:00", "2021-10-02 12:00:00", "2021-10-03 12:00:00"
$ DateTime2 <chr> "Jan 1, 2021 12:00:00", "Jan 2, 2021 12:00:00", "Jan 3, 2021 12:00:00"
$ Factor <chr> "cat", "dog", "bird"
$ OrderFactor <chr> "less than 10", "more than 10", "less than 10"
```

<details>
<summary>Code to generate df</summary>

<https://github.com/tpemartin/113-1-R/blob/bdf6484e4bb1c84a5e602b3f54e578fbc11a04ad/R/week9-ee-preparation.R#L95-L115>

</details>

Convert variables to the correct class:

```r
library(tidyverse)
df <- df |>
  mutate(
    Date1 = ymd(Date1),
    Date2 = mdy(Date2),
    DateTime1 = ymd_hms(DateTime1, tz="Asia/Taipei"),  
    DateTime2 = mdy_hms(DateTime2, tz="Asia/Taipei"),  
    Factor = factor(Factor, levels = c("cat", "dog", "bird")),
    OrderFactor = factor(OrderFactor, levels = c("less than 10", "more than 10"), ordered=TRUE)
  )
```

  - Parsing functions regarding date and date time can be `ymd`, `mdy`, `ymd_hms`, `mdy_hms`, etc, depending on the format of the date.   

## Save data

After tidying up the variable classes, it is a good practice to save the data frame as an RDS file. 

```r
saveRDS(df, "df.rds")
```

Next time you can load the data frame with:

```r
df <- readRDS("df.rds")
```

the data frame will be loaded with the correct variable classes.

## Share data

RDS file is for R users. You can share that file with others who use R. 

If you want to share the data with non-R users, you can save the data frame as a CSV file.

*** 

:exclamation: :exclamation: :exclamation:  
  - For datetime variables, it is better to save them as character variables in ISO 8601 format with timezone information. 
  - If you want to share the data internationally, it is better to save the datetime variables in UTC timezone.  

***

:robot: AI prompt:
<https://github.com/tpemartin/113-1-R/blob/2bcf4ae5298ac67407290755cffe99ba04d4bf0a/chat/week9-ee-preparation.txt#L19-L32>


## Exercise

Use the parsed survey data to create an RDS file and a CSV file. 
