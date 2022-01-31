library(tidyverse)
library(stringr)

porDataRaw <- read.csv('data-raw/student-por.csv')
columnNames <- porDataRaw %>% colnames()
columnNames <- str_split_fixed( string = columnNames, pattern = '\\.', n = 33)
colnames( porDataRaw) <- "names"
str_remove_all( string = porDataRaw$names, pattern  = "\"" ) %>%
  str_split_fixed(string = porDataRaw$names, pattern = '\\;', n = 33)
porData <- str_remove_all( string = porDataRaw$names, pattern  = "\"" ) %>%
  str_split_fixed(string = ., pattern = '\\;', n = 33) %>% data.frame()
colnames( porData) <- columnNames

porData$age <- as.numeric(porData$age)
porData$absences <- as.numeric(porData$absences)
porData$G1 <- as.numeric(porData$G1)
porData$G2 <- as.numeric(porData$G2)
porData$G3 <- as.numeric(porData$G3)

usethis::use_data( porData, overwrite = T)
