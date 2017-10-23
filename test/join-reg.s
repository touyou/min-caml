	.text
	.globl _min_caml_start
	.align 2
f.12:
	li	%r2, 123
	bclr	20, %cr0	# blr
g.14:
	li	%r2, 456
	bclr	20, %cr0	# blr
h.16:
	li	%r2, 789
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	f.12
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	g.14
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	h.16
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmp	%cr7, 0, %r2, 0	# cmpwi
	bc	1100, %cr7, beq_else.31
	lwz	%r2, 4(%r3)
	lwz	%r5, 0(%r3)
	sub	%r2, %r5, %r2
	b	beq_cont.32
beq_else.31:
	lwz	%r2, 0(%r3)
	lwz	%r5, 4(%r3)
	sub	%r2, %r5, %r2
beq_cont.32:
	lwz	%r5, 0(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 4(%r3)
	add	%r2, %r2, %r5
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_print_int
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	lwz	%r1, 0(%r1)
	lwz	%r0, 8(%r1)
	mtspr	8, %r0	# mtlr
	lmw	%r30, -8(%r1)
	bclr	20, %cr0	# blr
