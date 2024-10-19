# Google Form and Sheets

```mermaid
flowchart TD
    A[Create a Form] --> B[Link to Google Sheet]
    B --> C[Import to POSIT]
    C --> D[Analyze the Results]
    D --write_sheet--> B
```


## Create a Form

![](../img/2024-10-19-12-55-02.png)

![](../img/2024-10-19-12-55-35.png)

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