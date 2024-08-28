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

# Define the mock model interaction function
model_function <- function(
    prompt,
    seconds_delay = 20
){
  x <- openai::create_chat_completion(
    model = "gpt-3.5-turbo",
    messages = list(
      list(
        "role" = "user",
        "content" = prompt
      )
    )
  )
  Sys.sleep(seconds_delay)
  return(x$choices$message.content)
}
#
# Define your prompts
prompts <- list(
  "Translate the given Spanish text into English: En las últimas dos décadas, América Latina ha experimentado un progreso significativo en el acceso a la educación. Según datos de la UNESCO, la tasa neta de matriculación en la educación primaria ha alcanzado el 94% en la región. Sin embargo, persisten desafíos importantes en términos de calidad y equidad.

Por ejemplo, aunque el 85% de los jóvenes de la región completan la educación secundaria, existe una gran disparidad entre los países. En Uruguay, el 92% de los jóvenes completa la secundaria, mientras que en Guatemala solo el 53% lo hace.

Además, la inversión en educación sigue siendo insuficiente en varios países. Según el Banco Mundial, el gasto público en educación como porcentaje del PIB es del 4.5% en promedio, con países como Chile y Brasil invirtiendo cerca del 5.4%, en contraste con Haití, que invierte solo el 2.5%.",
  "Fetch the statistics and facts from the text.",
  "Create a bullet point list of all these facts",
  "Translate them into the Spanish langauge."
)

responses <- chain_prompts(prompts, model_function)

print(responses)
