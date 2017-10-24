	.text
	.globl _min_caml_start
	.align 2
f.13:
	addi	%r2, %r0, 12345	# li
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	addi	%r2, %r0, 10	# li
	addi	%r5, %r0, 3	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, 1	# lis
	ori	%r5, %r5, 2354
	lwz	%r6, 0(%r2)
	cmpi	%cr7, 0, %r6, 3	# cmpwi
	bc	12, %cr7, beq_else.33
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	f.13
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	lwz	%r5, 4(%r5)
	add	%r2, %r2, %r5
	lwz	%r5, 0(%r3)
	add	%r2, %r2, %r5
	b	beq_cont.34
beq_else.33:
	addi	%r2, %r0, 7	# li
beq_cont.34:
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
