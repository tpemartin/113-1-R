library(tidyverse)
survey <- read_csv("data/113-1 learning R day time - Public - Sheet1 (1).csv")

tidy_survey <- survey %>%
  rename(
    timestamp = `Timestamp`,
    gender = `Gender`,
    has_job = `Do you have a job?`,
    credits_taken = `How many course credits do you take in this semester?`,
    total_credits = `How many accumulative course credits have you acquired so far?`,
    year = `Which year are you in?`,
    programming_languages = `Have you learnt any of the following programming language(s)?`,
    registration_reason = `The reason you register at this course`
  )
