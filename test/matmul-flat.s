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
l.366:	 # 12.000000
	.long	0
	.long	1076363264
	.align 3
l.363:	 # 11.000000
	.long	0
	.long	1076232192
	.align 3
l.360:	 # 10.000000
	.long	0
	.long	1076101120
	.align 3
l.357:	 # 9.000000
	.long	0
	.long	1075970048
	.align 3
l.354:	 # 8.000000
	.long	0
	.long	1075838976
	.align 3
l.351:	 # 7.000000
	.long	0
	.long	1075576832
	.align 3
l.348:	 # 6.000000
	.long	0
	.long	1075314688
	.align 3
l.345:	 # 5.000000
	.long	0
	.long	1075052544
	.align 3
l.342:	 # 4.000000
	.long	0
	.long	1074790400
	.align 3
l.339:	 # 3.000000
	.long	0
	.long	1074266112
	.align 3
l.336:	 # 2.000000
	.long	0
	.long	1073741824
	.align 3
l.333:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
l.330:	 # 0.000000
	.long	0
	.long	0
	.text
	.globl _min_caml_start
	.align 2
print_int.140:
	out	%r2, 0
	blr
loop3.142:
	cmpwi	%cr7, %r5, 0
	bc	8, %cr7, bge_else.410
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
	b	loop3.142
bge_else.410:
	blr
loop2.149:
	cmpwi	%cr7, %r6, 0
	bc	8, %cr7, bge_else.412
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
	bl	loop3.142
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
	b	loop2.149
bge_else.412:
	blr
loop1.156:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.414
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
	bl	loop2.149
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
	b	loop1.156
bge_else.414:
	blr
mul.163:
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	b	loop1.156
init.171:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.416
	addis	%r31, %r0, ha16(l.330)	# lis
	addi	%r31, %r31, lo16(l.330)
	lfd	%f0, 0(%r31)
	stw	%r5, 0(%r3)
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
	lwz	%r5, 0(%r3)
	or	%r7, %r6, %r7	# mr %r6, %r7
	b	init.171
bge_else.416:
	blr
make.175:
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	or	%r2, %r6, %r2	# mr %r6, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lwz	%r5, 0(%r3)
	stw	%r6, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	init.171
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	blr
_min_caml_start: # main entry point
#	main program starts
	addi	%r2, %r0, 0	# li
	addis	%r31, %r0, ha16(l.330)	# lis
	addi	%r31, %r31, lo16(l.330)
	lfd	%f0, 0(%r31)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_float_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	or	%r2, %r6, %r2	# mr %r6, %r2
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 2	# li
	addi	%r5, %r0, 3	# li
	stw	%r6, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	make.175
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 3	# li
	addi	%r6, %r0, 2	# li
	lwz	%r7, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r6, %r5, %r6	# mr %r5, %r6
	or	%r7, %r6, %r7	# mr %r6, %r7
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	make.175
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 2	# li
	addi	%r6, %r0, 2	# li
	lwz	%r7, 0(%r3)
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r6, %r5, %r6	# mr %r5, %r6
	or	%r7, %r6, %r7	# mr %r6, %r7
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	make.175
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	or	%r2, %r9, %r2	# mr %r9, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r7, 4(%r3)
	lwz	%r2, 0(%r7)
	addis	%r31, %r0, ha16(l.333)	# lis
	addi	%r31, %r31, lo16(l.333)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 0(%r7)
	addis	%r31, %r0, ha16(l.336)	# lis
	addi	%r31, %r31, lo16(l.336)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 0(%r7)
	addis	%r31, %r0, ha16(l.339)	# lis
	addi	%r31, %r31, lo16(l.339)
	lfd	%f0, 0(%r31)
	stfd	%f0, 16(%r2)
	lwz	%r2, 4(%r7)
	addis	%r31, %r0, ha16(l.342)	# lis
	addi	%r31, %r31, lo16(l.342)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 4(%r7)
	addis	%r31, %r0, ha16(l.345)	# lis
	addi	%r31, %r31, lo16(l.345)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 4(%r7)
	addis	%r31, %r0, ha16(l.348)	# lis
	addi	%r31, %r31, lo16(l.348)
	lfd	%f0, 0(%r31)
	stfd	%f0, 16(%r2)
	lwz	%r8, 8(%r3)
	lwz	%r2, 0(%r8)
	addis	%r31, %r0, ha16(l.351)	# lis
	addi	%r31, %r31, lo16(l.351)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 0(%r8)
	addis	%r31, %r0, ha16(l.354)	# lis
	addi	%r31, %r31, lo16(l.354)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 4(%r8)
	addis	%r31, %r0, ha16(l.357)	# lis
	addi	%r31, %r31, lo16(l.357)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 4(%r8)
	addis	%r31, %r0, ha16(l.360)	# lis
	addi	%r31, %r31, lo16(l.360)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 8(%r8)
	addis	%r31, %r0, ha16(l.363)	# lis
	addi	%r31, %r31, lo16(l.363)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 8(%r8)
	addis	%r31, %r0, ha16(l.366)	# lis
	addi	%r31, %r31, lo16(l.366)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	addi	%r2, %r0, 2	# li
	addi	%r5, %r0, 3	# li
	addi	%r6, %r0, 2	# li
	stw	%r9, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	mul.163
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	lwz	%r5, 0(%r2)
	lfd	%f0, 0(%r5)
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
	bl	print_int.140
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_print_newline
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	lwz	%r5, 0(%r2)
	lfd	%f0, 8(%r5)
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
	bl	print_int.140
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_print_newline
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	lwz	%r5, 4(%r2)
	lfd	%f0, 0(%r5)
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
	bl	print_int.140
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_print_newline
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	lwz	%r2, 4(%r2)
	lfd	%f0, 8(%r2)
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
	bl	print_int.140
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_print_newline
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
