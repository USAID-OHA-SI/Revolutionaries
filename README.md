# Revolutionaries
Data Viz content for training and public events

Presenters: Karishma Srikanth, Tim Essam, Aaron Chafetz

The first half of our session will be the form of a [lecture covering data visualization principles and applying them in R](https://docs.google.com/presentation/d/e/2PACX-1vT5lRhO71-RXuv-0E4wmS5wounoRU6TOyH1y2qx5CmG5443Fd_OM4YCYexb6-ASOk0aiFrEJigU9odD/pub?start=false&loop=false&delayms=3000) with `ggplot2`. The remainer of the time will be spent working hands on through a number of exercises to remake a graphics applying those principles. To a participate, you will need to download the material using the code below

``` r

#install the packages we will use

pkgs <- c("tidyverse", "vroom", "glitr", "scales", "glue", 
          "gt", "gtExtras", "systemfonts", "usethis")

install.packages(pkgs, repos = c('https://usaid-oha-si.r-universe.dev', 
                                 'https://cloud.r-project.org'))

#download and launch the material

usethis::use_course("USAID-OHA-SI/Revolutionaries")

```


---

*Disclaimer: The findings, interpretation, and conclusions expressed herein are those of the authors and do not necessarily reflect the views of United States Agency for International Development. All errors remain our own.*
