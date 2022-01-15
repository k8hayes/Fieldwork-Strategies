# Figure X - years of experience histograms

library(tidyverse)
library(cowplot); theme_set(theme_cowplot())
library(here)

data <- read.csv(here("data/Grad_survey.csv"))

yr_fieldplot <- data %>%
  filter(Career_Stage != "NA") %>%
  filter(Career_Stage != "") %>%
  ggplot(aes(x = Yr_field, fill = Career_Stage)) + geom_histogram(binwidth = 5, center = 2.5) + 
  labs(title = "Field experience",
       x = "Years") + theme(legend.position = "none") + 
  ylim(0,80)
yr_fieldplot

yr_leadplot <- data %>%
  filter(Career_Stage != "NA") %>%
  filter(Career_Stage != "") %>%
  ggplot(aes(x = Yr_lead, fill = Career_Stage)) + geom_histogram(binwidth = 5, center = 2.5) + 
  labs(title = "Experience leading fieldwork",
       x = "Years") + theme(legend.position = "none") + 
  ylim(0,80)
yr_leadplot

yr_supplot <- data %>%
  filter(Career_Stage != "NA") %>%
  filter(Career_Stage != "") %>%
  ggplot(aes(x = Yr_super, fill = Career_Stage)) + geom_histogram(binwidth = 5, center = 2.5) + 
  labs(title = "Experience supervising fieldwork",
       x = "Years") + 
  ylim(0,80)
yr_supplot

plot_grid(yr_fieldplot, yr_leadplot, yr_supplot, nrow = 1, ncol = 3,
          rel_widths = c(0.75, 0.75, 1.25), labels = c("A.", "B.", "C.")) # width 1350, height 350


# summary stats
# doing fieldwork
length(which(data$Yr_field > 5)) # n

length(which(data$Yr_field > 5)) / 94 * 100 # %


# leading
length(which(data$Yr_lead > 5))

length(which(data$Yr_lead > 5)) / 94 * 100

# supervising
length(which(data$Yr_super > 5))

length(which(data$Yr_super> 5)) / 94 * 100

