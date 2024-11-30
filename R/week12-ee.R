library(tidyverse)
# a data frame with 4 observations
string_df <- tibble(
    # 台灣地址
    taiwan_address =
        c(
            "新竹市東區食品路228號",
            "臺中市大甲區蔣公路140號",
            "台南市北區中華北路一段85號",
            "嘉義縣大林鎮民權路53號",
            "雲林縣西螺鎮福興里中山路70號",
            "宜蘭縣礁溪鄉德陽路102號",
            "南投縣竹山鎮集山路一段2071號",
            "台中市西區精誠路11-4號"
        ),
    high_school =
        c(
            "台北市立第一女子高級中學",
            "北一女", # 台 北 市立第 一 女 子高級中學
            "北一女中", # 台 北 市立第 一 女 子高級 中 學
            "北一女高", # 台 北 市立第 一 女 子 高 級 中 學
            "台北市立松山高級中學",
            "新北市立一級棒女子高級中學",
            "新北一女",
            "一級棒女中"
        ),
    school_id =
        c(
            "411273008",
            "411382009",
            "411274010",
            "411263011",
            "411044103",
            "411055104",
            "411066105",
            "411077106"
        ),
    skill =
        c(
            "C++, R",
            "R, Python",
            "R",
            "Python, Java",
            "Julia, Python",
            "Julia",
            "", "R"
        ),
    github = c(
        "https://github.com/Tang0724/113-1-R-final-project.git",
        "https://github.com/rhythm-1112/113-1-R-final-project",
        "https://github.com/shellyhuang507/113-1-R-final-project",
        "https://github.com/harryyuan123456/113-1-R-final-project",
        "https://github.com/Xiemuying/113-1-R-final-project.git",
        "https://github.com/jason941210/113-1-R-final-project",
        "https://github.com/Allend3wiudi/113-1-R-final-project.git",
        "https://github.com/Daniellin411373092/113-1-R-final-project.git"
    )
)

glimpse(string_df)

glimpse(string_df$github)

# Regex look behind
`string_df` <- `string_df` |>
    mutate(`username` = str_extract(`github`, "(?<=https://github.com/)[^/]+"))

glimpse(string_df$username)

# Regex look behind
glimpse(string_df$taiwan_address)

`string_df` <- `string_df` |>
    mutate(`district` = str_extract(`taiwan_address`, "[\\u4e00-\\u9fa5]{1,2}(市|區|鄉|鎮)"))

glimpse(string_df$district)

`string_df` <- `string_df` |>
    mutate(`district2` = str_extract(`taiwan_address`, "(?<=縣|市)[\\u4e00-\\u9fa5]{1,2}(市|區|鄉|鎮)"))

glimpse(string_df$district2)

# preceeding and following

string_df <- string_df %>%
    mutate(username = str_extract(`github`, "(?<=https://github\\.com/)[^/]+"))

string_df$district <- stringr::str_extract(string_df$taiwan_address, "(?<=(縣|市))[\\u4e00-\\u9fa5]{1,3}(區|鄉|鎮|市)")

string_df$district



library(epubr)

book <- epubr::epub("data/Demi-gods.epub")
book$data |> glimpse()

book$data[[1]] |> glimpse()

story <- book$data[[1]]

story |> glimpse()

# story$text 找以"段"開始後面接1 to 3 個字的字串

library(stringr)

# 使用正则表达式提取以“段”开头，后面接1到3个字的字符串
story$extracted <- str_extract(story$text, "段[\\u4e00-\\u9fa5]{1,3}")

# 打印结果
print(story$extracted)


# customized emails

# Load necessary library
library(dplyr)

# Set a seed for reproducibility
set.seed(123)

# Create example data
students <- data.frame(
    name = c("Alice", "Bob", "Charlie"),
    email = c("econmtlin@gmail.com", "econmtlin@gmail.com", "econmtlin@gmail.com"),
    homework1 = sample(1:10, 3, replace = TRUE), # Random grades between 1 and 10
    homework2 = sample(1:10, 3, replace = TRUE), # Random grades between 1 and 10
    homework3 = sample(1:10, 3, replace = TRUE) # Random grades between 1 and 10
)

# Print the data frame
glimpse(students)

# email template

email_template <-
    "Dear {{name}},

I hope this message finds you well!

I am writing to inform you of your grades for the recent homework assignments. Here are your scores:

- Homework 1: {{homework1}}
- Homework 2: {{homework2}}
- Homework 3: {{homework3}}  

If you have any questions regarding the grades or would like to discuss any feedback, please feel free to reach out.

Congratulations on your hard work, and keep it up!

Best regards,
Martin"

library(glue)

emails <- students |>
    mutate(`email_body` = glue(
        "Dear {`name`},\n\n",
        "I hope this message finds you well!\n\n",
        "I am writing to inform you of your grades for the recent homework assignments. Here are your scores:\n\n",
        "- Homework 1: {homework1}\n",
        "- Homework 2: {homework2}\n",
        "- Homework 3: {homework3}\n\n",
        "If you have any questions regarding the grades or would like to discuss any feedback, please feel free to reach out.\n\n",
        "Congratulations on your hard work, and keep it up!\n\n",
        "Best regards,\n",
        "Martin"
    ))

# 查看生成的郵件內容
emails |> select(`name`, `email_body`)

cat(emails$email_body[2])


library(stringr)

# 定義電子郵件範本，使用特定佔位符
email_template <- "Dear {name},\n\nI hope this message finds you well!\n\nI am writing to inform you of your grades for the recent homework assignments. Here are your scores:\n\n- Homework 1: {homework1}\n- Homework 2: {homework2}\n- Homework 3: {homework3}\n\nIf you have any questions regarding the grades or would like to discuss any feedback, please feel free to reach out.\n\nCongratulations on your hard work, and keep it up!\n\nBest regards,\nMartin"

emails <- students |>
    mutate(`email_body` = 
        str_replace(email_template, "\\{name\\}", `name`) |>      # 替換姓名
        str_replace(., "\\{homework1\\}", as.character(homework1)) |>  # 替換 homework1 成績
        str_replace(., "\\{homework2\\}", as.character(homework2)) |>  # 替換 homework2 成績
        str_replace(., "\\{homework3\\}", as.character(homework3))      # 替換 homework3 成績
    )

# 查看生成的郵件內容
emails |> select(`name`, `email_body`)

cat(emails$email_body[2])


## upload to gs sheet
library(googlesheets4)
gsUrl <- "https://docs.google.com/spreadsheets/d/1ZgXV_N6-SsuFlePoxOfQv6Rq8uSqS7v5zJ2CjxRsjJ4/edit?pli=1&gid=0#gid=0"

students2 <- students |>
   mutate(
    Recipient= email,
    `Email Sent` = ""
   )


write_sheet(
    students2,
    gsUrl,
    sheet="students2"
)
