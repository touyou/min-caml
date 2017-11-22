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
l.373:	 # 12.000000
	.long	0
	.long	1076363264
	.align 3
l.370:	 # 11.000000
	.long	0
	.long	1076232192
	.align 3
l.367:	 # 10.000000
	.long	0
	.long	1076101120
	.align 3
l.364:	 # 9.000000
	.long	0
	.long	1075970048
	.align 3
l.361:	 # 8.000000
	.long	0
	.long	1075838976
	.align 3
l.358:	 # 7.000000
	.long	0
	.long	1075576832
	.align 3
l.355:	 # 6.000000
	.long	0
	.long	1075314688
	.align 3
l.352:	 # 5.000000
	.long	0
	.long	1075052544
	.align 3
l.349:	 # 4.000000
	.long	0
	.long	1074790400
	.align 3
l.346:	 # 3.000000
	.long	0
	.long	1074266112
	.align 3
l.343:	 # 2.000000
	.long	0
	.long	1073741824
	.align 3
l.340:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
l.333:	 # 0.000000
	.long	0
	.long	0
	.text
	.globl _min_caml_start
	.align 2
print_int.140:
	out	%r2, 0
	blr
loop3.284:
	lwz	%r5, 20(%r29)
	lwz	%r6, 16(%r29)
	lwz	%r7, 12(%r29)
	lwz	%r8, 8(%r29)
	lwz	%r9, 4(%r29)
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.412
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
bge_else.412:
	blr
loop2.276:
	lwz	%r5, 20(%r29)
	lwz	%r6, 16(%r29)
	lwz	%r7, 12(%r29)
	lwz	%r8, 8(%r29)
	lwz	%r9, 4(%r29)
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.414
	or	%r4, %r10, %r4	# mr %r10, %r4
	addi	%r4, %r4, 24
	addis	%r11, %r0, ha16(loop3.284)	# lis
	addi	%r11, %r11, lo16(loop3.284)
	stw	%r11, 0(%r10)
	stw	%r2, 20(%r10)
	stw	%r6, 16(%r10)
	stw	%r7, 12(%r10)
	stw	%r8, 8(%r10)
	stw	%r9, 4(%r10)
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	stw	%r29, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r10, %r29, %r10	# mr %r29, %r10
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
bge_else.414:
	blr
loop1.271:
	lwz	%r5, 20(%r29)
	lwz	%r6, 16(%r29)
	lwz	%r7, 12(%r29)
	lwz	%r8, 8(%r29)
	lwz	%r9, 4(%r29)
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.416
	or	%r4, %r10, %r4	# mr %r10, %r4
	addi	%r4, %r4, 24
	addis	%r11, %r0, ha16(loop2.276)	# lis
	addi	%r11, %r11, lo16(loop2.276)
	stw	%r11, 0(%r10)
	stw	%r6, 20(%r10)
	stw	%r2, 16(%r10)
	stw	%r7, 12(%r10)
	stw	%r8, 8(%r10)
	stw	%r9, 4(%r10)
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	stw	%r29, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r10, %r29, %r10	# mr %r29, %r10
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
bge_else.416:
	blr
mul.142:
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 24
	addis	%r10, %r0, ha16(loop1.271)	# lis
	addi	%r10, %r10, lo16(loop1.271)
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
init.258:
	lwz	%r5, 8(%r29)
	lwz	%r6, 4(%r29)
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.418
	addis	%r31, %r0, ha16(l.333)	# lis
	addi	%r31, %r31, lo16(l.333)
	lfd	%f0, 0(%r31)
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
bge_else.418:
	blr
make.150:
	lwz	%r6, 4(%r29)
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r5, %r0, ha16(init.258)	# lis
	addi	%r5, %r5, lo16(init.258)
	stw	%r5, 0(%r29)
	lwz	%r5, 4(%r3)
	stw	%r5, 8(%r29)
	stw	%r2, 4(%r29)
	lwz	%r5, 0(%r3)
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	blr
_min_caml_start: # main entry point
#	main program starts
	addi	%r2, %r0, 0	# li
	addis	%r31, %r0, ha16(l.333)	# lis
	addi	%r31, %r31, lo16(l.333)
	lfd	%f0, 0(%r31)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_float_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 8
	addis	%r5, %r0, ha16(make.150)	# lis
	addi	%r5, %r5, lo16(make.150)
	stw	%r5, 0(%r29)
	stw	%r2, 4(%r29)
	addi	%r2, %r0, 2	# li
	addi	%r5, %r0, 3	# li
	stw	%r29, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 3	# li
	addi	%r6, %r0, 2	# li
	lwz	%r29, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 2	# li
	addi	%r6, %r0, 2	# li
	lwz	%r29, 0(%r3)
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	or	%r2, %r9, %r2	# mr %r9, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r7, 4(%r3)
	lwz	%r2, 0(%r7)
	addis	%r31, %r0, ha16(l.340)	# lis
	addi	%r31, %r31, lo16(l.340)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 0(%r7)
	addis	%r31, %r0, ha16(l.343)	# lis
	addi	%r31, %r31, lo16(l.343)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 0(%r7)
	addis	%r31, %r0, ha16(l.346)	# lis
	addi	%r31, %r31, lo16(l.346)
	lfd	%f0, 0(%r31)
	stfd	%f0, 16(%r2)
	lwz	%r2, 4(%r7)
	addis	%r31, %r0, ha16(l.349)	# lis
	addi	%r31, %r31, lo16(l.349)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 4(%r7)
	addis	%r31, %r0, ha16(l.352)	# lis
	addi	%r31, %r31, lo16(l.352)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 4(%r7)
	addis	%r31, %r0, ha16(l.355)	# lis
	addi	%r31, %r31, lo16(l.355)
	lfd	%f0, 0(%r31)
	stfd	%f0, 16(%r2)
	lwz	%r8, 8(%r3)
	lwz	%r2, 0(%r8)
	addis	%r31, %r0, ha16(l.358)	# lis
	addi	%r31, %r31, lo16(l.358)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 0(%r8)
	addis	%r31, %r0, ha16(l.361)	# lis
	addi	%r31, %r31, lo16(l.361)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 4(%r8)
	addis	%r31, %r0, ha16(l.364)	# lis
	addi	%r31, %r31, lo16(l.364)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 4(%r8)
	addis	%r31, %r0, ha16(l.367)	# lis
	addi	%r31, %r31, lo16(l.367)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 8(%r8)
	addis	%r31, %r0, ha16(l.370)	# lis
	addi	%r31, %r31, lo16(l.370)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 8(%r8)
	addis	%r31, %r0, ha16(l.373)	# lis
	addi	%r31, %r31, lo16(l.373)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	addi	%r2, %r0, 2	# li
	addi	%r5, %r0, 3	# li
	addi	%r6, %r0, 2	# li
	stw	%r9, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	mul.142
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
