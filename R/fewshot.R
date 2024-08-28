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

# scotus_tweets_examples <- structure(list(tweet_id = c("26730338_2018-06-04T16:12:13.000Z",
#                                                       "236655360_2018-06-04T14:24:46.000Z", "1478101897_2018-06-04T18:09:51.000Z",
#                                                       "21792408_2018-06-04T15:46:03.000Z", "772279633060491264_2018-06-04T14:47:05.000Z",
#                                                       "32117789_2018-06-05T02:04:20.000Z", "33791935_2020-07-09T14:25:25.000Z",
#                                                       "993217899354644481_2020-07-14T21:40:55.000Z", "2672494308_2020-07-09T05:14:01.000Z",
#                                                       "23118829_2020-07-09T14:18:05.000Z", "3321922645_2020-07-09T14:33:13.000Z",
#                                                       "28869632_2020-07-09T14:30:39.000Z"), text = c("Thank you Supreme Court I take pride in your decision!!!!✝️ #SCOTUS",
#                                                                                                      "Supreme Court rules in favor of Colorado baker! This day is getting better by the minute!",
#                                                                                                      "Can’t escape the awful irony of someone allowed to use religion to discriminate against people in love. \r\nNot my Jesus. \r\n#opentoall #SCOTUS #Hypocrisy #MasterpieceCakeshop",
#                                                                                                      "I can’t believe this cake case went all the way to #SCOTUS . Can someone let me know what cake was ultimately served at the wedding? Are they married and living happily ever after?",
#                                                                                                      "Supreme Court rules in favor of baker who would not make wedding cake for gay couple",
#                                                                                                      "#SCOTUS set a dangerous precedent today. Although the Court limited the scope to which a business owner could deny services to patrons, the legal argument has been legitimized that one's subjective religious convictions trump (no pun intended) #humanrights. #LGBTQRights",
#                                                                                                      "Justice #ClarenceThomas is waste of space on the #scotus", "BREAKING: Supreme Court Justice Ruth Bader Ginsburg has been hospitalized for a possible infection, per a SCOTUS spokesperson. @Scotus @ruthbadergins",
#                                                                                                      "The Supreme Court is going to disappoint us tomorrow. And trump will feel even more untouchable. He’ll brag about it at his Klan rallies. Sweaty orange spray tan pooling above his lip, smug faced as he gloats and brags. It makes me sick.",
#                                                                                                      "SCOTUS just ruled Manhattan DA CAN get trumps financials and tax returns.  This is a great day for the ruke of law and America.",
#                                                                                                      "Today the Supreme Court let @realDonaldTrump know that he is not above the law!",
#                                                                                                      "Both SCOTUS rulings in Trump financial records sent back to lower courts. Practically speaking that means no turnover of records immediately in either case. #7News"
#                                                       ), case = c("masterpiece", "masterpiece", "masterpiece", "masterpiece",
#                                                                   "masterpiece", "masterpiece", "mazars", "mazars", "mazars", "mazars",
#                                                                   "mazars", "mazars"), label = c("Positive", "Positive", "Negative",
#                                                                                                  "Neutral", "Neutral", "Negative", "Negative", "Neutral", "Negative",
#                                                                                                  "Positive", "Positive", "Neutral")), row.names = c(NA, -12L), class = c("tbl_df",
#                                                                                                                                                                          "tbl", "data.frame"))
#
# fewshot(text = "I am disappointed with this ruling.",
#               instructions = "Decide if the sentiment of this statement is Positive or Negative.",
#               examples = scotus_tweets_examples,
#               template = "Statement: {text}\nSentiment: {label}",
#         copy_to_clipboard = F)
#
# fewshot(text = 'I am sad about the Supreme Court',
#               examples = scotus_tweets_examples,
#               template = '"{text}" is a {label} statement',
#               separator = '\n')
