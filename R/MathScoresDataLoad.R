library(tidyverse)
library(stringr)

StudentDataMat <- read.csv('data-raw/student-mat.csv')

c1 <- StudentDataMat %>% colnames()

columnNames <- str_split_fixed(string = c1, pattern = '\\.', n = 33)

colnames( StudentDataMat) <- "names"

c2 <-

c2 <- data.frame(c2)
str_remove_all( string = StudentDataMat$names, pattern  = "\"" ) %>%
  str_split_fixed(string = StudentDataMat$names, pattern = '\\;', n = 33)


c3 <- str_remove_all( string = StudentDataMat$names, pattern  = "\"" ) %>%
  str_split_fixed(string = ., pattern = '\\;', n = 33) %>% data.frame()
colnames( c3) <- columnNames



