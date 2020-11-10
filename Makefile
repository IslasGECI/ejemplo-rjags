all: \
	lint \
	tests \
	coverage

define runLint
	R -e "library(lintr)" \
	  -e "lint_dir('R', linters = with_defaults(line_length_linter(100)))" \
	  -e "lint_dir('tests/testthat', linters = with_defaults(line_length_linter(100)))"
endef

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
	$(runLint)
	$(runLint) | grep -e "\^" && exit 1 || exit 0

tests:
	R -e "testthat::test_dir('tests/testthat/', report = 'summary', stop_on_failure = TRUE)" \
	  -e "devtools::test()"
