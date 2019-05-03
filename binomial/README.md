## Overview
`binomial` is an R package that works with binomial probability distributions. It allows users to calculate certain stats about these distributions.

## Installation
```
#install "binomial" without vignettes
devtools::install_github("stat133-sp19/hw-stat133-rayyuan/tree/master/binomial")

#install "binomial" with vignettes
devtools::install_github("stat133-sp19/hw-stat133-rayyuan/tree/master/binomial", build_vignettes = TRUE)
```

### Available Functions
#If a user built with vignettes, there is more detailed documentation there

`bin_choose(n, k)` n choose k

`bin_probability(success, trials, prob)` gets probability of a # successes in # trials with a probability "prob"

`bin_variable(trials, prob)` makes a binomial random variable object given num trials and probability of success

`bin_distribution(success, trials, prob)` Computes probability distribution of # succcesses given #trials and probability "prob"

`bin_cumulative(success, trials, prob)` Computes cumulative probability distribution of # succcesses given #trials and probability "prob"

`summary()` Creates a summary dataframe for binvar objects

`plot()` Plots a bindis or bincum object

`bin_mean(trials, prob)` mean of a binomial random variable.

`bin_variance(trials, prob)` variance of a binomial random variable.

`bin_mode(trials, prob)` mode of a binomial random variable.

`bin_skewness(trials, prob)` skewness of a binomial random variable.

`bin_kurtosis(trials, prob)`  kurtosis of a binomial random variable.


### Usage
```
library(binomial)

#All package functions and their parameters and explanation of the parameters are included in the "Available Functions" Section. Below are a couple examples.

#choose 2 objects from 3 objects
bin_choose(n = 3,k = 2) ##returns 3

# returns mean with 100 trials and 20% probability of success
bin_mean(trials = 100, prob = 0.2) ##returns 20

```