source("../../src/functions/make_fit.R")

test_that('ajuste lineal', {
    in_file <- "../../reports/tables/noisy_data.csv"
    resultados <- read.csv(in_file)
    bayesian <- make_fit(resultados)
    predicted_intercept <- as.numeric(bayesian[2])
    expect_equal(predicted_intercept,4.7,tolerance=0.01)
    predicted_slope <- as.numeric(bayesian[4])
    expect_equal(predicted_slope,2.0,tolerance=0.01)
})