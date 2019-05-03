#' @title Binomial Choose
#' @description Calculates number of combinations in which k successes can occur in n trials.
#' @param n Number of trials (numeric)
#' @param k Number of successes (numeric)
#' @return Number of combinations (numeric)
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' 10
#'
#' bin_choose(5, 0)
#' 1
#'
#' bin_choose(5, 1:3)
#' 5 10 10
bin_choose <- function(n, k) {
  if (sum(k > n) > 0) {
    stop("k cannot be larger than n")
  }
  return(factorial(n) / (factorial(k) * factorial(n-k)))
}


#' @title Binomial Probability
#' @description Returns the probability of having a certain number of successes in a given number of trials, with a given probability of success for each trial.
#' @param success Vector of successes (numeric)
#' @param trials Number of trials (numeric)
#' @param prob Probability of successs (real)
#' @return Probability of the number of successes (real)
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
#' @description Computes the binomial distribution of a certain number of success over a given number of trials
#' @param trials Number of trials (numeric)
#' @param prob Probability of successs (real)
#' @return Returns a data.frame of the number of successes and their probabilities
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
#' plot(x)
#' Returns a barplot of the distribution
#'
bin_distribution <- function(trials, prob) {
  probabilities <- c()
  for (i in 0:trials) {
    probabilities <- c(probabilities, bin_probability(i, trials, prob))
  }
  object <- data.frame(success = 0:trials, probability = probabilities)
  class(object) <- c("bindis", "data.frame")
  object
}


#' @export
plot.bindis <- function(dis) {
  barplot(dis$prob, names.arg = dis$success,  xlab = "successes", ylab = "probability")
}


#' @title Binomial Cumulative
#' @description Computes the binomial distribution of a certain number of success over a given number of trials as well as the cumulative probability up to that number of successes
#' @param trials Number of trials (numeric)
#' @param prob Probability of successs (real)
#' @return Returns a data.frame of the number of successes and their probabilities as well as the cumulative probability up to a certain number of successes
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
#'
#' plot(dis2)
#' Returns a plot of the cumulative probability versus number of successess
bin_cumulative <- function(trials, prob) {
  distribution <- bin_distribution(trials, prob)
  probabilities <- distribution$probability
  cumulatives <- c()
  sum <- 0
  for (i in 1:length(probabilities)) {
    sum <- sum + probabilities[i]
    cumulatives <- c(cumulatives, sum)
  }
  distribution$cumulative <- cumulatives
  class(distribution) <- c("bincum", "data.frame")
  distribution
}

#' @export
plot.bincum <- function(dist) {
  plot(x = dist$success, y = dist$cumulative, xlab = "successes", ylab = "probability")
  lines(x = dist$success, y = dist$cumulative)
}


#' @title Binomial Variable
#' @description An object which represents a binomial random variable
#' @param trials Number of trials (numeric)
#' @param prob Probability of successs (real)
#' @return Binomial Random Variable object
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
print.binvar <- function(object) {
  print("Binomial Variable")
  print("")
  print("Parameters")
  print(paste0("Number of trials: ", object[[1]]))
  print(paste0("Probability of Success: ", object[[2]]))
}


#' @export
summary.binvar <- function(binvar) {
  num_trials = binvar[[1]]
  probability = binvar[[2]]
  object <- list(trials = num_trials,
                 prob = probability,
                 mean = aux_mean(num_trials, probability),
                 variance = aux_variance(num_trials, probability),
                 mode = aux_mode(num_trials, probability),
                 skewness = aux_skewness(num_trials, probability),
                 kurtosis = aux_kurtosis(num_trials, probability))
  class(object) <- "summary.binvar"
  object
}

#' @export
print.summary.binvar <- function(summary) {
  print("Summary Binomial")
  print("")
  print("Parameters")
  print(paste0("Number of trials: ", summary[['trials']]))
  print(paste0("Probability of Success: ", summary[['prob']]))
  print("")
  print("Measures")
  print(paste0("Mean: ", summary[['mean']]))
  print(paste0("Variance: ", summary[['variance']]))
  print(paste0("Mode: ", summary[['mode']]))
  print(paste0("Skewness: ", summary[['skewness']]))
  print(paste0("Kurtosis: ", summary[['kurtosis']]))
}

#' @title Binomial Mean
#' @description Computes the mean of a binomial distribution
#' @param trials Number of trials (real)
#' @param prob Probability of successs (real)
#' @return Returns the mean
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
#' @description Computes the variance of a binomial distribution
#' @param trials Number of trials (real)
#' @param prob Probability of successs (real)
#' @return Returns the variance
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
#' @description Computes the mode of a binomial distribution
#' @param trials Number of trials (real)
#' @param prob Probability of successs (real)
#' @return Returns the mode
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
#' @description Computes the skewness of a binomial distribution
#' @param trials Number of trials (real)
#' @param prob Probability of successs (real)
#' @return Returns the skewness
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
#' @description Computes the kurtosis of a binomial distribution
#' @param trials Number of trials (real)
#' @param prob Probability of successs (real)
#' @return Returns the kurtosis
#' @export
#' @examples
#' bin_kurtosis(10, 0.3)
#' -0.1238095
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}
