% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_dataverse.R
\name{get_dataverse}
\alias{get_dataverse}
\alias{dataverse_contents}
\title{Get Dataverse}
\usage{
get_dataverse(
  dataverse,
  key = Sys.getenv("DATAVERSE_KEY"),
  server = Sys.getenv("DATAVERSE_SERVER"),
  check = TRUE,
  ...
)

dataverse_contents(
  dataverse,
  key = Sys.getenv("DATAVERSE_KEY"),
  server = Sys.getenv("DATAVERSE_SERVER"),
  ...
)
}
\arguments{
\item{dataverse}{A character string specifying a Dataverse name or an object of class \dQuote{dataverse}.}

\item{key}{A character string specifying a Dataverse server API key. If one is not specified, functions calling authenticated API endpoints will fail. Keys can be specified atomically or globally using \code{Sys.setenv("DATAVERSE_KEY" = "examplekey")}.}

\item{server}{A character string specifying a Dataverse server. There are multiple Dataverse installations, but the defaults is to use the Harvard Dataverse. This can be modified atomically or globally using \code{Sys.setenv("DATAVERSE_SERVER" = "dataverse.example.com")}.}

\item{check}{A logical indicating whether to check that the value of \code{dataverse} is actually a numeric}

\item{...}{Additional arguments passed to an HTTP request function, such as \code{\link[httr]{GET}}, \code{\link[httr]{POST}}, or \code{\link[httr]{DELETE}}.}
}
\value{
A list of class \dQuote{dataverse}.
}
\description{
Retrieve details of a Dataverse
}
\details{
\code{get_dataverse} function retrieves basic information about a Dataverse from a Dataverse server. To see the contents of the Dataverse, use \code{\link{dataverse_contents}} instead. Contents might include one or more \dQuote{datasets} and/or further Dataverses that themselves contain Dataverses and/or datasets. To view the file contents of a single Dataset, use \code{\link{get_dataset}}.
}
\examples{
\dontrun{
# view the root dataverse for a server
get_dataverse(":root")
dataverse_contents(":root")

Sys.setenv("DATAVERSE_SERVER" = "dataverse.harvard.edu")
# download file from:
# https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/ARKOTI
dv <- get_dataverse("monogan")
(contents <- dataverse_contents(dv))

# get a dataset from the dataverse
d1 <- get_dataset(contents[[1]])
f <- get_file(d1$files$id[3])
}
}
\seealso{
To manage Dataverses:
\code{\link{create_dataverse}},
\code{\link{delete_dataverse}},
\code{\link{publish_dataverse}},
\code{\link{dataverse_contents}};

To get datasets:
\code{\link{get_dataset}};

To search for Dataverses, datasets, or files:
\code{\link{dataverse_search}}
}
