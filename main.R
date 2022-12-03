packages <- c('dplyr',
              'here',
              'lubridate',
              'rvest',
              'tidyr',
              'vecsets')

install.packages(setdiff(packages, rownames(installed.packages())))

library(dplyr)
library(here)
library(lubridate)
library(rvest)
library(tidyr)
library(vecsets)

day <- format(today(), "%d")

dir.create(file.path(here(paste0('day', day))), showWarnings = FALSE)

file.create(here(paste0('day',
                        day),
                 paste0('input',
                        day,
                        '.txt')))

file.create(here(paste0('day',
                        day),
                 paste0('day',
                        day,
                        '.R')))
