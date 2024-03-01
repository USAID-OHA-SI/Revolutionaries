## Black and White Data

# load libraries ----------------------------------------------------------

# library(tidyverse) 
# library(glitr) # for custom colors
# library(scales, warn.conflicts=FALSE) # for formatting
# library(glue) # useful for creating dynamic text
# library(gt) # create beautiful tables
# library(gtExtras) # adorn gt tables
# library(systemfonts, warn.conflicts=FALSE) # register fonts with R

# load data ---------------------------------------------------------------

  # path_url <- "https://raw.githubusercontent.com/USAID-OHA-SI/Revolutionaries/main/Dataout/PEPFAR_local_long-ordered.rds"
  path_local <- "Dataout/PEPFAR_local_long-ordered.rds"
  
  df_long_ordered <- read_rds(path_local)
  

# bw col ------------------------------------------------------------------

  #TODO - make local share rows/bars grey90k and international grey30k
  df_long_ordered_bw <- 
    df_long_ordered %>% 
    mutate(fill_color = case_when(???)) 
  