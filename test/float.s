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
#  .comm min_caml_objects, 240
  .comm min_caml_screen, 24
  .comm	min_caml_viewpoint, 24
  .comm min_caml_light, 24
#  .comm min_caml_beam, 8
#  .comm min_caml_and_net, 200
#  .comm min_caml_or_net, 4
  .comm min_caml_solver_dist, 8
  .comm min_caml_intsec_rectside, 4
#  .comm min_caml_tmin, 8
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
#  .comm min_caml_dirvecs, 20
#  .comm min_caml_light_dirvec, 264
#  .comm min_caml_reflections, 720
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
	addi	%r4, %r4, 8
	b	create_float_array_loop
	.data
	#.literal8
	.align 3
l.901:	 # 48.300300
	.long	1111569281
	.align 3
l.900:	 # 4.500000
	.long	1083179008
	.align 3
l.899:	 # -12.300000
	.long	3242511564
	.align 3
l.898:	 # 0.000000
	.long	786163454
	.align 3
l.894:	 # 2.000000
	.long	1073741824
	.align 3
l.893:	 # 2.356195
	.long	1075235812
	.align 3
l.892:	 # 0.785398
	.long	1061752794
	.align 3
l.891:	 # 1.570796
	.long	1070141402
	.align 3
l.890:	 # 3.141593
	.long	1078530010
	.align 3
l.889:	 # 6.283185
	.long	1086918618
	.align 3
l.888:	 # 0.000000
	.long	0
	.align 3
l.887:	 # 0.001370
	.long	984842501
	.align 3
l.886:	 # 0.041664
	.long	1026205576
	.align 3
l.885:	 # 0.500000
	.long	1056964608
	.align 3
l.884:	 # 1.000000
	.long	1065353216
	.align 3
l.883:	 # 0.000196
	.long	961373365
	.align 3
l.882:	 # 0.008333
	.long	1007191653
	.align 3
l.881:	 # 0.166667
	.long	1042983595
	.text
	.globl _min_caml_start
	.align 2
mul_sub.849:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.930
	blr
beq_else.930:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r5 # swap
	and	%r6, %r6, %r8
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.931
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.931:
	slw	%r7, %r6, %r5 # swap
	add	%r2, %r2, %r6
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
mul.382:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.932
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.933
bge_else.932:
	neg	%r6, %r2
bge_cont.933:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.934
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.935
bge_else.934:
	neg	%r7, %r5
bge_cont.935:
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r8, %r0, (mul_sub.849)@h	# lis
	ori	%r8, %r8, (mul_sub.849)@l
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
	bne	%cr7, beq_else.936
	blr
beq_else.936:
	neg	%r2, %r2
	blr
div_sub.815:
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.937
	blr
beq_else.937:
	srw	%r5, %r8, %r7 # swap
	cmp	%cr7, %r6, %r8
	bgt	%cr7, ble_else.938
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7 # swap
	add	%r2, %r8, %r2
	slw	%r6, %r8, %r7 # swap
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.815
ble_else.938:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.815
div.385:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.939
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.940
bge_else.939:
	neg	%r6, %r2
bge_cont.940:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.941
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.942
bge_else.941:
	neg	%r7, %r5
bge_cont.942:
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
	bl	div_sub.815
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
	bne	%cr7, beq_else.943
	blr
beq_else.943:
	neg	%r2, %r2
	blr
print_int_sub.795:
	cmpwi	%cr7, %r2, 10
	blt	%cr7, bge_else.944
	addi	%r5, %r0, 10	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.385
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int_sub.795
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.385
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	mul.382
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	subf	%r2, %r2, %r5	# sub	%r2, %r5, %r2
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
bge_else.944:
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
print_int.390:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.947
	b	print_int_sub.795
bge_else.947:
	addi	%r5, %r0, 45	# li
	out	%r5, 0
	neg	%r2, %r2
	b	print_int_sub.795
kernel_sin.394:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	fmul	%f3, %f2, %f1
	fmul	%f1, %f3, %f1
	addis	%r31, %r0, (l.881)@h	# lis
	ori	%r31, %r31, (l.881)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f2, %f4, %f2
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.882)@h	# lis
	ori	%r31, %r31, (l.882)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.883)@h	# lis
	ori	%r31, %r31, (l.883)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	blr
kernel_cos.396:
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	addis	%r31, %r0, (l.884)@h	# lis
	ori	%r31, %r31, (l.884)@l
	lfs	%f3, 0(%r31)	# float
	addis	%r31, %r0, (l.885)@h	# lis
	ori	%r31, %r31, (l.885)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f0, %f4, %f0
	fsub	%f0, %f3, %f0
	addis	%r31, %r0, (l.886)@h	# lis
	ori	%r31, %r31, (l.886)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.887)@h	# lis
	ori	%r31, %r31, (l.887)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	blr
sin.398:
	addis	%r31, %r0, (l.888)@h	# lis
	ori	%r31, %r31, (l.888)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.948
	addis	%r31, %r0, (l.889)@h	# lis
	ori	%r31, %r31, (l.889)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.949
	addis	%r31, %r0, (l.890)@h	# lis
	ori	%r31, %r31, (l.890)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.950
	addis	%r31, %r0, (l.890)@h	# lis
	ori	%r31, %r31, (l.890)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	addis	%r31, %r0, (l.891)@h	# lis
	ori	%r31, %r31, (l.891)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.951
	addis	%r31, %r0, (l.893)@h	# lis
	ori	%r31, %r31, (l.893)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.952
	addis	%r31, %r0, (l.888)@h	# lis
	ori	%r31, %r31, (l.888)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.890)@h	# lis
	ori	%r31, %r31, (l.890)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	kernel_sin.394
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.952:
	addis	%r31, %r0, (l.888)@h	# lis
	ori	%r31, %r31, (l.888)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.891)@h	# lis
	ori	%r31, %r31, (l.891)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f0, %f2
	stfs	%f1, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	kernel_cos.396
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.951:
	addis	%r31, %r0, (l.892)@h	# lis
	ori	%r31, %r31, (l.892)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.953
	addis	%r31, %r0, (l.888)@h	# lis
	ori	%r31, %r31, (l.888)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.891)@h	# lis
	ori	%r31, %r31, (l.891)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	kernel_cos.396
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.953:
	addis	%r31, %r0, (l.888)@h	# lis
	ori	%r31, %r31, (l.888)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f1, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	kernel_sin.394
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.950:
	addis	%r31, %r0, (l.891)@h	# lis
	ori	%r31, %r31, (l.891)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.954
	addis	%r31, %r0, (l.893)@h	# lis
	ori	%r31, %r31, (l.893)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.955
	addis	%r31, %r0, (l.890)@h	# lis
	ori	%r31, %r31, (l.890)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_sin.394
ble_else.955:
	addis	%r31, %r0, (l.891)@h	# lis
	ori	%r31, %r31, (l.891)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	kernel_cos.396
ble_else.954:
	addis	%r31, %r0, (l.892)@h	# lis
	ori	%r31, %r31, (l.892)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.956
	addis	%r31, %r0, (l.891)@h	# lis
	ori	%r31, %r31, (l.891)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_cos.396
ble_else.956:
	b	kernel_sin.394
ble_else.949:
	addis	%r31, %r0, (l.889)@h	# lis
	ori	%r31, %r31, (l.889)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	sin.398
ble_else.948:
	addis	%r31, %r0, (l.888)@h	# lis
	ori	%r31, %r31, (l.888)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.888)@h	# lis
	ori	%r31, %r31, (l.888)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	sin.398
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
cos.400:
	addis	%r31, %r0, (l.888)@h	# lis
	ori	%r31, %r31, (l.888)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.957
	addis	%r31, %r0, (l.889)@h	# lis
	ori	%r31, %r31, (l.889)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.958
	addis	%r31, %r0, (l.890)@h	# lis
	ori	%r31, %r31, (l.890)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.959
	addis	%r31, %r0, (l.890)@h	# lis
	ori	%r31, %r31, (l.890)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	addis	%r31, %r0, (l.891)@h	# lis
	ori	%r31, %r31, (l.891)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.960
	addis	%r31, %r0, (l.893)@h	# lis
	ori	%r31, %r31, (l.893)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.961
	addis	%r31, %r0, (l.890)@h	# lis
	ori	%r31, %r31, (l.890)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_sin.394
ble_else.961:
	addis	%r31, %r0, (l.891)@h	# lis
	ori	%r31, %r31, (l.891)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	kernel_cos.396
ble_else.960:
	addis	%r31, %r0, (l.892)@h	# lis
	ori	%r31, %r31, (l.892)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.962
	addis	%r31, %r0, (l.888)@h	# lis
	ori	%r31, %r31, (l.888)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.891)@h	# lis
	ori	%r31, %r31, (l.891)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	kernel_cos.396
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.962:
	addis	%r31, %r0, (l.888)@h	# lis
	ori	%r31, %r31, (l.888)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f1, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	kernel_sin.394
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.959:
	addis	%r31, %r0, (l.891)@h	# lis
	ori	%r31, %r31, (l.891)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.963
	addis	%r31, %r0, (l.893)@h	# lis
	ori	%r31, %r31, (l.893)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.964
	addis	%r31, %r0, (l.888)@h	# lis
	ori	%r31, %r31, (l.888)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.890)@h	# lis
	ori	%r31, %r31, (l.890)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	kernel_cos.396
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.964:
	addis	%r31, %r0, (l.888)@h	# lis
	ori	%r31, %r31, (l.888)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.891)@h	# lis
	ori	%r31, %r31, (l.891)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f0, %f2
	stfs	%f1, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	kernel_sin.394
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.963:
	addis	%r31, %r0, (l.892)@h	# lis
	ori	%r31, %r31, (l.892)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.965
	addis	%r31, %r0, (l.891)@h	# lis
	ori	%r31, %r31, (l.891)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_sin.394
ble_else.965:
	b	kernel_cos.396
ble_else.958:
	addis	%r31, %r0, (l.889)@h	# lis
	ori	%r31, %r31, (l.889)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	sin.398
ble_else.957:
	addis	%r31, %r0, (l.888)@h	# lis
	ori	%r31, %r31, (l.888)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	cos.400
abs_float.414:
	stfs	%f0, 4(%r3)	# float
	lwz	%r2, 4(%r3)
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	stw	%r2, 4(%r3)
	lfs	%f0, 4(%r3)	# float
	blr
int_of_float.425:
	addis	%r31, %r0, (l.888)@h	# lis
	ori	%r31, %r31, (l.888)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.966
	addi	%r2, %r0, 0	# li
	blr
beq_else.966:
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
	blt	%cr7, bge_else.967
	srw	%r2, %r2, %r5 # swap
	b	bge_cont.968
bge_else.967:
	neg	%r5, %r5
	slw	%r2, %r2, %r5 # swap
bge_cont.968:
	addis	%r5, %r0, 65535	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	addis	%r31, %r0, (l.888)@h	# lis
	ori	%r31, %r31, (l.888)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.969
	blr
ble_else.969:
	neg	%r2, %r2
	blr
msb_sub.590:
	srw	%r2, %r6, %r5 # swap
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.970
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.971
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
beq_else.971:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	b	msb_sub.590
beq_else.970:
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
float_of_int.427:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.972
	addis	%r31, %r0, (l.888)@h	# lis
	ori	%r31, %r31, (l.888)@l
	lfs	%f0, 0(%r31)	# float
	blr
beq_else.972:
	addi	%r5, %r0, 31	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	msb_sub.590
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
l.558:
	lfs	%f2, 8(%r29)	# float
	fdiv	%f3, %f1, %f0
	fadd	%f3, %f0, %f3
	addis	%r31, %r0, (l.894)@h	# lis
	ori	%r31, %r31, (l.894)@l
	lfs	%f4, 0(%r31)	# float
	fdiv	%f3, %f3, %f4
	fsub	%f0, %f3, %f0
	stfs	%f1, 0(%r3)	# float
	stfs	%f3, 8(%r3)	# float
	stw	%r29, 16(%r3)
	stfs	%f2, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	abs_float.414
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.974
	lfs	%f0, 8(%r3)	# float
	lfs	%f1, 0(%r3)	# float
	lwz	%r29, 16(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
ble_else.974:
	lfs	%f0, 8(%r3)	# float
	blr
sqrt.445:
	lfs	%f1, 8(%r29)	# float
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r2, %r0, (l.558)@h	# lis
	ori	%r2, %r2, (l.558)@l
	stw	%r2, 0(%r29)
	stfs	%f1, 8(%r29)	# float
	addis	%r31, %r0, (l.894)@h	# lis
	ori	%r31, %r31, (l.894)@l
	lfs	%f1, 0(%r31)	# float
	fmr	%f31, %f1
	fmr	%f1, %f0
	fmr	%f0, %f31
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
_min_caml_start: # main entry point
#	main program starts
	addis	%r31, %r0, (l.898)@h	# lis
	ori	%r31, %r31, (l.898)@l
	lfs	%f0, 0(%r31)	# float
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 16
	addis	%r5, %r0, (sqrt.445)@h	# lis
	ori	%r5, %r5, (sqrt.445)@l
	stw	%r5, 0(%r2)
	stfs	%f0, 8(%r2)	# float
	addis	%r31, %r0, (l.899)@h	# lis
	ori	%r31, %r31, (l.899)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	abs_float.414
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
	bl	cos.400
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	sin.398
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.900)@h	# lis
	ori	%r31, %r31, (l.900)@l
	lfs	%f1, 0(%r31)	# float
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.901)@h	# lis
	ori	%r31, %r31, (l.901)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	addis	%r2, %r0, 15	# lis
	ori	%r2, %r2, 16960
	stfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	float_of_int.427
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fmul	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	int_of_float.425
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	print_int.390
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	sc
