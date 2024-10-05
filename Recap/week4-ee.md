# Task Flow

There is a dataset called `112native_A1-1.csv`. I want to import it, change the variable names to traditional Chinese, and export it to `112native_A1-1-en.csv`.

> Remember one AI prompt guideline is "Divide Task"

## Task flow chart

One way to divide the task is to create a flow chart. 

```mermaid
graph TD;
  A[Import 112native_A1-1.csv] --> B[Rename variable names to traditional Chinese];
    B --> C[Export as 112native_A1-1-en.csv];
```

## Turn the flow chart into divided tasks

1. Import 112native_A1-1.csv as a dataframe called `native`.  
2. Rename variable names to traditional Chinese.  
3. Export the data as a csv file.

> For 2, a suggested prompt is:
>
> In the global environment, there is a dataframe called `native` whose variable names are in Chinese. Rename them to English. The current chinese names are:
[1] "學年度" "學校類別" "學校代碼"
[4] "學校名稱" "在學學生人數_博士班" "在學學生人數_碩士班"
[7] "在學學生人數_學士班" "在學學生人數_二專" "在學學生人數_五專"
[10] "上學年度畢業生人數_博士" "上學年度畢業生人數_碩士" "上學年度畢業生人數_學士"
[13] "上學年度畢業生人數_二專" "上學年度畢業生人數_五專

  - The design of this prompt is consider the AI's memory. The AI does not know the content of the data.

> For 3, a better prompt is:
> Export the dataframe `native` as a csv file called `112native_A1-1-en.csv`.

## Turn the tasks into prompts

Constantly check if your prompt design follows the AI prompt guidelines.


  1. **Clear direction**: Provide a clear and concise description of the task you want to accomplish.
  2. **Provide example**: Provide an example of the input data or code you are working with.  
  3. **Specify output/result format**: Specify the format of the output or result you want to achieve.
  4. **Divide task**: Divide your task into smaller tasks.
  5. **Evaluate quality**: Evaluate the quality of the code provided by the AI assistant.

> Constantly bear in mind what inside AI's brain which is different from your local computer, and is different from the POSIT remote server. 
>
> Only the past chat history is stored in AI's memory. 
>
> AI can not execute your code. It can only provide you with code snippets. Therefore, the content of your data is not available to AI. Unless you clearly specify it in the prompt.


![](../img/computer-program-environment.png)

## Program


<https://github.com/tpemartin/113-1-R/blob/d80d1403cbe15ba0bbe6960863f88583a4ed8573/R/week2.R#L1-L29>