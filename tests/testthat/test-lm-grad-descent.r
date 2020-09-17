library(testthat)

context("Test the output of homework 1.")

test_that("You lm_grad_descent() function works in an easy case.", {
  
  data(iris)
  
  fit_linear_model <- lm_grad_descent(Sepal.Length ~ ., iris)
  
  fit_lm <- lm(Sepal.Length  ~ ., iris)
  
  expect_equivalent(fit_lm$coefficients, fit_linear_model$coefficients,
                    tolerance = 1e-4)
})

test_that("You lm_grad_descent() function works with contrasts.", {
  
  data(iris)
  
  fit_linear_model <- lm_grad_descent(Sepal.Length ~ ., iris, 
                                   contrasts = list(Species = "contr.sum"))
  
  fit_lm <- lm(Sepal.Length  ~ ., iris, contrasts = list(Species = "contr.sum"))
  
  expect_equivalent(fit_lm$coefficients, fit_linear_model$coefficients,
                    tolerance = 1e-5)
})

test_that("Your lm_grad_descent() function works in a tougher case.", {
  
  data(lm_patho)
  
  fit_linear_model <- lm_grad_descent(y ~., lm_patho)
  
  fit_lm <- lm(y ~., lm_patho)
  
  expect_equivalent(fit_lm$coefficients, fit_linear_model$coefficients,
                    tolerance = 1e-5)
})

