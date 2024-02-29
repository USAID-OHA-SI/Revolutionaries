# LOCAL PARTNER REMAKE

# install packages --------------------------------------------------------

## pkgs <- c("tidyverse", "vroom", "glitr", "scales", "glue",
##           "gt", "gtExtras", "systemfonts", "usethis")
## 
## install.packages(pkgs, repos = c('https://usaid-oha-si.r-universe.dev',
##                                  'https://cloud.r-project.org'))
## 


# use_course --------------------------------------------------------------

## usethis::use_course("USAID-OHA-SI/Revolutionaries")


# load libraries ----------------------------------------------------------

  library(tidyverse) 
  library(vroom) # for loading data
  library(glitr) # for custom colors
  library(scales) # for formatting
  library(glue) # useful for creating dynamic text
  library(gt) # create beautiful tables
  library(gtExtras) # adorn gt tables
  library(systemfonts) # register fonts with R


# load data ---------------------------------------------------------------

  #local path (if using RStudio Project)
  path_local <- "Data_public/PEPFAR_local_partner_share.csv"
  
  #url path (if loading from GitHub)
  path_url <- "https://raw.githubusercontent.com/USAID-OHA-SI/Revolutionaries/main/Data_public/PEPFAR_local_partner_share.csv"
  
  #determine which data path to use
  (path_data <- ifelse(file.exists(path_local), path_local, path_url))
  
  #load data into a dataframe (df)
  df <- vroom(path_data)



# glimpse preview ---------------------------------------------------------

  # Inspect the data
  glimpse(df)



# tabular preview ---------------------------------------------------------

  # Preview as a gt table
  # View the resulting data frame as a table
  df %>% 
    slice(1:10) %>%  
    gt() %>% 
    gt_theme_nytimes() #gtExtras



# reshape long ------------------------------------------------------------

  # The hexadecimal code below can be passed directly to ggplot to add color. 
  # Excel default colors
  blue <- "#3C67BE"
  orange <- "#F27A2A"
  
  # Reshape the data long for ggplot geom_col stacked bar graph
  df_long <- 
    df %>% 
    pivot_longer(
      cols = *****,
      names_to = "type",
      values_to = "share"
    ) %>%
    mutate(fill_color = case_when(type == "local" ~ blue,
                                  TRUE ~ orange)
    ) %>% 
    rename(ou = operating_unit, 
           ou_long = operating_unit_long) %>% 
    arrange(ou)
  


# inspect long ------------------------------------------------------------

  df_long %>% 
    slice(1:10) %>% 
    gt() %>% 
    gt_theme_nytimes() #gtExtras



# base plot ---------------------------------------------------------------

  df_long %>% 
    ggplot(aes(y = ou_long, x = share)) +
    geom_col(aes(fill = fill_color),
             position = position_stack(reverse = T)) + # position_stack to alter order
    labs(
      x = NULL, y = NULL,
      title = "FY 21 Local vs. International Budget - All Agencies",
      fill = NULL
    ) +
    scale_fill_identity()
  

# label plot --------------------------------------------------------------

  df_long %>% 
    ggplot(aes(y = ou_long, x = share)) +
    geom_col(aes(fill = fill_color),
             position = position_stack(reverse = T)) +
    geom_label(aes(label = scales::percent(share, 1)), # Adds labels
      size = 8 / .pt, 
      position = position_stack(vjust = 0.5)
    ) +
    labs(
      x = NULL, y = NULL,
      title = "FY 21 Local vs. International Budget - All Agencies",
      fill = NULL
    ) +
    scale_fill_identity()


# sort plot ---------------------------------------------------------------

  df_long_ordered <- 
    df_long %>% 
    mutate(
     lp_value = case_when(
      type == "local" ~ share, # Creating a new column to sort factors on
      TRUE ~ NA_real_), 
     ou = fct_reorder(ou, lp_value), # overwrite ou into a factor 
     ou = fct_relevel(ou, "Total", after = Inf) # move Total to the Top of factor list
     ) %>% 
    arrange(ou)
  
  df_long_ordered %>% 
    ggplot(aes(y = ou, x = share)) + # Use the factor column as y-axis 
    geom_col(aes(fill = fill_color), 
             position = position_stack(reverse = TRUE)) +
    geom_label(aes(label = scales::percent(share, 1)), # Adds labels
      size = 8 / .pt, 
      position = position_stack(vjust = 0.5)
    ) +
    labs(
      x = NULL, y = NULL,
      title = "FY 21 Local vs. International Budget - All Agencies",
      fill = NULL
    ) +
    scale_fill_identity()
  

# bw plot -----------------------------------------------------------------

  df_long_ordered_bw <- 
    df_long_ordered %>% 
    mutate(fill_color = case_when(
      type == "local" ~ grey90k,
      TRUE ~ grey30k
    )) 
    
  df_long_ordered_bw %>% 
    ggplot(aes(y = ou, x = share)) +
    geom_col(aes(fill = fill_color), 
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


# lab plot ----------------------------------------------------------------

  df_long_ordered_bw %>% 
    ggplot(aes(y = ou, x = share)) +
    geom_col(aes(fill = fill_color), 
             position = position_stack(reverse = TRUE)) +
    scale_fill_identity() +
    labs(
      x = NULL, y = NULL,
      title = "FY 21 Local vs. International Budget - All Agencies",
      fill = NULL
    ) 



# filtered plot -----------------------------------------------------------

  df_long_ordered_bw %>% 
    filter(type == "local") %>% 
    ggplot(aes(y = ou, x = share)) +
    geom_col(aes(fill = type)) +
    scale_fill_manual(values = c("local" = "#be3455")) +
    geom_text(aes(label = percent(share, 1)),
              size = 7 / .pt,
              hjust = 0) +
    labs(
      x = NULL, y = NULL,
      title = "FY 21 Local vs. International Budget - All Agencies",
      fill = NULL
    ) 



# facet plot --------------------------------------------------------------

  df_long_ordered_bw_goal <- 
    df_long_ordered_bw %>% 
    filter(type == "local") %>% 
    mutate(
      facet_order = case_when(
        ou == "Total" ~ "",
        goal == 1 ~ "> 70%",
        TRUE ~ "< 70%"
      ),
      facet_order = fct_relevel(facet_order, c("", "> 70%", "< 70%"))
    ) %>%
    mutate(recolor = case_when(
      facet_order == "" ~ "#7f2339",
      goal == 1 ~ "#be3455",
      goal == 0 ~ "#d38388",
      TRUE ~ grey20k)
    )

  df_long_ordered_bw_goal %>% 
    ggplot(aes(y = ou, x = share)) +
    geom_vline(xintercept = .7, linewidth = 2, color = grey10k, alpha = 0.75) +
    geom_col(aes(fill = recolor)) +
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
    facet_grid(facet_order ~ ., scales = "free_y", drop = T, space = "free") 


# decluttered plot --------------------------------------------------------
  
  (p7 <- df_long_ordered_bw_goal %>% 
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
    theme(strip.background = element_blank(),
          strip.text = element_blank(),
          axis.text.x = element_blank(), 
          axis.text.y = element_text(size = 8))) 


# annotate plot -----------------------------------------------------------

  goal_text <- "Four OUs reached\nthe 70% goal"
  fail_text <- "All of these operating\nunits fell short of the\n70% goal"
  font_size <- 7/.pt
  
  p7 +
    coord_cartesian(clip = "off", expand = F) +
    geom_text(data = . %>% filter(facet_order == ""), 
              aes(x = .45, label = "local partner share"),
              color = "white", size = font_size) +
    geom_text(data = . %>% filter(facet_order == ""), 
              aes(x = .71, label = "70% threshold"),
              color = grey60k, size = font_size, 
              hjust = -0.1) +
    geom_text(data = . %>% filter(facet_order == "> 70%" & ou == "Rwanda"), 
              aes(x = .9, label = goal_text),
              color = "#be3455", size = font_size, 
              vjust = 1, hjust = 0) +
    geom_text(data = . %>% filter(facet_order == "< 70%" & ou == "Botswana"), 
              aes(x = .72, label = fail_text),
              color = "#d38388", size = font_size, 
              vjust = 1, hjust = 0) +
    labs(title = "IN FY21, FOUR OPERATING UNITS HAD ACHIEVED THE USAID LOCAL\nPARTNER BUDGET SHARE GOAL OF 70%",
         subtitle = "Twenty four operating units are still short of the goal.",
         fill = NULL,
         caption = glue("Source: Local Partner Team Data"))


