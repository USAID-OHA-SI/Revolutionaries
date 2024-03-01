## Annotate Plot

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

# annotate plot -----------------------------------------------------------

  goal_text <- "Four OUs reached\nthe 70% goal"
  fail_text <- "All of these operating\nunits fell short of the\n70% goal"
  font_size <- 7/.pt
  
  #TODO - figure out the x value to place <70 label rro the right of the bars
  #TODO - add a subtitle that says "Twenty four operating units are still short of the goal"
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
    si_style_yline(facet_space = 0.5) +
    scale_x_continuous(limits = c(0, 1.1)) +
    facet_grid(facet_order ~ ., scales = "free_y", drop = T, space = "free") +
    theme(strip.background = element_blank(),
          strip.text = element_blank(),
          axis.text.x = element_blank(), 
          axis.text.y = element_text(size = 8)) +
    coord_cartesian(clip = "off", expand = F) +
    geom_text(data = . %>% filter(facet_order == ""), 
              aes(x = .45, label = "local partner share"),
              color = "white", size = font_size) +
    geom_text(data = . %>% filter(ou == "Total"), 
              aes(x = .71, label = "70% threshold"),
              color = grey60k, size = font_size, 
              hjust = -0.1) +
    geom_text(data = . %>% filter(ou == "Rwanda"), 
              aes(x = .9, label = goal_text),
              color = "#be3455", size = font_size, 
              vjust = 1, hjust = 0) +
    geom_text(data = . %>% filter(ou == "Botswana"), 
              aes(x = ???, label = fail_text),
              color = "#d38388", size = font_size, 
              vjust = 1, hjust = 0) +
    labs(title = "IN FY21, FOUR OPERATING UNITS HAD ACHIEVED THE USAID LOCAL\nPARTNER BUDGET SHARE GOAL OF 70%",
         fill = NULL,
         caption = glue("Source: Local Partner Team Data"))
  