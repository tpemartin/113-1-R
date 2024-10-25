survey <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1nqjK0V_HHl1R5To8A2-G7p9YQAjfGgSwoawx2WEU4-8/edit?gid=0#gid=0",
                                    sheet="Sheet1")
survey <- survey %>%
  mutate(
    `性別` = factor(`性別`, levels = c("男", "女")),
    `工作狀態` = factor(`工作狀態`, levels = c("無工作", "全職工作者", "兼職工作者")),
    `年齡` = factor(`年齡`, levels = c("18歲以下", "18-22", "23-30", "31-40", "40+"), ordered = TRUE)
  )

# Cut

## 查看四分位數
summary(survey$一週工時)

survey <- survey %>%
  mutate(一週工時類別 = factor(case_when(
    `一週工時` <= 2 ~ "0-2",
    `一週工時` >= 3 & `一週工時` <= 36 ~ "3-36",
    `一週工時` >= 37 & `一週工時` <= 40 ~ "37-40",
    `一週工時` > 40 ~ "40+"
  ), levels = c("0-2", "3-36", "37-40", "40+")))


