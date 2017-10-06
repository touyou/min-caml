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
	blr
iloop.54:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.117
	li	%r2, 1
	b	min_caml_print_int
beq_else.117:
	fsub	%f2, %f2, %f3
	fadd	%f2, %f2, %f4
	stfd	%f4, 0(%r3)
	stw	%r2, 8(%r3)
	stfd	%f2, 16(%r3)
	stfd	%f5, 24(%r3)
	stfd	%f1, 32(%r3)
	mflr	%r31
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	dbl.38
	subi	%r3, %r3, 48
	lwz	%r31, 44(%r3)
	mtlr	%r31
	lfd	%f1, 32(%r3)
	fmul	%f0, %f0, %f1
	lfd	%f5, 24(%r3)
	fadd	%f1, %f0, %f5
	lfd	%f0, 16(%r3)
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f4, %f2, %f3
	lis	%r31, ha16(l.98)
	addi	%r31, %r31, lo16(l.98)
	lfd	%f6, 0(%r31)
	fcmpu	%cr7, %f4, %f6
	bgt	%cr7, ble_else.119
	lwz	%r2, 8(%r3)
	subi	%r2, %r2, 1
	lfd	%f4, 0(%r3)
	b	iloop.54
ble_else.119:
	li	%r2, 0
	b	min_caml_print_int
xloop.44:
	cmpwi	%cr7, %r2, 400
	blt	%cr7, bge_else.120
	blr
bge_else.120:
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_float_of_int
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	dbl.38
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	lis	%r31, ha16(l.99)
	addi	%r31, %r31, lo16(l.99)
	lfd	%f1, 0(%r31)
	fdiv	%f0, %f0, %f1
	lis	%r31, ha16(l.100)
	addi	%r31, %r31, lo16(l.100)
	lfd	%f1, 0(%r31)
	fsub	%f0, %f0, %f1
	lwz	%r2, 4(%r3)
	stfd	%f0, 8(%r3)
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_float_of_int
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	dbl.38
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lis	%r31, ha16(l.99)
	addi	%r31, %r31, lo16(l.99)
	lfd	%f1, 0(%r31)
	fdiv	%f0, %f0, %f1
	lis	%r31, ha16(l.101)
	addi	%r31, %r31, lo16(l.101)
	lfd	%f1, 0(%r31)
	fsub	%f5, %f0, %f1
	li	%r2, 1000
	lis	%r31, ha16(l.102)
	addi	%r31, %r31, lo16(l.102)
	lfd	%f0, 0(%r31)
	lis	%r31, ha16(l.102)
	addi	%r31, %r31, lo16(l.102)
	lfd	%f1, 0(%r31)
	lis	%r31, ha16(l.102)
	addi	%r31, %r31, lo16(l.102)
	lfd	%f2, 0(%r31)
	lis	%r31, ha16(l.102)
	addi	%r31, %r31, lo16(l.102)
	lfd	%f3, 0(%r31)
	lfd	%f4, 8(%r3)
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	iloop.54
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	b	xloop.44
yloop.40:
	cmpwi	%cr7, %r2, 400
	blt	%cr7, bge_else.122
	blr
bge_else.122:
	li	%r5, 0
	stw	%r2, 0(%r3)
	mflr	%r31
	or	%r28, %r5, %r28	# mr %r28, %r5
	or	%r5, %r2, %r5	# mr %r5, %r2
	or	%r2, %r28, %r2	# mr %r2, %r28
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	xloop.44
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	b	yloop.40
_min_caml_start: # main entry point
	mflr	%r0
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	li	%r2, 0
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	yloop.40
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
#	main program ends
	lwz	%r1, 0(%r1)
	lwz	%r0, 8(%r1)
	mtlr	%r0
	lmw	%r30, -8(%r1)
	blr
