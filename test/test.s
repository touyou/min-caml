	.data
	.literal8
	.align 3
l.33:	 # 2.000000
	.long	0
	.long	1073741824
	.align 3
l.32:	 # 10.000000
	.long	0
	.long	1076101120
	.align 3
l.28:	 # 0.000000
	.long	0
	.long	0
	.text
	.globl _min_caml_start
	.align 2
testf.10:
	fadd	%f1, %f0, %f1
	addi	%r5, %r0, 4	# li
	addis	%r31, %r0, ha16(l.28)	# lis
	addi	%r31, %r31, lo16(l.28)
	lfd	%f2, 0(%r31)
	stfd	%f1, 0(%r3)
	stfd	%f0, 8(%r3)
	stw	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	fmr	%f0, %f2
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_create_float_array
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 16(%r3)
	slwi	%r6, %r5, 3
	lfdx	%f0, %r2, %r6
	slwi	%r6, %r5, 3
	lfd	%f1, 8(%r3)
	stfdx	%f1, %r2, %r6
	slwi	%r5, %r5, 3
	lfdx	%f1, %r2, %r5
	lfd	%f2, 0(%r3)
	fadd	%f2, %f2, %f2
	fadd	%f0, %f2, %f0
	fadd	%f0, %f0, %f1
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	addis	%r31, %r0, ha16(l.32)	# lis
	addi	%r31, %r31, lo16(l.32)
	lfd	%f0, 0(%r31)
	addis	%r31, %r0, ha16(l.33)	# lis
	addi	%r31, %r31, lo16(l.33)
	lfd	%f1, 0(%r31)
	addi	%r2, %r0, 2	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	testf.10
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_print_float
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	lwz	%r1, 0(%r1)
	lwz	%r0, 8(%r1)
	mtspr	8, %r0	# mtlr
	lmw	%r30, -8(%r1)
	bclr	20, %cr0	# blr
