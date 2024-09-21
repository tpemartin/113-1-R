# Task flow for data analysis

The standard workflow for data analysis in R is as follows:  

1. **Import data** (引入資料): Load the data into R.
2. **Tidy data** (清理資料): Clean and transform the data into a tidy format.
3. **Explore data** (探索資料): Understand the data by summarizing and visualizing it.
4. **Model data** （建立分析模型）: Fit statistical models to the data.
5. **Communicate results** （記錄結果）: Present the results in a clear and concise manner.

In introductory data analysis courses, the focus is often on the first three steps: importing, tidying, and exploring the data.

# AI Assistant

AI assistants are basically a remote chatbot. You have to bear in mind what he has known regarding your data.


![AI in the cloud](../img/computer-program-environment.png)


```diff
- Constantly remind yourself what that remote computer knows about your data.
```

Also when AI assists you for programming, he does not execute the code for you. He just gives you the code that you can run in your RStudio.

```diff
- You need to validate the code yourself
```

> Carefully craft your [preset prompt](https://classroom.google.com/c/NzExNTg4NDAwNDY3/m/NzE3ODI1NTI2Nzg1/details) (the first prompt you give to the AI assistant) to get the best results.

If you prefer AI to respond you in Chinese, you can: 

> Explanation should be in Taiwan Traditional Chinese.

After that, for each prompt, there are some principles to follow when asking for help from an AI assistant:

  1. **Clear direction**: Provide a clear and concise description of the task you want to accomplish.
  2. **Provide example**: Provide an example of the input data or code you are working with.  
  3. **Specify output/result format**: Specify the format of the output or result you want to achieve.
  4. **Divide task**: Divide your task into smaller tasks.
  5. **Evaluate quality**: Evaluate the quality of the code provided by the AI assistant.

# An example

## Task

Prepare a csv file for analysis in an English language class.

  - [Number of Aboriginal students and graduates in colleges and universities—by grade and school of 112th Academic Year](https://data.gov.tw/dataset/33514): currently in Chinese. This dataset contains information on the number of Aboriginal students and graduates in colleges and universities in Taiwan.


## Bad prompt

>  How to import 112native_A1-1.csv, and translate all variable names to English, and then exported as a csv file?

 - Vague direction (No context)  
 - No task division

***

Let's divide the task into three parts: 

  1. Import data;   
  2. translate variable names to English;  
  3. export the data as a csv file.  

## Import data

### Bad prompt

> How to import 112native_A1-1.csv

   - unformatted output

### Good prompt

> Import 112native_A1-1.csv as a dataframe called `native`

#### Data frame

Data frame is a two-dimensional data structure in R. It is a collection of vectors of the same length. Each vector represents a column in the data frame. Data frames are used to store tabular data.


![](https://r4ds.hadley.nz/images/tidy-1.png)

## Translate variable names to English

We want to transform all the variable names to English as well as its values.


### Bad prompt

> Translate all variable names to English

 - Vague direction (No context)
 - No example (AI does not execute the code for you. He does not know that is the current variable names in the dataset)


### Good prompt

> The current names of variables in `native` are in Chinese: 
>  [1] "學年度"                  "學校類別"                "學校代碼"               
 [4] "學校名稱"                "在學學生人數_博士班"     "在學學生人數_碩士班"    
 [7] "在學學生人數_學士班"     "在學學生人數_二專"       "在學學生人數_五專"      
[10] "上學年度畢業生人數_博士" "上學年度畢業生人數_碩士" "上學年度畢業生人數_學士"
[13] "上學年度畢業生人數_二專" "上學年度畢業生人數_五專
> Translate them to English


  - Clear direction.  
  - mention the object (i.e. `native`) to work on. This will preserve divided tasks' workflow continuity.
  - Provide example of the current variable names.

> You can run 
> ```
> names(native)
> ```
> to get the current variable names.


```diff
- Clear direction. Provide more context.  
- Divide your task into smaller tasks.
- Mention the object to work on. This will preserve divided tasks' workflow continuity.  
```

## Export the data as a csv file

### Bad prompt

> How to export as a csv file?

### Good prompt

> How to export `native` as a csv file named "native-112-en.csv" ?

# Exercise

Download [total_people_by_country sheet](https://docs.google.com/spreadsheets/d/1-jX-3EK_yspYDgPIy5vwnRKHntw9-dQIpFVhLc5JcXc/edit?gid=806824860#gid=806824860) from Google Sheets. Import the data as a dataframe called `flightDestination`. Translate all variable names to English. Export the data as a csv file named "flightDestination-en.csv".