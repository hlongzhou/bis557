context("Testing grab coefficients.")

library(palmerpenguins)

data(penguins)
fit <- lm(bill_length_mm ~ ., data = penguins[, -8])
resids <- grab_resids(fit)
expect_equal(resids, fit$residuals)
