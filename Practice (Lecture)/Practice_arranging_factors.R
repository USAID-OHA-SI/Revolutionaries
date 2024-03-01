# Exercise: Day3_session06_sorting_and_factors_exercise_1_sort_and_factors


# SETUP -------------------------------------------------------------------

  # Library
  library(tidyverse)
  
  # Load data
  url <- "https://tinyurl.com/yt6pxurx"
  df_tst_psnu <- read_rds(url) %>% filter(fy == "2060")
  
  glimpse(df_tst_psnu)
  names(df_tst_psnu)

# EXERCISE ----------------------------------------------------------------
    
  # Instructions: Explore the data frame and review the help for fct_reorder
  # Practice creating factors and sorting plots by them
  
  # We would to create an ordered bar graph of the cumulative value for each psnu
  df_tst_psnu %>% 
    ggplot(aes(x = cumulative, y = psnu)) +
    geom_col()
    
  # What if we arrange the data before plotting?
  # Will this work?
  df_tst_psnu %>% 
    arrange(cumulative) %>% 
    ggplot(aes(x = cumulative, y = psnu)) +
    geom_col()
    
  # Create a factor for the psnus, where the levels are mapped to cumulative results
  df_tst_fct <- 
      df_tst_psnu %>% 
      mutate(psnu_cmltv = fct_reorder("???"  ,"???"  )) 
      
  # How would you investigate the new data frame df_tst_fct?
  str("???")
  levels(df_tst_fct$"???")
      
    
  # Create a factor for the psnus, where the levels are mapped to cumulative results
  # and create a column plot with the psnus plotted in order
    
    df_tst_psnu %>% 
      mutate(psnu_cmltv = fct_reorder("???", "???")) %>% 
      ggplot(aes(y = "???", x = "???")) +
      geom_col()
    
  
  # How would you sort a facet wrapped plot using factors?  
  # What does the descending option in fct_reorder do?  
    df_tst_psnu %>% 
      mutate(psnu_cmltv = fct_reorder("???", "???", .desc = "???")) %>% 
      ggplot(aes(x = cumulative, y = indicator)) +
      geom_col() +
      facet_wrap(~psnu_cmltv, nrow = 3) 
    
    