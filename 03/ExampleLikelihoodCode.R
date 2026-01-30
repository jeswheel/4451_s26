add2 <- function(x, y) {
  x + y
}


purrr::map_dbl(
  .x = 1:100,
  .f = function(my_arg) add2(x = my_arg, y = -100)
)

x <- rpois(15, lambda = 5)
hist(x)

Like1 <- function(lambda, data = x) {
  exp(-length(data) * lambda) * (lambda ^ (sum(data))) / prod(factorial(data))
}

loglik2 <- function(lambda, data = x) {
  sum(dpois(x = data, lambda = lambda, log = TRUE))
}


like1_vals <- purrr::map_dbl(
  .x = seq(1e-01, 10, length.out = 1000),
  .f = Like1
)

like2_vals <- purrr::map_dbl(
  .x = seq(3, 6, length.out = 1000),
  .f = loglik2
)

plot(x = seq(3, 6, length.out = 1000), y = like2_vals, type = 'l')
