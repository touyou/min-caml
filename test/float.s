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
l.886:	 # 48.300300
	.long	0
	.long	1111569281
	.align 3
l.885:	 # 4.500000
	.long	0
	.long	1083179008
	.align 3
l.884:	 # -12.300000
	.long	0
	.long	3242511564
	.align 3
l.883:	 # 0.000000
	.long	0
	.long	646978940
	.align 3
l.882:	 # 0.000000
	.long	0
	.long	786163454
	.align 3
l.878:	 # 2.000000
	.long	0
	.long	1073741824
	.align 3
l.872:	 # 2.356195
	.long	0
	.long	1075235812
	.align 3
l.871:	 # 0.785398
	.long	0
	.long	1061752794
	.align 3
l.870:	 # 1.570796
	.long	0
	.long	1070141402
	.align 3
l.869:	 # 3.141593
	.long	0
	.long	1078530010
	.align 3
l.868:	 # 6.283185
	.long	0
	.long	1086918618
	.align 3
l.867:	 # 0.000000
	.long	0
	.long	0
	.align 3
l.866:	 # 0.001370
	.long	0
	.long	984842501
	.align 3
l.865:	 # 0.041664
	.long	0
	.long	1026205576
	.align 3
l.864:	 # 0.500000
	.long	0
	.long	1056964608
	.align 3
l.863:	 # 1.000000
	.long	0
	.long	1065353216
	.align 3
l.862:	 # 0.000196
	.long	0
	.long	961373365
	.align 3
l.861:	 # 0.008333
	.long	0
	.long	1007191653
	.align 3
l.860:	 # 0.166667
	.long	0
	.long	1042983595
	.text
	.globl _min_caml_start
	.align 2
mul_sub.828:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r5, -1
	bc	12, %cr7, beq_else.931
	blr
beq_else.931:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r5
	and	%r6, %r6, %r8
	cmpwi	%cr7, %r6, 0
	bc	12, %cr7, beq_else.932
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.932:
	slw	%r6, %r7, %r5
	add	%r2, %r2, %r6
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
mul.373:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.933
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.934
bge_else.933:
	neg	%r6, %r2
bge_cont.934:
	cmpwi	%cr7, %r5, 0
	bc	8, %cr7, bge_else.935
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.936
bge_else.935:
	neg	%r7, %r5
bge_cont.936:
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r8, %r0, ha16(mul_sub.828)	# lis
	addi	%r8, %r8, lo16(mul_sub.828)
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
	bc	12, %cr7, beq_else.937
	blr
beq_else.937:
	neg	%r2, %r2
	blr
div_sub.794:
	cmpwi	%cr7, %r7, -1
	bc	12, %cr7, beq_else.938
	blr
beq_else.938:
	srw	%r8, %r5, %r7
	cmp	%cr7, %r6, %r8
	bc	4, %cr7, ble_else.939
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7
	add	%r2, %r8, %r2
	slw	%r8, %r6, %r7
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.794
ble_else.939:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.794
div.376:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.940
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.941
bge_else.940:
	neg	%r6, %r2
bge_cont.941:
	cmpwi	%cr7, %r5, 0
	bc	8, %cr7, bge_else.942
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.943
bge_else.942:
	neg	%r7, %r5
bge_cont.943:
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
	bl	div_sub.794
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
	bc	12, %cr7, beq_else.944
	blr
beq_else.944:
	neg	%r2, %r2
	blr
print_int_sub.774:
	cmpwi	%cr7, %r2, 10
	bc	8, %cr7, bge_else.945
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
	bl	print_int_sub.774
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
bge_else.945:
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
print_int.381:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.948
	b	print_int_sub.774
bge_else.948:
	addi	%r5, %r0, 45	# li
	out	%r5, 0
	neg	%r2, %r2
	b	print_int_sub.774
kernel_sin.385:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	fmul	%f3, %f2, %f1
	fmul	%f1, %f3, %f1
	addis	%r31, %r0, ha16(l.860)	# lis
	addi	%r31, %r31, lo16(l.860)
	lfd	%f4, 0(%r31)
	fmul	%f2, %f4, %f2
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, ha16(l.861)	# lis
	addi	%r31, %r31, lo16(l.861)
	lfd	%f2, 0(%r31)
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, ha16(l.862)	# lis
	addi	%r31, %r31, lo16(l.862)
	lfd	%f2, 0(%r31)
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	blr
kernel_cos.387:
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	addis	%r31, %r0, ha16(l.863)	# lis
	addi	%r31, %r31, lo16(l.863)
	lfd	%f3, 0(%r31)
	addis	%r31, %r0, ha16(l.864)	# lis
	addi	%r31, %r31, lo16(l.864)
	lfd	%f4, 0(%r31)
	fmul	%f0, %f4, %f0
	fsub	%f0, %f3, %f0
	addis	%r31, %r0, ha16(l.865)	# lis
	addi	%r31, %r31, lo16(l.865)
	lfd	%f3, 0(%r31)
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, ha16(l.866)	# lis
	addi	%r31, %r31, lo16(l.866)
	lfd	%f1, 0(%r31)
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	blr
sin.389:
	addis	%r31, %r0, ha16(l.867)	# lis
	addi	%r31, %r31, lo16(l.867)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bc	4, %cr7, ble_else.949
	addis	%r31, %r0, ha16(l.868)	# lis
	addi	%r31, %r31, lo16(l.868)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f0, %f1
	bc	4, %cr7, ble_else.950
	addis	%r31, %r0, ha16(l.869)	# lis
	addi	%r31, %r31, lo16(l.869)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bc	4, %cr7, ble_else.951
	addis	%r31, %r0, ha16(l.869)	# lis
	addi	%r31, %r31, lo16(l.869)
	lfd	%f1, 0(%r31)
	fsub	%f0, %f0, %f1
	addis	%r31, %r0, ha16(l.870)	# lis
	addi	%r31, %r31, lo16(l.870)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bc	4, %cr7, ble_else.952
	addis	%r31, %r0, ha16(l.872)	# lis
	addi	%r31, %r31, lo16(l.872)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bc	4, %cr7, ble_else.953
	addis	%r31, %r0, ha16(l.867)	# lis
	addi	%r31, %r31, lo16(l.867)
	lfd	%f1, 0(%r31)
	addis	%r31, %r0, ha16(l.869)	# lis
	addi	%r31, %r31, lo16(l.869)
	lfd	%f2, 0(%r31)
	fsub	%f0, %f2, %f0
	stfd	%f1, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	kernel_sin.385
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 0(%r3)
	fsub	%f0, %f1, %f0
	blr
ble_else.953:
	addis	%r31, %r0, ha16(l.867)	# lis
	addi	%r31, %r31, lo16(l.867)
	lfd	%f1, 0(%r31)
	addis	%r31, %r0, ha16(l.870)	# lis
	addi	%r31, %r31, lo16(l.870)
	lfd	%f2, 0(%r31)
	fsub	%f0, %f0, %f2
	stfd	%f1, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	kernel_cos.387
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 8(%r3)
	fsub	%f0, %f1, %f0
	blr
ble_else.952:
	addis	%r31, %r0, ha16(l.871)	# lis
	addi	%r31, %r31, lo16(l.871)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bc	4, %cr7, ble_else.954
	addis	%r31, %r0, ha16(l.867)	# lis
	addi	%r31, %r31, lo16(l.867)
	lfd	%f1, 0(%r31)
	addis	%r31, %r0, ha16(l.870)	# lis
	addi	%r31, %r31, lo16(l.870)
	lfd	%f2, 0(%r31)
	fsub	%f0, %f2, %f0
	stfd	%f1, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	kernel_cos.387
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 16(%r3)
	fsub	%f0, %f1, %f0
	blr
ble_else.954:
	addis	%r31, %r0, ha16(l.867)	# lis
	addi	%r31, %r31, lo16(l.867)
	lfd	%f1, 0(%r31)
	stfd	%f1, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	kernel_sin.385
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 24(%r3)
	fsub	%f0, %f1, %f0
	blr
ble_else.951:
	addis	%r31, %r0, ha16(l.870)	# lis
	addi	%r31, %r31, lo16(l.870)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bc	4, %cr7, ble_else.955
	addis	%r31, %r0, ha16(l.872)	# lis
	addi	%r31, %r31, lo16(l.872)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bc	4, %cr7, ble_else.956
	addis	%r31, %r0, ha16(l.869)	# lis
	addi	%r31, %r31, lo16(l.869)
	lfd	%f1, 0(%r31)
	fsub	%f0, %f1, %f0
	b	kernel_sin.385
ble_else.956:
	addis	%r31, %r0, ha16(l.870)	# lis
	addi	%r31, %r31, lo16(l.870)
	lfd	%f1, 0(%r31)
	fsub	%f0, %f0, %f1
	b	kernel_cos.387
ble_else.955:
	addis	%r31, %r0, ha16(l.871)	# lis
	addi	%r31, %r31, lo16(l.871)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bc	4, %cr7, ble_else.957
	addis	%r31, %r0, ha16(l.870)	# lis
	addi	%r31, %r31, lo16(l.870)
	lfd	%f1, 0(%r31)
	fsub	%f0, %f1, %f0
	b	kernel_cos.387
ble_else.957:
	b	kernel_sin.385
ble_else.950:
	addis	%r31, %r0, ha16(l.868)	# lis
	addi	%r31, %r31, lo16(l.868)
	lfd	%f1, 0(%r31)
	fsub	%f0, %f0, %f1
	b	sin.389
ble_else.949:
	addis	%r31, %r0, ha16(l.867)	# lis
	addi	%r31, %r31, lo16(l.867)
	lfd	%f1, 0(%r31)
	addis	%r31, %r0, ha16(l.867)	# lis
	addi	%r31, %r31, lo16(l.867)
	lfd	%f2, 0(%r31)
	fsub	%f0, %f2, %f0
	stfd	%f1, 32(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	sin.389
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 32(%r3)
	fsub	%f0, %f1, %f0
	blr
cos.391:
	addis	%r31, %r0, ha16(l.867)	# lis
	addi	%r31, %r31, lo16(l.867)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bc	4, %cr7, ble_else.958
	addis	%r31, %r0, ha16(l.868)	# lis
	addi	%r31, %r31, lo16(l.868)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f0, %f1
	bc	4, %cr7, ble_else.959
	addis	%r31, %r0, ha16(l.869)	# lis
	addi	%r31, %r31, lo16(l.869)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bc	4, %cr7, ble_else.960
	addis	%r31, %r0, ha16(l.869)	# lis
	addi	%r31, %r31, lo16(l.869)
	lfd	%f1, 0(%r31)
	fsub	%f0, %f0, %f1
	addis	%r31, %r0, ha16(l.870)	# lis
	addi	%r31, %r31, lo16(l.870)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bc	4, %cr7, ble_else.961
	addis	%r31, %r0, ha16(l.872)	# lis
	addi	%r31, %r31, lo16(l.872)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bc	4, %cr7, ble_else.962
	addis	%r31, %r0, ha16(l.869)	# lis
	addi	%r31, %r31, lo16(l.869)
	lfd	%f1, 0(%r31)
	fsub	%f0, %f1, %f0
	b	kernel_sin.385
ble_else.962:
	addis	%r31, %r0, ha16(l.870)	# lis
	addi	%r31, %r31, lo16(l.870)
	lfd	%f1, 0(%r31)
	fsub	%f0, %f0, %f1
	b	kernel_cos.387
ble_else.961:
	addis	%r31, %r0, ha16(l.871)	# lis
	addi	%r31, %r31, lo16(l.871)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bc	4, %cr7, ble_else.963
	addis	%r31, %r0, ha16(l.867)	# lis
	addi	%r31, %r31, lo16(l.867)
	lfd	%f1, 0(%r31)
	addis	%r31, %r0, ha16(l.870)	# lis
	addi	%r31, %r31, lo16(l.870)
	lfd	%f2, 0(%r31)
	fsub	%f0, %f2, %f0
	stfd	%f1, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	kernel_cos.387
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 0(%r3)
	fsub	%f0, %f1, %f0
	blr
ble_else.963:
	addis	%r31, %r0, ha16(l.867)	# lis
	addi	%r31, %r31, lo16(l.867)
	lfd	%f1, 0(%r31)
	stfd	%f1, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	kernel_sin.385
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 8(%r3)
	fsub	%f0, %f1, %f0
	blr
ble_else.960:
	addis	%r31, %r0, ha16(l.870)	# lis
	addi	%r31, %r31, lo16(l.870)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bc	4, %cr7, ble_else.964
	addis	%r31, %r0, ha16(l.872)	# lis
	addi	%r31, %r31, lo16(l.872)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bc	4, %cr7, ble_else.965
	addis	%r31, %r0, ha16(l.867)	# lis
	addi	%r31, %r31, lo16(l.867)
	lfd	%f1, 0(%r31)
	addis	%r31, %r0, ha16(l.869)	# lis
	addi	%r31, %r31, lo16(l.869)
	lfd	%f2, 0(%r31)
	fsub	%f0, %f2, %f0
	stfd	%f1, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	kernel_cos.387
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 16(%r3)
	fsub	%f0, %f1, %f0
	blr
ble_else.965:
	addis	%r31, %r0, ha16(l.867)	# lis
	addi	%r31, %r31, lo16(l.867)
	lfd	%f1, 0(%r31)
	addis	%r31, %r0, ha16(l.870)	# lis
	addi	%r31, %r31, lo16(l.870)
	lfd	%f2, 0(%r31)
	fsub	%f0, %f0, %f2
	stfd	%f1, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	kernel_sin.385
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 24(%r3)
	fsub	%f0, %f1, %f0
	blr
ble_else.964:
	addis	%r31, %r0, ha16(l.871)	# lis
	addi	%r31, %r31, lo16(l.871)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bc	4, %cr7, ble_else.966
	addis	%r31, %r0, ha16(l.870)	# lis
	addi	%r31, %r31, lo16(l.870)
	lfd	%f1, 0(%r31)
	fsub	%f0, %f1, %f0
	b	kernel_sin.385
ble_else.966:
	b	kernel_cos.387
ble_else.959:
	addis	%r31, %r0, ha16(l.868)	# lis
	addi	%r31, %r31, lo16(l.868)
	lfd	%f1, 0(%r31)
	fsub	%f0, %f0, %f1
	b	sin.389
ble_else.958:
	addis	%r31, %r0, ha16(l.867)	# lis
	addi	%r31, %r31, lo16(l.867)
	lfd	%f1, 0(%r31)
	fsub	%f0, %f1, %f0
	b	cos.391
abs_float.405:
	stfd	%f0, 4(%r3)
	lwz	%r2, 4(%r3)
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	stw	%r2, 4(%r3)
	lfd	%f0, 4(%r3)
	blr
int_of_float.416:
	addis	%r31, %r0, ha16(l.867)	# lis
	addi	%r31, %r31, lo16(l.867)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f0, %f1
	bc	12, %cr7, beq_else.967
	addi	%r2, %r0, 0	# li
	blr
beq_else.967:
	stfd	%f0, 4(%r3)
	lwz	%r2, 4(%r3)
	srwi	%r5, %r2, 23
	andi	%r5, %r5, 255
	addi	%r5, %r5, -127	# subi %r5, %r5, 127
	addis	%r6, %r0, 128	# lis
	ori	%r6, %r6, 0
	or	%r2, %r2, %r6
	addis	%r6, %r0, 255	# lis
	ori	%r6, %r6, 65535
	and	%r2, %r2, %r6
	addi	%r6, %r0, 23	# li
	subf	%r5, %r5, %r6	# sub	%r5, %r6, %r5
	cmpwi	%cr7, %r5, 0
	bc	8, %cr7, bge_else.968
	srw	%r2, %r2, %r5
	b	bge_cont.969
bge_else.968:
	neg	%r5, %r5
	slw	%r2, %r2, %r5
bge_cont.969:
	addis	%r5, %r0, 65535	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	addis	%r31, %r0, ha16(l.867)	# lis
	addi	%r31, %r31, lo16(l.867)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bc	4, %cr7, ble_else.970
	blr
ble_else.970:
	neg	%r2, %r2
	blr
msb_sub.569:
	srw	%r6, %r2, %r5
	cmpwi	%cr7, %r6, 0
	bc	12, %cr7, beq_else.971
	cmpwi	%cr7, %r2, 0
	bc	12, %cr7, beq_else.972
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
beq_else.972:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	b	msb_sub.569
beq_else.971:
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
float_of_int.418:
	cmpwi	%cr7, %r2, 0
	bc	12, %cr7, beq_else.973
	addis	%r31, %r0, ha16(l.867)	# lis
	addi	%r31, %r31, lo16(l.867)
	lfd	%f0, 0(%r31)
	blr
beq_else.973:
	addi	%r5, %r0, 31	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	msb_sub.569
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r2, 127
	slwi	%r5, %r5, 23
	addi	%r6, %r0, 32	# li
	subf	%r2, %r2, %r6	# sub	%r2, %r6, %r2
	lwz	%r6, 0(%r3)
	slw	%r2, %r6, %r2
	addis	%r6, %r0, 65535	# lis
	ori	%r6, %r6, 65535
	and	%r2, %r2, %r6
	srwi	%r2, %r2, 9
	or	%r2, %r2, %r5
	stw	%r2, 4(%r3)
	lfd	%f0, 4(%r3)
	blr
deriv.424:
	fadd	%f2, %f0, %f1
	stfd	%f1, 0(%r3)
	stfd	%f0, 8(%r3)
	stw	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	or	%r2, %r29, %r2	# mr %r29, %r2
	fmr	%f0, %f2
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 8(%r3)
	lwz	%r29, 16(%r3)
	stfd	%f0, 24(%r3)
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 24(%r3)
	fsub	%f0, %f1, %f0
	lfd	%f1, 0(%r3)
	fdiv	%f0, %f0, %f1
	blr
xn_plus_one.428:
	lfd	%f1, 8(%r29)
	stfd	%f1, 0(%r3)
	stfd	%f0, 8(%r3)
	stw	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	or	%r2, %r29, %r2	# mr %r29, %r2
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 8(%r3)
	lfd	%f2, 0(%r3)
	lwz	%r2, 16(%r3)
	stfd	%f0, 24(%r3)
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	fmr	%f1, %f2
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	deriv.424
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 24(%r3)
	fdiv	%f0, %f1, %f0
	lfd	%f1, 8(%r3)
	fsub	%f0, %f1, %f0
	blr
newton.551:
	lwz	%r2, 16(%r29)
	lfd	%f1, 8(%r29)
	lwz	%r5, 4(%r29)
	stw	%r29, 0(%r3)
	stfd	%f1, 8(%r3)
	stfd	%f0, 16(%r3)
	mfspr	%r31, 8	# mflr
	or	%r2, %r29, %r2	# mr %r29, %r2
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 16(%r3)
	fsub	%f1, %f0, %f1
	stfd	%f0, 24(%r3)
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	abs_float.405
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 8(%r3)
	fcmpu	%cr7, %f1, %f0
	bc	4, %cr7, ble_else.977
	lfd	%f0, 24(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
ble_else.977:
	lfd	%f0, 24(%r3)
	blr
newton_sub.431:
	lwz	%r5, 16(%r29)
	lfd	%f1, 8(%r29)
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 24
	addis	%r6, %r0, ha16(newton.551)	# lis
	addi	%r6, %r6, lo16(newton.551)
	stw	%r6, 0(%r29)
	stw	%r5, 16(%r29)
	stfd	%f1, 8(%r29)
	stw	%r2, 4(%r29)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
f.547:
	lfd	%f1, 8(%r29)
	fmul	%f0, %f0, %f0
	fsub	%f0, %f0, %f1
	blr
sqrt.434:
	lwz	%r29, 4(%r29)
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 16
	addis	%r5, %r0, ha16(f.547)	# lis
	addi	%r5, %r5, lo16(f.547)
	stw	%r5, 0(%r2)
	stfd	%f0, 8(%r2)
	addis	%r31, %r0, ha16(l.878)	# lis
	addi	%r31, %r31, lo16(l.878)
	lfd	%f0, 0(%r31)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
_min_caml_start: # main entry point
#	main program starts
	addis	%r31, %r0, ha16(l.882)	# lis
	addi	%r31, %r31, lo16(l.882)
	lfd	%f0, 0(%r31)
	addis	%r31, %r0, ha16(l.883)	# lis
	addi	%r31, %r31, lo16(l.883)
	lfd	%f1, 0(%r31)
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 16
	addis	%r5, %r0, ha16(xn_plus_one.428)	# lis
	addi	%r5, %r5, lo16(xn_plus_one.428)
	stw	%r5, 0(%r2)
	stfd	%f0, 8(%r2)
	or	%r4, %r5, %r4	# mr %r5, %r4
	addi	%r4, %r4, 24
	addis	%r6, %r0, ha16(newton_sub.431)	# lis
	addi	%r6, %r6, lo16(newton_sub.431)
	stw	%r6, 0(%r5)
	stw	%r2, 16(%r5)
	stfd	%f1, 8(%r5)
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 8
	addis	%r6, %r0, ha16(sqrt.434)	# lis
	addi	%r6, %r6, lo16(sqrt.434)
	stw	%r6, 0(%r2)
	stw	%r5, 4(%r2)
	addis	%r31, %r0, ha16(l.884)	# lis
	addi	%r31, %r31, lo16(l.884)
	lfd	%f0, 0(%r31)
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	abs_float.405
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r29, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	cos.391
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	sin.389
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, ha16(l.885)	# lis
	addi	%r31, %r31, lo16(l.885)
	lfd	%f1, 0(%r31)
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, ha16(l.886)	# lis
	addi	%r31, %r31, lo16(l.886)
	lfd	%f1, 0(%r31)
	fsub	%f0, %f0, %f1
	addis	%r2, %r0, 15	# lis
	ori	%r2, %r2, 16960
	stfd	%f0, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	float_of_int.418
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 8(%r3)
	fmul	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	int_of_float.416
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
