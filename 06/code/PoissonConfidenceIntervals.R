set.seed(123456)

X <- rpois(n = 25, lambda = 15)
mean(X)


# Parametric Bootstrap ----------------------------------------------------

hat_lambda <- mean(X)

B <- 10000
boot_estimates <- numeric(B)

for (b in 1:B) {
  boot_sample <- rpois(hat_lambda, n = 25)
  boot_estimates[b] <- mean(boot_sample)
}

# Bootstrap estimated variance:
var(boot_estimates)

# Exact variance:
15 / n

boot_U <- quantile(boot_estimates, 0.975)
boot_L <- quantile(boot_estimates, 0.025)

# Print the interval
cat("Parametric Bootstrap Interval: (", round(boot_L, 2), ",", round(boot_U, 2), ")\n")


# Exact Confidence Intervals ----------------------------------------------

vals_lambda <- seq(12, 19, length.out = 10000)
n <- length(X)

plot(x = vals_lambda, y = ppois(sum(X), lambda = n * vals_lambda), type = 'l')
abline(h = 0.025, lty = 'dashed', col = 'red')
abline(h = 0.975, lty = 'dashed', col = 'red')


# 1. Calculate Lower Bound (lambda_L)
lower_func <- function(lam) { ppois(sum(X), lambda = n * lam) - 0.975 }
lambda_L <- uniroot(lower_func, interval = c(min(X), mean(X)))$root

# 2. Calculate Upper Bound (lambda_U)
upper_func <- function(lam) { ppois(sum(X), lambda = n * lam - 1) - 0.025 }
lambda_U <- uniroot(upper_func, interval = c(mean(X), max(X)))$root

# Print the interval
cat("Exact Interval: (", round(lambda_L, 2), ",", round(lambda_U, 2), ")\n")

# Wald Confidence Interval ------------------------------------------------

lower_W <- mean(X) - qnorm(0.975) * sqrt(mean(X) / n)
upper_W <- mean(X) + qnorm(0.975) * sqrt(mean(X) / n)

# Print the interval
cat("Wald Interval: (", round(lower_W, 2), ",", round(upper_W, 2), ")\n")

# Non-Parametric Bootstrap ----------------------------------------------------

B <- 10000
np_boot_estimates <- numeric(B)

for (b in 1:B) {
  np_boot_sample <- sample(X, size = n, replace = TRUE)
  np_boot_estimates[b] <- mean(np_boot_sample)
}

# Bootstrap estimated variance:
var(np_boot_estimates)

# Exact variance:
15 / n

np_boot_U <- quantile(np_boot_estimates, 0.975)
np_boot_L <- quantile(np_boot_estimates, 0.025)

# Print the interval
cat("Non-Parametric Bootstrap Interval: (", round(np_boot_L, 2), ",", round(np_boot_U, 2), ")\n")


# Likelihood Ratio -- Wilks -----------------------------------------------


# Define the Likelihood Ratio equation
lr_eq <- function(lam) {
  2 * (length(X) * (lam - mean(X)) + sum(X) * log(mean(X) / lam)) - qchisq(0.95, df = 1)
}

# Find the roots
lambda_L_LR <- uniroot(lr_eq, interval = c(5, mean(X)))$root
lambda_U_LR <- uniroot(lr_eq, interval = c(mean(X), 25))$root

cat("LR Interval: (", round(lambda_L_LR, 2), ",", round(lambda_U_LR, 2), ")\n")

# Plotting All Results ----------------------------------------------------

df_CI <- data.frame(
  method = c('exact', 'Boot', "NP-Boot", "Wald", "LR-Wilks"),
  lower = c(lambda_L, boot_L, np_boot_L, lower_W, lambda_L_LR),
  upper = c(lambda_U, boot_U, np_boot_U, upper_W, lambda_U_LR)
)

library(ggplot2)

ggplot(df_CI, aes(y = method)) +
  geom_segment(aes(x = lower, xend = upper)) +
  theme_bw() +
  geom_vline(xintercept = 15) +
  geom_vline(xintercept = mean(X), linetype = 'dashed') +
  scale_x_continuous(limits = c(min(X), max(X)))
