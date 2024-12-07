# Group by analysis

## 2020 總統選舉

<https://github.com/tpemartin/113-1-R/blob/bed50bf8775a9263bca9885972d34fce9d5d14e0/R/week13-ee-preparation.R#L43-L50>

## 任務

  1. 創造 "政黨" 變數。 
  2. 計算各政黨在各縣市的得票率。  


# Pivot

### 長變寛


glimpse(result[1:2,])
Rows: 2
Columns: 3
$ 行政區別 <chr> "南投縣", "南投縣"
$ 政黨     <chr> "國民黨", "民進黨"
$ 得票率   <dbl> 44.72342, 50.82567
result pivot成寛的，得票率為值，政黨為欄位。

### 寛變長

 glimpse(result_wide[1:2,])
Rows: 2
Columns: 4
$ 行政區別 <chr> "南投縣", "嘉義市"
$ 國民黨   <dbl> 44.72342, 34.79022
$ 民進黨   <dbl> 50.82567, 61.37395
$ 親民黨   <dbl> 4.450915, 3.835833

將result_wide pivot成長的，$ 國民黨 到 $ 親民黨 欄位收成"政黨"欄位值，而原先欄位的值則變成"得票率"欄位值。