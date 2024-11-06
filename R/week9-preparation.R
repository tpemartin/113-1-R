# sheets: "sleep", "course-choosing", "hobby", "electronics-usage", "hobby2", 
# "living-expense"
library(googlesheets4)
gsUrl <- "https://docs.google.com/spreadsheets/d/1RnT-dD0WAND8lS7v_nkhtnArBqChzLAqPJ3IKe0wSzA/edit?gid=0#gid=0"
sleep <- read_sheet(gsUrl, sheet="sleep")
course_choosing <- read_sheet(gsUrl, sheet="course-choosing")
hobby <- read_sheet(gsUrl, sheet="hobby")
electronics_usage <- read_sheet(gsUrl, sheet="electronics-usage")
hobby2 <- read_sheet(gsUrl, sheet="hobby2")
living_expense <- read_sheet(gsUrl, sheet="living-expense")


# hobby2
glimpse(hobby2)

tidy_hobby2 <- hobby2 |>
    rename(
       "hours_of_sparetime" = "一天中有幾個小時休閒時間",
       "years_in_school" = "年級",
       "gener" = "性別",
       "hobby" = "會從事哪些休閒活動"
    )

glimpse(tidy_hobby2)

tidy_hobby2 <- tidy_hobby2 |>
    mutate(
        hours_of_sparetime = as.numeric(hours_of_sparetime),
        years_in_school = as.factor(years_in_school),
        gener = as.factor(gener)
    )

# <list> must be coerced into character, integer or numeric before parsing
# <list> happens when the question has an open answer.  

tidy_hobby2 <- tidy_hobby2 |>
    mutate(
        hours_of_sparetime = as.numeric(hours_of_sparetime),
        years_in_school = as.factor(as.character(years_in_school)),
        gener = as.factor(gener)
    ) 

# check factor levels
levels(tidy_hobby2$years_in_school)
levels(tidy_hobby2$gener)

# specify factor levels when parsing
tidy_hobby2 <- tidy_hobby2 |>
    mutate(
        years_in_school = factor(
            years_in_school,
            levels = c("一", "二", "三", "四", "5"),
            ordered = TRUE
        ),
        gener = factor(
            gener,
            levels = c("女", "男", "其他")
        )
    )

glimpse(tidy_hobby2)

summary(tidy_hobby2)

# Exercise: parse other sheets as much as you can -----
#  then summarise the data

# data mining ----
names(sleep)
names(course_choosing)
names(hobby)
names(electronics_usage)
names(living_expense)
names(hobby2)



