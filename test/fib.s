	.text
	.globl _min_caml_start
	.align 2
fib.10:
	cmpwi	%cr7, %r2, 1
	bgt	%cr7, ble_else.24
	blr
ble_else.24:
	subi	%r5, %r2, 1
	stw	%r2, 0(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	fib.10
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lwz	%r5, 0(%r3)
	subi	%r5, %r5, 2
	stw	%r2, 4(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fib.10
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	lwz	%r5, 4(%r3)
	add	%r2, %r5, %r2
	blr
_min_caml_start: # main entry point
	mflr	%r0
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	li	%r2, 30
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	fib.10
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
