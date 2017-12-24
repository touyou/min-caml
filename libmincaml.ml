(let rec mul_sub abs_a abs_b x i =
   if i = -1 then
       x
     else
     if (abs_b land (1 lsl i)) = 0 then
       mul_sub abs_a abs_b x (i - 1)
     else
       mul_sub abs_a abs_b (x + (abs_a lsl i)) (i - 1));
(let rec mul a b =
   let abs_a = if a < 0 then -a else a in
   let abs_b = if b < 0 then -b else b in
   let abs = (mul_sub abs_a abs_b 0 30) land 2147483647 in
   if ((a lsr 31) lxor (b lsr 31)) = 0 then
     abs
   else
     -abs);

(let rec div a b =
   let rec div_sub x a b i =
     if i = -1 then
       x
     else
     if (a lsr i) >= b then
       div_sub ((1 lsl i) + x) (a - (b lsl i)) b (i - 1)
     else
       div_sub x a b (i - 1)
   in
   let abs_a = if a < 0 then -a else a in
   let abs_b = if b < 0 then -b else b in
   let abs = (div_sub 0 abs_a abs_b 30) land 2147483647
   in
   if ((a lsr 31) lxor (b lsr 31)) = 0 then
     abs
   else
     -abs);

(let rec print_newline a = output 10);

(let rec print_int_sub a =
   if a < 10 then
     output (a + 48)
   else
     (print_int_sub (div a 10);
      output (a - (mul (div a 10) 10) + 48)));
(let rec print_int a =
   (if a < 0 then
      (output 45;
       print_int_sub (-a))
    else
      print_int_sub a));

(let rec print_char c = output c);

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

(let rec fiszero f =
   if f = 0.0 then true else false);
(let rec fispos f =
   if f > 0.0 then true else false);
(let rec fisneg f =
   not (fispos f));
(let rec fneg f = -.f);

(let rec abs_float i =
   if i > 0.0 then i else -.i);
(let rec fabs f =
   abs_float f);
(let rec fless a b =
   if a < b then true else false);
(let rec fhalf f = f *. 0.5);
(let rec fsqr f = f *. f);

(* f2i, i2f->constFold.ml? *)
(let rec int_of_float f =
   if f = 0.0 then 0 else
     let i = f2i(f) in
     let exp = ((i lsr 23) land 255) - 127 in
     let mantissa = ((i lor 8388608) land 16777215) in
     let lsrv = 23 - exp in
     let v = if lsrv >= 32 then 0 else
         if lsrv >= 0 then
           mantissa lsr lsrv
         else
           mantissa lsl (-lsrv)
     in
     if f >= 0.0 then
       v
     else
       -v);

(let rec float_of_int i =
   let sgn = if i > 0 then 0 else 1 in
   let ii = if i > 0 then i else -i in
   if ii = 0 then 0.0 else
     let rec msb_sub ii j =
       if (ii lsr j) = 0 then
         if ii <> 0 then
           msb_sub ii (j - 1)
         else
           j
       else
         j
     in
     let msb = msb_sub ii 31 in
     let exp = (127 + msb) lsl 23 in
     let mantissa = ((ii lsl (32 - msb)) land 4294967295) lsr 9 in
     let v = mantissa lor exp lor (sgn lsl 31) in
     i2f(v));

(let rec floor i =
   if i>= 0.0 then float_of_int(int_of_float i)
   else float_of_int(int_of_float (i -. 1.0)));

(* threshold *)
(let threshold = 1.0e-10);

(let rec sqrt_sub x a =
   let n = (x +. a /. x) /. 2.0 in
   if abs_float (n -. x) < threshold then n else sqrt_sub n a);
(let rec sqrt a = sqrt_sub 0.2 a);

(* 数字が入力されるまで *)
(let rec read_int x =
   let rec f acc =
     let n = input () in
     if n > 47 then
       if n < 58 then
         f ((mul acc 10) + (n - 48))
       else acc
     else acc
   in
   let c = input () in
   if c = 45 then -(f 0) else
     (if c > 47 then
        if c < 58 then
          f (c - 48)
        else read_int x
      else read_int x));

(let rec read_float x =
   let rec g b acc =
     let n = input () in
     if n > 47 then
       if n < 58 then
         g (b *. 0.1) (acc +. b *. (float_of_int (n-48)))
       else acc
     else acc
   in
   let rec f acc =
     let n = input () in
     if n > 47 then
       if n < 58 then
         f (acc *. 10.0 +. (float_of_int (n - 48)))
       else acc
     else  (if n = 46 then g 0.1 acc else acc)
   in
   let c = input () in
   if c = 45 then (0.0 -. (f 0.0)) else
     (if c > 47 then
        if c < 58 then
          f (float_of_int (c - 48))
        else (read_float x)
      else (read_float x)));

(let rec is_number b =
   if b >= 48 then
     if b <= 57 then
       true
     else
       false
   else
     false);

(let rec print_float f =
   let rec print_float_sub f j =
     if j = 0 then
       ()
     else
       (let f = f *. 10.0
        in
        let i = int_of_float f
        in
        output (i + 48);
        let p = f -. (float_of_int i)
        in
        print_float_sub p (j - 1))
   in
   let f = if f >= 0.0 then f else (output 45; -.f)
   in
   let i = int_of_float f
   in
   print_int i;
   output 46;
   let p = f -. (float_of_int i)
   in
   print_float_sub p 5);
