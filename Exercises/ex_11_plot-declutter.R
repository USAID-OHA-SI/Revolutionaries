## Declutter Plot

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

# decluttered plot --------------------------------------------------------

  #TODO - remove the facet background (HINT - facets are called strip)
  #TODO - remove the facet header text (HINT - facets are called strip)
  #TODO - remove the x axis text
  df_long_ordered_bw_goal %>% 
   ggplot(aes(y = ou, x = share)) +
   geom_vline(xintercept = .7, linewidth = 2, color = grey10k, alpha = 0.75) +
   geom_col(aes(fill = recolor)) +
   scale_fill_identity() +
   geom_text(aes(label = percent(share, 1)),
             size = 7 / .pt,
             hjust = 0,
             family = "Source Sans Pro"
   ) +
   labs(
     x = NULL, y = NULL,
     title = "FY 21 Local vs. International Budget - All Agencies",
     fill = NULL
   ) +
   si_style_yline(facet_space = 0.5) +
   scale_x_continuous(limits = c(0, 1.1)) +
   facet_grid(facet_order ~ ., scales = "free_y", drop = T, space = "free") +
   theme(???,
         ???,
         ???,
         axis.text.y = element_text(size = 8))