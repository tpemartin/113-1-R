# Tidy Variable Classes


## Example 

 - <https://docs.google.com/spreadsheets/d/1nqjK0V_HHl1R5To8A2-G7p9YQAjfGgSwoawx2WEU4-8/edit?gid=0#gid=0>


<https://github.com/tpemartin/113-1-R/blob/83de67627537dfab152844b98996bf8c2ffaf07f/R/week6-ee-preparation.R#L2-L3>


```
Rows: 17
Columns: 8
$ Timestamp                      <chr> "10/5/2024 10:31:…
$ 性別                           <chr> "男", "男", "男",…
$ 工作狀態                       <chr> "全職工作者", "兼…
$ 年齡                           <chr> "40+", "23-30", "…
$ 接觸過的程式                   <chr> "R, Python, JavaS…
$ 選這門課原因                   <chr> "興趣, 覺得對未來…
$ `課程建議（包含想學什麼課題）` <chr> NA, NA, NA, NA, N…
$ 一週工時                       <dbl> 40, 36, 35, 40, 5…
```

> :computer: For a **character class** variable, you can use `unique()` to find out all possible values.

### Exercise

使用`unique()`找出"年齡"變數（variable）的所有可能值。

<details>

<summary>code</summary>

<https://github.com/tpemartin/113-1-R/blob/d4d10bc0a694f8d3eaaaaa012bdf47b026555daf/R/week6-ee-preparation.R#L5>  

</details>

### mutate

  - to modify data frame variables. 

`mutate(data frame, ...)`： 針對data frame的變數進行轉換(), 其中 ... 是一連串的`變數= ...`的組合。

## Factor  

  - a factor variable is a categorical variable.
  
## Ordered factor  

  - an ordered factor is a categorical variable with a specific order.  


### Exercise  

`survey`裡哪些變數應該要是factor class? 那些變數應該是ordered factor class? 該如何要求ChatGPT得到 「將它們轉換成factor/ordered factor class的程式碼」?   

<details>

<summary>code</summary>

<https://github.com/tpemartin/113-1-R/blob/875cf2e49ac10c1c094e7e0b87f49159523a66fe/R/week6-ee-preparation.R#L9-L14>

</details>

## Levels of Factor/Ordered Factor

Available categories are called **levels**.  

  - use `levels()` to check the levels of a **factor class** variable.
  
### Exercise   

  1. 使用`levels()`查看所有factor/ordered factor變數的levels。  
  2. `年齡`變數的levels是什麼？有包含問卷所有年齡的可能值嗎（見下圖）？

<img src="../img/2024-10-18-13-59-51.png" width="20%"/>

<details>

<summary>code</summary>

<https://github.com/tpemartin/113-1-R/blob/875cf2e49ac10c1c094e7e0b87f49159523a66fe/R/week6-ee-preparation.R#L17-L19>

</details>

> If you don't provide level sequence, R will automatically design levels based on the data. (most of time it is wrong.)

> :exclamation: When parsing factor values always specify your level sequence, no matter it is ordered or not.

## Factor levels

  - **更改呈現順序**： Can be reordered, like previous exercise 2. 
  >  :exclamation: 重新Parse一次，但這次要設定`levels=`順序  


### Exercise

  1. Parse `年齡`變數成為有"18歲以下", "18-22", "23-30", "31-40", "41+"四個levels的ordered factor。  
  2. Parse `工作狀態`變數成為levels順序為"無工作", "兼職工作者", "全職工作者"的factor。

<details>

<summary>code</summary>

<https://github.com/tpemartin/113-1-R/blob/82b3fc39a4f3fe0127ede2d0ab1fc39bd0809104/R/week6-ee-preparation.R#L23-L41>

</details>


## Operations on Factor/Ordered Factor

> :exclamation: The following operations are only available for factor/ordered factor variables. If your variables are still characters, parse them into factor/ordered factor class.

With factor/ordered factor variables, you can perform the following operations:

  - **更改類別名稱**：Can be renamed. (如"18歲以下"改成"0-17")  
  - **合併類別成大類別**：Can be grouped. (如"無工作", "兼職工作者", "全職工作者"改成"無工作", "有工作"兩類) 

> :computer: :exclamation: 針對已經是factor/ordered factor的變數，透過`fct_recode`進行"改類別名稱"或"合併"（合併是多個類別名稱改成相同名稱）。

### Exercise 

  1. 將`年齡`變數的"18歲以下"改成"0-17"。  
  2. 將`工作狀態`變數的"全職工作"和"兼職工作者"合併成"有工作"。

<details>

<summary>code</summary>

<https://github.com/tpemartin/113-1-R/blob/82b3fc39a4f3fe0127ede2d0ab1fc39bd0809104/R/week6-ee-preparation.R#L44-L49>

</details>

## Numeric Cut

對於數值形的變數（假設有一個一週工時數值變數），很多時候我們喜歡如下的描述：

  - 有20%的學生一週工時在0-6小時，有30%的學生一週工時在7-25小時，有20%的學生一週工時在26-30小時，有20%的學生一週工時在31-40小時，有10%的學生一週工時在40小時以上。
  
這時候我們有必要對一週工時進行切割，讓它變成一個ordered factor，且有如下的levels:

  - "0-6", "7-25", "26-30", "31-40", "40+"

### Quartile (四分位數)

Quartiles are ranges that divide a dataset into four equal parts. Each part contains 25% of the data.

```r
summary(survey$一週工時)
```

shows:  
```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.00    1.50   35.50   25.94   40.00   70.00 
 ``` 

   - 25% of the data is less than 1.5 hours. (1st Qu. 第一分位數)  
   - 50% of the data is less than 35.5 hours. (Median 中位數)  
   - 75% of the data is less than 40 hours. (3rd Qu. 第三分位數)  
   - 100% of the data is less than 70 hours.  


### Exercise

將`survey`裡的`一週工時`變數用0, 6, 25, 30, 40, 100切成
  0-6, 6-25, 25-30, 30-40, 40-100, 五個levels的ordered factor。


<details>

<summary>code</summary>

<https://github.com/tpemartin/113-1-R/blob/b3a5b02c44806329856202acc9a21be6f518a4d1/R/week6-ee-preparation.R#L52-L55>

</details>

> :exclamation: `cut()` 每段不包含左邊界，包含右邊界，所以0-6不會包含0, 所以原本有0的資料會成為NA。

將`break`最小值改成-1，這樣就可以包含0了。




"0-6", "7-25", "26-30", "31-40", "40+"五個levels的ordered factor。

> :computer: :exclamation: 透過`cut()`將數值變數切割成ordered factor, 並且指定`labels=`為levels。

***

<details>

<summary>Ask AI</summary>

data fram `survey`的'一週工時'欄位是數整型變數，請產生一個對應的ordered factor型變數"一週工時類別"，分成以下類別"0-2","3-36","37-40","40+"。

</details>




## Exercise

引入以下的資料：
  
  - [臺北市政府警察局詐欺案件統計表](https://data.gov.tw/dataset/138892)

將"單位"Parse成factor, 將"發生件數"cut成"低"，"中"，"高"三個levels的ordered factor。