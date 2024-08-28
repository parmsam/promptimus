
<!-- README.md is generated from README.Rmd. Please edit that file -->

# promptimus <img src="man/figures/logo.png" align="right" height="120" alt="" />

<!-- badges: start -->
<!-- badges: end -->

The goal of promptimus is to provide a set of functions to support
prompting to LLMs in R.

## Installation

You can install the development version of promptimus from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("parmsam/promptimus")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(promptimus)

# Use RTF (role then task then format) framework to generate a prompt
rtf("life coach with 30 years of experience in mentoring", "plan to improve my work-life balance", "table")
#> ✔ Copied to clipboard
#> Act like a life coach with 30 years of experience in mentoring. Give me a plan to improve my work-life balance in table format.

# Use Chain of Thought framework to generate a prompt
chain_of_thought("How do I improve my sales calls? I've only got a 15% close rate right now, and I think it's because I'm not selling the dream enough.")
#> ✔ Copied to clipboard
#> How do I improve my sales calls? I've only got a 15% close rate right now, and I think it's because I'm not selling the dream enough.. 
#> 
#> Let's think through it step-by-step.
```
