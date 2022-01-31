# merge
library(dplyr)

# can move id to front of data frame
mathData <- mathData %>% mutate( id = 1:nrow(mathData))

porData <- porData %>% mutate( id = 1:nrow(porData))

mergeData <- inner_join( mathData, porData, by = "id")

usethis::use_data(mergeData)
