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

glimpse(tidy_survey1)

tidy_survey1 |>
  select(gender, has_job, year_in_school) |>
  summary()

# Convert specific variables to factors if needed
tidy_survey2 <- tidy_survey1 %>%
  mutate(
    gender = as.factor(gender),
    has_job = as.factor(has_job),
    year_in_school = as.factor(year_in_school)
  )

# Then check with glimpse
glimpse(tidy_survey2)
tidy_survey2 |>
  select(gender, has_job, year_in_school) |>
  summary()

tidy_survey <- tidy_survey %>%
  mutate(
    accum_credits = factor(
      accum_credits,
      levels = c("0 (Freshman, 一年級新生）", "1-30", "31-60", "61-90", "91-120", "121-140","140+"), # adjust these levels as needed
      ordered = TRUE
    )
  )

# Exercise 1.  
unique(tidy_survey1$accum_credits)

# Exercise 2.
tidy_survey1 <- tidy_survey1 %>%
  mutate(
    gender = factor(gender), 
    has_job = factor(has_job), 
    year_in_school = factor(year_in_school),
    accum_credits = factor(
      accum_credits,
      ordered = TRUE
    )
  )

# Exercise 3
levels(tidy_survey1$gender)
levels(tidy_survey1$has_job)
levels(tidy_survey1$year_in_school)

levels(tidy_survey1$accum_credits)
