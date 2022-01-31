library(tidyverse)
library(stringr)

porDataRaw <- read.csv('data-raw/student-por.csv')
columnNames <- mathDataRaw %>% colnames()
columnNames <- str_split_fixed( string = columnNames, pattern = '\\.', n = 33)
colnames( porDataRaw) <- "names"
str_remove_all( string = porDataRaw$names, pattern  = "\"" ) %>%
  str_split_fixed(string = porDataRaw$names, pattern = '\\;', n = 33)
porData <- str_remove_all( string = porDataRaw$names, pattern  = "\"" ) %>%
  str_split_fixed(string = ., pattern = '\\;', n = 33) %>% data.frame()
colnames( porData) <- columnNames

usethis::use_data(porData)
