
# promptimus <img src="man/figures/logo.png" align="right" height="120" alt="" />

<!-- badges: start -->
<!-- badges: end -->

The goal of promptimus is to provide a set of functions to support prompting to LLMs in R.

## Installation

You can install the development version of promptimus like so:

``` r
# install.packages("devtools")
devtools::install_github("parmsam/promptimus")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(promptimus)
rtf("life coach with 30 years of experience in mentoring", "plan to improve my work-life balance", "table")
```

