# Recap

將不同日期的資料轉換為date class（以yyyy-mm-dd格式顯示）。


<https://github.com/tpemartin/113-1-R/blob/d40e93e13ab28b2ffa37bec234bb8585ce6fc45d/R/week7-in-class.R#L6-L8>

`glimpse(trafficAccidents$accident_date)` shows： 
 num [1:4495] 20230101 20230101 20230101 20230101 20230101 ...
`trafficAccidents$accident_date` which is in yyyymmdd format, convert it to date class.

<details>
<summary>Parsing code</summary>

<https://github.com/tpemartin/113-1-R/blob/d40e93e13ab28b2ffa37bec234bb8585ce6fc45d/R/week7-in-class.R#L11-L14>

</details>

***

<https://github.com/tpemartin/113-1-R/blob/d40e93e13ab28b2ffa37bec234bb8585ce6fc45d/R/week7-in-class.R#L18-L20>

`glimpse(future$YEARMONTH)` shows: 
 num [1:243] 202409 202408 202407 202406 202405 ...
`future$YEARMONTH` which is in yyyymm format, convert it to date class.

<details>
<summary>Parsing code</summary>

<https://github.com/tpemartin/113-1-R/blob/d40e93e13ab28b2ffa37bec234bb8585ce6fc45d/R/week7-in-class.R#L22-L23>

</details>

***


<https://github.com/tpemartin/113-1-R/blob/d40e93e13ab28b2ffa37bec234bb8585ce6fc45d/R/week7-in-class.R#L29-L31>

`glimpse(growth$PERIOD)` shows: 
 chr [1:24] "108年第1季" "108年第2季" "108年第3季" "108年第4季" "109年第1季" "109年第2季" "109年第3季" "109年第4季" ...
`growth$PERIOD` is quarterly **Taiwan** date in "yyy年第q季" format, convert it to date class.

<details>
<summary>Parsing code</summary>

<https://github.com/tpemartin/113-1-R/blob/d40e93e13ab28b2ffa37bec234bb8585ce6fc45d/R/week7-in-class.R#L33-L41>

</details>

***


<https://github.com/tpemartin/113-1-R/blob/b14d0f0c4920d6cd54262995276af81d4b4494ff/R/week7-in-class.R#L45-L48>


`glimpse(CPI$PERIOD)` shows: 
 chr [1:71] "108年1月" "108年2月" "108年3月" "108年4月" "108年5月" "108年6月" "108年7月" "108年8月" "108年9月" ...
`CPI$PERIOD` is monthly **Taiwan** date in "yyy年m月" format, convert it to date class.

<details>
<summary>Parsing code</summary>

<https://github.com/tpemartin/113-1-R/blob/d40e93e13ab28b2ffa37bec234bb8585ce6fc45d/R/week7-in-class.R#L50-L57>

</details>

***

<https://github.com/tpemartin/113-1-R/blob/d40e93e13ab28b2ffa37bec234bb8585ce6fc45d/R/week7-in-class.R#L60-L62>

`glimpse(exchangeRate$PERIOD)` shows: 
 chr [1:74] "41年" "42年" "43年" "44年" "45年" "46年" "47年" "48年" "49年" "50年" "51年" "52年" "53年" "54年" "55年" ...
`exchangeRate$PERIOD` is yearly Taiwan date in "yyy年" format, convert it to date class.

<details>
<summary>Parsing code</summary>

<https://github.com/tpemartin/113-1-R/blob/d40e93e13ab28b2ffa37bec234bb8585ce6fc45d/R/week7-in-class.R#L64-L71>

</details>

## Complete ChatGPT Chat

  - <https://github.com/tpemartin/113-1-R/blob/main/chat/date-example.txt>