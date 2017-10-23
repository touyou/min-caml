	.data
	.literal8
	.align 3
l.47:	 # 0.000000
	.long	0
	.long	0
	.align 3
l.46:	 # 1000000.000000
	.long	0
	.long	1093567616
	.align 3
l.45:	 # 4.560000
	.long	-1546188227
	.long	1074937200
	.align 3
l.44:	 # 1.230000
	.long	2061584302
	.long	1072934420
	.text
	.globl _min_caml_start
	.align 2
inprod.18:
	cmp	%cr7, 0, %r6, 0	# cmpwi
	bc	1000, %cr7, bge_else.52
	slwi	%r7, %r6, 3
	lfdx	%f1, %r2, %r7
	slwi	%r7, %r6, 3
	lfdx	%f2, %r5, %r7
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%r6, %r6, -1	# subi %r6, %r6, 1
	b	inprod.18
bge_else.52:
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, ha16(l.44)	# lis
	addi	%r31, %r31, lo16(l.44)
	lfd	%f0, 0(%r31)
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_float_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, ha16(l.45)	# lis
	addi	%r31, %r31, lo16(l.45)
	lfd	%f0, 0(%r31)
	lwz	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_float_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, ha16(l.46)	# lis
	addi	%r31, %r31, lo16(l.46)
	lfd	%f0, 0(%r31)
	addis	%r31, %r0, ha16(l.47)	# lis
	addi	%r31, %r31, lo16(l.47)
	lfd	%f1, 0(%r31)
	addi	%r6, %r0, 2	# li
	lwz	%r2, 4(%r3)
	stfd	%f0, 8(%r3)
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	inprod.18
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 8(%r3)
	fmul	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_truncate
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_print_int
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	lwz	%r1, 0(%r1)
	lwz	%r0, 8(%r1)
	mtspr	8, %r0	# mtlr
	lmw	%r30, -8(%r1)
	bclr	20, %cr0	# blr
