set.seed(123456)

# Randomly generate data
x <- rpois(25, lambda = 25)

# Plot the data (histogram)
hist(x)

# Range of \lambda that is reasonable 
thetas <- seq(3, 40, length.out = 1000)

# Convienient function for plotting the likelihood
like_fun <- function(t, obs = length(x)) {
  # purrr::map_dbl. Maps a vector (t) to a function:
  #   function(t) prod(dpois(x, t)).
  # 
  # That is, for every value of t in the vector, the likelihood
  # gets evaluated.
  purrr::map_dbl(
    t, 
    .f = function(t) prod(dpois(x[1:obs], t))
  )
}

# Get L(theta) for the specific values of theta, and fixed data.
likes <- like_fun(thetas)

# Integrate the function, so we can scale to have area 1. 
val <- integrate(
  f = like_fun,
  lower = 10,
  upper = 40
)

# plot(x = thetas, y = likes / val$value, type = 'l')

prior_y <- dgamma(thetas, 9, 3/5)

posteriors <- function(n_obs = 2) {
  dgamma(thetas, shape = sum(x[1:n_obs]) + 9, n_obs + 3/5)
}


# One observations --------------------------------------------------------

num_obs <- 1

# Get L(theta) for the specific values of theta, and fixed data.
likes <- like_fun(thetas, obs = num_obs)

# Integrate the function, so we can scale to have area 1. 
val <- integrate(
  f = like_fun,
  lower = 10,
  upper = 40,
  obs = num_obs
)

# Plot the prior density
plot(x = thetas, y = prior_y, type = 'l', ylim = c(0, 0.41))

# Add vertical line representing true value of \lambda = 25
abline(v = 25, lty = 'dashed')

# Plot the likelihood (first observation only)
lines(x = thetas, y = likes / val$value, col = 'red')

# Plot the posterior (first observation only)
lines(x = thetas, y = posteriors(num_obs), col = '#a6bddb')


# Two observations --------------------------------------------------------

num_obs <- 2

# Get L(theta) for the specific values of theta, and fixed data.
likes <- like_fun(thetas, obs = num_obs)

# Integrate the function, so we can scale to have area 1. 
val <- integrate(
  f = like_fun,
  lower = 10,
  upper = 40,
  obs = num_obs
)

plot(x = thetas, y = prior_y, type = 'l', ylim = c(0, 0.41))
abline(v = 25, lty = 'dashed')
lines(x = thetas, y = likes / val$value, col = 'red')
lines(x = thetas, y = posteriors(num_obs), col = '#a6bddb')

# five observations --------------------------------------------------------

num_obs <- 5

# Get L(theta) for the specific values of theta, and fixed data.
likes <- like_fun(thetas, obs = num_obs)

# Integrate the function, so we can scale to have area 1. 
val <- integrate(
  f = like_fun,
  lower = 10,
  upper = 40,
  obs = num_obs
)

plot(x = thetas, y = prior_y, type = 'l', ylim = c(0, 0.41))
abline(v = 25, lty = 'dashed')
lines(x = thetas, y = likes / val$value, col = 'red')
lines(x = thetas, y = posteriors(num_obs), col = '#a6bddb')


# 10 observations --------------------------------------------------------

num_obs <- 10

# Get L(theta) for the specific values of theta, and fixed data.
likes <- like_fun(thetas, obs = num_obs)

# Integrate the function, so we can scale to have area 1. 
val <- integrate(
  f = like_fun,
  lower = 10,
  upper = 40,
  obs = num_obs
)

plot(x = thetas, y = prior_y, type = 'l', ylim = c(0, 0.41))
abline(v = 25, lty = 'dashed')
lines(x = thetas, y = likes / val$value, col = 'red')
lines(x = thetas, y = posteriors(num_obs), col = '#a6bddb')

# 15 observations --------------------------------------------------------

num_obs <- 15

# Get L(theta) for the specific values of theta, and fixed data.
likes <- like_fun(thetas, obs = num_obs)

# Integrate the function, so we can scale to have area 1. 
val <- integrate(
  f = like_fun,
  lower = 10,
  upper = 40,
  obs = num_obs
)

plot(x = thetas, y = prior_y, type = 'l', ylim = c(0, 0.41))
abline(v = 25, lty = 'dashed')
lines(x = thetas, y = likes / val$value, col = 'red')
lines(x = thetas, y = posteriors(num_obs), col = '#a6bddb')

# All observations --------------------------------------------------------

num_obs <- length(x)

# Get L(theta) for the specific values of theta, and fixed data.
likes <- like_fun(thetas, obs = num_obs)

# Integrate the function, so we can scale to have area 1. 
val <- integrate(
  f = like_fun,
  lower = 10,
  upper = 40,
  obs = num_obs
)

plot(x = thetas, y = prior_y, type = 'l', ylim = c(0, 0.41))
abline(v = 25, lty = 'dashed')
lines(x = thetas, y = likes / val$value, col = 'red')
lines(x = thetas, y = posteriors(num_obs), col = '#a6bddb')
