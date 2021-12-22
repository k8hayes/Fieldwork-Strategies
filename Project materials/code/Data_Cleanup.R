# clean up of survey results

library(tidyverse)
library(cowplot); theme_set(theme_cowplot())
library(here)

# Clean up #############################

data <- read.csv(here("data/Graduate Field Leadership Survey_RAW.csv"), stringsAsFactors = F)

# Column names
colnames(data) <- c("Timestamp", "Career_Stage", "Yr_lead",
                    "Yr_field", "Yr_super", "Where", "Before_ActPhys",
                    "During_ActPhys", "Before_ActInter", "During_ActInter",
                    "After_act", "Volunteer","Success", "Challenges", "Gen_Advice",
                    "Resources_grad","Policies", "Other")
# Career stage #########################################

unique(data$Career_Stage)

data$Career_Stage[data$Career_Stage == "Just completed graduate program in Aug 2021"] <- "Graduate Student" 


data$Career_Stage[data$Career_Stage == "Postdoctoral non-academic track"] <- "Postdoctoral researcher"

data$Career_Stage[data$Career_Stage == "Mid-career applied scientist"] <- "Professional"
data$Career_Stage[data$Career_Stage == "research staff"]<- "Professional"
data$Career_Stage[data$Career_Stage == "Professional (MS Degree)" ]<- "Professional"
data$Career_Stage[data$Career_Stage == "Researcher with the Forest Service" ]<- "Professional"
data$Career_Stage[data$Career_Stage == "Research scientist"  ]<- "Professional"
data$Career_Stage[data$Career_Stage == "Mid-career applied scientist" ]<- "Professional"
data$Career_Stage[data$Career_Stage == "Full time research assistant (post-MS level)" ]<- "Professional"
data$Career_Stage[data$Career_Stage == "Left academia" ]<- "Professional"
data$Career_Stage[data$Career_Stage == "Administrator at College"  ]<- "Professional"
data$Career_Stage[data$Career_Stage == "lab manager"  ]<- "Professional"
data$Career_Stage[data$Career_Stage == "Seasonal crew lead, post bachelors" ]<- "Professional"

data$Career_Stage[data$Career_Stage == "Technically faculty, but research-project based, so similar to a GRA"  ]<- "Faculty Member"
data$Career_Stage[data$Career_Stage == "Professor emeritus & Senior reseacher"  ]<- "Faculty Member"
data$Career_Stage[data$Career_Stage == "Emeritus Professor but active in research"  ]<- "Faculty Member"

unique(data$Career_Stage)


## Years in field ##################################
   
 unique(data$Yr_field)

    data$Yr_field[data$Yr_field == "One"] <- 1
    data$Yr_field[data$Yr_field == "1 year"] <- 1
    data$Yr_field[data$Yr_field == "7 years"] <- 7
    data$Yr_field[data$Yr_field == "4 years"] <- 4
    data$Yr_field[data$Yr_field == "10 years"] <- 10
    data$Yr_field[data$Yr_field == "7 (including years as a team lead, which included some work not as a team lead)"] <- 7

    unique(data$Yr_field)
    

    data$Yr_field <- as.numeric(data$Yr_field)

hist(data$Yr_field)


## Years leading fieldwork ###########################
  
  unique(data$Yr_lead)

  data$Yr_lead[data$Yr_lead == "Three"] <- 3
  data$Yr_lead[data$Yr_lead == "~3"] <- 3
  data$Yr_lead[data$Yr_lead == "3 years"] <- 3
  data$Yr_lead[data$Yr_lead == "4 years"] <- 4
  data$Yr_lead[data$Yr_lead == "2 years"] <- 2
  data$Yr_lead[data$Yr_lead == "~3 years"] <- 3
  data$Yr_lead[data$Yr_lead == "None"] <- 0
  
  unique(data$Yr_lead)
  
data$Yr_lead <- as.numeric(data$Yr_lead)

hist(data$Yr_lead)


## Years supervising fieldwork #########################
 
 unique(data$Yr_super)

  data$Yr_super[data$Yr_super == "none"] <- 0
  data$Yr_super[data$Yr_super == "12 "] <- 12
  data$Yr_super[data$Yr_super == "0 years"] <- 0
  data$Yr_super[data$Yr_super == "1 year"] <- 1
  data$Yr_super[data$Yr_super == "none as a PI"] <- 0
  data$Yr_super[data$Yr_super == "1 (grad student supervising undergrads)"] <- 0
  
  unique(data$Yr_super)
  
  data$Yr_super <- as.numeric(data$Yr_super)

hist(data$Yr_super)

## Regions ###########################################3

unique(data$Where)

data_region <- data %>%
  group_by(Where) %>%
  summarise(n = n())

barplot(n ~ Where, data = data_region)

write.csv(data, here("data/Grad_survey.csv"), row.names = F)
