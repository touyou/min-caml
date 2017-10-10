	.text
	.globl _min_caml_start
	.align 2
test.8:
	li	%r2, 17
	blr
_min_caml_start: # main entry point
	mflr	%r0
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	li	%r2, 10
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	test.8
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_print_int
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
#	main program ends
	lwz	%r1, 0(%r1)
	lwz	%r0, 8(%r1)
	mtlr	%r0
	lmw	%r30, -8(%r1)
	blr
