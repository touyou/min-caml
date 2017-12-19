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
l.724:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
l.723:	 # 1.500000
	.long	0
	.long	1073217536
	.align 3
l.722:	 # 400.000000
	.long	0
	.long	1081671680
	.align 3
l.721:	 # 4.000000
	.long	0
	.long	1074790400
	.align 3
l.720:	 # 0.000000
	.long	0
	.long	0
	.text
	.globl _min_caml_start
	.align 2
search_top.491:
	cmpwi	%cr7, %r2, 1
	bc	12, %cr7, beq_else.738
	addi	%r2, %r0, 0	# li
	blr
beq_else.738:
	srwi	%r2, %r2, 1
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	search_top.491
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r2, 1
	blr
float_of_int.347:
	cmpwi	%cr7, %r2, 0
	bc	12, %cr7, beq_else.739
	addis	%r31, %r0, ha16(l.720)	# lis
	addi	%r31, %r31, lo16(l.720)
	lfd	%f0, 0(%r31)
	blr
beq_else.739:
	cmpwi	%cr7, %r2, 0	
	bc	4, %cr7, ble_else.740
	addi	%r5, %r0, 1	# li
	b	ble_cont.741
ble_else.740:
	addi	%r5, %r0, 0	# li
ble_cont.741:
	cmpwi	%cr7, %r2, 0	
	bc	4, %cr7, ble_else.742
	neg	%r2, %r2
	b	ble_cont.743
ble_else.742:
ble_cont.743:
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	search_top.491
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 23
	bc	4, %cr7, ble_else.744
	lwz	%r5, 4(%r3)
	slwi	%r5, %r5, 31
	addi	%r6, %r2, 127
	slwi	%r6, %r6, 23
	add	%r5, %r5, %r6
	addi	%r6, %r0, 1	# li
	slw	%r6, %r6, %r2
	lwz	%r7, 0(%r3)
	xor	%r6, %r7, %r6
	addi	%r7, %r0, 23	# li
	subf	%r2, %r2, %r7	# sub	%r2, %r7, %r2
	slw	%r2, %r6, %r2
	add	%f0, %r5, %r2
	blr
ble_else.744:
	lwz	%r5, 4(%r3)
	slwi	%r5, %r5, 31
	addi	%r6, %r2, 127
	slwi	%r6, %r6, 23
	add	%r5, %r5, %r6
	addi	%r6, %r0, 1	# li
	slw	%r6, %r6, %r2
	lwz	%r7, 0(%r3)
	xor	%r6, %r7, %r6
	addi	%r2, %r2, -23	# subi %r2, %r2, 23
	srw	%r2, %r6, %r2
	add	%f0, %r5, %r2
	blr
print_int.373:
	out	%r2, 0
	blr
dbl.375:
	fadd	%f0, %f0, %f0
	blr
iloop.384:
	cmpwi	%cr7, %r2, 0
	bc	12, %cr7, beq_else.746
	addi	%r2, %r0, 1	# li
	b	print_int.373
beq_else.746:
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
	bl	dbl.375
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
	addis	%r31, %r0, ha16(l.721)	# lis
	addi	%r31, %r31, lo16(l.721)
	lfd	%f6, 0(%r31)
	fcmpu	%cr7, %f4, %f6
	bc	4, %cr7, ble_else.748
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lfd	%f4, 0(%r3)
	b	iloop.384
ble_else.748:
	addi	%r2, %r0, 0	# li
	b	print_int.373
test.377:
	stw	%r5, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	float_of_int.347
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	dbl.375
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, ha16(l.722)	# lis
	addi	%r31, %r31, lo16(l.722)
	lfd	%f1, 0(%r31)
	fdiv	%f0, %f0, %f1
	addis	%r31, %r0, ha16(l.723)	# lis
	addi	%r31, %r31, lo16(l.723)
	lfd	%f1, 0(%r31)
	fsub	%f0, %f0, %f1
	lwz	%r2, 0(%r3)
	stfd	%f0, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	float_of_int.347
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	dbl.375
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, ha16(l.722)	# lis
	addi	%r31, %r31, lo16(l.722)
	lfd	%f1, 0(%r31)
	fdiv	%f0, %f0, %f1
	addis	%r31, %r0, ha16(l.724)	# lis
	addi	%r31, %r31, lo16(l.724)
	lfd	%f1, 0(%r31)
	fsub	%f5, %f0, %f1
	addi	%r2, %r0, 1000	# li
	addis	%r31, %r0, ha16(l.720)	# lis
	addi	%r31, %r31, lo16(l.720)
	lfd	%f0, 0(%r31)
	addis	%r31, %r0, ha16(l.720)	# lis
	addi	%r31, %r31, lo16(l.720)
	lfd	%f1, 0(%r31)
	addis	%r31, %r0, ha16(l.720)	# lis
	addi	%r31, %r31, lo16(l.720)
	lfd	%f2, 0(%r31)
	addis	%r31, %r0, ha16(l.720)	# lis
	addi	%r31, %r31, lo16(l.720)
	lfd	%f3, 0(%r31)
	lfd	%f4, 8(%r3)
	b	iloop.384
_min_caml_start: # main entry point
#	main program starts
	addi	%r2, %r0, 200	# li
	addi	%r5, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	test.377
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
