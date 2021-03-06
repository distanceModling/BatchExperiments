\name{makeDesign}
\alias{Design}
\alias{makeDesign}
\title{Create parameter designs for problems and algorithms.}
\usage{
makeDesign(id, design = data.frame(), exhaustive = list())
}
\arguments{
  \item{id}{[\code{character(1)}]\cr Id of algorithm or
  problem.}

  \item{design}{[\code{data.frame}]\cr The design. Must
  have named columns corresponding to parameters.  Default
  is an empty \code{data.frame()}.}

  \item{exhaustive}{[\code{list}]\cr Named list of
  parameters settings which should be exhaustively tried.
  Names must correspond to parameters.  Default is empty
  list.}
}
\value{
[\code{\link{Design}}].
}
\description{
Create a parameter design for either a problem or an
algorithm that you can use in \code{\link{addExperiments}}.
All parameters in \code{design} and \code{exhaustive} be
\dQuote{primitive} in the sense that either
\code{is.atomic} is \code{TRUE} or \code{is.factor} is
\code{TRUE}.
}
\details{
Be aware of R's default behaviour of converting strings
into factors if you use the \code{design} parameter. See
option \code{stringsAsFactors} in \code{\link{data.frame}}
to turn this off.
}
\examples{
\dontrun{
# simple design for algorithm "a1" with no parameters:
design <- makeDesign("a1")

# design for problem "p1" using predefined parameter combinations
design <- makeDesign("p1", design = data.frame(alpha = 0:1, beta = c(0.1, 0.2)))

# creating a list of designs for several algorithms at once, all using the same
# exhaustive grid of parameters
designs <- lapply(c("a1", "a2", "a3"), makeDesign,
                  exhaustive = list(alpha = 0:1, gamma = 1:10/10))
}
}

