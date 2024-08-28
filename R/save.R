save_prompt <- function(
    prompt,
    path
){
  readr::write_lines(prompt, path)
}
