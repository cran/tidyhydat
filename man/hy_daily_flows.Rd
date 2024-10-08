% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hy_daily_flows.R
\name{hy_daily_flows}
\alias{hy_daily_flows}
\title{Extract daily flows information from the HYDAT database}
\format{
A tibble with 5 variables:
\describe{
\item{STATION_NUMBER}{Unique 7 digit Water Survey of Canada station number}
\item{Date}{Observation date. Formatted as a Date class.}
\item{Parameter}{Parameter being measured. Only possible value is Flow}
\item{Value}{Discharge value. The units are m^3/s.}
\item{Symbol}{Measurement/river conditions}
}
}
\source{
HYDAT
}
\usage{
hy_daily_flows(
  station_number = NULL,
  hydat_path = NULL,
  prov_terr_state_loc = NULL,
  start_date = NULL,
  end_date = NULL,
  symbol_output = "code"
)
}
\arguments{
\item{station_number}{A seven digit Water Survey of Canada station number. If this argument is omitted, the value of \code{prov_terr_state_loc}
is returned.}

\item{hydat_path}{The path to the hydat database or NULL to use the default location
used by \link{download_hydat}. It is also possible to pass in an existing
\link[dplyr]{src_sqlite} such that the database only needs to be opened once per
user-level call.}

\item{prov_terr_state_loc}{Province, state or territory. If this argument is omitted, the value of \code{station_number}
is returned. See \code{unique(allstations$prov_terr_state_loc)}. Will also accept \code{CA} to return only Canadian stations.}

\item{start_date}{Leave blank if all dates are required. Date format needs to be in YYYY-MM-DD. Date is inclusive.}

\item{end_date}{Leave blank if all dates are required. Date format needs to be in YYYY-MM-DD. Date is inclusive.}

\item{symbol_output}{Set whether the raw code, or the \code{english} or the \code{french} translations are outputted. Default
value is \code{code}.}
}
\value{
A tibble of daily flows
}
\description{
Provides wrapper to turn the DLY_FLOWS table in HYDAT into a tidy data frame of daily flows.
\code{station_number} and \code{prov_terr_state_loc} can both be supplied. If both are omitted all
values from the \code{hy_stations} table are returned. That is a large tibble for \code{hy_daily_flows}.
}
\examples{
\dontrun{
# download_hydat()
hy_daily_flows(
  station_number = c("08MF005"),
  start_date = "1996-01-01", end_date = "2000-01-01"
)

hy_daily_flows(prov_terr_state_loc = "PE")
}

}
\seealso{
Other HYDAT functions: 
\code{\link{hy_agency_list}()},
\code{\link{hy_annual_instant_peaks}()},
\code{\link{hy_annual_stats}()},
\code{\link{hy_daily}()},
\code{\link{hy_daily_levels}()},
\code{\link{hy_data_symbols}},
\code{\link{hy_data_types}},
\code{\link{hy_datum_list}()},
\code{\link{hy_monthly_flows}()},
\code{\link{hy_monthly_levels}()},
\code{\link{hy_reg_office_list}()},
\code{\link{hy_sed_daily_loads}()},
\code{\link{hy_sed_daily_suscon}()},
\code{\link{hy_sed_monthly_loads}()},
\code{\link{hy_sed_monthly_suscon}()},
\code{\link{hy_sed_samples}()},
\code{\link{hy_sed_samples_psd}()},
\code{\link{hy_stations}()},
\code{\link{hy_stn_data_coll}()},
\code{\link{hy_stn_data_range}()},
\code{\link{hy_stn_op_schedule}()},
\code{\link{hy_stn_regulation}()},
\code{\link{hy_version}()}
}
\concept{HYDAT functions}
