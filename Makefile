RESULT = min-caml
NCSUFFIX = .opt
CC = gcc
CFLAGS = -g -O2 -Wall
OCAMLLDFLAGS = -warn-error -31

default: debug-code top $(RESULT) # do_test
$(RESULT): debug-code top

clean:: nobackup

SOURCES = float.c type.ml id.ml miniMap.ml miniSet.ml \
syntax.ml parser.mly lexer.mll eta.mli eta.ml typing.mli typing.ml kNormal.mli kNormal.ml \
closure.mli closure.ml asm.mli asm.ml virtual.mli virtual.ml \
debug.ml \
joinLibrary.ml \
cseMap.ml \
alpha.mli alpha.ml beta.mli beta.ml assoc.mli assoc.ml \
inline.mli inline.ml constFold.mli constFold.ml cse.mli cse.ml elim.mli elim.ml \
simm.mli simm.ml regAlloc.mli regAlloc.ml emit.mli emit.ml \
main.mli main.ml
#
# ↓テストプログラムが増えたら、これも増やす
TESTS = print sum-tail gcd sum fib ack even-odd \
adder funcomp cls-rec cls-bug cls-bug2 cls-reg-bug \
shuffle spill spill2 spill3 join-stack join-stack2 join-stack3 \
join-reg join-reg2 non-tail-if non-tail-if2 \
inprod inprod-rec inprod-loop matmul matmul-flat \
manyargs

do_test: $(TESTS:%=test/%.cmp)

.PRECIOUS: test/%.s test/% test/%.res test/%.ans test/%.cmp
TRASH = $(TESTS:%=test/%.s) $(TESTS:%=test/%) $(TESTS:%=test/%.res) $(TESTS:%=test/%.ans) $(TESTS:%=test/%.cmp)

test/%.s: $(RESULT) test/%.ml
	./$(RESULT) test/$*
test/%: test/%.s #libmincaml.S stub.c
	$(CC) $(CFLAGS) -m32 $^ -lm -o $@
test/%.res: test/%
	$< > $@
test/%.ans: test/%.ml
	ocaml $< > $@
test/%.cmp: test/%.res test/%.ans
	diff $^ > $@

include OCamlMakefile
