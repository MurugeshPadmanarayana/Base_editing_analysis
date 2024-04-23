n <- 10
n_sim <- 10^5
means <- numeric(n_sim)
sds <- numeric(n_sim)
for(i in 1:n_sim){
  y <- rnorm(n, mean = 0, sd = 1)
  means[i] <- mean(y)
  sds[i] <- sd(y)
}