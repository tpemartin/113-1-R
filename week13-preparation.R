library(googlesheets4) 
survey_ee <- read_sheet("https://docs.google.com/spreadsheets/d/1RnT-dD0WAND8lS7v_nkhtnArBqChzLAqPJ3IKe0wSzA/edit?gid=1045486302#gid=1045486302",
                        sheet = "electronics-usage" 
) 

survey_ee <- survey_ee %>%
  rename(
    timestamp = `Timestamp`,
    email_address = `Email Address`,
    department = `科系`,
    grade = `年級`,
    device_used_last_week = `一周內曾使用裝置`,
    average_daily_device_usage_hours = `平均每天裝置使用總時數`,
    type_of_software_used = `使用軟體的類型`,
    gender = `性別`
  )

glimpse(survey_ee) 


survey_ee |> 
  dplyr::filter(grade == "大一") 
survey_ee |> 
  dplyr::filter(grade != "大一") 

survey_ee |> 
  dplyr::filter(device_used_last_week=="手機") 
survey_ee |>
  dplyr::filter(str_detect(device_used_last_week,"手機"))
