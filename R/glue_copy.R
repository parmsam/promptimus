#' Use Glue and Copy String
#'
#' @param ...
#' @param .sep
#' @param .envir
#' @param .open
#' @param .close
#' @param .na
#' @param .null
#' @param .comment
#' @param .literal
#' @param .transformer
#' @param .trim
#' @param .copy_to_clipboard
#' @param .copy_message
#'
#' @return
#' @export
#'
#' @examples
glue_copy <- function(
    ...,
    .sep = "",
    .envir = parent.frame(),
    .open = "{",
    .close = "}",
    .na = "NA",
    .null = character(),
    .comment = "#",
    .literal = FALSE,
    .trim = TRUE,
    .copy_to_clipboard = TRUE,
    .copy_message = "Copied to clipboard"
) {
  data <- glue::glue(
    ...,
    .sep = "",
    .envir = parent.frame(),
    .open = "{",
    .close = "}",
    .na = "NA",
    .null = character(),
    .comment = "#",
    .literal = FALSE,
    .trim = TRUE
  )
  if(.copy_to_clipboard){
    copy_with_message(data, .copy_message)
  }
  return(data)
}

#' Copy to Clipboard with Cli Message
#'
#' @param x string to copy to clipboard
#' @param message message to display
#'
#' @return
#'
#' @examples
copy_with_message <- function(
    x,
    message = "Copied to clipboard"
){
  clipr::write_clip(x, allow_non_interactive = TRUE)
  cli::cli_alert_success(text = "{message}")
}
