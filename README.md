
<!-- README.md is generated from README.Rmd. Please edit that file -->
bis557
======

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/tqchen07/bis557.svg?branch=master)](https://travis-ci.org/tqchen07/bis557) [![Coverage Status](https://coveralls.io/repos/github/tqchen07/bis557/badge.svg?branch=master)](https://coveralls.io/github/tqchen07/bis557?branch=master) <!-- badges: end -->

The goal of bis557 is to illustrate how to create an R package for the Yale Biostatistics bis 557 class.

Installation
------------

The development version of the package can be installed from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("tqchen07/bis557")
```

Example
-------

``` r
data(iris)

# linear algebra method
fit_lm <- linear_model(Sepal.Length ~ ., iris)
fit_lm$coefficients

# gradient descent algorithm
fit_gd <- lm_grad_descent(Sepal.Length ~ ., iris)
fit_gd$coefficients

```
