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

# search R path
.libPaths()
