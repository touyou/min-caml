#!/bin/sh

./min-caml -O test/ack #-as-library ../library_implement/libmincaml
./min-caml -O test/adder #-as-library ../library_implement/libmincaml
./min-caml -O test/cls-bug #-as-library ../library_implement/libmincaml
./min-caml -O test/cls-bug2 #-as-library ../library_implement/libmincaml
./min-caml -O test/cls-rec #-as-library ../library_implement/libmincaml
./min-caml -O test/cls-reg-bug #-as-library ../library_implement/libmincaml
./min-caml -O test/cse_test #-as-library ../library_implement/libmincaml
./min-caml -O test/even-odd #-as-library ../library_implement/libmincaml
./min-caml -O test/fib #-as-library ../library_implement/libmincaml
./min-caml -O test/float #-as-library ../library_implement/libmincaml
./min-caml -O test/fun-partition #-as-library ../library_implement/libmincaml
./min-caml -O test/fun-partition2
./min-caml -O test/fun-test #-as-library ../library_implement/libmincaml
./min-caml -O test/funcomp #-as-library ../library_implement/libmincaml
./min-caml -O test/gcd #-as-library ../library_implement/libmincaml
./min-caml -O test/inprod-loop #-as-library ../library_implement/libmincaml
./min-caml -O test/inprod-rec #-as-library ../library_implement/libmincaml
./min-caml -O test/inprod #-as-library ../library_implement/libmincaml
./min-caml -O test/join-reg #-as-library ../library_implement/libmincaml
./min-caml -O test/join-reg2 #-as-library ../library_implement/libmincaml
./min-caml -O test/join-stack #-as-library ../library_implement/libmincaml
./min-caml -O test/join-stack2 #-as-library ../library_implement/libmincaml
./min-caml -O test/join-stack3 #-as-library ../library_implement/libmincaml
./min-caml -O test/mandelbrot #-as-library ../library_implement/libmincaml
./min-caml -O test/matmul-flat #-as-library ../library_implement/libmincaml
./min-caml -O test/matmul #-as-library ../library_implement/libmincaml
./min-caml -O test/non-tail-if #-as-library ../library_implement/libmincaml
./min-caml -O test/non-tail-if2 #-as-library ../library_implement/libmincaml
./min-caml -O test/print #-as-library ../library_implement/libmincaml
./min-caml -O test/shuffle #-as-library ../library_implement/libmincaml
./min-caml -O test/spill #-as-library ../library_implement/libmincaml
./min-caml -O test/spill2 #-as-library ../library_implement/libmincaml
./min-caml -O test/spill3 #-as-library ../library_implement/libmincaml
./min-caml -O test/sum-tail #-as-library ../library_implement/libmincaml
./min-caml -O test/sum #-as-library ../library_implement/libmincaml
./min-caml -O test/test #-as-library ../library_implement/libmincaml
