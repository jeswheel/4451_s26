# He

N <- 10
x <- 8

# Found analytically
prior_theta <- function(theta) {
  (1 - abs(1 - 2 * theta)) / (4 * log(2) * theta * (1-theta))
}


unscaled_x_theta <- function(theta, x = 8, N = 10) {
  dbinom(x, N, theta) * prior_theta(theta)
}

denominator <- integrate(unscaled_x_theta, 0, 1)$value

posterior_theta <- function(theta) {
  unscaled_x_theta(theta) / denominator
}

integrate(posterior_theta, 0, 1)  # Should be 1


plot(seq(0, 1, length.out = 1000), posterior_theta(seq(0, 1, length.out = 1000)), type = 'l')

# Posterior Mean
integrate(function(x) posterior_theta(x) * x, 0, 1)

# Approach 2: Hierarchical strategy ---------------------------------------

upper_k <- 100000

marginal_likelihood2 <- function(k, x = x, N = N) {
  beta(x + k, N - x + k) / beta(k, k)
}

prior2 <- function(k) {
  1 / (2 * log(2) * k * (2*k - 1))
}

w_k <- marginal_likelihood2(1:upper_k, x=x, N = N) * prior2(1:upper_k)

wbar <- w_k / sum(w_k, na.rm = TRUE)
wbar <- wbar[!is.na(wbar)]
n_k <- length(wbar)

mu_k <- (x + 1:n_k) / (N + 2 * 1:n_k)

sum(mu_k * wbar)



# Taking logs, we can do a bit better. The problem is beta(k,k) for large k,
# but we can compute the log of this:

marginal_likelihood2_log <- function(k, x = x, N = N) {
  log_num <- lgamma(x + k) + lgamma(N - x + k) - lgamma(N + 2 * k)
  log_den <- 2 * lgamma(k) - lgamma(2 * k)
  log_ml <- log_num - log_den
  exp(log_ml)
}


w_k <- marginal_likelihood2_log(1:upper_k, x=x, N=N) * prior2(1:upper_k)

wbar <- w_k / sum(w_k, na.rm = TRUE)
wbar <- wbar[!is.na(wbar)]
n_k <- length(wbar)

mu_k <- (x + 1:n_k) / (N + 2 * 1:n_k)

sum(mu_k * wbar)
