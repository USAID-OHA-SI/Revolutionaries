## Reshape Long

# load libraries ----------------------------------------------------------

library(tidyverse) 
library(glitr) # for custom colors
library(scales, warn.conflicts=FALSE) # for formatting
library(glue) # useful for creating dynamic text
library(gt) # create beautiful tables
library(gtExtras) # adorn gt tables
library(systemfonts, warn.conflicts=FALSE) # register fonts with R

# load data ---------------------------------------------------------------

  # path_url <- "https://raw.githubusercontent.com/USAID-OHA-SI/Revolutionaries/main/Data_public/PEPFAR_local_partner_share.csv"
  path_local <- "Data_public/PEPFAR_local_partner_share.csv"
  
  df <- read_csv(path_local)


# preview data ------------------------------------------------------------

  # Inspect the data
  # TODO - inspect the dataframe using glimpse 
  ???(???)

  # Preview as a gt table
  # View the resulting data frame as a table
  # TODO - inspect the first 10 rows using gt
  df %>% 
    slice(???) %>%  
    gt() %>% 
    gt_theme_nytimes() #gtExtras


# reshape long ------------------------------------------------------------

  # The hexadecimal code below can be passed directly to ggplot to add color. 
  # Excel default colors
  hex_blue <- "#3C67BE"
  hex_orange <- "#F27A2A"
  
  # Reshape the data long for ggplot geom_col stacked bar graph
  # TODO - reshape the long and international columsn into 1 column
  # TODO - assign the the hex codes from above, blue for local, orange for international
  df_long <- 
    df %>% 
    pivot_longer(
      cols = ???,
      names_to = "type",
      values_to = "share"
    ) %>%
    mutate(???) %>% 
    rename(ou = operating_unit, 
           ou_long = operating_unit_long) %>% 
    arrange(ou)


  df_long %>% 
    slice(1:10) %>% 
    gt() %>% 
    gt_theme_nytimes() #gtExtras
