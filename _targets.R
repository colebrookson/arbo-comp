# Purpose: The overall targets pipeline for the project.
# Author: Cole Brookson
# Date: 2024-01-23

library(targets)
library(tarchetypes)
library(here)

tar_option_set(packages = c("magrittr", "readxl", "janitor", "readr"))

source(here::here("./src/R/00_funs_data_cleaning.R"))


# Define file targets ==========================================================
list(
  tar_target(raw_csu_data,
    here::here("data", "raw", "csu_cdc_merged.xlsx"),
    format = "file"
  ),
  tar_target(clean_csu_data,
    clean_data(raw_csu_data, here::here("data", "clean"))
  )
)
