context("Test Binomial Functions")

test_that("test bin choose", {
  expect_equal(bin_choose(5,2), 10)
  expect_length(bin_choose(5, 2), 1)
  expect_equal(bin_choose(12, c(10, 11)), c(66, 12))
  expect_error(bin_choose(5,6))
  expect_error(bin_choose(5, 1:6))
})

test_that("test bin probability", {
  expect_error(bin_probability(2, 10, 2))
  expect_error(bin_probability(2, -10, 0.5))
  expect_length(bin_probability(55, 100, 0.45), 1)
  expect_equal(bin_probability(2, 5,0.5), 0.3125)
})

test_that("test bin distribution", {
  expect_s3_class(bin_distribution(50, 0.2), "bindis")
  expect_s3_class(bin_distribution(50, 0.2), "data.frame")
  expect_error(bin_distribution(-10, 0.5))
  expect_length(bin_distribution(8, 0.5), 2)
  expect_equal(bin_distribution(50, 0.2)$probability[3], 0.001092737)
})

test_that("test bin cumulative", {
  expect_error(bin_cumulative(5, -0.5))
  expect_s3_class(bin_cumulative(trials = 5, prob = 0.5), "data.frame")
  expect_s3_class(bin_cumulative(trials = 5, prob = 0.5), "bincum")
  expect_equal(bin_cumulative(trials = 5, prob = 0.5)$cumulative[2], 0.18750)

})
