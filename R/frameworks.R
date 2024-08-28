
#' Use RTF framework to create a prompt
#'
#' @param role
#' @param task
#' @param format
#' @param template
#' @param copy_to_clipboard
#'
#' @return
#' @export
#'
#' @examples
rtf <- function(
  role,
  task,
  format,
  template = "Act like a {role}. Give me a {task} in {format} format.",
  copy_to_clipboard = TRUE
){
  glue_copy(template, .copy_to_clipboard = copy_to_clipboard)
}

# rtf("life coach with 30 years of experience in mentoring", "plan to improve my work-life balance", "table")


tag <- function(
  task,
  action,
  goal,
  template = "The task is to {task}. {action}. Goal is to {goal}.",
  copy_to_clipboard = TRUE
){
  action <- paste0(toupper(substr(action, 1, 1)), substr(action, 2, nchar(action)))
  glue_copy(template, .copy_to_clipboard = copy_to_clipboard)
}

# tag("create a marketing plan for my new product", "start by researching the market and identifying the target audience", "increase sales by 20% in the next quarter")


bab <- function(
  before,
  after,
  bridge,
  template = "Before: {before}. \n\n After: {after}. \n\n Bridge: {bridge}",
  copy_to_clipboard = TRUE
){
  glue_copy(template, .copy_to_clipboard = copy_to_clipboard)
}

# bab(
#   before = "We're struggling to get traffic to our website",
#   after = "We want to be top 10 in SEO rankings in our niche in 90 days",
#   bridge = "Develop a detailed plan for mentioning all the measures we should take also include list of top 20 keywords"
# )


risen <- function(
  role,
  instructions,
  steps,
  end_goal,
  narrowing,
  template = "Role: {role} \n\n Main Task: {instructions} \n\n Steps to complete task: {steps} \n\n Goal: {end_goal} \n\n Constraints: {narrowing}",
  copy_to_clipboard = TRUE
){
  glue_copy(template, .copy_to_clipboard = copy_to_clipboard)
}

# risen(
#   role = "You are an expert digital course builder who has sold millions in online courses.",
#   instructions = "Please give me a list of EVERYTHING important that I should include in my AI course and tell me all the different methods of growth I can implement to maximise revenue",
#   steps = "
# 1. First start by covering all the things that ANY digital course should include.
#
# 2. Then proceed by giving your thoughts on what AI courses should include.
#
# 3. End with covering the best growth marketing tactics and strategies for digital courses.",
#   end_goal = "The goal is to give me a concise list of everything I should include within the course, as well as give me ideas on how I can maximize the revenue from my course.",
#   narrowing = "Maximum of 500 words. - Avoid technical jargon. - Make it actionable - Make it clear"
# )


rodes <- function(
  role,
  objective,
  details,
  examples,
  sense_check,
  template = "Role: {role} \n\n Objective: {objective} \n\n Details: {details} \n\n Examples: {examples} \n\n Sense Check: {sense_check}",
  copy_to_clipboard = TRUE
){
  glue_copy(template, .copy_to_clipboard = copy_to_clipboard)
}

# rodes(
#   role = "You are a seasoned marketing professional with 10 years of experience in the industry.",
#   objective = "Please give me a list of the top 10 marketing strategies that I should implement to increase my sales by 20% in the next quarter.",
#   details = "- The tweet should be no longer than 280 characters.
#   - Use powerful and persuasive language.
#   - Do not include hashtags or emojis.",
#   examples = 'Here are some examples you should use to model your answer (note - these are not on my desired topic. I just want you to understand the frameworks and styles that work")
# 1."Credit card debt is killing your financial progress.
# Heres how you get rid of it ASAP:"',
#   sense_check = "Do you understand the objective and the specific guidelines for this task?"
# )


chain_of_thought <- function(
    instructions,
    template = "{instructions}. \n\n Let's think through it step-by-step.",
    copy_to_clipboard = TRUE
){
  glue_copy(template, .copy_to_clipboard = copy_to_clipboard)
}

# chain_of_thought("How do I improve my sales calls? I've only got a 15% close rate right now, and I think it's because I'm not selling the dream enough.")


chain_of_destiny <- function(
    instructions,
    recursion,
    benchmark,
    additional_guidelines,
    template = "Instructions: {instructions} \n\n Recursion: {recursion} \n\n Benchmark: {benchmark} \n\n Additional Guidelines: {additional_guidelines}",
    copy_to_clipboard = TRUE
){
  glue_copy(template, .copy_to_clipboard = copy_to_clipboard)
}

# chain_of_destiny(
#   instructions = 'Here is a prompt I use to generate cold emails for my landing page creation agency: "I need a cold email idea that will engage my [ideal customer] with a unique perspective on [subject] and persuade them to take [desired action]"
# You will generate increasingly improved versions of this prompt.',
# recursion = "Repeat the following 2 steps 5 times.
# Step 1. Identify 1-3 points from the initial output which are missing.
# Step 2. Write a new, improved output of identical length which includes the missing points.",
# benchmark = "Here is more information on what makes a good prompt:
# - Clarity and Specificity
# - Be Clear: The prompt should be easy to understand.
# - Be Specific: Vague questions will often yield vague answers. The more specific you are, the better the AI can generate a targeted response.
# - Open-Ended vs Closed-Ended
# - Open-Ended: Use open-ended questions for comprehensive answers or when you want the AI to generate multiple ideas.
# - Closed-Ended: Use yes/no or either/or questions when you need a straightforward answer.",
# additional_guidelines = "Remember to repeat the process 5 times"
# )
