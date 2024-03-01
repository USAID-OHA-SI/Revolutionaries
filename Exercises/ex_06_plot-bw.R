## Black and White Plot

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

# bw plot -----------------------------------------------------------------

  #TODO - use the fill_color column to color the bars by local/international
  df_long_ordered_bw %>% 
    ggplot(aes(y = ou, x = share)) +
    geom_col(???, 
             position = position_stack(reverse = TRUE)) +
    geom_label(aes(label = scales::percent(share, 1)), # Adds labels
               size = 8 / .pt, 
               position = position_stack(vjust = 0.5)
    ) +
    scale_fill_identity() +
    labs(
      x = NULL, y = NULL,
      title = "FY 21 Local vs. International Budget - All Agencies",
      fill = NULL
    ) 