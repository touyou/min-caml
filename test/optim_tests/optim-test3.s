	.globl _start
	.text
_start:
# 0x000000 | code & data seg |
# 0x2_0000 | stack       seg |
# 0x8_0000 | heap        seg |
	lis	%r3, 0x0002	# sp
	lis	%r4, 0x0008	# hp
	b	_min_caml_start
	.data
	.align 	8
  .comm min_caml_n_objects, 4
  .comm min_caml_objects, 240
  .comm min_caml_screen, 24
  .comm	min_caml_viewpoint, 24
  .comm min_caml_light, 24
  .comm min_caml_beam, 8
  .comm min_caml_and_net, 200
  .comm min_caml_or_net, 4
  .comm min_caml_solver_dist, 8
  .comm min_caml_intsec_rectside, 4
  .comm min_caml_tmin, 8
  .comm min_caml_intersection_point, 24
  .comm min_caml_intersected_object_id, 4
  .comm min_caml_nvector, 24
  .comm min_caml_texture_color, 24
  .comm min_caml_diffuse_ray, 24
  .comm min_caml_rgb, 24
  .comm min_caml_image_size, 8
  .comm min_caml_image_center, 8
  .comm min_caml_scan_pitch, 8
  .comm min_caml_startp, 24
  .comm min_caml_startp_fast, 24
  .comm min_caml_screenx_dir, 24
  .comm min_caml_screeny_dir, 24
  .comm min_caml_screenz_dir, 24
  .comm min_caml_ptrace_dirvec, 24
  .comm min_caml_dirvecs, 20
  .comm min_caml_light_dirvec, 264
  .comm min_caml_reflections, 720
  .comm min_caml_n_reflections, 4
#	create_array
	.text
	.align	2
	.globl	min_caml_create_array
min_caml_create_array:
	or	%r2, %r6, %r2  # mr	%r6, %r2
	or	%r4, %r2, %r4  # mr	%r2, %r4
create_array_loop:
	cmpwi	%cr7, %r6, 0
	bne	%cr7, create_array_cont
	b	create_array_exit
create_array_exit:
	blr
create_array_cont:
	stw	%r5, 0(%r4)
	addi	%r6, %r6, -1  # subi  %r6, %r6, 1
	addi	%r4, %r4, 4
	b	create_array_loop
#	create_float_array
	.globl	min_caml_create_float_array
min_caml_create_float_array:
	or	%r2, %r5, %r2  # mr	%r5, %r2
	or	%r4, %r2, %r4  # mr	%r2, %r4
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
	.align 3
l.882:	 # 0.000000
	.long	646978940
	.align 3
l.881:	 # 0.000000
	.long	786163454
	.align 3
l.880:	 # 10.000000
	.long	1092616192
	.align 3
l.879:	 # 0.100000
	.long	1036831948
	.align 3
l.870:	 # 2.000000
	.long	1073741824
	.align 3
l.869:	 # 1.570796
	.long	1070141402
	.align 3
l.868:	 # 0.785398
	.long	1061752794
	.align 3
l.867:	 # 2.437500
	.long	1075576832
	.align 3
l.866:	 # 0.437500
	.long	1054867456
	.align 3
l.865:	 # 0.060035
	.long	1031137220
	.align 3
l.864:	 # 0.089764
	.long	1035458157
	.align 3
l.863:	 # 0.111111
	.long	1038323255
	.align 3
l.862:	 # 0.142857
	.long	1041385764
	.align 3
l.861:	 # 0.200000
	.long	1045220556
	.align 3
l.860:	 # 0.333333
	.long	1051372201
	.align 3
l.859:	 # 2.356195
	.long	1075235812
	.align 3
l.858:	 # 0.785398
	.long	1061752794
	.align 3
l.857:	 # 1.570796
	.long	1070141402
	.align 3
l.856:	 # 3.141593
	.long	1078530010
	.align 3
l.855:	 # 6.283185
	.long	1086918618
	.align 3
l.854:	 # 0.000000
	.long	0
	.align 3
l.853:	 # 0.001370
	.long	984842501
	.align 3
l.852:	 # 0.041664
	.long	1026205576
	.align 3
l.851:	 # 0.500000
	.long	1056964608
	.align 3
l.850:	 # 1.000000
	.long	1065353216
	.align 3
l.849:	 # 0.000196
	.long	961373365
	.align 3
l.848:	 # 0.008333
	.long	1007191653
	.align 3
l.847:	 # 0.166667
	.long	1042983595
	.text
	.globl _min_caml_start
	.align 2
mul_sub.815:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	addi	%r8, %r0, 1	# li
	neg	%r8, %r8
	cmp	%cr7, %r5, %r8
	bne	%cr7, beq_else.936
	blr
beq_else.936:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r5 # swap
	and	%r6, %r6, %r8
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.937
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.937:
	slw	%r7, %r6, %r5 # swap
	add	%r2, %r2, %r6
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
mul.363:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.938
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.939
bge_else.938:
	neg	%r6, %r2
bge_cont.939:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.940
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.941
bge_else.940:
	neg	%r7, %r5
bge_cont.941:
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r8, %r0, (mul_sub.815)@h	# lis
	ori	%r8, %r8, (mul_sub.815)@l
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
	addi	%r1, %r0, 31	# lis
	srw	%r5, %r5, %r1 # swap
	lwz	%r6, 0(%r3)
	addi	%r1, %r0, 31	# lis
	srw	%r6, %r6, %r1 # swap
	xor	%r5, %r5, %r6
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.942
	blr
beq_else.942:
	neg	%r2, %r2
	blr
div_sub.781:
	addi	%r8, %r0, 1	# li
	neg	%r8, %r8
	cmp	%cr7, %r7, %r8
	bne	%cr7, beq_else.943
	blr
beq_else.943:
	srw	%r5, %r8, %r7 # swap
	cmp	%cr7, %r6, %r8
	bgt	%cr7, ble_else.944
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7 # swap
	add	%r2, %r8, %r2
	slw	%r6, %r8, %r7 # swap
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.781
ble_else.944:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.781
div.366:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.945
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.946
bge_else.945:
	neg	%r6, %r2
bge_cont.946:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.947
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.948
bge_else.947:
	neg	%r7, %r5
bge_cont.948:
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
	bl	div_sub.781
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	lwz	%r5, 4(%r3)
	addi	%r1, %r0, 31	# lis
	srw	%r5, %r5, %r1 # swap
	lwz	%r6, 0(%r3)
	addi	%r1, %r0, 31	# lis
	srw	%r6, %r6, %r1 # swap
	xor	%r5, %r5, %r6
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.949
	blr
beq_else.949:
	neg	%r2, %r2
	blr
print_newline.369:
	addi	%r2, %r0, 10	# li
	out	%r2, 0
	blr
print_int_sub.761:
	cmpwi	%cr7, %r2, 10
	blt	%cr7, bge_else.951
	addi	%r5, %r0, 10	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.366
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int_sub.761
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.366
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	mul.363
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	subf	%r2, %r2, %r5	# sub	%r2, %r5, %r2
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
bge_else.951:
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
print_int.371:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.954
	b	print_int_sub.761
bge_else.954:
	addi	%r5, %r0, 45	# li
	out	%r5, 0
	neg	%r2, %r2
	b	print_int_sub.761
print_char.373:
	out	%r2, 0
	blr
kernel_sin.375:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	fmul	%f3, %f2, %f1
	fmul	%f1, %f3, %f1
	addis	%r31, %r0, (l.847)@h	# lis
	ori	%r31, %r31, (l.847)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f2, %f4, %f2
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.848)@h	# lis
	ori	%r31, %r31, (l.848)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.849)@h	# lis
	ori	%r31, %r31, (l.849)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	blr
kernel_cos.377:
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	addis	%r31, %r0, (l.850)@h	# lis
	ori	%r31, %r31, (l.850)@l
	lfs	%f3, 0(%r31)	# float
	addis	%r31, %r0, (l.851)@h	# lis
	ori	%r31, %r31, (l.851)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f0, %f4, %f0
	fsub	%f0, %f3, %f0
	addis	%r31, %r0, (l.852)@h	# lis
	ori	%r31, %r31, (l.852)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.853)@h	# lis
	ori	%r31, %r31, (l.853)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	blr
sin.379:
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.956
	addis	%r31, %r0, (l.855)@h	# lis
	ori	%r31, %r31, (l.855)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.957
	addis	%r31, %r0, (l.856)@h	# lis
	ori	%r31, %r31, (l.856)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.958
	addis	%r31, %r0, (l.856)@h	# lis
	ori	%r31, %r31, (l.856)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	addis	%r31, %r0, (l.857)@h	# lis
	ori	%r31, %r31, (l.857)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.959
	addis	%r31, %r0, (l.859)@h	# lis
	ori	%r31, %r31, (l.859)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.960
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.856)@h	# lis
	ori	%r31, %r31, (l.856)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	kernel_sin.375
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.960:
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.857)@h	# lis
	ori	%r31, %r31, (l.857)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f0, %f2
	stfs	%f1, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	kernel_cos.377
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.959:
	addis	%r31, %r0, (l.858)@h	# lis
	ori	%r31, %r31, (l.858)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.961
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.857)@h	# lis
	ori	%r31, %r31, (l.857)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	kernel_cos.377
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.961:
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f1, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	kernel_sin.375
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.958:
	addis	%r31, %r0, (l.857)@h	# lis
	ori	%r31, %r31, (l.857)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.962
	addis	%r31, %r0, (l.859)@h	# lis
	ori	%r31, %r31, (l.859)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.963
	addis	%r31, %r0, (l.856)@h	# lis
	ori	%r31, %r31, (l.856)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_sin.375
ble_else.963:
	addis	%r31, %r0, (l.857)@h	# lis
	ori	%r31, %r31, (l.857)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	kernel_cos.377
ble_else.962:
	addis	%r31, %r0, (l.858)@h	# lis
	ori	%r31, %r31, (l.858)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.964
	addis	%r31, %r0, (l.857)@h	# lis
	ori	%r31, %r31, (l.857)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_cos.377
ble_else.964:
	b	kernel_sin.375
ble_else.957:
	addis	%r31, %r0, (l.855)@h	# lis
	ori	%r31, %r31, (l.855)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	sin.379
ble_else.956:
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	sin.379
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
cos.381:
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.965
	addis	%r31, %r0, (l.855)@h	# lis
	ori	%r31, %r31, (l.855)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.966
	addis	%r31, %r0, (l.856)@h	# lis
	ori	%r31, %r31, (l.856)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.967
	addis	%r31, %r0, (l.856)@h	# lis
	ori	%r31, %r31, (l.856)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	addis	%r31, %r0, (l.857)@h	# lis
	ori	%r31, %r31, (l.857)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.968
	addis	%r31, %r0, (l.859)@h	# lis
	ori	%r31, %r31, (l.859)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.969
	addis	%r31, %r0, (l.856)@h	# lis
	ori	%r31, %r31, (l.856)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_sin.375
ble_else.969:
	addis	%r31, %r0, (l.857)@h	# lis
	ori	%r31, %r31, (l.857)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	kernel_cos.377
ble_else.968:
	addis	%r31, %r0, (l.858)@h	# lis
	ori	%r31, %r31, (l.858)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.970
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.857)@h	# lis
	ori	%r31, %r31, (l.857)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	kernel_cos.377
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.970:
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f1, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	kernel_sin.375
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.967:
	addis	%r31, %r0, (l.857)@h	# lis
	ori	%r31, %r31, (l.857)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.971
	addis	%r31, %r0, (l.859)@h	# lis
	ori	%r31, %r31, (l.859)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.972
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.856)@h	# lis
	ori	%r31, %r31, (l.856)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	kernel_cos.377
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.972:
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.857)@h	# lis
	ori	%r31, %r31, (l.857)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f0, %f2
	stfs	%f1, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	kernel_sin.375
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.971:
	addis	%r31, %r0, (l.858)@h	# lis
	ori	%r31, %r31, (l.858)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.973
	addis	%r31, %r0, (l.857)@h	# lis
	ori	%r31, %r31, (l.857)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_sin.375
ble_else.973:
	b	kernel_cos.377
ble_else.966:
	addis	%r31, %r0, (l.855)@h	# lis
	ori	%r31, %r31, (l.855)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	sin.379
ble_else.965:
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	cos.381
kernel_atan.383:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	fmul	%f3, %f2, %f1
	fmul	%f4, %f3, %f1
	fmul	%f5, %f4, %f1
	fmul	%f6, %f5, %f1
	fmul	%f1, %f6, %f1
	addis	%r31, %r0, (l.860)@h	# lis
	ori	%r31, %r31, (l.860)@l
	lfs	%f7, 0(%r31)	# float
	fmul	%f2, %f7, %f2
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.861)@h	# lis
	ori	%r31, %r31, (l.861)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.862)@h	# lis
	ori	%r31, %r31, (l.862)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f4
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.863)@h	# lis
	ori	%r31, %r31, (l.863)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f5
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.864)@h	# lis
	ori	%r31, %r31, (l.864)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f6
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.865)@h	# lis
	ori	%r31, %r31, (l.865)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f1, %f2, %f1
	fadd	%f0, %f0, %f1
	blr
atan.385:
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.974
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.866)@h	# lis
	ori	%r31, %r31, (l.866)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.975
	addis	%r31, %r0, (l.867)@h	# lis
	ori	%r31, %r31, (l.867)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.976
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.869)@h	# lis
	ori	%r31, %r31, (l.869)@l
	lfs	%f2, 0(%r31)	# float
	addis	%r31, %r0, (l.850)@h	# lis
	ori	%r31, %r31, (l.850)@l
	lfs	%f3, 0(%r31)	# float
	fdiv	%f0, %f3, %f0
	stfs	%f1, 0(%r3)	# float
	stfs	%f2, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	kernel_atan.383
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.976:
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.868)@h	# lis
	ori	%r31, %r31, (l.868)@l
	lfs	%f2, 0(%r31)	# float
	addis	%r31, %r0, (l.850)@h	# lis
	ori	%r31, %r31, (l.850)@l
	lfs	%f3, 0(%r31)	# float
	fsub	%f3, %f0, %f3
	addis	%r31, %r0, (l.850)@h	# lis
	ori	%r31, %r31, (l.850)@l
	lfs	%f4, 0(%r31)	# float
	fadd	%f0, %f0, %f4
	fdiv	%f0, %f3, %f0
	stfs	%f1, 16(%r3)	# float
	stfs	%f2, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	kernel_atan.383
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fadd	%f0, %f1, %f0
	lfs	%f1, 16(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.975:
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f1, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	kernel_atan.383
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.974:
	addis	%r31, %r0, (l.866)@h	# lis
	ori	%r31, %r31, (l.866)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.977
	addis	%r31, %r0, (l.867)@h	# lis
	ori	%r31, %r31, (l.867)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.978
	addis	%r31, %r0, (l.869)@h	# lis
	ori	%r31, %r31, (l.869)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.850)@h	# lis
	ori	%r31, %r31, (l.850)@l
	lfs	%f2, 0(%r31)	# float
	fdiv	%f0, %f2, %f0
	stfs	%f1, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	kernel_atan.383
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 40(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.978:
	addis	%r31, %r0, (l.868)@h	# lis
	ori	%r31, %r31, (l.868)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.850)@h	# lis
	ori	%r31, %r31, (l.850)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f2, %f0, %f2
	addis	%r31, %r0, (l.850)@h	# lis
	ori	%r31, %r31, (l.850)@l
	lfs	%f3, 0(%r31)	# float
	fadd	%f0, %f0, %f3
	fdiv	%f0, %f2, %f0
	stfs	%f1, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	kernel_atan.383
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 48(%r3)	# float
	fadd	%f0, %f1, %f0
	blr
ble_else.977:
	b	kernel_atan.383
fiszero.387:
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.979
	addi	%r2, %r0, 1	# li
	blr
beq_else.979:
	addi	%r2, %r0, 0	# li
	blr
fispos.389:
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.980
	addi	%r2, %r0, 0	# li
	blr
ble_else.980:
	addi	%r2, %r0, 1	# li
	blr
fisneg.391:
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	fispos.389
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.981
	addi	%r2, %r0, 1	# li
	blr
beq_else.981:
	addi	%r2, %r0, 0	# li
	blr
fneg.393:
	fneg	%f0, %f0
	blr
abs_float.395:
	stfs	%f0, 4(%r3)	# float
	lwz	%r2, 4(%r3)
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	stw	%r2, 4(%r3)
	lfs	%f0, 4(%r3)	# float
	blr
fabs.397:
	b	abs_float.395
fless.399:
	cmp	%cr7, %r5, %r2
	bgt	%cr7, ble_else.982
	addi	%r2, %r0, 0	# li
	blr
ble_else.982:
	addi	%r2, %r0, 1	# li
	blr
fhalf.402:
	addis	%r31, %r0, (l.870)@h	# lis
	ori	%r31, %r31, (l.870)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	blr
fsqr.404:
	fmul	%f0, %f0, %f0
	blr
int_of_float.406:
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.983
	addi	%r2, %r0, 0	# li
	blr
beq_else.983:
	stfs	%f0, 4(%r3)	# float
	lwz	%r2, 4(%r3)
	addi	%r1, %r0, 23	# lis
	srw	%r2, %r5, %r1 # swap
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
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.984
	srw	%r2, %r2, %r5 # swap
	b	bge_cont.985
bge_else.984:
	neg	%r5, %r5
	slw	%r2, %r2, %r5 # swap
bge_cont.985:
	addis	%r5, %r0, 65535	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.986
	blr
ble_else.986:
	neg	%r2, %r2
	blr
msb_sub.556:
	srw	%r2, %r6, %r5 # swap
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.987
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.988
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
beq_else.988:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	b	msb_sub.556
beq_else.987:
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
float_of_int.408:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.989
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f0, 0(%r31)	# float
	blr
beq_else.989:
	addi	%r5, %r0, 31	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	msb_sub.556
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r2, 127
	addi	%r1, %r0, 23	# li
	slw	%r5, %r5, %r1 # swap
	addi	%r6, %r0, 32	# li
	subf	%r2, %r2, %r6	# sub	%r2, %r6, %r2
	lwz	%r6, 0(%r3)
	slw	%r6, %r2, %r2 # swap
	addis	%r6, %r0, 65535	# lis
	ori	%r6, %r6, 65535
	and	%r2, %r2, %r6
	addi	%r1, %r0, 9	# lis
	srw	%r2, %r2, %r1 # swap
	or	%r2, %r2, %r5
	stw	%r2, 4(%r3)
	lfs	%f0, 4(%r3)	# float
	blr
floor.410:
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.990
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	int_of_float.406
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	b	float_of_int.408
ble_else.990:
	addis	%r31, %r0, (l.850)@h	# lis
	ori	%r31, %r31, (l.850)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	int_of_float.406
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	b	float_of_int.408
deriv.414:
	fadd	%f2, %f0, %f1
	stfs	%f1, 0(%r3)	# float
	stfs	%f0, 8(%r3)	# float
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
	lfs	%f1, 8(%r3)	# float
	lwz	%r29, 16(%r3)
	stfs	%f0, 24(%r3)	# float
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
	lfs	%f1, 24(%r3)	# float
	fsub	%f0, %f1, %f0
	lfs	%f1, 0(%r3)	# float
	fdiv	%f0, %f0, %f1
	blr
xn_plus_one.418:
	lfs	%f1, 8(%r29)	# float
	stfs	%f1, 0(%r3)	# float
	stfs	%f0, 8(%r3)	# float
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
	lfs	%f1, 8(%r3)	# float
	lfs	%f2, 0(%r3)	# float
	lwz	%r2, 16(%r3)
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	fmr	%f1, %f2
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	deriv.414
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fdiv	%f0, %f1, %f0
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
newton.538:
	lwz	%r2, 12(%r29)
	lfs	%f1, 8(%r29)	# float
	lwz	%r5, 4(%r29)
	stw	%r29, 0(%r3)
	stfs	%f1, 8(%r3)	# float
	stfs	%f0, 16(%r3)	# float
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
	lfs	%f1, 16(%r3)	# float
	fsub	%f1, %f0, %f1
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	abs_float.395
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.994
	lfs	%f0, 24(%r3)	# float
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
ble_else.994:
	lfs	%f0, 24(%r3)	# float
	blr
newton_sub.421:
	lwz	%r5, 12(%r29)
	lfs	%f1, 8(%r29)	# float
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r6, %r0, (newton.538)@h	# lis
	ori	%r6, %r6, (newton.538)@l
	stw	%r6, 0(%r29)
	stw	%r5, 12(%r29)
	stfs	%f1, 8(%r29)	# float
	stw	%r2, 4(%r29)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
f.534:
	lfs	%f1, 8(%r29)	# float
	fmul	%f0, %f0, %f0
	fsub	%f0, %f0, %f1
	blr
sqrt.424:
	lwz	%r29, 4(%r29)
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 16
	addis	%r5, %r0, (f.534)@h	# lis
	ori	%r5, %r5, (f.534)@l
	stw	%r5, 0(%r2)
	stfs	%f0, 8(%r2)	# float
	addis	%r31, %r0, (l.870)@h	# lis
	ori	%r31, %r31, (l.870)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
f.514:
	in	%r5, 0
	cmpwi	%cr7, %r5, 47
	bgt	%cr7, ble_else.995
	blr
ble_else.995:
	cmpwi	%cr7, %r5, 58
	blt	%cr7, bge_else.996
	blr
bge_else.996:
	addi	%r6, %r0, 10	# li
	stw	%r5, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	mul.363
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	addi	%r5, %r5, -48	# subi %r5, %r5, 48
	add	%r2, %r2, %r5
	b	f.514
read_int.426:
	in	%r5, 0
	cmpwi	%cr7, %r5, 45
	bne	%cr7, beq_else.997
	addi	%r2, %r0, 0	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	f.514
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	neg	%r2, %r2
	blr
beq_else.997:
	cmpwi	%cr7, %r5, 47
	bgt	%cr7, ble_else.998
	b	read_int.426
ble_else.998:
	cmpwi	%cr7, %r5, 58
	blt	%cr7, bge_else.999
	b	read_int.426
bge_else.999:
	addi	%r2, %r5, -48	# subi %r2, %r5, 48
	b	f.514
g.475:
	in	%r2, 0
	cmpwi	%cr7, %r2, 47
	bgt	%cr7, ble_else.1000
	fmr	%f0, %f1
	blr
ble_else.1000:
	cmpwi	%cr7, %r2, 58
	blt	%cr7, bge_else.1001
	fmr	%f0, %f1
	blr
bge_else.1001:
	addis	%r31, %r0, (l.879)@h	# lis
	ori	%r31, %r31, (l.879)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f0, %f2
	addi	%r2, %r2, -48	# subi %r2, %r2, 48
	stfs	%f2, 0(%r3)	# float
	stfs	%f1, 8(%r3)	# float
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	float_of_int.408
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 8(%r3)	# float
	fadd	%f1, %f1, %f0
	lfs	%f0, 0(%r3)	# float
	b	g.475
f.478:
	in	%r2, 0
	cmpwi	%cr7, %r2, 47
	bgt	%cr7, ble_else.1002
	cmpwi	%cr7, %r2, 46
	bne	%cr7, beq_else.1003
	addis	%r31, %r0, (l.879)@h	# lis
	ori	%r31, %r31, (l.879)@l
	lfs	%f1, 0(%r31)	# float
	fmr	%f31, %f1
	fmr	%f1, %f0
	fmr	%f0, %f31
	b	g.475
beq_else.1003:
	blr
ble_else.1002:
	cmpwi	%cr7, %r2, 58
	blt	%cr7, bge_else.1004
	blr
bge_else.1004:
	addis	%r31, %r0, (l.880)@h	# lis
	ori	%r31, %r31, (l.880)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addi	%r2, %r2, -48	# subi %r2, %r2, 48
	stfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	float_of_int.408
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fadd	%f0, %f1, %f0
	b	f.478
read_float.428:
	in	%r5, 0
	cmpwi	%cr7, %r5, 45
	bne	%cr7, beq_else.1005
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	f.478
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
beq_else.1005:
	cmpwi	%cr7, %r5, 47
	bgt	%cr7, ble_else.1006
	b	read_float.428
ble_else.1006:
	cmpwi	%cr7, %r5, 58
	blt	%cr7, bge_else.1007
	b	read_float.428
bge_else.1007:
	addi	%r2, %r5, -48	# subi %r2, %r5, 48
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	float_of_int.408
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	b	f.478
is_number.430:
	cmpwi	%cr7, %r2, 48
	blt	%cr7, bge_else.1008
	cmpwi	%cr7, %r2, 57
	bgt	%cr7, ble_else.1009
	addi	%r2, %r0, 1	# li
	blr
ble_else.1009:
	addi	%r2, %r0, 0	# li
	blr
bge_else.1008:
	addi	%r2, %r0, 0	# li
	blr
print_float_sub.448:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.1010
	blr
beq_else.1010:
	addis	%r31, %r0, (l.880)@h	# lis
	ori	%r31, %r31, (l.880)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	stw	%r2, 0(%r3)
	stfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	int_of_float.406
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r2, 48
	out	%r5, 0
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	float_of_int.408
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	b	print_float_sub.448
print_float.432:
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.1013
	b	ble_cont.1014
ble_else.1013:
	addi	%r2, %r0, 45	# li
	out	%r2, 0
	fneg	%f0, %f0
ble_cont.1014:
	stfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	int_of_float.406
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	print_int.371
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 46	# li
	out	%r2, 0
	lwz	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	float_of_int.408
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	addi	%r2, %r0, 5	# li
	b	print_float_sub.448
f_sub.440:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.1015
	blr
beq_else.1015:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	b	f_sub.440
f.434:
	addi	%r2, %r0, 0	# li
	addi	%r5, %r0, 30	# li
	b	f_sub.440
_min_caml_start: # main entry point
#	main program starts
	addis	%r31, %r0, (l.881)@h	# lis
	ori	%r31, %r31, (l.881)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.882)@h	# lis
	ori	%r31, %r31, (l.882)@l
	lfs	%f0, 0(%r31)	# float
	addi	%r2, %r0, 1	# li
	addi	%r5, %r0, 3	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	f.434
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	sc
