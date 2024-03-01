## Sort Data

# load libraries ----------------------------------------------------------

# library(tidyverse) 
# library(glitr) # for custom colors
# library(scales, warn.conflicts=FALSE) # for formatting
# library(glue) # useful for creating dynamic text
# library(gt) # create beautiful tables
# library(gtExtras) # adorn gt tables
# library(systemfonts, warn.conflicts=FALSE) # register fonts with R

# load data ---------------------------------------------------------------

  # path_url <- "https://raw.githubusercontent.com/USAID-OHA-SI/Revolutionaries/main/Dataout/PEPFAR_local_long.csv"
  path_local <- "Dataout/PEPFAR_local_long.rds"
  
  df_long <- read_rds(path_local)

# sort plot ---------------------------------------------------------------

  #TODO - create a new columns, lp_value, based on the funding share only for local parnters to use for ordering
  #TODO - add the function from forcats to order the ou names
  #TODO - order ou names based on the local partner share (lp_value)
  df_long_ordered <- 
    df_long %>% 
    mutate(
      lp_value = case_when(type == "local" ~ ???), # Creating a new column to sort factors on
      ou = fct_???(ou, ???, .na_rm = TRUE), # overwrite ou into a factor 
      ou = fct_relevel(ou, "Total", after = Inf) # move Total to the Top of factor list
    ) %>% 
    arrange(ou)