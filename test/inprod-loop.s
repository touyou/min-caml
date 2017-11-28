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
l.872:	 # 0.000000
	.long	0
	.long	0
	.align 3
l.871:	 # 1000000.000000
	.long	0
	.long	1232348160
	.align 3
l.870:	 # 4.560000
	.long	0
	.long	1083304837
	.align 3
l.869:	 # 1.230000
	.long	0
	.long	1067282595
	.text
	.globl _min_caml_start
	.align 2
mul_sub.835:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r5, -1
	bc	12, %cr7, beq_else.884
	blr
beq_else.884:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r5
	and	%r6, %r6, %r8
	cmpwi	%cr7, %r6, 0
	bc	12, %cr7, beq_else.885
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.885:
	slw	%r6, %r7, %r5
	add	%r2, %r2, %r6
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
mul.373:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.886
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.887
bge_else.886:
	neg	%r6, %r2
bge_cont.887:
	cmpwi	%cr7, %r5, 0
	bc	8, %cr7, bge_else.888
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.889
bge_else.888:
	neg	%r7, %r5
bge_cont.889:
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r8, %r0, ha16(mul_sub.835)	# lis
	addi	%r8, %r8, lo16(mul_sub.835)
	stw	%r8, 0(%r29)
	stw	%r7, 8(%r29)
	stw	%r6, 4(%r29)
	addi	%r6, %r0, 0	# li
	addi	%r7, %r0, 30	# li
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r7, %r5, %r7	# mr %r5, %r7
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	lwz	%r5, 4(%r3)
	srwi	%r5, %r5, 31
	lwz	%r6, 0(%r3)
	srwi	%r6, %r6, 31
	xor	%r5, %r5, %r6
	cmpwi	%cr7, %r5, 0
	bc	12, %cr7, beq_else.890
	blr
beq_else.890:
	neg	%r2, %r2
	blr
div_sub.801:
	cmpwi	%cr7, %r7, -1
	bc	12, %cr7, beq_else.891
	blr
beq_else.891:
	srw	%r8, %r5, %r7
	cmp	%cr7, %r6, %r8
	bc	4, %cr7, ble_else.892
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7
	add	%r2, %r8, %r2
	slw	%r8, %r6, %r7
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.801
ble_else.892:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.801
div.376:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.893
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.894
bge_else.893:
	neg	%r6, %r2
bge_cont.894:
	cmpwi	%cr7, %r5, 0
	bc	8, %cr7, bge_else.895
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.896
bge_else.895:
	neg	%r7, %r5
bge_cont.896:
	addi	%r8, %r0, 0	# li
	addi	%r9, %r0, 30	# li
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	or	%r8, %r2, %r8	# mr %r2, %r8
	or	%r7, %r6, %r7	# mr %r6, %r7
	or	%r9, %r7, %r9	# mr %r7, %r9
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	div_sub.801
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	lwz	%r5, 4(%r3)
	srwi	%r5, %r5, 31
	lwz	%r6, 0(%r3)
	srwi	%r6, %r6, 31
	xor	%r5, %r5, %r6
	cmpwi	%cr7, %r5, 0
	bc	12, %cr7, beq_else.897
	blr
beq_else.897:
	neg	%r2, %r2
	blr
print_int_sub.781:
	cmpwi	%cr7, %r2, 10
	bc	8, %cr7, bge_else.898
	addi	%r5, %r0, 10	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.376
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int_sub.781
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.376
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	mul.373
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	subf	%r2, %r2, %r5	# sub	%r2, %r5, %r2
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
bge_else.898:
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
print_int.381:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.901
	b	print_int_sub.781
bge_else.901:
	addi	%r5, %r0, 45	# li
	out	%r5, 0
	neg	%r2, %r2
	b	print_int_sub.781
inprod.444:
	cmpwi	%cr7, %r6, 0
	bc	8, %cr7, bge_else.902
	slwi	%r7, %r6, 3
	lfdx	%f1, %r2, %r7
	slwi	%r7, %r6, 3
	lfdx	%f2, %r5, %r7
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addi	%r6, %r6, -1	# subi %r6, %r6, 1
	b	inprod.444
bge_else.902:
	blr
_min_caml_start: # main entry point
#	main program starts
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, ha16(l.869)	# lis
	addi	%r31, %r31, lo16(l.869)
	lfd	%f0, 0(%r31)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_float_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, ha16(l.870)	# lis
	addi	%r31, %r31, lo16(l.870)
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
	addis	%r31, %r0, ha16(l.871)	# lis
	addi	%r31, %r31, lo16(l.871)
	lfd	%f0, 0(%r31)
	addis	%r31, %r0, ha16(l.872)	# lis
	addi	%r31, %r31, lo16(l.872)
	lfd	%f1, 0(%r31)
	addi	%r6, %r0, 2	# li
	lwz	%r2, 0(%r3)
	stfd	%f0, 8(%r3)
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	inprod.444
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
	bl	print_int.381
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
