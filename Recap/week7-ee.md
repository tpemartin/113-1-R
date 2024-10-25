# Recap

## 課堂問卷引入

除了先下載CSV再上傳POSIT, 再`read_csv`引入, 也可以直接從Google Sheets引入：

<https://github.com/tpemartin/113-1-R/blob/4dca40748c5576bd0d3927e56062d2aed94ee65c/R/week6-ee.R#L19-L20>

## Parsing類別變數成為Factor/Ordered Factor

<https://github.com/tpemartin/113-1-R/blob/4dca40748c5576bd0d3927e56062d2aed94ee65c/R/week6-ee.R#L25-L30>

  - `survey %>%` 由survey data frame開始,  
  - `mutate()` 進行變數轉換:
    - `` `性別` = factor(`性別`) `` "性別"的值Parsed成factor class，才存在"性別"的欄位。其他的理解依此類推。  
    - `` `年齡` = factor(`年齡`, ordered = TRUE) `` "年齡"的值Parsed成ordered factor class，才存在"年齡"的欄位。其他的理解依此類推。


## Factor parsing最好指定levels

指定levels的好處是，可以確保factor/ordered factor的levels"順序"是你想要的。

<https://github.com/tpemartin/113-1-R/blob/25b81d25500a7d9f1d2b1aebe98a7949277445f7/R/week6-ee.R#L39-L44>

## 同學設計問卷

### 引入

<https://github.com/tpemartin/113-1-R/blob/7091c87925b70e0a4ff603ec1783426a50b80a78/R/week6-ee.R#L71-L75>

## glimpse



變數名稱太長