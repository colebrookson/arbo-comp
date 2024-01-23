# Author: Cole Brookson
# Date: 2024-01-23

# Load packages
library(magrittr)

# Load data
df <- readxl::read_excel(here::here("data", "raw", "csu_cdc_merged.xlsx"),
  sheet = "all",
  col_names = TRUE, skip = 1
) %>%
  janitor::clean_names()
  
# Write data
readr::write_csv(df, here::here("data", "clean", "csu_cdc_merged.csv"))
