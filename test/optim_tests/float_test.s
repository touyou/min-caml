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
l.660:	 # -1.500000
	.long	0
	.long	-1074266112
	.align 3
l.659:	 # 0.000000
	.long	0
	.long	0
	.text
	.globl _min_caml_start
	.align 2
search_top.430:
	cmpwi	%cr7, %r2, 1
	bc	12, %cr7, beq_else.666
	addi	%r2, %r0, 0	# li
	blr
beq_else.666:
	srwi	%r2, %r2, 1
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	search_top.430
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r2, 1
	blr
float_of_int.326:
	cmpwi	%cr7, %r2, 0
	bc	12, %cr7, beq_else.667
	addis	%r31, %r0, ha16(l.659)	# lis
	addi	%r31, %r31, lo16(l.659)
	lfd	%f0, 0(%r31)
	blr
beq_else.667:
	cmpwi	%cr7, %r2, 0	
	bc	4, %cr7, ble_else.668
	addi	%r5, %r0, 1	# li
	b	ble_cont.669
ble_else.668:
	addi	%r5, %r0, 0	# li
ble_cont.669:
	cmpwi	%cr7, %r2, 0	
	bc	4, %cr7, ble_else.670
	neg	%r2, %r2
	b	ble_cont.671
ble_else.670:
ble_cont.671:
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	search_top.430
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 23
	bc	4, %cr7, ble_else.672
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
ble_else.672:
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
print_int.352:
	out	%r2, 0
	blr
dbl.354:
	fadd	%f0, %f0, %f0
	blr
_min_caml_start: # main entry point
#	main program starts
	addis	%r31, %r0, ha16(l.660)	# lis
	addi	%r31, %r31, lo16(l.660)
	lfd	%f0, 0(%r31)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	dbl.354
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, -3	# li
	stfd	%f0, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	float_of_int.326
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 0(%r3)
	fcmpu	%cr7, %f1, %f0
	bc	12, %cr7, beq_else.674
	addi	%r2, %r0, 0	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	print_int.352
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	b	beq_cont.675
beq_else.674:
	addi	%r2, %r0, 1	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	print_int.352
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.675:
#	main program ends
