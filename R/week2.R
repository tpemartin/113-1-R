library(readr)  # Load readr package; it's included in tidyverse

data <- read_csv("data/112native_A1-1.csv")  # Make sure your CSV is in the working directory or provide the full path


library(tidyverse)

# Assuming you have already imported your data
data <- read_csv("112native_A1-1.csv")

# Step 1: Define translations for the variable names
translation <- c(
  "學年度" = "Academic Year",
  "學校類別" = "School Type",
  "學校代碼" = "School Code",
  "學校名稱" = "School Name",
  "在學學生人數_博士班" = "Number of Students Enrolled - Doctoral",
  "在學學生人數_碩士班" = "Number of Students Enrolled - Master's",
  "在學學生人數_學士班" = "Number of Students Enrolled - Bachelor's",
  "在學學生人數_二專" = "Number of Students Enrolled - Associate Degree",
  "在學學生人數_五專" = "Number of Students Enrolled - Five-Year College",
  "上學年度畢業生人數_博士" = "Number of Graduates Last Year - Doctoral",
  "上學年度畢業生人數_碩士" = "Number of Graduates Last Year - Master's",
  "上學年度畢業生人數_學士" = "Number of Graduates Last Year - Bachelor's",
  "上學年度畢業生人數_二專" = "Number of Graduates Last Year - Associate Degree",
  "上學年度畢業生人數_五專" = "Number of Graduates Last Year - Five-Year College"
)

# Step 2: Update column names in the data frame
colnames(data) <- translation[colnames(data)]

# Step 3: Check the updated variable names
print(colnames(data))
