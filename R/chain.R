#' Chain prompts together
#'
#' @param prompts list of prompt strings to chain together
#' @param model_function function that takes a prompt string and returns a response string from the LLM
#'
#' @return
#' @export
#'
#' @examples
chain_prompts <- function(prompts, model_function) {
  responses <- list()

  for (i in seq_along(prompts)) {
    if (i == 1) {
      # First prompt does not include any previous response
      response <- model_function(prompts[[i]])
    } else {
      # Subsequent prompts only concatenate the immediate previous response
      previous_response <- responses[[i - 1]]
      response <- model_function(paste(prompts[[i]], "\nPrevious Response:", previous_response))
    }
    # Store the response for the next prompt in the chain
    responses[[i]] <- response
  }
  return(responses)
}
