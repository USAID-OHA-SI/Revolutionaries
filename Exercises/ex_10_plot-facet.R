## Facet Plot

# load libraries ----------------------------------------------------------

# library(tidyverse) 
# library(glitr) # for custom colors
# library(scales, warn.conflicts=FALSE) # for formatting
# library(glue) # useful for creating dynamic text
# library(gt) # create beautiful tables
# library(gtExtras) # adorn gt tables
# library(systemfonts, warn.conflicts=FALSE) # register fonts with R

# load data ---------------------------------------------------------------
  
  # path_url <- "https://raw.githubusercontent.com/USAID-OHA-SI/Revolutionaries/main/Dataout/Dataout/PEPFAR_local_long-ordered-bw-goal.rds
  path_local <- "Dataout/PEPFAR_local_long-ordered-bw-goal.rds"
  
  df_long_ordered_bw_goal <- read_rds(path_local)

# facet plot --------------------------------------------------------------

  #TODO - add a vertical line at 70% where the linewidth is 2, color is gray10k, and the opacity is 75% 
  #TODO - color bar by the new recolor variable
  #TODO - facet into a single column using the facet_order variable
  df_long_ordered_bw_goal %>% 
    ggplot(aes(y = ou, x = share)) +
    ??? +
    geom_col(???) +
    scale_fill_identity() +
    geom_text(aes(label = percent(share, 1)),
              size = 7 / .pt,
              hjust = 0) +
    labs(
      x = NULL, y = NULL,
      title = "FY 21 Local vs. International Budget - All Agencies",
      fill = NULL
    ) +
    scale_x_continuous(limits = c(0, 1.1)) +
    ???(facet_order ~ ., scales = "free_y", drop = T, space = "free") 
