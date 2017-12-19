let rec dbl f = f +. f in
  if dbl (-.1.5) = (float_of_int (-3)) then
    print_int 0
  else
    print_int 1