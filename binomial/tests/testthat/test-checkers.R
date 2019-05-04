context("Tests for the check functions")

test_that("testing check_prob", {
  expect_true(check_prob(0.5))
  expect_true(check_prob(0))
  expect_true(check_prob(1))
  expect_error(check_prob(-1))
  expect_error(check_prob(2))
  length(check_prob(0.5)) == 1
})

test_that("testing check_trials", {
  expect_true(check_trials(0))
  expect_true(check_trials(1))
  expect_error(check_trials(-1))
})

test_that("testing check_success", {
  expect_true(check_success(2, 5))
  expect_true(check_success(1:4, 5))
  expect_error(check_success(6, 5))
  expect_error(check_success(2:7, 5))
})
