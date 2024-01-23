# Purpose: The overall targets pipeline for the project.
# Author: Cole Brookson
# Date: 2024-01-23

library(targets)
library(tar_tarchetypes)

tar_options(packages = c("here", "magrittr", "readxl", "janitor", "readr"))


# Define targets
tar_target(target1, {
    # Code for target1
})

tar_target(target2, {
    # Code for target2
})

# Additional targets...
