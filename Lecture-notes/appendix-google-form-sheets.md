# Google Form and Sheets

```mermaid
flowchart TD
    A[Create a Form] --> B[Link to Google Sheet]
    B --download/upload/import CSV or read_sheet--> C[Import to POSIT]
    C --> D[Analyze the Results]
    D --> E[Post result to Google Sheet]
    E --write_sheet--> B
```


## Create a Form

| <img src="../img/2024-10-19-12-55-02.png"> | <img src="../img/2024-10-19-12-55-35.png"> |
|--------------------------------------------|--------------------------------------------|
|step 1: click Forms icon|step 2: click Blank form|

***

Be aware of **Response** setting:

![](../img/2024-10-19-12-57-28.png)

## Link to Google Sheet

![](../img/2024-10-19-12-56-19.png)

## import to POSIT

```r
survey <- googlesheets4::read_sheet("Google Sheet URL",
    sheet="表單名稱")
```


## Analyze the Results

You can post result back to Google sheets: 

```r
googlesheets4::write_sheet(result, 
  "Google Sheet URL",
  sheet="表單名稱")
```

  - `result` is the result data frame you want to post back to Google Sheets.

## Publish your Google Sheets

### 1. 

![](../img/2024-10-19-15-19-15.png)

### 2. 

![](../img/2024-10-19-15-19-35.png)

### 3. 

Make sure you have the right permission:

![](../img/2024-10-19-15-20-20.png)

### 4.

![](../img/2024-10-19-15-20-38.png)