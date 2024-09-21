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

## Character variable 



Character variables can be divided into the following classes:  

1. **Factor**: A factor is a categorical variable. It is used to store data that can take on a limited number of different values. Factors are used to represent categorical data.
2. **Character**: A character variable is a string of characters. It is used to store text data.  
3. **Date**: A date variable is used to store date data. It is used to represent dates in R.  
4. **Time**: A time variable is used to store time data. It is used to represent time in R.  
5. **Datetime**: A datetime variable is used to store date and time data. It is used to represent date and time in R.  
6. **Logical**: A logical variable is used to store logical data. It can take on the values TRUE or FALSE.  

## Numeric variable

Numeric variables can be divided into the following classes:  