RESULT = min-caml
NCSUFFIX = .opt
CC = gcc
CFLAGS = -g -O2 -Wall
OCAMLLDFLAGS = -warn-error -31

default: debug-code top $(RESULT)
$(RESULT): debug-code top

clean:: nobackup

SOURCES = float.c type.ml id.ml miniMap.ml miniSet.ml \
syntax.ml parser.mly lexer.mll typing.mli typing.ml kNormal.mli kNormal.ml \
closure.mli closure.ml asm.mli asm.ml virtual.mli virtual.ml \
regAlloc.mli regAlloc.ml emit.mli emit.ml \
main.mli main.ml

include OCamlMakefile