#' @title Preform Linear Model in Linear Algebra Way
#' @description This is a simple function to build a linear model.
#' @param form a formula object
#' @param data a data frame
#' @param contrasts a list, whose entries are values (numeric matrices, functions
#' or character strings naming functions) to be used as replacement values for
#' the contrasts replacement function and whose names are the names of columns
#' of data containing factors. If `NULL`, then contrasts are ommitted.
#' @examples
#' data(lm_patho)
#' fit <- linear_model(y ~ ., data = lm_patho)
#' fit$coefficients
#' @export

linear_model <- function(form, data, contrasts = NULL){

  data_no_na <- model.frame(form, data)

  if(is.null(contrasts)){
    X <- model.matrix(form, data_no_na)
  }else{
    X <- model.matrix(form, data_no_na, contrasts.arg = contrasts)
  }

  y_name <- as.character(form)[2]
  Y <- matrix(data_no_na[, y_name], ncol = 1)

  beta <- qr.solve(qr(X), Y)
  beta_names <- rownames(beta)
  beta <- as.numeric(beta)
  beta[beta==0] <- NA

  names(beta) <- beta_names
  rslt <- list(coefficients = beta)
  class(rslt) <- "my_lm"
  return(rslt)
}
