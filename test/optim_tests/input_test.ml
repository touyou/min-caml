(let rec print_int a = output a);

(let rec kernel_sin a =
  let a2 = a *. a in
  let a3 = a *. a2 in
  let a5 = a3 *. a2 in
  let a7 = a5 *. a2 in
  a -. 0.16666668 *. a3 +. 0.008332824 *. a5 -. 0.00019587841 *. a7);

(let rec kernel_cos a =
   let a2 = a *. a in
   let a4 = a2 *. a2 in
   let a6 = a2 *. a4 in
   1.0 -. 0.5 *. a2 +. 0.04166368 *. a4 -. 0.0013695068 *. a6);

(let rec sin a =
   if a >= 0.0 then
     if a > 6.28318548202514 then
       sin (a -. 6.28318548202514)
     else
     if a < 3.1415927410 then
       if a < 1.5707963705 then
         if a < 0.785398185 then
           kernel_sin a
         else
           kernel_cos (1.5707963705 -. a)
       else
       if a < 2.35619455 then
         kernel_cos (a -. 1.5707963705)
       else
         kernel_sin (3.1415927410 -. a)
     else
       let b = a -. 3.1415927410 in
       if b < 1.5707963705 then
         if b < 0.785398185 then
           0.0 -. kernel_sin b
         else
           0.0 -. kernel_cos (1.5707963705 -. b)
       else
       if b < 2.35619455 then
         0.0 -. kernel_cos (b -. 1.5707963705)
       else
         0.0 -. kernel_sin (3.1415927410 -. b)
   else
     0.0 -. sin (0.0 -. a));

(let rec cos a =
   if a >= 0.0 then
     if a > 6.28318548202514 then
       sin (a -. 6.28318548202514)
     else
     if a < 3.1415927410 then
       if a < 1.5707963705 then
         if a < 0.785398185 then
           kernel_cos a
         else
           kernel_sin (1.5707963705 -. a)
       else
       if a < 2.35619455 then
         0.0 -. kernel_sin (a -. 1.5707963705)
       else
         0.0 -. kernel_cos (3.1415927410 -. a)
     else
       let b = a -. 3.1415927410 in
       if b < 1.5707963705 then
         if b < 0.785398185 then
           0.0 -. kernel_sin b
         else
           0.0 -. kernel_cos (1.5707963705 -. b)
       else
       if b < 2.35619455 then
         kernel_cos (b -. 1.5707963705)
       else
         kernel_sin (3.1415927410 -. b)
   else
     cos (0.0 -. a));

(let rec kernel_atan a =
   let a2 = a *. a in
   let a3 = a *. a2 in
   let a5 = a3 *. a2 in
   let a7 = a5 *. a2 in
   let a9 = a7 *. a2 in
   let a11 = a9 *. a2 in
   let a13 = a11 *. a2 in
   a -. 0.3333333 *. a3 +. 0.2 *. a5 -. 0.142857142 *. a7 +. 0.111111104 *. a9 -. 0.08976446 *. a11 +. 0.060035485 *. a13);

(let rec atan a =
   if a > 0.0 then
     if a < 0.4375 then
       kernel_atan a
     else
     if a < 2.4375 then
       0.78539818 +. kernel_atan ((a -. 1.0) /. (a +. 1.0))
     else
       1.57079637 -. kernel_atan (1.0 /. a)
   else
     let b = 0.0 -. a in
     if b < 0.4375 then
       0.0 -. (kernel_atan b)
     else
     if b < 2.4375 then
       0.0 -. (0.78539818 +. kernel_atan ((b -. 1.0) /. (b +. 1.0)))
     else
       0.0 -. (1.57079637 -. kernel_atan (1.0 /. b)));

(let rec int_of_float f =
   let exp = ((f2i(f) lsr 23) land 255) - 127 in
   let fraction = ((f2i(f) lor 8388608) land 16777215)
   in
   let rval =
     if (23 - exp) > 0 then
       (fraction lsr (23 - exp))
     else
       (fraction lsl (exp - 23))
   in
   let rval = rval land 2147483647 in
   if f >= 0.0 then
     rval
   else
     -rval);

(let rec float_of_int i =
   let rec search_top i =
     if i = 1 then
       0
     else
       (search_top (i lsr 1)) + 1
   in
   if i = 0 then
     i2f(0)
   else
     let sign = if i > 0 then 0 else 1 in
     let i = if i > 0 then i else -i in
     let top = search_top i in
     if top > 23 then
       i2f((sign lsl 31) + ((top + 127) lsl 23) + ((i lxor (1 lsl top)) lsr (top - 23)))
     else
       i2f((sign lsl 31) + ((top + 127) lsl 23) + ((i lxor (1 lsl top)) lsl (23 - top))));

(* (let rec read_int a = input a);

   (let rec print_byte a = output a);

   (let rec read_byte a = input a); *)