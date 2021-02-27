

# message to display if non-null true value
nonnull.mess = 'Note: You are calculating a "non-null" E-value, i.e., an E-value for the minimum
                amount of unmeasured confounding needed to move the estimate and confidence interval
                to your specified true value rather than to the null value.'

# message to display for OLS
OLS.mess = 'Note: Using the standard deviation of the outcome yields a conservative approximation
of the standardized mean difference. For a non-conservative estimate, you could instead use the estimated ressidual standard deviation from your linear
regression model. Regardless, the reported E-value for the confidence interval treats the
standard deviation as known, not estimated.'



# ui =
#
#     fluidPage(
#
#             theme = shinytheme("flatly"),
#
#             mainPanel(
#
#                       mainPanel(
#                           selectInput( "outcomeType", label = "Outcome type",
#                                        choices = c( "Relative risk / rate ratio" = "RR",
#                                                     "Odds ratio (outcome prevalence <15%)" = "OR.rare",
#                                                     "Odds ratio (outcome prevalence >15%)" = "OR.com",
#                                                     "Hazard ratio (outcome prevalence <15%)" = "HR.rare",
#                                                     "Hazard ratio (outcome prevalence >15%)" = "HR.com",
#                                                     "Standardized mean difference (d)" = "MD",
#                                                     "Risk difference" = "RD",
#                                                     "Linear regression coefficient" = "OLS" ) ),
#
#
#                           # conditional panels that appear depending on selected outcome type
#
#                           conditionalPanel(
#                               condition = "input.outcomeType == 'RR' ",
#
#                               numericInput('est.RR', 'Point estimate', NA, min = 1, max = 9),
#                               numericInput('lo.RR', 'Confidence interval lower limit', NA, min = 1, max = 9),
#                               numericInput('hi.RR', 'Confidence interval upper limit', NA, min = 1, max = 9),
#                               numericInput('trueRR', 'True causal effect to which to shift estimate (default: null)', 1, min = 1, max = 9)
#                           ) ,
#
#                           conditionalPanel(
#
#                               condition = "input.outcomeType == 'OR.rare' ",
#
#                               numericInput('est.OR.rare', 'Point estimate', NA, min = 1, max = 9),
#                               numericInput('lo.OR.rare', 'Confidence interval lower limit', NA, min = 1, max = 9),
#                               numericInput('hi.OR.rare', 'Confidence interval upper limit', NA, min = 1, max = 9),
#                               numericInput('trueORrare', 'True causal effect to which to shift estimate (default: null)', 1, min = 1, max = 9)
#                           ),
#
#                           conditionalPanel(
#                               condition = "input.outcomeType == 'OR.com' ",
#
#                               numericInput('est.OR.com', 'Point estimate', NA, min = 1, max = 9),
#                               numericInput('lo.OR.com', 'Confidence interval lower limit', NA, min = 1, max = 9),
#                               numericInput('hi.OR.com', 'Confidence interval upper limit', NA, min = 1, max = 9),
#                               numericInput('trueORcom', 'True causal effect to which to shift estimate (default: null)', 1, min = 1, max = 9)
#                           ),
#
#                           conditionalPanel(
#                               condition = "input.outcomeType == 'HR.rare' ",
#
#                               numericInput('est.HR.rare', 'Point estimate', NA, min = 1, max = 9),
#                               numericInput('lo.HR.rare', 'Confidence interval lower limit', NA, min = 1, max = 9),
#                               numericInput('hi.HR.rare', 'Confidence interval upper limit', NA, min = 1, max = 9),
#                               numericInput('trueHRrare', 'True causal effect to which to shift estimate (default: null)', 1, min = 1, max = 9)
#                           ),
#
#                           conditionalPanel(
#                               condition = "input.outcomeType == 'HR.com' ",
#
#                               numericInput('est.HR.com', 'Point estimate', NA, min = 1, max = 9),
#                               numericInput('lo.HR.com', 'Confidence interval lower limit', NA, min = 1, max = 9),
#                               numericInput('hi.HR.com', 'Confidence interval upper limit', NA, min = 1, max = 9),
#                               numericInput('trueHRcom', 'True causal effect to which to shift estimate (default: null)', 1, min = 1, max = 9)
#                           ),
#
#                           conditionalPanel(
#                               condition = "input.outcomeType == 'OLS' ",
#                               numericInput('estOLS', 'Regression coefficient estimate', NA, min = 1, max = 9),
#                               numericInput('seOLS', 'Standard error of coefficient', NA, min = 1, max = 9),
#                               numericInput('sdOLS', 'Standard deviation of outcome', NA, min = 1, max = 9),
#                               numericInput('deltaOLS', 'Contrast of interest in exposure', 1, min = 1, max = 9),
#                               numericInput('trueOLS', 'True causal effect to which to shift estimate (on standard mean difference scale; default: null)', 0, min = 1, max = 9)
#                           ),
#
#                           conditionalPanel(
#                               condition = "input.outcomeType == 'MD' ",
#
#                               numericInput('est.MD', 'Point estimate', 0, min = 1, max = 9),
#                               numericInput('se.MD', 'Standard error', NA, min = 1, max = 9),
#                               numericInput('trueMD', 'True causal effect to which to shift estimate (default: null)', 0, min = 1, max = 9)
#                           ),
#
#                           conditionalPanel(
#                               condition = "input.outcomeType == 'RD' ",
#
#                               numericInput('n11', 'Number of exposed, diseased individuals', NA, min = 1, max = 9),
#                               numericInput('n10', 'Number of exposed, non-diseased individuals', NA, min = 1, max = 9),
#                               numericInput('n01', 'Number of unexposed, diseased individuals', NA, min = 1, max = 9),
#                               numericInput('n00', 'Number of unexposed, non-diseased individuals', NA, min = 1, max = 9),
#                               numericInput('alpha', 'Alpha level for confidence interval', 0.05, min = 1, max = 9),
#                               numericInput('grid', 'Spacing for grid search of E-value', 0.0001, min = 1, max = 9),
#                               numericInput('trueRD', 'True causal effect to which to shift estimate (default: null)', 0, min = 1, max = 9)
#                           ),
#
#                           # display results
#                           wellPanel(  span( textOutput("result.text") ) ),
#
#                           # warnings if computing non-null E-value
#                           # note: because the condition is in Javascript, have to use period instead of dollar sign to
#                           #  access arguments, so CANNOT have period in the variable names (e.g., "true.RR" doesn't work!)
#                           conditionalPanel( condition = "input.outcomeType == 'RR' & input.trueRR != 1", nonnull.mess),
#                           conditionalPanel( condition = "input.outcomeType == 'OR.rare' & input.trueORrare != 1", nonnull.mess),
#                           conditionalPanel( condition = "input.outcomeType == 'OR.com' & input.trueORcom != 1", nonnull.mess),
#                           conditionalPanel( condition = "input.outcomeType == 'HR.rare' & input.trueHRrare != 1", nonnull.mess),
#                           conditionalPanel( condition = "input.outcomeType == 'HR.com' & input.trueHRcom != 1", nonnull.mess),
#                           conditionalPanel( condition = "input.outcomeType == 'OLS' & input.trueOLS != 0", nonnull.mess),
#                           conditionalPanel( condition = "input.outcomeType == 'MD' & input.trueMD != 0", nonnull.mess),
#                           conditionalPanel( condition = "input.outcomeType == 'RD' & input.trueRD != 0", nonnull.mess),
#
#                           # conservatism message for OLS
#                           conditionalPanel( condition = "input.outcomeType == 'OLS'", OLS.mess),
#
#                           width = 6
#
#                       ),  # ends mainPanel
#
#                       # panel for contour plot
#                       sidebarPanel(
#
#                           checkboxInput( 'makeplot', 'Show plot', FALSE ),
#
#                           conditionalPanel( condition = "input.makeplot == true",
#                                             plotOutput("curveOfExplainAway", width = "400px", height = "400px") ),
#
#                           conditionalPanel( condition = "input.makeplot == true",
#                                             HTML(paste("<br>Each point along the curve defines a joint relationship between the two sensitivity parameters that could potentially explain away the estimated effect.",
#                                                        " If one of the two parameters is smaller than the E-value, the other must be larger, as defined by the plotted curve."))
#                           )
#                           ,
#
#                           width = 6
#
#                       ) # end contour plot panel
#             )  # end mainPanel
#
# )  # end fluidPage
#
#
# # tags$footer(title="Your footer here", align = "right", style = "
# # position:absolute;
# #             bottom:0;
# #             width:100%;
# #             height:50px; /* Height of the footer */
# #             color: white;
# #             padding: 10px;
# #             background-color: black;
# #             z-index: 1000;"
# # )




ui =

    fluidPage(

        theme = shinytheme("flatly"),

        mainPanel(

            mainPanel(
                selectInput( "outcomeType", label = "Outcome type",
                             choices = c( "Relative risk / rate ratio" = "RR",
                                          "Odds ratio (outcome prevalence <15%)" = "OR.rare",
                                          "Odds ratio (outcome prevalence >15%)" = "OR.com",
                                          "Hazard ratio (outcome prevalence <15%)" = "HR.rare",
                                          "Hazard ratio (outcome prevalence >15%)" = "HR.com",
                                          "Standardized mean difference (d)" = "MD",
                                          "Risk difference" = "RD",
                                          "Linear regression coefficient" = "OLS" ) ),


                # conditional panels that appear depending on selected outcome type

                conditionalPanel(
                    condition = "input.outcomeType == 'RR' ",

                    numericInput('est.RR', 'Point estimate', NA, min = 1, max = 9),
                    numericInput('lo.RR', 'Confidence interval lower limit', NA, min = 1, max = 9),
                    numericInput('hi.RR', 'Confidence interval upper limit', NA, min = 1, max = 9),
                    numericInput('trueRR', 'True causal effect to which to shift estimate (default: null)', 1, min = 1, max = 9)
                ) ,

                conditionalPanel(

                    condition = "input.outcomeType == 'OR.rare' ",

                    numericInput('est.OR.rare', 'Point estimate', NA, min = 1, max = 9),
                    numericInput('lo.OR.rare', 'Confidence interval lower limit', NA, min = 1, max = 9),
                    numericInput('hi.OR.rare', 'Confidence interval upper limit', NA, min = 1, max = 9),
                    numericInput('trueORrare', 'True causal effect to which to shift estimate (default: null)', 1, min = 1, max = 9)
                ),

                conditionalPanel(
                    condition = "input.outcomeType == 'OR.com' ",

                    numericInput('est.OR.com', 'Point estimate', NA, min = 1, max = 9),
                    numericInput('lo.OR.com', 'Confidence interval lower limit', NA, min = 1, max = 9),
                    numericInput('hi.OR.com', 'Confidence interval upper limit', NA, min = 1, max = 9),
                    numericInput('trueORcom', 'True causal effect to which to shift estimate (default: null)', 1, min = 1, max = 9)
                ),

                conditionalPanel(
                    condition = "input.outcomeType == 'HR.rare' ",

                    numericInput('est.HR.rare', 'Point estimate', NA, min = 1, max = 9),
                    numericInput('lo.HR.rare', 'Confidence interval lower limit', NA, min = 1, max = 9),
                    numericInput('hi.HR.rare', 'Confidence interval upper limit', NA, min = 1, max = 9),
                    numericInput('trueHRrare', 'True causal effect to which to shift estimate (default: null)', 1, min = 1, max = 9)
                ),

                conditionalPanel(
                    condition = "input.outcomeType == 'HR.com' ",

                    numericInput('est.HR.com', 'Point estimate', NA, min = 1, max = 9),
                    numericInput('lo.HR.com', 'Confidence interval lower limit', NA, min = 1, max = 9),
                    numericInput('hi.HR.com', 'Confidence interval upper limit', NA, min = 1, max = 9),
                    numericInput('trueHRcom', 'True causal effect to which to shift estimate (default: null)', 1, min = 1, max = 9)
                ),

                conditionalPanel(
                    condition = "input.outcomeType == 'OLS' ",
                    numericInput('estOLS', 'Regression coefficient estimate', NA, min = 1, max = 9),
                    numericInput('seOLS', 'Standard error of coefficient', NA, min = 1, max = 9),
                    numericInput('sdOLS', 'Standard deviation of outcome', NA, min = 1, max = 9),
                    numericInput('deltaOLS', 'Contrast of interest in exposure', 1, min = 1, max = 9),
                    numericInput('trueOLS', 'True causal effect to which to shift estimate (on standard mean difference scale; default: null)', 0, min = 1, max = 9)
                ),

                conditionalPanel(
                    condition = "input.outcomeType == 'MD' ",

                    numericInput('est.MD', 'Point estimate', 0, min = 1, max = 9),
                    numericInput('se.MD', 'Standard error', NA, min = 1, max = 9),
                    numericInput('trueMD', 'True causal effect to which to shift estimate (default: null)', 0, min = 1, max = 9)
                ),

                conditionalPanel(
                    condition = "input.outcomeType == 'RD' ",

                    numericInput('n11', 'Number of exposed, diseased individuals', NA, min = 1, max = 9),
                    numericInput('n10', 'Number of exposed, non-diseased individuals', NA, min = 1, max = 9),
                    numericInput('n01', 'Number of unexposed, diseased individuals', NA, min = 1, max = 9),
                    numericInput('n00', 'Number of unexposed, non-diseased individuals', NA, min = 1, max = 9),
                    numericInput('alpha', 'Alpha level for confidence interval', 0.05, min = 1, max = 9),
                    numericInput('grid', 'Spacing for grid search of E-value', 0.0001, min = 1, max = 9),
                    numericInput('trueRD', 'True causal effect to which to shift estimate (default: null)', 0, min = 1, max = 9)
                ),

                # display results
                wellPanel(  span( textOutput("result.text") ) ),

                # warnings if computing non-null E-value
                # note: because the condition is in Javascript, have to use period instead of dollar sign to
                #  access arguments, so CANNOT have period in the variable names (e.g., "true.RR" doesn't work!)
                conditionalPanel( condition = "input.outcomeType == 'RR' & input.trueRR != 1", nonnull.mess),
                conditionalPanel( condition = "input.outcomeType == 'OR.rare' & input.trueORrare != 1", nonnull.mess),
                conditionalPanel( condition = "input.outcomeType == 'OR.com' & input.trueORcom != 1", nonnull.mess),
                conditionalPanel( condition = "input.outcomeType == 'HR.rare' & input.trueHRrare != 1", nonnull.mess),
                conditionalPanel( condition = "input.outcomeType == 'HR.com' & input.trueHRcom != 1", nonnull.mess),
                conditionalPanel( condition = "input.outcomeType == 'OLS' & input.trueOLS != 0", nonnull.mess),
                conditionalPanel( condition = "input.outcomeType == 'MD' & input.trueMD != 0", nonnull.mess),
                conditionalPanel( condition = "input.outcomeType == 'RD' & input.trueRD != 0", nonnull.mess),

                # conservatism message for OLS
                conditionalPanel( condition = "input.outcomeType == 'OLS'", OLS.mess),

                width = 6

            ),  # ends mainPanel

            # panel for contour plot
            sidebarPanel(

                checkboxInput( 'makeplot', 'Show plot', FALSE ),

                conditionalPanel( condition = "input.makeplot == true",
                                  plotOutput("curveOfExplainAway", width = "400px", height = "400px") ),

                conditionalPanel( condition = "input.makeplot == true",
                                  HTML(paste("<br>Each point along the curve defines a joint relationship between the two sensitivity parameters that could potentially explain away the estimated effect.",
                                             " If one of the two parameters is smaller than the E-value, the other must be larger, as defined by the plotted curve."))
                )
                ,

                width = 6

            ) # end contour plot panel
        )  # end mainPanel

    )  # end fluidPage


# tags$footer(title="Your footer here", align = "right", style = "
# position:absolute;
#             bottom:0;
#             width:100%;
#             height:50px; /* Height of the footer */
#             color: white;
#             padding: 10px;
#             background-color: black;
#             z-index: 1000;"
# )





