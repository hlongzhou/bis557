#' @title Preform Linear Model with Gradient Descent Method
#' @description This is a simple algorithm to solve a linear regression model.
#' @param form a formula object, e.g. y ~ x1 + x2
#' @param data a data frame
#' @param contrasts a list, whose entries are values (numeric matrices, functions
#' or character strings naming functions) to be used as replacement values for
#' the contrasts replacement function and whose names are the names of columns
#' of data containing factors. If `NULL`, then contrasts are ommitted.
#' @param lambda a numeric number indicating the learning rate for gradient descent algorithm
#' @param tolerence a numeric number indicating the precision of the algorithm
#' @param max_itr an integer indicating the maximum number iterations
#' @param beta_ini a numeric number indicating the initial value for beta coeffficient
#'
#' @examples
#' data(iris)
#' fit <- lm_grad_descent(Sepal.Length ~ ., data = iris)
#' fit$coefficients
#' @export

lm_grad_descent <- function(form, data, contrasts = NULL,
                            lambda = 0.0001, tolerence = 1e-15,
                            beta_ini = 1, max_itr=1e6){

  data_no_na <- model.frame(form, data)
  if(is.null(contrasts)){
    X <- model.matrix(form, data_no_na)
  }else{
    X <- model.matrix(form, data_no_na, contrasts.arg = contrasts)
  }
  x_name <- colnames(X)
  y_name <- as.character(form)[2]

  Y <- matrix(data_no_na[, y_name], ncol = 1)

  if(qr(X)$rank == dim(X)[2]){
    beta <- matrix(rep(beta_ini, length(x_name)), nrow = length(x_name))
    SSR <- sum((X %*% beta - Y)^2)

    for(t in 1:max_itr) {
      error <- (X %*% beta - Y)
      SSR_old <- sum(error^2)
      delta_f <- 2 * t(X) %*% error
      beta <- beta - lambda * delta_f
      SSR_new <- sum((X %*% beta - Y)^2)
      if(abs(SSR_new - SSR_old) < tolerence){
        break
      }
    }
    rslt <- list(coefficients = beta)
    class(rslt) <- "my_lm_gd"
    return(rslt)
  }else{
    warning("There exists colinearity in dependent variables. Switch to linear_model() function!")
    rslt <- linear_model(form, data, contrasts)
    return(rslt)
  }

}
