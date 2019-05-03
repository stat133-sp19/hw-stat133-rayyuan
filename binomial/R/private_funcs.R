# This is a utility R script file that has private auxilary functions needed for other functions in the package


# it checks if p is a valid probability, basically between 0 and 1 inclusive
check_prob <- function(p) {
  if (p < 0 || p > 1) {
    stop("p has to be b/w 0 and 1")
  } else {
    return(TRUE)
  }
}

# checks if your number of trials is valid
check_trials <- function(trials) {
  if (trials < 0) {
    stop("can't have negative number of trials")
  } else {
    return(TRUE)
  }
}

#check to make sure you can have that number of successes given a number of trials
check_success <- function(success, trials) {
  if(sum(success < 0) > 0){
    stop("can't have less than 0 successes")
  }
  if (length(success) > trials || sum(success > trials)>0) {
    stop("success larger than number of trials")
  }

  return(TRUE)
}

# mean of a binomial distribution given for a certain number of trials and a given probability of success on each trial
aux_mean <- function(trials, prob) {
  return(trials * prob)
}

# variance of a binomial distribution given for a certain number of trials and a given probability of success on each trial
aux_variance <- function(trials, prob) {
  return(aux_mean(trials, prob) * (1-prob))
}

# mode of a binomial distribution given for a certain number of trials and a given probability of success on each trial
aux_mode <- function(trials, prob) {
  floor(aux_mean(trials, prob) + prob)
}

# # value of skewness or how symmetrical a binomial distribution is given for a certain number of trials and a given probability of success on each trial
aux_skewness <- function(trials, prob) {
  return((1 - 2*prob) / sqrt(aux_variance(trials, prob)))
}

# kurtosis of a binomial distribution given for a certain number of trials and a given probability of success on each trial
aux_kurtosis <- function(trials, prob) {
  return((1 - 6 * prob * (1-prob)) / aux_variance(trials, prob))
}
