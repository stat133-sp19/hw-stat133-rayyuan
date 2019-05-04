context("Tests for the check functions")

test_that("testing check_prob", {
  expect_true(check_prob(0.4))
  expect_true(check_prob(1))
  expect_true(check_prob(0))
  expect_error(check_prob(5))
  expect_error(check_prob(-2))
})

test_that("testing check_trials", {
  expect_true(check_trials(0))
  expect_error(check_trials(-2))
  expect_true(check_trials(4))
})

test_that("testing check_success", {
  expect_error(check_success(3, 2))
  expect_error(check_success(0:4, 3))
  expect_true(check_success(3, 5))
  expect_true(check_success(1:5, 5))

})
