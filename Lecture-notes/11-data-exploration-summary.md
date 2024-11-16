# Data exploration: summary and comparison

<https://github.com/tpemartin/113-1-R/blob/84376fb8032ce3f57111b8078361c824bc98da18/R/week10-ee-preparation.R#L29-L69>

## AI framing

glimpse(survey[1:2,]) shows the first two rows of the survey data. 

Rows: 2
Columns: 8
$ Timestamp                                                        <dttm> 2024-10-16 09:17:30, 2024-10-16 09:34:16
$ Gender                                                           <fct> Male, Male
$ `Do you have a job?`                                             <fct> Full-time job, Part-time job
$ `How many course credits do you take in this semester?`          <dbl> 3, 16
$ `How many accumulative course credits have you acquired so far?` <fct> "31-60", "91-120"
$ `Which year are you in?`                                         <ord> Year 5 and above, Junior  (三年級）
$ `Have you learnt any of the following programming language(s)?`  <chr> "R, Python, JavaScript", "None"
$ `The reason you register at this course`                         <chr> "Interest", "Interest"

Any following task regarding `survey` will be based on the above dataframe structure.