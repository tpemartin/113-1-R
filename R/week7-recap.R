library(tidyverse)
survey <- read_csv("data/113-1 learning R day time - Public - Sheet1.csv")

glimpse(survey)

tidy_survey1 <- survey %>%
  rename(
    timestamp = `Timestamp`,
    gender = `Gender`,
    has_job = `Do you have a job?`,
    course_credits = `How many course credits do you take in this semester?`,
    accum_credits = `How many accumulative course credits have you acquired so far?`,
    year_in_school = `Which year are you in?`,
    programming_languages = `Have you learnt any of the following programming language(s)?`,
    course_reason = `The reason you register at this course`
  )

glimpse(tidy_survey)
summary(tidy_survey)

# Convert specific variables to factors if needed
tidy_survey2 <- tidy_survey1 %>%
  mutate(
    gender = as.factor(gender),
    has_job = as.factor(has_job),
    year_in_school = as.factor(year_in_school)
  )

# Then check with glimpse
glimpse(tidy_survey2)
summary(tidy_survey2)

tidy_survey <- tidy_survey %>%
  mutate(
    accum_credits = factor(
      accum_credits,
      levels = c("0 (Freshman, 一年級新生）", "1-30", "31-60", "61-90", "91-120", "121-140","140+"), # adjust these levels as needed
      ordered = TRUE
    )
  )
