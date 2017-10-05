	.text
	.globl _min_caml_start
	.align 2
gcd.7:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.17
	or	%r5, %r2, %r5
	blr
beq_else.17:
	cmpw	%cr7, %r2, %r5
	bgt	%cr7, ble_else.18
	sub	%r5, %r5, %r2
	b	gcd.7
ble_else.18:
	sub	%r2, %r2, %r5
	or	%r5, %r28, %r5
	or	%r2, %r5, %r2
	or	%r28, %r2, %r28
	b	gcd.7
_min_caml_start: # main entry point
	mflr	%r0
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	li	%r2, 21600
	lis	%r5, 5
	ori	%r5, %r5, 9820
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	gcd.7
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
