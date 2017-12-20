let rec f i =
  if i = -1 then
    i
  else
    f (i - 1)
in let a = f 1 in ()