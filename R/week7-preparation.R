glimpse(trafficAccidents)

trafficAccidents <- 
  trafficAccidents |>
  mutate(
    accident_date = 發生日期
  ) |>
  relocate(accident_date, 發生日期)

glimpse(trafficAccidents)

write_csv(trafficAccidents, "trafficAccidents.csv")

## YYYYMMDD----
## 
trafficAccidents <- read_csv("trafficAccidents.csv")
glimpse(trafficAccidents |> select(1:4))

trafficAccidents <- trafficAccidents %>%
  mutate(accident_date = lubridate::ymd(as.character(accident_date)))

glimpse(trafficAccidents |> select(1:4))
summary(trafficAccidents$accident_date)


future <- future |>
  mutate(
    YEARMONTH = 資料年月
  ) |>
  relocate(
    YEARMONTH, 資料年月
  )

write_csv(future, "future.csv")

# YYYYMM----
future <- read_csv("future.csv")

glimpse(future)

future <- future %>%
  mutate(YEARMONTH = lubridate::ym(as.character(YEARMONTH)))

glimpse(future)
summary(future$YEARMONTH)

growth_us <- read_csv("data/GDP-US.csv")

growth_us <- growth_us %>%
  mutate(`DATE` = paste(year(`DATE`), sprintf("Q%d", quarter(`DATE`)), sep = "-")) 

growth_us <- growth_us |> select(-year_quarter)

growth_us |> glimpse()

write_csv(growth_us, "growth_us.csv")

## YYYYQQ----
growth_us <- read_csv("growth_us.csv")

glimpse(growth_us)

growth_us <- growth_us %>%
  mutate(DATE = lubridate::yq(DATE))

glimpse(growth_us)
summary(growth_us$DATE)

glimpse(growth_tw)

growth_tw <- growth_tw |>
  mutate(
    PERIOD = 統計期
  ) |>
  relocate(
    PERIOD, 統計期
  ) 

growth_tw <- growth_tw |>
  select(
    -`...3`
  )

write_csv(growth_tw, "growth_tw.csv")

## Taiwan date----
growth_tw <- read_csv("growth_tw.csv")
glimpse(growth_tw)

growth_tw <- growth_tw %>%
  mutate(
    YEAR = as.numeric(sub("^(\\d+)年第\\d+季$", "\\1", PERIOD)) + 1911,  # Extract and convert year
    QUARTER = as.numeric(sub("^\\d+年第(\\d+)季$", "\\1", PERIOD)),       # Extract the quarter
    DATE = lubridate::yq(paste(YEAR, paste0("Q", QUARTER)))                 # Combine into "YYYY-QQ" format
  ) %>%
  select(-YEAR, -QUARTER)  # Optional: Remove the intermediate YEAR and QUARTER columns


glimpse(growth_tw)
summary(growth_tw$DATE)
