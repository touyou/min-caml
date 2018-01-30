	.globl _start
	.text
_start:
# 0x000000 | code & data seg |
# 0x2_0000 | stack       seg |
# 0x8_0000 | heap        seg |
	lis	%r3, 0x0002	# sp
	lis	%r4, 0x0008	# hp
	b	_min_caml_start
#	create_array
	.text
	.align	2
	.globl	min_caml_create_array
min_caml_create_array:
	or	%r6, %r2, %r2  # mr	%r6, %r2
	or	%r2, %r4, %r4  # mr	%r2, %r4
create_array_loop:
	cmpwi	%cr7, %r6, 0
	bne	%cr7, create_array_cont
	blr
create_array_cont:
	stw	%r5, 0(%r4)
	addi	%r6, %r6, -1  # subi  %r6, %r6, 1
	addi	%r4, %r4, 4
	b	create_array_loop
#	create_float_array
	.globl	min_caml_create_float_array
min_caml_create_float_array:
	or	%r5, %r2, %r2  # mr	%r5, %r2
	or	%r2, %r4, %r4  # mr	%r2, %r4
create_float_array_loop:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, create_float_array_cont
	blr
create_float_array_cont:
	stfs	%f0, 0(%r4)
	addi	%r5, %r5, -1  # subi	%r5, %r5, 1
	addi	%r4, %r4, 4
	b	create_float_array_loop
	.data
	#.literal8
	.align 2
l.792:	 # 2.000000
	.long	1073741824
	.align 2
l.788:	 # 10.000000
	.long	1092616192
	.align 2
l.787:	 # 0.000000
	.long	0
	.text
	.globl _min_caml_start
	.align 2
mul_sub.340:
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.814
	or	%r2, %r6, %r6	# mr %r2, %r6
	blr
beq_else.814:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7
	and	%r8, %r5, %r8
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.815
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	mul_sub.340
beq_else.815:
	slw	%r8, %r2, %r7
	add	%r6, %r6, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	mul_sub.340
mul.345:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.816
	or	%r6, %r2, %r2	# mr %r6, %r2
	b	bge_cont.817
bge_else.816:
	neg	%r6, %r2
bge_cont.817:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.818
	or	%r7, %r5, %r5	# mr %r7, %r5
	b	bge_cont.819
bge_else.818:
	neg	%r7, %r5
bge_cont.819:
	addi	%r8, %r0, 0	# li
	addi	%r9, %r0, 30	# li
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mflr	%r31	
	or	%r5, %r7, %r7	# mr %r5, %r7
	or	%r2, %r6, %r6	# mr %r2, %r6
	or	%r7, %r9, %r9	# mr %r7, %r9
	or	%r6, %r8, %r8	# mr %r6, %r8
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	mul_sub.340
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	lwz	%r5, 4(%r3)
	addi	%r31, %r0, 31	# lis
	srw	%r5, %r5, %r31
	lwz	%r6, 0(%r3)
	addi	%r31, %r0, 31	# lis
	srw	%r6, %r6, %r31
	xor	%r5, %r5, %r6
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.820
	blr
beq_else.820:
	neg	%r2, %r2
	blr
div_sub.728:
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.821
	blr
beq_else.821:
	srw	%r8, %r5, %r7
	cmp	%cr7, %r6, %r8
	bgt	%cr7, ble_else.822
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7
	add	%r2, %r8, %r2
	slw	%r8, %r6, %r7
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.728
ble_else.822:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.728
div.348:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.823
	or	%r6, %r2, %r2	# mr %r6, %r2
	b	bge_cont.824
bge_else.823:
	neg	%r6, %r2
bge_cont.824:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.825
	or	%r7, %r5, %r5	# mr %r7, %r5
	b	bge_cont.826
bge_else.825:
	neg	%r7, %r5
bge_cont.826:
	addi	%r8, %r0, 0	# li
	addi	%r9, %r0, 30	# li
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r2, %r8, %r8	# mr %r2, %r8
	or	%r6, %r7, %r7	# mr %r6, %r7
	or	%r7, %r9, %r9	# mr %r7, %r9
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	div_sub.728
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	lwz	%r5, 4(%r3)
	addi	%r31, %r0, 31	# lis
	srw	%r5, %r5, %r31
	lwz	%r6, 0(%r3)
	addi	%r31, %r0, 31	# lis
	srw	%r6, %r6, %r31
	xor	%r5, %r5, %r6
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.827
	blr
beq_else.827:
	neg	%r2, %r2
	blr
print_int_sub.353:
	cmpwi	%cr7, %r2, 10
	blt	%cr7, bge_else.828
	addi	%r5, %r0, 10	# li
	stw	%r2, 0(%r3)
	mflr	%r31	
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.348
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtlr	%r31	
	mflr	%r31	
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int_sub.353
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 10	# li
	lwz	%r2, 0(%r3)
	mflr	%r31	
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.348
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 10	# li
	mflr	%r31	
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	mul.345
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtlr	%r31	
	lwz	%r5, 0(%r3)
	subf	%r2, %r2, %r5	# sub	%r2, %r5, %r2
	addi	%r2, %r2, 48
out.830:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.830
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	blr
bge_else.828:
	addi	%r2, %r2, 48
out.832:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.832
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	blr
print_int.355:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.833
	b	print_int_sub.353
bge_else.833:
	addi	%r5, %r0, 45	# li
out.834:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.834
	addi	%r31, %r0, 24	# lis
	slw	%r5, %r5, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
	neg	%r2, %r2
	b	print_int_sub.353
int_of_float.390:
	addis	%r31, %r0, (l.787)@h	# lis
	ori	%r31, %r31, (l.787)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.835
	addi	%r2, %r0, 0	# li
	blr
beq_else.835:
	stfs	%f0, 0(%r3)	# float
	lwz	%r2, 0(%r3)
	addi	%r31, %r0, 23	# lis
	srw	%r5, %r2, %r31
	andi.	%r5, %r5, 255
	addi	%r5, %r5, -127	# subi %r5, %r5, 127
	addis	%r6, %r0, 128	# lis
	ori	%r6, %r6, 0
	or	%r2, %r2, %r6
	addis	%r6, %r0, 255	# lis
	ori	%r6, %r6, 65535
	and	%r2, %r2, %r6
	addi	%r6, %r0, 23	# li
	subf	%r5, %r5, %r6	# sub	%r5, %r6, %r5
	cmpwi	%cr7, %r5, 32
	blt	%cr7, bge_else.836
	addi	%r2, %r0, 0	# li
	b	bge_cont.837
bge_else.836:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.838
	srw	%r2, %r2, %r5
	b	bge_cont.839
bge_else.838:
	neg	%r5, %r5
	slw	%r2, %r2, %r5
bge_cont.839:
bge_cont.837:
	addis	%r31, %r0, (l.787)@h	# lis
	ori	%r31, %r31, (l.787)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.840
	blr
ble_else.840:
	neg	%r2, %r2
	blr
msb_sub.503:
	srw	%r6, %r2, %r5
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.841
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.842
	or	%r2, %r5, %r5	# mr %r2, %r5
	blr
beq_else.842:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	b	msb_sub.503
beq_else.841:
	or	%r2, %r5, %r5	# mr %r2, %r5
	blr
float_of_int.392:
	cmpwi	%cr7, %r2, 0	
	bgt	%cr7, ble_else.843
	addi	%r5, %r0, 1	# li
	b	ble_cont.844
ble_else.843:
	addi	%r5, %r0, 0	# li
ble_cont.844:
	cmpwi	%cr7, %r2, 0	
	bgt	%cr7, ble_else.845
	neg	%r2, %r2
	b	ble_cont.846
ble_else.845:
ble_cont.846:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.847
	addis	%r31, %r0, (l.787)@h	# lis
	ori	%r31, %r31, (l.787)@l
	lfs	%f0, 0(%r31)	# float
	blr
beq_else.847:
	addi	%r6, %r0, 31	# li
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	msb_sub.503
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	addi	%r5, %r2, 127
	addi	%r31, %r0, 23	# li
	slw	%r5, %r5, %r31
	addi	%r6, %r0, 32	# li
	subf	%r2, %r2, %r6	# sub	%r2, %r6, %r2
	lwz	%r6, 4(%r3)
	slw	%r2, %r6, %r2
	addis	%r6, %r0, 65535	# lis
	ori	%r6, %r6, 65535
	and	%r2, %r2, %r6
	addi	%r31, %r0, 9	# lis
	srw	%r2, %r2, %r31
	or	%r2, %r2, %r5
	lwz	%r5, 0(%r3)
	addi	%r31, %r0, 31	# li
	slw	%r5, %r5, %r31
	or	%r2, %r2, %r5
	stw	%r2, 8(%r3)
	lfs	%f0, 8(%r3)	# float
	blr
print_float_sub.428:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.848
	blr
beq_else.848:
	addis	%r31, %r0, (l.788)@h	# lis
	ori	%r31, %r31, (l.788)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	stw	%r2, 0(%r3)
	stfs	%f0, 8(%r3)	# float
	mflr	%r31	
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	bl	int_of_float.390
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	addi	%r5, %r2, 48
out.851:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.851
	addi	%r31, %r0, 24	# lis
	slw	%r5, %r5, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
	mflr	%r31	
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	bl	float_of_int.392
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	b	print_float_sub.428
print_float.408:
	addis	%r31, %r0, (l.787)@h	# lis
	ori	%r31, %r31, (l.787)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.852
	b	ble_cont.853
ble_else.852:
	addi	%r2, %r0, 45	# li
out.854:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.854
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	fneg	%f0, %f0
ble_cont.853:
	stfs	%f0, 0(%r3)	# float
	mflr	%r31	
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	int_of_float.390
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	stw	%r2, 8(%r3)
	mflr	%r31	
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	print_int.355
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 46	# li
out.855:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.855
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	lwz	%r2, 8(%r3)
	mflr	%r31	
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	float_of_int.392
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtlr	%r31	
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	addi	%r2, %r0, 5	# li
	b	print_float_sub.428
testf.410:
	fadd	%f2, %f0, %f1
	fadd	%f1, %f0, %f1
	addi	%r5, %r0, 4	# li
	addis	%r31, %r0, (l.787)@h	# lis
	ori	%r31, %r31, (l.787)@l
	lfs	%f3, 0(%r31)	# float
	stfs	%f1, 0(%r3)	# float
	stfs	%f2, 8(%r3)	# float
	stfs	%f0, 16(%r3)	# float
	stw	%r2, 24(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	fmr	%f0, %f3
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_float_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	lwz	%r5, 24(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	add %r31, %r2, %r6
	lfs %f0, 0(%r31)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lfs	%f1, 16(%r3)	# float
	add %r31, %r2, %r6
	stfs %f1, 0(%r31)
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	add %r31, %r2, %r5
	lfs %f1, 0(%r31)
	lfs	%f2, 0(%r3)	# float
	lfs	%f3, 8(%r3)	# float
	fadd	%f2, %f3, %f2
	fadd	%f0, %f2, %f0
	fadd	%f0, %f0, %f1
	blr
_min_caml_start: # main entry point
	addi	%r1, %r0, 170
#	main program starts
	addis	%r31, %r0, (l.788)@h	# lis
	ori	%r31, %r31, (l.788)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.792)@h	# lis
	ori	%r31, %r31, (l.792)@l
	lfs	%f1, 0(%r31)	# float
	addi	%r2, %r0, 2	# li
	mflr	%r31	
	stw	%r31, 0(%r3)
	addi	%r3, %r3, 4
	bl	testf.410
	addi	%r3, %r3, -4	# subi
	lwz	%r31, 0(%r3)
	mtlr	%r31	
	mflr	%r31	
	stw	%r31, 0(%r3)
	addi	%r3, %r3, 4
	bl	print_float.408
	addi	%r3, %r3, -4	# subi
	lwz	%r31, 0(%r3)
	mtlr	%r31	
#	main program ends
	sc
