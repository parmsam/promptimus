#' Save prompt to text file
#'
#' @param prompt string with prompt to save to file
#' @param path full file path to save the prompt to
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#'  save_prompt("This is a prompt", "file.txt")
#' }
save_prompt <- function(
    prompt,
    path
){
  writeLines(prompt, path)
}
