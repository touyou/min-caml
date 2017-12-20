let rec fold f x =
  if x = 0 then
    f x
  else
    fold f (x-1)
in
print_int (fold (fun x -> x + 1) 10)
