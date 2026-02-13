# Package with Baseball data.
install.packages("Lahman")
?Lahman::Batting

# There are 128598 total observations.
# 
# Each row is a player ID, Year ID, and teamID.
# I want to get career statistics per player,
# so I need to group by player ID

library(tidyverse)

# just so we don't need to load the Lahman package
df <- Lahman::Batting

# Some data cleaning
df_pcts <- df %>% 
  filter(AB > 0) %>%  # remove players with no-at-bats. 
  group_by(playerID) %>%  # Group-by-play
  summarize(
    tot_H = sum(H),  # total number of hits
    tot_AB = sum(AB),  # total number of at-bats
    pct = tot_H / tot_AB  # batting percentage
    ) %>% 
  filter(tot_AB > 500) %>%  # only data with lots of attempts
  arrange(-pct)  # top batters at top

dim(df_pcts)

ggplot(df_pcts, aes(pct)) + 
  geom_histogram(col = 'black', fill = 'grey50') + 
  theme_bw()


neg_log_lik <- function(theta, data = df_pcts$pct) {
  t_theta <- exp(theta)
  -sum(dbeta(data, t_theta[1], t_theta[2], log = TRUE))
}

results <- optim(
  log(c(7, 21)),
  fn = neg_log_lik,
  method = "BFGS",
  control = list(maxit = 1000)
)

x <- seq(0, 0.45, length.out = 1000)
y <- dbeta(x, exp(results$par[1]), exp(results$par[2]))

bin_width <- 0.03

df_prior <- data.frame(
  x = x,
  y = y * nrow(df_pcts) * bin_width
)

ggplot(df_pcts, aes(pct)) + 
  geom_histogram(col = 'black', fill = 'grey50', binwidth = bin_width) + 
  theme_bw() + 
  geom_line(data = df_prior, aes(x = x, y = y), col = 'red')

# (alpha, beta): 
exp(results$par)

alpha <- exp(results$par)[1]
beta <- exp(results$par)[2]

posteriorMeanA <- (alpha + 353) / (alpha + 353 + beta + 647)
posteriorMeanB <- (alpha + 4) / (alpha + 4 + beta + 6)


x <- seq(0.05, 0.6, length.out = 1000)
y1 <- dbeta(x, 360, 668)
y2 <- dbeta(x, 11, 27)
prior <- dbeta(x, 7, 21)
plot(x, y1, type = 'l', xlab = 'Batting percentage', ylab = "prior", col = 'blue')
lines(x, y2, col = 'red')
lines(x, prior, col = 'black', lty='dashed')

y1 <- dbeta(x, alpha + 353, beta + 647)
y2 <- dbeta(x, alpha + 4, beta + 6)
prior <- dbeta(x, alpha, beta)
plot(x, y1, type = 'l', xlab = 'Batting percentage', ylab = "prior", col = 'blue')
lines(x, y2, col = 'red')
lines(x, prior, col = 'black', lty='dashed')


