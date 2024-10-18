# recap ----
survey <- read_csv("data/113-1 learning R (Responses) - public - Sheet1.csv")
glimpse(survey)

unique(survey$年齡)

# parsing ----

survey <- survey |>
  mutate(
    性別 = as.factor(性別),
    工作狀態 = as.factor(工作狀態),
    年齡 = as.ordered(年齡),
  )

## check levels -----
levels(survey$性別)
levels(survey$工作狀態)
levels(survey$年齡)

# "18歲以下", "18-22", "23-30", "31-40", "40+"

survey <- survey |>
  mutate(
    年齡 = factor(年齡,
                levels = c("18歲以下", "18-22", "23-30", "31-40", "40+"),
                ordered = TRUE))

survey <- survey |>
  mutate(
    工作狀態=factor(工作狀態,
                levels=c("無工作", "兼職工作者", "全職工作者"))
  )
