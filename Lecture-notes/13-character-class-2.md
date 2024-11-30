# Character Class (2)

<https://github.com/tpemartin/113-1-R/blob/17c21d027143ffb312b22391221817808e043253/R/week12-ee.R#L1-L60>

## Pattern (REGEX)

![](../img/2024-11-28-09-32-50.png)

### Neghbors (look ahead / look behind)

 -  Preceded by / Not preceded by a neighbor pattern (前面要有 / 前面不能有 鄰居pattern).  
 -  Followed by / Not followed by a neighbor pattern (後面要有 / 後面不能有 鄰居pattern).

#### 1. github username

AI conversation:

<https://github.com/tpemartin/113-1-R/blob/b682de46a38023e0d548afb1fd80d4e5ea081b72/chat/regex-neighor.txt#L23-L37>

<details>

<summary> **Code** </summary>


<https://github.com/tpemartin/113-1-R/blob/17c21d027143ffb312b22391221817808e043253/R/week12-ee.R#L62-L68>

</details>

> :exclamation: if AI does not use the neighbor regex, you can ask it to use "look ahead" or "look behind" regex.

AI conversation:

<https://github.com/tpemartin/113-1-R/blob/b682de46a38023e0d548afb1fd80d4e5ea081b72/chat/regex-neighor.txt#L55-L68>

#### 2. Taiwan district

AI conversation without neighbor regex:

<https://github.com/tpemartin/113-1-R/blob/b682de46a38023e0d548afb1fd80d4e5ea081b72/chat/regex-neighor.txt#L70-L87>

<details>

<summary>**Code** without neighbor regex</summary>

<https://github.com/tpemartin/113-1-R/blob/17c21d027143ffb312b22391221817808e043253/R/week12-ee.R#L70-L76>

</details>


AI conversation with neighbor regex:

<https://github.com/tpemartin/113-1-R/blob/b682de46a38023e0d548afb1fd80d4e5ea081b72/chat/regex-neighor.txt#L89-L107>

<details>

<summary>**Code** with neighbor regex</summary>

<https://github.com/tpemartin/113-1-R/blob/17c21d027143ffb312b22391221817808e043253/R/week12-ee.R#L78-L81>

</details>

> :exclamation: Double check `{m, n}` for the number of characters if it includes the character you want to match. 



## Customized Emails

<https://github.com/tpemartin/113-1-R/blob/ecd01a72f060c46ce5eb17323412b596f6074fbd/R/week12-ee.R#L121-L134>

AI conversation:

<https://github.com/tpemartin/113-1-R/blob/1d356abc9cd6a081138bd84d5039b2abe7aca646/chat/regex-neighor.txt#L256-L313>

<details>

<summary>**Code**</summary>

<https://github.com/tpemartin/113-1-R/blob/1d356abc9cd6a081138bd84d5039b2abe7aca646/R/week12-ee.R#L178-L194>

</details>

> :exclamation: You can use `gmailr` package to send emails in R through your gmail. (<<https://github.com/r-lib/gmailr>>)

  - Use Google sheets to finish the job: <https://developers.google.com/apps-script/samples/automations/mail-merge>
