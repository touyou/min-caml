let rec f x = x in
let rec g a b = a + b in
let h = f g in
let p = h 2 in
print_int (p 3)
