# Recap

  - survey sheets: <https://docs.google.com/spreadsheets/d/1RnT-dD0WAND8lS7v_nkhtnArBqChzLAqPJ3IKe0wSzA/edit?gid=766501006#gid=766501006>

## Import data

<https://github.com/tpemartin/113-1-R/blob/7b89795269816e5f046c45c61769aa86e4ea59a2/R/week9-preparation.R#L1-L10>

## Tidy data

Take hobby2 as and example:

### Rename columns

<https://github.com/tpemartin/113-1-R/blob/7b89795269816e5f046c45c61769aa86e4ea59a2/R/week9-preparation.R#L14-L24>

### Parse variables

> :exclamation: `<list>` variables must be converted into  character, numeric, or logical variables before futher parsing. 
> `<list>` happens when the question in survey has an open option (see [hobby2 survey](https://docs.google.com/forms/d/e/1FAIpQLSf-_2uQBtUCl-96lgpMXWj9UstcKFk2VCFL7ogvSytCqlaiMw/viewform)). 

<https://github.com/tpemartin/113-1-R/blob/7b89795269816e5f046c45c61769aa86e4ea59a2/R/week9-preparation.R#L26-L41>

Parse factor properly with specified levels:

<https://github.com/tpemartin/113-1-R/blob/7b89795269816e5f046c45c61769aa86e4ea59a2/R/week9-preparation.R#L43-L61>

## Summarize data

<https://github.com/tpemartin/113-1-R/blob/7b89795269816e5f046c45c61769aa86e4ea59a2/R/week9-preparation.R#L63>