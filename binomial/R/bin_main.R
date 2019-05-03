#' @title Binomial Choose
#' @description how many groups of size k can be chosen from a total of n
#' @param n num total to chose from (numeric)
#' @param k num to choose (numeric)
#' @return num groups of size k (numeric)
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' 10
#'
#' bin_choose(5, 1:3)
#' 5 10 10
bin_choose <- function(n, k) {
  if (sum(k > n) > 0) {
    stop("can't choose more than n")
  }
  return(factorial(n)/ (factorial(k) * factorial(n-k)))
}


#' @title Binomial Probability
#' @description Gives probability of num success in num trials with a given probability of success
#' @param success Vector of successes (numeric)
#' @param trials num trials (numeric)
#' @param prob set probability that there is a success (real)
#' @return probability of num success in num trials with a given probability of success (real)
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' 0.3125
#'
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' 0.03125 0.15625 0.31250
#'
#' bin_probability(success = 55, trials = 100, prob = 0.45)
#' 0.01075277

bin_probability <- function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  return(bin_choose(trials, success) * (prob ^ success) * ((1-prob) ^ (trials-success)))
}

#' @title Binomial Distribution
#' @description gives binomial distribution of probabilities of all possible success given a probability of success for 1 trial
#' @param trials num trials (numeric)
#' @param prob probability of successs (real)
#' @return data fram of all possible success given a probability of success(data.frame)
#' @export
#' @examples
#' x <- bin_distribution(trials = 5, prob = 0.5)
#' x
#' success probability
#' 1 0 0.03125
#' 2 1 0.15625
#' 3 2 0.31250
#' 4 3 0.31250
#' 5 4 0.15625
#' 6 5 0.03125
#'

bin_distribution <- function(trials, prob) {
  succ_probs <- c()
  for (t in 0:trials) {
    succ_probs <- c(succ_probs, bin_probability(t, trials, prob))
  }
  ret <- data.frame(success = 0:trials, probability = succ_probs)
  class(ret) <- c("bindis", "data.frame")
  return(ret)
}


#' @export
plot.bindis <- function(dis) {
  barplot(dis$prob, names.arg = dis$success,  xlab = "successes", ylab = "probability")
}


#' @title Binomial Cumulative Distribution
#' @description Gets cumulative probability of all num success in num trials with a given probability of success up to that specific success number
#' @param trials num trials (numeric)
#' @param prob given probability a success occurs (real)
#' @return dataframe of cumulative probability of all num success in num trials with a given probability of success up to that specific success number(data.frame)
#' @export
#' @examples
#' dis2 <- bin_cumulative(trials = 5, prob = 0.5)
#' dis2
#      success probability cumulative
#' 1       0     0.03125    0.03125
#' 2       1     0.15625    0.18750
#' 3       2     0.31250    0.50000
#' 4       3     0.31250    0.81250
#' 5       4     0.15625    0.96875
#' 6       5     0.03125    1.00000


bin_cumulative <- function(trials, prob) {
  count <- 0
  orig_dist <- bin_distribution(trials, prob)
  reg_probs <- bin_distribution(trials, prob)$probability
  cum_probs <- c()
  for (t in 1:length(reg_probs)) {
    cum_probs <- c(cum_probs, count + reg_probs[t])
    count <- count + reg_probs[t]
  }
  orig_dist$cumulative <- cum_probs
  class(orig_dist) <- c("bincum", "data.frame")
  return(orig_dist)
}

#' @export
plot.bincum <- function(dist) {
  plot(x = dist$success, y = dist$cumulative, xlab = "successes", ylab = "probability")
  lines(x = dist$success, y = dist$cumulative)
}


#' @title Binomial Variable
#' @description A Binomial Random Variable s3 object
#' @param trials num (numeric)
#' @param prob Probability of successs (real)
#' @return Binomial Random Variable object(binvar)
#' @export
#' @examples
#' bin1 <- bin_variable(trials = 10, p = 0.3)
#' bin1
#' "Binomial variable"
#' Paramaters
#' Number of Trials: 10
#' Probability of Success : 0.3
#'
#' binsum1 <- summary(bin1)
#' binsum1
#'
#' "Summary Binomial"
#' Parameters
#' Number of Trials: 10
#' Probability of Successs : 0.3
#' Measures
#' Mean : 3
#' Variance: 2.1
#' Mode: 3
#' Skewness: 0.2760262
#' Kurtosis: -0.1238095
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  ret <- list(trials = trials, prob = prob)
  class(ret) <- "binvar"
  return(ret)
}

#' @export
print.binvar <- function(bvobj) {
  cat("Binomial Variable\n")
  print("Parameters")
  print(paste0("Number of trials: ", bvobj[[1]]))
  print(paste0("Probability of Success: ", bvobj[[2]]))
}


#' @export
summary.binvar <- function(bvobj) {
  num_trials = bvobj[[1]]
  probability = bvobj[[2]]
  object <- list(trials = num_trials,prob = probability,mean = aux_mean(num_trials, probability),variance = aux_variance(num_trials, probability),mode = aux_mode(num_trials, probability),skewness = aux_skewness(num_trials, probability),kurtosis = aux_kurtosis(num_trials, probability))
  class(object) <- "summary.binvar"
  object
}

#' @export
print.summary.binvar <- function(s) {
  cat("Summary Binomial\n")
  print("Parameters")
  print(paste0("Number of trials: ", s[['trials']]))
  print(paste0("Probability of Success: ", s[['prob']]))
  cat("\n")
  print("Measures")
  print(paste0("Mean: ", s[['mean']]))
  print(paste0("Variance: ", s[['variance']]))
  print(paste0("Mode: ", s[['mode']]))
  print(paste0("Skewness: ", s[['skewness']]))
  print(paste0("Kurtosis: ", s[['kurtosis']]))
}

#' @title Binomial Mean
#' @description mean of binomial distributions
#' @param trials num trials (numeric)
#' @param prob given probability of success (real)
#' @return Returns the mean(real)
#' @export
#' @examples
#' bin_mean(10, 0.3)
#' 3
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}

#' @title Binomial Variance
#' @description variance of a binomial distribution
#' @param trials num trials (numeric)
#' @param prob given probability of success (real)
#' @return Returns the variance(real)
#' @export
#' @examples
#' bin_variance(10, 0.3)
#' 2.1
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}

#' @title Binomial Mode
#' @description mode of a binomial distribution
#' @param trials num trials (numeric)
#' @param prob given probability of success (real)
#' @return Returns the mode(numeric)
#' @export
#' @examples
#' bin_mode(10, 0.3)
#' 3
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}

#' @title Binomial Skewness
#' @description skewness of a binomial distribution
#' @param trials num trials (numeric)
#' @param prob given probability of success (real)
#' @return Returns the skewness(real)
#' @export
#' @examples
#' bin_skewness(10, 0.3)
#' 0.2760262
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}

#' @title Binomial Kurtosis
#' @description kurtosis of a binomial distribution
#' @param trials num trials (numeric)
#' @param prob given probability of success (real)
#' @return Returns the kurtosis(real)
#' @export
#' @examples
#' bin_kurtosis(10, 0.3)
#' -0.1238095
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}
