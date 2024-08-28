copy_with_message <- function(
    x,
    message = "Copied to clipboard"
){
  clipr::write_clip(x)
  cli::cli_alert_success(text = "{message}")
}

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
    .transformer = identity_transformer,
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
    .transformer = identity_transformer,
    .trim = TRUE
  )
  if(.copy_to_clipboard){
    copy_with_message(data, .copy_message)
  }
  return(data)
}
