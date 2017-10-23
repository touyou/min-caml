	.data
	.literal8
	.align 3
l.375:	 # 12.000000
	.long	0
	.long	1076363264
	.align 3
l.372:	 # 11.000000
	.long	0
	.long	1076232192
	.align 3
l.369:	 # 10.000000
	.long	0
	.long	1076101120
	.align 3
l.366:	 # 9.000000
	.long	0
	.long	1075970048
	.align 3
l.363:	 # 8.000000
	.long	0
	.long	1075838976
	.align 3
l.360:	 # 7.000000
	.long	0
	.long	1075576832
	.align 3
l.357:	 # 6.000000
	.long	0
	.long	1075314688
	.align 3
l.354:	 # 5.000000
	.long	0
	.long	1075052544
	.align 3
l.351:	 # 4.000000
	.long	0
	.long	1074790400
	.align 3
l.348:	 # 3.000000
	.long	0
	.long	1074266112
	.align 3
l.345:	 # 2.000000
	.long	0
	.long	1073741824
	.align 3
l.342:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
l.340:	 # 0.000000
	.long	0
	.long	0
	.text
	.globl _min_caml_start
	.align 2
loop3.282:
	lwz	%r5, 24(%r29)
	lwz	%r6, 20(%r29)
	lwz	%r7, 16(%r29)
	lwz	%r8, 12(%r29)
	lwz	%r9, 8(%r29)
	lwz	%r10, 4(%r29)
	cmp	%cr7, 0, %r10, %r2	# cmpw
	bc	0100, %cr7, ble_else.423
	slwi	%r10, %r6, 2
	lwzx	%r10, %r7, %r10
	slwi	%r11, %r6, 2
	lwzx	%r7, %r7, %r11
	slwi	%r11, %r5, 3
	lfdx	%f0, %r7, %r11
	slwi	%r6, %r6, 2
	lwzx	%r6, %r9, %r6
	slwi	%r7, %r2, 3
	lfdx	%f1, %r6, %r7
	slwi	%r6, %r2, 2
	lwzx	%r6, %r8, %r6
	slwi	%r7, %r5, 3
	lfdx	%f2, %r6, %r7
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	slwi	%r5, %r5, 3
	stfdx	%f0, %r10, %r5
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
ble_else.423:
	bclr	20, %cr0	# blr
loop2.274:
	lwz	%r5, 24(%r29)
	lwz	%r6, 20(%r29)
	lwz	%r7, 16(%r29)
	lwz	%r8, 12(%r29)
	lwz	%r9, 8(%r29)
	lwz	%r10, 4(%r29)
	cmp	%cr7, 0, %r10, %r2	# cmpw
	bc	0100, %cr7, ble_else.425
	or	%r4, %r11, %r4	# mr %r11, %r4
	addi	%r4, %r4, 32
	addis	%r12, %r0, ha16(loop3.282)	# lis
	addi	%r12, %r12, lo16(loop3.282)
	stw	%r12, 0(%r11)
	stw	%r2, 24(%r11)
	stw	%r6, 20(%r11)
	stw	%r7, 16(%r11)
	stw	%r8, 12(%r11)
	stw	%r9, 8(%r11)
	stw	%r10, 4(%r11)
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	stw	%r29, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r11, %r29, %r11	# mr %r29, %r11
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
ble_else.425:
	bclr	20, %cr0	# blr
loop1.269:
	lwz	%r5, 20(%r29)
	lwz	%r6, 16(%r29)
	lwz	%r7, 12(%r29)
	lwz	%r8, 8(%r29)
	lwz	%r9, 4(%r29)
	addi	%r10, %r0, 0	# li
	cmp	%cr7, 0, %r2, 0	# cmpwi
	bc	1000, %cr7, bge_else.427
	or	%r4, %r11, %r4	# mr %r11, %r4
	addi	%r4, %r4, 32
	addis	%r12, %r0, ha16(loop2.274)	# lis
	addi	%r12, %r12, lo16(loop2.274)
	stw	%r12, 0(%r11)
	stw	%r6, 24(%r11)
	stw	%r2, 20(%r11)
	stw	%r7, 16(%r11)
	stw	%r8, 12(%r11)
	stw	%r9, 8(%r11)
	stw	%r10, 4(%r11)
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	stw	%r29, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r11, %r29, %r11	# mr %r29, %r11
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
bge_else.427:
	bclr	20, %cr0	# blr
mul.140:
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 24
	addis	%r10, %r0, ha16(loop1.269)	# lis
	addi	%r10, %r10, lo16(loop1.269)
	stw	%r10, 0(%r29)
	stw	%r6, 20(%r29)
	stw	%r5, 16(%r29)
	stw	%r9, 12(%r29)
	stw	%r8, 8(%r29)
	stw	%r7, 4(%r29)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
init.256:
	lwz	%r5, 24(%r29)
	lwz	%r6, 20(%r29)
	lwz	%r7, 16(%r29)
	lfd	%f0, 8(%r29)
	cmp	%cr7, 0, %r7, %r2	# cmpw
	bc	0100, %cr7, ble_else.429
	stw	%r29, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_float_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 8(%r3)
	slwi	%r6, %r5, 2
	lwz	%r7, 4(%r3)
	stwx	%r2, %r7, %r6
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
ble_else.429:
	bclr	20, %cr0	# blr
make.148:
	lwz	%r6, 20(%r29)
	lwz	%r7, 16(%r29)
	lfd	%f0, 8(%r29)
	stw	%r2, 0(%r3)
	stfd	%f0, 8(%r3)
	stw	%r7, 16(%r3)
	stw	%r5, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 32
	addis	%r5, %r0, ha16(init.256)	# lis
	addi	%r5, %r5, lo16(init.256)
	stw	%r5, 0(%r29)
	lwz	%r5, 20(%r3)
	stw	%r5, 24(%r29)
	stw	%r2, 20(%r29)
	lwz	%r5, 16(%r3)
	stw	%r5, 16(%r29)
	lfd	%f0, 8(%r3)
	stfd	%f0, 8(%r29)
	lwz	%r5, 0(%r3)
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	stw	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	addi	%r2, %r0, 0	# li
	addis	%r31, %r0, ha16(l.340)	# lis
	addi	%r31, %r31, lo16(l.340)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r3)
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_float_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 24
	addis	%r5, %r0, ha16(make.148)	# lis
	addi	%r5, %r5, lo16(make.148)
	stw	%r5, 0(%r29)
	stw	%r2, 20(%r29)
	lwz	%r2, 8(%r3)
	stw	%r2, 16(%r29)
	lfd	%f0, 0(%r3)
	stfd	%f0, 8(%r29)
	addi	%r2, %r0, 2	# li
	addi	%r5, %r0, 3	# li
	stw	%r2, 12(%r3)
	stw	%r5, 16(%r3)
	stw	%r29, 20(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 16(%r3)
	lwz	%r6, 12(%r3)
	lwz	%r29, 20(%r3)
	stw	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 12(%r3)
	lwz	%r29, 20(%r3)
	stw	%r2, 28(%r3)
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
	lwz	%r7, 24(%r3)
	lwz	%r2, 0(%r7)
	addis	%r31, %r0, ha16(l.342)	# lis
	addi	%r31, %r31, lo16(l.342)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 0(%r7)
	addis	%r31, %r0, ha16(l.345)	# lis
	addi	%r31, %r31, lo16(l.345)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 0(%r7)
	addis	%r31, %r0, ha16(l.348)	# lis
	addi	%r31, %r31, lo16(l.348)
	lfd	%f0, 0(%r31)
	stfd	%f0, 16(%r2)
	lwz	%r2, 4(%r7)
	addis	%r31, %r0, ha16(l.351)	# lis
	addi	%r31, %r31, lo16(l.351)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 4(%r7)
	addis	%r31, %r0, ha16(l.354)	# lis
	addi	%r31, %r31, lo16(l.354)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 4(%r7)
	addis	%r31, %r0, ha16(l.357)	# lis
	addi	%r31, %r31, lo16(l.357)
	lfd	%f0, 0(%r31)
	stfd	%f0, 16(%r2)
	lwz	%r8, 28(%r3)
	lwz	%r2, 0(%r8)
	addis	%r31, %r0, ha16(l.360)	# lis
	addi	%r31, %r31, lo16(l.360)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 0(%r8)
	addis	%r31, %r0, ha16(l.363)	# lis
	addi	%r31, %r31, lo16(l.363)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 4(%r8)
	addis	%r31, %r0, ha16(l.366)	# lis
	addi	%r31, %r31, lo16(l.366)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 4(%r8)
	addis	%r31, %r0, ha16(l.369)	# lis
	addi	%r31, %r31, lo16(l.369)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 8(%r8)
	addis	%r31, %r0, ha16(l.372)	# lis
	addi	%r31, %r31, lo16(l.372)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 8(%r8)
	addis	%r31, %r0, ha16(l.375)	# lis
	addi	%r31, %r31, lo16(l.375)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 12(%r3)
	lwz	%r5, 16(%r3)
	stw	%r9, 32(%r3)
	mfspr	%r31, 8	# mflr
	or	%r2, %r6, %r2	# mr %r6, %r2
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	mul.140
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 32(%r3)
	lwz	%r5, 0(%r2)
	lfd	%f0, 0(%r5)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_truncate
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_print_int
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_print_newline
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 32(%r3)
	lwz	%r5, 0(%r2)
	lfd	%f0, 8(%r5)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_truncate
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_print_int
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_print_newline
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 32(%r3)
	lwz	%r5, 4(%r2)
	lfd	%f0, 0(%r5)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_truncate
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_print_int
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_print_newline
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 32(%r3)
	lwz	%r2, 4(%r2)
	lfd	%f0, 8(%r2)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_truncate
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_print_int
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_print_newline
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	lwz	%r1, 0(%r1)
	lwz	%r0, 8(%r1)
	mtspr	8, %r0	# mtlr
	lmw	%r30, -8(%r1)
	bclr	20, %cr0	# blr
