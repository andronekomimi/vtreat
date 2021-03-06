% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{catScore}
\alias{catScore}
\title{return significnace 1 variable logistic regression}
\usage{
catScore(varName, x, yC, yTarget, weights, numberOfHiddenDegrees = 0)
}
\arguments{
\item{varName}{name of variable}

\item{x}{numeric (no NAs/NULLs) effective variable}

\item{yC}{(no NAs/NULLs) outcome variable}

\item{yTarget}{scalar target for yC to match (yC==tTarget is goal)}

\item{weights}{(optional) numeric, non-negative, no NAs/NULLs at least two positive positions}

\item{numberOfHiddenDegrees}{optional scalar >= 0 number of additional modeling degrees of freedom to account for.}
}
\value{
significance estimate of a 1-variable logistic regression
}
\description{
return significnace 1 variable logistic regression
}
\examples{

d <- data.frame(y=c(1,1,0,0,1,1,0,0,1,1,1,1))
d$x <- seq_len((nrow(d)))
vtreat:::catScore('x',d$x,d$y,1,NULL)

}
