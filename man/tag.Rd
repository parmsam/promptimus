% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/frameworks.R
\name{tag}
\alias{tag}
\title{Use TAG framework to create a prompt}
\usage{
tag(
  task,
  action,
  goal,
  template = "The task is to {task}. {action}. Goal is to {goal}.",
  copy_to_clipboard = TRUE
)
}
\arguments{
\item{template}{string to format the examples}

\item{copy_to_clipboard}{boolean to copy to clipboard}
}
\description{
Use TAG framework to create a prompt
}
\examples{
tag("create a marketing plan for my new product", "start by researching the market and identifying the target audience", "increase sales by 20\% in the next quarter")
}
