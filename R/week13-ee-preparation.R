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

glimpse(presidential_election[1:2,])


presidential_election <- presidential_election |>
  dplyr::mutate(`政黨` = dplyr::case_when(
    `候選人` == "(1)\n宋楚瑜\n余湘" ~ "親民黨",
    `候選人` == "(2)\n韓國瑜\n張善政" ~ "國民黨",
    TRUE ~ "民進黨"
  ))

# Calculate 得票率 for each party in each district
result <- presidential_election |>
  dplyr::group_by(`行政區別`, `政黨`) |>
  dplyr::summarise(`得票率` = sum(`得票數`) / sum(`有效票數`) * 100, .groups = 'drop')

# View the result
print(result)

write_csv(result, "data-public/presidential_election_result2020.csv")

library(tidyverse)
result <- read_csv("https://raw.githubusercontent.com/tpemartin/113-1-R/refs/heads/main/data-public/presidential_election_result2020.csv")

glimpse(result[1:2,])

result_wide <- result |>
  tidyr::pivot_wider(
    names_from = `政黨`,
    values_from = `得票率`,
    values_fill = list(`得票率` = NA)  # Fill with NA for any missing values
  )

# View the result
print(result_wide)

glimpse(result_wide[1:2,])

result_long <- result_wide |>
  tidyr::pivot_longer(
    cols = c(`國民黨`, `民進黨`, `親民黨`),
    names_to = "政黨",
    values_to = "得票率"
  )

# View the result
print(result_long)
