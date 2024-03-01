## Filtered Plot

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

# filtered plot -----------------------------------------------------------

  #TODO - keep only data for local funding
  #TODO - set all the fills to "#be3455" and removing the scale_fill_manual line 
  df_long_ordered_bw %>% 
    ??? %>% 
    ggplot(aes(y = ou, x = share)) +
    geom_col(aes(fill = type)) +
    scale_fill_manual(values = c("local" = "#be3455")) +
    geom_text(aes(label = percent(share, 1)),
              size = 7 / .pt,
              hjust = 0) +
    labs(
      x = NULL, y = NULL,
      title = "FY 21 Local vs. International Budget - All Agencies"
    ) 