% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/frameworks.R
\name{risen}
\alias{risen}
\title{Use RISEN framework to create a prompt}
\usage{
risen(
  role,
  instructions,
  steps,
  end_goal,
  narrowing,
  template =
    "Role: {role} \\n\\n Main Task: {instructions} \\n\\n Steps to complete task: {steps} \\n\\n Goal: {end_goal} \\n\\n Constraints: {narrowing}",
  copy_to_clipboard = TRUE
)
}
\arguments{
\item{template}{string to format the examples}

\item{copy_to_clipboard}{boolean to copy to clipboard}
}
\description{
Use RISEN framework to create a prompt
}
\examples{
risen(
  role = "You are an expert digital course builder who has sold millions in online courses.",
  instructions = "Please give me a list of EVERYTHING important that I should include in my AI course and tell me all the different methods of growth I can implement to maximise revenue",
  steps = "
1. First start by covering all the things that ANY digital course should include.

2. Then proceed by giving your thoughts on what AI courses should include.

3. End with covering the best growth marketing tactics and strategies for digital courses.",
  end_goal = "The goal is to give me a concise list of everything I should include within the course, as well as give me ideas on how I can maximize the revenue from my course.",
  narrowing = "Maximum of 500 words. - Avoid technical jargon. - Make it actionable - Make it clear"
)
}
