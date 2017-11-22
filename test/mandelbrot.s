	.globl _start
	.text
_start:
# 0x000000 | code & data seg |
# 0x010000 | stack       seg |
# 0x180000 | heap        seg |
	lis	%r3, 0x0001	# sp
	lis	%r4, 0x0018	# hp
	b	_min_caml_start
#	create_array
	.text
	.align	2
	.globl	min_caml_create_array
min_caml_create_array:
	or  %r2, %r6, %r2  # mr	%r6, %r2
	or  %r4, %r2, %r4  # mr	%r2, %r4
create_array_loop:
	cmpwi	%cr7, %r6, 0
	bc  12, %cr7, create_array_cont  # bne	%cr7, create_array_cont
	b	create_array_exit
create_array_exit:
	blr
create_array_cont:
	stw	  %r5, 0(%r4)
	addi  %r6, %r6, -1  # subi  %r6, %r6, 1
	addi	%r4, %r4, 4
	b	create_array_loop
#	create_float_array
	.globl	min_caml_create_float_array
min_caml_create_float_array:
	or  %r2, %r5, %r2  # mr	%r5, %r2
	or  %r4, %r2, %r4  # mr	%r2, %r4
create_float_array_loop:
	cmpwi	%cr7, %r5, 0
	bc  12, %cr7, create_float_array_cont # bne	%cr7, create_float_array_cont
	blr
create_float_array_cont:
	stfd	%f0, 0(%r4)
	addi  %r5, %r5, -1  # subi	%r5, %r5, 1
	addi	%r4, %r4, 8
	b	create_float_array_loop
	.data
	.literal8
	.align 3
l.104:	 # 0.000000
	.long	0
	.long	0
	.align 3
l.103:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
l.102:	 # 1.500000
	.long	0
	.long	1073217536
	.align 3
l.101:	 # 400.000000
	.long	0
	.long	1081671680
	.align 3
l.100:	 # 4.000000
	.long	0
	.long	1074790400
	.text
	.globl _min_caml_start
	.align 2
print_int.38:
	out	%r2, 0
	blr
dbl.40:
	fadd	%f0, %f0, %f0
	blr
iloop.56:
	cmpwi	%cr7, %r2, 0
	bc	12, %cr7, beq_else.121
	addi	%r2, %r0, 1	# li
	b	print_int.38
beq_else.121:
	fsub	%f2, %f2, %f3
	fadd	%f2, %f2, %f4
	stfd	%f4, 0(%r3)
	stw	%r2, 8(%r3)
	stfd	%f2, 16(%r3)
	stfd	%f5, 24(%r3)
	stfd	%f1, 32(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	dbl.40
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 32(%r3)
	fmul	%f0, %f0, %f1
	lfd	%f5, 24(%r3)
	fadd	%f1, %f0, %f5
	lfd	%f0, 16(%r3)
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f4, %f2, %f3
	addis	%r31, %r0, ha16(l.100)	# lis
	addi	%r31, %r31, lo16(l.100)
	lfd	%f6, 0(%r31)
	fcmpu	%cr7, %f4, %f6
	bc	4, %cr7, ble_else.123
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lfd	%f4, 0(%r3)
	b	iloop.56
ble_else.123:
	addi	%r2, %r0, 0	# li
	b	print_int.38
xloop.46:
	cmpwi	%cr7, %r2, 400
	bc	8, %cr7, bge_else.124
	blr
bge_else.124:
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
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
	bl	dbl.40
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, ha16(l.101)	# lis
	addi	%r31, %r31, lo16(l.101)
	lfd	%f1, 0(%r31)
	fdiv	%f0, %f0, %f1
	addis	%r31, %r0, ha16(l.102)	# lis
	addi	%r31, %r31, lo16(l.102)
	lfd	%f1, 0(%r31)
	fsub	%f0, %f0, %f1
	lwz	%r2, 4(%r3)
	stfd	%f0, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_float_of_int
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	dbl.40
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, ha16(l.101)	# lis
	addi	%r31, %r31, lo16(l.101)
	lfd	%f1, 0(%r31)
	fdiv	%f0, %f0, %f1
	addis	%r31, %r0, ha16(l.103)	# lis
	addi	%r31, %r31, lo16(l.103)
	lfd	%f1, 0(%r31)
	fsub	%f5, %f0, %f1
	addi	%r2, %r0, 1000	# li
	addis	%r31, %r0, ha16(l.104)	# lis
	addi	%r31, %r31, lo16(l.104)
	lfd	%f0, 0(%r31)
	addis	%r31, %r0, ha16(l.104)	# lis
	addi	%r31, %r31, lo16(l.104)
	lfd	%f1, 0(%r31)
	addis	%r31, %r0, ha16(l.104)	# lis
	addi	%r31, %r31, lo16(l.104)
	lfd	%f2, 0(%r31)
	addis	%r31, %r0, ha16(l.104)	# lis
	addi	%r31, %r31, lo16(l.104)
	lfd	%f3, 0(%r31)
	lfd	%f4, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	iloop.56
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	b	xloop.46
yloop.42:
	cmpwi	%cr7, %r2, 400
	bc	8, %cr7, bge_else.126
	blr
bge_else.126:
	addi	%r5, %r0, 0	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r28, %r5	# mr %r28, %r5
	or	%r2, %r5, %r2	# mr %r5, %r2
	or	%r28, %r2, %r28	# mr %r2, %r28
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	xloop.46
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	b	yloop.42
_min_caml_start: # main entry point
#	main program starts
	addi	%r2, %r0, 0	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	yloop.42
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
