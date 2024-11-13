# Recap

# Recap

將不同日期的資料轉換為date class（以yyyy-mm-dd格式顯示）。


<https://github.com/tpemartin/113-1-R/blob/e5173bddc57d144ec470ecef08afb245cbd2942d/R/week7-ee-inclass.R#L88-L90>

`glimpse(trafficAccidents$發生日期)` 顯示如下： 
 num [1:4495] 20230101 20230101 20230101 20230101 20230101 ...
`trafficAccidents$發生日期` 為yyyymmdd格式記錄的日期，將其轉換為date class.

<details>
<summary>Parsing程式</summary>

<https://github.com/tpemartin/113-1-R/blob/e5173bddc57d144ec470ecef08afb245cbd2942d/R/week7-ee-inclass.R#L93-L94>

</details>

***

<https://github.com/tpemartin/113-1-R/blob/e5173bddc57d144ec470ecef08afb245cbd2942d/R/week7-ee-inclass.R#L100-L102>

`glimpse(future$資料年月)` 顯示如下：
 num [1:243] 202409 202408 202407 202406 202405 ...
`future$資料年月` 為yyyymm格式記錄的日期，將其轉換為date class.

<details>
<summary>Parsing程式</summary>

<https://github.com/tpemartin/113-1-R/blob/e5173bddc57d144ec470ecef08afb245cbd2942d/R/week7-ee-inclass.R#L104-L105>

</details>

***


<https://github.com/tpemartin/113-1-R/blob/e5173bddc57d144ec470ecef08afb245cbd2942d/R/week7-ee-inclass.R#L111-L113>

`glimpse(growth$統計期)` 顯示如下：
 chr [1:24] "108年第1季" "108年第2季" "108年第3季" "108年第4季" "109年第1季" "109年第2季" "109年第3季" "109年第4季" ...
`growth$統計期` 為民國年的日期以ttt年第q季格式記錄的日期，將其轉換為date class.

<details>
<summary>Parsing程式</summary>

<https://github.com/tpemartin/113-1-R/blob/e5173bddc57d144ec470ecef08afb245cbd2942d/R/week7-ee-inclass.R#L115-L120>

</details>

***


<https://github.com/tpemartin/113-1-R/blob/e5173bddc57d144ec470ecef08afb245cbd2942d/R/week7-ee-inclass.R#L128-L130>


`glimpse(CPI$統計期)` 顯示如下：
 chr [1:71] "108年1月" "108年2月" "108年3月" "108年4月" "108年5月" "108年6月" "108年7月" "108年8月" "108年9月" ...
`CPI$統計期` 為民國年的日期以ttt年mm月格式記錄的日期，將其轉換為date class.

<details>
<summary>Parsing程式</summary>

<https://github.com/tpemartin/113-1-R/blob/e5173bddc57d144ec470ecef08afb245cbd2942d/R/week7-ee-inclass.R#L132-L137>

</details>

***

<https://github.com/tpemartin/113-1-R/blob/e5173bddc57d144ec470ecef08afb245cbd2942d/R/week7-ee-inclass.R#L142-L144>

`glimpse(exchangeRate$統計期)` 顯示如下：
 chr [1:74] "41年" "42年" "43年" "44年" "45年" "46年" "47年" "48年" "49年" "50年" "51年" "52年" "53年" "54年" "55年" ...
`exchangeRate$統計期` 為民國年的日期以ttt年格式記錄的日期，將其轉換為date class.

<details>
<summary>Parsing程式</summary>

<https://github.com/tpemartin/113-1-R/blob/e5173bddc57d144ec470ecef08afb245cbd2942d/R/week7-ee-inclass.R#L146-L150>

</details>

## 完整ChatGPT對話

  - <https://chatgpt.com/share/672d68d6-e43c-8006-bb64-21f215a80ec6>