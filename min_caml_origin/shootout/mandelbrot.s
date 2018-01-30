	.data
	.literal8
	.align 3
l.102:	 # 0.000000
	.long	0
	.long	0
	.align 3
l.101:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
l.100:	 # 1.500000
	.long	0
	.long	1073217536
	.align 3
l.99:	 # 400.000000
	.long	0
	.long	1081671680
	.align 3
l.98:	 # 4.000000
	.long	0
	.long	1074790400
	.text
	.globl _min_caml_start
	.align 2
dbl.38:
	fadd	%f0, %f0, %f0
	bclr	20, %cr0	# blr
iloop.54:
	addi	%r5, %r0, 0	# li
	cmp	%cr7, 0, %r2, 0	# cmpwi
	bc	12, %cr7, beq_else.123
	addi	%r2, %r0, 1	# li
	b	min_caml_print_int
beq_else.123:
	fsub	%f2, %f2, %f3
	fadd	%f2, %f2, %f4
	stw	%r5, 0(%r3)
	stfd	%f4, 8(%r3)
	stw	%r2, 16(%r3)
	stfd	%f2, 24(%r3)
	stfd	%f5, 32(%r3)
	stfd	%f1, 40(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	dbl.38
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 40(%r3)
	fmul	%f0, %f0, %f1
	lfd	%f5, 32(%r3)
	fadd	%f1, %f0, %f5
	lfd	%f0, 24(%r3)
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f4, %f2, %f3
	addis	%r31, %r0, ha16(l.98)	# lis
	addi	%r31, %r31, lo16(l.98)
	lfd	%f6, 0(%r31)
	fcmpu	%cr7, %f4, %f6
	bc	4, %cr7, ble_else.126
	lwz	%r2, 16(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lfd	%f4, 8(%r3)
	b	iloop.54
ble_else.126:
	lwz	%r2, 0(%r3)
	b	min_caml_print_int
xloop.44:
	lwz	%r6, 4(%r29)
	cmp	%cr7, 0, %r6, %r2	# cmpw
	bc	4, %cr7, ble_else.127
	bclr	20, %cr0	# blr
ble_else.127:
	stw	%r29, 0(%r3)
	stw	%r2, 4(%r3)
	stw	%r5, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_float_of_int
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	dbl.38
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, ha16(l.99)	# lis
	addi	%r31, %r31, lo16(l.99)
	lfd	%f1, 0(%r31)
	fdiv	%f0, %f0, %f1
	addis	%r31, %r0, ha16(l.100)	# lis
	addi	%r31, %r31, lo16(l.100)
	lfd	%f2, 0(%r31)
	fsub	%f0, %f0, %f2
	lwz	%r2, 8(%r3)
	stfd	%f0, 16(%r3)
	stfd	%f1, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_float_of_int
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	dbl.38
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 24(%r3)
	fdiv	%f0, %f0, %f1
	addis	%r31, %r0, ha16(l.101)	# lis
	addi	%r31, %r31, lo16(l.101)
	lfd	%f1, 0(%r31)
	fsub	%f5, %f0, %f1
	addi	%r2, %r0, 1000	# li
	addis	%r31, %r0, ha16(l.102)	# lis
	addi	%r31, %r31, lo16(l.102)
	lfd	%f0, 0(%r31)
	lfd	%f4, 16(%r3)
	mfspr	%r31, 8	# mflr
	fmr	%f3, %f0
	fmr	%f2, %f0
	fmr	%f1, %f0
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	iloop.54
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 8(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
yloop.40:
	addi	%r5, %r0, 400	# li
	cmp	%cr7, 0, %r2, 400	# cmpwi
	bc	8, %cr7, bge_else.130
	bclr	20, %cr0	# blr
bge_else.130:
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 8
	addis	%r6, %r0, ha16(xloop.44)	# lis
	addi	%r6, %r6, lo16(xloop.44)
	stw	%r6, 0(%r29)
	stw	%r5, 4(%r29)
	addi	%r5, %r0, 0	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r28, %r5	# mr %r28, %r5
	or	%r2, %r5, %r2	# mr %r5, %r2
	or	%r28, %r2, %r28	# mr %r2, %r28
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	b	yloop.40
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	addi	%r2, %r0, 0	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	yloop.40
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	lwz	%r1, 0(%r1)
	lwz	%r0, 8(%r1)
	mtspr	8, %r0	# mtlr
	lmw	%r30, -8(%r1)
	bclr	20, %cr0	# blr
