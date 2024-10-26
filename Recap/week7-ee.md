# Recap

## 課堂問卷引入

除了先下載CSV再上傳POSIT, 再`read_csv`引入, 也可以直接從Google Sheets引入：

<https://github.com/tpemartin/113-1-R/blob/1f337160cb5b45d8c4babc355f6a5ce191efd23e/R/week6-ee.R#L19-L22>

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

<https://github.com/tpemartin/113-1-R/blob/7091c87925b70e0a4ff603ec1783426a50b80a78/R/week6-ee.R#L71-L76>

## glimpse

<https://github.com/tpemartin/113-1-R/blob/5f14abb77fa9c26da6f45f560a91754af567f680/R/week6-ee.R#L78-L80>

## 變數名稱太長

> :exclamation: 問AI時告訴它目前的變數名稱是什麼，請它改成簡短的名稱（最好指定名稱格式是snake case還是camel case）。

<https://github.com/tpemartin/113-1-R/blob/5f14abb77fa9c26da6f45f560a91754af567f680/R/week6-ee.R#L82-L94>

## Exercise

請同學對class_feedback, job, hobby進行相關變數的factor/ordered factor parsing。