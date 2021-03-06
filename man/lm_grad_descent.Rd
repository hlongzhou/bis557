% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lm-grad-descent.r
\name{lm_grad_descent}
\alias{lm_grad_descent}
\title{Preform Linear Model with Gradient Descent Method}
\usage{
lm_grad_descent(
  form,
  data,
  contrasts = NULL,
  lambda = 1e-04,
  tolerence = 1e-15,
  beta_ini = 1,
  max_itr = 1e+06
)
}
\arguments{
\item{form}{a formula object, e.g. y ~ x1 + x2}

\item{data}{a data frame}

\item{contrasts}{a list, whose entries are values (numeric matrices, functions
or character strings naming functions) to be used as replacement values for
the contrasts replacement function and whose names are the names of columns
of data containing factors. If \code{NULL}, then contrasts are ommitted.}

\item{lambda}{a numeric number indicating the learning rate for gradient descent algorithm}

\item{tolerence}{a numeric number indicating the precision of the algorithm}

\item{beta_ini}{a numeric number indicating the initial value for beta coeffficient}

\item{max_itr}{an integer indicating the maximum number iterations}
}
\description{
This is a simple algorithm to solve a linear regression model.
}
\examples{
data(iris)
fit <- lm_grad_descent(Sepal.Length ~ ., data = iris)
fit$coefficients
}
