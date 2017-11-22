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
	cmpi  %cr7, 0, %r6, 0 # cmpwi	%cr7, %r6, 0
	bc  12, %cr7, create_array_cont  # bne	%cr7, create_array_cont
	b	create_array_exit
create_array_exit:
	bclr  20, %cr0     # blr
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
	cmpi  %cr7, 0, %r5, 0  # cmpwi	%cr7, %r5, 0
	bc  12, %cr7, create_float_array_cont # bne	%cr7, create_float_array_cont
	bclr  20, %cr0     # blr
create_float_array_cont:
	stfd	%f0, 0(%r4)
	addi  %r5, %r5, -1  # subi	%r5, %r5, 1
	addi	%r4, %r4, 8
	b	create_float_array_loop
	.data
	.literal8
	.align 3
l.49:	 # 0.000000
	.long	0
	.long	0
	.align 3
l.48:	 # 1000000.000000
	.long	0
	.long	1093567616
	.align 3
l.47:	 # 4.560000
	.long	-1546188227
	.long	1074937200
	.align 3
l.46:	 # 1.230000
	.long	2061584302
	.long	1072934420
	.text
	.globl _min_caml_start
	.align 2
print_int.18:
	out	%r2, 0
	bclr	20, %cr0	# blr
inprod.20:
	cmpi	%cr7, 0, %r6, 0	# cmpwi
	bc	8, %cr7, bge_else.55
	slwi	%r7, %r6, 3
	lfdx	%f1, %r2, %r7
	slwi	%r7, %r6, 3
	lfdx	%f2, %r5, %r7
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%r6, %r6, -1	# subi %r6, %r6, 1
	b	inprod.20
bge_else.55:
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
#	main program starts
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, ha16(l.46)	# lis
	addi	%r31, %r31, lo16(l.46)
	lfd	%f0, 0(%r31)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_float_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, ha16(l.47)	# lis
	addi	%r31, %r31, lo16(l.47)
	lfd	%f0, 0(%r31)
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_float_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, ha16(l.48)	# lis
	addi	%r31, %r31, lo16(l.48)
	lfd	%f0, 0(%r31)
	addis	%r31, %r0, ha16(l.49)	# lis
	addi	%r31, %r31, lo16(l.49)
	lfd	%f1, 0(%r31)
	addi	%r6, %r0, 2	# li
	lwz	%r2, 0(%r3)
	stfd	%f0, 8(%r3)
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	inprod.20
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 8(%r3)
	fmul	%f0, %f1, %f0
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
	bl	print_int.18
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
