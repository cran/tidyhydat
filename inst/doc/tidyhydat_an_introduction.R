## ----options, include=FALSE---------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, 
                      warning = FALSE, 
                      message = FALSE, 
                      eval = nzchar(Sys.getenv("hydat_eval")),
                      fig.width=7, fig.height=7)

## ----packages, warning=FALSE, message=FALSE, echo = TRUE----------------------
library(tidyhydat)
library(dplyr)
library(ggplot2)

## ---- eval=FALSE--------------------------------------------------------------
#  download_hydat()

## ----example1, warning=FALSE--------------------------------------------------
hy_daily_flows(station_number = "08LA001")

## ----example2, warning=FALSE--------------------------------------------------
PEI_stns <- hy_stations() %>%
  filter(HYD_STATUS == "ACTIVE") %>%
  filter(PROV_TERR_STATE_LOC == "PE") %>%
  pull_station_number()

PEI_stns

hy_daily_flows(station_number = PEI_stns)

## ---- example3----------------------------------------------------------------
search_stn_name("canada") %>%
  pull_station_number() %>%
  hy_daily_flows()

## ----warning=FALSE, warning=FALSE, message=FALSE, eval=FALSE------------------
#  hy_daily_flows(station_number = "08LA001",
#                 start_date = "1981-01-01", end_date = "1981-12-31")

## ---- eval=FALSE--------------------------------------------------------------
#  realtime_stations(prov_terr_state_loc = "PE")

## ----stations, eval=FALSE-----------------------------------------------------
#  hy_stations(prov_terr_state_loc = "PE")

## ---- eval=FALSE--------------------------------------------------------------
#  realtime_dd(station_number = "08LG006")

## ---- eval=FALSE--------------------------------------------------------------
#  realtime_dd(prov_terr_state_loc = "PE")

## ---- echo=TRUE---------------------------------------------------------------
search_stn_name("liard")

## ---- echo=TRUE---------------------------------------------------------------
search_stn_number("08MF")

## -----------------------------------------------------------------------------
stns <- c("08NH130", "08NH005")
runoff_data <- hy_daily_flows(station_number = stns, start_date = "2000-01-01") %>%
  left_join(
    hy_stations(station_number = stns) %>%
      select(STATION_NUMBER, STATION_NAME, DRAINAGE_AREA_GROSS),
    by = "STATION_NUMBER") %>%
  ## conversion to mm/d
  mutate(runoff = Value / DRAINAGE_AREA_GROSS * 86400 / 1e6 * 1e3) 


ggplot(runoff_data) + 
  geom_line(aes(x = Date, y = runoff, colour = STATION_NAME)) +
  labs(y = "Mean daily runoff [mm/d]") +
  theme_minimal()

