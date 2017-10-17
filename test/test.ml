let rec testf a b c =
  let x = a +. b in
  let y = a +. b in
  let arr = Array.make 4 0.0 in
  let z = arr.(c) in
  arr.(c) <- a;
  let w = arr.(c) in
  x +. y +. z +. w
in print_float (testf 10.0 2.0 2)
