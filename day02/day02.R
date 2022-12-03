input <- read.table(here('day02', "input02.txt"),
                    sep = " ",
                    header = F)

input <- input %>%
  mutate(
    score1 = case_when(V1 == 'A' ~ 1,
                       V1 == 'B' ~ 2,
                       V1 == 'C' ~ 3),
    score2 = case_when(V2 == 'X' ~ 1,
                       V2 == 'Y' ~ 2,
                       V2 == 'Z' ~ 3),
    
    my_score = case_when(
      V1 == 'A' & V2 == 'X' ~ 3 + score2,
      V1 == 'A' & V2 == 'Y' ~ 6 + score2,
      V1 == 'A' & V2 == 'Z' ~ 0 + score2,
      
      V1 == 'B' & V2 == 'X' ~ 0 + score2,
      V1 == 'B' & V2 == 'Y' ~ 3 + score2,
      V1 == 'B' & V2 == 'Z' ~ 6 + score2,
      
      V1 == 'C' & V2 == 'X' ~ 6 + score2,
      V1 == 'C' & V2 == 'Y' ~ 0 + score2,
      V1 == 'C' & V2 == 'Z' ~ 3 + score2,
    )
  )

sum(input$my_score)
# 11767

input <- input %>%
  mutate(
    ending_round = case_when(V2 == 'X' ~ 'L',
                             V2 == 'Y' ~ 'D',
                             V2 == 'Z' ~ 'W'),
    
    my_choice = case_when(
      V1 == 'A' & ending_round == 'L' ~ 'Z',
      V1 == 'A' & ending_round == 'D' ~ 'X',
      V1 == 'A' & ending_round == 'W' ~ 'Y',
      
      V1 == 'B' & ending_round == 'L' ~ 'X',
      V1 == 'B' & ending_round == 'D' ~ 'Y',
      V1 == 'B' & ending_round == 'W' ~ 'Z',
      
      V1 == 'C' & ending_round == 'L' ~ 'Y',
      V1 == 'C' & ending_round == 'D' ~ 'Z',
      V1 == 'C' & ending_round == 'W' ~ 'X',
    ),
    
    score2_bis = case_when(my_choice == 'X' ~ 1,
                           my_choice == 'Y' ~ 2,
                           my_choice == 'Z' ~ 3),
    
    my_score_bis = case_when(
      V1 == 'A' & my_choice == 'X' ~ 3 + score2_bis,
      V1 == 'A' & my_choice == 'Y' ~ 6 + score2_bis,
      V1 == 'A' & my_choice == 'Z' ~ 0 + score2_bis,
      
      V1 == 'B' & my_choice == 'X' ~ 0 + score2_bis,
      V1 == 'B' & my_choice == 'Y' ~ 3 + score2_bis,
      V1 == 'B' & my_choice == 'Z' ~ 6 + score2_bis,
      
      V1 == 'C' & my_choice == 'X' ~ 6 + score2_bis,
      V1 == 'C' & my_choice == 'Y' ~ 0 + score2_bis,
      V1 == 'C' & my_choice == 'Z' ~ 3 + score2_bis,
    )
    
  )

sum(input$my_score_bis)
# 13886
