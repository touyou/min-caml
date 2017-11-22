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
l.35:	 # 2.000000
	.long	0
	.long	1073741824
	.align 3
l.34:	 # 10.000000
	.long	0
	.long	1076101120
	.align 3
l.30:	 # 0.000000
	.long	0
	.long	0
	.text
	.globl _min_caml_start
	.align 2
testf.12:
	fadd	%f2, %f0, %f1
	fadd	%f1, %f0, %f1
	addi	%r5, %r0, 4	# li
	addis	%r31, %r0, ha16(l.30)	# lis
	addi	%r31, %r31, lo16(l.30)
	lfd	%f3, 0(%r31)
	stfd	%f1, 0(%r3)
	stfd	%f2, 8(%r3)
	stfd	%f0, 16(%r3)
	stw	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	fmr	%f0, %f3
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_float_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 24(%r3)
	slwi	%r6, %r5, 3
	lfdx	%f0, %r2, %r6
	slwi	%r6, %r5, 3
	lfd	%f1, 16(%r3)
	stfdx	%f1, %r2, %r6
	slwi	%r5, %r5, 3
	lfdx	%f1, %r2, %r5
	lfd	%f2, 0(%r3)
	lfd	%f3, 8(%r3)
	fadd	%f2, %f3, %f2
	fadd	%f0, %f2, %f0
	fadd	%f0, %f0, %f1
	blr
_min_caml_start: # main entry point
#	main program starts
	addis	%r31, %r0, ha16(l.34)	# lis
	addi	%r31, %r31, lo16(l.34)
	lfd	%f0, 0(%r31)
	addis	%r31, %r0, ha16(l.35)	# lis
	addi	%r31, %r31, lo16(l.35)
	lfd	%f1, 0(%r31)
	addi	%r2, %r0, 2	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	testf.12
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_print_float
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
