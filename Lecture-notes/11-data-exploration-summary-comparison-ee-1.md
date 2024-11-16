# Data exploration 1: comparison

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

<https://github.com/tpemartin/113-1-R/blob/3d454aa49bc1cf7f345caeda2e4c4e334a0aaf5d/R/week10-ee-preparation.R#L154-L161>

> :exclamation: If there is an error from `fileter()` function, use `dplyr::filter()` instead.

<https://github.com/tpemartin/113-1-R/blob/3d454aa49bc1cf7f345caeda2e4c4e334a0aaf5d/R/week10-ee-preparation.R#L154-L161>

***

<https://github.com/tpemartin/113-1-R/blob/3d454aa49bc1cf7f345caeda2e4c4e334a0aaf5d/R/week10-ee-preparation.R#L172-L180>

***

<https://github.com/tpemartin/113-1-R/blob/3d454aa49bc1cf7f345caeda2e4c4e334a0aaf5d/R/week10-ee-preparation.R#L182-L191>

***

<https://github.com/tpemartin/113-1-R/blob/3d454aa49bc1cf7f345caeda2e4c4e334a0aaf5d/R/week10-ee-preparation.R#L193-L200>

> :exclamation: <dttm> either compare to "yyyy-mm-dd hh:mm:ss" format string as in the same time zone, or compare to `lubridate::ymd_hms("yyyy-mm-dd hh:mm:ss", tz="another time zone")` when comparing to a different time zone.

***

<https://github.com/tpemartin/113-1-R/blob/3d454aa49bc1cf7f345caeda2e4c4e334a0aaf5d/R/week10-ee-preparation.R#L202-L206>

> :exclamation: `<chr> == ` comparison only works for **exact match**. 

## check box

### What items are checked?

`survey_ee$接觸過的程式`來自於調查問卷中的check box題型，找出目前有那些題項有被勾選。

### Specific item checked

`survey_ee$接觸過的程式`來自於調查問卷中的check box題型，誰有勾"Python"這個選項。