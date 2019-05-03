## Overview
`binomial` is an R package that computes statistics about binomial distributions.

### Functions
`bin_choose(n, k)` Computes n choose k (the number of ways to grab k different objects from n choices)

`bin_probability(success, trials, prob)` Computes the probability of a number of successes in trials with a given probability of success

`bin_variable(trials, prob)` Creates a binomial random variable object of class `binvar`for a number of trials and a probability of success

`bin_distribution(success, trials, prob)` Computes probability distribution of a number of succcesses given number of trials and probability of success. Returns a `bindis` object, which acts as a `data.frame`.

`bin_cumulative(success, trials, prob)` Computes cumulative probability distribution of a number of succcesses given number of trials and probability of success. Returns a `bincum` object, which acts as a `data.frame`.

`plot()` Plots a `bindis` or `bincum` object

`summary()` Creates a summary `data.frame` of a `binvar` object, returned as a `summary.binvar` object.

`bin_mean(trials, prob)` Computes the mean of a binomial random variable.

`bin_variance(trials, prob)` Computes the variance of a binomial random variable.

`bin_mode(trials, prob)` Computes the mode of a binomial random variable.

`bin_skewness(trials, prob)` Computes the skewness of a binomial random variable.

`bin_kurtosis(trials, prob)` Computes the kurtosis of a binomial random variable.

### Motivation
This package has been developed to allow for quick and easy calculations involving binomial random variables

### Installation
Install this package using the R library `devtools`
```
# install.packages("devtools") 

# install "binomial" (without vignettes)
devtools::install_github("/stat133-sp19/hw-stat133-TheGoldenKyle/binomial")

# install "binomial" (with vignettes)
devtools::install_github("/stat133-sp19/hw-stat133-TheGoldenKyle/binomial", build_vignettes = TRUE)
```

### Usage
```
library(binomial)

# Using the bin_choose function (n choose k)
bin_choose(n = 5, k = 2)

# Creation of a Binomial Random Variable
bin1 <- bin_variable(trials = 10, p = 0.3)

# Statistics about the Binomial Random Variable
summary(bin1)

# Probabilities of getting 0 to 3 successes in 5 trials with a 50% probability of success
bin_probability(success = 0:3, trials = 5, prob = 0.5)

# Probability Distribution of a Binomial Random Variable in 5 trials with 50% probability of success
dis <- bin_distribution(trials = 5, prob = 0.5)
dis

# Plot the distribution
plot(dis)

# Cumulative Probability Distribution of a Binomial Random Variable in 5 trials with 50% probability of success
dis2 <- bin_cumulative(trials = 5, prob = 0.5)

# Plot the distribution of running success probability 
plot(dis2)

# Summary Measure Functions

# Compute mean given 10 trials and 30% probability of success
bin_mean(10, 0.3)

# Compute variance given 10 trials and 30% probability of success
bin_variance(10, 0.3)

# Compute mode given 10 trials and 30% probability of success
bin_mode(10, 0.3)

# Compute skewness given 10 trials and 30% probability of success
bin_skewness(10, 0.3)

# Compute kurtosis given 10 trials and 30% probability of success
bin_kurtosis(10, 0.3)
```