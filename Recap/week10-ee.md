# Recap


<https://github.com/tpemartin/113-1-R/blob/84376fb8032ce3f57111b8078361c824bc98da18/R/week9-ee-preparation.R#L93-L116>

## Parsing

<https://github.com/tpemartin/113-1-R/blob/84376fb8032ce3f57111b8078361c824bc98da18/R/week9-ee-preparation.R#L118-L128>

## Save as RDS

```r
saveRDS(df, "df.rds")
```

```r
df <- readRDS("df.rds")
```

## Save as CSV

When you need to pass the files to non-R users. 


AI preset>>
> When asked to save a data frame as CSV, if I did not provide the `glimpse()` of the data frame, ask me for the `glimpse()` of the data frame. Once you know the structure of the data frame,  be aware that the datetime class variables should be saved as in ISO 8601 format with time zone specified as the time zone it is currently set. 

