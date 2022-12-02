packages <- c('dplyr',
              'here',
              'lubridate',
              'rvest')

install.packages(setdiff(packages, rownames(installed.packages())))

library(dplyr)
library(here)
library(lubridate)
library(rvest)

day <- format(today(), "%d")

dir.create(file.path(here(paste0('day', day))), showWarnings = FALSE)

file.create(here(paste0('day',
                        day),
                 paste0('input',
                        day,
                        '.txt')))
