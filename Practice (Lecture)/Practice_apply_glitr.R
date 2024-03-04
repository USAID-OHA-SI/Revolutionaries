## Applying glitr to Local Partners Plot

# load libraries ----------------------------------------------------------

library(tidyverse) 
library(glitr) # for custom colors
library(scales, warn.conflicts=FALSE) # for formatting
library(glue) # useful for creating dynamic text
library(gt) # create beautiful tables
library(gtExtras) # adorn gt tables
library(systemfonts, warn.conflicts=FALSE) # register fonts with R



# functionality with glitr ------------------------------------------------

  #https://usaid-oha-si.github.io/glitr/reference/index.html
  ls('package:glitr')


# load data ---------------------------------------------------------------

  # path_url <- "https://raw.githubusercontent.com/USAID-OHA-SI/Revolutionaries/main/Dataout/PEPFAR_local_long.rds"
  path_local <- "Dataout/PEPFAR_local_long.rds"
  
  df_long <- read_rds(path_local)
  
  glimpse(df_long)

# apply glitr -------------------------------------------------------------

#TODO - using the plot below, apply different parts of the glitr package
#  - different stored color
#  - different themes/styles
#  - apply scale_fill_si()
#  - test si_preview
#  - try si_rampr to generate a continuous palette
  
df_long %>% 
  ggplot(aes(y = ou_long, x = share)) +
  geom_col(aes(fill = fill_color),
           position = position_stack(reverse = T)) +
  geom_label(aes(label = scales::percent(share, 1)), # Adds labels
             size = 8 / .pt, 
             position = position_stack(vjust = 0.5)) +
  labs(
    x = NULL, y = NULL,
    title = "FY 21 Local vs. International Budget - All Agencies",
    fill = NULL) +
  scale_fill_identity()


