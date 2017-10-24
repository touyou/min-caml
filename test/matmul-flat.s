	.data
	.literal8
	.align 3
l.364:	 # 12.000000
	.long	0
	.long	1076363264
	.align 3
l.361:	 # 11.000000
	.long	0
	.long	1076232192
	.align 3
l.358:	 # 10.000000
	.long	0
	.long	1076101120
	.align 3
l.355:	 # 9.000000
	.long	0
	.long	1075970048
	.align 3
l.352:	 # 8.000000
	.long	0
	.long	1075838976
	.align 3
l.349:	 # 7.000000
	.long	0
	.long	1075576832
	.align 3
l.346:	 # 6.000000
	.long	0
	.long	1075314688
	.align 3
l.343:	 # 5.000000
	.long	0
	.long	1075052544
	.align 3
l.340:	 # 4.000000
	.long	0
	.long	1074790400
	.align 3
l.337:	 # 3.000000
	.long	0
	.long	1074266112
	.align 3
l.334:	 # 2.000000
	.long	0
	.long	1073741824
	.align 3
l.331:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
l.329:	 # 0.000000
	.long	0
	.long	0
	.text
	.globl _min_caml_start
	.align 2
loop3.140:
	cmpi	%cr7, 0, %r5, 0	# cmpwi
	bc	8, %cr7, bge_else.424
	slwi	%r10, %r2, 2
	lwzx	%r10, %r9, %r10
	slwi	%r11, %r2, 2
	lwzx	%r11, %r9, %r11
	slwi	%r12, %r6, 3
	lfdx	%f0, %r11, %r12
	slwi	%r11, %r2, 2
	lwzx	%r11, %r7, %r11
	slwi	%r12, %r5, 3
	lfdx	%f1, %r11, %r12
	slwi	%r11, %r5, 2
	lwzx	%r11, %r8, %r11
	slwi	%r12, %r6, 3
	lfdx	%f2, %r11, %r12
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	slwi	%r11, %r6, 3
	stfdx	%f0, %r10, %r11
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	b	loop3.140
bge_else.424:
	bclr	20, %cr0	# blr
loop2.147:
	cmpi	%cr7, 0, %r6, 0	# cmpwi
	bc	8, %cr7, bge_else.426
	addi	%r10, %r5, -1	# subi %r10, %r5, 1
	stw	%r9, 0(%r3)
	stw	%r8, 4(%r3)
	stw	%r7, 8(%r3)
	stw	%r5, 12(%r3)
	stw	%r2, 16(%r3)
	stw	%r6, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r10, %r5, %r10	# mr %r5, %r10
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	loop3.140
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 20(%r3)
	addi	%r6, %r2, -1	# subi %r6, %r2, 1
	lwz	%r2, 16(%r3)
	lwz	%r5, 12(%r3)
	lwz	%r7, 8(%r3)
	lwz	%r8, 4(%r3)
	lwz	%r9, 0(%r3)
	b	loop2.147
bge_else.426:
	bclr	20, %cr0	# blr
loop1.154:
	cmpi	%cr7, 0, %r2, 0	# cmpwi
	bc	8, %cr7, bge_else.428
	addi	%r10, %r6, -1	# subi %r10, %r6, 1
	stw	%r9, 0(%r3)
	stw	%r8, 4(%r3)
	stw	%r7, 8(%r3)
	stw	%r6, 12(%r3)
	stw	%r5, 16(%r3)
	stw	%r2, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r10, %r6, %r10	# mr %r6, %r10
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	loop2.147
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 20(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lwz	%r5, 16(%r3)
	lwz	%r6, 12(%r3)
	lwz	%r7, 8(%r3)
	lwz	%r8, 4(%r3)
	lwz	%r9, 0(%r3)
	b	loop1.154
bge_else.428:
	bclr	20, %cr0	# blr
mul.161:
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	b	loop1.154
init.169:
	lwz	%r7, 16(%r29)
	lfd	%f0, 8(%r29)
	cmp	%cr7, 0, %r7, %r2	# cmpw
	bc	4, %cr7, ble_else.430
	stw	%r5, 0(%r3)
	stw	%r29, 4(%r3)
	stw	%r6, 8(%r3)
	stw	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_create_float_array
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 12(%r3)
	slwi	%r6, %r5, 2
	lwz	%r7, 8(%r3)
	stwx	%r2, %r7, %r6
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	lwz	%r5, 0(%r3)
	lwz	%r29, 4(%r3)
	or	%r7, %r6, %r7	# mr %r6, %r7
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
ble_else.430:
	bclr	20, %cr0	# blr
make.173:
	lwz	%r7, 4(%r29)
	stw	%r5, 0(%r3)
	stw	%r7, 4(%r3)
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	or	%r2, %r6, %r2	# mr %r6, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lwz	%r5, 0(%r3)
	lwz	%r29, 4(%r3)
	stw	%r6, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	addi	%r2, %r0, 0	# li
	addis	%r31, %r0, ha16(l.329)	# lis
	addi	%r31, %r31, lo16(l.329)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r3)
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_float_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	or	%r2, %r6, %r2	# mr %r6, %r2
	mtspr	8, %r31	# mtlr
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 24
	addis	%r5, %r0, ha16(init.169)	# lis
	addi	%r5, %r5, lo16(init.169)
	stw	%r5, 0(%r2)
	lwz	%r5, 8(%r3)
	stw	%r5, 16(%r2)
	lfd	%f0, 0(%r3)
	stfd	%f0, 8(%r2)
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 8
	addis	%r5, %r0, ha16(make.173)	# lis
	addi	%r5, %r5, lo16(make.173)
	stw	%r5, 0(%r29)
	stw	%r2, 4(%r29)
	addi	%r2, %r0, 2	# li
	addi	%r5, %r0, 3	# li
	stw	%r6, 12(%r3)
	stw	%r2, 16(%r3)
	stw	%r5, 20(%r3)
	stw	%r29, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 20(%r3)
	lwz	%r6, 16(%r3)
	lwz	%r7, 12(%r3)
	lwz	%r29, 24(%r3)
	stw	%r2, 28(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r6, %r5, %r6	# mr %r5, %r6
	or	%r7, %r6, %r7	# mr %r6, %r7
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 16(%r3)
	lwz	%r6, 12(%r3)
	lwz	%r29, 24(%r3)
	stw	%r2, 32(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	or	%r2, %r9, %r2	# mr %r9, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r7, 28(%r3)
	lwz	%r2, 0(%r7)
	addis	%r31, %r0, ha16(l.331)	# lis
	addi	%r31, %r31, lo16(l.331)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 0(%r7)
	addis	%r31, %r0, ha16(l.334)	# lis
	addi	%r31, %r31, lo16(l.334)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 0(%r7)
	addis	%r31, %r0, ha16(l.337)	# lis
	addi	%r31, %r31, lo16(l.337)
	lfd	%f0, 0(%r31)
	stfd	%f0, 16(%r2)
	lwz	%r2, 4(%r7)
	addis	%r31, %r0, ha16(l.340)	# lis
	addi	%r31, %r31, lo16(l.340)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 4(%r7)
	addis	%r31, %r0, ha16(l.343)	# lis
	addi	%r31, %r31, lo16(l.343)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 4(%r7)
	addis	%r31, %r0, ha16(l.346)	# lis
	addi	%r31, %r31, lo16(l.346)
	lfd	%f0, 0(%r31)
	stfd	%f0, 16(%r2)
	lwz	%r8, 32(%r3)
	lwz	%r2, 0(%r8)
	addis	%r31, %r0, ha16(l.349)	# lis
	addi	%r31, %r31, lo16(l.349)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 0(%r8)
	addis	%r31, %r0, ha16(l.352)	# lis
	addi	%r31, %r31, lo16(l.352)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 4(%r8)
	addis	%r31, %r0, ha16(l.355)	# lis
	addi	%r31, %r31, lo16(l.355)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 4(%r8)
	addis	%r31, %r0, ha16(l.358)	# lis
	addi	%r31, %r31, lo16(l.358)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 8(%r8)
	addis	%r31, %r0, ha16(l.361)	# lis
	addi	%r31, %r31, lo16(l.361)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 8(%r8)
	addis	%r31, %r0, ha16(l.364)	# lis
	addi	%r31, %r31, lo16(l.364)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 16(%r3)
	lwz	%r5, 20(%r3)
	stw	%r9, 36(%r3)
	mfspr	%r31, 8	# mflr
	or	%r2, %r6, %r2	# mr %r6, %r2
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	mul.161
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 36(%r3)
	lwz	%r5, 0(%r2)
	lfd	%f0, 0(%r5)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_truncate
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_print_int
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_print_newline
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 36(%r3)
	lwz	%r5, 0(%r2)
	lfd	%f0, 8(%r5)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_truncate
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_print_int
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_print_newline
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 36(%r3)
	lwz	%r5, 4(%r2)
	lfd	%f0, 0(%r5)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_truncate
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_print_int
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_print_newline
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 36(%r3)
	lwz	%r2, 4(%r2)
	lfd	%f0, 8(%r2)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_truncate
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_print_int
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_print_newline
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	lwz	%r1, 0(%r1)
	lwz	%r0, 8(%r1)
	mtspr	8, %r0	# mtlr
	lmw	%r30, -8(%r1)
	bclr	20, %cr0	# blr
