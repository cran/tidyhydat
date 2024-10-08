% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hy.R
\name{hy_stn_op_schedule}
\alias{hy_stn_op_schedule}
\title{Extract station operation schedule from HYDAT database}
\format{
A tibble with 6 variables:
\describe{
\item{STATION_NUMBER}{Unique 7 digit Water Survey of Canada station number}
\item{DATA_TYPE}{The type of data}
\item{Year}{Year of operation schedule}
\item{Month_from}{First month of use}
\item{Month_to}{Last month of use}
}
}
\source{
HYDAT
}
\usage{
hy_stn_op_schedule(
  station_number = NULL,
  hydat_path = NULL,
  prov_terr_state_loc = NULL
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
}
\value{
A tibble of hy_stn_op_schedule
}
\description{
hy_stn_op_schedule look-up Table
}
\examples{
\dontrun{
hy_stn_op_schedule(station_number = c("02JE013"))
}

}
\seealso{
Other HYDAT functions: 
\code{\link{hy_agency_list}()},
\code{\link{hy_annual_instant_peaks}()},
\code{\link{hy_annual_stats}()},
\code{\link{hy_daily}()},
\code{\link{hy_daily_flows}()},
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
\code{\link{hy_stn_regulation}()},
\code{\link{hy_version}()}
}
\concept{HYDAT functions}
