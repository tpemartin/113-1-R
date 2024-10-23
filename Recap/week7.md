# Recap

  - How to import from Google Sheets  

<https://docs.google.com/spreadsheets/d/1R8KcVs3VxG9V5yoDOex7g8b03m3DgZww845zUu3pGfM/edit?gid=0#gid=0>

## Save as CSV

![](../img/2024-10-23-08-58-46.png)

## Import from CSC

Import and glimpse

<https://github.com/tpemartin/113-1-R/blob/add646ba9b31da9b6f779108adb784d6c1199fe0/R/week7-recap.R#L1-L4>


## Change variable names

<https://github.com/tpemartin/113-1-R/blob/0594d2a042d676917b3d80475fe3338d57bc9e37/R/week7-recap.R#L6C1-L18>

```
Rows: 41
Columns: 8
$ timestamp             <chr> "10/16/2024 9:17:30", "10…
$ gender                <chr> "Male", "Male", "Male", "…
$ has_job               <chr> "Full-time job", "Part-ti…
$ course_credits        <dbl> 3, 16, 19, 18, 21, 8, 20,…
$ accum_credits         <chr> "31-60", "91-120", "0 (Fr…
$ year_in_school        <chr> "Year 5 and above", "Juni…
$ programming_languages <chr> "R, Python, JavaScript", …
$ course_reason         <chr> "Interest", "Interest", "…
```

<https://github.com/tpemartin/113-1-R/blob/0594d2a042d676917b3d80475fe3338d57bc9e37/R/week7-recap.R#L20-L22>

```
    gender            has_job         
 Length:41          Length:41         
 Class :character   Class :character  
 Mode  :character   Mode  :character  
 year_in_school    
 Length:41         
 Class :character  
 Mode  :character  
```


## Parsing factor variables

<https://github.com/tpemartin/113-1-R/blob/0594d2a042d676917b3d80475fe3338d57bc9e37/R/week7-recap.R#L25-L33>


```
Rows: 41
Columns: 8
$ timestamp             <chr> "10/16/2024 9:17:30", "10…
$ gender                <fct> Male, Male, Male, Male, M…
$ has_job               <fct> Full-time job, Part-time …
$ course_credits        <dbl> 3, 16, 19, 18, 21, 8, 20,…
$ accum_credits         <chr> "31-60", "91-120", "0 (Fr…
$ year_in_school        <fct> Year 5 and above, Junior …
$ programming_languages <chr> "R, Python, JavaScript", …
$ course_reason         <chr> "Interest", "Interest", "…
```

<https://github.com/tpemartin/113-1-R/blob/0594d2a042d676917b3d80475fe3338d57bc9e37/R/week7-recap.R#L34-L36>

```
    gender                          has_job  
 Female:20   Full-time job              : 1  
 Male  :21   No job. (Full-time student):28  
             Part-time job              :12  
                                             
                                             
              year_in_school
 Freshman (一年級）  :31    
 Junior  (三年級）   : 2    
 Senior（四年級）    : 1    
 Sophomore （二年級）: 5    
 Year 5 and above    : 2    
```

