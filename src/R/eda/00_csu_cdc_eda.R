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
    test__1 = c(
        "cancer", "cancer", "heart", "TB", "heart", "cancer", "TB",
        "heart", "TB", "heart"
    ),
    diagnostic__1 = c(
        "cancer_1", "cancer_2", "heart__1", "TB_1", "heart__1",
        "cancer_2", "TB_1", "heart__2", "TB_2", "heart__1"
    ),
    n_tested__1 = c(12, 15, 93, 10, 20, 82, 83, 5, 9, 10),
    n_pos__1 = c(8, 10, 87, 8, 17, 61, 62, 1, 4, 3),
    test__2 = c(
        NA, NA, NA, "TB", "heart", "cancer", "TB", "heart", "TB",
        "heart"
    ),
    diagnostic__2 = c(
        NA, NA, NA, "TB_1", "heart__1",
        "cancer_2", "TB_1", "heart__2", "TB_2", "heart__1"
    ),
    n_tested__2 = c(NA, NA, NA, 10, 20, 82, 83, 5, 9, 10),
    n_pos__2 = c(NA, NA, NA, 8, 17, 61, 62, 1, 4, 3),
    test__3 = c(NA, "TB", "heart", NA, "TB", "heart", "TB", "heart", "TB", NA),
    diagnostic__3 = c(
        NA, "TB_1", "heart__1", NA, "heart__1", "cancer_2", "TB_1",
        "heart__2", "TB_2", NA
    ),
    n_tested__3 = c(NA, 15, 93, NA, 20, 82, 83, 5, 9, NA),
    n_pos__3 = c(NA, 10, 87, NA, 17, 61, 62, 1, 4, NA)
)

df_long <- tidyr::pivot_longer(
    df,
    cols = c(
        "test__1", "diagnostic__1", "n_tested__1", "n_pos__1", "test__2",
        "diagnostic__2", "n_tested__2", "n_pos__2", "test__3", "diagnostic__3",
        "n_tested__3", "n_pos__3"
    ),
    names_to = c("test", "diagnostic", "n_tested", "n_pos"),
    names_sep = "__"
)
