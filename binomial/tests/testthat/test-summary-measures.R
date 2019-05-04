context("Test Summary Measures")

test_that("testing aux mean", {
  expect_equal(aux_mean(10, 0.3), 3)
  expect_equal(aux_mean(100,0.3),30)
  expect_equal(aux_mean(0,5),0)
})

test_that("testing aux variance", {
  expect_equal(length(aux_variance(30, 0.3)), 6.3)
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_equal(aux_variance(20, 0.3), 4.2)
})

test_that("testing aux mode", {
  expect_equal(aux_mode(10, 0.3), 3)
  expect_equal(aux_mode(10, 0.35), 3)
  expect_equal(aux_mode(10, 0.39), 4)
  expect_equal(aux_mode(10, 0.4), 4)
})

test_that("testing aux skewness", {
  expect_equal(round(aux_skewness(10, 0.3), 5), 0.27603)
  expect_equal(round(aux_skewness(25, 0.4), 5), 0.08165)
  expect_equal(round(aux_skewness(50, 0.1), 5), 0.37712)
})

test_that("testing aux kurtosis", {
  expect_equal(round(aux_kurtosis(10, 0.3), 5), -0.12381)
  expect_equal(round(aux_kurtosis(20, 0.4), 5), -0.09167)
  expect_equal(round(aux_kurtosis(50, 0.2), 5), 0.005)
})
