# Exercise: Practice_preattentive_attribtues


# SETUP -------------------------------------------------------------------

# Library
  library(tidyverse)
  library(gagglr)
  library(scales)

# Load data
  df_msd <- read_rds("Data_public/df_msd.rds")
  
  # Can also read directly from github
  url <- "https://github.com/USAID-OHA-SI/Revolutionaries/raw/tim_dev/Data_public/df_msd.rds"
  df_msd <- read_rds(url)
  
# Inspect the data
  glimpse(df_msd)
  names(df_msd)
  view(df_msd)

# Data are HIV testing restuls at the mechanism level for various geographies in the Minoria
  
# EXERCISE ----------------------------------------------------------------
  
  # Instructions: Using the starter chunk below explore ggplot asethics
  
  df_msd_sub <- 
    df_msd %>% 
    filter(psnu == "Vancouver") %>% 
    mutate(fy = fiscal_year %>% as.character()) 
  
  # Practice using the ashetic mappings for geom_point()
  # help(geom_point)
  # size
  # shape
  # color
  # alpha to modify the plot below
  
  # Size
  df_msd_sub %>% 
    ggplot(aes(y = cumulative, x = fy)) +
    geom_point(size = "...") +
    labs(title = "TESTING RESULTS")
    facet_wrap(~mech_name) 

  # shape
  df_msd_sub %>% 
    ggplot(aes(y = cumulative, x = fy)) +
    geom_point(shape = "...") +
    labs(title = "TESTING RESULTS")
  facet_wrap(~mech_name)  
    
  # color
  df_msd_sub %>% 
    ggplot(aes(y = cumulative, x = fy)) +
    geom_point(color = "...") +
    labs(title = "TESTING RESULTS")
  facet_wrap(~mech_name)  
  
  # alpha?
  
  # Review the vignette for more options
  vignette("ggplot2-specs")
  