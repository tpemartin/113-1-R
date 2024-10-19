# Appendix: Pipe Operator

In R, there are two pipe operators: `%>%` and `|>` -- they are mostly the same. But `%>%` will eventually be replaced by `|>` in the future. 

## Usage

The pipe operator is used to pass the output of one function to the input of another function. 

A function call is written as 

  -  `function_name(argument)`. 
  
With the pipe operator, you can write it as

  -  `argument %>% function_name()`; or
  -  `argument |> function_name()`.


## Example

```r
# read csv file
survey <- read_csv("survey.csv")

# pipe operator version
survey <- "survey.csv" %>% read_csv()
```

```r
# glimpse
glimpse(survey)  

# pipe operator version
survey %>% glimpse()
```


> :exclamation: The pipe operator only works with functions that have a first argument, and only the first argument can be replaced by the left-hand side of the pipe operator.


```r
# read csv with skip  
survey <- read_csv("survey.csv", skip = 1)  

# pipe operator version
survey <- "survey.csv" %>% read_csv(skip = 1)
```