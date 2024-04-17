#' Purpose: Exploring the data and looking for patterns that can be visualized
#' Author: Cole Brookson
#' Date: 2024-04-17

library(magrittr)

raw_csu_data <- readxl::read_excel(targets::tar_read(raw_csu_data),
    sheet = "all",
    col_names = TRUE, skip = 1
)
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
epitools::pois.exact(df$num)

# reprex
df <- data.frame(
    day = c(1:10),
    hospital = c(
        "small", "small", "big", "small", "small", "big", "big",
        "small", "small", "small"
    ),
    test_1 = c(
        "cancer", "cancer", "heart", "TB", "heart", "cancer", "TB",
        "heart", "TB", "heart"
    ),
    diagnostic_1 = c(
        "cancer_1", "cancer_2", "heart_1", "TB_1", "heart_1",
        "cancer_2", "TB_1", "heart_2", "TB_2", "heart_1"
    ),
    n_test_1 = c(12, 15, 93, 10, 20, 82, 83, 5, 9, 10),
    n_pos_1 = c(8, 10, 87, 8, 17, 61, 62, 1, 4, 3),
    test_2 = c(
        NA, NA, NA, "TB", "heart", "cancer", "TB", "heart", "TB",
        "heart"
    ),
    diagnostic_2 = c(
        NA, NA, NA, "TB_1", "heart_1",
        "cancer_2", "TB_1", "heart_2", "TB_2", "heart_1"
    ),
    n_test_2 = c(NA, NA, NA, 10, 20, 82, 83, 5, 9, 10),
    n_pos_2 = c(NA, NA, NA, 8, 17, 61, 62, 1, 4, 3),
    test_3 = c(NA, "TB", "heart", NA, "TB", "heart", "TB", "heart", "TB", NA),
    diagnostic_3 = c(
        NA, "TB_1", "heart_1", NA, "heart_1", "cancer_2", "TB_1",
        "heart_2", "TB_2", NA
    ),
    n_test_3 = c(NA, 15, 93, NA, 20, 82, 83, 5, 9, NA),
    n_pos_3 = c(NA, 10, 87, NA, 17, 61, 62, 1, 4, NA)
)
