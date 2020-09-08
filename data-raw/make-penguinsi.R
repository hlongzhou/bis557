library(palmerpenguins)
library(usethis)
library(missForest)

penguinsi <- penguins
penguinsi <- missForest(as.data.frame(penguinsi))

# Tidy
library(dplyr)
penguinsi <- penguins %>%
  as.data.frame() %>%
  missForest() %>%
  `$`(ximp) %>%
  as_tibble()

use_data(penguinsi) # create a data folder, and produce processed data.
