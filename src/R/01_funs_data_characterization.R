#' Purpose: Functions for data characterization that give us insight on some of
#' the basics of the data.
#' Author: Cole Brookson
#' Date: 2024-01-23

calculate_unique_pmids <- function(df) {
  unique_pmids <- unique(df$pmid)
  num_unique_pmids <- length(unique_pmids)
    
  unique_vector <- unique(df$vector)
  num_unique_vector <- length(unique_vector)
    
  unique_vector_origin_country <- unique(df$vector_origin_country)
  num_unique_vector_origin_country <- length(unique_vector_origin_country)
    
  unique_virus <- unique(df$virus)
  num_unique_virus <- length(unique_virus)

  unique_strain <- unique(df$viral_strain)
  num_unique_strain <- length(unique_strain)
    
  # Append information to README file
  readme_path <- "/Users/colebrookson/github/arbo-comp/README.md"
  readme_content <- readLines(readme_path)
  new_paragraph <- paste("The number of unique PubMed ID's in these data:",
                         num_unique_pmids, "\n\n")
  new_paragraph <- paste(new_paragraph,
                         "The number of unique vector spp. in these data:",
                         num_unique_vector, "\n\n")
  new_paragraph <- paste(new_paragraph,
                         "The number of unique vector origin countries",
                         "in these data:",
                         num_unique_vector_origin_country, "\n\n")
  new_paragraph <- paste(new_paragraph, "The number of unique viruses",
                         "in these data:",
                         num_unique_virus, "\n\n")
  new_paragraph <- paste(new_paragraph, "The number of unique viral strains",
                         "in these data:",
                         num_unique_strain, "\n\n")
    
  updated_readme_content <- c(readme_content, new_paragraph)
  writeLines(updated_readme_content, readme_path)
}
