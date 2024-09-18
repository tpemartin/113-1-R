# Task flow for data analysis

The standard workflow for data analysis in R is as follows:  

1. **Import data**: Load the data into R.
2. **Tidy data**: Clean and transform the data into a tidy format.
3. **Explore data**: Understand the data by summarizing and visualizing it.
4. **Model data**: Fit statistical models to the data.
5. **Communicate results**: Present the results in a clear and concise manner.
6. **Reproducibility**: Document the analysis so that it can be reproduced.

In introductory data analysis courses, the focus is often on the first three steps: importing, tidying, and exploring the data.

# An example

We want to import some CSV file and translate all the variable names to English.

## Bad prompt

>  How to import 112native_A1-1.csv and translate all variable names to English?

 - Vague direction (No context)  
 - No task division

***

Let's divide the task into two parts: Import data and translate variable names to English.

## Import data

Download [Number of Aboriginal students and graduates in colleges and universities—by grade and school of 112th Academic Year](https://data.gov.tw/dataset/33514) from the Taiwan government open data portal. This dataset contains information on the number of Aboriginal students and graduates in colleges and universities in Taiwan.

### Bad prompt

> How to import 112native_A1-1.csv

   - unformatted output

### Good prompt

> Import 112native_A1-1.csv as a dataframe called `native`

   
![](https://r4ds.hadley.nz/images/tidy-1.png)

## Translate variable names to English

We want to transform all the variable names to English as well as its values.


### Bad prompt

> Translate all variable names to English

 - Vague direction (No context)


### Good prompt

> The current names of variables in `native` are in Chinese: 
>  [1] "學年度"                  "學校類別"                "學校代碼"               
 [4] "學校名稱"                "在學學生人數_博士班"     "在學學生人數_碩士班"    
 [7] "在學學生人數_學士班"     "在學學生人數_二專"       "在學學生人數_五專"      
[10] "上學年度畢業生人數_博士" "上學年度畢業生人數_碩士" "上學年度畢業生人數_學士"
[13] "上學年度畢業生人數_二專" "上學年度畢業生人數_五專
> Translate them to English


  - Clear direction
  - mention the object (i.e. `native`) to work on. This will preserve divided tasks' workflow continuity.


```diff
- Clear direction. Provide more context.  
- Divide your task into smaller tasks.
- Mention the object to work on. This will preserve divided tasks' workflow continuity.  

```

