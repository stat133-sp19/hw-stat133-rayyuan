# This is a utility R script file that has private auxilary functions needed for other functions in the package


# Private function that returns true if p is a valid probability (0 <= p <= 1)
check_prob <- function(p) {
  if (p < 0 || p > 1) {
    stop("p has to be b/w 0 and 1")
  } else {
    return(TRUE)
  }
}

# Private function that checks if trials is a valid number of trials
check_trials <- function(trials) {
  if (trials < 0) {
    stop("Number of trials must be a positive integer ")
  } else {
    return(TRUE)
  }
}

# Checks that success is a valid success vector for a given number of trials
check_success <- function(success, trials) {
  for (i in 1:length(success)) {
    if (success[i] < 0) {
      stop("Invalid success value")
    }
  }
  if (length(success) > trials || success > trials) {
    stop("success larger than number of trials")
  }
  return(TRUE)
}

# Private function to determine the expected value of a binomial distribution given success probability and number of trials
aux_mean <- function(trials, prob) {
  return(trials * prob)
}

# Private function to determine the variance of a binomial distribution given success probability and number of trials
aux_variance <- function(trials, prob) {
  return(aux_mean(trials, prob) * (1-prob))
}

# Private function to determine the likely number of successes of a binomial distribution given success probability and number of trials
aux_mode <- function(trials, prob) {
  floor(aux_mean(trials, prob) + prob)
}

# Private function to determine the asymmetry of a binomial distribution given success probability and number of trials
aux_skewness <- function(trials, prob) {
  return((1 - 2*prob) / sqrt(aux_variance(trials, prob)))
}

# Private function to determine the "tailedness" of a binomial distribution given success probability and number of trials
aux_kurtosis <- function(trials, prob) {
  return((1 - 6 * prob * (1-prob)) / aux_variance(trials, prob))
}
