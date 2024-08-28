#' Fewshot formatted prompt
#'
#' @param text
#' @param instructions
#' @param examples
#' @param template string to format the examples
#' @param prompt_template string to format the prompt
#' @param separator string to separate examples
#' @param copy_to_clipboard boolean to copy to clipboard
#'
#' @return
#' @export
#'
#' @examples
fewshot <- function(
    text,
    instructions = '',
    examples = data.frame(),
    template = 'Text: {text}\nClassification: {label}',
    prompt_template = '{instructions}{examples}{input}',
    separator = '\n\n',
    copy_to_clipboard = TRUE
){
  if(nrow(examples) == 0){
    examples <- ''
  } else{
    examples <- examples |>
      dplyr::mutate(prompt_segment = glue::glue(template))

    examples <- examples$prompt_segment |>
      paste(collapse = separator) |>
      paste0(separator)
  }

  if(nchar(instructions) > 0){
    instructions <- paste0(instructions, separator)
  }

  input <- template |>
    stringr::str_replace('\\{label\\}.*', '') |>
    stringr::str_trim() |>
    glue::glue()

  glue_copy(prompt_template, .copy_to_clipboard = copy_to_clipboard)
}
