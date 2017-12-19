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
l.7744:	 # 0.000000
	.long	786163454
	.align 3
l.7741:	 # 128.000000
	.long	1124073472
	.align 3
l.7708:	 # 0.900000
	.long	1063675494
	.align 3
l.7614:	 # 150.000000
	.long	1125515264
	.align 3
l.7612:	 # -150.000000
	.long	3272998912
	.align 3
l.7594:	 # -2.000000
	.long	3221225472
	.align 3
l.7592:	 # 0.003906
	.long	998244352
	.align 3
l.7570:	 # 20.000000
	.long	1101004800
	.align 3
l.7569:	 # 0.050000
	.long	1028443340
	.align 3
l.7565:	 # 0.250000
	.long	1048576000
	.align 3
l.7558:	 # 0.300000
	.long	1050253721
	.align 3
l.7557:	 # 255.000000
	.long	1132396544
	.align 3
l.7556:	 # 0.150000
	.long	1041865113
	.align 3
l.7554:	 # 3.141593
	.long	1078530010
	.align 3
l.7553:	 # 30.000000
	.long	1106247680
	.align 3
l.7552:	 # 15.000000
	.long	1097859072
	.align 3
l.7551:	 # 0.000100
	.long	953267991
	.align 3
l.7508:	 # 100000000.000000
	.long	1287568416
	.align 3
l.7504:	 # 1000000000.000000
	.long	1315859240
	.align 3
l.7484:	 # -0.100000
	.long	3184315596
	.align 3
l.7471:	 # 0.010000
	.long	1008981770
	.align 3
l.7470:	 # -0.200000
	.long	3192704204
	.align 3
l.7246:	 # -200.000000
	.long	3276275712
	.align 3
l.7244:	 # 200.000000
	.long	1128792064
	.align 3
l.7240:	 # 0.017453
	.long	1016003125
	.align 3
l.7157:	 # -1.000000
	.long	3212836864
	.align 3
l.7156:	 # 10.000000
	.long	1092616192
	.align 3
l.7155:	 # 0.100000
	.long	1036831948
	.align 3
l.7151:	 # 2.000000
	.long	1073741824
	.align 3
l.7150:	 # 1.570796
	.long	1070141402
	.align 3
l.7149:	 # 0.785398
	.long	1061752794
	.align 3
l.7148:	 # 2.437500
	.long	1075576832
	.align 3
l.7147:	 # 0.437500
	.long	1054867456
	.align 3
l.7146:	 # 0.060035
	.long	1031137220
	.align 3
l.7145:	 # 0.089764
	.long	1035458157
	.align 3
l.7144:	 # 0.111111
	.long	1038323255
	.align 3
l.7143:	 # 0.142857
	.long	1041385764
	.align 3
l.7142:	 # 0.200000
	.long	1045220556
	.align 3
l.7141:	 # 0.333333
	.long	1051372201
	.align 3
l.7140:	 # 2.356195
	.long	1075235812
	.align 3
l.7139:	 # 0.785398
	.long	1061752794
	.align 3
l.7138:	 # 1.570796
	.long	1070141402
	.align 3
l.7137:	 # 3.141593
	.long	1078530010
	.align 3
l.7136:	 # 6.283185
	.long	1086918618
	.align 3
l.7135:	 # 0.000000
	.long	0
	.align 3
l.7134:	 # 0.001370
	.long	984842501
	.align 3
l.7133:	 # 0.041664
	.long	1026205576
	.align 3
l.7132:	 # 0.500000
	.long	1056964608
	.align 3
l.7131:	 # 1.000000
	.long	1065353216
	.align 3
l.7130:	 # 0.000196
	.long	961373365
	.align 3
l.7129:	 # 0.008333
	.long	1007191653
	.align 3
l.7128:	 # 0.166667
	.long	1042983595
	.text
	.globl _min_caml_start
	.align 2
mul_sub.7096:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.9379
	blr
beq_else.9379:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r5 # swap
	and	%r6, %r6, %r8
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.9380
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.9380:
	slw	%r7, %r6, %r5 # swap
	add	%r2, %r2, %r6
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
mul.2961:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9381
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.9382
bge_else.9381:
	neg	%r6, %r2
bge_cont.9382:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.9383
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.9384
bge_else.9383:
	neg	%r7, %r5
bge_cont.9384:
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r8, %r0, (mul_sub.7096)@h	# lis
	ori	%r8, %r8, (mul_sub.7096)@l
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
	bne	%cr7, beq_else.9385
	blr
beq_else.9385:
	neg	%r2, %r2
	blr
div_sub.7062:
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.9386
	blr
beq_else.9386:
	srw	%r5, %r8, %r7 # swap
	cmp	%cr7, %r6, %r8
	bgt	%cr7, ble_else.9387
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7 # swap
	add	%r2, %r8, %r2
	slw	%r6, %r8, %r7 # swap
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.7062
ble_else.9387:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.7062
div.2964:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9388
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.9389
bge_else.9388:
	neg	%r6, %r2
bge_cont.9389:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.9390
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.9391
bge_else.9390:
	neg	%r7, %r5
bge_cont.9391:
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
	bl	div_sub.7062
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
	bne	%cr7, beq_else.9392
	blr
beq_else.9392:
	neg	%r2, %r2
	blr
print_int_sub.7042:
	cmpwi	%cr7, %r2, 10
	blt	%cr7, bge_else.9393
	addi	%r5, %r0, 10	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.2964
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int_sub.7042
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.2964
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	mul.2961
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	subf	%r2, %r2, %r5	# sub	%r2, %r5, %r2
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
bge_else.9393:
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
print_int.2969:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9396
	b	print_int_sub.7042
bge_else.9396:
	addi	%r5, %r0, 45	# li
	out	%r5, 0
	neg	%r2, %r2
	b	print_int_sub.7042
print_char.2971:
	out	%r2, 0
	blr
kernel_sin.2973:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	fmul	%f3, %f2, %f1
	fmul	%f1, %f3, %f1
	addis	%r31, %r0, (l.7128)@h	# lis
	ori	%r31, %r31, (l.7128)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f2, %f4, %f2
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.7129)@h	# lis
	ori	%r31, %r31, (l.7129)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.7130)@h	# lis
	ori	%r31, %r31, (l.7130)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	blr
kernel_cos.2975:
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f3, 0(%r31)	# float
	addis	%r31, %r0, (l.7132)@h	# lis
	ori	%r31, %r31, (l.7132)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f0, %f4, %f0
	fsub	%f0, %f3, %f0
	addis	%r31, %r0, (l.7133)@h	# lis
	ori	%r31, %r31, (l.7133)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.7134)@h	# lis
	ori	%r31, %r31, (l.7134)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	blr
sin.2977:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9398
	addis	%r31, %r0, (l.7136)@h	# lis
	ori	%r31, %r31, (l.7136)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.9399
	addis	%r31, %r0, (l.7137)@h	# lis
	ori	%r31, %r31, (l.7137)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9400
	addis	%r31, %r0, (l.7137)@h	# lis
	ori	%r31, %r31, (l.7137)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	addis	%r31, %r0, (l.7138)@h	# lis
	ori	%r31, %r31, (l.7138)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9401
	addis	%r31, %r0, (l.7140)@h	# lis
	ori	%r31, %r31, (l.7140)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9402
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7137)@h	# lis
	ori	%r31, %r31, (l.7137)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	kernel_sin.2973
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9402:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7138)@h	# lis
	ori	%r31, %r31, (l.7138)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f0, %f2
	stfs	%f1, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	kernel_cos.2975
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9401:
	addis	%r31, %r0, (l.7139)@h	# lis
	ori	%r31, %r31, (l.7139)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9403
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7138)@h	# lis
	ori	%r31, %r31, (l.7138)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	kernel_cos.2975
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9403:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f1, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	kernel_sin.2973
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9400:
	addis	%r31, %r0, (l.7138)@h	# lis
	ori	%r31, %r31, (l.7138)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9404
	addis	%r31, %r0, (l.7140)@h	# lis
	ori	%r31, %r31, (l.7140)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9405
	addis	%r31, %r0, (l.7137)@h	# lis
	ori	%r31, %r31, (l.7137)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_sin.2973
ble_else.9405:
	addis	%r31, %r0, (l.7138)@h	# lis
	ori	%r31, %r31, (l.7138)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	kernel_cos.2975
ble_else.9404:
	addis	%r31, %r0, (l.7139)@h	# lis
	ori	%r31, %r31, (l.7139)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9406
	addis	%r31, %r0, (l.7138)@h	# lis
	ori	%r31, %r31, (l.7138)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_cos.2975
ble_else.9406:
	b	kernel_sin.2973
ble_else.9399:
	addis	%r31, %r0, (l.7136)@h	# lis
	ori	%r31, %r31, (l.7136)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	sin.2977
ble_else.9398:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	sin.2977
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
cos.2979:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9407
	addis	%r31, %r0, (l.7136)@h	# lis
	ori	%r31, %r31, (l.7136)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.9408
	addis	%r31, %r0, (l.7137)@h	# lis
	ori	%r31, %r31, (l.7137)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9409
	addis	%r31, %r0, (l.7137)@h	# lis
	ori	%r31, %r31, (l.7137)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	addis	%r31, %r0, (l.7138)@h	# lis
	ori	%r31, %r31, (l.7138)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9410
	addis	%r31, %r0, (l.7140)@h	# lis
	ori	%r31, %r31, (l.7140)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9411
	addis	%r31, %r0, (l.7137)@h	# lis
	ori	%r31, %r31, (l.7137)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_sin.2973
ble_else.9411:
	addis	%r31, %r0, (l.7138)@h	# lis
	ori	%r31, %r31, (l.7138)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	kernel_cos.2975
ble_else.9410:
	addis	%r31, %r0, (l.7139)@h	# lis
	ori	%r31, %r31, (l.7139)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9412
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7138)@h	# lis
	ori	%r31, %r31, (l.7138)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	kernel_cos.2975
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9412:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f1, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	kernel_sin.2973
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9409:
	addis	%r31, %r0, (l.7138)@h	# lis
	ori	%r31, %r31, (l.7138)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9413
	addis	%r31, %r0, (l.7140)@h	# lis
	ori	%r31, %r31, (l.7140)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9414
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7137)@h	# lis
	ori	%r31, %r31, (l.7137)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	kernel_cos.2975
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9414:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7138)@h	# lis
	ori	%r31, %r31, (l.7138)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f0, %f2
	stfs	%f1, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	kernel_sin.2973
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9413:
	addis	%r31, %r0, (l.7139)@h	# lis
	ori	%r31, %r31, (l.7139)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9415
	addis	%r31, %r0, (l.7138)@h	# lis
	ori	%r31, %r31, (l.7138)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_sin.2973
ble_else.9415:
	b	kernel_cos.2975
ble_else.9408:
	addis	%r31, %r0, (l.7136)@h	# lis
	ori	%r31, %r31, (l.7136)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	sin.2977
ble_else.9407:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	cos.2979
kernel_atan.2981:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	fmul	%f3, %f2, %f1
	fmul	%f4, %f3, %f1
	fmul	%f5, %f4, %f1
	fmul	%f6, %f5, %f1
	fmul	%f1, %f6, %f1
	addis	%r31, %r0, (l.7141)@h	# lis
	ori	%r31, %r31, (l.7141)@l
	lfs	%f7, 0(%r31)	# float
	fmul	%f2, %f7, %f2
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.7142)@h	# lis
	ori	%r31, %r31, (l.7142)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.7143)@h	# lis
	ori	%r31, %r31, (l.7143)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f4
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.7144)@h	# lis
	ori	%r31, %r31, (l.7144)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f5
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.7145)@h	# lis
	ori	%r31, %r31, (l.7145)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f6
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.7146)@h	# lis
	ori	%r31, %r31, (l.7146)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f1, %f2, %f1
	fadd	%f0, %f0, %f1
	blr
atan.2983:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.9416
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.7147)@h	# lis
	ori	%r31, %r31, (l.7147)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9417
	addis	%r31, %r0, (l.7148)@h	# lis
	ori	%r31, %r31, (l.7148)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9418
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7150)@h	# lis
	ori	%r31, %r31, (l.7150)@l
	lfs	%f2, 0(%r31)	# float
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f3, 0(%r31)	# float
	fdiv	%f0, %f3, %f0
	stfs	%f1, 0(%r3)	# float
	stfs	%f2, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	kernel_atan.2981
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9418:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7149)@h	# lis
	ori	%r31, %r31, (l.7149)@l
	lfs	%f2, 0(%r31)	# float
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f3, 0(%r31)	# float
	fsub	%f3, %f0, %f3
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f4, 0(%r31)	# float
	fadd	%f0, %f0, %f4
	fdiv	%f0, %f3, %f0
	stfs	%f1, 16(%r3)	# float
	stfs	%f2, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	kernel_atan.2981
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fadd	%f0, %f1, %f0
	lfs	%f1, 16(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9417:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f1, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	kernel_atan.2981
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9416:
	addis	%r31, %r0, (l.7147)@h	# lis
	ori	%r31, %r31, (l.7147)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9419
	addis	%r31, %r0, (l.7148)@h	# lis
	ori	%r31, %r31, (l.7148)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9420
	addis	%r31, %r0, (l.7150)@h	# lis
	ori	%r31, %r31, (l.7150)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f2, 0(%r31)	# float
	fdiv	%f0, %f2, %f0
	stfs	%f1, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	kernel_atan.2981
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 40(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9420:
	addis	%r31, %r0, (l.7149)@h	# lis
	ori	%r31, %r31, (l.7149)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f2, %f0, %f2
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f3, 0(%r31)	# float
	fadd	%f0, %f0, %f3
	fdiv	%f0, %f2, %f0
	stfs	%f1, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	kernel_atan.2981
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 48(%r3)	# float
	fadd	%f0, %f1, %f0
	blr
ble_else.9419:
	b	kernel_atan.2981
fiszero.2985:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.9421
	addi	%r2, %r0, 1	# li
	blr
beq_else.9421:
	addi	%r2, %r0, 0	# li
	blr
fispos.2987:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.9422
	addi	%r2, %r0, 0	# li
	blr
ble_else.9422:
	addi	%r2, %r0, 1	# li
	blr
fisneg.2989:
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	fispos.2987
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9423
	addi	%r2, %r0, 1	# li
	blr
beq_else.9423:
	addi	%r2, %r0, 0	# li
	blr
fneg.2991:
	fneg	%f0, %f0
	blr
abs_float.2993:
	stfs	%f0, 4(%r3)	# float
	lwz	%r2, 4(%r3)
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	stw	%r2, 4(%r3)
	lfs	%f0, 4(%r3)	# float
	blr
fabs.2995:
	b	abs_float.2993
fless.2997:
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9424
	addi	%r2, %r0, 0	# li
	blr
ble_else.9424:
	addi	%r2, %r0, 1	# li
	blr
fhalf.3000:
	addis	%r31, %r0, (l.7151)@h	# lis
	ori	%r31, %r31, (l.7151)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	blr
fsqr.3002:
	fmul	%f0, %f0, %f0
	blr
int_of_float.3004:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.9425
	addi	%r2, %r0, 0	# li
	blr
beq_else.9425:
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
	blt	%cr7, bge_else.9426
	srw	%r2, %r2, %r5 # swap
	b	bge_cont.9427
bge_else.9426:
	neg	%r5, %r5
	slw	%r2, %r2, %r5 # swap
bge_cont.9427:
	addis	%r5, %r0, 65535	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9428
	blr
ble_else.9428:
	neg	%r2, %r2
	blr
msb_sub.6837:
	srw	%r2, %r6, %r5 # swap
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.9429
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9430
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
beq_else.9430:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	b	msb_sub.6837
beq_else.9429:
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
float_of_int.3006:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9431
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	blr
beq_else.9431:
	addi	%r5, %r0, 31	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	msb_sub.6837
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
floor.3008:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9432
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	int_of_float.3004
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	b	float_of_int.3006
ble_else.9432:
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	int_of_float.3004
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	b	float_of_int.3006
l.6805:
	lfs	%f2, 8(%r29)	# float
	fdiv	%f3, %f1, %f0
	fadd	%f3, %f0, %f3
	addis	%r31, %r0, (l.7151)@h	# lis
	ori	%r31, %r31, (l.7151)@l
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
	bl	abs_float.2993
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9434
	lfs	%f0, 8(%r3)	# float
	lfs	%f1, 0(%r3)	# float
	lwz	%r29, 16(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
ble_else.9434:
	lfs	%f0, 8(%r3)	# float
	blr
sqrt.3024:
	lfs	%f1, 8(%r29)	# float
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r2, %r0, (l.6805)@h	# lis
	ori	%r2, %r2, (l.6805)@l
	stw	%r2, 0(%r29)
	stfs	%f1, 8(%r29)	# float
	addis	%r31, %r0, (l.7151)@h	# lis
	ori	%r31, %r31, (l.7151)@l
	lfs	%f1, 0(%r31)	# float
	fmr	%f31, %f1
	fmr	%f1, %f0
	fmr	%f0, %f31
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
f.6785:
	in	%r5, 0
	cmpwi	%cr7, %r5, 47
	bgt	%cr7, ble_else.9435
	blr
ble_else.9435:
	cmpwi	%cr7, %r5, 58
	blt	%cr7, bge_else.9436
	blr
bge_else.9436:
	addi	%r6, %r0, 10	# li
	stw	%r5, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	mul.2961
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	addi	%r5, %r5, -48	# subi %r5, %r5, 48
	add	%r2, %r2, %r5
	b	f.6785
read_int.3026:
	in	%r2, 0
	cmpwi	%cr7, %r2, 45
	bne	%cr7, beq_else.9437
	addi	%r2, %r0, 0	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	f.6785
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	neg	%r2, %r2
	blr
beq_else.9437:
	cmpwi	%cr7, %r2, 47
	bgt	%cr7, ble_else.9438
	b	read_int.3026
ble_else.9438:
	cmpwi	%cr7, %r2, 58
	blt	%cr7, bge_else.9439
	b	read_int.3026
bge_else.9439:
	addi	%r2, %r2, -48	# subi %r2, %r2, 48
	b	f.6785
g.6746:
	in	%r2, 0
	cmpwi	%cr7, %r2, 47
	bgt	%cr7, ble_else.9440
	fmr	%f0, %f1
	blr
ble_else.9440:
	cmpwi	%cr7, %r2, 58
	blt	%cr7, bge_else.9441
	fmr	%f0, %f1
	blr
bge_else.9441:
	addis	%r31, %r0, (l.7155)@h	# lis
	ori	%r31, %r31, (l.7155)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f0, %f2
	addi	%r2, %r2, -48	# subi %r2, %r2, 48
	stfs	%f2, 0(%r3)	# float
	stfs	%f1, 8(%r3)	# float
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	float_of_int.3006
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 8(%r3)	# float
	fadd	%f1, %f1, %f0
	lfs	%f0, 0(%r3)	# float
	b	g.6746
f.6749:
	in	%r2, 0
	cmpwi	%cr7, %r2, 47
	bgt	%cr7, ble_else.9442
	cmpwi	%cr7, %r2, 46
	bne	%cr7, beq_else.9443
	addis	%r31, %r0, (l.7155)@h	# lis
	ori	%r31, %r31, (l.7155)@l
	lfs	%f1, 0(%r31)	# float
	fmr	%f31, %f1
	fmr	%f1, %f0
	fmr	%f0, %f31
	b	g.6746
beq_else.9443:
	blr
ble_else.9442:
	cmpwi	%cr7, %r2, 58
	blt	%cr7, bge_else.9444
	blr
bge_else.9444:
	addis	%r31, %r0, (l.7156)@h	# lis
	ori	%r31, %r31, (l.7156)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addi	%r2, %r2, -48	# subi %r2, %r2, 48
	stfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	float_of_int.3006
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fadd	%f0, %f1, %f0
	b	f.6749
read_float.3028:
	in	%r2, 0
	cmpwi	%cr7, %r2, 45
	bne	%cr7, beq_else.9445
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	f.6749
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
beq_else.9445:
	cmpwi	%cr7, %r2, 47
	bgt	%cr7, ble_else.9446
	b	read_float.3028
ble_else.9446:
	cmpwi	%cr7, %r2, 58
	blt	%cr7, bge_else.9447
	b	read_float.3028
bge_else.9447:
	addi	%r2, %r2, -48	# subi %r2, %r2, 48
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	float_of_int.3006
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	b	f.6749
sgn.3034:
	stfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fiszero.2985
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9448
	lfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fispos.2987
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9449
	addis	%r31, %r0, (l.7157)@h	# lis
	ori	%r31, %r31, (l.7157)@l
	lfs	%f0, 0(%r31)	# float
	blr
beq_else.9449:
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f0, 0(%r31)	# float
	blr
beq_else.9448:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	blr
fneg_cond.3036:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9450
	b	fneg.2991
beq_else.9450:
	blr
add_mod5.3039:
	add	%r2, %r2, %r5
	cmpwi	%cr7, %r2, 5
	blt	%cr7, bge_else.9451
	addi	%r2, %r2, -5	# subi %r2, %r2, 5
	blr
bge_else.9451:
	blr
vecset.3042:
	stfs	%f0, 0(%r2)	# float
	stfs	%f1, 8(%r2)	# float
	stfs	%f2, 16(%r2)	# float
	blr
vecfill.3047:
	stfs	%f0, 0(%r2)	# float
	stfs	%f0, 8(%r2)	# float
	stfs	%f0, 16(%r2)	# float
	blr
vecbzero.3050:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	b	vecfill.3047
veccpy.3052:
	lfs	%f0, 0(%r5)	# float
	stfs	%f0, 0(%r2)	# float
	lfs	%f0, 8(%r5)	# float
	stfs	%f0, 8(%r2)	# float
	lfs	%f0, 16(%r5)	# float
	stfs	%f0, 16(%r2)	# float
	blr
vecunit_sgn.3060:
	lwz	%r6, 4(%r29)
	lfs	%f0, 0(%r2)	# float
	stw	%r5, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fsqr.3002
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	lfs	%f1, 8(%r2)	# float
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fsqr.3002
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fadd	%f0, %f1, %f0
	lwz	%r2, 8(%r3)
	lfs	%f1, 16(%r2)	# float
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fsqr.3002
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fadd	%f0, %f1, %f0
	lwz	%r29, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fiszero.2985
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9456
	lwz	%r2, 0(%r3)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9458
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 32(%r3)	# float
	fdiv	%f0, %f0, %f1
	b	beq_cont.9459
beq_else.9458:
	addis	%r31, %r0, (l.7157)@h	# lis
	ori	%r31, %r31, (l.7157)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 32(%r3)	# float
	fdiv	%f0, %f0, %f1
beq_cont.9459:
	b	beq_cont.9457
beq_else.9456:
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.9457:
	lwz	%r2, 8(%r3)
	lfs	%f1, 0(%r2)	# float
	fmul	%f1, %f1, %f0
	stfs	%f1, 0(%r2)	# float
	lfs	%f1, 8(%r2)	# float
	fmul	%f1, %f1, %f0
	stfs	%f1, 8(%r2)	# float
	lfs	%f1, 16(%r2)	# float
	fmul	%f0, %f1, %f0
	stfs	%f0, 16(%r2)	# float
	blr
veciprod.3063:
	lfs	%f0, 0(%r2)	# float
	lfs	%f1, 0(%r5)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 8(%r2)	# float
	lfs	%f2, 8(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 16(%r2)	# float
	lfs	%f2, 16(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	blr
veciprod2.3066:
	lfs	%f3, 0(%r2)	# float
	fmul	%f0, %f3, %f0
	lfs	%f3, 8(%r2)	# float
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	lfs	%f1, 16(%r2)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	blr
vecaccum.3071:
	lfs	%f1, 0(%r2)	# float
	lfs	%f2, 0(%r5)	# float
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	stfs	%f1, 0(%r2)	# float
	lfs	%f1, 8(%r2)	# float
	lfs	%f2, 8(%r5)	# float
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	stfs	%f1, 8(%r2)	# float
	lfs	%f1, 16(%r2)	# float
	lfs	%f2, 16(%r5)	# float
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	stfs	%f0, 16(%r2)	# float
	blr
vecadd.3075:
	lfs	%f0, 0(%r2)	# float
	lfs	%f1, 0(%r5)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 0(%r2)	# float
	lfs	%f0, 8(%r2)	# float
	lfs	%f1, 8(%r5)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 8(%r2)	# float
	lfs	%f0, 16(%r2)	# float
	lfs	%f1, 16(%r5)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 16(%r2)	# float
	blr
vecscale.3081:
	lfs	%f1, 0(%r2)	# float
	fmul	%f1, %f1, %f0
	stfs	%f1, 0(%r2)	# float
	lfs	%f1, 8(%r2)	# float
	fmul	%f1, %f1, %f0
	stfs	%f1, 8(%r2)	# float
	lfs	%f1, 16(%r2)	# float
	fmul	%f0, %f1, %f0
	stfs	%f0, 16(%r2)	# float
	blr
vecaccumv.3084:
	lfs	%f0, 0(%r2)	# float
	lfs	%f1, 0(%r5)	# float
	lfs	%f2, 0(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 0(%r2)	# float
	lfs	%f0, 8(%r2)	# float
	lfs	%f1, 8(%r5)	# float
	lfs	%f2, 8(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 8(%r2)	# float
	lfs	%f0, 16(%r2)	# float
	lfs	%f1, 16(%r5)	# float
	lfs	%f2, 16(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 16(%r2)	# float
	blr
o_texturetype.3088:
	lwz	%r2, 0(%r2)
	blr
o_form.3090:
	lwz	%r2, 4(%r2)
	blr
o_reflectiontype.3092:
	lwz	%r2, 8(%r2)
	blr
o_isinvert.3094:
	lwz	%r2, 24(%r2)
	blr
o_isrot.3096:
	lwz	%r2, 12(%r2)
	blr
o_param_a.3098:
	lwz	%r2, 16(%r2)
	lfs	%f0, 0(%r2)	# float
	blr
o_param_b.3100:
	lwz	%r2, 16(%r2)
	lfs	%f0, 8(%r2)	# float
	blr
o_param_c.3102:
	lwz	%r2, 16(%r2)
	lfs	%f0, 16(%r2)	# float
	blr
o_param_abc.3104:
	lwz	%r2, 16(%r2)
	blr
o_param_x.3106:
	lwz	%r2, 20(%r2)
	lfs	%f0, 0(%r2)	# float
	blr
o_param_y.3108:
	lwz	%r2, 20(%r2)
	lfs	%f0, 8(%r2)	# float
	blr
o_param_z.3110:
	lwz	%r2, 20(%r2)
	lfs	%f0, 16(%r2)	# float
	blr
o_diffuse.3112:
	lwz	%r2, 28(%r2)
	lfs	%f0, 0(%r2)	# float
	blr
o_hilight.3114:
	lwz	%r2, 28(%r2)
	lfs	%f0, 8(%r2)	# float
	blr
o_color_red.3116:
	lwz	%r2, 32(%r2)
	lfs	%f0, 0(%r2)	# float
	blr
o_color_green.3118:
	lwz	%r2, 32(%r2)
	lfs	%f0, 8(%r2)	# float
	blr
o_color_blue.3120:
	lwz	%r2, 32(%r2)
	lfs	%f0, 16(%r2)	# float
	blr
o_param_r1.3122:
	lwz	%r2, 36(%r2)
	lfs	%f0, 0(%r2)	# float
	blr
o_param_r2.3124:
	lwz	%r2, 36(%r2)
	lfs	%f0, 8(%r2)	# float
	blr
o_param_r3.3126:
	lwz	%r2, 36(%r2)
	lfs	%f0, 16(%r2)	# float
	blr
o_param_ctbl.3128:
	lwz	%r2, 40(%r2)
	blr
p_rgb.3130:
	lwz	%r2, 0(%r2)
	blr
p_intersection_points.3132:
	lwz	%r2, 4(%r2)
	blr
p_surface_ids.3134:
	lwz	%r2, 8(%r2)
	blr
p_calc_diffuse.3136:
	lwz	%r2, 12(%r2)
	blr
p_energy.3138:
	lwz	%r2, 16(%r2)
	blr
p_received_ray_20percent.3140:
	lwz	%r2, 20(%r2)
	blr
p_group_id.3142:
	lwz	%r2, 24(%r2)
	lwz	%r2, 0(%r2)
	blr
p_set_group_id.3144:
	lwz	%r2, 24(%r2)
	stw	%r5, 0(%r2)
	blr
p_nvectors.3147:
	lwz	%r2, 28(%r2)
	blr
d_vec.3149:
	lwz	%r2, 0(%r2)
	blr
d_const.3151:
	lwz	%r2, 4(%r2)
	blr
r_surface_id.3153:
	lwz	%r2, 0(%r2)
	blr
r_dvec.3155:
	lwz	%r2, 4(%r2)
	blr
r_bright.3157:
	lfs	%f0, 8(%r2)	# float
	blr
rad.3159:
	addis	%r31, %r0, (l.7240)@h	# lis
	ori	%r31, %r31, (l.7240)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	blr
read_screen_settings.3161:
	addis	%r2, %r0, (min_caml_screen)@h	# lis
	ori	%r2, %r2, (min_caml_screen)@l
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_float.3028
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	stfs	%f0, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_screen)@h	# lis
	ori	%r2, %r2, (min_caml_screen)@l
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	read_float.3028
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	stfs	%f0, 8(%r2)	# float
	addis	%r2, %r0, (min_caml_screen)@h	# lis
	ori	%r2, %r2, (min_caml_screen)@l
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	read_float.3028
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	stfs	%f0, 16(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	read_float.3028
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	rad.3159
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	cos.2979
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	sin.2977
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	read_float.3028
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	rad.3159
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	cos.2979
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 40(%r3)	# float
	stfs	%f0, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	sin.2977
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_screenz_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screenz_dir)@l
	lfs	%f1, 24(%r3)	# float
	fmul	%f2, %f1, %f0
	addis	%r31, %r0, (l.7244)@h	# lis
	ori	%r31, %r31, (l.7244)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	stfs	%f2, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_screenz_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screenz_dir)@l
	addis	%r31, %r0, (l.7246)@h	# lis
	ori	%r31, %r31, (l.7246)@l
	lfs	%f2, 0(%r31)	# float
	lfs	%f3, 32(%r3)	# float
	fmul	%f2, %f3, %f2
	stfs	%f2, 8(%r2)	# float
	addis	%r2, %r0, (min_caml_screenz_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screenz_dir)@l
	lfs	%f2, 48(%r3)	# float
	fmul	%f4, %f1, %f2
	addis	%r31, %r0, (l.7244)@h	# lis
	ori	%r31, %r31, (l.7244)@l
	lfs	%f5, 0(%r31)	# float
	fmul	%f4, %f4, %f5
	stfs	%f4, 16(%r2)	# float
	addis	%r2, %r0, (min_caml_screenx_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screenx_dir)@l
	stfs	%f2, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_screenx_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screenx_dir)@l
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f4, 0(%r31)	# float
	stfs	%f4, 8(%r2)	# float
	addis	%r2, %r0, (min_caml_screenx_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screenx_dir)@l
	stfs	%f0, 56(%r3)	# float
	stw	%r2, 64(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fneg.2991
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 64(%r3)
	stfs	%f0, 16(%r2)	# float
	addis	%r2, %r0, (min_caml_screeny_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screeny_dir)@l
	lfs	%f0, 32(%r3)	# float
	stw	%r2, 68(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fneg.2991
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 68(%r3)
	stfs	%f0, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_screeny_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screeny_dir)@l
	lfs	%f0, 24(%r3)	# float
	stw	%r2, 72(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fneg.2991
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 72(%r3)
	stfs	%f0, 8(%r2)	# float
	addis	%r2, %r0, (min_caml_screeny_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screeny_dir)@l
	lfs	%f0, 32(%r3)	# float
	stw	%r2, 76(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	fneg.2991
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 48(%r3)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 76(%r3)
	stfs	%f0, 16(%r2)	# float
	addis	%r2, %r0, (min_caml_viewpoint)@h	# lis
	ori	%r2, %r2, (min_caml_viewpoint)@l
	addis	%r5, %r0, (min_caml_screen)@h	# lis
	ori	%r5, %r5, (min_caml_screen)@l
	lfs	%f0, 0(%r5)	# float
	addis	%r5, %r0, (min_caml_screenz_dir)@h	# lis
	ori	%r5, %r5, (min_caml_screenz_dir)@l
	lfs	%f1, 0(%r5)	# float
	fsub	%f0, %f0, %f1
	stfs	%f0, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_viewpoint)@h	# lis
	ori	%r2, %r2, (min_caml_viewpoint)@l
	addis	%r5, %r0, (min_caml_screen)@h	# lis
	ori	%r5, %r5, (min_caml_screen)@l
	lfs	%f0, 8(%r5)	# float
	addis	%r5, %r0, (min_caml_screenz_dir)@h	# lis
	ori	%r5, %r5, (min_caml_screenz_dir)@l
	lfs	%f1, 8(%r5)	# float
	fsub	%f0, %f0, %f1
	stfs	%f0, 8(%r2)	# float
	addis	%r2, %r0, (min_caml_viewpoint)@h	# lis
	ori	%r2, %r2, (min_caml_viewpoint)@l
	addis	%r5, %r0, (min_caml_screen)@h	# lis
	ori	%r5, %r5, (min_caml_screen)@l
	lfs	%f0, 16(%r5)	# float
	addis	%r5, %r0, (min_caml_screenz_dir)@h	# lis
	ori	%r5, %r5, (min_caml_screenz_dir)@l
	lfs	%f1, 16(%r5)	# float
	fsub	%f0, %f0, %f1
	stfs	%f0, 16(%r2)	# float
	blr
read_light.3163:
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_int.3026
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_float.3028
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	rad.3159
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	sin.2977
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_light)@h	# lis
	ori	%r2, %r2, (min_caml_light)@l
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fneg.2991
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	stfs	%f0, 8(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	read_float.3028
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	rad.3159
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	cos.2979
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	sin.2977
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_light)@h	# lis
	ori	%r2, %r2, (min_caml_light)@l
	lfs	%f1, 24(%r3)	# float
	fmul	%f0, %f1, %f0
	stfs	%f0, 0(%r2)	# float
	lfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	cos.2979
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_light)@h	# lis
	ori	%r2, %r2, (min_caml_light)@l
	lfs	%f1, 24(%r3)	# float
	fmul	%f0, %f1, %f0
	stfs	%f0, 16(%r2)	# float
	addis	%r2, %r0, (min_caml_beam)@h	# lis
	ori	%r2, %r2, (min_caml_beam)@l
	stw	%r2, 32(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	read_float.3028
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 32(%r3)
	stfs	%f0, 0(%r2)	# float
	blr
rotate_quadratic_matrix.3165:
	lfs	%f0, 0(%r5)	# float
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	cos.2979
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	lfs	%f1, 0(%r2)	# float
	stfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	sin.2977
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	lfs	%f1, 8(%r2)	# float
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	cos.2979
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	lfs	%f1, 8(%r2)	# float
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	sin.2977
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	lfs	%f1, 16(%r2)	# float
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	cos.2979
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	lfs	%f1, 16(%r2)	# float
	stfs	%f0, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	sin.2977
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 40(%r3)	# float
	lfs	%f2, 24(%r3)	# float
	fmul	%f3, %f2, %f1
	lfs	%f4, 32(%r3)	# float
	lfs	%f5, 16(%r3)	# float
	fmul	%f6, %f5, %f4
	fmul	%f6, %f6, %f1
	lfs	%f7, 8(%r3)	# float
	fmul	%f8, %f7, %f0
	fsub	%f6, %f6, %f8
	fmul	%f8, %f7, %f4
	fmul	%f8, %f8, %f1
	fmul	%f9, %f5, %f0
	fadd	%f8, %f8, %f9
	fmul	%f9, %f2, %f0
	fmul	%f10, %f5, %f4
	fmul	%f10, %f10, %f0
	fmul	%f11, %f7, %f1
	fadd	%f10, %f10, %f11
	fmul	%f11, %f7, %f4
	fmul	%f0, %f11, %f0
	fmul	%f1, %f5, %f1
	fsub	%f0, %f0, %f1
	stfs	%f0, 48(%r3)	# float
	stfs	%f8, 56(%r3)	# float
	stfs	%f10, 64(%r3)	# float
	stfs	%f6, 72(%r3)	# float
	stfs	%f9, 80(%r3)	# float
	stfs	%f3, 88(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f4
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	fneg.2991
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	lfs	%f2, 16(%r3)	# float
	fmul	%f2, %f2, %f1
	lfs	%f3, 8(%r3)	# float
	fmul	%f1, %f3, %f1
	lwz	%r2, 0(%r3)
	lfs	%f3, 0(%r2)	# float
	lfs	%f4, 8(%r2)	# float
	lfs	%f5, 16(%r2)	# float
	lfs	%f6, 88(%r3)	# float
	stfs	%f1, 96(%r3)	# float
	stfs	%f2, 104(%r3)	# float
	stfs	%f5, 112(%r3)	# float
	stfs	%f0, 120(%r3)	# float
	stfs	%f4, 128(%r3)	# float
	stfs	%f3, 136(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f6
	stw	%r31, 148(%r3)
	addi	%r3, %r3, 152
	bl	fsqr.3002
	addi	%r3, %r3, -152	# subi
	lwz	%r31, 148(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 136(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f2, 80(%r3)	# float
	stfs	%f0, 144(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f2
	stw	%r31, 156(%r3)
	addi	%r3, %r3, 160
	bl	fsqr.3002
	addi	%r3, %r3, -160	# subi
	lwz	%r31, 156(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 128(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f2, 144(%r3)	# float
	fadd	%f0, %f2, %f0
	lfs	%f2, 120(%r3)	# float
	stfs	%f0, 152(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f2
	stw	%r31, 164(%r3)
	addi	%r3, %r3, 168
	bl	fsqr.3002
	addi	%r3, %r3, -168	# subi
	lwz	%r31, 164(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 112(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f2, 152(%r3)	# float
	fadd	%f0, %f2, %f0
	lwz	%r2, 0(%r3)
	stfs	%f0, 0(%r2)	# float
	lfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 164(%r3)
	addi	%r3, %r3, 168
	bl	fsqr.3002
	addi	%r3, %r3, -168	# subi
	lwz	%r31, 164(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 136(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f2, 64(%r3)	# float
	stfs	%f0, 160(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f2
	stw	%r31, 172(%r3)
	addi	%r3, %r3, 176
	bl	fsqr.3002
	addi	%r3, %r3, -176	# subi
	lwz	%r31, 172(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 128(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f2, 160(%r3)	# float
	fadd	%f0, %f2, %f0
	lfs	%f2, 104(%r3)	# float
	stfs	%f0, 168(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f2
	stw	%r31, 180(%r3)
	addi	%r3, %r3, 184
	bl	fsqr.3002
	addi	%r3, %r3, -184	# subi
	lwz	%r31, 180(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 112(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f2, 168(%r3)	# float
	fadd	%f0, %f2, %f0
	lwz	%r2, 0(%r3)
	stfs	%f0, 8(%r2)	# float
	lfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 180(%r3)
	addi	%r3, %r3, 184
	bl	fsqr.3002
	addi	%r3, %r3, -184	# subi
	lwz	%r31, 180(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 136(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f2, 48(%r3)	# float
	stfs	%f0, 176(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f2
	stw	%r31, 188(%r3)
	addi	%r3, %r3, 192
	bl	fsqr.3002
	addi	%r3, %r3, -192	# subi
	lwz	%r31, 188(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 128(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f2, 176(%r3)	# float
	fadd	%f0, %f2, %f0
	lfs	%f2, 96(%r3)	# float
	stfs	%f0, 184(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f2
	stw	%r31, 196(%r3)
	addi	%r3, %r3, 200
	bl	fsqr.3002
	addi	%r3, %r3, -200	# subi
	lwz	%r31, 196(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 112(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f2, 184(%r3)	# float
	fadd	%f0, %f2, %f0
	lwz	%r2, 0(%r3)
	stfs	%f0, 16(%r2)	# float
	addis	%r31, %r0, (l.7151)@h	# lis
	ori	%r31, %r31, (l.7151)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f2, 72(%r3)	# float
	lfs	%f3, 136(%r3)	# float
	fmul	%f4, %f3, %f2
	lfs	%f5, 56(%r3)	# float
	fmul	%f4, %f4, %f5
	lfs	%f6, 64(%r3)	# float
	lfs	%f7, 128(%r3)	# float
	fmul	%f8, %f7, %f6
	lfs	%f9, 48(%r3)	# float
	fmul	%f8, %f8, %f9
	fadd	%f4, %f4, %f8
	lfs	%f8, 104(%r3)	# float
	fmul	%f10, %f1, %f8
	lfs	%f11, 96(%r3)	# float
	fmul	%f10, %f10, %f11
	fadd	%f4, %f4, %f10
	fmul	%f0, %f0, %f4
	lwz	%r2, 4(%r3)
	stfs	%f0, 0(%r2)	# float
	addis	%r31, %r0, (l.7151)@h	# lis
	ori	%r31, %r31, (l.7151)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f4, 88(%r3)	# float
	fmul	%f10, %f3, %f4
	fmul	%f5, %f10, %f5
	lfs	%f10, 80(%r3)	# float
	fmul	%f12, %f7, %f10
	fmul	%f9, %f12, %f9
	fadd	%f5, %f5, %f9
	lfs	%f9, 120(%r3)	# float
	fmul	%f12, %f1, %f9
	fmul	%f11, %f12, %f11
	fadd	%f5, %f5, %f11
	fmul	%f0, %f0, %f5
	stfs	%f0, 8(%r2)	# float
	addis	%r31, %r0, (l.7151)@h	# lis
	ori	%r31, %r31, (l.7151)@l
	lfs	%f0, 0(%r31)	# float
	fmul	%f3, %f3, %f4
	fmul	%f2, %f3, %f2
	fmul	%f3, %f7, %f10
	fmul	%f3, %f3, %f6
	fadd	%f2, %f2, %f3
	fmul	%f1, %f1, %f9
	fmul	%f1, %f1, %f8
	fadd	%f1, %f2, %f1
	fmul	%f0, %f0, %f1
	stfs	%f0, 16(%r2)	# float
	blr
read_nth_object.3168:
	lwz	%r5, 4(%r29)
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	read_int.3026
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.9471
	addi	%r2, %r0, 0	# li
	blr
beq_else.9471:
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	read_int.3026
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	read_int.3026
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	read_int.3026
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_float_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	read_float.3028
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	stfs	%f0, 0(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	read_float.3028
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	stfs	%f0, 8(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	read_float.3028
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	stfs	%f0, 16(%r2)	# float
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_float_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 28(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	read_float.3028
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 28(%r3)
	stfs	%f0, 0(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	read_float.3028
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 28(%r3)
	stfs	%f0, 8(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	read_float.3028
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 28(%r3)
	stfs	%f0, 16(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	read_float.3028
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fisneg.2989
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 2	# li
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 32(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_create_float_array
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 36(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	read_float.3028
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 36(%r3)
	stfs	%f0, 0(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	read_float.3028
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 36(%r3)
	stfs	%f0, 8(%r2)	# float
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_create_float_array
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 40(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	read_float.3028
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 40(%r3)
	stfs	%f0, 0(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	read_float.3028
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 40(%r3)
	stfs	%f0, 8(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	read_float.3028
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 40(%r3)
	stfs	%f0, 16(%r2)	# float
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_create_float_array
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 20(%r3)
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.9472
	b	beq_cont.9473
beq_else.9472:
	stw	%r2, 44(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	read_float.3028
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	rad.3159
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 44(%r3)
	stfs	%f0, 0(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	read_float.3028
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	rad.3159
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 44(%r3)
	stfs	%f0, 8(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	read_float.3028
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	rad.3159
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 44(%r3)
	stfs	%f0, 16(%r2)	# float
beq_cont.9473:
	lwz	%r5, 12(%r3)
	cmpwi	%cr7, %r5, 2
	bne	%cr7, beq_else.9474
	addi	%r6, %r0, 1	# li
	b	beq_cont.9475
beq_else.9474:
	lwz	%r6, 32(%r3)
beq_cont.9475:
	addi	%r7, %r0, 4	# li
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r6, 48(%r3)
	stw	%r2, 44(%r3)
	mfspr	%r31, 8	# mflr
	or	%r7, %r2, %r7	# mr %r2, %r7
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	min_caml_create_float_array
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	or	%r4, %r5, %r4	# mr %r5, %r4
	addi	%r4, %r4, 48
	stw	%r2, 40(%r5)
	lwz	%r2, 44(%r3)
	stw	%r2, 36(%r5)
	lwz	%r6, 40(%r3)
	stw	%r6, 32(%r5)
	lwz	%r6, 36(%r3)
	stw	%r6, 28(%r5)
	lwz	%r6, 48(%r3)
	stw	%r6, 24(%r5)
	lwz	%r6, 28(%r3)
	stw	%r6, 20(%r5)
	lwz	%r6, 24(%r3)
	stw	%r6, 16(%r5)
	lwz	%r7, 20(%r3)
	stw	%r7, 12(%r5)
	lwz	%r8, 16(%r3)
	stw	%r8, 8(%r5)
	lwz	%r8, 12(%r3)
	stw	%r8, 4(%r5)
	lwz	%r9, 8(%r3)
	stw	%r9, 0(%r5)
	addis	%r9, %r0, (min_caml_objects)@h	# lis
	ori	%r9, %r9, (min_caml_objects)@l
	lwz	%r10, 4(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r10, %r10, %r1 # swap
	stwx	%r5, %r9, %r10
	cmpwi	%cr7, %r8, 3
	bne	%cr7, beq_else.9476
	lfs	%f0, 0(%r6)	# float
	stfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fiszero.2985
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9479
	lfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	sgn.3034
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	stfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fsqr.3002
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 64(%r3)	# float
	fdiv	%f0, %f1, %f0
	b	beq_cont.9480
beq_else.9479:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.9480:
	lwz	%r2, 24(%r3)
	stfs	%f0, 0(%r2)	# float
	lfs	%f0, 8(%r2)	# float
	stfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	fiszero.2985
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9481
	lfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	sgn.3034
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 72(%r3)	# float
	stfs	%f0, 80(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	fsqr.3002
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 80(%r3)	# float
	fdiv	%f0, %f1, %f0
	b	beq_cont.9482
beq_else.9481:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.9482:
	lwz	%r2, 24(%r3)
	stfs	%f0, 8(%r2)	# float
	lfs	%f0, 16(%r2)	# float
	stfs	%f0, 88(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	fiszero.2985
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9483
	lfs	%f0, 88(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	sgn.3034
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 88(%r3)	# float
	stfs	%f0, 96(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	fsqr.3002
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 96(%r3)	# float
	fdiv	%f0, %f1, %f0
	b	beq_cont.9484
beq_else.9483:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.9484:
	lwz	%r2, 24(%r3)
	stfs	%f0, 16(%r2)	# float
	b	beq_cont.9477
beq_else.9476:
	cmpwi	%cr7, %r8, 2
	bne	%cr7, beq_else.9485
	lwz	%r5, 32(%r3)
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.9487
	addi	%r5, %r0, 1	# li
	b	beq_cont.9488
beq_else.9487:
	addi	%r5, %r0, 0	# li
beq_cont.9488:
	lwz	%r29, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	b	beq_cont.9486
beq_else.9485:
beq_cont.9486:
beq_cont.9477:
	lwz	%r2, 20(%r3)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9489
	b	beq_cont.9490
beq_else.9489:
	lwz	%r2, 24(%r3)
	lwz	%r5, 44(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	rotate_quadratic_matrix.3165
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9490:
	addi	%r2, %r0, 1	# li
	blr
read_object.3170:
	lwz	%r5, 4(%r29)
	cmpwi	%cr7, %r2, 60
	blt	%cr7, bge_else.9491
	blr
bge_else.9491:
	stw	%r29, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r29, %r5	# mr %r29, %r5
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9493
	addis	%r2, %r0, (min_caml_n_objects)@h	# lis
	ori	%r2, %r2, (min_caml_n_objects)@l
	lwz	%r5, 4(%r3)
	stw	%r5, 0(%r2)
	blr
beq_else.9493:
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, 1
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
read_all_object.3172:
	lwz	%r29, 4(%r29)
	addi	%r2, %r0, 0	# li
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
read_net_item.3174:
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_int.3026
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.9495
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	addi	%r5, %r0, -1	# li
	b	min_caml_create_array
beq_else.9495:
	lwz	%r5, 0(%r3)
	addi	%r6, %r5, 1
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	read_net_item.3174
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwz	%r6, 4(%r3)
	stwx	%r6, %r2, %r5
	blr
read_or_network.3176:
	addi	%r5, %r0, 0	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_net_item.3174
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r5)
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.9496
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	b	min_caml_create_array
beq_else.9496:
	lwz	%r2, 0(%r3)
	addi	%r6, %r2, 1
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	read_or_network.3176
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwz	%r6, 4(%r3)
	stwx	%r6, %r2, %r5
	blr
read_and_network.3178:
	addi	%r5, %r0, 0	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_net_item.3174
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.9497
	blr
beq_else.9497:
	addis	%r5, %r0, (min_caml_and_net)@h	# lis
	ori	%r5, %r5, (min_caml_and_net)@l
	lwz	%r6, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r6, %r7, %r1 # swap
	stwx	%r2, %r5, %r7
	addi	%r2, %r6, 1
	b	read_and_network.3178
read_parameter.3180:
	lwz	%r2, 4(%r29)
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_screen_settings.3161
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_light.3163
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
	addi	%r2, %r0, 0	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_and_network.3178
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_or_net)@h	# lis
	ori	%r2, %r2, (min_caml_or_net)@l
	addi	%r5, %r0, 0	# li
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	read_or_network.3176
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	stw	%r2, 0(%r5)
	blr
solver_rect_surface.3182:
	addi	%r1, %r0, 3	# li
	slw	%r6, %r9, %r1 # swap
	lfdx	%f3, %r5, %r9
	stfs	%f2, 0(%r3)	# float
	stw	%r8, 8(%r3)
	stfs	%f1, 16(%r3)	# float
	stw	%r7, 24(%r3)
	stfs	%f0, 32(%r3)	# float
	stw	%r5, 40(%r3)
	stw	%r6, 44(%r3)
	stw	%r2, 48(%r3)
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f3
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	fiszero.2985
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9502
	lwz	%r2, 48(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_param_abc.3104
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 48(%r3)
	stw	%r2, 52(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_isinvert.3094
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 44(%r3)
	addi	%r1, %r0, 3	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 40(%r3)
	lfdx	%f0, %r7, %r6
	stw	%r2, 56(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	fisneg.2989
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 56(%r3)
	xor	%r5, %r2, %r2
	lwz	%r5, 44(%r3)
	addi	%r1, %r0, 3	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 52(%r3)
	lfdx	%f0, %r7, %r6
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	fneg_cond.3036
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fsub	%f0, %f0, %f1
	lwz	%r2, 44(%r3)
	addi	%r1, %r0, 3	# li
	slw	%r2, %r2, %r1 # swap
	lwz	%r5, 40(%r3)
	lfdx	%f1, %r5, %r2
	fdiv	%f0, %f0, %f1
	lwz	%r2, 24(%r3)
	addi	%r1, %r0, 3	# li
	slw	%r2, %r6, %r1 # swap
	lfdx	%f1, %r5, %r6
	fmul	%f1, %f0, %f1
	lfs	%f2, 16(%r3)	# float
	fadd	%f1, %f1, %f2
	stfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fabs.2995
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	addi	%r1, %r0, 3	# li
	slw	%r2, %r2, %r1 # swap
	lwz	%r5, 52(%r3)
	lfdx	%f1, %r5, %r2
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fless.2997
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9504
	addi	%r2, %r0, 0	# li
	blr
beq_else.9504:
	lwz	%r2, 8(%r3)
	addi	%r1, %r0, 3	# li
	slw	%r2, %r5, %r1 # swap
	lwz	%r6, 40(%r3)
	lfdx	%f0, %r6, %r5
	lfs	%f1, 64(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f2, 0(%r3)	# float
	fadd	%f0, %f0, %f2
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fabs.2995
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	addi	%r1, %r0, 3	# li
	slw	%r2, %r2, %r1 # swap
	lwz	%r5, 52(%r3)
	lfdx	%f1, %r5, %r2
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fless.2997
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9505
	addi	%r2, %r0, 0	# li
	blr
beq_else.9505:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 64(%r3)	# float
	stfs	%f0, 0(%r2)	# float
	addi	%r2, %r0, 1	# li
	blr
beq_else.9502:
	addi	%r2, %r0, 0	# li
	blr
solver_rect.3191:
	addi	%r6, %r0, 0	# li
	addi	%r7, %r0, 1	# li
	addi	%r8, %r0, 2	# li
	stfs	%f0, 0(%r3)	# float
	stfs	%f2, 8(%r3)	# float
	stfs	%f1, 16(%r3)	# float
	stw	%r5, 24(%r3)
	stw	%r2, 28(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	solver_rect_surface.3182
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9506
	addi	%r6, %r0, 1	# li
	addi	%r7, %r0, 2	# li
	addi	%r8, %r0, 0	# li
	lfs	%f0, 16(%r3)	# float
	lfs	%f1, 8(%r3)	# float
	lfs	%f2, 0(%r3)	# float
	lwz	%r2, 28(%r3)
	lwz	%r5, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	solver_rect_surface.3182
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9507
	addi	%r6, %r0, 2	# li
	addi	%r7, %r0, 0	# li
	addi	%r8, %r0, 1	# li
	lfs	%f0, 8(%r3)	# float
	lfs	%f1, 0(%r3)	# float
	lfs	%f2, 16(%r3)	# float
	lwz	%r2, 28(%r3)
	lwz	%r5, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	solver_rect_surface.3182
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9508
	addi	%r2, %r0, 0	# li
	blr
beq_else.9508:
	addi	%r2, %r0, 3	# li
	blr
beq_else.9507:
	addi	%r2, %r0, 2	# li
	blr
beq_else.9506:
	addi	%r2, %r0, 1	# li
	blr
solver_surface.3197:
	stfs	%f2, 0(%r3)	# float
	stfs	%f1, 8(%r3)	# float
	stfs	%f0, 16(%r3)	# float
	stw	%r5, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_param_abc.3104
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	stw	%r5, 28(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	veciprod.3063
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fispos.2987
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9509
	addi	%r2, %r0, 0	# li
	blr
beq_else.9509:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 16(%r3)	# float
	lfs	%f1, 8(%r3)	# float
	lfs	%f2, 0(%r3)	# float
	lwz	%r5, 28(%r3)
	stw	%r2, 40(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	veciprod2.3066
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fneg.2991
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r2, 40(%r3)
	stfs	%f0, 0(%r2)	# float
	addi	%r2, %r0, 1	# li
	blr
quadratic.3203:
	stfs	%f0, 0(%r3)	# float
	stfs	%f2, 8(%r3)	# float
	stfs	%f1, 16(%r3)	# float
	stw	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fsqr.3002
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	o_param_a.3098
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 16(%r3)	# float
	stfs	%f0, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	fsqr.3002
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	stfs	%f0, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_param_b.3100
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 48(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 40(%r3)	# float
	fadd	%f0, %f1, %f0
	lfs	%f1, 8(%r3)	# float
	stfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fsqr.3002
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	stfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	o_param_c.3102
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 64(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 56(%r3)	# float
	fadd	%f0, %f1, %f0
	lwz	%r2, 24(%r3)
	stfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_isrot.3096
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9511
	lfs	%f0, 72(%r3)	# float
	blr
beq_else.9511:
	lfs	%f0, 8(%r3)	# float
	lfs	%f1, 16(%r3)	# float
	fmul	%f2, %f1, %f0
	lwz	%r2, 24(%r3)
	stfs	%f2, 80(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	o_param_r1.3122
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 80(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 72(%r3)	# float
	fadd	%f0, %f1, %f0
	lfs	%f1, 0(%r3)	# float
	lfs	%f2, 8(%r3)	# float
	fmul	%f2, %f2, %f1
	lwz	%r2, 24(%r3)
	stfs	%f0, 88(%r3)	# float
	stfs	%f2, 96(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	o_param_r2.3124
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 96(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 88(%r3)	# float
	fadd	%f0, %f1, %f0
	lfs	%f1, 16(%r3)	# float
	lfs	%f2, 0(%r3)	# float
	fmul	%f1, %f2, %f1
	lwz	%r2, 24(%r3)
	stfs	%f0, 104(%r3)	# float
	stfs	%f1, 112(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	o_param_r3.3126
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 112(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 104(%r3)	# float
	fadd	%f0, %f1, %f0
	blr
bilinear.3208:
	fmul	%f6, %f0, %f3
	stfs	%f3, 0(%r3)	# float
	stfs	%f0, 8(%r3)	# float
	stfs	%f5, 16(%r3)	# float
	stfs	%f2, 24(%r3)	# float
	stw	%r2, 32(%r3)
	stfs	%f4, 40(%r3)	# float
	stfs	%f1, 48(%r3)	# float
	stfs	%f6, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	o_param_a.3098
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 40(%r3)	# float
	lfs	%f2, 48(%r3)	# float
	fmul	%f3, %f2, %f1
	lwz	%r2, 32(%r3)
	stfs	%f0, 64(%r3)	# float
	stfs	%f3, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_param_b.3100
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 72(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 64(%r3)	# float
	fadd	%f0, %f1, %f0
	lfs	%f1, 16(%r3)	# float
	lfs	%f2, 24(%r3)	# float
	fmul	%f3, %f2, %f1
	lwz	%r2, 32(%r3)
	stfs	%f0, 80(%r3)	# float
	stfs	%f3, 88(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	o_param_c.3102
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 88(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 80(%r3)	# float
	fadd	%f0, %f1, %f0
	lwz	%r2, 32(%r3)
	stfs	%f0, 96(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	o_isrot.3096
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9513
	lfs	%f0, 96(%r3)	# float
	blr
beq_else.9513:
	lfs	%f0, 40(%r3)	# float
	lfs	%f1, 24(%r3)	# float
	fmul	%f2, %f1, %f0
	lfs	%f3, 16(%r3)	# float
	lfs	%f4, 48(%r3)	# float
	fmul	%f5, %f4, %f3
	fadd	%f2, %f2, %f5
	lwz	%r2, 32(%r3)
	stfs	%f2, 104(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	o_param_r1.3122
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 104(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 16(%r3)	# float
	lfs	%f2, 8(%r3)	# float
	fmul	%f1, %f2, %f1
	lfs	%f3, 0(%r3)	# float
	lfs	%f4, 24(%r3)	# float
	fmul	%f4, %f4, %f3
	fadd	%f1, %f1, %f4
	lwz	%r2, 32(%r3)
	stfs	%f0, 112(%r3)	# float
	stfs	%f1, 120(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	o_param_r2.3124
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 120(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 112(%r3)	# float
	fadd	%f0, %f1, %f0
	lfs	%f1, 40(%r3)	# float
	lfs	%f2, 8(%r3)	# float
	fmul	%f1, %f2, %f1
	lfs	%f2, 0(%r3)	# float
	lfs	%f3, 48(%r3)	# float
	fmul	%f2, %f3, %f2
	fadd	%f1, %f1, %f2
	lwz	%r2, 32(%r3)
	stfs	%f0, 128(%r3)	# float
	stfs	%f1, 136(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 148(%r3)
	addi	%r3, %r3, 152
	bl	o_param_r3.3126
	addi	%r3, %r3, -152	# subi
	lwz	%r31, 148(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 136(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 128(%r3)	# float
	fadd	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 148(%r3)
	addi	%r3, %r3, 152
	bl	fhalf.3000
	addi	%r3, %r3, -152	# subi
	lwz	%r31, 148(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 96(%r3)	# float
	fadd	%f0, %f1, %f0
	blr
solver_second.3216:
	lwz	%r6, 4(%r29)
	lfs	%f3, 0(%r5)	# float
	lfs	%f4, 8(%r5)	# float
	lfs	%f5, 16(%r5)	# float
	stw	%r6, 0(%r3)
	stfs	%f2, 8(%r3)	# float
	stfs	%f1, 16(%r3)	# float
	stfs	%f0, 24(%r3)	# float
	stw	%r2, 32(%r3)
	stw	%r5, 36(%r3)
	mfspr	%r31, 8	# mflr
	fmr	%f2, %f5
	fmr	%f1, %f4
	fmr	%f0, %f3
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	quadratic.3203
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	fiszero.2985
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9515
	lwz	%r2, 36(%r3)
	lfs	%f0, 0(%r2)	# float
	lfs	%f1, 8(%r2)	# float
	lfs	%f2, 16(%r2)	# float
	lfs	%f3, 24(%r3)	# float
	lfs	%f4, 16(%r3)	# float
	lfs	%f5, 8(%r3)	# float
	lwz	%r2, 32(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	bilinear.3208
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	lfs	%f2, 16(%r3)	# float
	lfs	%f3, 8(%r3)	# float
	lwz	%r2, 32(%r3)
	stfs	%f0, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	fmr	%f1, %f2
	fmr	%f2, %f3
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	quadratic.3203
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 32(%r3)
	stfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	o_form.3090
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 3
	bne	%cr7, beq_else.9516
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 56(%r3)	# float
	fsub	%f0, %f1, %f0
	b	beq_cont.9517
beq_else.9516:
	lfs	%f0, 56(%r3)	# float
beq_cont.9517:
	lfs	%f1, 48(%r3)	# float
	stfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fsqr.3002
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 64(%r3)	# float
	lfs	%f2, 40(%r3)	# float
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	stfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	fispos.2987
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9518
	addi	%r2, %r0, 0	# li
	blr
beq_else.9518:
	lfs	%f0, 72(%r3)	# float
	lwz	%r29, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 32(%r3)
	stfs	%f0, 80(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	o_isinvert.3094
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9519
	lfs	%f0, 80(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	fneg.2991
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	b	beq_cont.9520
beq_else.9519:
	lfs	%f0, 80(%r3)	# float
beq_cont.9520:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f1, 48(%r3)	# float
	fsub	%f0, %f0, %f1
	lfs	%f1, 40(%r3)	# float
	fdiv	%f0, %f0, %f1
	stfs	%f0, 0(%r2)	# float
	addi	%r2, %r0, 1	# li
	blr
beq_else.9515:
	addi	%r2, %r0, 0	# li
	blr
solver.3222:
	lwz	%r7, 4(%r29)
	addis	%r8, %r0, (min_caml_objects)@h	# lis
	ori	%r8, %r8, (min_caml_objects)@l
	addi	%r1, %r0, 2	# li
	slw	%r2, %r2, %r1 # swap
	lwzx	%r2, %r8, %r2
	lfs	%f0, 0(%r6)	# float
	stw	%r7, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r2, 8(%r3)
	stw	%r6, 12(%r3)
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_param_x.3106
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 12(%r3)
	lfs	%f1, 8(%r2)	# float
	lwz	%r5, 8(%r3)
	stfs	%f0, 24(%r3)	# float
	stfs	%f1, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	o_param_y.3108
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 12(%r3)
	lfs	%f1, 16(%r2)	# float
	lwz	%r2, 8(%r3)
	stfs	%f0, 40(%r3)	# float
	stfs	%f1, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_param_z.3110
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 48(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 8(%r3)
	stfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	o_form.3090
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.9521
	lfs	%f0, 24(%r3)	# float
	lfs	%f1, 40(%r3)	# float
	lfs	%f2, 56(%r3)	# float
	lwz	%r2, 8(%r3)
	lwz	%r5, 4(%r3)
	b	solver_rect.3191
beq_else.9521:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9522
	lfs	%f0, 24(%r3)	# float
	lfs	%f1, 40(%r3)	# float
	lfs	%f2, 56(%r3)	# float
	lwz	%r2, 8(%r3)
	lwz	%r5, 4(%r3)
	b	solver_surface.3197
beq_else.9522:
	lfs	%f0, 24(%r3)	# float
	lfs	%f1, 40(%r3)	# float
	lfs	%f2, 56(%r3)	# float
	lwz	%r2, 8(%r3)
	lwz	%r5, 4(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
solver_rect_fast.3226:
	lfs	%f3, 0(%r6)	# float
	fsub	%f3, %f3, %f0
	lfs	%f4, 8(%r6)	# float
	fmul	%f3, %f3, %f4
	lfs	%f4, 8(%r5)	# float
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f1
	stfs	%f0, 0(%r3)	# float
	stfs	%f1, 8(%r3)	# float
	stw	%r6, 16(%r3)
	stfs	%f2, 24(%r3)	# float
	stfs	%f3, 32(%r3)	# float
	stw	%r5, 40(%r3)
	stw	%r2, 44(%r3)
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f4
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	fabs.2995
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 44(%r3)
	stfs	%f0, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_param_b.3100
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	fless.2997
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9524
	addi	%r2, %r0, 0	# li
	b	beq_cont.9525
beq_else.9524:
	lwz	%r2, 40(%r3)
	lfs	%f0, 16(%r2)	# float
	lfs	%f1, 32(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f2, 24(%r3)	# float
	fadd	%f0, %f0, %f2
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	fabs.2995
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 44(%r3)
	stfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	o_param_c.3102
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fless.2997
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9526
	addi	%r2, %r0, 0	# li
	b	beq_cont.9527
beq_else.9526:
	lwz	%r2, 16(%r3)
	lfs	%f0, 8(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fiszero.2985
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9528
	addi	%r2, %r0, 1	# li
	b	beq_cont.9529
beq_else.9528:
	addi	%r2, %r0, 0	# li
beq_cont.9529:
beq_cont.9527:
beq_cont.9525:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9530
	lwz	%r2, 16(%r3)
	lfs	%f0, 16(%r2)	# float
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f0, %f1
	lfs	%f2, 24(%r2)	# float
	fmul	%f0, %f0, %f2
	lwz	%r5, 40(%r3)
	lfs	%f2, 0(%r5)	# float
	fmul	%f2, %f0, %f2
	lfs	%f3, 0(%r3)	# float
	fadd	%f2, %f2, %f3
	stfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f2
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fabs.2995
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 44(%r3)
	stfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_param_a.3098
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	fless.2997
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9531
	addi	%r2, %r0, 0	# li
	b	beq_cont.9532
beq_else.9531:
	lwz	%r2, 40(%r3)
	lfs	%f0, 16(%r2)	# float
	lfs	%f1, 64(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f2, 24(%r3)	# float
	fadd	%f0, %f0, %f2
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	fabs.2995
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 44(%r3)
	stfs	%f0, 80(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	o_param_c.3102
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 80(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	fless.2997
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9533
	addi	%r2, %r0, 0	# li
	b	beq_cont.9534
beq_else.9533:
	lwz	%r2, 16(%r3)
	lfs	%f0, 24(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	fiszero.2985
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9535
	addi	%r2, %r0, 1	# li
	b	beq_cont.9536
beq_else.9535:
	addi	%r2, %r0, 0	# li
beq_cont.9536:
beq_cont.9534:
beq_cont.9532:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9537
	lwz	%r2, 16(%r3)
	lfs	%f0, 32(%r2)	# float
	lfs	%f1, 24(%r3)	# float
	fsub	%f0, %f0, %f1
	lfs	%f1, 40(%r2)	# float
	fmul	%f0, %f0, %f1
	lwz	%r5, 40(%r3)
	lfs	%f1, 0(%r5)	# float
	fmul	%f1, %f0, %f1
	lfs	%f2, 0(%r3)	# float
	fadd	%f1, %f1, %f2
	stfs	%f0, 88(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	fabs.2995
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 44(%r3)
	stfs	%f0, 96(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	o_param_a.3098
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 96(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	fless.2997
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9538
	addi	%r2, %r0, 0	# li
	b	beq_cont.9539
beq_else.9538:
	lwz	%r2, 40(%r3)
	lfs	%f0, 8(%r2)	# float
	lfs	%f1, 88(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f2, 8(%r3)	# float
	fadd	%f0, %f0, %f2
	mfspr	%r31, 8	# mflr
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	fabs.2995
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 44(%r3)
	stfs	%f0, 104(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	o_param_b.3100
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 104(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	fless.2997
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9540
	addi	%r2, %r0, 0	# li
	b	beq_cont.9541
beq_else.9540:
	lwz	%r2, 16(%r3)
	lfs	%f0, 40(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	fiszero.2985
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9542
	addi	%r2, %r0, 1	# li
	b	beq_cont.9543
beq_else.9542:
	addi	%r2, %r0, 0	# li
beq_cont.9543:
beq_cont.9541:
beq_cont.9539:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9544
	addi	%r2, %r0, 0	# li
	blr
beq_else.9544:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 88(%r3)	# float
	stfs	%f0, 0(%r2)	# float
	addi	%r2, %r0, 3	# li
	blr
beq_else.9537:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 64(%r3)	# float
	stfs	%f0, 0(%r2)	# float
	addi	%r2, %r0, 2	# li
	blr
beq_else.9530:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 32(%r3)	# float
	stfs	%f0, 0(%r2)	# float
	addi	%r2, %r0, 1	# li
	blr
solver_surface_fast.3233:
	lfs	%f3, 0(%r5)	# float
	stfs	%f2, 0(%r3)	# float
	stfs	%f1, 8(%r3)	# float
	stfs	%f0, 16(%r3)	# float
	stw	%r5, 24(%r3)
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f3
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fisneg.2989
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9545
	addi	%r2, %r0, 0	# li
	blr
beq_else.9545:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lwz	%r5, 24(%r3)
	lfs	%f0, 8(%r5)	# float
	lfs	%f1, 16(%r3)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 16(%r5)	# float
	lfs	%f2, 8(%r3)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 24(%r5)	# float
	lfs	%f2, 0(%r3)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 0(%r2)	# float
	addi	%r2, %r0, 1	# li
	blr
solver_second_fast.3239:
	lwz	%r6, 4(%r29)
	lfs	%f3, 0(%r5)	# float
	stw	%r6, 0(%r3)
	stfs	%f3, 8(%r3)	# float
	stw	%r2, 16(%r3)
	stfs	%f2, 24(%r3)	# float
	stfs	%f1, 32(%r3)	# float
	stfs	%f0, 40(%r3)	# float
	stw	%r5, 48(%r3)
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f3
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	fiszero.2985
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9548
	lwz	%r2, 48(%r3)
	lfs	%f0, 8(%r2)	# float
	lfs	%f1, 40(%r3)	# float
	fmul	%f0, %f0, %f1
	lfs	%f2, 16(%r2)	# float
	lfs	%f3, 32(%r3)	# float
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	lfs	%f2, 24(%r2)	# float
	lfs	%f4, 24(%r3)	# float
	fmul	%f2, %f2, %f4
	fadd	%f0, %f0, %f2
	lwz	%r5, 16(%r3)
	stfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	fmr	%f2, %f4
	fmr	%f0, %f1
	fmr	%f1, %f3
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	quadratic.3203
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 16(%r3)
	stfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	o_form.3090
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 3
	bne	%cr7, beq_else.9550
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 64(%r3)	# float
	fsub	%f0, %f1, %f0
	b	beq_cont.9551
beq_else.9550:
	lfs	%f0, 64(%r3)	# float
beq_cont.9551:
	lfs	%f1, 56(%r3)	# float
	stfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	fsqr.3002
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 72(%r3)	# float
	lfs	%f2, 8(%r3)	# float
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	stfs	%f0, 80(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	fispos.2987
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9552
	addi	%r2, %r0, 0	# li
	blr
beq_else.9552:
	lwz	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	o_isinvert.3094
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9553
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 80(%r3)	# float
	lwz	%r29, 0(%r3)
	stw	%r2, 88(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 48(%r3)
	lfs	%f1, 32(%r2)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 88(%r3)
	stfs	%f0, 0(%r2)	# float
	b	beq_cont.9554
beq_else.9553:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 80(%r3)	# float
	lwz	%r29, 0(%r3)
	stw	%r2, 92(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fadd	%f0, %f1, %f0
	lwz	%r2, 48(%r3)
	lfs	%f1, 32(%r2)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 92(%r3)
	stfs	%f0, 0(%r2)	# float
beq_cont.9554:
	addi	%r2, %r0, 1	# li
	blr
beq_else.9548:
	addi	%r2, %r0, 0	# li
	blr
solver_fast.3245:
	lwz	%r7, 4(%r29)
	addis	%r8, %r0, (min_caml_objects)@h	# lis
	ori	%r8, %r8, (min_caml_objects)@l
	addi	%r1, %r0, 2	# li
	slw	%r2, %r9, %r1 # swap
	lwzx	%r8, %r8, %r9
	lfs	%f0, 0(%r6)	# float
	stw	%r7, 0(%r3)
	stw	%r2, 4(%r3)
	stw	%r5, 8(%r3)
	stw	%r8, 12(%r3)
	stw	%r6, 16(%r3)
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r8, %r2, %r8	# mr %r2, %r8
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_x.3106
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 16(%r3)
	lfs	%f1, 8(%r2)	# float
	lwz	%r5, 12(%r3)
	stfs	%f0, 32(%r3)	# float
	stfs	%f1, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_param_y.3108
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 40(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 16(%r3)
	lfs	%f1, 16(%r2)	# float
	lwz	%r2, 12(%r3)
	stfs	%f0, 48(%r3)	# float
	stfs	%f1, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	o_param_z.3110
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 8(%r3)
	stfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	d_const.3151
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwzx	%r2, %r2, %r5
	lwz	%r5, 12(%r3)
	stw	%r2, 72(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	o_form.3090
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.9556
	lwz	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	d_vec.3149
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lfs	%f0, 32(%r3)	# float
	lfs	%f1, 48(%r3)	# float
	lfs	%f2, 64(%r3)	# float
	lwz	%r2, 12(%r3)
	lwz	%r6, 72(%r3)
	b	solver_rect_fast.3226
beq_else.9556:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9557
	lfs	%f0, 32(%r3)	# float
	lfs	%f1, 48(%r3)	# float
	lfs	%f2, 64(%r3)	# float
	lwz	%r2, 12(%r3)
	lwz	%r5, 72(%r3)
	b	solver_surface_fast.3233
beq_else.9557:
	lfs	%f0, 32(%r3)	# float
	lfs	%f1, 48(%r3)	# float
	lfs	%f2, 64(%r3)	# float
	lwz	%r2, 12(%r3)
	lwz	%r5, 72(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
solver_surface_fast2.3249:
	lfs	%f0, 0(%r5)	# float
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fisneg.2989
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9558
	addi	%r2, %r0, 0	# li
	blr
beq_else.9558:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lwz	%r5, 4(%r3)
	lfs	%f0, 0(%r5)	# float
	lwz	%r5, 0(%r3)
	lfs	%f1, 24(%r5)	# float
	fmul	%f0, %f0, %f1
	stfs	%f0, 0(%r2)	# float
	addi	%r2, %r0, 1	# li
	blr
solver_second_fast2.3256:
	lwz	%r7, 4(%r29)
	lfs	%f3, 0(%r5)	# float
	stw	%r7, 0(%r3)
	stw	%r2, 4(%r3)
	stfs	%f3, 8(%r3)	# float
	stw	%r6, 16(%r3)
	stfs	%f2, 24(%r3)	# float
	stfs	%f1, 32(%r3)	# float
	stfs	%f0, 40(%r3)	# float
	stw	%r5, 48(%r3)
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f3
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	fiszero.2985
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9560
	lwz	%r2, 48(%r3)
	lfs	%f0, 8(%r2)	# float
	lfs	%f1, 40(%r3)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 16(%r2)	# float
	lfs	%f2, 32(%r3)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 24(%r2)	# float
	lfs	%f2, 24(%r3)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lwz	%r5, 16(%r3)
	lfs	%f1, 24(%r5)	# float
	stfs	%f0, 56(%r3)	# float
	stfs	%f1, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fsqr.3002
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 64(%r3)	# float
	lfs	%f2, 8(%r3)	# float
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	stfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	fispos.2987
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9562
	addi	%r2, %r0, 0	# li
	blr
beq_else.9562:
	lwz	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_isinvert.3094
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9563
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 72(%r3)	# float
	lwz	%r29, 0(%r3)
	stw	%r2, 80(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 48(%r3)
	lfs	%f1, 32(%r2)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 80(%r3)
	stfs	%f0, 0(%r2)	# float
	b	beq_cont.9564
beq_else.9563:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 72(%r3)	# float
	lwz	%r29, 0(%r3)
	stw	%r2, 84(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fadd	%f0, %f1, %f0
	lwz	%r2, 48(%r3)
	lfs	%f1, 32(%r2)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 84(%r3)
	stfs	%f0, 0(%r2)	# float
beq_cont.9564:
	addi	%r2, %r0, 1	# li
	blr
beq_else.9560:
	addi	%r2, %r0, 0	# li
	blr
solver_fast2.3263:
	lwz	%r6, 4(%r29)
	addis	%r7, %r0, (min_caml_objects)@h	# lis
	ori	%r7, %r7, (min_caml_objects)@l
	addi	%r1, %r0, 2	# li
	slw	%r2, %r8, %r1 # swap
	lwzx	%r7, %r7, %r8
	stw	%r6, 0(%r3)
	stw	%r7, 4(%r3)
	stw	%r2, 8(%r3)
	stw	%r5, 12(%r3)
	mfspr	%r31, 8	# mflr
	or	%r7, %r2, %r7	# mr %r2, %r7
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_param_ctbl.3128
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 0(%r2)	# float
	lfs	%f1, 8(%r2)	# float
	lfs	%f2, 16(%r2)	# float
	lwz	%r5, 12(%r3)
	stw	%r2, 16(%r3)
	stfs	%f2, 24(%r3)	# float
	stfs	%f1, 32(%r3)	# float
	stfs	%f0, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	d_const.3151
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 8(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwzx	%r2, %r2, %r5
	lwz	%r5, 4(%r3)
	stw	%r2, 48(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_form.3090
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.9566
	lwz	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	d_vec.3149
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lfs	%f0, 40(%r3)	# float
	lfs	%f1, 32(%r3)	# float
	lfs	%f2, 24(%r3)	# float
	lwz	%r2, 4(%r3)
	lwz	%r6, 48(%r3)
	b	solver_rect_fast.3226
beq_else.9566:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9567
	lfs	%f0, 40(%r3)	# float
	lfs	%f1, 32(%r3)	# float
	lfs	%f2, 24(%r3)	# float
	lwz	%r2, 4(%r3)
	lwz	%r5, 48(%r3)
	lwz	%r6, 16(%r3)
	b	solver_surface_fast2.3249
beq_else.9567:
	lfs	%f0, 40(%r3)	# float
	lfs	%f1, 32(%r3)	# float
	lfs	%f2, 24(%r3)	# float
	lwz	%r2, 4(%r3)
	lwz	%r5, 48(%r3)
	lwz	%r6, 16(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
setup_rect_table.3266:
	addi	%r6, %r0, 6	# li
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_float_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	lfs	%f0, 0(%r5)	# float
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fiszero.2985
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9568
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_isinvert.3094
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	lfs	%f0, 0(%r5)	# float
	stw	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	fisneg.2989
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 12(%r3)
	xor	%r5, %r2, %r2
	lwz	%r5, 0(%r3)
	stw	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_param_a.3098
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	fneg_cond.3036
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	stfs	%f0, 0(%r2)	# float
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r5, 4(%r3)
	lfs	%f1, 0(%r5)	# float
	fdiv	%f0, %f0, %f1
	stfs	%f0, 8(%r2)	# float
	b	beq_cont.9569
beq_else.9568:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r2, 8(%r3)
	stfs	%f0, 8(%r2)	# float
beq_cont.9569:
	lwz	%r5, 4(%r3)
	lfs	%f0, 8(%r5)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	fiszero.2985
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9570
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_isinvert.3094
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	lfs	%f0, 8(%r5)	# float
	stw	%r2, 20(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fisneg.2989
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 20(%r3)
	xor	%r5, %r2, %r2
	lwz	%r5, 0(%r3)
	stw	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_param_b.3100
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fneg_cond.3036
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	stfs	%f0, 16(%r2)	# float
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r5, 4(%r3)
	lfs	%f1, 8(%r5)	# float
	fdiv	%f0, %f0, %f1
	stfs	%f0, 24(%r2)	# float
	b	beq_cont.9571
beq_else.9570:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r2, 8(%r3)
	stfs	%f0, 24(%r2)	# float
beq_cont.9571:
	lwz	%r5, 4(%r3)
	lfs	%f0, 16(%r5)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fiszero.2985
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9572
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_isinvert.3094
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	lfs	%f0, 16(%r5)	# float
	stw	%r2, 28(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fisneg.2989
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 28(%r3)
	xor	%r5, %r2, %r2
	lwz	%r5, 0(%r3)
	stw	%r2, 32(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_c.3102
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 32(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fneg_cond.3036
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	stfs	%f0, 32(%r2)	# float
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r5, 4(%r3)
	lfs	%f1, 16(%r5)	# float
	fdiv	%f0, %f0, %f1
	stfs	%f0, 40(%r2)	# float
	b	beq_cont.9573
beq_else.9572:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r2, 8(%r3)
	stfs	%f0, 40(%r2)	# float
beq_cont.9573:
	blr
setup_surface_table.3269:
	addi	%r6, %r0, 4	# li
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_float_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	lfs	%f0, 0(%r5)	# float
	lwz	%r6, 0(%r3)
	stw	%r2, 8(%r3)
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_param_a.3098
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	lfs	%f1, 8(%r2)	# float
	lwz	%r5, 0(%r3)
	stfs	%f0, 24(%r3)	# float
	stfs	%f1, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	o_param_b.3100
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 24(%r3)	# float
	fadd	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	lfs	%f1, 16(%r2)	# float
	lwz	%r2, 0(%r3)
	stfs	%f0, 40(%r3)	# float
	stfs	%f1, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_param_c.3102
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 48(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 40(%r3)	# float
	fadd	%f0, %f1, %f0
	stfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fispos.2987
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9575
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r2, 8(%r3)
	stfs	%f0, 0(%r2)	# float
	b	beq_cont.9576
beq_else.9575:
	addis	%r31, %r0, (l.7157)@h	# lis
	ori	%r31, %r31, (l.7157)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 56(%r3)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r2, 8(%r3)
	stfs	%f0, 0(%r2)	# float
	lwz	%r5, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	o_param_a.3098
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fdiv	%f0, %f0, %f1
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fneg.2991
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	stfs	%f0, 8(%r2)	# float
	lwz	%r5, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	o_param_b.3100
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fdiv	%f0, %f0, %f1
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fneg.2991
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	stfs	%f0, 16(%r2)	# float
	lwz	%r5, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	o_param_c.3102
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fdiv	%f0, %f0, %f1
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fneg.2991
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	stfs	%f0, 24(%r2)	# float
beq_cont.9576:
	blr
setup_second_table.3272:
	addi	%r6, %r0, 5	# li
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_float_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	lfs	%f0, 0(%r5)	# float
	lfs	%f1, 8(%r5)	# float
	lfs	%f2, 16(%r5)	# float
	lwz	%r6, 0(%r3)
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	quadratic.3203
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	lfs	%f1, 0(%r2)	# float
	lwz	%r5, 0(%r3)
	stfs	%f0, 16(%r3)	# float
	stfs	%f1, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_a.3098
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fmul	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fneg.2991
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	lfs	%f1, 8(%r2)	# float
	lwz	%r5, 0(%r3)
	stfs	%f0, 32(%r3)	# float
	stfs	%f1, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_param_b.3100
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 40(%r3)	# float
	fmul	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	fneg.2991
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	lfs	%f1, 16(%r2)	# float
	lwz	%r5, 0(%r3)
	stfs	%f0, 48(%r3)	# float
	stfs	%f1, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	o_param_c.3102
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fmul	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fneg.2991
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	lfs	%f1, 16(%r3)	# float
	stfs	%f1, 0(%r2)	# float
	lwz	%r5, 0(%r3)
	stfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	o_isrot.3096
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9578
	lwz	%r2, 8(%r3)
	lfs	%f0, 32(%r3)	# float
	stfs	%f0, 8(%r2)	# float
	lfs	%f0, 48(%r3)	# float
	stfs	%f0, 16(%r2)	# float
	lfs	%f0, 64(%r3)	# float
	stfs	%f0, 24(%r2)	# float
	b	beq_cont.9579
beq_else.9578:
	lwz	%r2, 4(%r3)
	lfs	%f0, 16(%r2)	# float
	lwz	%r5, 0(%r3)
	stfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_param_r2.3124
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 72(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	lfs	%f1, 8(%r2)	# float
	lwz	%r5, 0(%r3)
	stfs	%f0, 80(%r3)	# float
	stfs	%f1, 88(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	o_param_r3.3126
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 88(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 80(%r3)	# float
	fadd	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	fhalf.3000
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 8(%r3)
	stfs	%f0, 8(%r2)	# float
	lwz	%r5, 4(%r3)
	lfs	%f0, 16(%r5)	# float
	lwz	%r6, 0(%r3)
	stfs	%f0, 96(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	o_param_r1.3122
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 96(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	lfs	%f1, 0(%r2)	# float
	lwz	%r5, 0(%r3)
	stfs	%f0, 104(%r3)	# float
	stfs	%f1, 112(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	o_param_r3.3126
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 112(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 104(%r3)	# float
	fadd	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	fhalf.3000
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 48(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 8(%r3)
	stfs	%f0, 16(%r2)	# float
	lwz	%r5, 4(%r3)
	lfs	%f0, 8(%r5)	# float
	lwz	%r6, 0(%r3)
	stfs	%f0, 120(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	o_param_r1.3122
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 120(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	lfs	%f1, 0(%r2)	# float
	lwz	%r2, 0(%r3)
	stfs	%f0, 128(%r3)	# float
	stfs	%f1, 136(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 148(%r3)
	addi	%r3, %r3, 152
	bl	o_param_r2.3124
	addi	%r3, %r3, -152	# subi
	lwz	%r31, 148(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 136(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 128(%r3)	# float
	fadd	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 148(%r3)
	addi	%r3, %r3, 152
	bl	fhalf.3000
	addi	%r3, %r3, -152	# subi
	lwz	%r31, 148(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 64(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 8(%r3)
	stfs	%f0, 24(%r2)	# float
beq_cont.9579:
	lfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 148(%r3)
	addi	%r3, %r3, 152
	bl	fiszero.2985
	addi	%r3, %r3, -152	# subi
	lwz	%r31, 148(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9580
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 16(%r3)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r2, 8(%r3)
	stfs	%f0, 32(%r2)	# float
	b	beq_cont.9581
beq_else.9580:
beq_cont.9581:
	lwz	%r2, 8(%r3)
	blr
iter_setup_dirvec_constants.3275:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.9582
	addis	%r6, %r0, (min_caml_objects)@h	# lis
	ori	%r6, %r6, (min_caml_objects)@l
	addi	%r1, %r0, 2	# li
	slw	%r5, %r7, %r1 # swap
	lwzx	%r6, %r6, %r7
	stw	%r5, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	d_const.3151
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 8(%r3)
	stw	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	d_vec.3149
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	stw	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_form.3090
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.9583
	lwz	%r2, 16(%r3)
	lwz	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	setup_rect_table.3266
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 12(%r3)
	stwx	%r2, %r7, %r6
	b	beq_cont.9584
beq_else.9583:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9585
	lwz	%r2, 16(%r3)
	lwz	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	setup_surface_table.3269
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 12(%r3)
	stwx	%r2, %r7, %r6
	b	beq_cont.9586
beq_else.9585:
	lwz	%r2, 16(%r3)
	lwz	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	setup_second_table.3272
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 12(%r3)
	stwx	%r2, %r7, %r6
beq_cont.9586:
beq_cont.9584:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 8(%r3)
	b	iter_setup_dirvec_constants.3275
bge_else.9582:
	blr
setup_dirvec_constants.3278:
	addis	%r5, %r0, (min_caml_n_objects)@h	# lis
	ori	%r5, %r5, (min_caml_n_objects)@l
	lwz	%r5, 0(%r5)
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	b	iter_setup_dirvec_constants.3275
setup_startp_constants.3280:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.9588
	addis	%r6, %r0, (min_caml_objects)@h	# lis
	ori	%r6, %r6, (min_caml_objects)@l
	addi	%r1, %r0, 2	# li
	slw	%r5, %r7, %r1 # swap
	lwzx	%r6, %r6, %r7
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	stw	%r6, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_param_ctbl.3128
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 8(%r3)
	stw	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_form.3090
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	lfs	%f0, 0(%r5)	# float
	lwz	%r6, 8(%r3)
	stw	%r2, 16(%r3)
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_x.3106
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 12(%r3)
	stfs	%f0, 0(%r2)	# float
	lwz	%r5, 4(%r3)
	lfs	%f0, 8(%r5)	# float
	lwz	%r6, 8(%r3)
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	o_param_y.3108
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 12(%r3)
	stfs	%f0, 8(%r2)	# float
	lwz	%r5, 4(%r3)
	lfs	%f0, 16(%r5)	# float
	lwz	%r6, 8(%r3)
	stfs	%f0, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_param_z.3110
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 40(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 12(%r3)
	stfs	%f0, 16(%r2)	# float
	lwz	%r5, 16(%r3)
	cmpwi	%cr7, %r5, 2
	bne	%cr7, beq_else.9590
	lwz	%r5, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_param_abc.3104
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 12(%r3)
	lfs	%f0, 0(%r5)	# float
	lfs	%f1, 8(%r5)	# float
	lfs	%f2, 16(%r5)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	veciprod2.3066
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	stfs	%f0, 24(%r2)	# float
	b	beq_cont.9591
beq_else.9590:
	cmpwi	%cr7, %r5, 2	
	bgt	%cr7, ble_else.9592
	b	ble_cont.9593
ble_else.9592:
	lfs	%f0, 0(%r2)	# float
	lfs	%f1, 8(%r2)	# float
	lfs	%f2, 16(%r2)	# float
	lwz	%r6, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	quadratic.3203
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 16(%r3)
	cmpwi	%cr7, %r2, 3
	bne	%cr7, beq_else.9594
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	beq_cont.9595
beq_else.9594:
beq_cont.9595:
	lwz	%r2, 12(%r3)
	stfs	%f0, 24(%r2)	# float
ble_cont.9593:
beq_cont.9591:
	lwz	%r2, 0(%r3)
	addi	%r5, %r2, -1	# subi %r5, %r2, 1
	lwz	%r2, 4(%r3)
	b	setup_startp_constants.3280
bge_else.9588:
	blr
setup_startp.3283:
	addis	%r5, %r0, (min_caml_startp_fast)@h	# lis
	ori	%r5, %r5, (min_caml_startp_fast)@l
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r28, %r5	# mr %r28, %r5
	or	%r2, %r5, %r2	# mr %r5, %r2
	or	%r28, %r2, %r28	# mr %r2, %r28
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	veccpy.3052
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_n_objects)@h	# lis
	ori	%r2, %r2, (min_caml_n_objects)@l
	lwz	%r2, 0(%r2)
	addi	%r5, %r2, -1	# subi %r5, %r2, 1
	lwz	%r2, 0(%r3)
	b	setup_startp_constants.3280
is_rect_outside.3285:
	stfs	%f2, 0(%r3)	# float
	stfs	%f1, 8(%r3)	# float
	stw	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	fabs.2995
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 16(%r3)
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_a.3098
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fless.2997
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9598
	addi	%r2, %r0, 0	# li
	b	beq_cont.9599
beq_else.9598:
	lfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fabs.2995
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 16(%r3)
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	o_param_b.3100
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fless.2997
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9600
	addi	%r2, %r0, 0	# li
	b	beq_cont.9601
beq_else.9600:
	lfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fabs.2995
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 16(%r3)
	stfs	%f0, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_param_c.3102
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	fless.2997
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9601:
beq_cont.9599:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9602
	lwz	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_isinvert.3094
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9603
	addi	%r2, %r0, 1	# li
	blr
beq_else.9603:
	addi	%r2, %r0, 0	# li
	blr
beq_else.9602:
	lwz	%r2, 16(%r3)
	b	o_isinvert.3094
is_plane_outside.3290:
	stw	%r2, 0(%r3)
	stfs	%f2, 8(%r3)	# float
	stfs	%f1, 16(%r3)	# float
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_abc.3104
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 24(%r3)	# float
	lfs	%f1, 16(%r3)	# float
	lfs	%f2, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	veciprod2.3066
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	o_isinvert.3094
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 32(%r3)	# float
	stw	%r2, 40(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fisneg.2989
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 40(%r3)
	xor	%r5, %r2, %r2
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9605
	addi	%r2, %r0, 1	# li
	blr
beq_else.9605:
	addi	%r2, %r0, 0	# li
	blr
is_second_outside.3295:
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	quadratic.3203
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	stfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_form.3090
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 3
	bne	%cr7, beq_else.9607
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	b	beq_cont.9608
beq_else.9607:
	lfs	%f0, 8(%r3)	# float
beq_cont.9608:
	lwz	%r2, 0(%r3)
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_isinvert.3094
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 16(%r3)	# float
	stw	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fisneg.2989
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 24(%r3)
	xor	%r5, %r2, %r2
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9609
	addi	%r2, %r0, 1	# li
	blr
beq_else.9609:
	addi	%r2, %r0, 0	# li
	blr
is_outside.3300:
	stfs	%f2, 0(%r3)	# float
	stfs	%f1, 8(%r3)	# float
	stw	%r2, 16(%r3)
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_x.3106
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 16(%r3)
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	o_param_y.3108
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 16(%r3)
	stfs	%f0, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_param_z.3110
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 16(%r3)
	stfs	%f0, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_form.3090
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.9611
	lfs	%f0, 32(%r3)	# float
	lfs	%f1, 40(%r3)	# float
	lfs	%f2, 48(%r3)	# float
	lwz	%r2, 16(%r3)
	b	is_rect_outside.3285
beq_else.9611:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9612
	lfs	%f0, 32(%r3)	# float
	lfs	%f1, 40(%r3)	# float
	lfs	%f2, 48(%r3)	# float
	lwz	%r2, 16(%r3)
	b	is_plane_outside.3290
beq_else.9612:
	lfs	%f0, 32(%r3)	# float
	lfs	%f1, 40(%r3)	# float
	lfs	%f2, 48(%r3)	# float
	lwz	%r2, 16(%r3)
	b	is_second_outside.3295
check_all_inside.3305:
	addi	%r1, %r0, 2	# li
	slw	%r2, %r6, %r1 # swap
	lwzx	%r6, %r5, %r6
	cmpwi	%cr7, %r6, -1
	bne	%cr7, beq_else.9613
	addi	%r2, %r0, 1	# li
	blr
beq_else.9613:
	addis	%r7, %r0, (min_caml_objects)@h	# lis
	ori	%r7, %r7, (min_caml_objects)@l
	addi	%r1, %r0, 2	# li
	slw	%r6, %r6, %r1 # swap
	lwzx	%r6, %r7, %r6
	stfs	%f2, 0(%r3)	# float
	stfs	%f1, 8(%r3)	# float
	stfs	%f0, 16(%r3)	# float
	stw	%r5, 24(%r3)
	stw	%r2, 28(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	is_outside.3300
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9614
	lwz	%r2, 28(%r3)
	addi	%r2, %r2, 1
	lfs	%f0, 16(%r3)	# float
	lfs	%f1, 8(%r3)	# float
	lfs	%f2, 0(%r3)	# float
	lwz	%r5, 24(%r3)
	b	check_all_inside.3305
beq_else.9614:
	addi	%r2, %r0, 0	# li
	blr
shadow_check_and_group.3311:
	lwz	%r6, 4(%r29)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r7, %r1 # swap
	lwzx	%r7, %r5, %r7
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.9615
	addi	%r2, %r0, 0	# li
	blr
beq_else.9615:
	addi	%r1, %r0, 2	# li
	slw	%r2, %r7, %r1 # swap
	lwzx	%r7, %r5, %r7
	addis	%r8, %r0, (min_caml_light_dirvec)@h	# lis
	ori	%r8, %r8, (min_caml_light_dirvec)@l
	addis	%r9, %r0, (min_caml_intersection_point)@h	# lis
	ori	%r9, %r9, (min_caml_intersection_point)@l
	stw	%r5, 0(%r3)
	stw	%r29, 4(%r3)
	stw	%r2, 8(%r3)
	stw	%r7, 12(%r3)
	mfspr	%r31, 8	# mflr
	or	%r8, %r5, %r8	# mr %r5, %r8
	or	%r7, %r2, %r7	# mr %r2, %r7
	or	%r6, %r29, %r6	# mr %r29, %r6
	or	%r9, %r6, %r9	# mr %r6, %r9
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r5, %r5, (min_caml_solver_dist)@l
	lfs	%f0, 0(%r5)	# float
	stfs	%f0, 16(%r3)	# float
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9616
	addi	%r2, %r0, 0	# li
	b	beq_cont.9617
beq_else.9616:
	addis	%r31, %r0, (l.7470)@h	# lis
	ori	%r31, %r31, (l.7470)@l
	lfs	%f1, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fless.2997
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9617:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9618
	addis	%r2, %r0, (min_caml_objects)@h	# lis
	ori	%r2, %r2, (min_caml_objects)@l
	lwz	%r5, 12(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwzx	%r2, %r2, %r5
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_isinvert.3094
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9619
	addi	%r2, %r0, 0	# li
	blr
beq_else.9619:
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 0(%r3)
	lwz	%r29, 4(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.9618:
	addis	%r31, %r0, (l.7471)@h	# lis
	ori	%r31, %r31, (l.7471)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 16(%r3)	# float
	fadd	%f0, %f1, %f0
	addis	%r2, %r0, (min_caml_light)@h	# lis
	ori	%r2, %r2, (min_caml_light)@l
	lfs	%f1, 0(%r2)	# float
	fmul	%f1, %f1, %f0
	addis	%r2, %r0, (min_caml_intersection_point)@h	# lis
	ori	%r2, %r2, (min_caml_intersection_point)@l
	lfs	%f2, 0(%r2)	# float
	fadd	%f1, %f1, %f2
	addis	%r2, %r0, (min_caml_light)@h	# lis
	ori	%r2, %r2, (min_caml_light)@l
	lfs	%f2, 8(%r2)	# float
	fmul	%f2, %f2, %f0
	addis	%r2, %r0, (min_caml_intersection_point)@h	# lis
	ori	%r2, %r2, (min_caml_intersection_point)@l
	lfs	%f3, 8(%r2)	# float
	fadd	%f2, %f2, %f3
	addis	%r2, %r0, (min_caml_light)@h	# lis
	ori	%r2, %r2, (min_caml_light)@l
	lfs	%f3, 16(%r2)	# float
	fmul	%f0, %f3, %f0
	addis	%r2, %r0, (min_caml_intersection_point)@h	# lis
	ori	%r2, %r2, (min_caml_intersection_point)@l
	lfs	%f3, 16(%r2)	# float
	fadd	%f0, %f0, %f3
	addi	%r2, %r0, 0	# li
	lwz	%r5, 0(%r3)
	mfspr	%r31, 8	# mflr
	fmr	%f31, %f2
	fmr	%f2, %f0
	fmr	%f0, %f1
	fmr	%f1, %f31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	check_all_inside.3305
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9620
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 0(%r3)
	lwz	%r29, 4(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.9620:
	addi	%r2, %r0, 1	# li
	blr
shadow_check_one_or_group.3314:
	lwz	%r6, 4(%r29)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r7, %r1 # swap
	lwzx	%r7, %r5, %r7
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.9621
	addi	%r2, %r0, 0	# li
	blr
beq_else.9621:
	addis	%r8, %r0, (min_caml_and_net)@h	# lis
	ori	%r8, %r8, (min_caml_and_net)@l
	addi	%r1, %r0, 2	# li
	slw	%r7, %r7, %r1 # swap
	lwzx	%r7, %r8, %r7
	addi	%r8, %r0, 0	# li
	stw	%r5, 0(%r3)
	stw	%r29, 4(%r3)
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r7, %r5, %r7	# mr %r5, %r7
	or	%r8, %r2, %r8	# mr %r2, %r8
	or	%r6, %r29, %r6	# mr %r29, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9622
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 0(%r3)
	lwz	%r29, 4(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.9622:
	addi	%r2, %r0, 1	# li
	blr
shadow_check_one_or_matrix.3317:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r8, %r1 # swap
	lwzx	%r8, %r5, %r8
	lwz	%r9, 0(%r8)
	cmpwi	%cr7, %r9, -1
	bne	%cr7, beq_else.9623
	addi	%r2, %r0, 0	# li
	blr
beq_else.9623:
	stw	%r8, 0(%r3)
	stw	%r7, 4(%r3)
	stw	%r5, 8(%r3)
	stw	%r29, 12(%r3)
	stw	%r2, 16(%r3)
	cmpwi	%cr7, %r9, 99
	bne	%cr7, beq_else.9624
	addi	%r2, %r0, 1	# li
	b	beq_cont.9625
beq_else.9624:
	addis	%r10, %r0, (min_caml_light_dirvec)@h	# lis
	ori	%r10, %r10, (min_caml_light_dirvec)@l
	addis	%r11, %r0, (min_caml_intersection_point)@h	# lis
	ori	%r11, %r11, (min_caml_intersection_point)@l
	mfspr	%r31, 8	# mflr
	or	%r10, %r5, %r10	# mr %r5, %r10
	or	%r9, %r2, %r9	# mr %r2, %r9
	or	%r6, %r29, %r6	# mr %r29, %r6
	or	%r11, %r6, %r11	# mr %r6, %r11
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9626
	addi	%r2, %r0, 0	# li
	b	beq_cont.9627
beq_else.9626:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 0(%r2)	# float
	addis	%r31, %r0, (l.7484)@h	# lis
	ori	%r31, %r31, (l.7484)@l
	lfs	%f1, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	fless.2997
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9628
	addi	%r2, %r0, 0	# li
	b	beq_cont.9629
beq_else.9628:
	addi	%r2, %r0, 1	# li
	lwz	%r5, 0(%r3)
	lwz	%r29, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9630
	addi	%r2, %r0, 0	# li
	b	beq_cont.9631
beq_else.9630:
	addi	%r2, %r0, 1	# li
beq_cont.9631:
beq_cont.9629:
beq_cont.9627:
beq_cont.9625:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9632
	lwz	%r2, 16(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 8(%r3)
	lwz	%r29, 12(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.9632:
	addi	%r2, %r0, 1	# li
	lwz	%r5, 0(%r3)
	lwz	%r29, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9633
	lwz	%r2, 16(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 8(%r3)
	lwz	%r29, 12(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.9633:
	addi	%r2, %r0, 1	# li
	blr
solve_each_element.3320:
	lwz	%r7, 4(%r29)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r8, %r1 # swap
	lwzx	%r8, %r5, %r8
	cmpwi	%cr7, %r8, -1
	bne	%cr7, beq_else.9634
	blr
beq_else.9634:
	addis	%r9, %r0, (min_caml_startp)@h	# lis
	ori	%r9, %r9, (min_caml_startp)@l
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r29, 8(%r3)
	stw	%r2, 12(%r3)
	stw	%r8, 16(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	or	%r8, %r2, %r8	# mr %r2, %r8
	or	%r7, %r29, %r7	# mr %r29, %r7
	or	%r9, %r6, %r9	# mr %r6, %r9
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9636
	addis	%r2, %r0, (min_caml_objects)@h	# lis
	ori	%r2, %r2, (min_caml_objects)@l
	lwz	%r5, 16(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwzx	%r2, %r2, %r5
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_isinvert.3094
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9637
	blr
beq_else.9637:
	lwz	%r2, 12(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 8(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.9636:
	addis	%r5, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r5, %r5, (min_caml_solver_dist)@l
	lfs	%f1, 0(%r5)	# float
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 20(%r3)
	stfs	%f1, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fless.2997
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9639
	b	beq_cont.9640
beq_else.9639:
	addis	%r2, %r0, (min_caml_tmin)@h	# lis
	ori	%r2, %r2, (min_caml_tmin)@l
	lfs	%f1, 0(%r2)	# float
	lfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fless.2997
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9641
	b	beq_cont.9642
beq_else.9641:
	addis	%r31, %r0, (l.7471)@h	# lis
	ori	%r31, %r31, (l.7471)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 24(%r3)	# float
	fadd	%f0, %f1, %f0
	lwz	%r2, 0(%r3)
	lfs	%f1, 0(%r2)	# float
	fmul	%f1, %f1, %f0
	addis	%r5, %r0, (min_caml_startp)@h	# lis
	ori	%r5, %r5, (min_caml_startp)@l
	lfs	%f2, 0(%r5)	# float
	fadd	%f1, %f1, %f2
	lfs	%f2, 8(%r2)	# float
	fmul	%f2, %f2, %f0
	addis	%r5, %r0, (min_caml_startp)@h	# lis
	ori	%r5, %r5, (min_caml_startp)@l
	lfs	%f3, 8(%r5)	# float
	fadd	%f2, %f2, %f3
	lfs	%f3, 16(%r2)	# float
	fmul	%f3, %f3, %f0
	addis	%r5, %r0, (min_caml_startp)@h	# lis
	ori	%r5, %r5, (min_caml_startp)@l
	lfs	%f4, 16(%r5)	# float
	fadd	%f3, %f3, %f4
	addi	%r5, %r0, 0	# li
	lwz	%r6, 4(%r3)
	stfs	%f3, 32(%r3)	# float
	stfs	%f2, 40(%r3)	# float
	stfs	%f1, 48(%r3)	# float
	stfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r6, %r5, %r6	# mr %r5, %r6
	fmr	%f0, %f1
	fmr	%f1, %f2
	fmr	%f2, %f3
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	check_all_inside.3305
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9643
	b	beq_cont.9644
beq_else.9643:
	addis	%r2, %r0, (min_caml_tmin)@h	# lis
	ori	%r2, %r2, (min_caml_tmin)@l
	lfs	%f0, 56(%r3)	# float
	stfs	%f0, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_intersection_point)@h	# lis
	ori	%r2, %r2, (min_caml_intersection_point)@l
	lfs	%f0, 48(%r3)	# float
	lfs	%f1, 40(%r3)	# float
	lfs	%f2, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	vecset.3042
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_intersected_object_id)@h	# lis
	ori	%r2, %r2, (min_caml_intersected_object_id)@l
	lwz	%r5, 16(%r3)
	stw	%r5, 0(%r2)
	addis	%r2, %r0, (min_caml_intsec_rectside)@h	# lis
	ori	%r2, %r2, (min_caml_intsec_rectside)@l
	lwz	%r5, 20(%r3)
	stw	%r5, 0(%r2)
beq_cont.9644:
beq_cont.9642:
beq_cont.9640:
	lwz	%r2, 12(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 8(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
solve_one_or_network.3324:
	lwz	%r7, 4(%r29)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r8, %r1 # swap
	lwzx	%r8, %r5, %r8
	cmpwi	%cr7, %r8, -1
	bne	%cr7, beq_else.9645
	blr
beq_else.9645:
	addis	%r9, %r0, (min_caml_and_net)@h	# lis
	ori	%r9, %r9, (min_caml_and_net)@l
	addi	%r1, %r0, 2	# li
	slw	%r8, %r8, %r1 # swap
	lwzx	%r8, %r9, %r8
	addi	%r9, %r0, 0	# li
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r29, 8(%r3)
	stw	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	or	%r8, %r5, %r8	# mr %r5, %r8
	or	%r9, %r2, %r9	# mr %r2, %r9
	or	%r7, %r29, %r7	# mr %r29, %r7
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 8(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
trace_or_matrix.3328:
	lwz	%r7, 8(%r29)
	lwz	%r8, 4(%r29)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r9, %r1 # swap
	lwzx	%r9, %r5, %r9
	lwz	%r10, 0(%r9)
	cmpwi	%cr7, %r10, -1
	bne	%cr7, beq_else.9647
	blr
beq_else.9647:
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r29, 8(%r3)
	stw	%r2, 12(%r3)
	cmpwi	%cr7, %r10, 99
	bne	%cr7, beq_else.9649
	addi	%r7, %r0, 1	# li
	mfspr	%r31, 8	# mflr
	or	%r9, %r5, %r9	# mr %r5, %r9
	or	%r7, %r2, %r7	# mr %r2, %r7
	or	%r8, %r29, %r8	# mr %r29, %r8
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	b	beq_cont.9650
beq_else.9649:
	addis	%r11, %r0, (min_caml_startp)@h	# lis
	ori	%r11, %r11, (min_caml_startp)@l
	stw	%r9, 16(%r3)
	stw	%r8, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	or	%r10, %r2, %r10	# mr %r2, %r10
	or	%r7, %r29, %r7	# mr %r29, %r7
	or	%r11, %r6, %r11	# mr %r6, %r11
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9651
	b	beq_cont.9652
beq_else.9651:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_tmin)@h	# lis
	ori	%r2, %r2, (min_caml_tmin)@l
	lfs	%f1, 0(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fless.2997
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9653
	b	beq_cont.9654
beq_else.9653:
	addi	%r2, %r0, 1	# li
	lwz	%r5, 16(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 20(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9654:
beq_cont.9652:
beq_cont.9650:
	lwz	%r2, 12(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 8(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
judge_intersection.3332:
	lwz	%r29, 4(%r29)
	addis	%r5, %r0, (min_caml_tmin)@h	# lis
	ori	%r5, %r5, (min_caml_tmin)@l
	addis	%r31, %r0, (l.7504)@h	# lis
	ori	%r31, %r31, (l.7504)@l
	lfs	%f0, 0(%r31)	# float
	stfs	%f0, 0(%r5)	# float
	addi	%r5, %r0, 0	# li
	addis	%r6, %r0, (min_caml_or_net)@h	# lis
	ori	%r6, %r6, (min_caml_or_net)@l
	lwz	%r6, 0(%r6)
	mfspr	%r31, 8	# mflr
	or	%r6, %r28, %r6	# mr %r28, %r6
	or	%r2, %r6, %r2	# mr %r6, %r2
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r28, %r5, %r28	# mr %r5, %r28
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_tmin)@h	# lis
	ori	%r2, %r2, (min_caml_tmin)@l
	lfs	%f1, 0(%r2)	# float
	addis	%r31, %r0, (l.7484)@h	# lis
	ori	%r31, %r31, (l.7484)@l
	lfs	%f0, 0(%r31)	# float
	stfs	%f1, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fless.2997
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9655
	addi	%r2, %r0, 0	# li
	blr
beq_else.9655:
	addis	%r31, %r0, (l.7508)@h	# lis
	ori	%r31, %r31, (l.7508)@l
	lfs	%f1, 0(%r31)	# float
	lfs	%f0, 0(%r3)	# float
	b	fless.2997
solve_each_element_fast.3334:
	lwz	%r7, 4(%r29)
	stw	%r29, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r7, 8(%r3)
	stw	%r5, 12(%r3)
	stw	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	d_vec.3149
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 16(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 12(%r3)
	lwzx	%r6, %r7, %r6
	cmpwi	%cr7, %r6, -1
	bne	%cr7, beq_else.9656
	blr
beq_else.9656:
	lwz	%r8, 4(%r3)
	lwz	%r29, 8(%r3)
	stw	%r2, 20(%r3)
	stw	%r6, 24(%r3)
	mfspr	%r31, 8	# mflr
	or	%r8, %r5, %r8	# mr %r5, %r8
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9658
	addis	%r2, %r0, (min_caml_objects)@h	# lis
	ori	%r2, %r2, (min_caml_objects)@l
	lwz	%r5, 24(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwzx	%r2, %r2, %r5
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_isinvert.3094
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9659
	blr
beq_else.9659:
	lwz	%r2, 16(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 12(%r3)
	lwz	%r6, 4(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.9658:
	addis	%r5, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r5, %r5, (min_caml_solver_dist)@l
	lfs	%f1, 0(%r5)	# float
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 28(%r3)
	stfs	%f1, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fless.2997
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9661
	b	beq_cont.9662
beq_else.9661:
	addis	%r2, %r0, (min_caml_tmin)@h	# lis
	ori	%r2, %r2, (min_caml_tmin)@l
	lfs	%f1, 0(%r2)	# float
	lfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fless.2997
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9663
	b	beq_cont.9664
beq_else.9663:
	addis	%r31, %r0, (l.7471)@h	# lis
	ori	%r31, %r31, (l.7471)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 32(%r3)	# float
	fadd	%f0, %f1, %f0
	lwz	%r2, 20(%r3)
	lfs	%f1, 0(%r2)	# float
	fmul	%f1, %f1, %f0
	addis	%r5, %r0, (min_caml_startp_fast)@h	# lis
	ori	%r5, %r5, (min_caml_startp_fast)@l
	lfs	%f2, 0(%r5)	# float
	fadd	%f1, %f1, %f2
	lfs	%f2, 8(%r2)	# float
	fmul	%f2, %f2, %f0
	addis	%r5, %r0, (min_caml_startp_fast)@h	# lis
	ori	%r5, %r5, (min_caml_startp_fast)@l
	lfs	%f3, 8(%r5)	# float
	fadd	%f2, %f2, %f3
	lfs	%f3, 16(%r2)	# float
	fmul	%f3, %f3, %f0
	addis	%r2, %r0, (min_caml_startp_fast)@h	# lis
	ori	%r2, %r2, (min_caml_startp_fast)@l
	lfs	%f4, 16(%r2)	# float
	fadd	%f3, %f3, %f4
	addi	%r2, %r0, 0	# li
	lwz	%r5, 12(%r3)
	stfs	%f3, 40(%r3)	# float
	stfs	%f2, 48(%r3)	# float
	stfs	%f1, 56(%r3)	# float
	stfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	fmr	%f1, %f2
	fmr	%f2, %f3
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	check_all_inside.3305
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9665
	b	beq_cont.9666
beq_else.9665:
	addis	%r2, %r0, (min_caml_tmin)@h	# lis
	ori	%r2, %r2, (min_caml_tmin)@l
	lfs	%f0, 64(%r3)	# float
	stfs	%f0, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_intersection_point)@h	# lis
	ori	%r2, %r2, (min_caml_intersection_point)@l
	lfs	%f0, 56(%r3)	# float
	lfs	%f1, 48(%r3)	# float
	lfs	%f2, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	vecset.3042
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_intersected_object_id)@h	# lis
	ori	%r2, %r2, (min_caml_intersected_object_id)@l
	lwz	%r5, 24(%r3)
	stw	%r5, 0(%r2)
	addis	%r2, %r0, (min_caml_intsec_rectside)@h	# lis
	ori	%r2, %r2, (min_caml_intsec_rectside)@l
	lwz	%r5, 28(%r3)
	stw	%r5, 0(%r2)
beq_cont.9666:
beq_cont.9664:
beq_cont.9662:
	lwz	%r2, 16(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 12(%r3)
	lwz	%r6, 4(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
solve_one_or_network_fast.3338:
	lwz	%r7, 4(%r29)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r8, %r1 # swap
	lwzx	%r8, %r5, %r8
	cmpwi	%cr7, %r8, -1
	bne	%cr7, beq_else.9667
	blr
beq_else.9667:
	addis	%r9, %r0, (min_caml_and_net)@h	# lis
	ori	%r9, %r9, (min_caml_and_net)@l
	addi	%r1, %r0, 2	# li
	slw	%r8, %r8, %r1 # swap
	lwzx	%r8, %r9, %r8
	addi	%r9, %r0, 0	# li
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r29, 8(%r3)
	stw	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	or	%r8, %r5, %r8	# mr %r5, %r8
	or	%r9, %r2, %r9	# mr %r2, %r9
	or	%r7, %r29, %r7	# mr %r29, %r7
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 8(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
trace_or_matrix_fast.3342:
	lwz	%r7, 8(%r29)
	lwz	%r8, 4(%r29)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r9, %r1 # swap
	lwzx	%r9, %r5, %r9
	lwz	%r10, 0(%r9)
	cmpwi	%cr7, %r10, -1
	bne	%cr7, beq_else.9669
	blr
beq_else.9669:
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r29, 8(%r3)
	stw	%r2, 12(%r3)
	cmpwi	%cr7, %r10, 99
	bne	%cr7, beq_else.9671
	addi	%r7, %r0, 1	# li
	mfspr	%r31, 8	# mflr
	or	%r9, %r5, %r9	# mr %r5, %r9
	or	%r7, %r2, %r7	# mr %r2, %r7
	or	%r8, %r29, %r8	# mr %r29, %r8
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	b	beq_cont.9672
beq_else.9671:
	stw	%r9, 16(%r3)
	stw	%r8, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	or	%r10, %r2, %r10	# mr %r2, %r10
	or	%r7, %r29, %r7	# mr %r29, %r7
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9673
	b	beq_cont.9674
beq_else.9673:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_tmin)@h	# lis
	ori	%r2, %r2, (min_caml_tmin)@l
	lfs	%f1, 0(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fless.2997
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9675
	b	beq_cont.9676
beq_else.9675:
	addi	%r2, %r0, 1	# li
	lwz	%r5, 16(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 20(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9676:
beq_cont.9674:
beq_cont.9672:
	lwz	%r2, 12(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 8(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
judge_intersection_fast.3346:
	lwz	%r29, 4(%r29)
	addis	%r5, %r0, (min_caml_tmin)@h	# lis
	ori	%r5, %r5, (min_caml_tmin)@l
	addis	%r31, %r0, (l.7504)@h	# lis
	ori	%r31, %r31, (l.7504)@l
	lfs	%f0, 0(%r31)	# float
	stfs	%f0, 0(%r5)	# float
	addi	%r5, %r0, 0	# li
	addis	%r6, %r0, (min_caml_or_net)@h	# lis
	ori	%r6, %r6, (min_caml_or_net)@l
	lwz	%r6, 0(%r6)
	mfspr	%r31, 8	# mflr
	or	%r6, %r28, %r6	# mr %r28, %r6
	or	%r2, %r6, %r2	# mr %r6, %r2
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r28, %r5, %r28	# mr %r5, %r28
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_tmin)@h	# lis
	ori	%r2, %r2, (min_caml_tmin)@l
	lfs	%f1, 0(%r2)	# float
	addis	%r31, %r0, (l.7484)@h	# lis
	ori	%r31, %r31, (l.7484)@l
	lfs	%f0, 0(%r31)	# float
	stfs	%f1, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fless.2997
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9677
	addi	%r2, %r0, 0	# li
	blr
beq_else.9677:
	addis	%r31, %r0, (l.7508)@h	# lis
	ori	%r31, %r31, (l.7508)@l
	lfs	%f1, 0(%r31)	# float
	lfs	%f0, 0(%r3)	# float
	b	fless.2997
get_nvector_rect.3348:
	addis	%r5, %r0, (min_caml_intsec_rectside)@h	# lis
	ori	%r5, %r5, (min_caml_intsec_rectside)@l
	lwz	%r5, 0(%r5)
	addis	%r6, %r0, (min_caml_nvector)@h	# lis
	ori	%r6, %r6, (min_caml_nvector)@l
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	vecbzero.3050
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_nvector)@h	# lis
	ori	%r2, %r2, (min_caml_nvector)@l
	lwz	%r5, 4(%r3)
	addi	%r6, %r5, -1	# subi %r6, %r5, 1
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	addi	%r1, %r0, 3	# li
	slw	%r5, %r5, %r1 # swap
	lwz	%r7, 0(%r3)
	lfdx	%f0, %r7, %r5
	stw	%r2, 8(%r3)
	stw	%r6, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	sgn.3034
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	fneg.2991
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	addi	%r1, %r0, 3	# li
	slw	%r2, %r2, %r1 # swap
	lwz	%r5, 8(%r3)
	stfdx	%f0, %r5, %r2
	blr
get_nvector_plane.3350:
	addis	%r5, %r0, (min_caml_nvector)@h	# lis
	ori	%r5, %r5, (min_caml_nvector)@l
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_param_a.3098
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fneg.2991
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	stfs	%f0, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_nvector)@h	# lis
	ori	%r2, %r2, (min_caml_nvector)@l
	lwz	%r5, 0(%r3)
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_param_b.3100
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fneg.2991
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	stfs	%f0, 8(%r2)	# float
	addis	%r2, %r0, (min_caml_nvector)@h	# lis
	ori	%r2, %r2, (min_caml_nvector)@l
	lwz	%r5, 0(%r3)
	stw	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_param_c.3102
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	fneg.2991
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	stfs	%f0, 16(%r2)	# float
	blr
get_nvector_second.3352:
	lwz	%r5, 4(%r29)
	addis	%r6, %r0, (min_caml_intersection_point)@h	# lis
	ori	%r6, %r6, (min_caml_intersection_point)@l
	lfs	%f0, 0(%r6)	# float
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	stfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_param_x.3106
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r2, %r0, (min_caml_intersection_point)@h	# lis
	ori	%r2, %r2, (min_caml_intersection_point)@l
	lfs	%f1, 8(%r2)	# float
	lwz	%r2, 4(%r3)
	stfs	%f0, 16(%r3)	# float
	stfs	%f1, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_y.3108
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r2, %r0, (min_caml_intersection_point)@h	# lis
	ori	%r2, %r2, (min_caml_intersection_point)@l
	lfs	%f1, 16(%r2)	# float
	lwz	%r2, 4(%r3)
	stfs	%f0, 32(%r3)	# float
	stfs	%f1, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_param_z.3110
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 40(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	stfs	%f0, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_param_a.3098
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	stfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	o_param_b.3100
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	stfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	o_param_c.3102
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 48(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	stfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_isrot.3096
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9680
	addis	%r2, %r0, (min_caml_nvector)@h	# lis
	ori	%r2, %r2, (min_caml_nvector)@l
	lfs	%f0, 56(%r3)	# float
	stfs	%f0, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_nvector)@h	# lis
	ori	%r2, %r2, (min_caml_nvector)@l
	lfs	%f0, 64(%r3)	# float
	stfs	%f0, 8(%r2)	# float
	addis	%r2, %r0, (min_caml_nvector)@h	# lis
	ori	%r2, %r2, (min_caml_nvector)@l
	lfs	%f0, 72(%r3)	# float
	stfs	%f0, 16(%r2)	# float
	b	beq_cont.9681
beq_else.9680:
	addis	%r2, %r0, (min_caml_nvector)@h	# lis
	ori	%r2, %r2, (min_caml_nvector)@l
	lwz	%r5, 4(%r3)
	stw	%r2, 80(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_param_r3.3126
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	stfs	%f0, 88(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	o_param_r2.3124
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 48(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f2, 88(%r3)	# float
	fadd	%f0, %f2, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	fhalf.3000
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fadd	%f0, %f1, %f0
	lwz	%r2, 80(%r3)
	stfs	%f0, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_nvector)@h	# lis
	ori	%r2, %r2, (min_caml_nvector)@l
	lwz	%r5, 4(%r3)
	stw	%r2, 96(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	o_param_r3.3126
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	stfs	%f0, 104(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	o_param_r1.3122
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 48(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 104(%r3)	# float
	fadd	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	fhalf.3000
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 64(%r3)	# float
	fadd	%f0, %f1, %f0
	lwz	%r2, 96(%r3)
	stfs	%f0, 8(%r2)	# float
	addis	%r2, %r0, (min_caml_nvector)@h	# lis
	ori	%r2, %r2, (min_caml_nvector)@l
	lwz	%r5, 4(%r3)
	stw	%r2, 112(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	o_param_r2.3124
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	stfs	%f0, 120(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	o_param_r1.3122
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 120(%r3)	# float
	fadd	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	fhalf.3000
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 72(%r3)	# float
	fadd	%f0, %f1, %f0
	lwz	%r2, 112(%r3)
	stfs	%f0, 16(%r2)	# float
beq_cont.9681:
	addis	%r2, %r0, (min_caml_nvector)@h	# lis
	ori	%r2, %r2, (min_caml_nvector)@l
	lwz	%r5, 4(%r3)
	stw	%r2, 128(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	o_isinvert.3094
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 128(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
get_nvector.3354:
	lwz	%r6, 4(%r29)
	stw	%r6, 0(%r3)
	stw	%r2, 4(%r3)
	stw	%r5, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_form.3090
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.9685
	lwz	%r2, 8(%r3)
	b	get_nvector_rect.3348
beq_else.9685:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9686
	lwz	%r2, 4(%r3)
	b	get_nvector_plane.3350
beq_else.9686:
	lwz	%r2, 4(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
utexture.3357:
	lwz	%r6, 4(%r29)
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_texturetype.3088
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, (min_caml_texture_color)@h	# lis
	ori	%r5, %r5, (min_caml_texture_color)@l
	lwz	%r6, 8(%r3)
	stw	%r2, 12(%r3)
	stw	%r5, 16(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_color_red.3116
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 16(%r3)
	stfs	%f0, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_texture_color)@h	# lis
	ori	%r2, %r2, (min_caml_texture_color)@l
	lwz	%r5, 8(%r3)
	stw	%r2, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_color_green.3118
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 20(%r3)
	stfs	%f0, 8(%r2)	# float
	addis	%r2, %r0, (min_caml_texture_color)@h	# lis
	ori	%r2, %r2, (min_caml_texture_color)@l
	lwz	%r5, 8(%r3)
	stw	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_color_blue.3120
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	stfs	%f0, 16(%r2)	# float
	lwz	%r2, 12(%r3)
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.9687
	lwz	%r2, 4(%r3)
	lfs	%f0, 0(%r2)	# float
	lwz	%r5, 8(%r3)
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	o_param_x.3106
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.7569)@h	# lis
	ori	%r31, %r31, (l.7569)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f0, %f1
	stfs	%f0, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	floor.3008
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7570)@h	# lis
	ori	%r31, %r31, (l.7570)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 40(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.7156)@h	# lis
	ori	%r31, %r31, (l.7156)@l
	lfs	%f1, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	fless.2997
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	lfs	%f0, 16(%r5)	# float
	lwz	%r5, 8(%r3)
	stw	%r2, 48(%r3)
	stfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	o_param_z.3110
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.7569)@h	# lis
	ori	%r31, %r31, (l.7569)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f0, %f1
	stfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	floor.3008
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7570)@h	# lis
	ori	%r31, %r31, (l.7570)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 64(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.7156)@h	# lis
	ori	%r31, %r31, (l.7156)@l
	lfs	%f1, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fless.2997
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, (min_caml_texture_color)@h	# lis
	ori	%r5, %r5, (min_caml_texture_color)@l
	lwz	%r6, 48(%r3)
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.9690
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9692
	addis	%r31, %r0, (l.7557)@h	# lis
	ori	%r31, %r31, (l.7557)@l
	lfs	%f0, 0(%r31)	# float
	b	beq_cont.9693
beq_else.9692:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.9693:
	b	beq_cont.9691
beq_else.9690:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9694
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	b	beq_cont.9695
beq_else.9694:
	addis	%r31, %r0, (l.7557)@h	# lis
	ori	%r31, %r31, (l.7557)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.9695:
beq_cont.9691:
	stfs	%f0, 8(%r5)	# float
	blr
beq_else.9687:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9697
	lwz	%r2, 4(%r3)
	lfs	%f0, 8(%r2)	# float
	addis	%r31, %r0, (l.7565)@h	# lis
	ori	%r31, %r31, (l.7565)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	sin.2977
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fsqr.3002
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_texture_color)@h	# lis
	ori	%r2, %r2, (min_caml_texture_color)@l
	addis	%r31, %r0, (l.7557)@h	# lis
	ori	%r31, %r31, (l.7557)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f1, %f0
	stfs	%f1, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_texture_color)@h	# lis
	ori	%r2, %r2, (min_caml_texture_color)@l
	addis	%r31, %r0, (l.7557)@h	# lis
	ori	%r31, %r31, (l.7557)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	stfs	%f0, 8(%r2)	# float
	blr
beq_else.9697:
	cmpwi	%cr7, %r2, 3
	bne	%cr7, beq_else.9699
	lwz	%r2, 4(%r3)
	lfs	%f0, 0(%r2)	# float
	lwz	%r5, 8(%r3)
	stfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_param_x.3106
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 72(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	lfs	%f1, 16(%r2)	# float
	lwz	%r2, 8(%r3)
	stfs	%f0, 80(%r3)	# float
	stfs	%f1, 88(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	o_param_z.3110
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 88(%r3)	# float
	fsub	%f0, %f1, %f0
	lfs	%f1, 80(%r3)	# float
	stfs	%f0, 96(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	fsqr.3002
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 96(%r3)	# float
	stfs	%f0, 104(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	fsqr.3002
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 104(%r3)	# float
	fadd	%f0, %f1, %f0
	lwz	%r29, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7156)@h	# lis
	ori	%r31, %r31, (l.7156)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	stfs	%f0, 112(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	floor.3008
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 112(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.7554)@h	# lis
	ori	%r31, %r31, (l.7554)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	mfspr	%r31, 8	# mflr
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	cos.2979
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	fsqr.3002
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_texture_color)@h	# lis
	ori	%r2, %r2, (min_caml_texture_color)@l
	addis	%r31, %r0, (l.7557)@h	# lis
	ori	%r31, %r31, (l.7557)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f0, %f1
	stfs	%f1, 8(%r2)	# float
	addis	%r2, %r0, (min_caml_texture_color)@h	# lis
	ori	%r2, %r2, (min_caml_texture_color)@l
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.7557)@h	# lis
	ori	%r31, %r31, (l.7557)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	stfs	%f0, 16(%r2)	# float
	blr
beq_else.9699:
	cmpwi	%cr7, %r2, 4
	bne	%cr7, beq_else.9701
	lwz	%r2, 4(%r3)
	lfs	%f0, 0(%r2)	# float
	lwz	%r5, 8(%r3)
	stfs	%f0, 120(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	o_param_x.3106
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 120(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 8(%r3)
	stfs	%f0, 128(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 140(%r3)
	addi	%r3, %r3, 144
	bl	o_param_a.3098
	addi	%r3, %r3, -144	# subi
	lwz	%r31, 140(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r29, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 140(%r3)
	addi	%r3, %r3, 144
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -144	# subi
	lwz	%r31, 140(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 128(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	lfs	%f1, 16(%r2)	# float
	lwz	%r5, 8(%r3)
	stfs	%f0, 136(%r3)	# float
	stfs	%f1, 144(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 156(%r3)
	addi	%r3, %r3, 160
	bl	o_param_z.3110
	addi	%r3, %r3, -160	# subi
	lwz	%r31, 156(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 144(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 8(%r3)
	stfs	%f0, 152(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 164(%r3)
	addi	%r3, %r3, 168
	bl	o_param_c.3102
	addi	%r3, %r3, -168	# subi
	lwz	%r31, 164(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r29, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 164(%r3)
	addi	%r3, %r3, 168
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -168	# subi
	lwz	%r31, 164(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 152(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 136(%r3)	# float
	stfs	%f0, 160(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 172(%r3)
	addi	%r3, %r3, 176
	bl	fsqr.3002
	addi	%r3, %r3, -176	# subi
	lwz	%r31, 172(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 160(%r3)	# float
	stfs	%f0, 168(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 180(%r3)
	addi	%r3, %r3, 184
	bl	fsqr.3002
	addi	%r3, %r3, -184	# subi
	lwz	%r31, 180(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 168(%r3)	# float
	fadd	%f0, %f1, %f0
	lfs	%f1, 136(%r3)	# float
	stfs	%f0, 176(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 188(%r3)
	addi	%r3, %r3, 192
	bl	fabs.2995
	addi	%r3, %r3, -192	# subi
	lwz	%r31, 188(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7551)@h	# lis
	ori	%r31, %r31, (l.7551)@l
	lfs	%f1, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 188(%r3)
	addi	%r3, %r3, 192
	bl	fless.2997
	addi	%r3, %r3, -192	# subi
	lwz	%r31, 188(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9702
	lfs	%f0, 136(%r3)	# float
	lfs	%f1, 160(%r3)	# float
	fdiv	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 188(%r3)
	addi	%r3, %r3, 192
	bl	fabs.2995
	addi	%r3, %r3, -192	# subi
	lwz	%r31, 188(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 188(%r3)
	addi	%r3, %r3, 192
	bl	atan.2983
	addi	%r3, %r3, -192	# subi
	lwz	%r31, 188(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7553)@h	# lis
	ori	%r31, %r31, (l.7553)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.7554)@h	# lis
	ori	%r31, %r31, (l.7554)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	b	beq_cont.9703
beq_else.9702:
	addis	%r31, %r0, (l.7552)@h	# lis
	ori	%r31, %r31, (l.7552)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.9703:
	stfs	%f0, 184(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 196(%r3)
	addi	%r3, %r3, 200
	bl	floor.3008
	addi	%r3, %r3, -200	# subi
	lwz	%r31, 196(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 184(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	lfs	%f1, 8(%r2)	# float
	lwz	%r2, 8(%r3)
	stfs	%f0, 192(%r3)	# float
	stfs	%f1, 200(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 212(%r3)
	addi	%r3, %r3, 216
	bl	o_param_y.3108
	addi	%r3, %r3, -216	# subi
	lwz	%r31, 212(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 200(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 8(%r3)
	stfs	%f0, 208(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 220(%r3)
	addi	%r3, %r3, 224
	bl	o_param_b.3100
	addi	%r3, %r3, -224	# subi
	lwz	%r31, 220(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r29, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 220(%r3)
	addi	%r3, %r3, 224
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -224	# subi
	lwz	%r31, 220(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 208(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 176(%r3)	# float
	stfs	%f0, 216(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 228(%r3)
	addi	%r3, %r3, 232
	bl	fabs.2995
	addi	%r3, %r3, -232	# subi
	lwz	%r31, 228(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7551)@h	# lis
	ori	%r31, %r31, (l.7551)@l
	lfs	%f1, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 228(%r3)
	addi	%r3, %r3, 232
	bl	fless.2997
	addi	%r3, %r3, -232	# subi
	lwz	%r31, 228(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9704
	lfs	%f0, 176(%r3)	# float
	lfs	%f1, 216(%r3)	# float
	fdiv	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 228(%r3)
	addi	%r3, %r3, 232
	bl	fabs.2995
	addi	%r3, %r3, -232	# subi
	lwz	%r31, 228(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 228(%r3)
	addi	%r3, %r3, 232
	bl	atan.2983
	addi	%r3, %r3, -232	# subi
	lwz	%r31, 228(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7553)@h	# lis
	ori	%r31, %r31, (l.7553)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.7554)@h	# lis
	ori	%r31, %r31, (l.7554)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	b	beq_cont.9705
beq_else.9704:
	addis	%r31, %r0, (l.7552)@h	# lis
	ori	%r31, %r31, (l.7552)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.9705:
	stfs	%f0, 224(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 236(%r3)
	addi	%r3, %r3, 240
	bl	floor.3008
	addi	%r3, %r3, -240	# subi
	lwz	%r31, 236(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 224(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.7556)@h	# lis
	ori	%r31, %r31, (l.7556)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7132)@h	# lis
	ori	%r31, %r31, (l.7132)@l
	lfs	%f2, 0(%r31)	# float
	lfs	%f3, 192(%r3)	# float
	fsub	%f2, %f2, %f3
	stfs	%f0, 232(%r3)	# float
	stfs	%f1, 240(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f2
	stw	%r31, 252(%r3)
	addi	%r3, %r3, 256
	bl	fsqr.3002
	addi	%r3, %r3, -256	# subi
	lwz	%r31, 252(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 240(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.7132)@h	# lis
	ori	%r31, %r31, (l.7132)@l
	lfs	%f1, 0(%r31)	# float
	lfs	%f2, 232(%r3)	# float
	fsub	%f1, %f1, %f2
	stfs	%f0, 248(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 260(%r3)
	addi	%r3, %r3, 264
	bl	fsqr.3002
	addi	%r3, %r3, -264	# subi
	lwz	%r31, 260(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 248(%r3)	# float
	fsub	%f0, %f1, %f0
	stfs	%f0, 256(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 268(%r3)
	addi	%r3, %r3, 272
	bl	fisneg.2989
	addi	%r3, %r3, -272	# subi
	lwz	%r31, 268(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9706
	lfs	%f0, 256(%r3)	# float
	b	beq_cont.9707
beq_else.9706:
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.9707:
	addis	%r2, %r0, (min_caml_texture_color)@h	# lis
	ori	%r2, %r2, (min_caml_texture_color)@l
	addis	%r31, %r0, (l.7557)@h	# lis
	ori	%r31, %r31, (l.7557)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f1, %f0
	addis	%r31, %r0, (l.7558)@h	# lis
	ori	%r31, %r31, (l.7558)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	stfs	%f0, 16(%r2)	# float
	blr
beq_else.9701:
	blr
add_light.3360:
	stfs	%f2, 0(%r3)	# float
	stfs	%f1, 8(%r3)	# float
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fispos.2987
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9710
	b	beq_cont.9711
beq_else.9710:
	addis	%r2, %r0, (min_caml_rgb)@h	# lis
	ori	%r2, %r2, (min_caml_rgb)@l
	addis	%r5, %r0, (min_caml_texture_color)@h	# lis
	ori	%r5, %r5, (min_caml_texture_color)@l
	lfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	vecaccum.3071
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9711:
	lfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fispos.2987
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9712
	blr
beq_else.9712:
	lfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fsqr.3002
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fsqr.3002
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fmul	%f0, %f0, %f1
	addis	%r2, %r0, (min_caml_rgb)@h	# lis
	ori	%r2, %r2, (min_caml_rgb)@l
	addis	%r5, %r0, (min_caml_rgb)@h	# lis
	ori	%r5, %r5, (min_caml_rgb)@l
	lfs	%f1, 0(%r5)	# float
	fadd	%f1, %f1, %f0
	stfs	%f1, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_rgb)@h	# lis
	ori	%r2, %r2, (min_caml_rgb)@l
	addis	%r5, %r0, (min_caml_rgb)@h	# lis
	ori	%r5, %r5, (min_caml_rgb)@l
	lfs	%f1, 8(%r5)	# float
	fadd	%f1, %f1, %f0
	stfs	%f1, 8(%r2)	# float
	addis	%r2, %r0, (min_caml_rgb)@h	# lis
	ori	%r2, %r2, (min_caml_rgb)@l
	addis	%r5, %r0, (min_caml_rgb)@h	# lis
	ori	%r5, %r5, (min_caml_rgb)@l
	lfs	%f1, 16(%r5)	# float
	fadd	%f0, %f1, %f0
	stfs	%f0, 16(%r2)	# float
	blr
trace_reflections.3364:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9715
	addis	%r8, %r0, (min_caml_reflections)@h	# lis
	ori	%r8, %r8, (min_caml_reflections)@l
	addi	%r1, %r0, 2	# li
	slw	%r2, %r9, %r1 # swap
	lwzx	%r8, %r8, %r9
	stw	%r29, 0(%r3)
	stw	%r2, 4(%r3)
	stfs	%f1, 8(%r3)	# float
	stw	%r5, 16(%r3)
	stfs	%f0, 24(%r3)	# float
	stw	%r6, 32(%r3)
	stw	%r8, 36(%r3)
	stw	%r7, 40(%r3)
	mfspr	%r31, 8	# mflr
	or	%r8, %r2, %r8	# mr %r2, %r8
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	r_dvec.3155
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r29, 40(%r3)
	stw	%r2, 44(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9717
	b	beq_cont.9718
beq_else.9717:
	addis	%r2, %r0, (min_caml_intersected_object_id)@h	# lis
	ori	%r2, %r2, (min_caml_intersected_object_id)@l
	lwz	%r2, 0(%r2)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r2, %r1 # swap
	addis	%r5, %r0, (min_caml_intsec_rectside)@h	# lis
	ori	%r5, %r5, (min_caml_intsec_rectside)@l
	lwz	%r5, 0(%r5)
	add	%r2, %r2, %r5
	lwz	%r5, 36(%r3)
	stw	%r2, 48(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	r_surface_id.3153
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 48(%r3)
	cmp	%cr7, %r5, %r2
	bne	%cr7, beq_else.9719
	addi	%r2, %r0, 0	# li
	addis	%r5, %r0, (min_caml_or_net)@h	# lis
	ori	%r5, %r5, (min_caml_or_net)@l
	lwz	%r5, 0(%r5)
	lwz	%r29, 32(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9721
	addis	%r2, %r0, (min_caml_nvector)@h	# lis
	ori	%r2, %r2, (min_caml_nvector)@l
	lwz	%r5, 44(%r3)
	stw	%r2, 52(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	d_vec.3149
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 52(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	veciprod.3063
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 36(%r3)
	stfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	r_bright.3157
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fmul	%f2, %f0, %f1
	lfs	%f3, 56(%r3)	# float
	fmul	%f2, %f2, %f3
	lwz	%r2, 44(%r3)
	stfs	%f2, 64(%r3)	# float
	stfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	d_vec.3149
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	veciprod.3063
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 72(%r3)	# float
	fmul	%f1, %f1, %f0
	lfs	%f0, 64(%r3)	# float
	lfs	%f2, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	add_light.3360
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	b	beq_cont.9722
beq_else.9721:
beq_cont.9722:
	b	beq_cont.9720
beq_else.9719:
beq_cont.9720:
beq_cont.9718:
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lfs	%f0, 24(%r3)	# float
	lfs	%f1, 8(%r3)	# float
	lwz	%r5, 16(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
bge_else.9715:
	blr
trace_ray.3369:
	lwz	%r7, 20(%r29)
	lwz	%r8, 16(%r29)
	lwz	%r9, 12(%r29)
	lwz	%r10, 8(%r29)
	lwz	%r11, 4(%r29)
	cmpwi	%cr7, %r2, 4
	bgt	%cr7, ble_else.9724
	stw	%r29, 0(%r3)
	stfs	%f1, 8(%r3)	# float
	stw	%r8, 16(%r3)
	stw	%r9, 20(%r3)
	stw	%r6, 24(%r3)
	stw	%r7, 28(%r3)
	stw	%r11, 32(%r3)
	stfs	%f0, 40(%r3)	# float
	stw	%r2, 48(%r3)
	stw	%r5, 52(%r3)
	stw	%r10, 56(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	p_surface_ids.3134
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 52(%r3)
	lwz	%r29, 56(%r3)
	stw	%r2, 60(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9727
	addi	%r2, %r0, -1	# li
	lwz	%r5, 48(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 60(%r3)
	stwx	%r2, %r7, %r6
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.9728
	blr
beq_else.9728:
	addis	%r5, %r0, (min_caml_light)@h	# lis
	ori	%r5, %r5, (min_caml_light)@l
	lwz	%r2, 52(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	veciprod.3063
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fneg.2991
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fispos.2987
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9730
	blr
beq_else.9730:
	lfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fsqr.3002
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 64(%r3)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 40(%r3)	# float
	fmul	%f0, %f0, %f1
	addis	%r2, %r0, (min_caml_beam)@h	# lis
	ori	%r2, %r2, (min_caml_beam)@l
	lfs	%f1, 0(%r2)	# float
	fmul	%f0, %f0, %f1
	addis	%r2, %r0, (min_caml_rgb)@h	# lis
	ori	%r2, %r2, (min_caml_rgb)@l
	addis	%r5, %r0, (min_caml_rgb)@h	# lis
	ori	%r5, %r5, (min_caml_rgb)@l
	lfs	%f1, 0(%r5)	# float
	fadd	%f1, %f1, %f0
	stfs	%f1, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_rgb)@h	# lis
	ori	%r2, %r2, (min_caml_rgb)@l
	addis	%r5, %r0, (min_caml_rgb)@h	# lis
	ori	%r5, %r5, (min_caml_rgb)@l
	lfs	%f1, 8(%r5)	# float
	fadd	%f1, %f1, %f0
	stfs	%f1, 8(%r2)	# float
	addis	%r2, %r0, (min_caml_rgb)@h	# lis
	ori	%r2, %r2, (min_caml_rgb)@l
	addis	%r5, %r0, (min_caml_rgb)@h	# lis
	ori	%r5, %r5, (min_caml_rgb)@l
	lfs	%f1, 16(%r5)	# float
	fadd	%f0, %f1, %f0
	stfs	%f0, 16(%r2)	# float
	blr
beq_else.9727:
	addis	%r2, %r0, (min_caml_intersected_object_id)@h	# lis
	ori	%r2, %r2, (min_caml_intersected_object_id)@l
	lwz	%r2, 0(%r2)
	addis	%r5, %r0, (min_caml_objects)@h	# lis
	ori	%r5, %r5, (min_caml_objects)@l
	addi	%r1, %r0, 2	# li
	slw	%r2, %r6, %r1 # swap
	lwzx	%r5, %r5, %r6
	stw	%r2, 72(%r3)
	stw	%r5, 76(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_reflectiontype.3092
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 76(%r3)
	stw	%r2, 80(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_diffuse.3112
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 40(%r3)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 76(%r3)
	lwz	%r5, 52(%r3)
	lwz	%r29, 32(%r3)
	stfs	%f0, 88(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_startp)@h	# lis
	ori	%r2, %r2, (min_caml_startp)@l
	addis	%r5, %r0, (min_caml_intersection_point)@h	# lis
	ori	%r5, %r5, (min_caml_intersection_point)@l
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	veccpy.3052
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, (min_caml_intersection_point)@h	# lis
	ori	%r5, %r5, (min_caml_intersection_point)@l
	lwz	%r2, 76(%r3)
	lwz	%r29, 28(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 72(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r2, %r1 # swap
	addis	%r5, %r0, (min_caml_intsec_rectside)@h	# lis
	ori	%r5, %r5, (min_caml_intsec_rectside)@l
	lwz	%r5, 0(%r5)
	add	%r2, %r2, %r5
	lwz	%r5, 48(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 60(%r3)
	stwx	%r2, %r7, %r6
	lwz	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	p_intersection_points.3132
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 48(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwzx	%r2, %r2, %r6
	addis	%r6, %r0, (min_caml_intersection_point)@h	# lis
	ori	%r6, %r6, (min_caml_intersection_point)@l
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	veccpy.3052
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	p_calc_diffuse.3136
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 76(%r3)
	stw	%r2, 96(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	o_diffuse.3112
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7132)@h	# lis
	ori	%r31, %r31, (l.7132)@l
	lfs	%f1, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	fless.2997
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9734
	addi	%r2, %r0, 1	# li
	lwz	%r5, 48(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 96(%r3)
	stwx	%r2, %r7, %r6
	lwz	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	p_energy.3138
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 48(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwzx	%r6, %r2, %r6
	addis	%r7, %r0, (min_caml_texture_color)@h	# lis
	ori	%r7, %r7, (min_caml_texture_color)@l
	stw	%r2, 100(%r3)
	mfspr	%r31, 8	# mflr
	or	%r7, %r5, %r7	# mr %r5, %r7
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	veccpy.3052
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 48(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r5, %r1 # swap
	lwz	%r6, 100(%r3)
	lwzx	%r5, %r6, %r5
	addis	%r31, %r0, (l.7592)@h	# lis
	ori	%r31, %r31, (l.7592)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 88(%r3)	# float
	fmul	%f0, %f0, %f1
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	vecscale.3081
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	p_nvectors.3147
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 48(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwzx	%r2, %r2, %r6
	addis	%r6, %r0, (min_caml_nvector)@h	# lis
	ori	%r6, %r6, (min_caml_nvector)@l
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	veccpy.3052
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	b	beq_cont.9735
beq_else.9734:
	addi	%r2, %r0, 0	# li
	lwz	%r5, 48(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 96(%r3)
	stwx	%r2, %r7, %r6
beq_cont.9735:
	addis	%r31, %r0, (l.7594)@h	# lis
	ori	%r31, %r31, (l.7594)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r5, %r0, (min_caml_nvector)@h	# lis
	ori	%r5, %r5, (min_caml_nvector)@l
	lwz	%r2, 52(%r3)
	stfs	%f0, 104(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	veciprod.3063
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 104(%r3)	# float
	fmul	%f0, %f1, %f0
	addis	%r5, %r0, (min_caml_nvector)@h	# lis
	ori	%r5, %r5, (min_caml_nvector)@l
	lwz	%r2, 52(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	vecaccum.3071
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 76(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	o_hilight.3114
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 40(%r3)	# float
	fmul	%f0, %f1, %f0
	addi	%r2, %r0, 0	# li
	addis	%r5, %r0, (min_caml_or_net)@h	# lis
	ori	%r5, %r5, (min_caml_or_net)@l
	lwz	%r5, 0(%r5)
	lwz	%r29, 20(%r3)
	stfs	%f0, 112(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9736
	addis	%r2, %r0, (min_caml_nvector)@h	# lis
	ori	%r2, %r2, (min_caml_nvector)@l
	addis	%r5, %r0, (min_caml_light)@h	# lis
	ori	%r5, %r5, (min_caml_light)@l
	mfspr	%r31, 8	# mflr
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	veciprod.3063
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	fneg.2991
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 88(%r3)	# float
	fmul	%f0, %f0, %f1
	addis	%r5, %r0, (min_caml_light)@h	# lis
	ori	%r5, %r5, (min_caml_light)@l
	lwz	%r2, 52(%r3)
	stfs	%f0, 120(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	veciprod.3063
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	fneg.2991
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 120(%r3)	# float
	lfs	%f2, 112(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	add_light.3360
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	b	beq_cont.9737
beq_else.9736:
beq_cont.9737:
	addis	%r2, %r0, (min_caml_intersection_point)@h	# lis
	ori	%r2, %r2, (min_caml_intersection_point)@l
	mfspr	%r31, 8	# mflr
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	setup_startp.3283
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_n_reflections)@h	# lis
	ori	%r2, %r2, (min_caml_n_reflections)@l
	lwz	%r2, 0(%r2)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lfs	%f0, 88(%r3)	# float
	lfs	%f1, 112(%r3)	# float
	lwz	%r5, 52(%r3)
	lwz	%r29, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7155)@h	# lis
	ori	%r31, %r31, (l.7155)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	fless.2997
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9738
	blr
beq_else.9738:
	lwz	%r2, 48(%r3)
	cmpwi	%cr7, %r2, 4
	blt	%cr7, bge_else.9740
	b	bge_cont.9741
bge_else.9740:
	addi	%r5, %r2, 1
	addi	%r6, %r0, -1	# li
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwz	%r7, 60(%r3)
	stwx	%r6, %r7, %r5
bge_cont.9741:
	lwz	%r5, 80(%r3)
	cmpwi	%cr7, %r5, 2
	bne	%cr7, beq_else.9742
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r5, 76(%r3)
	stfs	%f0, 128(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 140(%r3)
	addi	%r3, %r3, 144
	bl	o_diffuse.3112
	addi	%r3, %r3, -144	# subi
	lwz	%r31, 140(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 128(%r3)	# float
	fsub	%f0, %f1, %f0
	lfs	%f1, 40(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 48(%r3)
	addi	%r2, %r2, 1
	addis	%r5, %r0, (min_caml_tmin)@h	# lis
	ori	%r5, %r5, (min_caml_tmin)@l
	lfs	%f1, 0(%r5)	# float
	lfs	%f2, 8(%r3)	# float
	fadd	%f1, %f2, %f1
	lwz	%r5, 52(%r3)
	lwz	%r6, 24(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.9742:
	blr
ble_else.9724:
	blr
trace_diffuse_ray.3375:
	lwz	%r5, 16(%r29)
	lwz	%r6, 12(%r29)
	lwz	%r7, 8(%r29)
	lwz	%r8, 4(%r29)
	stfs	%f0, 0(%r3)	# float
	stw	%r6, 8(%r3)
	stw	%r5, 12(%r3)
	stw	%r8, 16(%r3)
	stw	%r2, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r7, %r29, %r7	# mr %r29, %r7
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9745
	blr
beq_else.9745:
	addis	%r2, %r0, (min_caml_objects)@h	# lis
	ori	%r2, %r2, (min_caml_objects)@l
	addis	%r5, %r0, (min_caml_intersected_object_id)@h	# lis
	ori	%r5, %r5, (min_caml_intersected_object_id)@l
	lwz	%r5, 0(%r5)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwzx	%r2, %r2, %r5
	lwz	%r5, 20(%r3)
	stw	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	d_vec.3149
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	lwz	%r29, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, (min_caml_intersection_point)@h	# lis
	ori	%r5, %r5, (min_caml_intersection_point)@l
	lwz	%r2, 24(%r3)
	lwz	%r29, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 0	# li
	addis	%r5, %r0, (min_caml_or_net)@h	# lis
	ori	%r5, %r5, (min_caml_or_net)@l
	lwz	%r5, 0(%r5)
	lwz	%r29, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9747
	addis	%r2, %r0, (min_caml_nvector)@h	# lis
	ori	%r2, %r2, (min_caml_nvector)@l
	addis	%r5, %r0, (min_caml_light)@h	# lis
	ori	%r5, %r5, (min_caml_light)@l
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	veciprod.3063
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fneg.2991
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fispos.2987
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9749
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	b	beq_cont.9750
beq_else.9749:
	lfs	%f0, 32(%r3)	# float
beq_cont.9750:
	addis	%r2, %r0, (min_caml_diffuse_ray)@h	# lis
	ori	%r2, %r2, (min_caml_diffuse_ray)@l
	lfs	%f1, 0(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r5, 24(%r3)
	stw	%r2, 40(%r3)
	stfs	%f0, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_diffuse.3112
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 48(%r3)	# float
	fmul	%f0, %f1, %f0
	addis	%r5, %r0, (min_caml_texture_color)@h	# lis
	ori	%r5, %r5, (min_caml_texture_color)@l
	lwz	%r2, 40(%r3)
	b	vecaccum.3071
beq_else.9747:
	blr
iter_trace_diffuse_rays.3378:
	lwz	%r8, 4(%r29)
	cmpwi	%cr7, %r7, 0
	blt	%cr7, bge_else.9753
	addi	%r1, %r0, 2	# li
	slw	%r7, %r9, %r1 # swap
	lwzx	%r9, %r2, %r9
	stw	%r6, 0(%r3)
	stw	%r29, 4(%r3)
	stw	%r8, 8(%r3)
	stw	%r2, 12(%r3)
	stw	%r7, 16(%r3)
	stw	%r5, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r9, %r2, %r9	# mr %r2, %r9
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	d_vec.3149
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 20(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	veciprod.3063
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fisneg.2989
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9754
	lwz	%r2, 16(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r5, %r1 # swap
	lwz	%r6, 12(%r3)
	lwzx	%r5, %r6, %r5
	addis	%r31, %r0, (l.7614)@h	# lis
	ori	%r31, %r31, (l.7614)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 24(%r3)	# float
	fdiv	%f0, %f1, %f0
	lwz	%r29, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	b	beq_cont.9755
beq_else.9754:
	lwz	%r2, 16(%r3)
	addi	%r5, %r2, 1
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwz	%r6, 12(%r3)
	lwzx	%r5, %r6, %r5
	addis	%r31, %r0, (l.7612)@h	# lis
	ori	%r31, %r31, (l.7612)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 24(%r3)	# float
	fdiv	%f0, %f1, %f0
	lwz	%r29, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9755:
	lwz	%r2, 16(%r3)
	addi	%r7, %r2, -2	# subi %r7, %r2, 2
	lwz	%r2, 12(%r3)
	lwz	%r5, 20(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 4(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
bge_else.9753:
	blr
trace_diffuse_rays.3383:
	lwz	%r7, 4(%r29)
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r2, 8(%r3)
	stw	%r7, 12(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	setup_startp.3283
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r7, %r0, 118	# li
	lwz	%r2, 8(%r3)
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 12(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
trace_diffuse_ray_80percent.3387:
	lwz	%r29, 4(%r29)
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r29, 8(%r3)
	stw	%r2, 12(%r3)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9757
	b	beq_cont.9758
beq_else.9757:
	addis	%r7, %r0, (min_caml_dirvecs)@h	# lis
	ori	%r7, %r7, (min_caml_dirvecs)@l
	lwz	%r7, 0(%r7)
	mfspr	%r31, 8	# mflr
	or	%r7, %r2, %r7	# mr %r2, %r7
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9758:
	lwz	%r2, 12(%r3)
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.9759
	b	beq_cont.9760
beq_else.9759:
	addis	%r5, %r0, (min_caml_dirvecs)@h	# lis
	ori	%r5, %r5, (min_caml_dirvecs)@l
	lwz	%r5, 4(%r5)
	lwz	%r6, 4(%r3)
	lwz	%r7, 0(%r3)
	lwz	%r29, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r6, %r5, %r6	# mr %r5, %r6
	or	%r7, %r6, %r7	# mr %r6, %r7
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9760:
	lwz	%r2, 12(%r3)
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9761
	b	beq_cont.9762
beq_else.9761:
	addis	%r5, %r0, (min_caml_dirvecs)@h	# lis
	ori	%r5, %r5, (min_caml_dirvecs)@l
	lwz	%r5, 8(%r5)
	lwz	%r6, 4(%r3)
	lwz	%r7, 0(%r3)
	lwz	%r29, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r6, %r5, %r6	# mr %r5, %r6
	or	%r7, %r6, %r7	# mr %r6, %r7
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9762:
	lwz	%r2, 12(%r3)
	cmpwi	%cr7, %r2, 3
	bne	%cr7, beq_else.9763
	b	beq_cont.9764
beq_else.9763:
	addis	%r5, %r0, (min_caml_dirvecs)@h	# lis
	ori	%r5, %r5, (min_caml_dirvecs)@l
	lwz	%r5, 12(%r5)
	lwz	%r6, 4(%r3)
	lwz	%r7, 0(%r3)
	lwz	%r29, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r6, %r5, %r6	# mr %r5, %r6
	or	%r7, %r6, %r7	# mr %r6, %r7
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9764:
	lwz	%r2, 12(%r3)
	cmpwi	%cr7, %r2, 4
	bne	%cr7, beq_else.9765
	blr
beq_else.9765:
	addis	%r2, %r0, (min_caml_dirvecs)@h	# lis
	ori	%r2, %r2, (min_caml_dirvecs)@l
	lwz	%r2, 16(%r2)
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 8(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
calc_diffuse_using_1point.3391:
	lwz	%r6, 4(%r29)
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	p_received_ray_20percent.3140
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 8(%r3)
	stw	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	p_nvectors.3147
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 8(%r3)
	stw	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	p_intersection_points.3132
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 8(%r3)
	stw	%r2, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	p_energy.3138
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, (min_caml_diffuse_ray)@h	# lis
	ori	%r5, %r5, (min_caml_diffuse_ray)@l
	lwz	%r6, 4(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r6, %r7, %r1 # swap
	lwz	%r8, 12(%r3)
	lwzx	%r7, %r8, %r7
	stw	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r7, %r5, %r7	# mr %r5, %r7
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	veccpy.3052
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	p_group_id.3142
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 16(%r3)
	lwzx	%r6, %r7, %r6
	addi	%r1, %r0, 2	# li
	slw	%r5, %r7, %r1 # swap
	lwz	%r8, 20(%r3)
	lwzx	%r7, %r8, %r7
	lwz	%r29, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	or	%r7, %r6, %r7	# mr %r6, %r7
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_rgb)@h	# lis
	ori	%r2, %r2, (min_caml_rgb)@l
	lwz	%r5, 4(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwz	%r6, 24(%r3)
	lwzx	%r5, %r6, %r5
	addis	%r6, %r0, (min_caml_diffuse_ray)@h	# lis
	ori	%r6, %r6, (min_caml_diffuse_ray)@l
	b	vecaccumv.3084
calc_diffuse_using_5points.3394:
	addi	%r1, %r0, 2	# li
	slw	%r2, %r9, %r1 # swap
	lwzx	%r5, %r5, %r9
	stw	%r8, 0(%r3)
	stw	%r7, 4(%r3)
	stw	%r6, 8(%r3)
	stw	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	p_received_ray_20percent.3140
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 12(%r3)
	addi	%r6, %r5, -1	# subi %r6, %r5, 1
	addi	%r1, %r0, 2	# li
	slw	%r6, %r6, %r1 # swap
	lwz	%r7, 8(%r3)
	lwzx	%r6, %r7, %r6
	stw	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	p_received_ray_20percent.3140
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 12(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 8(%r3)
	lwzx	%r6, %r7, %r6
	stw	%r2, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	p_received_ray_20percent.3140
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 12(%r3)
	addi	%r6, %r5, 1
	addi	%r1, %r0, 2	# li
	slw	%r6, %r6, %r1 # swap
	lwz	%r7, 8(%r3)
	lwzx	%r6, %r7, %r6
	stw	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	p_received_ray_20percent.3140
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 12(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 4(%r3)
	lwzx	%r6, %r7, %r6
	stw	%r2, 28(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	p_received_ray_20percent.3140
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, (min_caml_diffuse_ray)@h	# lis
	ori	%r5, %r5, (min_caml_diffuse_ray)@l
	lwz	%r6, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r6, %r7, %r1 # swap
	lwz	%r8, 16(%r3)
	lwzx	%r7, %r8, %r7
	stw	%r2, 32(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r7, %r5, %r7	# mr %r5, %r7
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	veccpy.3052
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_diffuse_ray)@h	# lis
	ori	%r2, %r2, (min_caml_diffuse_ray)@l
	lwz	%r5, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 20(%r3)
	lwzx	%r6, %r7, %r6
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	vecadd.3075
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_diffuse_ray)@h	# lis
	ori	%r2, %r2, (min_caml_diffuse_ray)@l
	lwz	%r5, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 24(%r3)
	lwzx	%r6, %r7, %r6
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	vecadd.3075
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_diffuse_ray)@h	# lis
	ori	%r2, %r2, (min_caml_diffuse_ray)@l
	lwz	%r5, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 28(%r3)
	lwzx	%r6, %r7, %r6
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	vecadd.3075
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_diffuse_ray)@h	# lis
	ori	%r2, %r2, (min_caml_diffuse_ray)@l
	lwz	%r5, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 32(%r3)
	lwzx	%r6, %r7, %r6
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	vecadd.3075
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r2, %r1 # swap
	lwz	%r5, 8(%r3)
	lwzx	%r2, %r5, %r2
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	p_energy.3138
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, (min_caml_rgb)@h	# lis
	ori	%r5, %r5, (min_caml_rgb)@l
	lwz	%r6, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r6, %r6, %r1 # swap
	lwzx	%r2, %r2, %r6
	addis	%r6, %r0, (min_caml_diffuse_ray)@h	# lis
	ori	%r6, %r6, (min_caml_diffuse_ray)@l
	or	%r5, %r28, %r5	# mr %r28, %r5
	or	%r2, %r5, %r2	# mr %r5, %r2
	or	%r28, %r2, %r28	# mr %r2, %r28
	b	vecaccumv.3084
do_without_neighbors.3400:
	lwz	%r6, 4(%r29)
	cmpwi	%cr7, %r5, 4
	bgt	%cr7, ble_else.9767
	stw	%r29, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r2, 8(%r3)
	stw	%r5, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	p_surface_ids.3134
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 12(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwzx	%r2, %r2, %r6
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9768
	lwz	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	p_calc_diffuse.3136
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 12(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwzx	%r2, %r2, %r6
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9769
	b	beq_cont.9770
beq_else.9769:
	lwz	%r2, 8(%r3)
	lwz	%r29, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9770:
	lwz	%r2, 12(%r3)
	addi	%r5, %r2, 1
	lwz	%r2, 8(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
bge_else.9768:
	blr
ble_else.9767:
	blr
neighbors_exist.3403:
	addis	%r6, %r0, (min_caml_image_size)@h	# lis
	ori	%r6, %r6, (min_caml_image_size)@l
	lwz	%r6, 4(%r6)
	addi	%r7, %r5, 1
	cmp	%cr7, %r6, %r7
	bgt	%cr7, ble_else.9773
	addi	%r2, %r0, 0	# li
	blr
ble_else.9773:
	cmpwi	%cr7, %r5, 0
	bgt	%cr7, ble_else.9774
	addi	%r2, %r0, 0	# li
	blr
ble_else.9774:
	addis	%r5, %r0, (min_caml_image_size)@h	# lis
	ori	%r5, %r5, (min_caml_image_size)@l
	lwz	%r5, 0(%r5)
	addi	%r6, %r2, 1
	cmp	%cr7, %r5, %r6
	bgt	%cr7, ble_else.9775
	addi	%r2, %r0, 0	# li
	blr
ble_else.9775:
	cmpwi	%cr7, %r2, 0
	bgt	%cr7, ble_else.9776
	addi	%r2, %r0, 0	# li
	blr
ble_else.9776:
	addi	%r2, %r0, 1	# li
	blr
get_surface_id.3407:
	stw	%r5, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	p_surface_ids.3134
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwzx	%r2, %r2, %r5
	blr
neighbors_are_available.3410:
	addi	%r1, %r0, 2	# li
	slw	%r2, %r9, %r1 # swap
	lwzx	%r9, %r6, %r9
	stw	%r6, 0(%r3)
	stw	%r7, 4(%r3)
	stw	%r8, 8(%r3)
	stw	%r5, 12(%r3)
	stw	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	or	%r8, %r5, %r8	# mr %r5, %r8
	or	%r9, %r2, %r9	# mr %r2, %r9
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	get_surface_id.3407
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 16(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 12(%r3)
	lwzx	%r6, %r7, %r6
	lwz	%r7, 8(%r3)
	stw	%r2, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r7, %r5, %r7	# mr %r5, %r7
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	get_surface_id.3407
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 20(%r3)
	cmp	%cr7, %r2, %r5
	bne	%cr7, beq_else.9777
	lwz	%r2, 16(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r6, %r1 # swap
	lwz	%r7, 4(%r3)
	lwzx	%r6, %r7, %r6
	lwz	%r7, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r7, %r5, %r7	# mr %r5, %r7
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	get_surface_id.3407
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 20(%r3)
	cmp	%cr7, %r2, %r5
	bne	%cr7, beq_else.9778
	lwz	%r2, 16(%r3)
	addi	%r6, %r2, -1	# subi %r6, %r2, 1
	addi	%r1, %r0, 2	# li
	slw	%r6, %r6, %r1 # swap
	lwz	%r7, 0(%r3)
	lwzx	%r6, %r7, %r6
	lwz	%r8, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r8, %r5, %r8	# mr %r5, %r8
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	get_surface_id.3407
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 20(%r3)
	cmp	%cr7, %r2, %r5
	bne	%cr7, beq_else.9779
	lwz	%r2, 16(%r3)
	addi	%r2, %r2, 1
	addi	%r1, %r0, 2	# li
	slw	%r2, %r2, %r1 # swap
	lwz	%r6, 0(%r3)
	lwzx	%r2, %r6, %r2
	lwz	%r6, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	get_surface_id.3407
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 20(%r3)
	cmp	%cr7, %r2, %r5
	bne	%cr7, beq_else.9780
	addi	%r2, %r0, 1	# li
	blr
beq_else.9780:
	addi	%r2, %r0, 0	# li
	blr
beq_else.9779:
	addi	%r2, %r0, 0	# li
	blr
beq_else.9778:
	addi	%r2, %r0, 0	# li
	blr
beq_else.9777:
	addi	%r2, %r0, 0	# li
	blr
try_exploit_neighbors.3416:
	lwz	%r10, 4(%r29)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r11, %r1 # swap
	lwzx	%r11, %r7, %r11
	cmpwi	%cr7, %r9, 4
	bgt	%cr7, ble_else.9781
	stw	%r5, 0(%r3)
	stw	%r29, 4(%r3)
	stw	%r11, 8(%r3)
	stw	%r10, 12(%r3)
	stw	%r9, 16(%r3)
	stw	%r8, 20(%r3)
	stw	%r7, 24(%r3)
	stw	%r6, 28(%r3)
	stw	%r2, 32(%r3)
	mfspr	%r31, 8	# mflr
	or	%r9, %r5, %r9	# mr %r5, %r9
	or	%r11, %r2, %r11	# mr %r2, %r11
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	get_surface_id.3407
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9782
	lwz	%r2, 32(%r3)
	lwz	%r5, 28(%r3)
	lwz	%r6, 24(%r3)
	lwz	%r7, 20(%r3)
	lwz	%r8, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	neighbors_are_available.3410
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9783
	lwz	%r2, 32(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r2, %r1 # swap
	lwz	%r5, 24(%r3)
	lwzx	%r2, %r5, %r2
	lwz	%r5, 16(%r3)
	lwz	%r29, 12(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.9783:
	lwz	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	p_calc_diffuse.3136
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r8, 16(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r8, %r5, %r1 # swap
	lwzx	%r2, %r2, %r5
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9784
	b	beq_cont.9785
beq_else.9784:
	lwz	%r2, 32(%r3)
	lwz	%r5, 28(%r3)
	lwz	%r6, 24(%r3)
	lwz	%r7, 20(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	calc_diffuse_using_5points.3394
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9785:
	lwz	%r2, 16(%r3)
	addi	%r9, %r2, 1
	lwz	%r2, 32(%r3)
	lwz	%r5, 0(%r3)
	lwz	%r6, 28(%r3)
	lwz	%r7, 24(%r3)
	lwz	%r8, 20(%r3)
	lwz	%r29, 4(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
bge_else.9782:
	blr
ble_else.9781:
	blr
write_ppm_header.3423:
	addi	%r2, %r0, 80	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_char.2971
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 51	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_char.2971
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_char.2971
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_image_size)@h	# lis
	ori	%r2, %r2, (min_caml_image_size)@l
	lwz	%r2, 0(%r2)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int.2969
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 32	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_char.2971
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_image_size)@h	# lis
	ori	%r2, %r2, (min_caml_image_size)@l
	lwz	%r2, 4(%r2)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int.2969
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 32	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_char.2971
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 255	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int.2969
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 10	# li
	b	print_char.2971
write_rgb_element.3425:
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	int_of_float.3004
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 255	
	bgt	%cr7, ble_else.9788
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9790
	b	bge_cont.9791
bge_else.9790:
	addi	%r2, %r0, 0	# li
bge_cont.9791:
	b	ble_cont.9789
ble_else.9788:
	addi	%r2, %r0, 255	# li
ble_cont.9789:
	b	print_int.2969
write_rgb.3427:
	addis	%r2, %r0, (min_caml_rgb)@h	# lis
	ori	%r2, %r2, (min_caml_rgb)@l
	lfs	%f0, 0(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	write_rgb_element.3425
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 32	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_char.2971
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_rgb)@h	# lis
	ori	%r2, %r2, (min_caml_rgb)@l
	lfs	%f0, 8(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	write_rgb_element.3425
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 32	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_char.2971
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_rgb)@h	# lis
	ori	%r2, %r2, (min_caml_rgb)@l
	lfs	%f0, 16(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	write_rgb_element.3425
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 10	# li
	b	print_char.2971
pretrace_diffuse_rays.3429:
	lwz	%r6, 4(%r29)
	cmpwi	%cr7, %r5, 4
	bgt	%cr7, ble_else.9792
	stw	%r29, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r5, 8(%r3)
	stw	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	get_surface_id.3407
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9793
	lwz	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	p_calc_diffuse.3136
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 8(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwzx	%r2, %r2, %r6
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9794
	b	beq_cont.9795
beq_else.9794:
	lwz	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	p_group_id.3142
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, (min_caml_diffuse_ray)@h	# lis
	ori	%r5, %r5, (min_caml_diffuse_ray)@l
	stw	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	vecbzero.3050
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	p_nvectors.3147
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 12(%r3)
	stw	%r2, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	p_intersection_points.3132
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, (min_caml_dirvecs)@h	# lis
	ori	%r5, %r5, (min_caml_dirvecs)@l
	lwz	%r6, 16(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r6, %r6, %r1 # swap
	lwzx	%r5, %r5, %r6
	lwz	%r6, 8(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r6, %r7, %r1 # swap
	lwz	%r8, 20(%r3)
	lwzx	%r7, %r8, %r7
	addi	%r1, %r0, 2	# li
	slw	%r6, %r8, %r1 # swap
	lwzx	%r2, %r2, %r8
	lwz	%r29, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r2, %r6, %r2	# mr %r6, %r2
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r7, %r5, %r7	# mr %r5, %r7
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	p_received_ray_20percent.3140
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 8(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwzx	%r2, %r2, %r6
	addis	%r6, %r0, (min_caml_diffuse_ray)@h	# lis
	ori	%r6, %r6, (min_caml_diffuse_ray)@l
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	veccpy.3052
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9795:
	lwz	%r2, 8(%r3)
	addi	%r5, %r2, 1
	lwz	%r2, 12(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
bge_else.9793:
	blr
ble_else.9792:
	blr
pretrace_pixels.3432:
	lwz	%r7, 12(%r29)
	lwz	%r8, 8(%r29)
	lwz	%r9, 4(%r29)
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.9798
	addis	%r10, %r0, (min_caml_scan_pitch)@h	# lis
	ori	%r10, %r10, (min_caml_scan_pitch)@l
	lfs	%f3, 0(%r10)	# float
	addis	%r10, %r0, (min_caml_image_center)@h	# lis
	ori	%r10, %r10, (min_caml_image_center)@l
	lwz	%r10, 0(%r10)
	subf	%r10, %r10, %r5	# sub	%r10, %r5, %r10
	stw	%r29, 0(%r3)
	stw	%r9, 4(%r3)
	stw	%r6, 8(%r3)
	stw	%r8, 12(%r3)
	stw	%r2, 16(%r3)
	stw	%r5, 20(%r3)
	stw	%r7, 24(%r3)
	stfs	%f2, 32(%r3)	# float
	stfs	%f1, 40(%r3)	# float
	stfs	%f0, 48(%r3)	# float
	stfs	%f3, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r10, %r2, %r10	# mr %r2, %r10
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	float_of_int.3006
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fmul	%f0, %f1, %f0
	addis	%r2, %r0, (min_caml_ptrace_dirvec)@h	# lis
	ori	%r2, %r2, (min_caml_ptrace_dirvec)@l
	addis	%r5, %r0, (min_caml_screenx_dir)@h	# lis
	ori	%r5, %r5, (min_caml_screenx_dir)@l
	lfs	%f1, 0(%r5)	# float
	fmul	%f1, %f0, %f1
	lfs	%f2, 48(%r3)	# float
	fadd	%f1, %f1, %f2
	stfs	%f1, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_ptrace_dirvec)@h	# lis
	ori	%r2, %r2, (min_caml_ptrace_dirvec)@l
	addis	%r5, %r0, (min_caml_screenx_dir)@h	# lis
	ori	%r5, %r5, (min_caml_screenx_dir)@l
	lfs	%f1, 8(%r5)	# float
	fmul	%f1, %f0, %f1
	lfs	%f3, 40(%r3)	# float
	fadd	%f1, %f1, %f3
	stfs	%f1, 8(%r2)	# float
	addis	%r2, %r0, (min_caml_ptrace_dirvec)@h	# lis
	ori	%r2, %r2, (min_caml_ptrace_dirvec)@l
	addis	%r5, %r0, (min_caml_screenx_dir)@h	# lis
	ori	%r5, %r5, (min_caml_screenx_dir)@l
	lfs	%f1, 16(%r5)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 32(%r3)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 16(%r2)	# float
	addis	%r2, %r0, (min_caml_ptrace_dirvec)@h	# lis
	ori	%r2, %r2, (min_caml_ptrace_dirvec)@l
	addi	%r5, %r0, 0	# li
	lwz	%r29, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_rgb)@h	# lis
	ori	%r2, %r2, (min_caml_rgb)@l
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	vecbzero.3050
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_startp)@h	# lis
	ori	%r2, %r2, (min_caml_startp)@l
	addis	%r5, %r0, (min_caml_viewpoint)@h	# lis
	ori	%r5, %r5, (min_caml_viewpoint)@l
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	veccpy.3052
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 0	# li
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r5, %r0, (min_caml_ptrace_dirvec)@h	# lis
	ori	%r5, %r5, (min_caml_ptrace_dirvec)@l
	lwz	%r6, 20(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r6, %r7, %r1 # swap
	lwz	%r8, 16(%r3)
	lwzx	%r7, %r8, %r7
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	lwz	%r29, 12(%r3)
	mfspr	%r31, 8	# mflr
	or	%r7, %r6, %r7	# mr %r6, %r7
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 20(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r5, %r1 # swap
	lwz	%r6, 16(%r3)
	lwzx	%r5, %r6, %r5
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	p_rgb.3130
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, (min_caml_rgb)@h	# lis
	ori	%r5, %r5, (min_caml_rgb)@l
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	veccpy.3052
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 20(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r5, %r1 # swap
	lwz	%r6, 16(%r3)
	lwzx	%r5, %r6, %r5
	lwz	%r7, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r7, %r5, %r7	# mr %r5, %r7
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	p_set_group_id.3144
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 20(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r5, %r1 # swap
	lwz	%r6, 16(%r3)
	lwzx	%r5, %r6, %r5
	addi	%r7, %r0, 0	# li
	lwz	%r29, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r7, %r5, %r7	# mr %r5, %r7
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 20(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	addi	%r5, %r0, 1	# li
	lwz	%r6, 8(%r3)
	stw	%r2, 64(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	add_mod5.3039
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	or	%r2, %r6, %r2	# mr %r6, %r2
	mtspr	8, %r31	# mtlr
	lfs	%f0, 48(%r3)	# float
	lfs	%f1, 40(%r3)	# float
	lfs	%f2, 32(%r3)	# float
	lwz	%r2, 16(%r3)
	lwz	%r5, 64(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
bge_else.9798:
	blr
pretrace_line.3439:
	lwz	%r7, 4(%r29)
	addis	%r8, %r0, (min_caml_scan_pitch)@h	# lis
	ori	%r8, %r8, (min_caml_scan_pitch)@l
	lfs	%f0, 0(%r8)	# float
	addis	%r8, %r0, (min_caml_image_center)@h	# lis
	ori	%r8, %r8, (min_caml_image_center)@l
	lwz	%r8, 4(%r8)
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	stw	%r6, 0(%r3)
	stw	%r2, 4(%r3)
	stw	%r7, 8(%r3)
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	float_of_int.3006
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fmul	%f0, %f1, %f0
	addis	%r2, %r0, (min_caml_screeny_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screeny_dir)@l
	lfs	%f1, 0(%r2)	# float
	fmul	%f1, %f0, %f1
	addis	%r2, %r0, (min_caml_screenz_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screenz_dir)@l
	lfs	%f2, 0(%r2)	# float
	fadd	%f1, %f1, %f2
	addis	%r2, %r0, (min_caml_screeny_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screeny_dir)@l
	lfs	%f2, 8(%r2)	# float
	fmul	%f2, %f0, %f2
	addis	%r2, %r0, (min_caml_screenz_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screenz_dir)@l
	lfs	%f3, 8(%r2)	# float
	fadd	%f2, %f2, %f3
	addis	%r2, %r0, (min_caml_screeny_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screeny_dir)@l
	lfs	%f3, 16(%r2)	# float
	fmul	%f0, %f0, %f3
	addis	%r2, %r0, (min_caml_screenz_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screenz_dir)@l
	lfs	%f3, 16(%r2)	# float
	fadd	%f0, %f0, %f3
	addis	%r2, %r0, (min_caml_image_size)@h	# lis
	ori	%r2, %r2, (min_caml_image_size)@l
	lwz	%r2, 0(%r2)
	addi	%r5, %r2, -1	# subi %r5, %r2, 1
	lwz	%r2, 4(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 8(%r3)
	fmr	%f31, %f2
	fmr	%f2, %f0
	fmr	%f0, %f1
	fmr	%f1, %f31
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
scan_pixel.3443:
	lwz	%r9, 8(%r29)
	lwz	%r10, 4(%r29)
	addis	%r11, %r0, (min_caml_image_size)@h	# lis
	ori	%r11, %r11, (min_caml_image_size)@l
	lwz	%r11, 0(%r11)
	cmp	%cr7, %r11, %r2
	bgt	%cr7, ble_else.9802
	blr
ble_else.9802:
	addis	%r11, %r0, (min_caml_rgb)@h	# lis
	ori	%r11, %r11, (min_caml_rgb)@l
	addi	%r1, %r0, 2	# li
	slw	%r2, %r12, %r1 # swap
	lwzx	%r12, %r7, %r12
	stw	%r29, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r9, 8(%r3)
	stw	%r10, 12(%r3)
	stw	%r7, 16(%r3)
	stw	%r8, 20(%r3)
	stw	%r5, 24(%r3)
	stw	%r2, 28(%r3)
	stw	%r11, 32(%r3)
	mfspr	%r31, 8	# mflr
	or	%r12, %r2, %r12	# mr %r2, %r12
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	p_rgb.3130
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 32(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	veccpy.3052
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 28(%r3)
	lwz	%r5, 24(%r3)
	lwz	%r6, 20(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	neighbors_exist.3403
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9804
	lwz	%r2, 28(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r5, %r1 # swap
	lwz	%r6, 16(%r3)
	lwzx	%r5, %r6, %r5
	addi	%r7, %r0, 0	# li
	lwz	%r29, 12(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r7, %r5, %r7	# mr %r5, %r7
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	b	beq_cont.9805
beq_else.9804:
	addi	%r9, %r0, 0	# li
	lwz	%r2, 28(%r3)
	lwz	%r5, 24(%r3)
	lwz	%r6, 4(%r3)
	lwz	%r7, 16(%r3)
	lwz	%r8, 20(%r3)
	lwz	%r29, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9805:
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	write_rgb.3427
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 28(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 24(%r3)
	lwz	%r6, 4(%r3)
	lwz	%r7, 16(%r3)
	lwz	%r8, 20(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
scan_line.3449:
	lwz	%r9, 8(%r29)
	lwz	%r10, 4(%r29)
	addis	%r11, %r0, (min_caml_image_size)@h	# lis
	ori	%r11, %r11, (min_caml_image_size)@l
	lwz	%r11, 4(%r11)
	cmp	%cr7, %r11, %r2
	bgt	%cr7, ble_else.9806
	blr
ble_else.9806:
	addis	%r11, %r0, (min_caml_image_size)@h	# lis
	ori	%r11, %r11, (min_caml_image_size)@l
	lwz	%r11, 4(%r11)
	addi	%r11, %r11, -1	# subi %r11, %r11, 1
	stw	%r29, 0(%r3)
	stw	%r8, 4(%r3)
	stw	%r7, 8(%r3)
	stw	%r6, 12(%r3)
	stw	%r5, 16(%r3)
	stw	%r2, 20(%r3)
	stw	%r9, 24(%r3)
	cmp	%cr7, %r11, %r2
	bgt	%cr7, ble_else.9808
	b	ble_cont.9809
ble_else.9808:
	addi	%r11, %r2, 1
	mfspr	%r31, 8	# mflr
	or	%r8, %r6, %r8	# mr %r6, %r8
	or	%r11, %r5, %r11	# mr %r5, %r11
	or	%r7, %r2, %r7	# mr %r2, %r7
	or	%r10, %r29, %r10	# mr %r29, %r10
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
ble_cont.9809:
	addi	%r2, %r0, 0	# li
	lwz	%r5, 20(%r3)
	lwz	%r6, 16(%r3)
	lwz	%r7, 12(%r3)
	lwz	%r8, 8(%r3)
	lwz	%r29, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 20(%r3)
	addi	%r2, %r2, 1
	addi	%r5, %r0, 2	# li
	lwz	%r6, 4(%r3)
	stw	%r2, 28(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	add_mod5.3039
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	or	%r2, %r8, %r2	# mr %r8, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 28(%r3)
	lwz	%r5, 12(%r3)
	lwz	%r6, 8(%r3)
	lwz	%r7, 16(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
create_float5x3array.3455:
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_float_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 5	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_float_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	stw	%r2, 4(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_float_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	stw	%r2, 8(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_float_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	stw	%r2, 12(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_float_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	stw	%r2, 16(%r5)
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
create_pixel.3457:
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_float_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	create_float5x3array.3455
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 5	# li
	addi	%r6, %r0, 0	# li
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 5	# li
	addi	%r6, %r0, 0	# li
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	create_float5x3array.3455
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	create_float5x3array.3455
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 1	# li
	addi	%r6, %r0, 0	# li
	stw	%r2, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	create_float5x3array.3455
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	or	%r4, %r5, %r4	# mr %r5, %r4
	addi	%r4, %r4, 32
	stw	%r2, 28(%r5)
	lwz	%r2, 24(%r3)
	stw	%r2, 24(%r5)
	lwz	%r2, 20(%r3)
	stw	%r2, 20(%r5)
	lwz	%r2, 16(%r3)
	stw	%r2, 16(%r5)
	lwz	%r2, 12(%r3)
	stw	%r2, 12(%r5)
	lwz	%r2, 8(%r3)
	stw	%r2, 8(%r5)
	lwz	%r2, 4(%r3)
	stw	%r2, 4(%r5)
	lwz	%r2, 0(%r3)
	stw	%r2, 0(%r5)
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
init_line_elements.3459:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.9810
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	create_pixel.3457
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 0(%r3)
	stwx	%r2, %r7, %r6
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	or	%r7, %r2, %r7	# mr %r2, %r7
	b	init_line_elements.3459
bge_else.9810:
	blr
create_pixelline.3462:
	addis	%r2, %r0, (min_caml_image_size)@h	# lis
	ori	%r2, %r2, (min_caml_image_size)@l
	lwz	%r2, 0(%r2)
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	create_pixel.3457
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, (min_caml_image_size)@h	# lis
	ori	%r5, %r5, (min_caml_image_size)@l
	lwz	%r5, 0(%r5)
	addi	%r5, %r5, -2	# subi %r5, %r5, 2
	b	init_line_elements.3459
tan.3464:
	stfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	sin.2977
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	stfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	cos.2979
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fdiv	%f0, %f1, %f0
	blr
adjust_position.3466:
	lwz	%r29, 4(%r29)
	fmul	%f0, %f0, %f0
	addis	%r31, %r0, (l.7155)@h	# lis
	ori	%r31, %r31, (l.7155)@l
	lfs	%f2, 0(%r31)	# float
	fadd	%f0, %f0, %f2
	stfs	%f1, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f1, %f1, %f0
	stfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	atan.2983
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fmul	%f0, %f0, %f1
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	tan.3464
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fmul	%f0, %f0, %f1
	blr
calc_dirvec.3469:
	lwz	%r7, 8(%r29)
	lwz	%r8, 4(%r29)
	cmpwi	%cr7, %r2, 5
	blt	%cr7, bge_else.9811
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stfs	%f0, 8(%r3)	# float
	stw	%r7, 16(%r3)
	stfs	%f1, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fsqr.3002
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fsqr.3002
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fadd	%f0, %f1, %f0
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f1, 0(%r31)	# float
	fadd	%f0, %f0, %f1
	lwz	%r29, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fdiv	%f1, %f1, %f0
	lfs	%f2, 24(%r3)	# float
	fdiv	%f2, %f2, %f0
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f3, 0(%r31)	# float
	fdiv	%f0, %f3, %f0
	addis	%r2, %r0, (min_caml_dirvecs)@h	# lis
	ori	%r2, %r2, (min_caml_dirvecs)@l
	lwz	%r5, 4(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwzx	%r2, %r2, %r5
	lwz	%r5, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwzx	%r6, %r2, %r6
	stw	%r2, 40(%r3)
	stfs	%f0, 48(%r3)	# float
	stfs	%f2, 56(%r3)	# float
	stfs	%f1, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	d_vec.3149
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 64(%r3)	# float
	lfs	%f1, 56(%r3)	# float
	lfs	%f2, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	vecset.3042
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	addi	%r5, %r2, 40
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwz	%r6, 40(%r3)
	lwzx	%r5, %r6, %r5
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	d_vec.3149
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 56(%r3)	# float
	stw	%r2, 72(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fneg.2991
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	fmr	%f2, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 64(%r3)	# float
	lfs	%f1, 48(%r3)	# float
	lwz	%r2, 72(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	vecset.3042
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	addi	%r5, %r2, 80
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwz	%r6, 40(%r3)
	lwzx	%r5, %r6, %r5
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	d_vec.3149
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 64(%r3)	# float
	stw	%r2, 76(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	fneg.2991
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	stfs	%f0, 80(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	fneg.2991
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	fmr	%f2, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 48(%r3)	# float
	lfs	%f1, 80(%r3)	# float
	lwz	%r2, 76(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	vecset.3042
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	addi	%r5, %r2, 1
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwz	%r6, 40(%r3)
	lwzx	%r5, %r6, %r5
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	d_vec.3149
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 64(%r3)	# float
	stw	%r2, 88(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	fneg.2991
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	stfs	%f0, 96(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	fneg.2991
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 48(%r3)	# float
	stfs	%f0, 104(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	fneg.2991
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	fmr	%f2, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 96(%r3)	# float
	lfs	%f1, 104(%r3)	# float
	lwz	%r2, 88(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	vecset.3042
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	addi	%r5, %r2, 41
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwz	%r6, 40(%r3)
	lwzx	%r5, %r6, %r5
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	d_vec.3149
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 64(%r3)	# float
	stw	%r2, 112(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	fneg.2991
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 48(%r3)	# float
	stfs	%f0, 120(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	fneg.2991
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 120(%r3)	# float
	lfs	%f2, 56(%r3)	# float
	lwz	%r2, 112(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	vecset.3042
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 81
	addi	%r1, %r0, 2	# li
	slw	%r2, %r2, %r1 # swap
	lwz	%r5, 40(%r3)
	lwzx	%r2, %r5, %r2
	mfspr	%r31, 8	# mflr
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	d_vec.3149
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 48(%r3)	# float
	stw	%r2, 128(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	fneg.2991
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 64(%r3)	# float
	lfs	%f2, 56(%r3)	# float
	lwz	%r2, 128(%r3)
	b	vecset.3042
bge_else.9811:
	stfs	%f2, 136(%r3)	# float
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r29, 144(%r3)
	stfs	%f3, 152(%r3)	# float
	stw	%r8, 160(%r3)
	stw	%r2, 164(%r3)
	mfspr	%r31, 8	# mflr
	or	%r8, %r29, %r8	# mr %r29, %r8
	fmr	%f0, %f1
	fmr	%f1, %f2
	stw	%r31, 172(%r3)
	addi	%r3, %r3, 176
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -176	# subi
	lwz	%r31, 172(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 164(%r3)
	addi	%r2, %r2, 1
	lfs	%f1, 152(%r3)	# float
	lwz	%r29, 160(%r3)
	stfs	%f0, 168(%r3)	# float
	stw	%r2, 176(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 180(%r3)
	addi	%r3, %r3, 184
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -184	# subi
	lwz	%r31, 180(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 168(%r3)	# float
	lfs	%f2, 136(%r3)	# float
	lfs	%f3, 152(%r3)	# float
	lwz	%r2, 176(%r3)
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 144(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
calc_dirvecs.3477:
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9818
	stw	%r29, 0(%r3)
	stw	%r2, 4(%r3)
	stfs	%f0, 8(%r3)	# float
	stw	%r6, 16(%r3)
	stw	%r5, 20(%r3)
	stw	%r7, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	float_of_int.3006
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7142)@h	# lis
	ori	%r31, %r31, (l.7142)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.7708)@h	# lis
	ori	%r31, %r31, (l.7708)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f2, %f0, %f1
	addi	%r2, %r0, 0	# li
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	lfs	%f3, 8(%r3)	# float
	lwz	%r5, 20(%r3)
	lwz	%r6, 16(%r3)
	lwz	%r29, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	float_of_int.3006
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7142)@h	# lis
	ori	%r31, %r31, (l.7142)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.7155)@h	# lis
	ori	%r31, %r31, (l.7155)@l
	lfs	%f1, 0(%r31)	# float
	fadd	%f2, %f0, %f1
	addi	%r2, %r0, 0	# li
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f1, 0(%r31)	# float
	lwz	%r5, 16(%r3)
	addi	%r6, %r5, 2
	lfs	%f3, 8(%r3)	# float
	lwz	%r7, 20(%r3)
	lwz	%r29, 24(%r3)
	mfspr	%r31, 8	# mflr
	or	%r7, %r5, %r7	# mr %r5, %r7
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	addi	%r5, %r0, 1	# li
	lwz	%r6, 20(%r3)
	stw	%r2, 28(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	add_mod5.3039
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lfs	%f0, 8(%r3)	# float
	lwz	%r2, 28(%r3)
	lwz	%r6, 16(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
bge_else.9818:
	blr
calc_dirvec_rows.3482:
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9820
	stw	%r29, 0(%r3)
	stw	%r2, 4(%r3)
	stw	%r6, 8(%r3)
	stw	%r5, 12(%r3)
	stw	%r7, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	float_of_int.3006
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7142)@h	# lis
	ori	%r31, %r31, (l.7142)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.7708)@h	# lis
	ori	%r31, %r31, (l.7708)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	addi	%r2, %r0, 4	# li
	lwz	%r5, 12(%r3)
	lwz	%r6, 8(%r3)
	lwz	%r29, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	addi	%r5, %r0, 2	# li
	lwz	%r6, 12(%r3)
	stw	%r2, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	add_mod5.3039
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	addi	%r6, %r2, 4
	lwz	%r2, 20(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
bge_else.9820:
	blr
create_dirvec.3486:
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.7135)@h	# lis
	ori	%r31, %r31, (l.7135)@l
	lfs	%f0, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_float_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_n_objects)@h	# lis
	ori	%r2, %r2, (min_caml_n_objects)@l
	lwz	%r2, 0(%r2)
	stw	%r5, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	or	%r4, %r5, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r5)
	lwz	%r2, 0(%r3)
	stw	%r2, 0(%r5)
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
create_dirvec_elements.3488:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.9822
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	create_dirvec.3486
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 0(%r3)
	stwx	%r2, %r7, %r6
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	or	%r7, %r2, %r7	# mr %r2, %r7
	b	create_dirvec_elements.3488
bge_else.9822:
	blr
create_dirvecs.3491:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9824
	addis	%r5, %r0, (min_caml_dirvecs)@h	# lis
	ori	%r5, %r5, (min_caml_dirvecs)@l
	addi	%r6, %r0, 120	# li
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	stw	%r6, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	create_dirvec.3486
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 0(%r3)
	stwx	%r2, %r7, %r6
	addis	%r2, %r0, (min_caml_dirvecs)@h	# lis
	ori	%r2, %r2, (min_caml_dirvecs)@l
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwzx	%r2, %r2, %r6
	addi	%r6, %r0, 118	# li
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	create_dirvec_elements.3488
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	b	create_dirvecs.3491
bge_else.9824:
	blr
init_dirvec_constants.3493:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.9826
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwzx	%r6, %r2, %r6
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	setup_dirvec_constants.3278
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	addi	%r5, %r2, -1	# subi %r5, %r2, 1
	lwz	%r2, 0(%r3)
	b	init_dirvec_constants.3493
bge_else.9826:
	blr
init_vecset_constants.3496:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9828
	addis	%r5, %r0, (min_caml_dirvecs)@h	# lis
	ori	%r5, %r5, (min_caml_dirvecs)@l
	addi	%r1, %r0, 2	# li
	slw	%r2, %r6, %r1 # swap
	lwzx	%r5, %r5, %r6
	addi	%r6, %r0, 119	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	init_dirvec_constants.3493
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	b	init_vecset_constants.3496
bge_else.9828:
	blr
init_dirvecs.3498:
	lwz	%r2, 4(%r29)
	addi	%r5, %r0, 4	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	create_dirvecs.3491
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 9	# li
	addi	%r5, %r0, 0	# li
	addi	%r6, %r0, 0	# li
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
	addi	%r2, %r0, 4	# li
	b	init_vecset_constants.3496
add_reflection.3500:
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	stfs	%f0, 8(%r3)	# float
	stfs	%f3, 16(%r3)	# float
	stfs	%f2, 24(%r3)	# float
	stfs	%f1, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	create_dirvec.3486
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 40(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	d_vec.3149
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 32(%r3)	# float
	lfs	%f1, 24(%r3)	# float
	lfs	%f2, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	vecset.3042
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 40(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	setup_dirvec_constants.3278
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_reflections)@h	# lis
	ori	%r2, %r2, (min_caml_reflections)@l
	or	%r4, %r5, %r4	# mr %r5, %r4
	addi	%r4, %r4, 16
	lfs	%f0, 8(%r3)	# float
	stfs	%f0, 8(%r5)	# float
	lwz	%r6, 40(%r3)
	stw	%r6, 4(%r5)
	lwz	%r6, 4(%r3)
	stw	%r6, 0(%r5)
	lwz	%r6, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r6, %r6, %r1 # swap
	stwx	%r5, %r2, %r6
	blr
setup_rect_reflection.3507:
	addi	%r1, %r0, 2	# li
	slw	%r2, %r2, %r1 # swap
	addis	%r6, %r0, (min_caml_n_reflections)@h	# lis
	ori	%r6, %r6, (min_caml_n_reflections)@l
	lwz	%r6, 0(%r6)
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r6, 0(%r3)
	stw	%r2, 4(%r3)
	stfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_diffuse.3112
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r2, %r0, (min_caml_light)@h	# lis
	ori	%r2, %r2, (min_caml_light)@l
	lfs	%f1, 0(%r2)	# float
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fneg.2991
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_light)@h	# lis
	ori	%r2, %r2, (min_caml_light)@l
	lfs	%f1, 8(%r2)	# float
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fneg.2991
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_light)@h	# lis
	ori	%r2, %r2, (min_caml_light)@l
	lfs	%f1, 16(%r2)	# float
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fneg.2991
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	fmr	%f3, %f0
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	addi	%r5, %r2, 1
	addis	%r6, %r0, (min_caml_light)@h	# lis
	ori	%r6, %r6, (min_caml_light)@l
	lfs	%f1, 0(%r6)	# float
	lfs	%f0, 16(%r3)	# float
	lfs	%f2, 32(%r3)	# float
	lwz	%r6, 0(%r3)
	stfs	%f3, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	add_reflection.3500
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	addi	%r5, %r2, 1
	lwz	%r6, 4(%r3)
	addi	%r7, %r6, 2
	addis	%r8, %r0, (min_caml_light)@h	# lis
	ori	%r8, %r8, (min_caml_light)@l
	lfs	%f2, 8(%r8)	# float
	lfs	%f0, 16(%r3)	# float
	lfs	%f1, 24(%r3)	# float
	lfs	%f3, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r7, %r5, %r7	# mr %r5, %r7
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	add_reflection.3500
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	addi	%r5, %r2, 2
	lwz	%r6, 4(%r3)
	addi	%r6, %r6, 3
	addis	%r7, %r0, (min_caml_light)@h	# lis
	ori	%r7, %r7, (min_caml_light)@l
	lfs	%f3, 16(%r7)	# float
	lfs	%f0, 16(%r3)	# float
	lfs	%f1, 24(%r3)	# float
	lfs	%f2, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	add_reflection.3500
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_n_reflections)@h	# lis
	ori	%r2, %r2, (min_caml_n_reflections)@l
	lwz	%r5, 0(%r3)
	addi	%r5, %r5, 3
	stw	%r5, 0(%r2)
	blr
setup_surface_reflection.3510:
	addi	%r1, %r0, 2	# li
	slw	%r2, %r2, %r1 # swap
	addi	%r2, %r2, 1
	addis	%r6, %r0, (min_caml_n_reflections)@h	# lis
	ori	%r6, %r6, (min_caml_n_reflections)@l
	lwz	%r6, 0(%r6)
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r5, 8(%r3)
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_diffuse.3112
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r2, %r0, (min_caml_light)@h	# lis
	ori	%r2, %r2, (min_caml_light)@l
	lwz	%r5, 8(%r3)
	stfs	%f0, 24(%r3)	# float
	stw	%r2, 32(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_abc.3104
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 32(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	veciprod.3063
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7151)@h	# lis
	ori	%r31, %r31, (l.7151)@l
	lfs	%f1, 0(%r31)	# float
	lwz	%r2, 8(%r3)
	stfs	%f0, 40(%r3)	# float
	stfs	%f1, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_param_a.3098
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 48(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 40(%r3)	# float
	fmul	%f0, %f0, %f1
	addis	%r2, %r0, (min_caml_light)@h	# lis
	ori	%r2, %r2, (min_caml_light)@l
	lfs	%f2, 0(%r2)	# float
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.7151)@h	# lis
	ori	%r31, %r31, (l.7151)@l
	lfs	%f2, 0(%r31)	# float
	lwz	%r2, 8(%r3)
	stfs	%f0, 56(%r3)	# float
	stfs	%f2, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	o_param_b.3100
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 64(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 40(%r3)	# float
	fmul	%f0, %f0, %f1
	addis	%r2, %r0, (min_caml_light)@h	# lis
	ori	%r2, %r2, (min_caml_light)@l
	lfs	%f2, 8(%r2)	# float
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.7151)@h	# lis
	ori	%r31, %r31, (l.7151)@l
	lfs	%f2, 0(%r31)	# float
	lwz	%r2, 8(%r3)
	stfs	%f0, 72(%r3)	# float
	stfs	%f2, 80(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	o_param_c.3102
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 80(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 40(%r3)	# float
	fmul	%f0, %f0, %f1
	addis	%r2, %r0, (min_caml_light)@h	# lis
	ori	%r2, %r2, (min_caml_light)@l
	lfs	%f1, 16(%r2)	# float
	fsub	%f3, %f0, %f1
	lfs	%f0, 24(%r3)	# float
	lfs	%f1, 56(%r3)	# float
	lfs	%f2, 72(%r3)	# float
	lwz	%r2, 4(%r3)
	lwz	%r5, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	add_reflection.3500
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_n_reflections)@h	# lis
	ori	%r2, %r2, (min_caml_n_reflections)@l
	lwz	%r5, 4(%r3)
	addi	%r5, %r5, 1
	stw	%r5, 0(%r2)
	blr
setup_reflections.3513:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9835
	addis	%r5, %r0, (min_caml_objects)@h	# lis
	ori	%r5, %r5, (min_caml_objects)@l
	addi	%r1, %r0, 2	# li
	slw	%r2, %r6, %r1 # swap
	lwzx	%r5, %r5, %r6
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_reflectiontype.3092
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9836
	lwz	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_diffuse.3112
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7131)@h	# lis
	ori	%r31, %r31, (l.7131)@l
	lfs	%f1, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fless.2997
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9837
	blr
beq_else.9837:
	lwz	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_form.3090
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.9839
	lwz	%r2, 0(%r3)
	lwz	%r5, 4(%r3)
	b	setup_rect_reflection.3507
beq_else.9839:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9840
	lwz	%r2, 0(%r3)
	lwz	%r5, 4(%r3)
	b	setup_surface_reflection.3510
beq_else.9840:
	blr
beq_else.9836:
	blr
bge_else.9835:
	blr
rt.3515:
	lwz	%r6, 16(%r29)
	lwz	%r7, 12(%r29)
	lwz	%r8, 8(%r29)
	lwz	%r9, 4(%r29)
	addis	%r10, %r0, (min_caml_image_size)@h	# lis
	ori	%r10, %r10, (min_caml_image_size)@l
	stw	%r2, 0(%r10)
	addis	%r10, %r0, (min_caml_image_size)@h	# lis
	ori	%r10, %r10, (min_caml_image_size)@l
	stw	%r5, 4(%r10)
	addis	%r10, %r0, (min_caml_image_center)@h	# lis
	ori	%r10, %r10, (min_caml_image_center)@l
	addi	%r1, %r0, 1	# lis
	srw	%r2, %r11, %r1 # swap
	stw	%r11, 0(%r10)
	addis	%r10, %r0, (min_caml_image_center)@h	# lis
	ori	%r10, %r10, (min_caml_image_center)@l
	addi	%r1, %r0, 1	# lis
	srw	%r5, %r5, %r1 # swap
	stw	%r5, 4(%r10)
	addis	%r5, %r0, (min_caml_scan_pitch)@h	# lis
	ori	%r5, %r5, (min_caml_scan_pitch)@l
	addis	%r31, %r0, (l.7741)@h	# lis
	ori	%r31, %r31, (l.7741)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r6, 0(%r3)
	stw	%r8, 4(%r3)
	stw	%r9, 8(%r3)
	stw	%r7, 12(%r3)
	stw	%r5, 16(%r3)
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	float_of_int.3006
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fdiv	%f0, %f1, %f0
	lwz	%r2, 16(%r3)
	stfs	%f0, 0(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	create_pixelline.3462
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 32(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	create_pixelline.3462
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 36(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	create_pixelline.3462
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r29, 12(%r3)
	stw	%r2, 40(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	write_ppm_header.3423
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r29, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_light_dirvec)@h	# lis
	ori	%r2, %r2, (min_caml_light_dirvec)@l
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	d_vec.3149
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, (min_caml_light)@h	# lis
	ori	%r5, %r5, (min_caml_light)@l
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	veccpy.3052
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_light_dirvec)@h	# lis
	ori	%r2, %r2, (min_caml_light_dirvec)@l
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	setup_dirvec_constants.3278
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_n_objects)@h	# lis
	ori	%r2, %r2, (min_caml_n_objects)@l
	lwz	%r2, 0(%r2)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	setup_reflections.3513
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 0	# li
	addi	%r6, %r0, 0	# li
	lwz	%r2, 36(%r3)
	lwz	%r29, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 0	# li
	addi	%r8, %r0, 2	# li
	lwz	%r5, 32(%r3)
	lwz	%r6, 36(%r3)
	lwz	%r7, 40(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
_min_caml_start: # main entry point
#	main program starts
	addis	%r31, %r0, (l.7744)@h	# lis
	ori	%r31, %r31, (l.7744)@l
	lfs	%f0, 0(%r31)	# float
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 16
	addis	%r5, %r0, (sqrt.3024)@h	# lis
	ori	%r5, %r5, (sqrt.3024)@l
	stw	%r5, 0(%r2)
	stfs	%f0, 8(%r2)	# float
	or	%r4, %r5, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	addis	%r6, %r0, (vecunit_sgn.3060)@h	# lis
	ori	%r6, %r6, (vecunit_sgn.3060)@l
	stw	%r6, 0(%r5)
	stw	%r2, 4(%r5)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r7, %r0, (read_nth_object.3168)@h	# lis
	ori	%r7, %r7, (read_nth_object.3168)@l
	stw	%r7, 0(%r6)
	stw	%r5, 4(%r6)
	or	%r4, %r7, %r4	# mr %r7, %r4
	addi	%r4, %r4, 8
	addis	%r8, %r0, (read_object.3170)@h	# lis
	ori	%r8, %r8, (read_object.3170)@l
	stw	%r8, 0(%r7)
	stw	%r6, 4(%r7)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r8, %r0, (read_all_object.3172)@h	# lis
	ori	%r8, %r8, (read_all_object.3172)@l
	stw	%r8, 0(%r6)
	stw	%r7, 4(%r6)
	or	%r4, %r7, %r4	# mr %r7, %r4
	addi	%r4, %r4, 8
	addis	%r8, %r0, (read_parameter.3180)@h	# lis
	ori	%r8, %r8, (read_parameter.3180)@l
	stw	%r8, 0(%r7)
	stw	%r6, 4(%r7)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r8, %r0, (solver_second.3216)@h	# lis
	ori	%r8, %r8, (solver_second.3216)@l
	stw	%r8, 0(%r6)
	stw	%r2, 4(%r6)
	or	%r4, %r8, %r4	# mr %r8, %r4
	addi	%r4, %r4, 8
	addis	%r9, %r0, (solver.3222)@h	# lis
	ori	%r9, %r9, (solver.3222)@l
	stw	%r9, 0(%r8)
	stw	%r6, 4(%r8)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r9, %r0, (solver_second_fast.3239)@h	# lis
	ori	%r9, %r9, (solver_second_fast.3239)@l
	stw	%r9, 0(%r6)
	stw	%r2, 4(%r6)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 8
	addis	%r10, %r0, (solver_fast.3245)@h	# lis
	ori	%r10, %r10, (solver_fast.3245)@l
	stw	%r10, 0(%r9)
	stw	%r6, 4(%r9)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r10, %r0, (solver_second_fast2.3256)@h	# lis
	ori	%r10, %r10, (solver_second_fast2.3256)@l
	stw	%r10, 0(%r6)
	stw	%r2, 4(%r6)
	or	%r4, %r10, %r4	# mr %r10, %r4
	addi	%r4, %r4, 8
	addis	%r11, %r0, (solver_fast2.3263)@h	# lis
	ori	%r11, %r11, (solver_fast2.3263)@l
	stw	%r11, 0(%r10)
	stw	%r6, 4(%r10)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r11, %r0, (shadow_check_and_group.3311)@h	# lis
	ori	%r11, %r11, (shadow_check_and_group.3311)@l
	stw	%r11, 0(%r6)
	stw	%r9, 4(%r6)
	or	%r4, %r11, %r4	# mr %r11, %r4
	addi	%r4, %r4, 8
	addis	%r12, %r0, (shadow_check_one_or_group.3314)@h	# lis
	ori	%r12, %r12, (shadow_check_one_or_group.3314)@l
	stw	%r12, 0(%r11)
	stw	%r6, 4(%r11)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 16
	addis	%r12, %r0, (shadow_check_one_or_matrix.3317)@h	# lis
	ori	%r12, %r12, (shadow_check_one_or_matrix.3317)@l
	stw	%r12, 0(%r6)
	stw	%r9, 8(%r6)
	stw	%r11, 4(%r6)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 8
	addis	%r11, %r0, (solve_each_element.3320)@h	# lis
	ori	%r11, %r11, (solve_each_element.3320)@l
	stw	%r11, 0(%r9)
	stw	%r8, 4(%r9)
	or	%r4, %r11, %r4	# mr %r11, %r4
	addi	%r4, %r4, 8
	addis	%r12, %r0, (solve_one_or_network.3324)@h	# lis
	ori	%r12, %r12, (solve_one_or_network.3324)@l
	stw	%r12, 0(%r11)
	stw	%r9, 4(%r11)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 16
	addis	%r12, %r0, (trace_or_matrix.3328)@h	# lis
	ori	%r12, %r12, (trace_or_matrix.3328)@l
	stw	%r12, 0(%r9)
	stw	%r8, 8(%r9)
	stw	%r11, 4(%r9)
	or	%r4, %r8, %r4	# mr %r8, %r4
	addi	%r4, %r4, 8
	addis	%r11, %r0, (judge_intersection.3332)@h	# lis
	ori	%r11, %r11, (judge_intersection.3332)@l
	stw	%r11, 0(%r8)
	stw	%r9, 4(%r8)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 8
	addis	%r11, %r0, (solve_each_element_fast.3334)@h	# lis
	ori	%r11, %r11, (solve_each_element_fast.3334)@l
	stw	%r11, 0(%r9)
	stw	%r10, 4(%r9)
	or	%r4, %r11, %r4	# mr %r11, %r4
	addi	%r4, %r4, 8
	addis	%r12, %r0, (solve_one_or_network_fast.3338)@h	# lis
	ori	%r12, %r12, (solve_one_or_network_fast.3338)@l
	stw	%r12, 0(%r11)
	stw	%r9, 4(%r11)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 16
	addis	%r12, %r0, (trace_or_matrix_fast.3342)@h	# lis
	ori	%r12, %r12, (trace_or_matrix_fast.3342)@l
	stw	%r12, 0(%r9)
	stw	%r10, 8(%r9)
	stw	%r11, 4(%r9)
	or	%r4, %r10, %r4	# mr %r10, %r4
	addi	%r4, %r4, 8
	addis	%r11, %r0, (judge_intersection_fast.3346)@h	# lis
	ori	%r11, %r11, (judge_intersection_fast.3346)@l
	stw	%r11, 0(%r10)
	stw	%r9, 4(%r10)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 8
	addis	%r11, %r0, (get_nvector_second.3352)@h	# lis
	ori	%r11, %r11, (get_nvector_second.3352)@l
	stw	%r11, 0(%r9)
	stw	%r5, 4(%r9)
	or	%r4, %r11, %r4	# mr %r11, %r4
	addi	%r4, %r4, 8
	addis	%r12, %r0, (get_nvector.3354)@h	# lis
	ori	%r12, %r12, (get_nvector.3354)@l
	stw	%r12, 0(%r11)
	stw	%r9, 4(%r11)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 8
	addis	%r12, %r0, (utexture.3357)@h	# lis
	ori	%r12, %r12, (utexture.3357)@l
	stw	%r12, 0(%r9)
	stw	%r2, 4(%r9)
	or	%r4, %r12, %r4	# mr %r12, %r4
	addi	%r4, %r4, 16
	addis	%r13, %r0, (trace_reflections.3364)@h	# lis
	ori	%r13, %r13, (trace_reflections.3364)@l
	stw	%r13, 0(%r12)
	stw	%r6, 8(%r12)
	stw	%r10, 4(%r12)
	or	%r4, %r13, %r4	# mr %r13, %r4
	addi	%r4, %r4, 24
	addis	%r14, %r0, (trace_ray.3369)@h	# lis
	ori	%r14, %r14, (trace_ray.3369)@l
	stw	%r14, 0(%r13)
	stw	%r9, 20(%r13)
	stw	%r12, 16(%r13)
	stw	%r6, 12(%r13)
	stw	%r8, 8(%r13)
	stw	%r11, 4(%r13)
	or	%r4, %r8, %r4	# mr %r8, %r4
	addi	%r4, %r4, 24
	addis	%r12, %r0, (trace_diffuse_ray.3375)@h	# lis
	ori	%r12, %r12, (trace_diffuse_ray.3375)@l
	stw	%r12, 0(%r8)
	stw	%r9, 16(%r8)
	stw	%r6, 12(%r8)
	stw	%r10, 8(%r8)
	stw	%r11, 4(%r8)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r9, %r0, (iter_trace_diffuse_rays.3378)@h	# lis
	ori	%r9, %r9, (iter_trace_diffuse_rays.3378)@l
	stw	%r9, 0(%r6)
	stw	%r8, 4(%r6)
	or	%r4, %r8, %r4	# mr %r8, %r4
	addi	%r4, %r4, 8
	addis	%r9, %r0, (trace_diffuse_rays.3383)@h	# lis
	ori	%r9, %r9, (trace_diffuse_rays.3383)@l
	stw	%r9, 0(%r8)
	stw	%r6, 4(%r8)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r9, %r0, (trace_diffuse_ray_80percent.3387)@h	# lis
	ori	%r9, %r9, (trace_diffuse_ray_80percent.3387)@l
	stw	%r9, 0(%r6)
	stw	%r8, 4(%r6)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 8
	addis	%r10, %r0, (calc_diffuse_using_1point.3391)@h	# lis
	ori	%r10, %r10, (calc_diffuse_using_1point.3391)@l
	stw	%r10, 0(%r9)
	stw	%r6, 4(%r9)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r10, %r0, (do_without_neighbors.3400)@h	# lis
	ori	%r10, %r10, (do_without_neighbors.3400)@l
	stw	%r10, 0(%r6)
	stw	%r9, 4(%r6)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 8
	addis	%r10, %r0, (try_exploit_neighbors.3416)@h	# lis
	ori	%r10, %r10, (try_exploit_neighbors.3416)@l
	stw	%r10, 0(%r9)
	stw	%r6, 4(%r9)
	or	%r4, %r10, %r4	# mr %r10, %r4
	addi	%r4, %r4, 8
	addis	%r11, %r0, (pretrace_diffuse_rays.3429)@h	# lis
	ori	%r11, %r11, (pretrace_diffuse_rays.3429)@l
	stw	%r11, 0(%r10)
	stw	%r8, 4(%r10)
	or	%r4, %r8, %r4	# mr %r8, %r4
	addi	%r4, %r4, 16
	addis	%r11, %r0, (pretrace_pixels.3432)@h	# lis
	ori	%r11, %r11, (pretrace_pixels.3432)@l
	stw	%r11, 0(%r8)
	stw	%r5, 12(%r8)
	stw	%r13, 8(%r8)
	stw	%r10, 4(%r8)
	or	%r4, %r5, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	addis	%r10, %r0, (pretrace_line.3439)@h	# lis
	ori	%r10, %r10, (pretrace_line.3439)@l
	stw	%r10, 0(%r5)
	stw	%r8, 4(%r5)
	or	%r4, %r8, %r4	# mr %r8, %r4
	addi	%r4, %r4, 16
	addis	%r10, %r0, (scan_pixel.3443)@h	# lis
	ori	%r10, %r10, (scan_pixel.3443)@l
	stw	%r10, 0(%r8)
	stw	%r9, 8(%r8)
	stw	%r6, 4(%r8)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 16
	addis	%r9, %r0, (scan_line.3449)@h	# lis
	ori	%r9, %r9, (scan_line.3449)@l
	stw	%r9, 0(%r6)
	stw	%r8, 8(%r6)
	stw	%r5, 4(%r6)
	or	%r4, %r8, %r4	# mr %r8, %r4
	addi	%r4, %r4, 8
	addis	%r9, %r0, (adjust_position.3466)@h	# lis
	ori	%r9, %r9, (adjust_position.3466)@l
	stw	%r9, 0(%r8)
	stw	%r2, 4(%r8)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 16
	addis	%r10, %r0, (calc_dirvec.3469)@h	# lis
	ori	%r10, %r10, (calc_dirvec.3469)@l
	stw	%r10, 0(%r9)
	stw	%r2, 8(%r9)
	stw	%r8, 4(%r9)
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 8
	addis	%r8, %r0, (calc_dirvecs.3477)@h	# lis
	ori	%r8, %r8, (calc_dirvecs.3477)@l
	stw	%r8, 0(%r2)
	stw	%r9, 4(%r2)
	or	%r4, %r8, %r4	# mr %r8, %r4
	addi	%r4, %r4, 8
	addis	%r9, %r0, (calc_dirvec_rows.3482)@h	# lis
	ori	%r9, %r9, (calc_dirvec_rows.3482)@l
	stw	%r9, 0(%r8)
	stw	%r2, 4(%r8)
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 8
	addis	%r9, %r0, (init_dirvecs.3498)@h	# lis
	ori	%r9, %r9, (init_dirvecs.3498)@l
	stw	%r9, 0(%r2)
	stw	%r8, 4(%r2)
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 24
	addis	%r8, %r0, (rt.3515)@h	# lis
	ori	%r8, %r8, (rt.3515)@l
	stw	%r8, 0(%r29)
	stw	%r6, 16(%r29)
	stw	%r7, 12(%r29)
	stw	%r5, 8(%r29)
	stw	%r2, 4(%r29)
	addi	%r2, %r0, 128	# li
	addi	%r5, %r0, 128	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	sc
