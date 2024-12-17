# Group by analysis

## 2020 Taiwan Presidential Election

<https://github.com/tpemartin/113-1-R/blob/e0f706bf398376c7d8381946c422ac990751baaa/R/week15-preparation.R#L103-L109>

## Tasks

  1. Create a "Party" variable based on the "Candidate" variable. 
  2. Compute the support rate of each party in each county based on "Votes_Received".  


# Pivot

<https://github.com/tpemartin/113-1-R/blob/f77d40d16912a64bd904d12512ad26433199d44c/R/week13-ee-preparation.R#L70-L73>

### 長變寛

```
glimpse(result[1:2,])
Rows: 2
Columns: 3
$ 行政區別 <chr> "南投縣", "南投縣"
$ 政黨     <chr> "國民黨", "民進黨"
$ 得票率   <dbl> 44.72342, 50.82567
result pivot成寛的資料框result_wide，$ 政黨的值會變成欄位名稱，而新的欄位底下的值則為得票率。
```

### 寛變長

```
 glimpse(result_wide[1:2,])
Rows: 2
Columns: 4
$ 行政區別 <chr> "南投縣", "嘉義市"
$ 國民黨   <dbl> 44.72342, 34.79022
$ 民進黨   <dbl> 50.82567, 61.37395
$ 親民黨   <dbl> 4.450915, 3.835833

將result_wide pivot成長的，$ 國民黨 到 $ 親民黨 欄位收成"政黨"欄位值，而原先欄位的值則變成"得票率"欄位值。
```