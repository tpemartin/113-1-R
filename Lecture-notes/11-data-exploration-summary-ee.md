# Data exploration: summary and comparison

<https://github.com/tpemartin/113-1-R/blob/3bed919035d7ef5f1818aea37cc1a1755e962e75/R/week10-ee-preparation.R#L108-L133>

## AI framing

glimpse(survey_ee[1:2, ])
Rows: 2
Columns: 8
$ Timestamp                      <dttm> 2024-10-05 10:31:41, 2024-10-05 14:38:20
$ 性別                           <fct> 男, 男
$ 工作狀態                       <fct> 全職工作者, 兼職工作者
$ 年齡                           <fct> 40+, 23-30
$ 接觸過的程式                   <chr> "R, Python, JavaScript", "無（第一次接觸）"
$ 選這門課原因                   <chr> "興趣, 覺得對未來生涯發展很重要,", "興趣, 覺得對未來生涯發展很重要"
$ `課程建議（包含想學什麼課題）` <chr> NA, NA
$ 一週工時                       <dbl> 40, 36
以下的任務如果涉及到 `survey_ee` 請以上述的資料框架結構為基礎來回應。

## 比較： 等於，不等於，大於，小於，大於等於，小於等於



在`survey_ee`資料裡，

  1. `性別`中"男"，"女"各佔多少比例？  
  2. 不同`性別`中，他們的`工作狀態`是否有顯著差異？