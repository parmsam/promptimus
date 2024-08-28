
<!-- README.md is generated from README.Rmd. Please edit that file -->

# promptimus <img src="man/figures/logo.png" align="right" height="120" alt="" />

<!-- badges: start -->
<!-- badges: end -->

The goal of promptimus is to provide a set of R functions to support LLM
prompt generation. The package includes simple functions for popular
prompt generation frameworks such as RTF (role, task, format), Chain of
Thought, Fewshot, and Prompt Chaining.

## Installation

You can install the development version of promptimus from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("parmsam/promptimus")
```

## Example

This is a basic example which shows you how to solve a common problem:

### Role-Task-Format

``` r
library(promptimus)

# Use RTF (role then task then format) framework to generate a prompt
x <- rtf(
  role = "life coach with 30 years of experience in mentoring",   
  task = "plan to improve my work-life balance", 
  format = "table"
)
#> ✔ Copied to clipboard
strwrap(x, width = 80)
#> [1] "Act like a life coach with 30 years of experience in mentoring. Give me a plan"
#> [2] "to improve my work-life balance in table format."
```

## Chain of thought

``` r
# Use Chain of Thought framework to generate a prompt
x <- chain_of_thought(
  instructions = "How do I improve my sales calls? I've only got a 15% close rate right now, and I think it's because I'm not selling the dream enough."
)
#> ✔ Copied to clipboard
strwrap(x, width = 80)
#> [1] "How do I improve my sales calls? I've only got a 15% close rate right now, and"
#> [2] "I think it's because I'm not selling the dream enough.."                       
#> [3] ""                                                                              
#> [4] "Let's think through it step-by-step."
```

### Fewshot

``` r
tweets <- tibble::tribble(
  ~text,         ~case,     ~label,
  "Thank you Supreme Court! #SCOTUS", "masterpiece", "Positive",
  "Court rules in favor of Colorado baker!", "masterpiece", "Positive",
  "Religion used to discriminate. #SCOTUS #MasterpieceCakeshop", "masterpiece", "Negative",
  "Can't believe this cake case went to #SCOTUS.", "masterpiece",  "Neutral",
  "Court supports baker refusing gay couple's cake.", "masterpiece",  "Neutral",
  "#SCOTUS legitimizes religious convictions over #humanrights. #LGBTQRights", "masterpiece", "Negative",
  "#ClarenceThomas is a waste on #scotus",      "mazars", "Negative",
  "Justice Ginsburg hospitalized, says #SCOTUS spokesperson.",      "mazars",  "Neutral",
  "Trump will gloat if Court disappoints us tomorrow.",      "mazars", "Negative",
  "SCOTUS: Manhattan DA can get Trump's tax returns.",      "mazars", "Positive",
  "Supreme Court says Trump is not above the law.",      "mazars", "Positive",
  "SCOTUS rulings send Trump financial records back to lower courts.",      "mazars",  "Neutral"
)
x <- fewshot(text = "I am disappointed with this ruling.",
              instructions = "Decide if the sentiment of this statement is Positive or Negative.",
              examples = tweets,
              template = "Statement: {text}\nSentiment: {label}",
        copy_to_clipboard = F)
x
#> Decide if the sentiment of this statement is Positive or Negative.
#> 
#> Statement: Thank you Supreme Court! #SCOTUS
#> Sentiment: Positive
#> 
#> Statement: Court rules in favor of Colorado baker!
#> Sentiment: Positive
#> 
#> Statement: Religion used to discriminate. #SCOTUS #MasterpieceCakeshop
#> Sentiment: Negative
#> 
#> Statement: Can't believe this cake case went to #SCOTUS.
#> Sentiment: Neutral
#> 
#> Statement: Court supports baker refusing gay couple's cake.
#> Sentiment: Neutral
#> 
#> Statement: #SCOTUS legitimizes religious convictions over #humanrights. #LGBTQRights
#> Sentiment: Negative
#> 
#> Statement: #ClarenceThomas is a waste on #scotus
#> Sentiment: Negative
#> 
#> Statement: Justice Ginsburg hospitalized, says #SCOTUS spokesperson.
#> Sentiment: Neutral
#> 
#> Statement: Trump will gloat if Court disappoints us tomorrow.
#> Sentiment: Negative
#> 
#> Statement: SCOTUS: Manhattan DA can get Trump's tax returns.
#> Sentiment: Positive
#> 
#> Statement: Supreme Court says Trump is not above the law.
#> Sentiment: Positive
#> 
#> Statement: SCOTUS rulings send Trump financial records back to lower courts.
#> Sentiment: Neutral
#> 
#> Statement: I am disappointed with this ruling.
#> Sentiment:
```

# Credit

- [fewshot()](R/fewshot.R) is taken directly from
  [{promptr}](https://github.com/joeornstein/promptr) originally written
  by [Joe Ornstein](https://github.com/joeornstein).
