# Group by analysis

## 2020 Taiwan Presidential Election

<https://github.com/tpemartin/113-1-R/blob/e0f706bf398376c7d8381946c422ac990751baaa/R/week15-preparation.R#L103-L109>

## Tasks

  1. Create a "Party" variable based on the "Candidate" variable. 
  2. Compute the support rate of each party in each county based on "Votes_Received".  


# Pivot

<https://github.com/tpemartin/113-1-R/blob/e71e4b5365b842a05d59f04643c6d8ad63835b32/R/week15-preparation.R#L135-L139>

### Long pivot wider

```
glimpse(support_rate[1:2,])
Rows: 2
Columns: 4
$ Administrative_District <chr> "Changhua County", "Changhua County"
$ Party                   <chr> "Democratic Progressive Party", "Kuomintang"
$ Total_Votes             <int> 436336, 291835
$ Support_Rate            <dbl> 57.16959, 38.23679
Pivot `support_rate` into a wider format, with `Party` as the column names and `Support_Rate` as the values under the new columns.
```

> :exclamation: When pivot wider, keep only the necessary columns. Here it is `Administrative_District`, `Party`, and `Support_Rate`.


```
From `support_rate`, 
  1. keep only `Administrative_District`, `Party`, and `Support_Rate`; then  
  2. pivot into a wider format with `Party` as the column names and `Support_Rate` as the values under the new columns.  
```

```
Arrange the wide data frame by $ `Democratic Progressive Party` in descending order.
```

### Wide pivot longer

```
glimpse(support_rate_wide[1:2,])
Rows: 2
Columns: 4
$ Administrative_District        <chr> "Tainan City", "Chiayi County"
$ `Democratic Progressive Party` <dbl> 67.37823, 64.22012
$ Kuomintang                     <dbl> 29.10281, 32.15529
$ `People First Party`           <dbl> 3.518961, 3.624589
Pivot `support_rate_wide` into a longer format, with `Party` as the column names and `Support_Rate` as the values under the new `Party`.
```

> :exclamation: In most cases, 
>   - long format is for data exploration and analysis,  
>   - wide format is for publication purpose.  
