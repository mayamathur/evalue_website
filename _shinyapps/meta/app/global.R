
library(shiny)
library(shinythemes)
library(shinyBS)
library(shinyalert)
library(bsplus)
library(shinydashboard)
library(shinyWidgets)
library(ggplot2)

# if sourcing package from CRAN
library(EValue) #include confounded_meta and sens_plot below to test, will eventually be loaded into EValue package and can remove the functions below

# # if using local development versions
# setwd("~/Dropbox/Personal computer/Independent studies/R packages/EValue package (git)/evalue_package/EValue/R")
# source("utils.R")
# source("EValue.R")
# source("meta-analysis.R")
# source("effect_measures.R")


library(MetaUtility)
library(purrr)
library(plogr)
library(dplyr)
library(boot)

# keeps original error messages
options(shiny.sanitize.errors = FALSE)


# message to display if non-null true value
nonnull.mess = 'Note: You are calculating a "non-null" E-value, i.e., an E-value for the minimum
amount of unmeasured confounding needed to move the estimate and confidence interval
to your specified true value rather than to the null value.'


# message to display for OLS
OLS.mess = 'Note: Using the standard deviation of the outcome yields a conservative approximation
of the standardized mean difference. For a non-conservative estimate, you could instead use the estimated residual standard deviation from your linear
regression model. Regardless, the reported E-value for the confidence interval treats the
standard deviation as known, not estimated.'

