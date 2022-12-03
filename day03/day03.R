input <- read.table(here('day03', "input03.txt"),
                    sep = " ",
                    header = F)

input <- input %>%
  group_by(V1) %>%
  mutate(size = nchar(V1) / 2,
         V2 = paste(append(strsplit(V1, "")[[1]], "-", nchar(V1) / 2), collapse = "")) %>%
  ungroup()

input <- input %>%
  separate(V2,
           into = c('rucksack1', 'rucksack2'),
           sep = '-')

share = list()

for (i in 1:nrow(input)) {
  item <-
    vintersect(strsplit(input$rucksack1, "")[[i]],
               strsplit(input$rucksack2, "")[[i]])
  share[[i]] <- unique(item)
  
}

input$share = as.character(share)

priority <- data_frame(item = c(letters, LETTERS),
                       priority = 1:52)

input <- input %>%
  left_join(priority, by = c('share' = 'item'))

sum(input$priority)
# 7746

# part 2 ----
input <- read.table(here('day03', "input03.txt"),
                    sep = " ",
                    header = F)

group = sort(c(1:100, 1:100, 1:100))

input$group <- group

input <- input %>%
  group_by(group) %>%
  mutate(group_n = row_number()) %>%
  ungroup() %>%
  pivot_wider(values_from = V1,
              names_from = group_n)

badge = list()

for (i in 1:nrow(input)) {
  item12 <-
    vintersect(strsplit(input$`1`, "")[[i]],
               strsplit(input$`2`, "")[[i]])
  item13 <-
    vintersect(strsplit(input$`1`, "")[[i]],
               strsplit(input$`3`, "")[[i]])
  item23 <-
    vintersect(strsplit(input$`2`, "")[[i]],
               strsplit(input$`3`, "")[[i]])
  itema <-
    vintersect(item12,
               item13)
  itemb <-
    vintersect(item13,
               item23)
  item <-
    vintersect(itema,
               itemb)
  badge[[i]] <- unique(item)
}

input$badge = as.character(badge)

input <- input %>%
  left_join(priority, by = c('badge' = 'item'))

sum(input$priority)
# 2604