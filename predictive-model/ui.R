
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
        # Set the page title
        titlePanel("Swift Key:John Hopkins Data science capstone project"),
        
        sidebarPanel(
          textInput("entry",
                    h5("Input the sentence"),
                    "John Hopkins"),
          numericInput("n",
                       h5("Numbers of predicted words"),
                       value = 3),
          radioButtons("radio",
                       h5("Smoothing"),
                       choices = list("Stupid Back-off" = 1, "Kneser-Ney " = 2),
                       selected = 1),
          submitButton("SUBMIT"),
          br(),
          img(src = "logo1.jpg", height = 50, width = 50),
          "This app is created by ",
          a("Andrew Kireru", href = "gitobuk@gmail.com"),
        p(strong(em("Github repository:",a("A John Hopkins University - Capstone Project",href="https://github.com/kireru/john-hopkins-data-science-capstone-project/tree/master"))))
        ),
        mainPanel(
          tabsetPanel(type = "tabs",
                      tabPanel("TYPE THE WORDS",
                               h4("Preamble"),
                               p('Predictive text algorithm used to make an accompanying shiny application based on frequency of occurrence of n-grams. This is inspired by Swift key predictive keyboard. As you can see, there is a predicted text when you type certain words.'),
                               h4("How to Use"),
                               p("Where you input a sentence in the topleft panel, then select the number of words you'd like to see, e.g. 3 words by default and try to find a smooth method for the n-gram model. Then press the SUBMIT button. You will see:"),
                               p('As your sentence'),
                            
                              tags$style(type='text/css', '#sent {background-color: rgba(0,0,255,0.10); color: blue;font-size:25px;}'), 
                               h4(verbatimTextOutput("sent"),style = "color:green"),                               
                               h6('AND'),
                              tags$style(type='text/css', '#text {background-color: rgba(255,255,0,0.10); color: green;font-size:30px;}'),
                               span(h4(verbatimTextOutput('text'),style = "color:green")),                              
                               p('as predicted word/s or a WARNING.'),
                               'procedure explained in the',
                               span('process',style = "color:blue"),
                               'tag and other issues in the',
                               span('Shortcomings,',style = "color:blue"),
                               'tag.'),
                        tabPanel('The process',
                                 h5('This is how it is done'),
                                 verbatimTextOutput("oiBMI"),
                                 verbatimTextOutput("oiBMIclass"),
                                 img(src="ney.jpg", height = 500, width =500),
                                 p("View This: ", a("Text Mining process", 
                                                 href = "http://www.r-bloggers.com/text-mining/")),
                                 p("And This: ", a("ngrams", 
                                                    href = "http://www.slideshare.net/ShangxuanZhang/introducing-nlp-with-r"))
                        ),
                      
                      tabPanel("Shortcomings",
                              h5("Kneser-Ney Smoothing is slow"),
                              p('Well, I suggested using Stupid Kick-off first as it fast and then using Kneser-Ney when necessary because it is usually slow.'),
                              h5("words!"),
                              p("Dirty words will be deleted from the final result."),
                              h5("Nothing return when you input something?"),
                              p('This will occur when you only input punctuation, numbers and some common words. The model will remove them in the input and nothing will return.'),
                              h4("Important"),
                              p("To make this model faster, I only extracted the terms occurred in the whole sources more than 5 times. ")              
                      ),
                      tabPanel("Reference",
                               p("Körner, M. C. (n.d.). Implementation of Modified Kneser-Ney Smoothing on Top of Generalized Language Models for Next Word Prediction Bachelorarbeit, (September 2013)."),
                               p("Williams, G. (2014). Data Science with R Text Mining."),
                               p("Kneser, Ney (1995). Improved backing-off for m-gram language modeling"),
                               p("Christopher D. Manning, Hinrich Schütze, Foundations of Statistical Natural Language Processing")
                               
                      )
          ))
))
