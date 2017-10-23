	.text
	.globl _min_caml_start
	.align 2
f.9:
	cmp	%cr7, 0, %r2, 0	# cmpwi
	bc	1000, %cr7, bge_else.27
	stw	%r2, 0(%r3)
	stw	%r29, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_print_int
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 1	# li
	lwz	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r29, 0(%r2)
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
bge_else.27:
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 8
	addis	%r2, %r0, ha16(f.9)	# lis
	addi	%r2, %r2, lo16(f.9)
	stw	%r2, 0(%r29)
	addi	%r2, %r0, 9	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	lwz	%r1, 0(%r1)
	lwz	%r0, 8(%r1)
	mtspr	8, %r0	# mtlr
	lmw	%r30, -8(%r1)
	bclr	20, %cr0	# blr
