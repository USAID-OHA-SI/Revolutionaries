## Recreate Base Plot

# load libraries ----------------------------------------------------------

# library(tidyverse) 
# library(glitr) # for custom colors
# library(scales, warn.conflicts=FALSE) # for formatting
# library(glue) # useful for creating dynamic text
# library(gt) # create beautiful tables
# library(gtExtras) # adorn gt tables
# library(systemfonts, warn.conflicts=FALSE) # register fonts with R

# load data ---------------------------------------------------------------

  # path_url <- "https://raw.githubusercontent.com/USAID-OHA-SI/Revolutionaries/main/Dataout/PEPFAR_local_long.rds"
  path_local <- "Dataout/PEPFAR_local_long.rds"
  
  df_long <- read_rds(path_local)


# base plot ---------------------------------------------------------------

  #TODO - create a column chart
  #TODO - use the fill_color column to color the bars by local/international
  #TODO - apply the correct scale_* to fill the bars by the specified column 
  (base_plot <- df_long %>% 
    ggplot(aes(y = ou_long, x = share)) +
    geom_???(???,
             position = position_stack(reverse = T)) + # position_stack to alter order
    labs(
      x = NULL, y = NULL,
      title = "FY 21 Local vs. International Budget - All Agencies",
      fill = NULL
    ) +
    ???)


# label plot --------------------------------------------------------------

  #TODO - uses the scales package to add a percent label with no decimal places
   base_plot + 
      geom_label(aes(???), # Adds labels
                 size = 8 / .pt, 
                 position = position_stack(vjust = 0.5)
      )