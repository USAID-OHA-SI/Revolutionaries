## Facet Data

# load libraries ----------------------------------------------------------

# library(tidyverse) 
# library(glitr) # for custom colors
# library(scales, warn.conflicts=FALSE) # for formatting
# library(glue) # useful for creating dynamic text
# library(gt) # create beautiful tables
# library(gtExtras) # adorn gt tables
# library(systemfonts, warn.conflicts=FALSE) # register fonts with R

# load data ---------------------------------------------------------------

  # path_url <- "https://raw.githubusercontent.com/USAID-OHA-SI/Revolutionaries/main/Dataout/PEPFAR_local_long-ordered-bw.rds"
  path_local <- "Dataout/PEPFAR_local_long-ordered-bw.rds"
  
  df_long_ordered_bw <- read_rds(path_local)

# facet plot --------------------------------------------------------------

  #TODO - create a new variable, facet_order, which equals
  #   "" in the Total line
  #   "> 70%" where the goal is achieved (goal == 1)
  #   "< 70%" for everything else
  #TODO - create a new variable, recolor, which equals
  #   "#7f2339" in the Total line
  #   "be3455" where the goal is achieved (goal == 1)
  #   "#d38388" where the goal is NOT achieved (goal == 0)
  #   grey20k for everything else
  df_long_ordered_bw_goal <- 
    df_long_ordered_bw %>% 
    filter(type == "local") %>% 
    mutate(
      facet_order = ???,
      facet_order = fct_relevel(facet_order, c("", "> 70%", "< 70%"))
    ) %>%
    mutate(recolor = ???)
    )
  