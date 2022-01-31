library(tidyverse)
library(stringr)

mathDataRaw <- read.csv('data-raw/student-mat.csv')
columnNames <- mathDataRaw %>% colnames()
columnNames <- str_split_fixed( string = columnNames, pattern = '\\.', n = 33)
colnames( mathDataRaw) <- "names"
str_remove_all( string = mathDataRaw$names, pattern  = "\"" ) %>%
  str_split_fixed(string = mathDataRaw$names, pattern = '\\;', n = 33)
mathData <- str_remove_all( string = mathDataRaw$names, pattern  = "\"" ) %>%
  str_split_fixed(string = ., pattern = '\\;', n = 33) %>% data.frame()
colnames( mathData) <- columnNames

mathData$age <- as.numeric(mathData$age)
mathData$absences <- as.numeric(mathData$absences)
mathData$G1 <- as.numeric(mathData$G1)
mathData$G2 <- as.numeric(mathData$G2)
mathData$G3 <- as.numeric(mathData$G3)

usethis::use_data( mathData, overwrite = T)
