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

# 也可以寫成
survey$年齡 <- factor(survey$年齡,
                      levels = c("18歲以下", "18-22", "23-30", "31-40", "40+"),
                      ordered = TRUE)

survey <- survey |>
  mutate(
    工作狀態=factor(工作狀態,
                levels=c("無工作", "兼職工作者", "全職工作者"))
  )
# 也可以寫成
survey$工作狀態 <- factor(survey$工作狀態,
                levels=c("無工作", "兼職工作者", "全職工作者"))


survey$年齡 <- forcats::fct_recode(survey$年齡,
                             "0-17" = "18歲以下")

survey$工作狀態_粗分類 <- forcats::fct_recode(survey$工作狀態,
                             "有工作" = "兼職工作者", 
                             "有工作" = "全職工作者")


survey <- survey |>
  mutate(
    `一週工時類別` = cut(
      `一週工時`, 
      breaks = c(0, 6, 25, 30, 40, 100)
    )
  )

survey <- survey |>
  mutate(
    `一週工時類別` = cut(
      `一週工時`, 
      breaks = c(-1, 6, 25, 30, 40, 100)
    )
  )

survey <- survey |>
  mutate(
    `一週工時類別2` = cut(
      `一週工時`, 
      breaks = c(-Inf, 6, 25, 30, 40, Inf),
      labels = c("0-6", "7-25", "26-30", "31-40", "40+")
    )
  )



