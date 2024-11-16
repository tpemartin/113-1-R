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

```r
write_csv(df, "df.csv")
```

> :exclamation: 注意datetime class variables會自動以ISO 8601格式儲存，並將時間轉換成為UTC時區儲存。

<https://github.com/tpemartin/113-1-R/blob/2521c828813b584a3c3d2663fb2c37b70e93e5ed/R/week10-ee-preparation.R#L46-L53>