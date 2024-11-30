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

# word boundary

# Sample text in Traditional Chinese
text <- "水果是健康的，水果可以讓你更有活力。沒有水果的人生是乾枯的。"

# Define a pattern to search for the word "水果" (fruit) as a whole word
pattern <- "\\b水果"

# Finding matches for "水果"
str_count(text, pattern)

matches <- gregexpr(pattern, text)

# Get actual matches
matched_words <- regmatches(text, matches)

# Print the matched words
cat("找到的匹配:", unlist(matched_words), "\n")

# Replacing "水果" with "食物" (food) only when it is a whole word
replaced_text <- gsub(pattern, "食物", text)

# Print the replaced text
cat("替換後的文本:", replaced_text, "\n")



# a character vector for practicing regular expression using before and after neighbors

# 1. extract the number of the address



# 2. extract the city name
# 3. extract the district name

# 4. extract the school name
# 5. extract the school id
# 6. extract the programming language


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
print(students)

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

library(tidyverse)

# Customized email for the 1st student, convert homework grades to strings
email1 <- email_template %>%
    str_replace("\\{\\{name\\}\\}", students$name[1]) %>%
    str_replace("\\{\\{homework1\\}\\}", as.character(students$homework1[1])) %>%
    str_replace("\\{\\{homework2\\}\\}", as.character(students$homework2[1])) %>%
    str_replace("\\{\\{homework3\\}\\}", as.character(students$homework3[1]))

print(email1)
cat(email1)

# set up email server

# Load necessary libraries
library(sendmailR)
# Load necessary library
library(sendmailR)

# Function to send an email
send_email <- function(to, subject, body) {
  from <- "tpemartin@gmail.com"  # Replace with your Gmail address
  smtp <- list(host.name = "smtp.gmail.com", port = 587, 
               user.name = "tpemartin@gmail.com", passwd = Sys.getenv("Google_Appp_PWD"), 
               ssl = TRUE)

  # Create the email
  email <- sendmail(
    from = from,
    to = to,
    subject = subject,
    msg = body,
    control = smtp
  )

  return(email)
}

# Example usage
recipient <- "tpemartin@gmail.com"
email_subject <- "Your Homework Grades"
email_body <- "Dear Student,\n\nHere are your grades:\nHomework 1: 8\nHomework 2: 7\nHomework 3: 9\n\nBest regards,\nYour Teacher"

# Send the email
send_email(recipient, email_subject, email_body)

# Gmail -----

library(gmailr)
