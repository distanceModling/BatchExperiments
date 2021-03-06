\name{findExperiments}
\alias{findExperiments}
\title{Find ids of experiments that match a query.}
\usage{
findExperiments(reg, ids, prob.pattern, prob.pars, algo.pattern, algo.pars,
  repls, match.substring = TRUE)
}
\arguments{
  \item{reg}{[\code{\link{ExperimentRegistry}}]\cr
  Registry.}

  \item{ids}{[\code{integer}]\cr Ids of selected
  experiments to restrict to.  Default is all experiments.}

  \item{prob.pattern}{[\code{character(1)}]\cr If not
  missing, all problem ids that match this string are
  selected.}

  \item{prob.pars}{[R expression]\cr If not missing, all
  problems whose parameters match the given expression are
  selected.}

  \item{algo.pattern}{[\code{character(1)}]\cr If not
  missing, all algorithm ids that match this string are
  selected.}

  \item{algo.pars}{[R expression]\cr If not missing, all
  algorithms whose parameters match the given expression
  are selected.}

  \item{repls}{[\code{integer}]\cr If not missing, restrict
  to jobs with given replication numbers.}

  \item{match.substring}{[\code{logical(1)}]\cr Is a match
  in \code{prob.pattern} and \code{algo.pattern} if the id
  contains the pattern as substring or must the id exactly
  match?  Default is \code{TRUE}.}
}
\value{
[\code{integer}]. Ids for experiments which match the
query.
}
\description{
Find ids of experiments that match a query.
}
\examples{
reg = makeExperimentRegistry(id="example1", file.dir=tempfile())
p1 = addProblem(reg, "one", 1)
p2 = addProblem(reg, "two", 2)
a = addAlgorithm(reg, "A", fun=function(static, n) static + n)
addExperiments(reg, algo.design=makeDesign(a, exhaustive = list(n = 1:4)))
findExperiments(reg, prob.pattern="one")
findExperiments(reg, prob.pattern="o")
findExperiments(reg, algo.pars = (n > 2))
}

