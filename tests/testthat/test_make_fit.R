source("../../src/functions/make_fit.R")

test_that('ajuste lineal', {
    in_file <- "../../reports/tables/noisy_data.csv"
    results <- read.csv(in_file)
    bayesian_fit <- make_fit(results)
    predicted_intercept <- as.numeric(bayesian_fit[2])
    expect_equal(predicted_intercept,5.0,tolerance=0.05)
    predicted_slope <- as.numeric(bayesian_fit[4])
    expect_equal(predicted_slope,2.0,tolerance=0.05)
})