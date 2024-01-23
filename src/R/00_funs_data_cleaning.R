# Purpose: Functions that clean the data provided in excel format and write out
# a readable `.csv` file.
# Author: Cole Brookson
# Date: 2024-01-23

clean_data <- function(raw_csu_data, output_path) {
  # Load data
  df <- readxl::read_excel(raw_csu_data,
    sheet = "all",
    col_names = TRUE, skip = 1
  ) %>%
    janitor::clean_names()

  # Write data
  readr::write_csv(df, here::here(output_path, "csu_cdc_merged.csv"))
}
