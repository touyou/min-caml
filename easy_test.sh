#!/bin/sh

export FLAGS='-O -inline 60'
./min-caml $FLAGS test/ack
./min-caml $FLAGS test/adder #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/cls-bug #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/cls-bug2 #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/cls-rec #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/cls-reg-bug #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/cse_test #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/even-odd #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/fib #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/float #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/fun-partition #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/fun-partition2
./min-caml $FLAGS test/fun-test #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/funcomp #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/gcd #-as-library ../library_implement/libmincaml
#./min-caml $FLAGS test/inprod-loop #-as-library ../library_implement/libmincaml
#./min-caml $FLAGS test/inprod-rec #-as-library ../library_implement/libmincaml
#./min-caml $FLAGS test/inprod #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/join-reg #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/join-reg2 #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/join-stack #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/join-stack2 #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/join-stack3 #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/mandelbrot #-as-library ../library_implement/libmincaml
#./min-caml $FLAGS test/matmul-flat #-as-library ../library_implement/libmincaml
#./min-caml $FLAGS test/matmul #-as-library ../library_implement/libmincaml
#./min-caml $FLAGS test/non-tail-if #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/non-tail-if2 #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/print #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/shuffle #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/spill #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/spill2 #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/spill3 #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/sum-tail #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/sum #-as-library ../library_implement/libmincaml
./min-caml $FLAGS test/test #-as-library ../library_implement/libmincaml
