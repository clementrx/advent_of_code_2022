input <- read.table(here("day04", "input04.txt"), sep = ",")

sum(apply(input, 1, function(x) {
  x1 <- eval(parse(text = gsub("-", ":", x[1])))
  x2 <- eval(parse(text = gsub("-", ":", x[2])))
  all(x1 %in% x2) | all(x2 %in% x1)
}))

#534

sum(apply(input, 1, function(x) {
  x1 <- eval(parse(text = gsub("-", ":", x[1])))
  x2 <- eval(parse(text = gsub("-", ":", x[2])))
  any(x1 %in% x2)
}))

#841

