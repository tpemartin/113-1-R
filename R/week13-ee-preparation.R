library(tidyverse)
# Create a factor variable with 3 levels
factor_variable <- factor(rep(c("Low", "Medium", "High"), length.out = 20))

# Create a data frame
df <- data.frame(Category = factor_variable)

# Display the data frame
print(df)


df <- df |>
    mutate(
        Category_as_numeric = as.numeric(Category), 
        Category_as_character = as.character(Category)
        )

glimpse(df)

# Set seed for reproducibility
set.seed(123)

# Create a data frame with a variable of random integers
df_random <- data.frame(RandomIntegers = sample(1:100, 5, replace = TRUE))

# Display the data frame
print(df_random)

df_random <- df_random |>
    mutate(
        RandomIntegers_as_factor = as.factor(RandomIntegers)
        )

levels(df_random$RandomIntegers_as_factor)

df_random |>
    mutate(
        Restore_as_numeric = as.numeric(RandomIntegers_as_factor),
        Restore_as_character = as.character(RandomIntegers_as_factor)
        )


# 引入2020總統大選資料 
library(googlesheets4)
gsUrl <- "https://docs.google.com/spreadsheets/d/1-jX-3EK_yspYDgPIy5vwnRKHntw9-dQIpFVhLc5JcXc/edit?gid=1123137106#gid=1123137106"
sheetname <- "R-2020-總統大選"

presidential_election <- read_sheet(gsUrl, sheet = sheetname)

glimpse(presidential_election)
