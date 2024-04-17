#' Purpose: Exploring the data and looking for patterns that can be visualized
#' Author: Cole Brookson
#' Date: 2024-04-17

library(magrittr)

df <- readr::read_csv(here::here("./data/clean/csu-cdc-merged.csv"))

# generate some summaries of the data
length(unique(df$pmid))
length(unique(df$vector))
length(unique(df$vector_origin_country))
length(unique(df$virus))
length(unique(df$viral_strain))

# what is the average number of tested vs actually successful across viruses
# and hosts?

# first for all viruses
