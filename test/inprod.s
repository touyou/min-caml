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
l.75:	 # 6.000000
	.long	0
	.long	1075314688
	.align 3
l.74:	 # 5.000000
	.long	0
	.long	1075052544
	.align 3
l.73:	 # 4.000000
	.long	0
	.long	1074790400
	.align 3
l.68:	 # 3.000000
	.long	0
	.long	1074266112
	.align 3
l.67:	 # 2.000000
	.long	0
	.long	1073741824
	.align 3
l.66:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
l.65:	 # 1000000.000000
	.long	0
	.long	1093567616
	.text
	.globl _min_caml_start
	.align 2
print_int.23:
	out	%r2, 0
	blr
getx.25:
	lfd	%f0, 0(%r2)
	blr
gety.27:
	lfd	%f0, 8(%r2)
	blr
getz.29:
	lfd	%f0, 16(%r2)
	blr
inprod.31:
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	getx.25
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	stfd	%f0, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	getx.25
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
	bl	gety.27
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	stfd	%f0, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	gety.27
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
	bl	getz.29
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	stfd	%f0, 40(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	getz.29
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 40(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 32(%r3)
	fadd	%f0, %f1, %f0
	blr
_min_caml_start: # main entry point
#	main program starts
	addis	%r31, %r0, ha16(l.65)	# lis
	addi	%r31, %r31, lo16(l.65)
	lfd	%f0, 0(%r31)
	addis	%r31, %r0, ha16(l.66)	# lis
	addi	%r31, %r31, lo16(l.66)
	lfd	%f1, 0(%r31)
	addis	%r31, %r0, ha16(l.67)	# lis
	addi	%r31, %r31, lo16(l.67)
	lfd	%f2, 0(%r31)
	addis	%r31, %r0, ha16(l.68)	# lis
	addi	%r31, %r31, lo16(l.68)
	lfd	%f3, 0(%r31)
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 24
	stfd	%f3, 16(%r2)
	stfd	%f2, 8(%r2)
	stfd	%f1, 0(%r2)
	addis	%r31, %r0, ha16(l.73)	# lis
	addi	%r31, %r31, lo16(l.73)
	lfd	%f1, 0(%r31)
	addis	%r31, %r0, ha16(l.74)	# lis
	addi	%r31, %r31, lo16(l.74)
	lfd	%f2, 0(%r31)
	addis	%r31, %r0, ha16(l.75)	# lis
	addi	%r31, %r31, lo16(l.75)
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
	bl	inprod.31
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
	bl	print_int.23
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
