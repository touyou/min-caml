	.data
	.literal8
	.align 3
l.73:	 # 6.000000
	.long	0
	.long	1075314688
	.align 3
l.72:	 # 5.000000
	.long	0
	.long	1075052544
	.align 3
l.71:	 # 4.000000
	.long	0
	.long	1074790400
	.align 3
l.66:	 # 3.000000
	.long	0
	.long	1074266112
	.align 3
l.65:	 # 2.000000
	.long	0
	.long	1073741824
	.align 3
l.64:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
l.63:	 # 1000000.000000
	.long	0
	.long	1093567616
	.text
	.globl _min_caml_start
	.align 2
getx.23:
	lfd	%f0, 0(%r2)
	bclr	20, %cr0	# blr
gety.25:
	lfd	%f0, 8(%r2)
	bclr	20, %cr0	# blr
getz.27:
	lfd	%f0, 16(%r2)
	bclr	20, %cr0	# blr
inprod.29:
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	getx.23
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	stfd	%f0, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	getx.23
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 8(%r3)
	fmul	%f0, %f1, %f0
	lwz	%r2, 0(%r3)
	stfd	%f0, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	gety.25
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	stfd	%f0, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	gety.25
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 24(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 16(%r3)
	fadd	%f0, %f1, %f0
	lwz	%r2, 0(%r3)
	stfd	%f0, 32(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	getz.27
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	stfd	%f0, 40(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	getz.27
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 40(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 32(%r3)
	fadd	%f0, %f1, %f0
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	addis	%r31, %r0, ha16(l.63)	# lis
	addi	%r31, %r31, lo16(l.63)
	lfd	%f0, 0(%r31)
	addis	%r31, %r0, ha16(l.64)	# lis
	addi	%r31, %r31, lo16(l.64)
	lfd	%f1, 0(%r31)
	addis	%r31, %r0, ha16(l.65)	# lis
	addi	%r31, %r31, lo16(l.65)
	lfd	%f2, 0(%r31)
	addis	%r31, %r0, ha16(l.66)	# lis
	addi	%r31, %r31, lo16(l.66)
	lfd	%f3, 0(%r31)
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 24
	stfd	%f3, 16(%r2)
	stfd	%f2, 8(%r2)
	stfd	%f1, 0(%r2)
	addis	%r31, %r0, ha16(l.71)	# lis
	addi	%r31, %r31, lo16(l.71)
	lfd	%f1, 0(%r31)
	addis	%r31, %r0, ha16(l.72)	# lis
	addi	%r31, %r31, lo16(l.72)
	lfd	%f2, 0(%r31)
	addis	%r31, %r0, ha16(l.73)	# lis
	addi	%r31, %r31, lo16(l.73)
	lfd	%f3, 0(%r31)
	or	%r4, %r5, %r4	# mr %r5, %r4
	addi	%r4, %r4, 24
	stfd	%f3, 16(%r5)
	stfd	%f2, 8(%r5)
	stfd	%f1, 0(%r5)
	stfd	%f0, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	inprod.29
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 0(%r3)
	fmul	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_truncate
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
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
