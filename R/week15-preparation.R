# 引入2020總統大選資料 
library(googlesheets4)
gsUrl <- "https://docs.google.com/spreadsheets/d/1-jX-3EK_yspYDgPIy5vwnRKHntw9-dQIpFVhLc5JcXc/edit?gid=1123137106#gid=1123137106"
sheetname <- "R-2020-總統大選"

presidential_election <- read_sheet(gsUrl, sheet = sheetname)

glimpse(presidential_election[1:2,])

names(presidential_election)

library(dplyr)

# Rename the columns
presidential_election <- presidential_election %>%
  rename(
    Administrative_District = 行政區別,
    Valid_Votes = 有效票數,
    Invalid_Votes = 無效票數,
    Total_Votes = 投票數,
    Ballots_Received_Not_Voted = 已領未投票數,
    Ballots_Issued = 發出票數,
    Remaining_Ballots = 用餘票數,
    Number_of_Voters = 選舉人數,
    Voter_Turnout = 投票率,
    Candidate = 候選人,
    Votes_Received = 得票數
  )

# Display the first two rows and the column names
glimpse(presidential_election[1:2,])
names(presidential_election)

# select Administrative_District, Candidate and Votes_Received
presidential_election_select <- presidential_election %>%
  select(Administrative_District, Candidate, Votes_Received) 

glimpse(presidential_election_select)

presidential_election_select |>
    mutate(Administrative_District = factor(Administrative_District),
      Candidate = factor(Candidate)) -> presidential_election_select

levels(presidential_election_select$Administrative_District)

library(forcats)

# Create a named vector for the translations
translations <- c(
  "南投縣" = "Nantou County",
  "嘉義市" = "Chiayi City",
  "嘉義縣" = "Chiayi County",
  "基隆市" = "Keelung City",
  "宜蘭縣" = "Yilan County",
  "屏東縣" = "Pingtung County",
  "彰化縣" = "Changhua County",
  "新北市" = "New Taipei City",
  "新竹市" = "Hsinchu City",
  "新竹縣" = "Hsinchu County",
  "桃園市" = "Taoyuan City",
  "澎湖縣" = "Penghu County",
  "總　計" = "Total",
  "臺中市" = "Taichung City",
  "臺北市" = "Taipei City",
  "臺南市" = "Tainan City",
  "臺東縣" = "Taitung County",
  "花蓮縣" = "Hualien County",
  "苗栗縣" = "Miaoli County",
  "連江縣" = "Lienchiang County",
  "金門縣" = "Kinmen County",
  "雲林縣" = "Yunlin County",
  "高雄市" = "Kaohsiung City"
)

levels(presidential_election_select$Administrative_District) <- translations

# Display the updated levels
levels(presidential_election_select$Administrative_District)

levels(presidential_election_select$Candidate)

library(forcats)

# Create a named vector for the translations
candidate_translations <- c(
  "(1)\n宋楚瑜\n余湘" = "(1) James Soong / Sandra Yu",
  "(2)\n韓國瑜\n張善政" = "(2) Han Kuo-yu / Simon Chang",
  "(3)\n蔡英文\n賴清德" = "(3) Tsai Ing-wen / Lai Ching-te"
)

# Display the updated levels
levels(presidential_election_select$Candidate) <- candidate_translations

levels(presidential_election_select$Candidate)

library(googlesheets4)
gsUrl <- "https://docs.google.com/spreadsheets/d/1-jX-3EK_yspYDgPIy5vwnRKHntw9-dQIpFVhLc5JcXc/edit?gid=1123137106#gid=1123137106"
sheetname <- "R-2020-presidential-election"
presidential_election_select |>
    write_sheet(gsUrl, sheet = sheetname)


library(googlesheets4)
gsUrl <- "https://docs.google.com/spreadsheets/d/1-jX-3EK_yspYDgPIy5vwnRKHntw9-dQIpFVhLc5JcXc/edit?gid=1123137106#gid=1123137106"
sheetname <- "R-2020-presidential-election"

presidential_election <- read_sheet(gsUrl, sheet = sheetname)

glimpse(presidential_election)

library(dplyr)

# Create a "Party" variable based on the "Candidate" variable
presidential_election <- presidential_election %>%
  mutate(Party = case_when(
    Candidate == "(1) James Soong / Sandra Yu" ~ "People First Party",
    Candidate == "(2) Han Kuo-yu / Simon Chang" ~ "Kuomintang",
    Candidate == "(3) Tsai Ing-wen / Lai Ching-te" ~ "Democratic Progressive Party",
    TRUE ~ "Other"
  ))

# Compute the support rate of each party in each county based on "Votes_Received"
support_rate <- presidential_election %>%
  group_by(Administrative_District, Party) %>%
  summarise(Total_Votes = sum(Votes_Received, na.rm = TRUE)) %>%
  mutate(Support_Rate = Total_Votes / sum(Total_Votes) * 100) %>%
  ungroup()

# Display the support rate
print(support_rate)

# save as csv
write.csv(support_rate, "data-public/support_rate.csv", row.names = FALSE)

# read csv
csvUrl <- "https://raw.githubusercontent.com/tpemartin/113-1-R/refs/heads/main/data-public/support_rate.csv"
support_rate <- read.csv(csvUrl)

glimpse(support_rate)
