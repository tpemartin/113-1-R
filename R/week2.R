# 1. import dataset ----
library(tidyverse)  # Load readr package; it's included in tidyverse

native <- read_csv("data/112native_A1-1.csv")  # Make sure your CSV is in the working directory or provide the full path


# 2. rename variables ----
# Renaming the columns of the 'native' dataframe to English with backticks for non-conventional names
native <- native %>%
  rename(
    academic_year = `學年度`,
    school_type = `學校類別`,
    school_code = `學校代碼`,
    school_name = `學校名稱`,
    doctoral_students = `在學學生人數_博士班`,
    master_students = `在學學生人數_碩士班`,
    bachelor_students = `在學學生人數_學士班`,
    diploma_students = `在學學生人數_二專`,
    five_year_students = `在學學生人數_五專`,
    last_year_doctoral_grads = `上學年度畢業生人數_博士`,
    last_year_master_grads = `上學年度畢業生人數_碩士`,
    last_year_bachelor_grads = `上學年度畢業生人數_學士`,
    last_year_diploma_grads = `上學年度畢業生人數_二專`,
    last_year_five_year_grads = `上學年度畢業生人數_五專`
  )

# 3. export data to csv-----

write_csv(native, "data/112native_A1-1-end.csv")  # Export the renamed dataframe to a new CSV file
