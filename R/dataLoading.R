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


porDataRaw <- read.csv('data-raw/student-por.csv')
colnames( porDataRaw) <- "names"
str_remove_all( string = porDataRaw$names, pattern  = "\"" ) %>%
  str_split_fixed(string = porDataRaw$names, pattern = '\\;', n = 33)
porData <- str_remove_all( string = porDataRaw$names, pattern  = "\"" ) %>%
  str_split_fixed(string = ., pattern = '\\;', n = 33) %>% data.frame()
colnames( porData) <- columnNames

mergeData <- rbind( mathData, porData)
# TODO: remove duplicate observations in merged dataset

usethis::use_data(mergeData)
usethis::use_data(mathData)
usethis::use_data(porData)

