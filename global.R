
#libraries

library(shiny)
library(shinydashboard)
library(tidyverse)
library(leaflet)
library(plotly)

#files

SB_w_income <- read.csv("SB_w_income.csv", stringsAsFactors = FALSE)
SB_loc <- read.csv("SB_loc.csv", stringsAsFactors = FALSE)