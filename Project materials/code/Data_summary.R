# sumary statistics of survey data

library(tidyverse)
library(cowplot); theme_set(theme_cowplot())
library(here)

data <- read.csv(here("data/Grad_survey.csv"))

colnames(data)

# career stage

career <- data %>%
  group_by(Career_Stage) %>%
  summarise(n = n())

career$per <- round(career$n / 94 *100, digits = 2)


# regions
unique(data$Where)

where <- data %>%
  group_by(Where) %>%
  summarise(n = n())

where$n[where$Where == "Remote environments"] <-where$n[where$Where == "Remote environments"] + 2

where$n[where$Where == "Semi-remote (ie, wildlands near cities)" ] <-where$n[where$Where == "Semi-remote (ie, wildlands near cities)" ] + 5

where$n[where$Where == "Urban areas" ] <-where$n[where$Where == "Urban areas" ] + 4

where <- where %>%
  filter(Where == "Remote environments" | 
           Where == "Semi-remote (ie, wildlands near cities)" |
           Where == "Urban areas" |
           Where == "Coastal habitats (marsh, seagrass, barrier island)")

where$per <- where$n / 94 * 100
