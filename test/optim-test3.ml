let rec f a b =
  let rec f_sub x i =
    if i = 0 then x else f_sub x (i - 1)
  in
  f_sub 0 30
in
let a = f 1 3 in ()