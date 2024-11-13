
# date ------
library(tidyverse)

##  YYYYMMDD ---- 
trafficAccidents <- read_csv("trafficAccidents.csv") 

glimpse(trafficAccidents$accident_date) 


trafficAccidents <- trafficAccidents %>%
  mutate(`accident_date` = ymd(`accident_date`))

glimpse(trafficAccidents$accident_date)

## yyyymm-----

future <- read_csv("future.csv")

glimpse(future$YEARMONTH)

future <- future %>%
  mutate(`YEARMONTH` = ym(`YEARMONTH`))

glimpse(future$YEARMONTH)

## yyyyq ---

growth <- read_csv("growth_tw.csv")

glimpse(growth$PERIOD)

growth <- growth %>%
  mutate(
    Year = as.numeric(str_extract(PERIOD, "\\d+")) + 1911,
    Quarter = str_extract(PERIOD, "第\\d季") %>% str_extract("\\d"),
    PERIOD = yq(paste0(Year, "Q", Quarter))
  )


glimpse(growth$PERIOD)


## ttt年m月----
CPI <- read_csv("CPI2.csv", skip = 2)


glimpse(CPI$PERIOD)

CPI <- CPI %>%
  mutate(
    YEAR = as.numeric(str_extract(PERIOD, "\\d+")) + 1911,
    MONTH = str_extract(PERIOD, "\\d+月") %>% str_remove("月"),
    PERIOD = ym(paste0(YEAR, MONTH))
  )

glimpse(CPI$PERIOD)

## ttt年----
exchangeRate <- read_csv("exchangeRate2.csv")

glimpse(exchangeRate$PERIOD)

exchangeRate <- exchangeRate %>%
  mutate(
    YEAR = as.numeric(str_extract(PERIOD, "\\d+")) + 1911,
    PERIOD = ymd(paste0(YEAR, "-01-01"))
  )


glimpse(exchangeRate$PERIOD)

