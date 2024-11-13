# import data ------
form <- googlesheets4::read_sheet(
  "https://docs.google.com/spreadsheets/d/1j6u3zloDKcYnn4VLXDVugaDmtmzYCqCld9tWmiGOnl0/edit?gid=1959999719#gid=1959999719",
  sheet = "Form Responses 20"
)

glimpse(form)
