context("Test Binomial Functions")

test_that("testing bin choose", {
  expect_equal(bin_choose(5,2), 10)

  expect_equal(bin_choose(5, 1:5), c(5, 10, 10,  5,  1))
  expect_error(bin_choose(5,6))
  expect_error(bin_choose(5, 1:6))
})

test_that("testing bin probability", {
  expect_equal(bin_probability(success = 2, trials = 5, prob = 0.5), 0.3125)
  expect_equal(bin_probability(success = 0:2, trials = 5, prob = 0.5), c(0.03125, 0.15625, 0.31250))
  expect_equal(bin_probability(success = 55, trials = 100, prob = 0.45), 0.01075277)
  expect_error(bin_probability(success = 6, trials = 5, prob = 0.5))
  expect_error(bin_probability(success = 0:5 , trials = 5, prob = 0.5))
})

test_that("testing bin distribution", {
  expect_equal(bin_distribution(50, 0.2)$probability[3], 0.001092737)
  expect_equal(bin_distribution(72, 0.74)$probability[3], 1.20856e-13)
  expect_equal(bin_distribution(72, 0.74)$probability[62], 0.01169977)
  expect_equal(bin_distribution(152, 0.4)$probability[100], 2.305374e-10)
  expect_s3_class(bin_distribution(50, 0.2), "bindis")
  expect_s3_class(bin_distribution(50, 0.2), "data.frame")
})

test_that("testing bin cumulative", {
  expect_equal(bin_cumulative(trials = 5, prob = 0.5)$cumulative[2], 0.18750)
  expect_equal(bin_cumulative(trials = 10, prob = 0.2)$cumulative[4], (0.8791261 + 1.84e-08))
  expect_s3_class(bin_cumulative(trials = 5, prob = 0.5), "bincum")
  expect_s3_class(bin_cumulative(trials = 5, prob = 0.5), "data.frame")
})
