# Exercise: Practice_preattentive_attribtues


# SETUP -------------------------------------------------------------------

# Library
  library(tidyverse)
  library(glitr)
  library(scales)

# Load data directly from github
  url <- 'https://tinyurl.com/yt6pxurx'
  df_tst_psnu <- read_rds(url)
  
# Inspect the data
  glimpse(df_tst_psnu)
  names(df_tst_psnu)
  view(df_tst_psnu)

# Data are HIV testing results at the mechanism level for various geographies in the Minoria
  
# EXERCISE ----------------------------------------------------------------
  
  # Instructions: Using the starter chunk below explore ggplot astethics

  # Practice using the ashetic mappings for geom_point()
  # help(geom_point)
  # size
  # shape
  # color
  # alpha to modify the plot below
  
  # Replace ??? with a column from the data frame to experiment with the asthetic
  
  # Size
  df_tst_psnu %>% 
    ggplot(aes(y = cumulative, x = fy, size = "???")) +
    geom_point() +
    labs(title = "TESTING RESULTS") 

  # shape
  df_tst_psnu %>% 
    ggplot(aes(y = cumulative, x = fy, shape = "???")) +
    geom_point() +
    labs(title = "TESTING RESULTS")
    
  # color
  df_tst_psnu %>% 
    ggplot(aes(y = cumulative, x = fy, color = "???")) +
    geom_point() +
    labs(title = "TESTING RESULTS")
  
  # alpha?
  df_tst_psnu %>% 
    ggplot(aes(y = cumulative, x = fy, alpha = "???")) +
    geom_point() +
    labs(title = "TESTING RESULTS")
  
  # Put it all together
  df_tst_psnu %>% 
    ggplot(aes(y = cumulative, x = fy, color = "???", shape = "???")) +
    geom_point() +
    labs(title = "TESTING RESULTS")
  
  # Review the vignette for more options
  vignette("ggplot2-specs")
  