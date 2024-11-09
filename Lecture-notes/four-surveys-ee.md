# Four surveys

```r
library(googlesheets4)
survey <- read_sheet('https://docs.google.com/spreadsheets/d/1nqjK0V_HHl1R5To8A2-G7p9YQAjfGgSwoawx2WEU4-8/edit?gid=0#gid=0', 
                sheet="Sheet1")

student_survey1 <- read_sheet("https://docs.google.com/spreadsheets/d/1HMkgqr-VyN6Q8faBqg6aRvkNGI0DlilzfwlJjJ-xJ8c/edit?gid=1656812417#gid=1656812417",
                                             sheet="資料科學程式設計")
student_survey2 <- read_sheet("https://docs.google.com/spreadsheets/d/1jb6D-Pi0Ol9tYMbK1MQiTR7v-Q4VRHPpeK7rx6VR9ng/edit?gid=699875337#gid=699875337",
                                             sheet="Form Responses 1")
student_survey3 <- read_sheet("https://docs.google.com/spreadsheets/d/1y4aJxP5-Rpco17gflA3Ho68pM0XubfENJyATGElfx0w/edit?gid=1678725407#gid=1678725407",
                                             sheet="表單回應 1")
```