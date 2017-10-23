	.text
	.globl _min_caml_start
	.align 2
gcd.7:
	cmp	%cr7, 0, %r2, 0	# cmpwi
	bc	12, %cr7, beq_else.17
	or	%r5, %r2, %r5	# mr %r2, %r5
	bclr	20, %cr0	# blr
beq_else.17:
	cmp	%cr7, 0, %r2, %r5	# cmpw
	bc	4, %cr7, ble_else.18
	sub	%r5, %r5, %r2
	b	gcd.7
ble_else.18:
	sub	%r2, %r2, %r5
	or	%r5, %r28, %r5	# mr %r28, %r5
	or	%r2, %r5, %r2	# mr %r5, %r2
	or	%r28, %r2, %r28	# mr %r2, %r28
	b	gcd.7
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	addi	%r2, %r0, 21600	# li
	addis	%r5, %r0, 5	# lis
	ori	%r5, %r5, 9820
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	gcd.7
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_print_int
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	lwz	%r1, 0(%r1)
	lwz	%r0, 8(%r1)
	mtspr	8, %r0	# mtlr
	lmw	%r30, -8(%r1)
	bclr	20, %cr0	# blr
