# Recap

## Import and parsing

<https://github.com/tpemartin/113-1-R/blob/d7b1344a55d412f9c5a32cbd9c1752f785ca1541/R/week13-preparation.R#L1-L18>

## equal (`==`), not equal (`!=`)

<https://github.com/tpemartin/113-1-R/blob/d7b1344a55d412f9c5a32cbd9c1752f785ca1541/R/week13-preparation.R#L21-L24>

***

<https://github.com/tpemartin/113-1-R/blob/d7b1344a55d412f9c5a32cbd9c1752f785ca1541/R/week13-preparation.R#L26-L27> 

> :exclamation: for character class(字串) `==` means the whole string is equal, not partially equal. "Hi, my name is Martin" is not equal to "Martin".

> :exclamation: When process check box answers, tell AI it comes from check box.

> `survey_ee$device_used_last_week` comes from a check box question in a Google Form survey. Who has checked "手機" option?

<survey_ee |>
  dplyr::filter(str_detect(device_used_last_week,"手機"))>



