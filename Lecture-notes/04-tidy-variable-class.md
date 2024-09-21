# Tidy variable class

## Types of variables

In R data frame, variables can be classified into two types:

1. **Character**: A character variable is a string of characters. It is used to store text data.
2. **Numeric**: A numeric variable is used to store numerical data. It can be either integer or double.
3. **Logical**: A logical variable is used to store logical data. It can take on the values TRUE or FALSE.

```r
# Load the tidyverse package
library(tidyverse)

# Create an example data frame with 10 observations
example_df <- tibble(
  Name = c("Alice", "Bob", "Charlie", "Diana", "Ethan", 
           "Fiona", "Greg", "Hannah", "Ian", "Jasmine"),  # Pure character variable
  Date_of_Birth = c("1990-01-01", "1985-06-15", "1992-11-23", 
                    "1988-04-05", "1995-02-28", "1991-12-10", 
                    "1989-07-19", "1993-09-25", "1994-05-15", 
                    "1990-03-30"),  # Character variable with date information
  BloodType = c("A", "B", "O", "AB", "B",  
                "A", "O", "AB", "B", "A"), # Different blood types for each individual
  Score = c(85.5, 92.0, 78.0, 88.5, 95.0, 
            82.0, 76.5, 90.0, 89.5, 84.0),  # Numerical variable
  Passed = c(TRUE, TRUE, FALSE, TRUE, TRUE, 
             FALSE, TRUE, TRUE, FALSE, TRUE)  # Logical variable
)

```

Types are about how information is stored in the computer's memory.

What a computer thinks of this information is however determined by its class. 

We can check types of variables in R using the `typeof()` function:   
```r  
# Check the structure of the example data frame
type(example_df$Name) 
```

  - `$` is used to access a column in a data frame.  

To check the class of a variable, we can use the `class()` function:  
```r  
class(exmple_df$Name)  
```  

## Parsing 

Without furthing doing, the class of a variable is its type. Sometimes you want the variable to be a certain class. You need to teach the computer how to interpret the information. This is called "parsing" (詮釋).


## Common classes for parsing

1. **Factor**: A factor is a categorical variable. It is used to store data that can take on a limited number of different values. Factors are used to represent categorical data.
2. **Date**: A date variable is used to store date data. It is used to represent dates in R. For example, "2021-10-01" is a date.
3. **Datetime**: A datetime variable is used to store date and time data. It is used to represent date and time in R.  For example, "2021-10-01 12:00:00+UTC" is a datetime.

> Parse `example_df$Date_of_Birth` as a date variable, and `example_df$BloodType` as a factor variable.

## AI preset revision  

> You are using RStudio to conduct R programming tasks in POSIT remote server with preloaded tidyverse package. If the task is programming related, the programming style should follow tidyverse style as closely as possible, i.e. if certain task can be done in both base R and tidyverse, use tidyverse.  
> Each time if the new task continues to use codes from the previous task, there is no need to write those preceeding codes again. 

