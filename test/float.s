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
	or  %r2, %r6, %r2  # mr	%r6, %r2
	or  %r4, %r2, %r4  # mr	%r2, %r4
create_array_loop:
	cmpwi	%cr7, %r6, 0
	bne	%cr7, create_array_cont
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
	bne	%cr7, create_float_array_cont
	blr
create_float_array_cont:
	stfs	%f0, 0(%r4)
	addi  %r5, %r5, -1  # subi	%r5, %r5, 1
	addi	%r4, %r4, 4
	b	create_float_array_loop
	.data
	#.literal8
	.align 3
l.886:	 # 48.300300
	.long	1111569281
	.align 3
l.885:	 # 4.500000
	.long	1083179008
	.align 3
l.884:	 # -12.300000
	.long	3242511564
	.align 3
l.883:	 # 0.000000
	.long	646978940
	.align 3
l.882:	 # 0.000000
	.long	786163454
	.align 3
l.878:	 # 2.000000
	.long	1073741824
	.align 3
l.872:	 # 2.356195
	.long	1075235812
	.align 3
l.871:	 # 0.785398
	.long	1061752794
	.align 3
l.870:	 # 1.570796
	.long	1070141402
	.align 3
l.869:	 # 3.141593
	.long	1078530010
	.align 3
l.868:	 # 6.283185
	.long	1086918618
	.align 3
l.867:	 # 0.000000
	.long	0
	.align 3
l.866:	 # 0.001370
	.long	984842501
	.align 3
l.865:	 # 0.041664
	.long	1026205576
	.align 3
l.864:	 # 0.500000
	.long	1056964608
	.align 3
l.863:	 # 1.000000
	.long	1065353216
	.align 3
l.862:	 # 0.000196
	.long	961373365
	.align 3
l.861:	 # 0.008333
	.long	1007191653
	.align 3
l.860:	 # 0.166667
	.long	1042983595
	.text
	.globl _min_caml_start
	.align 2
mul_sub.828:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.931
	blr
beq_else.931:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r5 # swap
	and	%r6, %r6, %r8
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.932
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.932:
	slw	%r7, %r6, %r5 # swap
	add	%r2, %r2, %r6
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
mul.373:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.933
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.934
bge_else.933:
	neg	%r6, %r2
bge_cont.934:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.935
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.936
bge_else.935:
	neg	%r7, %r5
bge_cont.936:
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r8, %r0, (mul_sub.828)@h	# lis
	ori	%r8, %r8, (mul_sub.828)@l
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
	bne	%cr7, beq_else.937
	blr
beq_else.937:
	neg	%r2, %r2
	blr
div_sub.794:
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.938
	blr
beq_else.938:
	srw	%r5, %r8, %r7 # swap
	cmp	%cr7, %r6, %r8
	bgt	%cr7, ble_else.939
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7 # swap
	add	%r2, %r8, %r2
	slw	%r6, %r8, %r7 # swap
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.794
ble_else.939:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.794
div.376:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.940
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.941
bge_else.940:
	neg	%r6, %r2
bge_cont.941:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.942
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
	addi	%r1, %r0, 31	# lis
	srw	%r5, %r5, %r1 # swap
	lwz	%r6, 0(%r3)
	addi	%r1, %r0, 31	# lis
	srw	%r6, %r6, %r1 # swap
	xor	%r5, %r5, %r6
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.944
	blr
beq_else.944:
	neg	%r2, %r2
	blr
print_int_sub.774:
	cmpwi	%cr7, %r2, 10
	blt	%cr7, bge_else.945
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
	blt	%cr7, bge_else.948
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
	addis	%r31, %r0, (l.860)@h	# lis
	ori	%r31, %r31, (l.860)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f2, %f4, %f2
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.861)@h	# lis
	ori	%r31, %r31, (l.861)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.862)@h	# lis
	ori	%r31, %r31, (l.862)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	blr
kernel_cos.387:
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	addis	%r31, %r0, (l.863)@h	# lis
	ori	%r31, %r31, (l.863)@l
	lfs	%f3, 0(%r31)	# float
	addis	%r31, %r0, (l.864)@h	# lis
	ori	%r31, %r31, (l.864)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f0, %f4, %f0
	fsub	%f0, %f3, %f0
	addis	%r31, %r0, (l.865)@h	# lis
	ori	%r31, %r31, (l.865)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.866)@h	# lis
	ori	%r31, %r31, (l.866)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	blr
sin.389:
	addis	%r31, %r0, (l.867)@h	# lis
	ori	%r31, %r31, (l.867)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.949
	addis	%r31, %r0, (l.868)@h	# lis
	ori	%r31, %r31, (l.868)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.950
	addis	%r31, %r0, (l.869)@h	# lis
	ori	%r31, %r31, (l.869)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.951
	addis	%r31, %r0, (l.869)@h	# lis
	ori	%r31, %r31, (l.869)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	addis	%r31, %r0, (l.870)@h	# lis
	ori	%r31, %r31, (l.870)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.952
	addis	%r31, %r0, (l.872)@h	# lis
	ori	%r31, %r31, (l.872)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.953
	addis	%r31, %r0, (l.867)@h	# lis
	ori	%r31, %r31, (l.867)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.869)@h	# lis
	ori	%r31, %r31, (l.869)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	kernel_sin.385
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.953:
	addis	%r31, %r0, (l.867)@h	# lis
	ori	%r31, %r31, (l.867)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.870)@h	# lis
	ori	%r31, %r31, (l.870)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f0, %f2
	stfs	%f1, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	kernel_cos.387
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.952:
	addis	%r31, %r0, (l.871)@h	# lis
	ori	%r31, %r31, (l.871)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.954
	addis	%r31, %r0, (l.867)@h	# lis
	ori	%r31, %r31, (l.867)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.870)@h	# lis
	ori	%r31, %r31, (l.870)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	kernel_cos.387
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.954:
	addis	%r31, %r0, (l.867)@h	# lis
	ori	%r31, %r31, (l.867)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f1, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	kernel_sin.385
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.951:
	addis	%r31, %r0, (l.870)@h	# lis
	ori	%r31, %r31, (l.870)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.955
	addis	%r31, %r0, (l.872)@h	# lis
	ori	%r31, %r31, (l.872)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.956
	addis	%r31, %r0, (l.869)@h	# lis
	ori	%r31, %r31, (l.869)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_sin.385
ble_else.956:
	addis	%r31, %r0, (l.870)@h	# lis
	ori	%r31, %r31, (l.870)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	kernel_cos.387
ble_else.955:
	addis	%r31, %r0, (l.871)@h	# lis
	ori	%r31, %r31, (l.871)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.957
	addis	%r31, %r0, (l.870)@h	# lis
	ori	%r31, %r31, (l.870)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_cos.387
ble_else.957:
	b	kernel_sin.385
ble_else.950:
	addis	%r31, %r0, (l.868)@h	# lis
	ori	%r31, %r31, (l.868)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	sin.389
ble_else.949:
	addis	%r31, %r0, (l.867)@h	# lis
	ori	%r31, %r31, (l.867)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.867)@h	# lis
	ori	%r31, %r31, (l.867)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	sin.389
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
cos.391:
	addis	%r31, %r0, (l.867)@h	# lis
	ori	%r31, %r31, (l.867)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.958
	addis	%r31, %r0, (l.868)@h	# lis
	ori	%r31, %r31, (l.868)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.959
	addis	%r31, %r0, (l.869)@h	# lis
	ori	%r31, %r31, (l.869)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.960
	addis	%r31, %r0, (l.869)@h	# lis
	ori	%r31, %r31, (l.869)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	addis	%r31, %r0, (l.870)@h	# lis
	ori	%r31, %r31, (l.870)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.961
	addis	%r31, %r0, (l.872)@h	# lis
	ori	%r31, %r31, (l.872)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.962
	addis	%r31, %r0, (l.869)@h	# lis
	ori	%r31, %r31, (l.869)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_sin.385
ble_else.962:
	addis	%r31, %r0, (l.870)@h	# lis
	ori	%r31, %r31, (l.870)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	kernel_cos.387
ble_else.961:
	addis	%r31, %r0, (l.871)@h	# lis
	ori	%r31, %r31, (l.871)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.963
	addis	%r31, %r0, (l.867)@h	# lis
	ori	%r31, %r31, (l.867)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.870)@h	# lis
	ori	%r31, %r31, (l.870)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	kernel_cos.387
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.963:
	addis	%r31, %r0, (l.867)@h	# lis
	ori	%r31, %r31, (l.867)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f1, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	kernel_sin.385
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.960:
	addis	%r31, %r0, (l.870)@h	# lis
	ori	%r31, %r31, (l.870)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.964
	addis	%r31, %r0, (l.872)@h	# lis
	ori	%r31, %r31, (l.872)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.965
	addis	%r31, %r0, (l.867)@h	# lis
	ori	%r31, %r31, (l.867)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.869)@h	# lis
	ori	%r31, %r31, (l.869)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	kernel_cos.387
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.965:
	addis	%r31, %r0, (l.867)@h	# lis
	ori	%r31, %r31, (l.867)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.870)@h	# lis
	ori	%r31, %r31, (l.870)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f0, %f2
	stfs	%f1, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	kernel_sin.385
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.964:
	addis	%r31, %r0, (l.871)@h	# lis
	ori	%r31, %r31, (l.871)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.966
	addis	%r31, %r0, (l.870)@h	# lis
	ori	%r31, %r31, (l.870)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_sin.385
ble_else.966:
	b	kernel_cos.387
ble_else.959:
	addis	%r31, %r0, (l.868)@h	# lis
	ori	%r31, %r31, (l.868)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	sin.389
ble_else.958:
	addis	%r31, %r0, (l.867)@h	# lis
	ori	%r31, %r31, (l.867)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	cos.391
abs_float.405:
	stfs	%f0, 4(%r3)	# float
	lwz	%r2, 4(%r3)
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	stw	%r2, 4(%r3)
	lfs	%f0, 4(%r3)	# float
	blr
int_of_float.416:
	addis	%r31, %r0, (l.867)@h	# lis
	ori	%r31, %r31, (l.867)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.967
	addi	%r2, %r0, 0	# li
	blr
beq_else.967:
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
	blt	%cr7, bge_else.968
	srw	%r2, %r2, %r5 # swap
	b	bge_cont.969
bge_else.968:
	neg	%r5, %r5
	slw	%r2, %r2, %r5 # swap
bge_cont.969:
	addis	%r5, %r0, 65535	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	addis	%r31, %r0, (l.867)@h	# lis
	ori	%r31, %r31, (l.867)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.970
	blr
ble_else.970:
	neg	%r2, %r2
	blr
msb_sub.569:
	srw	%r2, %r6, %r5 # swap
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.971
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.972
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
	bne	%cr7, beq_else.973
	addis	%r31, %r0, (l.867)@h	# lis
	ori	%r31, %r31, (l.867)@l
	lfs	%f0, 0(%r31)	# float
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
deriv.424:
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
xn_plus_one.428:
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
	bl	deriv.424
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fdiv	%f0, %f1, %f0
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
newton.551:
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
	bl	abs_float.405
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.977
	lfs	%f0, 24(%r3)	# float
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
ble_else.977:
	lfs	%f0, 24(%r3)	# float
	blr
newton_sub.431:
	lwz	%r5, 12(%r29)
	lfs	%f1, 8(%r29)	# float
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r6, %r0, (newton.551)@h	# lis
	ori	%r6, %r6, (newton.551)@l
	stw	%r6, 0(%r29)
	stw	%r5, 12(%r29)
	stfs	%f1, 8(%r29)	# float
	stw	%r2, 4(%r29)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
f.547:
	lfs	%f1, 8(%r29)	# float
	fmul	%f0, %f0, %f0
	fsub	%f0, %f0, %f1
	blr
sqrt.434:
	lwz	%r29, 4(%r29)
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 16
	addis	%r5, %r0, (f.547)@h	# lis
	ori	%r5, %r5, (f.547)@l
	stw	%r5, 0(%r2)
	stfs	%f0, 8(%r2)	# float
	addis	%r31, %r0, (l.878)@h	# lis
	ori	%r31, %r31, (l.878)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
_min_caml_start: # main entry point
#	main program starts
	addis	%r31, %r0, (l.882)@h	# lis
	ori	%r31, %r31, (l.882)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.883)@h	# lis
	ori	%r31, %r31, (l.883)@l
	lfs	%f1, 0(%r31)	# float
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 16
	addis	%r5, %r0, (xn_plus_one.428)@h	# lis
	ori	%r5, %r5, (xn_plus_one.428)@l
	stw	%r5, 0(%r2)
	stfs	%f0, 8(%r2)	# float
	or	%r4, %r5, %r4	# mr %r5, %r4
	addi	%r4, %r4, 16
	addis	%r6, %r0, (newton_sub.431)@h	# lis
	ori	%r6, %r6, (newton_sub.431)@l
	stw	%r6, 0(%r5)
	stw	%r2, 12(%r5)
	stfs	%f1, 8(%r5)	# float
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 8
	addis	%r6, %r0, (sqrt.434)@h	# lis
	ori	%r6, %r6, (sqrt.434)@l
	stw	%r6, 0(%r2)
	stw	%r5, 4(%r2)
	addis	%r31, %r0, (l.884)@h	# lis
	ori	%r31, %r31, (l.884)@l
	lfs	%f0, 0(%r31)	# float
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
	addis	%r31, %r0, (l.885)@h	# lis
	ori	%r31, %r31, (l.885)@l
	lfs	%f1, 0(%r31)	# float
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.886)@h	# lis
	ori	%r31, %r31, (l.886)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	addis	%r2, %r0, 15	# lis
	ori	%r2, %r2, 16960
	stfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	float_of_int.418
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
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
	sc
