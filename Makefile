all: \
	lint \
	tests \
	coverage

.PHONY: all clean coverage lint tests

clean:
	rm *.tar.gz

coverage:
	R -e "covr::package_coverage()"

format:
	R -e "library(styler)" \
	  -e "style_dir('tests')" \
	  -e "style_dir('R')"
lint:
	R -e "lintr::lint('R/make_fit.R', linters = with_defaults(line_length_linter(100)))"

tests:
	R -e "testthat::test_dir('tests/testthat/', report = 'summary', stop_on_failure = TRUE)" \
	  -e "devtools::test()"
