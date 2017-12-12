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
l.7729:	 # 0.000000
	.long	646978940
	.align 3
l.7728:	 # 0.000000
	.long	786163454
	.align 3
l.7725:	 # 128.000000
	.long	1124073472
	.align 3
l.7692:	 # 0.900000
	.long	1063675494
	.align 3
l.7598:	 # 150.000000
	.long	1125515264
	.align 3
l.7596:	 # -150.000000
	.long	3272998912
	.align 3
l.7578:	 # -2.000000
	.long	3221225472
	.align 3
l.7576:	 # 0.003906
	.long	998244352
	.align 3
l.7554:	 # 20.000000
	.long	1101004800
	.align 3
l.7553:	 # 0.050000
	.long	1028443340
	.align 3
l.7549:	 # 0.250000
	.long	1048576000
	.align 3
l.7542:	 # 0.300000
	.long	1050253721
	.align 3
l.7541:	 # 255.000000
	.long	1132396544
	.align 3
l.7540:	 # 0.150000
	.long	1041865113
	.align 3
l.7538:	 # 3.141593
	.long	1078530010
	.align 3
l.7537:	 # 30.000000
	.long	1106247680
	.align 3
l.7536:	 # 15.000000
	.long	1097859072
	.align 3
l.7535:	 # 0.000100
	.long	953267991
	.align 3
l.7492:	 # 100000000.000000
	.long	1287568416
	.align 3
l.7488:	 # 1000000000.000000
	.long	1315859240
	.align 3
l.7468:	 # -0.100000
	.long	3184315596
	.align 3
l.7455:	 # 0.010000
	.long	1008981770
	.align 3
l.7454:	 # -0.200000
	.long	3192704204
	.align 3
l.7230:	 # -200.000000
	.long	3276275712
	.align 3
l.7228:	 # 200.000000
	.long	1128792064
	.align 3
l.7224:	 # 0.017453
	.long	1016003125
	.align 3
l.7141:	 # -1.000000
	.long	3212836864
	.align 3
l.7140:	 # 10.000000
	.long	1092616192
	.align 3
l.7139:	 # 0.100000
	.long	1036831948
	.align 3
l.7130:	 # 2.000000
	.long	1073741824
	.align 3
l.7129:	 # 1.570796
	.long	1070141402
	.align 3
l.7128:	 # 0.785398
	.long	1061752794
	.align 3
l.7127:	 # 2.437500
	.long	1075576832
	.align 3
l.7126:	 # 0.437500
	.long	1054867456
	.align 3
l.7125:	 # 0.060035
	.long	1031137220
	.align 3
l.7124:	 # 0.089764
	.long	1035458157
	.align 3
l.7123:	 # 0.111111
	.long	1038323255
	.align 3
l.7122:	 # 0.142857
	.long	1041385764
	.align 3
l.7121:	 # 0.200000
	.long	1045220556
	.align 3
l.7120:	 # 0.333333
	.long	1051372201
	.align 3
l.7119:	 # 2.356195
	.long	1075235812
	.align 3
l.7118:	 # 0.785398
	.long	1061752794
	.align 3
l.7117:	 # 1.570796
	.long	1070141402
	.align 3
l.7116:	 # 3.141593
	.long	1078530010
	.align 3
l.7115:	 # 6.283185
	.long	1086918618
	.align 3
l.7114:	 # 0.000000
	.long	0
	.align 3
l.7113:	 # 0.001370
	.long	984842501
	.align 3
l.7112:	 # 0.041664
	.long	1026205576
	.align 3
l.7111:	 # 0.500000
	.long	1056964608
	.align 3
l.7110:	 # 1.000000
	.long	1065353216
	.align 3
l.7109:	 # 0.000196
	.long	961373365
	.align 3
l.7108:	 # 0.008333
	.long	1007191653
	.align 3
l.7107:	 # 0.166667
	.long	1042983595
	.text
	.globl _min_caml_start
	.align 2
mul_sub.7075:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.9380
	blr
beq_else.9380:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r5 # swap
	and	%r6, %r6, %r8
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.9381
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.9381:
	slw	%r7, %r6, %r5 # swap
	add	%r2, %r2, %r6
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
mul.2952:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9382
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.9383
bge_else.9382:
	neg	%r6, %r2
bge_cont.9383:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.9384
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.9385
bge_else.9384:
	neg	%r7, %r5
bge_cont.9385:
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r8, %r0, (mul_sub.7075)@h	# lis
	ori	%r8, %r8, (mul_sub.7075)@l
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
	bne	%cr7, beq_else.9386
	blr
beq_else.9386:
	neg	%r2, %r2
	blr
div_sub.7041:
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.9387
	blr
beq_else.9387:
	srw	%r5, %r8, %r7 # swap
	cmp	%cr7, %r6, %r8
	bgt	%cr7, ble_else.9388
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7 # swap
	add	%r2, %r8, %r2
	slw	%r6, %r8, %r7 # swap
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.7041
ble_else.9388:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.7041
div.2955:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9389
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.9390
bge_else.9389:
	neg	%r6, %r2
bge_cont.9390:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.9391
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.9392
bge_else.9391:
	neg	%r7, %r5
bge_cont.9392:
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
	bl	div_sub.7041
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
	bne	%cr7, beq_else.9393
	blr
beq_else.9393:
	neg	%r2, %r2
	blr
print_int_sub.7021:
	cmpwi	%cr7, %r2, 10
	blt	%cr7, bge_else.9394
	addi	%r5, %r0, 10	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.2955
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int_sub.7021
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.2955
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	mul.2952
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	subf	%r2, %r2, %r5	# sub	%r2, %r5, %r2
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
bge_else.9394:
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
print_int.2960:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9397
	b	print_int_sub.7021
bge_else.9397:
	addi	%r5, %r0, 45	# li
	out	%r5, 0
	neg	%r2, %r2
	b	print_int_sub.7021
print_char.2962:
	out	%r2, 0
	blr
kernel_sin.2964:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	fmul	%f3, %f2, %f1
	fmul	%f1, %f3, %f1
	addis	%r31, %r0, (l.7107)@h	# lis
	ori	%r31, %r31, (l.7107)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f2, %f4, %f2
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.7108)@h	# lis
	ori	%r31, %r31, (l.7108)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.7109)@h	# lis
	ori	%r31, %r31, (l.7109)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	blr
kernel_cos.2966:
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f3, 0(%r31)	# float
	addis	%r31, %r0, (l.7111)@h	# lis
	ori	%r31, %r31, (l.7111)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f0, %f4, %f0
	fsub	%f0, %f3, %f0
	addis	%r31, %r0, (l.7112)@h	# lis
	ori	%r31, %r31, (l.7112)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.7113)@h	# lis
	ori	%r31, %r31, (l.7113)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	blr
sin.2968:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9399
	addis	%r31, %r0, (l.7115)@h	# lis
	ori	%r31, %r31, (l.7115)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.9400
	addis	%r31, %r0, (l.7116)@h	# lis
	ori	%r31, %r31, (l.7116)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9401
	addis	%r31, %r0, (l.7116)@h	# lis
	ori	%r31, %r31, (l.7116)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	addis	%r31, %r0, (l.7117)@h	# lis
	ori	%r31, %r31, (l.7117)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9402
	addis	%r31, %r0, (l.7119)@h	# lis
	ori	%r31, %r31, (l.7119)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9403
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7116)@h	# lis
	ori	%r31, %r31, (l.7116)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	kernel_sin.2964
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9403:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7117)@h	# lis
	ori	%r31, %r31, (l.7117)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f0, %f2
	stfs	%f1, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	kernel_cos.2966
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9402:
	addis	%r31, %r0, (l.7118)@h	# lis
	ori	%r31, %r31, (l.7118)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9404
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7117)@h	# lis
	ori	%r31, %r31, (l.7117)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	kernel_cos.2966
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9404:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f1, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	kernel_sin.2964
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9401:
	addis	%r31, %r0, (l.7117)@h	# lis
	ori	%r31, %r31, (l.7117)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9405
	addis	%r31, %r0, (l.7119)@h	# lis
	ori	%r31, %r31, (l.7119)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9406
	addis	%r31, %r0, (l.7116)@h	# lis
	ori	%r31, %r31, (l.7116)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_sin.2964
ble_else.9406:
	addis	%r31, %r0, (l.7117)@h	# lis
	ori	%r31, %r31, (l.7117)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	kernel_cos.2966
ble_else.9405:
	addis	%r31, %r0, (l.7118)@h	# lis
	ori	%r31, %r31, (l.7118)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9407
	addis	%r31, %r0, (l.7117)@h	# lis
	ori	%r31, %r31, (l.7117)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_cos.2966
ble_else.9407:
	b	kernel_sin.2964
ble_else.9400:
	addis	%r31, %r0, (l.7115)@h	# lis
	ori	%r31, %r31, (l.7115)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	sin.2968
ble_else.9399:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	sin.2968
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
cos.2970:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9408
	addis	%r31, %r0, (l.7115)@h	# lis
	ori	%r31, %r31, (l.7115)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.9409
	addis	%r31, %r0, (l.7116)@h	# lis
	ori	%r31, %r31, (l.7116)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9410
	addis	%r31, %r0, (l.7116)@h	# lis
	ori	%r31, %r31, (l.7116)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	addis	%r31, %r0, (l.7117)@h	# lis
	ori	%r31, %r31, (l.7117)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9411
	addis	%r31, %r0, (l.7119)@h	# lis
	ori	%r31, %r31, (l.7119)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9412
	addis	%r31, %r0, (l.7116)@h	# lis
	ori	%r31, %r31, (l.7116)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_sin.2964
ble_else.9412:
	addis	%r31, %r0, (l.7117)@h	# lis
	ori	%r31, %r31, (l.7117)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	kernel_cos.2966
ble_else.9411:
	addis	%r31, %r0, (l.7118)@h	# lis
	ori	%r31, %r31, (l.7118)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9413
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7117)@h	# lis
	ori	%r31, %r31, (l.7117)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	kernel_cos.2966
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9413:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f1, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	kernel_sin.2964
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9410:
	addis	%r31, %r0, (l.7117)@h	# lis
	ori	%r31, %r31, (l.7117)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9414
	addis	%r31, %r0, (l.7119)@h	# lis
	ori	%r31, %r31, (l.7119)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9415
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7116)@h	# lis
	ori	%r31, %r31, (l.7116)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	kernel_cos.2966
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9415:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7117)@h	# lis
	ori	%r31, %r31, (l.7117)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f0, %f2
	stfs	%f1, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	kernel_sin.2964
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9414:
	addis	%r31, %r0, (l.7118)@h	# lis
	ori	%r31, %r31, (l.7118)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9416
	addis	%r31, %r0, (l.7117)@h	# lis
	ori	%r31, %r31, (l.7117)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	kernel_sin.2964
ble_else.9416:
	b	kernel_cos.2966
ble_else.9409:
	addis	%r31, %r0, (l.7115)@h	# lis
	ori	%r31, %r31, (l.7115)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	sin.2968
ble_else.9408:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	cos.2970
kernel_atan.2972:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	fmul	%f3, %f2, %f1
	fmul	%f4, %f3, %f1
	fmul	%f5, %f4, %f1
	fmul	%f6, %f5, %f1
	fmul	%f1, %f6, %f1
	addis	%r31, %r0, (l.7120)@h	# lis
	ori	%r31, %r31, (l.7120)@l
	lfs	%f7, 0(%r31)	# float
	fmul	%f2, %f7, %f2
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.7121)@h	# lis
	ori	%r31, %r31, (l.7121)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.7122)@h	# lis
	ori	%r31, %r31, (l.7122)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f4
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.7123)@h	# lis
	ori	%r31, %r31, (l.7123)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f5
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.7124)@h	# lis
	ori	%r31, %r31, (l.7124)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f6
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.7125)@h	# lis
	ori	%r31, %r31, (l.7125)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f1, %f2, %f1
	fadd	%f0, %f0, %f1
	blr
atan.2974:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.9417
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.7126)@h	# lis
	ori	%r31, %r31, (l.7126)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9418
	addis	%r31, %r0, (l.7127)@h	# lis
	ori	%r31, %r31, (l.7127)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9419
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7129)@h	# lis
	ori	%r31, %r31, (l.7129)@l
	lfs	%f2, 0(%r31)	# float
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f3, 0(%r31)	# float
	fdiv	%f0, %f3, %f0
	stfs	%f1, 0(%r3)	# float
	stfs	%f2, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	kernel_atan.2972
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9419:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7128)@h	# lis
	ori	%r31, %r31, (l.7128)@l
	lfs	%f2, 0(%r31)	# float
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f3, 0(%r31)	# float
	fsub	%f3, %f0, %f3
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f4, 0(%r31)	# float
	fadd	%f0, %f0, %f4
	fdiv	%f0, %f3, %f0
	stfs	%f1, 16(%r3)	# float
	stfs	%f2, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	kernel_atan.2972
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fadd	%f0, %f1, %f0
	lfs	%f1, 16(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9418:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f1, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	kernel_atan.2972
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9417:
	addis	%r31, %r0, (l.7126)@h	# lis
	ori	%r31, %r31, (l.7126)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9420
	addis	%r31, %r0, (l.7127)@h	# lis
	ori	%r31, %r31, (l.7127)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9421
	addis	%r31, %r0, (l.7129)@h	# lis
	ori	%r31, %r31, (l.7129)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f2, 0(%r31)	# float
	fdiv	%f0, %f2, %f0
	stfs	%f1, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	kernel_atan.2972
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 40(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
ble_else.9421:
	addis	%r31, %r0, (l.7128)@h	# lis
	ori	%r31, %r31, (l.7128)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f2, %f0, %f2
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f3, 0(%r31)	# float
	fadd	%f0, %f0, %f3
	fdiv	%f0, %f2, %f0
	stfs	%f1, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	kernel_atan.2972
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 48(%r3)	# float
	fadd	%f0, %f1, %f0
	blr
ble_else.9420:
	b	kernel_atan.2972
fiszero.2976:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.9422
	addi	%r2, %r0, 1	# li
	blr
beq_else.9422:
	addi	%r2, %r0, 0	# li
	blr
fispos.2978:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.9423
	addi	%r2, %r0, 0	# li
	blr
ble_else.9423:
	addi	%r2, %r0, 1	# li
	blr
fisneg.2980:
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	fispos.2978
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9424
	addi	%r2, %r0, 1	# li
	blr
beq_else.9424:
	addi	%r2, %r0, 0	# li
	blr
fneg.2982:
	fneg	%f0, %f0
	blr
abs_float.2984:
	stfs	%f0, 4(%r3)	# float
	lwz	%r2, 4(%r3)
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	stw	%r2, 4(%r3)
	lfs	%f0, 4(%r3)	# float
	blr
fabs.2986:
	b	abs_float.2984
fless.2988:
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9425
	addi	%r2, %r0, 0	# li
	blr
ble_else.9425:
	addi	%r2, %r0, 1	# li
	blr
fhalf.2991:
	addis	%r31, %r0, (l.7130)@h	# lis
	ori	%r31, %r31, (l.7130)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	blr
fsqr.2993:
	fmul	%f0, %f0, %f0
	blr
int_of_float.2995:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.9426
	addi	%r2, %r0, 0	# li
	blr
beq_else.9426:
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
	blt	%cr7, bge_else.9427
	srw	%r2, %r2, %r5 # swap
	b	bge_cont.9428
bge_else.9427:
	neg	%r5, %r5
	slw	%r2, %r2, %r5 # swap
bge_cont.9428:
	addis	%r5, %r0, 65535	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9429
	blr
ble_else.9429:
	neg	%r2, %r2
	blr
msb_sub.6816:
	srw	%r2, %r6, %r5 # swap
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.9430
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9431
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
beq_else.9431:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	b	msb_sub.6816
beq_else.9430:
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
float_of_int.2997:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9432
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
	blr
beq_else.9432:
	addi	%r5, %r0, 31	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	msb_sub.6816
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
floor.2999:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9433
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	int_of_float.2995
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	b	float_of_int.2997
ble_else.9433:
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	int_of_float.2995
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	b	float_of_int.2997
deriv.3003:
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
xn_plus_one.3007:
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
	bl	deriv.3003
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fdiv	%f0, %f1, %f0
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
newton.6798:
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
	bl	abs_float.2984
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.9437
	lfs	%f0, 24(%r3)	# float
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
ble_else.9437:
	lfs	%f0, 24(%r3)	# float
	blr
newton_sub.3010:
	lwz	%r5, 12(%r29)
	lfs	%f1, 8(%r29)	# float
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r6, %r0, (newton.6798)@h	# lis
	ori	%r6, %r6, (newton.6798)@l
	stw	%r6, 0(%r29)
	stw	%r5, 12(%r29)
	stfs	%f1, 8(%r29)	# float
	stw	%r2, 4(%r29)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
f.6794:
	lfs	%f1, 8(%r29)	# float
	fmul	%f0, %f0, %f0
	fsub	%f0, %f0, %f1
	blr
sqrt.3013:
	lwz	%r29, 4(%r29)
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 16
	addis	%r5, %r0, (f.6794)@h	# lis
	ori	%r5, %r5, (f.6794)@l
	stw	%r5, 0(%r2)
	stfs	%f0, 8(%r2)	# float
	addis	%r31, %r0, (l.7130)@h	# lis
	ori	%r31, %r31, (l.7130)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
f.6774:
	in	%r5, 0
	cmpwi	%cr7, %r5, 47
	bgt	%cr7, ble_else.9438
	blr
ble_else.9438:
	cmpwi	%cr7, %r5, 58
	blt	%cr7, bge_else.9439
	blr
bge_else.9439:
	addi	%r6, %r0, 10	# li
	stw	%r5, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	mul.2952
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	addi	%r5, %r5, -48	# subi %r5, %r5, 48
	add	%r2, %r2, %r5
	b	f.6774
read_int.3015:
	in	%r2, 0
	cmpwi	%cr7, %r2, 45
	bne	%cr7, beq_else.9440
	addi	%r2, %r0, 0	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	f.6774
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	neg	%r2, %r2
	blr
beq_else.9440:
	cmpwi	%cr7, %r2, 47
	bgt	%cr7, ble_else.9441
	b	read_int.3015
ble_else.9441:
	cmpwi	%cr7, %r2, 58
	blt	%cr7, bge_else.9442
	b	read_int.3015
bge_else.9442:
	addi	%r2, %r2, -48	# subi %r2, %r2, 48
	b	f.6774
g.6735:
	in	%r2, 0
	cmpwi	%cr7, %r2, 47
	bgt	%cr7, ble_else.9443
	fmr	%f0, %f1
	blr
ble_else.9443:
	cmpwi	%cr7, %r2, 58
	blt	%cr7, bge_else.9444
	fmr	%f0, %f1
	blr
bge_else.9444:
	addis	%r31, %r0, (l.7139)@h	# lis
	ori	%r31, %r31, (l.7139)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f0, %f2
	addi	%r2, %r2, -48	# subi %r2, %r2, 48
	stfs	%f2, 0(%r3)	# float
	stfs	%f1, 8(%r3)	# float
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	float_of_int.2997
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 8(%r3)	# float
	fadd	%f1, %f1, %f0
	lfs	%f0, 0(%r3)	# float
	b	g.6735
f.6738:
	in	%r2, 0
	cmpwi	%cr7, %r2, 47
	bgt	%cr7, ble_else.9445
	cmpwi	%cr7, %r2, 46
	bne	%cr7, beq_else.9446
	addis	%r31, %r0, (l.7139)@h	# lis
	ori	%r31, %r31, (l.7139)@l
	lfs	%f1, 0(%r31)	# float
	fmr	%f31, %f1
	fmr	%f1, %f0
	fmr	%f0, %f31
	b	g.6735
beq_else.9446:
	blr
ble_else.9445:
	cmpwi	%cr7, %r2, 58
	blt	%cr7, bge_else.9447
	blr
bge_else.9447:
	addis	%r31, %r0, (l.7140)@h	# lis
	ori	%r31, %r31, (l.7140)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addi	%r2, %r2, -48	# subi %r2, %r2, 48
	stfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	float_of_int.2997
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fadd	%f0, %f1, %f0
	b	f.6738
read_float.3017:
	in	%r2, 0
	cmpwi	%cr7, %r2, 45
	bne	%cr7, beq_else.9448
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	f.6738
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
beq_else.9448:
	cmpwi	%cr7, %r2, 47
	bgt	%cr7, ble_else.9449
	b	read_float.3017
ble_else.9449:
	cmpwi	%cr7, %r2, 58
	blt	%cr7, bge_else.9450
	b	read_float.3017
bge_else.9450:
	addi	%r2, %r2, -48	# subi %r2, %r2, 48
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	float_of_int.2997
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	b	f.6738
sgn.3023:
	stfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fiszero.2976
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9451
	lfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fispos.2978
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9452
	addis	%r31, %r0, (l.7141)@h	# lis
	ori	%r31, %r31, (l.7141)@l
	lfs	%f0, 0(%r31)	# float
	blr
beq_else.9452:
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f0, 0(%r31)	# float
	blr
beq_else.9451:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
	blr
fneg_cond.3025:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9453
	b	fneg.2982
beq_else.9453:
	blr
add_mod5.3028:
	add	%r2, %r2, %r5
	cmpwi	%cr7, %r2, 5
	blt	%cr7, bge_else.9454
	addi	%r2, %r2, -5	# subi %r2, %r2, 5
	blr
bge_else.9454:
	blr
vecset.3031:
	stfs	%f0, 0(%r2)	# float
	stfs	%f1, 8(%r2)	# float
	stfs	%f2, 16(%r2)	# float
	blr
vecfill.3036:
	stfs	%f0, 0(%r2)	# float
	stfs	%f0, 8(%r2)	# float
	stfs	%f0, 16(%r2)	# float
	blr
vecbzero.3039:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
	b	vecfill.3036
veccpy.3041:
	lfs	%f0, 0(%r5)	# float
	stfs	%f0, 0(%r2)	# float
	lfs	%f0, 8(%r5)	# float
	stfs	%f0, 8(%r2)	# float
	lfs	%f0, 16(%r5)	# float
	stfs	%f0, 16(%r2)	# float
	blr
vecunit_sgn.3049:
	lwz	%r6, 4(%r29)
	lfs	%f0, 0(%r2)	# float
	stw	%r5, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fsqr.2993
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
	bl	fsqr.2993
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
	bl	fsqr.2993
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
	bl	fiszero.2976
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9459
	lwz	%r2, 0(%r3)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9461
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 32(%r3)	# float
	fdiv	%f0, %f0, %f1
	b	beq_cont.9462
beq_else.9461:
	addis	%r31, %r0, (l.7141)@h	# lis
	ori	%r31, %r31, (l.7141)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 32(%r3)	# float
	fdiv	%f0, %f0, %f1
beq_cont.9462:
	b	beq_cont.9460
beq_else.9459:
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.9460:
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
veciprod.3052:
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
veciprod2.3055:
	lfs	%f3, 0(%r2)	# float
	fmul	%f0, %f3, %f0
	lfs	%f3, 8(%r2)	# float
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	lfs	%f1, 16(%r2)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	blr
vecaccum.3060:
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
vecadd.3064:
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
vecscale.3070:
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
vecaccumv.3073:
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
o_texturetype.3077:
	lwz	%r2, 0(%r2)
	blr
o_form.3079:
	lwz	%r2, 4(%r2)
	blr
o_reflectiontype.3081:
	lwz	%r2, 8(%r2)
	blr
o_isinvert.3083:
	lwz	%r2, 24(%r2)
	blr
o_isrot.3085:
	lwz	%r2, 12(%r2)
	blr
o_param_a.3087:
	lwz	%r2, 16(%r2)
	lfs	%f0, 0(%r2)	# float
	blr
o_param_b.3089:
	lwz	%r2, 16(%r2)
	lfs	%f0, 8(%r2)	# float
	blr
o_param_c.3091:
	lwz	%r2, 16(%r2)
	lfs	%f0, 16(%r2)	# float
	blr
o_param_abc.3093:
	lwz	%r2, 16(%r2)
	blr
o_param_x.3095:
	lwz	%r2, 20(%r2)
	lfs	%f0, 0(%r2)	# float
	blr
o_param_y.3097:
	lwz	%r2, 20(%r2)
	lfs	%f0, 8(%r2)	# float
	blr
o_param_z.3099:
	lwz	%r2, 20(%r2)
	lfs	%f0, 16(%r2)	# float
	blr
o_diffuse.3101:
	lwz	%r2, 28(%r2)
	lfs	%f0, 0(%r2)	# float
	blr
o_hilight.3103:
	lwz	%r2, 28(%r2)
	lfs	%f0, 8(%r2)	# float
	blr
o_color_red.3105:
	lwz	%r2, 32(%r2)
	lfs	%f0, 0(%r2)	# float
	blr
o_color_green.3107:
	lwz	%r2, 32(%r2)
	lfs	%f0, 8(%r2)	# float
	blr
o_color_blue.3109:
	lwz	%r2, 32(%r2)
	lfs	%f0, 16(%r2)	# float
	blr
o_param_r1.3111:
	lwz	%r2, 36(%r2)
	lfs	%f0, 0(%r2)	# float
	blr
o_param_r2.3113:
	lwz	%r2, 36(%r2)
	lfs	%f0, 8(%r2)	# float
	blr
o_param_r3.3115:
	lwz	%r2, 36(%r2)
	lfs	%f0, 16(%r2)	# float
	blr
o_param_ctbl.3117:
	lwz	%r2, 40(%r2)
	blr
p_rgb.3119:
	lwz	%r2, 0(%r2)
	blr
p_intersection_points.3121:
	lwz	%r2, 4(%r2)
	blr
p_surface_ids.3123:
	lwz	%r2, 8(%r2)
	blr
p_calc_diffuse.3125:
	lwz	%r2, 12(%r2)
	blr
p_energy.3127:
	lwz	%r2, 16(%r2)
	blr
p_received_ray_20percent.3129:
	lwz	%r2, 20(%r2)
	blr
p_group_id.3131:
	lwz	%r2, 24(%r2)
	lwz	%r2, 0(%r2)
	blr
p_set_group_id.3133:
	lwz	%r2, 24(%r2)
	stw	%r5, 0(%r2)
	blr
p_nvectors.3136:
	lwz	%r2, 28(%r2)
	blr
d_vec.3138:
	lwz	%r2, 0(%r2)
	blr
d_const.3140:
	lwz	%r2, 4(%r2)
	blr
r_surface_id.3142:
	lwz	%r2, 0(%r2)
	blr
r_dvec.3144:
	lwz	%r2, 4(%r2)
	blr
r_bright.3146:
	lfs	%f0, 8(%r2)	# float
	blr
rad.3148:
	addis	%r31, %r0, (l.7224)@h	# lis
	ori	%r31, %r31, (l.7224)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	blr
read_screen_settings.3150:
	addis	%r2, %r0, (min_caml_screen)@h	# lis
	ori	%r2, %r2, (min_caml_screen)@l
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_float.3017
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
	bl	read_float.3017
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
	bl	read_float.3017
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	stfs	%f0, 16(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	read_float.3017
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	rad.3148
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	cos.2970
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	sin.2968
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	read_float.3017
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	rad.3148
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	cos.2970
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 40(%r3)	# float
	stfs	%f0, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	sin.2968
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_screenz_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screenz_dir)@l
	lfs	%f1, 24(%r3)	# float
	fmul	%f2, %f1, %f0
	addis	%r31, %r0, (l.7228)@h	# lis
	ori	%r31, %r31, (l.7228)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	stfs	%f2, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_screenz_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screenz_dir)@l
	addis	%r31, %r0, (l.7230)@h	# lis
	ori	%r31, %r31, (l.7230)@l
	lfs	%f2, 0(%r31)	# float
	lfs	%f3, 32(%r3)	# float
	fmul	%f2, %f3, %f2
	stfs	%f2, 8(%r2)	# float
	addis	%r2, %r0, (min_caml_screenz_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screenz_dir)@l
	lfs	%f2, 48(%r3)	# float
	fmul	%f4, %f1, %f2
	addis	%r31, %r0, (l.7228)@h	# lis
	ori	%r31, %r31, (l.7228)@l
	lfs	%f5, 0(%r31)	# float
	fmul	%f4, %f4, %f5
	stfs	%f4, 16(%r2)	# float
	addis	%r2, %r0, (min_caml_screenx_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screenx_dir)@l
	stfs	%f2, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_screenx_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screenx_dir)@l
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f4, 0(%r31)	# float
	stfs	%f4, 8(%r2)	# float
	addis	%r2, %r0, (min_caml_screenx_dir)@h	# lis
	ori	%r2, %r2, (min_caml_screenx_dir)@l
	stfs	%f0, 56(%r3)	# float
	stw	%r2, 64(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fneg.2982
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
	bl	fneg.2982
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
	bl	fneg.2982
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
	bl	fneg.2982
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
read_light.3152:
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_int.3015
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_float.3017
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	rad.3148
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	sin.2968
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_light)@h	# lis
	ori	%r2, %r2, (min_caml_light)@l
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fneg.2982
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	stfs	%f0, 8(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	read_float.3017
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	rad.3148
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	cos.2970
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 16(%r3)	# float
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	sin.2968
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
	bl	cos.2970
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
	bl	read_float.3017
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 32(%r3)
	stfs	%f0, 0(%r2)	# float
	blr
rotate_quadratic_matrix.3154:
	lfs	%f0, 0(%r5)	# float
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	cos.2970
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
	bl	sin.2968
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
	bl	cos.2970
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
	bl	sin.2968
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
	bl	cos.2970
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
	bl	sin.2968
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
	bl	fneg.2982
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
	bl	fsqr.2993
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
	bl	fsqr.2993
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
	bl	fsqr.2993
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
	bl	fsqr.2993
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
	bl	fsqr.2993
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
	bl	fsqr.2993
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
	bl	fsqr.2993
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
	bl	fsqr.2993
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
	bl	fsqr.2993
	addi	%r3, %r3, -200	# subi
	lwz	%r31, 196(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 112(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f2, 184(%r3)	# float
	fadd	%f0, %f2, %f0
	lwz	%r2, 0(%r3)
	stfs	%f0, 16(%r2)	# float
	addis	%r31, %r0, (l.7130)@h	# lis
	ori	%r31, %r31, (l.7130)@l
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
	addis	%r31, %r0, (l.7130)@h	# lis
	ori	%r31, %r31, (l.7130)@l
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
	addis	%r31, %r0, (l.7130)@h	# lis
	ori	%r31, %r31, (l.7130)@l
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
read_nth_object.3157:
	lwz	%r5, 4(%r29)
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	read_int.3015
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.9474
	addi	%r2, %r0, 0	# li
	blr
beq_else.9474:
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	read_int.3015
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	read_int.3015
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	read_int.3015
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
	bl	read_float.3017
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	stfs	%f0, 0(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	read_float.3017
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	stfs	%f0, 8(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	read_float.3017
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	stfs	%f0, 16(%r2)	# float
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
	bl	read_float.3017
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 28(%r3)
	stfs	%f0, 0(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	read_float.3017
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 28(%r3)
	stfs	%f0, 8(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	read_float.3017
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 28(%r3)
	stfs	%f0, 16(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	read_float.3017
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fisneg.2980
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 2	# li
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
	bl	read_float.3017
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 36(%r3)
	stfs	%f0, 0(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	read_float.3017
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 36(%r3)
	stfs	%f0, 8(%r2)	# float
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
	bl	read_float.3017
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 40(%r3)
	stfs	%f0, 0(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	read_float.3017
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 40(%r3)
	stfs	%f0, 8(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	read_float.3017
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 40(%r3)
	stfs	%f0, 16(%r2)	# float
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
	bne	%cr7, beq_else.9475
	b	beq_cont.9476
beq_else.9475:
	stw	%r2, 44(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	read_float.3017
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	rad.3148
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 44(%r3)
	stfs	%f0, 0(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	read_float.3017
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	rad.3148
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 44(%r3)
	stfs	%f0, 8(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	read_float.3017
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	rad.3148
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 44(%r3)
	stfs	%f0, 16(%r2)	# float
beq_cont.9476:
	lwz	%r5, 12(%r3)
	cmpwi	%cr7, %r5, 2
	bne	%cr7, beq_else.9477
	addi	%r6, %r0, 1	# li
	b	beq_cont.9478
beq_else.9477:
	lwz	%r6, 32(%r3)
beq_cont.9478:
	addi	%r7, %r0, 4	# li
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
	bne	%cr7, beq_else.9479
	lfs	%f0, 0(%r6)	# float
	stfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fiszero.2976
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9482
	lfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	sgn.3023
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	stfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fsqr.2993
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 64(%r3)	# float
	fdiv	%f0, %f1, %f0
	b	beq_cont.9483
beq_else.9482:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.9483:
	lwz	%r2, 24(%r3)
	stfs	%f0, 0(%r2)	# float
	lfs	%f0, 8(%r2)	# float
	stfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	fiszero.2976
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9484
	lfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	sgn.3023
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 72(%r3)	# float
	stfs	%f0, 80(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	fsqr.2993
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 80(%r3)	# float
	fdiv	%f0, %f1, %f0
	b	beq_cont.9485
beq_else.9484:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.9485:
	lwz	%r2, 24(%r3)
	stfs	%f0, 8(%r2)	# float
	lfs	%f0, 16(%r2)	# float
	stfs	%f0, 88(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	fiszero.2976
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9486
	lfs	%f0, 88(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	sgn.3023
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 88(%r3)	# float
	stfs	%f0, 96(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	fsqr.2993
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 96(%r3)	# float
	fdiv	%f0, %f1, %f0
	b	beq_cont.9487
beq_else.9486:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.9487:
	lwz	%r2, 24(%r3)
	stfs	%f0, 16(%r2)	# float
	b	beq_cont.9480
beq_else.9479:
	cmpwi	%cr7, %r8, 2
	bne	%cr7, beq_else.9488
	lwz	%r5, 32(%r3)
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.9490
	addi	%r5, %r0, 1	# li
	b	beq_cont.9491
beq_else.9490:
	addi	%r5, %r0, 0	# li
beq_cont.9491:
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
	b	beq_cont.9489
beq_else.9488:
beq_cont.9489:
beq_cont.9480:
	lwz	%r2, 20(%r3)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9492
	b	beq_cont.9493
beq_else.9492:
	lwz	%r2, 24(%r3)
	lwz	%r5, 44(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	rotate_quadratic_matrix.3154
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9493:
	addi	%r2, %r0, 1	# li
	blr
read_object.3159:
	lwz	%r5, 4(%r29)
	cmpwi	%cr7, %r2, 60
	blt	%cr7, bge_else.9494
	blr
bge_else.9494:
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
	bne	%cr7, beq_else.9496
	addis	%r2, %r0, (min_caml_n_objects)@h	# lis
	ori	%r2, %r2, (min_caml_n_objects)@l
	lwz	%r5, 4(%r3)
	stw	%r5, 0(%r2)
	blr
beq_else.9496:
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, 1
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
read_all_object.3161:
	lwz	%r29, 4(%r29)
	addi	%r2, %r0, 0	# li
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
read_net_item.3163:
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_int.3015
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.9498
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	addi	%r5, %r0, -1	# li
	b	min_caml_create_array
beq_else.9498:
	lwz	%r5, 0(%r3)
	addi	%r6, %r5, 1
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	read_net_item.3163
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwz	%r6, 4(%r3)
	stwx	%r6, %r2, %r5
	blr
read_or_network.3165:
	addi	%r5, %r0, 0	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_net_item.3163
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r5)
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.9499
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	b	min_caml_create_array
beq_else.9499:
	lwz	%r2, 0(%r3)
	addi	%r6, %r2, 1
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	read_or_network.3165
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwz	%r6, 4(%r3)
	stwx	%r6, %r2, %r5
	blr
read_and_network.3167:
	addi	%r5, %r0, 0	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_net_item.3163
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.9500
	blr
beq_else.9500:
	addis	%r5, %r0, (min_caml_and_net)@h	# lis
	ori	%r5, %r5, (min_caml_and_net)@l
	lwz	%r6, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r6, %r7, %r1 # swap
	stwx	%r2, %r5, %r7
	addi	%r2, %r6, 1
	b	read_and_network.3167
read_parameter.3169:
	lwz	%r2, 4(%r29)
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_screen_settings.3150
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_light.3152
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
	bl	read_and_network.3167
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
	bl	read_or_network.3165
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	stw	%r2, 0(%r5)
	blr
solver_rect_surface.3171:
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
	bl	fiszero.2976
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9505
	lwz	%r2, 48(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_param_abc.3093
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 48(%r3)
	stw	%r2, 52(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_isinvert.3083
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
	bl	fisneg.2980
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
	bl	fneg_cond.3025
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
	bl	fabs.2986
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
	bl	fless.2988
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9507
	addi	%r2, %r0, 0	# li
	blr
beq_else.9507:
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
	bl	fabs.2986
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
	bl	fless.2988
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9508
	addi	%r2, %r0, 0	# li
	blr
beq_else.9508:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 64(%r3)	# float
	stfs	%f0, 0(%r2)	# float
	addi	%r2, %r0, 1	# li
	blr
beq_else.9505:
	addi	%r2, %r0, 0	# li
	blr
solver_rect.3180:
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
	bl	solver_rect_surface.3171
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9509
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
	bl	solver_rect_surface.3171
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9510
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
	bl	solver_rect_surface.3171
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9511
	addi	%r2, %r0, 0	# li
	blr
beq_else.9511:
	addi	%r2, %r0, 3	# li
	blr
beq_else.9510:
	addi	%r2, %r0, 2	# li
	blr
beq_else.9509:
	addi	%r2, %r0, 1	# li
	blr
solver_surface.3186:
	stfs	%f2, 0(%r3)	# float
	stfs	%f1, 8(%r3)	# float
	stfs	%f0, 16(%r3)	# float
	stw	%r5, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_param_abc.3093
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	stw	%r5, 28(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	veciprod.3052
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fispos.2978
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9512
	addi	%r2, %r0, 0	# li
	blr
beq_else.9512:
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
	bl	veciprod2.3055
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fneg.2982
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r2, 40(%r3)
	stfs	%f0, 0(%r2)	# float
	addi	%r2, %r0, 1	# li
	blr
quadratic.3192:
	stfs	%f0, 0(%r3)	# float
	stfs	%f2, 8(%r3)	# float
	stfs	%f1, 16(%r3)	# float
	stw	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fsqr.2993
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	o_param_a.3087
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
	bl	fsqr.2993
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	stfs	%f0, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_param_b.3089
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
	bl	fsqr.2993
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	stfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	o_param_c.3091
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
	bl	o_isrot.3085
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9514
	lfs	%f0, 72(%r3)	# float
	blr
beq_else.9514:
	lfs	%f0, 8(%r3)	# float
	lfs	%f1, 16(%r3)	# float
	fmul	%f2, %f1, %f0
	lwz	%r2, 24(%r3)
	stfs	%f2, 80(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	o_param_r1.3111
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
	bl	o_param_r2.3113
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
	bl	o_param_r3.3115
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 112(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 104(%r3)	# float
	fadd	%f0, %f1, %f0
	blr
bilinear.3197:
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
	bl	o_param_a.3087
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
	bl	o_param_b.3089
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
	bl	o_param_c.3091
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
	bl	o_isrot.3085
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9516
	lfs	%f0, 96(%r3)	# float
	blr
beq_else.9516:
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
	bl	o_param_r1.3111
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
	bl	o_param_r2.3113
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
	bl	o_param_r3.3115
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
	bl	fhalf.2991
	addi	%r3, %r3, -152	# subi
	lwz	%r31, 148(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 96(%r3)	# float
	fadd	%f0, %f1, %f0
	blr
solver_second.3205:
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
	bl	quadratic.3192
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	fiszero.2976
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9518
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
	bl	bilinear.3197
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
	bl	quadratic.3192
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 32(%r3)
	stfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	o_form.3079
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 3
	bne	%cr7, beq_else.9519
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 56(%r3)	# float
	fsub	%f0, %f1, %f0
	b	beq_cont.9520
beq_else.9519:
	lfs	%f0, 56(%r3)	# float
beq_cont.9520:
	lfs	%f1, 48(%r3)	# float
	stfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fsqr.2993
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
	bl	fispos.2978
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9521
	addi	%r2, %r0, 0	# li
	blr
beq_else.9521:
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
	bl	o_isinvert.3083
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9522
	lfs	%f0, 80(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	fneg.2982
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	b	beq_cont.9523
beq_else.9522:
	lfs	%f0, 80(%r3)	# float
beq_cont.9523:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f1, 48(%r3)	# float
	fsub	%f0, %f0, %f1
	lfs	%f1, 40(%r3)	# float
	fdiv	%f0, %f0, %f1
	stfs	%f0, 0(%r2)	# float
	addi	%r2, %r0, 1	# li
	blr
beq_else.9518:
	addi	%r2, %r0, 0	# li
	blr
solver.3211:
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
	bl	o_param_x.3095
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
	bl	o_param_y.3097
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
	bl	o_param_z.3099
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
	bl	o_form.3079
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.9524
	lfs	%f0, 24(%r3)	# float
	lfs	%f1, 40(%r3)	# float
	lfs	%f2, 56(%r3)	# float
	lwz	%r2, 8(%r3)
	lwz	%r5, 4(%r3)
	b	solver_rect.3180
beq_else.9524:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9525
	lfs	%f0, 24(%r3)	# float
	lfs	%f1, 40(%r3)	# float
	lfs	%f2, 56(%r3)	# float
	lwz	%r2, 8(%r3)
	lwz	%r5, 4(%r3)
	b	solver_surface.3186
beq_else.9525:
	lfs	%f0, 24(%r3)	# float
	lfs	%f1, 40(%r3)	# float
	lfs	%f2, 56(%r3)	# float
	lwz	%r2, 8(%r3)
	lwz	%r5, 4(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
solver_rect_fast.3215:
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
	bl	fabs.2986
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 44(%r3)
	stfs	%f0, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_param_b.3089
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	fless.2988
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9527
	addi	%r2, %r0, 0	# li
	b	beq_cont.9528
beq_else.9527:
	lwz	%r2, 40(%r3)
	lfs	%f0, 16(%r2)	# float
	lfs	%f1, 32(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f2, 24(%r3)	# float
	fadd	%f0, %f0, %f2
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	fabs.2986
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 44(%r3)
	stfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	o_param_c.3091
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fless.2988
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9529
	addi	%r2, %r0, 0	# li
	b	beq_cont.9530
beq_else.9529:
	lwz	%r2, 16(%r3)
	lfs	%f0, 8(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fiszero.2976
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9531
	addi	%r2, %r0, 1	# li
	b	beq_cont.9532
beq_else.9531:
	addi	%r2, %r0, 0	# li
beq_cont.9532:
beq_cont.9530:
beq_cont.9528:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9533
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
	bl	fabs.2986
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 44(%r3)
	stfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_param_a.3087
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	fless.2988
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9534
	addi	%r2, %r0, 0	# li
	b	beq_cont.9535
beq_else.9534:
	lwz	%r2, 40(%r3)
	lfs	%f0, 16(%r2)	# float
	lfs	%f1, 64(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f2, 24(%r3)	# float
	fadd	%f0, %f0, %f2
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	fabs.2986
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 44(%r3)
	stfs	%f0, 80(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	o_param_c.3091
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 80(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	fless.2988
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9536
	addi	%r2, %r0, 0	# li
	b	beq_cont.9537
beq_else.9536:
	lwz	%r2, 16(%r3)
	lfs	%f0, 24(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	fiszero.2976
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9538
	addi	%r2, %r0, 1	# li
	b	beq_cont.9539
beq_else.9538:
	addi	%r2, %r0, 0	# li
beq_cont.9539:
beq_cont.9537:
beq_cont.9535:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9540
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
	bl	fabs.2986
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 44(%r3)
	stfs	%f0, 96(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	o_param_a.3087
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 96(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	fless.2988
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9541
	addi	%r2, %r0, 0	# li
	b	beq_cont.9542
beq_else.9541:
	lwz	%r2, 40(%r3)
	lfs	%f0, 8(%r2)	# float
	lfs	%f1, 88(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f2, 8(%r3)	# float
	fadd	%f0, %f0, %f2
	mfspr	%r31, 8	# mflr
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	fabs.2986
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 44(%r3)
	stfs	%f0, 104(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	o_param_b.3089
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 104(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	fless.2988
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9543
	addi	%r2, %r0, 0	# li
	b	beq_cont.9544
beq_else.9543:
	lwz	%r2, 16(%r3)
	lfs	%f0, 40(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	fiszero.2976
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9545
	addi	%r2, %r0, 1	# li
	b	beq_cont.9546
beq_else.9545:
	addi	%r2, %r0, 0	# li
beq_cont.9546:
beq_cont.9544:
beq_cont.9542:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9547
	addi	%r2, %r0, 0	# li
	blr
beq_else.9547:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 88(%r3)	# float
	stfs	%f0, 0(%r2)	# float
	addi	%r2, %r0, 3	# li
	blr
beq_else.9540:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 64(%r3)	# float
	stfs	%f0, 0(%r2)	# float
	addi	%r2, %r0, 2	# li
	blr
beq_else.9533:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 32(%r3)	# float
	stfs	%f0, 0(%r2)	# float
	addi	%r2, %r0, 1	# li
	blr
solver_surface_fast.3222:
	lfs	%f3, 0(%r5)	# float
	stfs	%f2, 0(%r3)	# float
	stfs	%f1, 8(%r3)	# float
	stfs	%f0, 16(%r3)	# float
	stw	%r5, 24(%r3)
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f3
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fisneg.2980
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9548
	addi	%r2, %r0, 0	# li
	blr
beq_else.9548:
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
solver_second_fast.3228:
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
	bl	fiszero.2976
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9551
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
	bl	quadratic.3192
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 16(%r3)
	stfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	o_form.3079
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 3
	bne	%cr7, beq_else.9553
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 64(%r3)	# float
	fsub	%f0, %f1, %f0
	b	beq_cont.9554
beq_else.9553:
	lfs	%f0, 64(%r3)	# float
beq_cont.9554:
	lfs	%f1, 56(%r3)	# float
	stfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	fsqr.2993
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
	bl	fispos.2978
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9555
	addi	%r2, %r0, 0	# li
	blr
beq_else.9555:
	lwz	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	o_isinvert.3083
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9556
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
	b	beq_cont.9557
beq_else.9556:
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
beq_cont.9557:
	addi	%r2, %r0, 1	# li
	blr
beq_else.9551:
	addi	%r2, %r0, 0	# li
	blr
solver_fast.3234:
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
	bl	o_param_x.3095
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
	bl	o_param_y.3097
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
	bl	o_param_z.3099
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
	bl	d_const.3140
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
	bl	o_form.3079
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.9559
	lwz	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	d_vec.3138
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lfs	%f0, 32(%r3)	# float
	lfs	%f1, 48(%r3)	# float
	lfs	%f2, 64(%r3)	# float
	lwz	%r2, 12(%r3)
	lwz	%r6, 72(%r3)
	b	solver_rect_fast.3215
beq_else.9559:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9560
	lfs	%f0, 32(%r3)	# float
	lfs	%f1, 48(%r3)	# float
	lfs	%f2, 64(%r3)	# float
	lwz	%r2, 12(%r3)
	lwz	%r5, 72(%r3)
	b	solver_surface_fast.3222
beq_else.9560:
	lfs	%f0, 32(%r3)	# float
	lfs	%f1, 48(%r3)	# float
	lfs	%f2, 64(%r3)	# float
	lwz	%r2, 12(%r3)
	lwz	%r5, 72(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
solver_surface_fast2.3238:
	lfs	%f0, 0(%r5)	# float
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fisneg.2980
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9561
	addi	%r2, %r0, 0	# li
	blr
beq_else.9561:
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
solver_second_fast2.3245:
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
	bl	fiszero.2976
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9563
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
	bl	fsqr.2993
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
	bl	fispos.2978
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9565
	addi	%r2, %r0, 0	# li
	blr
beq_else.9565:
	lwz	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_isinvert.3083
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9566
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
	b	beq_cont.9567
beq_else.9566:
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
beq_cont.9567:
	addi	%r2, %r0, 1	# li
	blr
beq_else.9563:
	addi	%r2, %r0, 0	# li
	blr
solver_fast2.3252:
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
	bl	o_param_ctbl.3117
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
	bl	d_const.3140
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
	bl	o_form.3079
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.9569
	lwz	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	d_vec.3138
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lfs	%f0, 40(%r3)	# float
	lfs	%f1, 32(%r3)	# float
	lfs	%f2, 24(%r3)	# float
	lwz	%r2, 4(%r3)
	lwz	%r6, 48(%r3)
	b	solver_rect_fast.3215
beq_else.9569:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9570
	lfs	%f0, 40(%r3)	# float
	lfs	%f1, 32(%r3)	# float
	lfs	%f2, 24(%r3)	# float
	lwz	%r2, 4(%r3)
	lwz	%r5, 48(%r3)
	lwz	%r6, 16(%r3)
	b	solver_surface_fast2.3238
beq_else.9570:
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
setup_rect_table.3255:
	addi	%r6, %r0, 6	# li
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
	bl	fiszero.2976
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9571
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_isinvert.3083
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	lfs	%f0, 0(%r5)	# float
	stw	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	fisneg.2980
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
	bl	o_param_a.3087
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	fneg_cond.3025
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	stfs	%f0, 0(%r2)	# float
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r5, 4(%r3)
	lfs	%f1, 0(%r5)	# float
	fdiv	%f0, %f0, %f1
	stfs	%f0, 8(%r2)	# float
	b	beq_cont.9572
beq_else.9571:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r2, 8(%r3)
	stfs	%f0, 8(%r2)	# float
beq_cont.9572:
	lwz	%r5, 4(%r3)
	lfs	%f0, 8(%r5)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	fiszero.2976
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9573
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_isinvert.3083
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	lfs	%f0, 8(%r5)	# float
	stw	%r2, 20(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fisneg.2980
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
	bl	o_param_b.3089
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fneg_cond.3025
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	stfs	%f0, 16(%r2)	# float
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r5, 4(%r3)
	lfs	%f1, 8(%r5)	# float
	fdiv	%f0, %f0, %f1
	stfs	%f0, 24(%r2)	# float
	b	beq_cont.9574
beq_else.9573:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r2, 8(%r3)
	stfs	%f0, 24(%r2)	# float
beq_cont.9574:
	lwz	%r5, 4(%r3)
	lfs	%f0, 16(%r5)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fiszero.2976
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9575
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_isinvert.3083
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	lfs	%f0, 16(%r5)	# float
	stw	%r2, 28(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fisneg.2980
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
	bl	o_param_c.3091
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 32(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fneg_cond.3025
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	stfs	%f0, 32(%r2)	# float
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r5, 4(%r3)
	lfs	%f1, 16(%r5)	# float
	fdiv	%f0, %f0, %f1
	stfs	%f0, 40(%r2)	# float
	b	beq_cont.9576
beq_else.9575:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r2, 8(%r3)
	stfs	%f0, 40(%r2)	# float
beq_cont.9576:
	blr
setup_surface_table.3258:
	addi	%r6, %r0, 4	# li
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
	bl	o_param_a.3087
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
	bl	o_param_b.3089
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
	bl	o_param_c.3091
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
	bl	fispos.2978
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9578
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r2, 8(%r3)
	stfs	%f0, 0(%r2)	# float
	b	beq_cont.9579
beq_else.9578:
	addis	%r31, %r0, (l.7141)@h	# lis
	ori	%r31, %r31, (l.7141)@l
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
	bl	o_param_a.3087
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fdiv	%f0, %f0, %f1
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fneg.2982
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
	bl	o_param_b.3089
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fdiv	%f0, %f0, %f1
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fneg.2982
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
	bl	o_param_c.3091
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fdiv	%f0, %f0, %f1
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fneg.2982
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	stfs	%f0, 24(%r2)	# float
beq_cont.9579:
	blr
setup_second_table.3261:
	addi	%r6, %r0, 5	# li
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
	bl	quadratic.3192
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
	bl	o_param_a.3087
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fmul	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fneg.2982
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
	bl	o_param_b.3089
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 40(%r3)	# float
	fmul	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	fneg.2982
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
	bl	o_param_c.3091
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fmul	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fneg.2982
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
	bl	o_isrot.3085
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9581
	lwz	%r2, 8(%r3)
	lfs	%f0, 32(%r3)	# float
	stfs	%f0, 8(%r2)	# float
	lfs	%f0, 48(%r3)	# float
	stfs	%f0, 16(%r2)	# float
	lfs	%f0, 64(%r3)	# float
	stfs	%f0, 24(%r2)	# float
	b	beq_cont.9582
beq_else.9581:
	lwz	%r2, 4(%r3)
	lfs	%f0, 16(%r2)	# float
	lwz	%r5, 0(%r3)
	stfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_param_r2.3113
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
	bl	o_param_r3.3115
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
	bl	fhalf.2991
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
	bl	o_param_r1.3111
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
	bl	o_param_r3.3115
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
	bl	fhalf.2991
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
	bl	o_param_r1.3111
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
	bl	o_param_r2.3113
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
	bl	fhalf.2991
	addi	%r3, %r3, -152	# subi
	lwz	%r31, 148(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 64(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 8(%r3)
	stfs	%f0, 24(%r2)	# float
beq_cont.9582:
	lfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 148(%r3)
	addi	%r3, %r3, 152
	bl	fiszero.2976
	addi	%r3, %r3, -152	# subi
	lwz	%r31, 148(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9583
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 16(%r3)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r2, 8(%r3)
	stfs	%f0, 32(%r2)	# float
	b	beq_cont.9584
beq_else.9583:
beq_cont.9584:
	lwz	%r2, 8(%r3)
	blr
iter_setup_dirvec_constants.3264:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.9585
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
	bl	d_const.3140
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 8(%r3)
	stw	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	d_vec.3138
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 4(%r3)
	stw	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_form.3079
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.9586
	lwz	%r2, 16(%r3)
	lwz	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	setup_rect_table.3255
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 12(%r3)
	stwx	%r2, %r7, %r6
	b	beq_cont.9587
beq_else.9586:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9588
	lwz	%r2, 16(%r3)
	lwz	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	setup_surface_table.3258
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 12(%r3)
	stwx	%r2, %r7, %r6
	b	beq_cont.9589
beq_else.9588:
	lwz	%r2, 16(%r3)
	lwz	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	setup_second_table.3261
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 12(%r3)
	stwx	%r2, %r7, %r6
beq_cont.9589:
beq_cont.9587:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 8(%r3)
	b	iter_setup_dirvec_constants.3264
bge_else.9585:
	blr
setup_dirvec_constants.3267:
	addis	%r5, %r0, (min_caml_n_objects)@h	# lis
	ori	%r5, %r5, (min_caml_n_objects)@l
	lwz	%r5, 0(%r5)
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	b	iter_setup_dirvec_constants.3264
setup_startp_constants.3269:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.9591
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
	bl	o_param_ctbl.3117
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 8(%r3)
	stw	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_form.3079
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
	bl	o_param_x.3095
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
	bl	o_param_y.3097
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
	bl	o_param_z.3099
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 40(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 12(%r3)
	stfs	%f0, 16(%r2)	# float
	lwz	%r5, 16(%r3)
	cmpwi	%cr7, %r5, 2
	bne	%cr7, beq_else.9593
	lwz	%r5, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_param_abc.3093
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
	bl	veciprod2.3055
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	stfs	%f0, 24(%r2)	# float
	b	beq_cont.9594
beq_else.9593:
	cmpwi	%cr7, %r5, 2	
	bgt	%cr7, ble_else.9595
	b	ble_cont.9596
ble_else.9595:
	lfs	%f0, 0(%r2)	# float
	lfs	%f1, 8(%r2)	# float
	lfs	%f2, 16(%r2)	# float
	lwz	%r6, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	quadratic.3192
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 16(%r3)
	cmpwi	%cr7, %r2, 3
	bne	%cr7, beq_else.9597
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	beq_cont.9598
beq_else.9597:
beq_cont.9598:
	lwz	%r2, 12(%r3)
	stfs	%f0, 24(%r2)	# float
ble_cont.9596:
beq_cont.9594:
	lwz	%r2, 0(%r3)
	addi	%r5, %r2, -1	# subi %r5, %r2, 1
	lwz	%r2, 4(%r3)
	b	setup_startp_constants.3269
bge_else.9591:
	blr
setup_startp.3272:
	addis	%r5, %r0, (min_caml_startp_fast)@h	# lis
	ori	%r5, %r5, (min_caml_startp_fast)@l
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r28, %r5	# mr %r28, %r5
	or	%r2, %r5, %r2	# mr %r5, %r2
	or	%r28, %r2, %r28	# mr %r2, %r28
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	veccpy.3041
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_n_objects)@h	# lis
	ori	%r2, %r2, (min_caml_n_objects)@l
	lwz	%r2, 0(%r2)
	addi	%r5, %r2, -1	# subi %r5, %r2, 1
	lwz	%r2, 0(%r3)
	b	setup_startp_constants.3269
is_rect_outside.3274:
	stfs	%f2, 0(%r3)	# float
	stfs	%f1, 8(%r3)	# float
	stw	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	fabs.2986
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 16(%r3)
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_a.3087
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fless.2988
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9601
	addi	%r2, %r0, 0	# li
	b	beq_cont.9602
beq_else.9601:
	lfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fabs.2986
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 16(%r3)
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	o_param_b.3089
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fless.2988
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9603
	addi	%r2, %r0, 0	# li
	b	beq_cont.9604
beq_else.9603:
	lfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fabs.2986
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 16(%r3)
	stfs	%f0, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_param_c.3091
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	fless.2988
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9604:
beq_cont.9602:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9605
	lwz	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_isinvert.3083
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9606
	addi	%r2, %r0, 1	# li
	blr
beq_else.9606:
	addi	%r2, %r0, 0	# li
	blr
beq_else.9605:
	lwz	%r2, 16(%r3)
	b	o_isinvert.3083
is_plane_outside.3279:
	stw	%r2, 0(%r3)
	stfs	%f2, 8(%r3)	# float
	stfs	%f1, 16(%r3)	# float
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_abc.3093
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 24(%r3)	# float
	lfs	%f1, 16(%r3)	# float
	lfs	%f2, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	veciprod2.3055
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	o_isinvert.3083
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 32(%r3)	# float
	stw	%r2, 40(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fisneg.2980
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 40(%r3)
	xor	%r5, %r2, %r2
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9608
	addi	%r2, %r0, 1	# li
	blr
beq_else.9608:
	addi	%r2, %r0, 0	# li
	blr
is_second_outside.3284:
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	quadratic.3192
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	stfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_form.3079
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 3
	bne	%cr7, beq_else.9610
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	b	beq_cont.9611
beq_else.9610:
	lfs	%f0, 8(%r3)	# float
beq_cont.9611:
	lwz	%r2, 0(%r3)
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_isinvert.3083
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 16(%r3)	# float
	stw	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fisneg.2980
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 24(%r3)
	xor	%r5, %r2, %r2
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9612
	addi	%r2, %r0, 1	# li
	blr
beq_else.9612:
	addi	%r2, %r0, 0	# li
	blr
is_outside.3289:
	stfs	%f2, 0(%r3)	# float
	stfs	%f1, 8(%r3)	# float
	stw	%r2, 16(%r3)
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_x.3095
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
	bl	o_param_y.3097
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
	bl	o_param_z.3099
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
	bl	o_form.3079
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.9614
	lfs	%f0, 32(%r3)	# float
	lfs	%f1, 40(%r3)	# float
	lfs	%f2, 48(%r3)	# float
	lwz	%r2, 16(%r3)
	b	is_rect_outside.3274
beq_else.9614:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9615
	lfs	%f0, 32(%r3)	# float
	lfs	%f1, 40(%r3)	# float
	lfs	%f2, 48(%r3)	# float
	lwz	%r2, 16(%r3)
	b	is_plane_outside.3279
beq_else.9615:
	lfs	%f0, 32(%r3)	# float
	lfs	%f1, 40(%r3)	# float
	lfs	%f2, 48(%r3)	# float
	lwz	%r2, 16(%r3)
	b	is_second_outside.3284
check_all_inside.3294:
	addi	%r1, %r0, 2	# li
	slw	%r2, %r6, %r1 # swap
	lwzx	%r6, %r5, %r6
	cmpwi	%cr7, %r6, -1
	bne	%cr7, beq_else.9616
	addi	%r2, %r0, 1	# li
	blr
beq_else.9616:
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
	bl	is_outside.3289
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9617
	lwz	%r2, 28(%r3)
	addi	%r2, %r2, 1
	lfs	%f0, 16(%r3)	# float
	lfs	%f1, 8(%r3)	# float
	lfs	%f2, 0(%r3)	# float
	lwz	%r5, 24(%r3)
	b	check_all_inside.3294
beq_else.9617:
	addi	%r2, %r0, 0	# li
	blr
shadow_check_and_group.3300:
	lwz	%r6, 4(%r29)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r7, %r1 # swap
	lwzx	%r7, %r5, %r7
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.9618
	addi	%r2, %r0, 0	# li
	blr
beq_else.9618:
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
	bne	%cr7, beq_else.9619
	addi	%r2, %r0, 0	# li
	b	beq_cont.9620
beq_else.9619:
	addis	%r31, %r0, (l.7454)@h	# lis
	ori	%r31, %r31, (l.7454)@l
	lfs	%f1, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fless.2988
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9620:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9621
	addis	%r2, %r0, (min_caml_objects)@h	# lis
	ori	%r2, %r2, (min_caml_objects)@l
	lwz	%r5, 12(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwzx	%r2, %r2, %r5
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_isinvert.3083
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9622
	addi	%r2, %r0, 0	# li
	blr
beq_else.9622:
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 0(%r3)
	lwz	%r29, 4(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.9621:
	addis	%r31, %r0, (l.7455)@h	# lis
	ori	%r31, %r31, (l.7455)@l
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
	bl	check_all_inside.3294
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9623
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 0(%r3)
	lwz	%r29, 4(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.9623:
	addi	%r2, %r0, 1	# li
	blr
shadow_check_one_or_group.3303:
	lwz	%r6, 4(%r29)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r7, %r1 # swap
	lwzx	%r7, %r5, %r7
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.9624
	addi	%r2, %r0, 0	# li
	blr
beq_else.9624:
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
	bne	%cr7, beq_else.9625
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 0(%r3)
	lwz	%r29, 4(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.9625:
	addi	%r2, %r0, 1	# li
	blr
shadow_check_one_or_matrix.3306:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r8, %r1 # swap
	lwzx	%r8, %r5, %r8
	lwz	%r9, 0(%r8)
	cmpwi	%cr7, %r9, -1
	bne	%cr7, beq_else.9626
	addi	%r2, %r0, 0	# li
	blr
beq_else.9626:
	stw	%r8, 0(%r3)
	stw	%r7, 4(%r3)
	stw	%r5, 8(%r3)
	stw	%r29, 12(%r3)
	stw	%r2, 16(%r3)
	cmpwi	%cr7, %r9, 99
	bne	%cr7, beq_else.9627
	addi	%r2, %r0, 1	# li
	b	beq_cont.9628
beq_else.9627:
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
	bne	%cr7, beq_else.9629
	addi	%r2, %r0, 0	# li
	b	beq_cont.9630
beq_else.9629:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 0(%r2)	# float
	addis	%r31, %r0, (l.7468)@h	# lis
	ori	%r31, %r31, (l.7468)@l
	lfs	%f1, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	fless.2988
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9631
	addi	%r2, %r0, 0	# li
	b	beq_cont.9632
beq_else.9631:
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
	addi	%r2, %r0, 0	# li
	b	beq_cont.9634
beq_else.9633:
	addi	%r2, %r0, 1	# li
beq_cont.9634:
beq_cont.9632:
beq_cont.9630:
beq_cont.9628:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9635
	lwz	%r2, 16(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 8(%r3)
	lwz	%r29, 12(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.9635:
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
	bne	%cr7, beq_else.9636
	lwz	%r2, 16(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 8(%r3)
	lwz	%r29, 12(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.9636:
	addi	%r2, %r0, 1	# li
	blr
solve_each_element.3309:
	lwz	%r7, 4(%r29)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r8, %r1 # swap
	lwzx	%r8, %r5, %r8
	cmpwi	%cr7, %r8, -1
	bne	%cr7, beq_else.9637
	blr
beq_else.9637:
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
	bne	%cr7, beq_else.9639
	addis	%r2, %r0, (min_caml_objects)@h	# lis
	ori	%r2, %r2, (min_caml_objects)@l
	lwz	%r5, 16(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwzx	%r2, %r2, %r5
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_isinvert.3083
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9640
	blr
beq_else.9640:
	lwz	%r2, 12(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 8(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.9639:
	addis	%r5, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r5, %r5, (min_caml_solver_dist)@l
	lfs	%f1, 0(%r5)	# float
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 20(%r3)
	stfs	%f1, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fless.2988
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9642
	b	beq_cont.9643
beq_else.9642:
	addis	%r2, %r0, (min_caml_tmin)@h	# lis
	ori	%r2, %r2, (min_caml_tmin)@l
	lfs	%f1, 0(%r2)	# float
	lfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fless.2988
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9644
	b	beq_cont.9645
beq_else.9644:
	addis	%r31, %r0, (l.7455)@h	# lis
	ori	%r31, %r31, (l.7455)@l
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
	bl	check_all_inside.3294
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9646
	b	beq_cont.9647
beq_else.9646:
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
	bl	vecset.3031
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
beq_cont.9647:
beq_cont.9645:
beq_cont.9643:
	lwz	%r2, 12(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 8(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
solve_one_or_network.3313:
	lwz	%r7, 4(%r29)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r8, %r1 # swap
	lwzx	%r8, %r5, %r8
	cmpwi	%cr7, %r8, -1
	bne	%cr7, beq_else.9648
	blr
beq_else.9648:
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
trace_or_matrix.3317:
	lwz	%r7, 8(%r29)
	lwz	%r8, 4(%r29)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r9, %r1 # swap
	lwzx	%r9, %r5, %r9
	lwz	%r10, 0(%r9)
	cmpwi	%cr7, %r10, -1
	bne	%cr7, beq_else.9650
	blr
beq_else.9650:
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r29, 8(%r3)
	stw	%r2, 12(%r3)
	cmpwi	%cr7, %r10, 99
	bne	%cr7, beq_else.9652
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
	b	beq_cont.9653
beq_else.9652:
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
	bne	%cr7, beq_else.9654
	b	beq_cont.9655
beq_else.9654:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_tmin)@h	# lis
	ori	%r2, %r2, (min_caml_tmin)@l
	lfs	%f1, 0(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fless.2988
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9656
	b	beq_cont.9657
beq_else.9656:
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
beq_cont.9657:
beq_cont.9655:
beq_cont.9653:
	lwz	%r2, 12(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 8(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
judge_intersection.3321:
	lwz	%r29, 4(%r29)
	addis	%r5, %r0, (min_caml_tmin)@h	# lis
	ori	%r5, %r5, (min_caml_tmin)@l
	addis	%r31, %r0, (l.7488)@h	# lis
	ori	%r31, %r31, (l.7488)@l
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
	addis	%r31, %r0, (l.7468)@h	# lis
	ori	%r31, %r31, (l.7468)@l
	lfs	%f0, 0(%r31)	# float
	stfs	%f1, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fless.2988
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9658
	addi	%r2, %r0, 0	# li
	blr
beq_else.9658:
	addis	%r31, %r0, (l.7492)@h	# lis
	ori	%r31, %r31, (l.7492)@l
	lfs	%f1, 0(%r31)	# float
	lfs	%f0, 0(%r3)	# float
	b	fless.2988
solve_each_element_fast.3323:
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
	bl	d_vec.3138
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 16(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 12(%r3)
	lwzx	%r6, %r7, %r6
	cmpwi	%cr7, %r6, -1
	bne	%cr7, beq_else.9659
	blr
beq_else.9659:
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
	bne	%cr7, beq_else.9661
	addis	%r2, %r0, (min_caml_objects)@h	# lis
	ori	%r2, %r2, (min_caml_objects)@l
	lwz	%r5, 24(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwzx	%r2, %r2, %r5
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_isinvert.3083
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9662
	blr
beq_else.9662:
	lwz	%r2, 16(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 12(%r3)
	lwz	%r6, 4(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.9661:
	addis	%r5, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r5, %r5, (min_caml_solver_dist)@l
	lfs	%f1, 0(%r5)	# float
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 28(%r3)
	stfs	%f1, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fless.2988
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9664
	b	beq_cont.9665
beq_else.9664:
	addis	%r2, %r0, (min_caml_tmin)@h	# lis
	ori	%r2, %r2, (min_caml_tmin)@l
	lfs	%f1, 0(%r2)	# float
	lfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fless.2988
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9666
	b	beq_cont.9667
beq_else.9666:
	addis	%r31, %r0, (l.7455)@h	# lis
	ori	%r31, %r31, (l.7455)@l
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
	bl	check_all_inside.3294
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9668
	b	beq_cont.9669
beq_else.9668:
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
	bl	vecset.3031
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
beq_cont.9669:
beq_cont.9667:
beq_cont.9665:
	lwz	%r2, 16(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 12(%r3)
	lwz	%r6, 4(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
solve_one_or_network_fast.3327:
	lwz	%r7, 4(%r29)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r8, %r1 # swap
	lwzx	%r8, %r5, %r8
	cmpwi	%cr7, %r8, -1
	bne	%cr7, beq_else.9670
	blr
beq_else.9670:
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
trace_or_matrix_fast.3331:
	lwz	%r7, 8(%r29)
	lwz	%r8, 4(%r29)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r9, %r1 # swap
	lwzx	%r9, %r5, %r9
	lwz	%r10, 0(%r9)
	cmpwi	%cr7, %r10, -1
	bne	%cr7, beq_else.9672
	blr
beq_else.9672:
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r29, 8(%r3)
	stw	%r2, 12(%r3)
	cmpwi	%cr7, %r10, 99
	bne	%cr7, beq_else.9674
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
	b	beq_cont.9675
beq_else.9674:
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
	bne	%cr7, beq_else.9676
	b	beq_cont.9677
beq_else.9676:
	addis	%r2, %r0, (min_caml_solver_dist)@h	# lis
	ori	%r2, %r2, (min_caml_solver_dist)@l
	lfs	%f0, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_tmin)@h	# lis
	ori	%r2, %r2, (min_caml_tmin)@l
	lfs	%f1, 0(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fless.2988
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9678
	b	beq_cont.9679
beq_else.9678:
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
beq_cont.9679:
beq_cont.9677:
beq_cont.9675:
	lwz	%r2, 12(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 8(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
judge_intersection_fast.3335:
	lwz	%r29, 4(%r29)
	addis	%r5, %r0, (min_caml_tmin)@h	# lis
	ori	%r5, %r5, (min_caml_tmin)@l
	addis	%r31, %r0, (l.7488)@h	# lis
	ori	%r31, %r31, (l.7488)@l
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
	addis	%r31, %r0, (l.7468)@h	# lis
	ori	%r31, %r31, (l.7468)@l
	lfs	%f0, 0(%r31)	# float
	stfs	%f1, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fless.2988
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9680
	addi	%r2, %r0, 0	# li
	blr
beq_else.9680:
	addis	%r31, %r0, (l.7492)@h	# lis
	ori	%r31, %r31, (l.7492)@l
	lfs	%f1, 0(%r31)	# float
	lfs	%f0, 0(%r3)	# float
	b	fless.2988
get_nvector_rect.3337:
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
	bl	vecbzero.3039
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
	bl	sgn.3023
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	fneg.2982
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	addi	%r1, %r0, 3	# li
	slw	%r2, %r2, %r1 # swap
	lwz	%r5, 8(%r3)
	stfdx	%f0, %r5, %r2
	blr
get_nvector_plane.3339:
	addis	%r5, %r0, (min_caml_nvector)@h	# lis
	ori	%r5, %r5, (min_caml_nvector)@l
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_param_a.3087
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fneg.2982
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
	bl	o_param_b.3089
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fneg.2982
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
	bl	o_param_c.3091
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	fneg.2982
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	stfs	%f0, 16(%r2)	# float
	blr
get_nvector_second.3341:
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
	bl	o_param_x.3095
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
	bl	o_param_y.3097
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
	bl	o_param_z.3099
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
	bl	o_param_a.3087
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
	bl	o_param_b.3089
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
	bl	o_param_c.3091
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
	bl	o_isrot.3085
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9683
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
	b	beq_cont.9684
beq_else.9683:
	addis	%r2, %r0, (min_caml_nvector)@h	# lis
	ori	%r2, %r2, (min_caml_nvector)@l
	lwz	%r5, 4(%r3)
	stw	%r2, 80(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_param_r3.3115
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
	bl	o_param_r2.3113
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
	bl	fhalf.2991
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
	bl	o_param_r3.3115
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
	bl	o_param_r1.3111
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
	bl	fhalf.2991
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
	bl	o_param_r2.3113
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
	bl	o_param_r1.3111
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
	bl	fhalf.2991
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 72(%r3)	# float
	fadd	%f0, %f1, %f0
	lwz	%r2, 112(%r3)
	stfs	%f0, 16(%r2)	# float
beq_cont.9684:
	addis	%r2, %r0, (min_caml_nvector)@h	# lis
	ori	%r2, %r2, (min_caml_nvector)@l
	lwz	%r5, 4(%r3)
	stw	%r2, 128(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	o_isinvert.3083
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 128(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
get_nvector.3343:
	lwz	%r6, 4(%r29)
	stw	%r6, 0(%r3)
	stw	%r2, 4(%r3)
	stw	%r5, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_form.3079
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.9688
	lwz	%r2, 8(%r3)
	b	get_nvector_rect.3337
beq_else.9688:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9689
	lwz	%r2, 4(%r3)
	b	get_nvector_plane.3339
beq_else.9689:
	lwz	%r2, 4(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
utexture.3346:
	lwz	%r6, 4(%r29)
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_texturetype.3077
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
	bl	o_color_red.3105
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
	bl	o_color_green.3107
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
	bl	o_color_blue.3109
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	stfs	%f0, 16(%r2)	# float
	lwz	%r2, 12(%r3)
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.9690
	lwz	%r2, 4(%r3)
	lfs	%f0, 0(%r2)	# float
	lwz	%r5, 8(%r3)
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	o_param_x.3095
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.7553)@h	# lis
	ori	%r31, %r31, (l.7553)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f0, %f1
	stfs	%f0, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	floor.2999
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7554)@h	# lis
	ori	%r31, %r31, (l.7554)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 40(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.7140)@h	# lis
	ori	%r31, %r31, (l.7140)@l
	lfs	%f1, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	fless.2988
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
	bl	o_param_z.3099
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.7553)@h	# lis
	ori	%r31, %r31, (l.7553)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f0, %f1
	stfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	floor.2999
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7554)@h	# lis
	ori	%r31, %r31, (l.7554)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 64(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.7140)@h	# lis
	ori	%r31, %r31, (l.7140)@l
	lfs	%f1, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fless.2988
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, (min_caml_texture_color)@h	# lis
	ori	%r5, %r5, (min_caml_texture_color)@l
	lwz	%r6, 48(%r3)
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.9693
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9695
	addis	%r31, %r0, (l.7541)@h	# lis
	ori	%r31, %r31, (l.7541)@l
	lfs	%f0, 0(%r31)	# float
	b	beq_cont.9696
beq_else.9695:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.9696:
	b	beq_cont.9694
beq_else.9693:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9697
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
	b	beq_cont.9698
beq_else.9697:
	addis	%r31, %r0, (l.7541)@h	# lis
	ori	%r31, %r31, (l.7541)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.9698:
beq_cont.9694:
	stfs	%f0, 8(%r5)	# float
	blr
beq_else.9690:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9700
	lwz	%r2, 4(%r3)
	lfs	%f0, 8(%r2)	# float
	addis	%r31, %r0, (l.7549)@h	# lis
	ori	%r31, %r31, (l.7549)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	sin.2968
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fsqr.2993
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_texture_color)@h	# lis
	ori	%r2, %r2, (min_caml_texture_color)@l
	addis	%r31, %r0, (l.7541)@h	# lis
	ori	%r31, %r31, (l.7541)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f1, %f0
	stfs	%f1, 0(%r2)	# float
	addis	%r2, %r0, (min_caml_texture_color)@h	# lis
	ori	%r2, %r2, (min_caml_texture_color)@l
	addis	%r31, %r0, (l.7541)@h	# lis
	ori	%r31, %r31, (l.7541)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	stfs	%f0, 8(%r2)	# float
	blr
beq_else.9700:
	cmpwi	%cr7, %r2, 3
	bne	%cr7, beq_else.9702
	lwz	%r2, 4(%r3)
	lfs	%f0, 0(%r2)	# float
	lwz	%r5, 8(%r3)
	stfs	%f0, 72(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_param_x.3095
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
	bl	o_param_z.3099
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
	bl	fsqr.2993
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 96(%r3)	# float
	stfs	%f0, 104(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	fsqr.2993
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
	addis	%r31, %r0, (l.7140)@h	# lis
	ori	%r31, %r31, (l.7140)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	stfs	%f0, 112(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	floor.2999
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 112(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.7538)@h	# lis
	ori	%r31, %r31, (l.7538)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	mfspr	%r31, 8	# mflr
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	cos.2970
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	fsqr.2993
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_texture_color)@h	# lis
	ori	%r2, %r2, (min_caml_texture_color)@l
	addis	%r31, %r0, (l.7541)@h	# lis
	ori	%r31, %r31, (l.7541)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f0, %f1
	stfs	%f1, 8(%r2)	# float
	addis	%r2, %r0, (min_caml_texture_color)@h	# lis
	ori	%r2, %r2, (min_caml_texture_color)@l
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.7541)@h	# lis
	ori	%r31, %r31, (l.7541)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	stfs	%f0, 16(%r2)	# float
	blr
beq_else.9702:
	cmpwi	%cr7, %r2, 4
	bne	%cr7, beq_else.9704
	lwz	%r2, 4(%r3)
	lfs	%f0, 0(%r2)	# float
	lwz	%r5, 8(%r3)
	stfs	%f0, 120(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	o_param_x.3095
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
	bl	o_param_a.3087
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
	bl	o_param_z.3099
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
	bl	o_param_c.3091
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
	bl	fsqr.2993
	addi	%r3, %r3, -176	# subi
	lwz	%r31, 172(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 160(%r3)	# float
	stfs	%f0, 168(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 180(%r3)
	addi	%r3, %r3, 184
	bl	fsqr.2993
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
	bl	fabs.2986
	addi	%r3, %r3, -192	# subi
	lwz	%r31, 188(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7535)@h	# lis
	ori	%r31, %r31, (l.7535)@l
	lfs	%f1, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 188(%r3)
	addi	%r3, %r3, 192
	bl	fless.2988
	addi	%r3, %r3, -192	# subi
	lwz	%r31, 188(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9705
	lfs	%f0, 136(%r3)	# float
	lfs	%f1, 160(%r3)	# float
	fdiv	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 188(%r3)
	addi	%r3, %r3, 192
	bl	fabs.2986
	addi	%r3, %r3, -192	# subi
	lwz	%r31, 188(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 188(%r3)
	addi	%r3, %r3, 192
	bl	atan.2974
	addi	%r3, %r3, -192	# subi
	lwz	%r31, 188(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7537)@h	# lis
	ori	%r31, %r31, (l.7537)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.7538)@h	# lis
	ori	%r31, %r31, (l.7538)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	b	beq_cont.9706
beq_else.9705:
	addis	%r31, %r0, (l.7536)@h	# lis
	ori	%r31, %r31, (l.7536)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.9706:
	stfs	%f0, 184(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 196(%r3)
	addi	%r3, %r3, 200
	bl	floor.2999
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
	bl	o_param_y.3097
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
	bl	o_param_b.3089
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
	bl	fabs.2986
	addi	%r3, %r3, -232	# subi
	lwz	%r31, 228(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7535)@h	# lis
	ori	%r31, %r31, (l.7535)@l
	lfs	%f1, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 228(%r3)
	addi	%r3, %r3, 232
	bl	fless.2988
	addi	%r3, %r3, -232	# subi
	lwz	%r31, 228(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9707
	lfs	%f0, 176(%r3)	# float
	lfs	%f1, 216(%r3)	# float
	fdiv	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 228(%r3)
	addi	%r3, %r3, 232
	bl	fabs.2986
	addi	%r3, %r3, -232	# subi
	lwz	%r31, 228(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 228(%r3)
	addi	%r3, %r3, 232
	bl	atan.2974
	addi	%r3, %r3, -232	# subi
	lwz	%r31, 228(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7537)@h	# lis
	ori	%r31, %r31, (l.7537)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.7538)@h	# lis
	ori	%r31, %r31, (l.7538)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	b	beq_cont.9708
beq_else.9707:
	addis	%r31, %r0, (l.7536)@h	# lis
	ori	%r31, %r31, (l.7536)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.9708:
	stfs	%f0, 224(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 236(%r3)
	addi	%r3, %r3, 240
	bl	floor.2999
	addi	%r3, %r3, -240	# subi
	lwz	%r31, 236(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 224(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.7540)@h	# lis
	ori	%r31, %r31, (l.7540)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.7111)@h	# lis
	ori	%r31, %r31, (l.7111)@l
	lfs	%f2, 0(%r31)	# float
	lfs	%f3, 192(%r3)	# float
	fsub	%f2, %f2, %f3
	stfs	%f0, 232(%r3)	# float
	stfs	%f1, 240(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f2
	stw	%r31, 252(%r3)
	addi	%r3, %r3, 256
	bl	fsqr.2993
	addi	%r3, %r3, -256	# subi
	lwz	%r31, 252(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 240(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.7111)@h	# lis
	ori	%r31, %r31, (l.7111)@l
	lfs	%f1, 0(%r31)	# float
	lfs	%f2, 232(%r3)	# float
	fsub	%f1, %f1, %f2
	stfs	%f0, 248(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 260(%r3)
	addi	%r3, %r3, 264
	bl	fsqr.2993
	addi	%r3, %r3, -264	# subi
	lwz	%r31, 260(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 248(%r3)	# float
	fsub	%f0, %f1, %f0
	stfs	%f0, 256(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 268(%r3)
	addi	%r3, %r3, 272
	bl	fisneg.2980
	addi	%r3, %r3, -272	# subi
	lwz	%r31, 268(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9709
	lfs	%f0, 256(%r3)	# float
	b	beq_cont.9710
beq_else.9709:
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.9710:
	addis	%r2, %r0, (min_caml_texture_color)@h	# lis
	ori	%r2, %r2, (min_caml_texture_color)@l
	addis	%r31, %r0, (l.7541)@h	# lis
	ori	%r31, %r31, (l.7541)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f1, %f0
	addis	%r31, %r0, (l.7542)@h	# lis
	ori	%r31, %r31, (l.7542)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	stfs	%f0, 16(%r2)	# float
	blr
beq_else.9704:
	blr
add_light.3349:
	stfs	%f2, 0(%r3)	# float
	stfs	%f1, 8(%r3)	# float
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fispos.2978
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9713
	b	beq_cont.9714
beq_else.9713:
	addis	%r2, %r0, (min_caml_rgb)@h	# lis
	ori	%r2, %r2, (min_caml_rgb)@l
	addis	%r5, %r0, (min_caml_texture_color)@h	# lis
	ori	%r5, %r5, (min_caml_texture_color)@l
	lfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	vecaccum.3060
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9714:
	lfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fispos.2978
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9715
	blr
beq_else.9715:
	lfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fsqr.2993
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fsqr.2993
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
trace_reflections.3353:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9718
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
	bl	r_dvec.3144
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
	bne	%cr7, beq_else.9720
	b	beq_cont.9721
beq_else.9720:
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
	bl	r_surface_id.3142
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 48(%r3)
	cmp	%cr7, %r5, %r2
	bne	%cr7, beq_else.9722
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
	bne	%cr7, beq_else.9724
	addis	%r2, %r0, (min_caml_nvector)@h	# lis
	ori	%r2, %r2, (min_caml_nvector)@l
	lwz	%r5, 44(%r3)
	stw	%r2, 52(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	d_vec.3138
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 52(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	veciprod.3052
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 36(%r3)
	stfs	%f0, 56(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	r_bright.3146
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
	bl	d_vec.3138
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	veciprod.3052
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
	bl	add_light.3349
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	b	beq_cont.9725
beq_else.9724:
beq_cont.9725:
	b	beq_cont.9723
beq_else.9722:
beq_cont.9723:
beq_cont.9721:
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lfs	%f0, 24(%r3)	# float
	lfs	%f1, 8(%r3)	# float
	lwz	%r5, 16(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
bge_else.9718:
	blr
trace_ray.3358:
	lwz	%r7, 20(%r29)
	lwz	%r8, 16(%r29)
	lwz	%r9, 12(%r29)
	lwz	%r10, 8(%r29)
	lwz	%r11, 4(%r29)
	cmpwi	%cr7, %r2, 4
	bgt	%cr7, ble_else.9727
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
	bl	p_surface_ids.3123
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
	bne	%cr7, beq_else.9730
	addi	%r2, %r0, -1	# li
	lwz	%r5, 48(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 60(%r3)
	stwx	%r2, %r7, %r6
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.9731
	blr
beq_else.9731:
	addis	%r5, %r0, (min_caml_light)@h	# lis
	ori	%r5, %r5, (min_caml_light)@l
	lwz	%r2, 52(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	veciprod.3052
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fneg.2982
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fispos.2978
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9733
	blr
beq_else.9733:
	lfs	%f0, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fsqr.2993
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
beq_else.9730:
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
	bl	o_reflectiontype.3081
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 76(%r3)
	stw	%r2, 80(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_diffuse.3101
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
	bl	veccpy.3041
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
	bl	p_intersection_points.3121
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
	bl	veccpy.3041
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	p_calc_diffuse.3125
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 76(%r3)
	stw	%r2, 96(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	o_diffuse.3101
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7111)@h	# lis
	ori	%r31, %r31, (l.7111)@l
	lfs	%f1, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	fless.2988
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9737
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
	bl	p_energy.3127
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
	bl	veccpy.3041
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 48(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r5, %r1 # swap
	lwz	%r6, 100(%r3)
	lwzx	%r5, %r6, %r5
	addis	%r31, %r0, (l.7576)@h	# lis
	ori	%r31, %r31, (l.7576)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 88(%r3)	# float
	fmul	%f0, %f0, %f1
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	vecscale.3070
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	p_nvectors.3136
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
	bl	veccpy.3041
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	b	beq_cont.9738
beq_else.9737:
	addi	%r2, %r0, 0	# li
	lwz	%r5, 48(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwz	%r7, 96(%r3)
	stwx	%r2, %r7, %r6
beq_cont.9738:
	addis	%r31, %r0, (l.7578)@h	# lis
	ori	%r31, %r31, (l.7578)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r5, %r0, (min_caml_nvector)@h	# lis
	ori	%r5, %r5, (min_caml_nvector)@l
	lwz	%r2, 52(%r3)
	stfs	%f0, 104(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	veciprod.3052
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
	bl	vecaccum.3060
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 76(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	o_hilight.3103
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
	bne	%cr7, beq_else.9739
	addis	%r2, %r0, (min_caml_nvector)@h	# lis
	ori	%r2, %r2, (min_caml_nvector)@l
	addis	%r5, %r0, (min_caml_light)@h	# lis
	ori	%r5, %r5, (min_caml_light)@l
	mfspr	%r31, 8	# mflr
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	veciprod.3052
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	fneg.2982
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
	bl	veciprod.3052
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	fneg.2982
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	fmr	%f1, %f0
	mtspr	8, %r31	# mtlr
	lfs	%f0, 120(%r3)	# float
	lfs	%f2, 112(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	add_light.3349
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	b	beq_cont.9740
beq_else.9739:
beq_cont.9740:
	addis	%r2, %r0, (min_caml_intersection_point)@h	# lis
	ori	%r2, %r2, (min_caml_intersection_point)@l
	mfspr	%r31, 8	# mflr
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	setup_startp.3272
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
	addis	%r31, %r0, (l.7139)@h	# lis
	ori	%r31, %r31, (l.7139)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	fless.2988
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9741
	blr
beq_else.9741:
	lwz	%r2, 48(%r3)
	cmpwi	%cr7, %r2, 4
	blt	%cr7, bge_else.9743
	b	bge_cont.9744
bge_else.9743:
	addi	%r5, %r2, 1
	addi	%r6, %r0, -1	# li
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwz	%r7, 60(%r3)
	stwx	%r6, %r7, %r5
bge_cont.9744:
	lwz	%r5, 80(%r3)
	cmpwi	%cr7, %r5, 2
	bne	%cr7, beq_else.9745
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r5, 76(%r3)
	stfs	%f0, 128(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 140(%r3)
	addi	%r3, %r3, 144
	bl	o_diffuse.3101
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
beq_else.9745:
	blr
ble_else.9727:
	blr
trace_diffuse_ray.3364:
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
	bne	%cr7, beq_else.9748
	blr
beq_else.9748:
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
	bl	d_vec.3138
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
	bne	%cr7, beq_else.9750
	addis	%r2, %r0, (min_caml_nvector)@h	# lis
	ori	%r2, %r2, (min_caml_nvector)@l
	addis	%r5, %r0, (min_caml_light)@h	# lis
	ori	%r5, %r5, (min_caml_light)@l
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	veciprod.3052
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fneg.2982
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fispos.2978
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9752
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
	b	beq_cont.9753
beq_else.9752:
	lfs	%f0, 32(%r3)	# float
beq_cont.9753:
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
	bl	o_diffuse.3101
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 48(%r3)	# float
	fmul	%f0, %f1, %f0
	addis	%r5, %r0, (min_caml_texture_color)@h	# lis
	ori	%r5, %r5, (min_caml_texture_color)@l
	lwz	%r2, 40(%r3)
	b	vecaccum.3060
beq_else.9750:
	blr
iter_trace_diffuse_rays.3367:
	lwz	%r8, 4(%r29)
	cmpwi	%cr7, %r7, 0
	blt	%cr7, bge_else.9756
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
	bl	d_vec.3138
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 20(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	veciprod.3052
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fisneg.2980
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9757
	lwz	%r2, 16(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r5, %r1 # swap
	lwz	%r6, 12(%r3)
	lwzx	%r5, %r6, %r5
	addis	%r31, %r0, (l.7598)@h	# lis
	ori	%r31, %r31, (l.7598)@l
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
	b	beq_cont.9758
beq_else.9757:
	lwz	%r2, 16(%r3)
	addi	%r5, %r2, 1
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwz	%r6, 12(%r3)
	lwzx	%r5, %r6, %r5
	addis	%r31, %r0, (l.7596)@h	# lis
	ori	%r31, %r31, (l.7596)@l
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
beq_cont.9758:
	lwz	%r2, 16(%r3)
	addi	%r7, %r2, -2	# subi %r7, %r2, 2
	lwz	%r2, 12(%r3)
	lwz	%r5, 20(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 4(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
bge_else.9756:
	blr
trace_diffuse_rays.3372:
	lwz	%r7, 4(%r29)
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r2, 8(%r3)
	stw	%r7, 12(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	setup_startp.3272
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
trace_diffuse_ray_80percent.3376:
	lwz	%r29, 4(%r29)
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r29, 8(%r3)
	stw	%r2, 12(%r3)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9760
	b	beq_cont.9761
beq_else.9760:
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
beq_cont.9761:
	lwz	%r2, 12(%r3)
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.9762
	b	beq_cont.9763
beq_else.9762:
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
beq_cont.9763:
	lwz	%r2, 12(%r3)
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9764
	b	beq_cont.9765
beq_else.9764:
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
beq_cont.9765:
	lwz	%r2, 12(%r3)
	cmpwi	%cr7, %r2, 3
	bne	%cr7, beq_else.9766
	b	beq_cont.9767
beq_else.9766:
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
beq_cont.9767:
	lwz	%r2, 12(%r3)
	cmpwi	%cr7, %r2, 4
	bne	%cr7, beq_else.9768
	blr
beq_else.9768:
	addis	%r2, %r0, (min_caml_dirvecs)@h	# lis
	ori	%r2, %r2, (min_caml_dirvecs)@l
	lwz	%r2, 16(%r2)
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 8(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
calc_diffuse_using_1point.3380:
	lwz	%r6, 4(%r29)
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	p_received_ray_20percent.3129
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 8(%r3)
	stw	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	p_nvectors.3136
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 8(%r3)
	stw	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	p_intersection_points.3121
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 8(%r3)
	stw	%r2, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	p_energy.3127
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
	bl	veccpy.3041
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	p_group_id.3131
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
	b	vecaccumv.3073
calc_diffuse_using_5points.3383:
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
	bl	p_received_ray_20percent.3129
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
	bl	p_received_ray_20percent.3129
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
	bl	p_received_ray_20percent.3129
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
	bl	p_received_ray_20percent.3129
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
	bl	p_received_ray_20percent.3129
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
	bl	veccpy.3041
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
	bl	vecadd.3064
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
	bl	vecadd.3064
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
	bl	vecadd.3064
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
	bl	vecadd.3064
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
	bl	p_energy.3127
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
	b	vecaccumv.3073
do_without_neighbors.3389:
	lwz	%r6, 4(%r29)
	cmpwi	%cr7, %r5, 4
	bgt	%cr7, ble_else.9770
	stw	%r29, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r2, 8(%r3)
	stw	%r5, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	p_surface_ids.3123
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 12(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwzx	%r2, %r2, %r6
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9771
	lwz	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	p_calc_diffuse.3125
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 12(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwzx	%r2, %r2, %r6
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9772
	b	beq_cont.9773
beq_else.9772:
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
beq_cont.9773:
	lwz	%r2, 12(%r3)
	addi	%r5, %r2, 1
	lwz	%r2, 8(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
bge_else.9771:
	blr
ble_else.9770:
	blr
neighbors_exist.3392:
	addis	%r6, %r0, (min_caml_image_size)@h	# lis
	ori	%r6, %r6, (min_caml_image_size)@l
	lwz	%r6, 4(%r6)
	addi	%r7, %r5, 1
	cmp	%cr7, %r6, %r7
	bgt	%cr7, ble_else.9776
	addi	%r2, %r0, 0	# li
	blr
ble_else.9776:
	cmpwi	%cr7, %r5, 0
	bgt	%cr7, ble_else.9777
	addi	%r2, %r0, 0	# li
	blr
ble_else.9777:
	addis	%r5, %r0, (min_caml_image_size)@h	# lis
	ori	%r5, %r5, (min_caml_image_size)@l
	lwz	%r5, 0(%r5)
	addi	%r6, %r2, 1
	cmp	%cr7, %r5, %r6
	bgt	%cr7, ble_else.9778
	addi	%r2, %r0, 0	# li
	blr
ble_else.9778:
	cmpwi	%cr7, %r2, 0
	bgt	%cr7, ble_else.9779
	addi	%r2, %r0, 0	# li
	blr
ble_else.9779:
	addi	%r2, %r0, 1	# li
	blr
get_surface_id.3396:
	stw	%r5, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	p_surface_ids.3123
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r5, %r1 # swap
	lwzx	%r2, %r2, %r5
	blr
neighbors_are_available.3399:
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
	bl	get_surface_id.3396
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
	bl	get_surface_id.3396
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 20(%r3)
	cmp	%cr7, %r2, %r5
	bne	%cr7, beq_else.9780
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
	bl	get_surface_id.3396
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 20(%r3)
	cmp	%cr7, %r2, %r5
	bne	%cr7, beq_else.9781
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
	bl	get_surface_id.3396
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 20(%r3)
	cmp	%cr7, %r2, %r5
	bne	%cr7, beq_else.9782
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
	bl	get_surface_id.3396
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 20(%r3)
	cmp	%cr7, %r2, %r5
	bne	%cr7, beq_else.9783
	addi	%r2, %r0, 1	# li
	blr
beq_else.9783:
	addi	%r2, %r0, 0	# li
	blr
beq_else.9782:
	addi	%r2, %r0, 0	# li
	blr
beq_else.9781:
	addi	%r2, %r0, 0	# li
	blr
beq_else.9780:
	addi	%r2, %r0, 0	# li
	blr
try_exploit_neighbors.3405:
	lwz	%r10, 4(%r29)
	addi	%r1, %r0, 2	# li
	slw	%r2, %r11, %r1 # swap
	lwzx	%r11, %r7, %r11
	cmpwi	%cr7, %r9, 4
	bgt	%cr7, ble_else.9784
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
	bl	get_surface_id.3396
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9785
	lwz	%r2, 32(%r3)
	lwz	%r5, 28(%r3)
	lwz	%r6, 24(%r3)
	lwz	%r7, 20(%r3)
	lwz	%r8, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	neighbors_are_available.3399
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9786
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
beq_else.9786:
	lwz	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	p_calc_diffuse.3125
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r8, 16(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r8, %r5, %r1 # swap
	lwzx	%r2, %r2, %r5
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9787
	b	beq_cont.9788
beq_else.9787:
	lwz	%r2, 32(%r3)
	lwz	%r5, 28(%r3)
	lwz	%r6, 24(%r3)
	lwz	%r7, 20(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	calc_diffuse_using_5points.3383
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9788:
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
bge_else.9785:
	blr
ble_else.9784:
	blr
write_ppm_header.3412:
	addi	%r2, %r0, 80	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_char.2962
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 51	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_char.2962
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_char.2962
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_image_size)@h	# lis
	ori	%r2, %r2, (min_caml_image_size)@l
	lwz	%r2, 0(%r2)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int.2960
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 32	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_char.2962
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_image_size)@h	# lis
	ori	%r2, %r2, (min_caml_image_size)@l
	lwz	%r2, 4(%r2)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int.2960
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 32	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_char.2962
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 255	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int.2960
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 10	# li
	b	print_char.2962
write_rgb_element.3414:
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	int_of_float.2995
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 255	
	bgt	%cr7, ble_else.9791
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9793
	b	bge_cont.9794
bge_else.9793:
	addi	%r2, %r0, 0	# li
bge_cont.9794:
	b	ble_cont.9792
ble_else.9791:
	addi	%r2, %r0, 255	# li
ble_cont.9792:
	b	print_int.2960
write_rgb.3416:
	addis	%r2, %r0, (min_caml_rgb)@h	# lis
	ori	%r2, %r2, (min_caml_rgb)@l
	lfs	%f0, 0(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	write_rgb_element.3414
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 32	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_char.2962
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_rgb)@h	# lis
	ori	%r2, %r2, (min_caml_rgb)@l
	lfs	%f0, 8(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	write_rgb_element.3414
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 32	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_char.2962
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_rgb)@h	# lis
	ori	%r2, %r2, (min_caml_rgb)@l
	lfs	%f0, 16(%r2)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	write_rgb_element.3414
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 10	# li
	b	print_char.2962
pretrace_diffuse_rays.3418:
	lwz	%r6, 4(%r29)
	cmpwi	%cr7, %r5, 4
	bgt	%cr7, ble_else.9795
	stw	%r29, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r5, 8(%r3)
	stw	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	get_surface_id.3396
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9796
	lwz	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	p_calc_diffuse.3125
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 8(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwzx	%r2, %r2, %r6
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9797
	b	beq_cont.9798
beq_else.9797:
	lwz	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	p_group_id.3131
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
	bl	vecbzero.3039
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	p_nvectors.3136
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 12(%r3)
	stw	%r2, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	p_intersection_points.3121
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
	bl	p_received_ray_20percent.3129
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
	bl	veccpy.3041
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
beq_cont.9798:
	lwz	%r2, 8(%r3)
	addi	%r5, %r2, 1
	lwz	%r2, 12(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
bge_else.9796:
	blr
ble_else.9795:
	blr
pretrace_pixels.3421:
	lwz	%r7, 12(%r29)
	lwz	%r8, 8(%r29)
	lwz	%r9, 4(%r29)
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.9801
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
	bl	float_of_int.2997
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
	bl	vecbzero.3039
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
	bl	veccpy.3041
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 0	# li
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r5, %r0, (min_caml_ptrace_dirvec)@h	# lis
	ori	%r5, %r5, (min_caml_ptrace_dirvec)@l
	lwz	%r6, 20(%r3)
	addi	%r1, %r0, 2	# li
	slw	%r6, %r7, %r1 # swap
	lwz	%r8, 16(%r3)
	lwzx	%r7, %r8, %r7
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
	bl	p_rgb.3119
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, (min_caml_rgb)@h	# lis
	ori	%r5, %r5, (min_caml_rgb)@l
	mfspr	%r31, 8	# mflr
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	veccpy.3041
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
	bl	p_set_group_id.3133
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
	bl	add_mod5.3028
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
bge_else.9801:
	blr
pretrace_line.3428:
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
	bl	float_of_int.2997
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
scan_pixel.3432:
	lwz	%r9, 8(%r29)
	lwz	%r10, 4(%r29)
	addis	%r11, %r0, (min_caml_image_size)@h	# lis
	ori	%r11, %r11, (min_caml_image_size)@l
	lwz	%r11, 0(%r11)
	cmp	%cr7, %r11, %r2
	bgt	%cr7, ble_else.9805
	blr
ble_else.9805:
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
	bl	p_rgb.3119
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 32(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	veccpy.3041
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 28(%r3)
	lwz	%r5, 24(%r3)
	lwz	%r6, 20(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	neighbors_exist.3392
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9807
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
	b	beq_cont.9808
beq_else.9807:
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
beq_cont.9808:
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	write_rgb.3416
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
scan_line.3438:
	lwz	%r9, 8(%r29)
	lwz	%r10, 4(%r29)
	addis	%r11, %r0, (min_caml_image_size)@h	# lis
	ori	%r11, %r11, (min_caml_image_size)@l
	lwz	%r11, 4(%r11)
	cmp	%cr7, %r11, %r2
	bgt	%cr7, ble_else.9809
	blr
ble_else.9809:
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
	bgt	%cr7, ble_else.9811
	b	ble_cont.9812
ble_else.9811:
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
ble_cont.9812:
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
	bl	add_mod5.3028
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
create_float5x3array.3444:
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
create_pixel.3446:
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
	bl	create_float5x3array.3444
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
	bl	create_float5x3array.3444
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	create_float5x3array.3444
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
	bl	create_float5x3array.3444
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
init_line_elements.3448:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.9813
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	create_pixel.3446
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
	b	init_line_elements.3448
bge_else.9813:
	blr
create_pixelline.3451:
	addis	%r2, %r0, (min_caml_image_size)@h	# lis
	ori	%r2, %r2, (min_caml_image_size)@l
	lwz	%r2, 0(%r2)
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	create_pixel.3446
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
	b	init_line_elements.3448
tan.3453:
	stfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	sin.2968
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	stfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	cos.2970
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fdiv	%f0, %f1, %f0
	blr
adjust_position.3455:
	lwz	%r29, 4(%r29)
	fmul	%f0, %f0, %f0
	addis	%r31, %r0, (l.7139)@h	# lis
	ori	%r31, %r31, (l.7139)@l
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
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f1, %f1, %f0
	stfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	atan.2974
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fmul	%f0, %f0, %f1
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	tan.3453
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fmul	%f0, %f0, %f1
	blr
calc_dirvec.3458:
	lwz	%r7, 8(%r29)
	lwz	%r8, 4(%r29)
	cmpwi	%cr7, %r2, 5
	blt	%cr7, bge_else.9814
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stfs	%f0, 8(%r3)	# float
	stw	%r7, 16(%r3)
	stfs	%f1, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	fsqr.2993
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fsqr.2993
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fadd	%f0, %f1, %f0
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
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
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
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
	bl	d_vec.3138
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 64(%r3)	# float
	lfs	%f1, 56(%r3)	# float
	lfs	%f2, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	vecset.3031
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
	bl	d_vec.3138
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 56(%r3)	# float
	stw	%r2, 72(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fneg.2982
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
	bl	vecset.3031
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
	bl	d_vec.3138
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 64(%r3)	# float
	stw	%r2, 76(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	fneg.2982
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	stfs	%f0, 80(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	fneg.2982
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
	bl	vecset.3031
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
	bl	d_vec.3138
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 64(%r3)	# float
	stw	%r2, 88(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	fneg.2982
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 56(%r3)	# float
	stfs	%f0, 96(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	fneg.2982
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 48(%r3)	# float
	stfs	%f0, 104(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	fneg.2982
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
	bl	vecset.3031
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
	bl	d_vec.3138
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 64(%r3)	# float
	stw	%r2, 112(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	fneg.2982
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 48(%r3)	# float
	stfs	%f0, 120(%r3)	# float
	mfspr	%r31, 8	# mflr
	fmr	%f0, %f1
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	fneg.2982
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
	bl	vecset.3031
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
	bl	d_vec.3138
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 48(%r3)	# float
	stw	%r2, 128(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	fneg.2982
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 64(%r3)	# float
	lfs	%f2, 56(%r3)	# float
	lwz	%r2, 128(%r3)
	b	vecset.3031
bge_else.9814:
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
calc_dirvecs.3466:
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9821
	stw	%r29, 0(%r3)
	stw	%r2, 4(%r3)
	stfs	%f0, 8(%r3)	# float
	stw	%r6, 16(%r3)
	stw	%r5, 20(%r3)
	stw	%r7, 24(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	float_of_int.2997
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7121)@h	# lis
	ori	%r31, %r31, (l.7121)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.7692)@h	# lis
	ori	%r31, %r31, (l.7692)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f2, %f0, %f1
	addi	%r2, %r0, 0	# li
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
	bl	float_of_int.2997
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7121)@h	# lis
	ori	%r31, %r31, (l.7121)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.7139)@h	# lis
	ori	%r31, %r31, (l.7139)@l
	lfs	%f1, 0(%r31)	# float
	fadd	%f2, %f0, %f1
	addi	%r2, %r0, 0	# li
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
	bl	add_mod5.3028
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
bge_else.9821:
	blr
calc_dirvec_rows.3471:
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9823
	stw	%r29, 0(%r3)
	stw	%r2, 4(%r3)
	stw	%r6, 8(%r3)
	stw	%r5, 12(%r3)
	stw	%r7, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	float_of_int.2997
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7121)@h	# lis
	ori	%r31, %r31, (l.7121)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.7692)@h	# lis
	ori	%r31, %r31, (l.7692)@l
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
	bl	add_mod5.3028
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
bge_else.9823:
	blr
create_dirvec.3475:
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.7114)@h	# lis
	ori	%r31, %r31, (l.7114)@l
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
create_dirvec_elements.3477:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.9825
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	create_dirvec.3475
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
	b	create_dirvec_elements.3477
bge_else.9825:
	blr
create_dirvecs.3480:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9827
	addis	%r5, %r0, (min_caml_dirvecs)@h	# lis
	ori	%r5, %r5, (min_caml_dirvecs)@l
	addi	%r6, %r0, 120	# li
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	stw	%r6, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	create_dirvec.3475
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
	bl	create_dirvec_elements.3477
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	b	create_dirvecs.3480
bge_else.9827:
	blr
init_dirvec_constants.3482:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.9829
	addi	%r1, %r0, 2	# li
	slw	%r5, %r6, %r1 # swap
	lwzx	%r6, %r2, %r6
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	setup_dirvec_constants.3267
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	addi	%r5, %r2, -1	# subi %r5, %r2, 1
	lwz	%r2, 0(%r3)
	b	init_dirvec_constants.3482
bge_else.9829:
	blr
init_vecset_constants.3485:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9831
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
	bl	init_dirvec_constants.3482
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	b	init_vecset_constants.3485
bge_else.9831:
	blr
init_dirvecs.3487:
	lwz	%r2, 4(%r29)
	addi	%r5, %r0, 4	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	create_dirvecs.3480
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
	b	init_vecset_constants.3485
add_reflection.3489:
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	stfs	%f0, 8(%r3)	# float
	stfs	%f3, 16(%r3)	# float
	stfs	%f2, 24(%r3)	# float
	stfs	%f1, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	create_dirvec.3475
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 40(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	d_vec.3138
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f0, 32(%r3)	# float
	lfs	%f1, 24(%r3)	# float
	lfs	%f2, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	vecset.3031
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 40(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	setup_dirvec_constants.3267
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
setup_rect_reflection.3496:
	addi	%r1, %r0, 2	# li
	slw	%r2, %r2, %r1 # swap
	addis	%r6, %r0, (min_caml_n_reflections)@h	# lis
	ori	%r6, %r6, (min_caml_n_reflections)@l
	lwz	%r6, 0(%r6)
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r6, 0(%r3)
	stw	%r2, 4(%r3)
	stfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_diffuse.3101
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
	bl	fneg.2982
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
	bl	fneg.2982
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
	bl	fneg.2982
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
	bl	add_reflection.3489
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
	bl	add_reflection.3489
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
	bl	add_reflection.3489
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_n_reflections)@h	# lis
	ori	%r2, %r2, (min_caml_n_reflections)@l
	lwz	%r5, 0(%r3)
	addi	%r5, %r5, 3
	stw	%r5, 0(%r2)
	blr
setup_surface_reflection.3499:
	addi	%r1, %r0, 2	# li
	slw	%r2, %r2, %r1 # swap
	addi	%r2, %r2, 1
	addis	%r6, %r0, (min_caml_n_reflections)@h	# lis
	ori	%r6, %r6, (min_caml_n_reflections)@l
	lwz	%r6, 0(%r6)
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r5, 8(%r3)
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_diffuse.3101
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
	bl	o_param_abc.3093
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 32(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	veciprod.3052
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7130)@h	# lis
	ori	%r31, %r31, (l.7130)@l
	lfs	%f1, 0(%r31)	# float
	lwz	%r2, 8(%r3)
	stfs	%f0, 40(%r3)	# float
	stfs	%f1, 48(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_param_a.3087
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
	addis	%r31, %r0, (l.7130)@h	# lis
	ori	%r31, %r31, (l.7130)@l
	lfs	%f2, 0(%r31)	# float
	lwz	%r2, 8(%r3)
	stfs	%f0, 56(%r3)	# float
	stfs	%f2, 64(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	o_param_b.3089
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
	addis	%r31, %r0, (l.7130)@h	# lis
	ori	%r31, %r31, (l.7130)@l
	lfs	%f2, 0(%r31)	# float
	lwz	%r2, 8(%r3)
	stfs	%f0, 72(%r3)	# float
	stfs	%f2, 80(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	o_param_c.3091
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
	bl	add_reflection.3489
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_n_reflections)@h	# lis
	ori	%r2, %r2, (min_caml_n_reflections)@l
	lwz	%r5, 4(%r3)
	addi	%r5, %r5, 1
	stw	%r5, 0(%r2)
	blr
setup_reflections.3502:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.9838
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
	bl	o_reflectiontype.3081
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9839
	lwz	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_diffuse.3101
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.7110)@h	# lis
	ori	%r31, %r31, (l.7110)@l
	lfs	%f1, 0(%r31)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fless.2988
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.9840
	blr
beq_else.9840:
	lwz	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_form.3079
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.9842
	lwz	%r2, 0(%r3)
	lwz	%r5, 4(%r3)
	b	setup_rect_reflection.3496
beq_else.9842:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.9843
	lwz	%r2, 0(%r3)
	lwz	%r5, 4(%r3)
	b	setup_surface_reflection.3499
beq_else.9843:
	blr
beq_else.9839:
	blr
bge_else.9838:
	blr
rt.3504:
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
	addis	%r31, %r0, (l.7725)@h	# lis
	ori	%r31, %r31, (l.7725)@l
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
	bl	float_of_int.2997
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
	bl	create_pixelline.3451
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 32(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	create_pixelline.3451
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 36(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	create_pixelline.3451
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
	bl	write_ppm_header.3412
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
	bl	d_vec.3138
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, (min_caml_light)@h	# lis
	ori	%r5, %r5, (min_caml_light)@l
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	veccpy.3041
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r2, %r0, (min_caml_light_dirvec)@h	# lis
	ori	%r2, %r2, (min_caml_light_dirvec)@l
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	setup_dirvec_constants.3267
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
	bl	setup_reflections.3502
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
	addis	%r31, %r0, (l.7728)@h	# lis
	ori	%r31, %r31, (l.7728)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.7729)@h	# lis
	ori	%r31, %r31, (l.7729)@l
	lfs	%f1, 0(%r31)	# float
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 16
	addis	%r5, %r0, (xn_plus_one.3007)@h	# lis
	ori	%r5, %r5, (xn_plus_one.3007)@l
	stw	%r5, 0(%r2)
	stfs	%f0, 8(%r2)	# float
	or	%r4, %r5, %r4	# mr %r5, %r4
	addi	%r4, %r4, 16
	addis	%r6, %r0, (newton_sub.3010)@h	# lis
	ori	%r6, %r6, (newton_sub.3010)@l
	stw	%r6, 0(%r5)
	stw	%r2, 12(%r5)
	stfs	%f1, 8(%r5)	# float
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 8
	addis	%r6, %r0, (sqrt.3013)@h	# lis
	ori	%r6, %r6, (sqrt.3013)@l
	stw	%r6, 0(%r2)
	stw	%r5, 4(%r2)
	or	%r4, %r5, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	addis	%r6, %r0, (vecunit_sgn.3049)@h	# lis
	ori	%r6, %r6, (vecunit_sgn.3049)@l
	stw	%r6, 0(%r5)
	stw	%r2, 4(%r5)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r7, %r0, (read_nth_object.3157)@h	# lis
	ori	%r7, %r7, (read_nth_object.3157)@l
	stw	%r7, 0(%r6)
	stw	%r5, 4(%r6)
	or	%r4, %r7, %r4	# mr %r7, %r4
	addi	%r4, %r4, 8
	addis	%r8, %r0, (read_object.3159)@h	# lis
	ori	%r8, %r8, (read_object.3159)@l
	stw	%r8, 0(%r7)
	stw	%r6, 4(%r7)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r8, %r0, (read_all_object.3161)@h	# lis
	ori	%r8, %r8, (read_all_object.3161)@l
	stw	%r8, 0(%r6)
	stw	%r7, 4(%r6)
	or	%r4, %r7, %r4	# mr %r7, %r4
	addi	%r4, %r4, 8
	addis	%r8, %r0, (read_parameter.3169)@h	# lis
	ori	%r8, %r8, (read_parameter.3169)@l
	stw	%r8, 0(%r7)
	stw	%r6, 4(%r7)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r8, %r0, (solver_second.3205)@h	# lis
	ori	%r8, %r8, (solver_second.3205)@l
	stw	%r8, 0(%r6)
	stw	%r2, 4(%r6)
	or	%r4, %r8, %r4	# mr %r8, %r4
	addi	%r4, %r4, 8
	addis	%r9, %r0, (solver.3211)@h	# lis
	ori	%r9, %r9, (solver.3211)@l
	stw	%r9, 0(%r8)
	stw	%r6, 4(%r8)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r9, %r0, (solver_second_fast.3228)@h	# lis
	ori	%r9, %r9, (solver_second_fast.3228)@l
	stw	%r9, 0(%r6)
	stw	%r2, 4(%r6)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 8
	addis	%r10, %r0, (solver_fast.3234)@h	# lis
	ori	%r10, %r10, (solver_fast.3234)@l
	stw	%r10, 0(%r9)
	stw	%r6, 4(%r9)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r10, %r0, (solver_second_fast2.3245)@h	# lis
	ori	%r10, %r10, (solver_second_fast2.3245)@l
	stw	%r10, 0(%r6)
	stw	%r2, 4(%r6)
	or	%r4, %r10, %r4	# mr %r10, %r4
	addi	%r4, %r4, 8
	addis	%r11, %r0, (solver_fast2.3252)@h	# lis
	ori	%r11, %r11, (solver_fast2.3252)@l
	stw	%r11, 0(%r10)
	stw	%r6, 4(%r10)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r11, %r0, (shadow_check_and_group.3300)@h	# lis
	ori	%r11, %r11, (shadow_check_and_group.3300)@l
	stw	%r11, 0(%r6)
	stw	%r9, 4(%r6)
	or	%r4, %r11, %r4	# mr %r11, %r4
	addi	%r4, %r4, 8
	addis	%r12, %r0, (shadow_check_one_or_group.3303)@h	# lis
	ori	%r12, %r12, (shadow_check_one_or_group.3303)@l
	stw	%r12, 0(%r11)
	stw	%r6, 4(%r11)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 16
	addis	%r12, %r0, (shadow_check_one_or_matrix.3306)@h	# lis
	ori	%r12, %r12, (shadow_check_one_or_matrix.3306)@l
	stw	%r12, 0(%r6)
	stw	%r9, 8(%r6)
	stw	%r11, 4(%r6)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 8
	addis	%r11, %r0, (solve_each_element.3309)@h	# lis
	ori	%r11, %r11, (solve_each_element.3309)@l
	stw	%r11, 0(%r9)
	stw	%r8, 4(%r9)
	or	%r4, %r11, %r4	# mr %r11, %r4
	addi	%r4, %r4, 8
	addis	%r12, %r0, (solve_one_or_network.3313)@h	# lis
	ori	%r12, %r12, (solve_one_or_network.3313)@l
	stw	%r12, 0(%r11)
	stw	%r9, 4(%r11)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 16
	addis	%r12, %r0, (trace_or_matrix.3317)@h	# lis
	ori	%r12, %r12, (trace_or_matrix.3317)@l
	stw	%r12, 0(%r9)
	stw	%r8, 8(%r9)
	stw	%r11, 4(%r9)
	or	%r4, %r8, %r4	# mr %r8, %r4
	addi	%r4, %r4, 8
	addis	%r11, %r0, (judge_intersection.3321)@h	# lis
	ori	%r11, %r11, (judge_intersection.3321)@l
	stw	%r11, 0(%r8)
	stw	%r9, 4(%r8)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 8
	addis	%r11, %r0, (solve_each_element_fast.3323)@h	# lis
	ori	%r11, %r11, (solve_each_element_fast.3323)@l
	stw	%r11, 0(%r9)
	stw	%r10, 4(%r9)
	or	%r4, %r11, %r4	# mr %r11, %r4
	addi	%r4, %r4, 8
	addis	%r12, %r0, (solve_one_or_network_fast.3327)@h	# lis
	ori	%r12, %r12, (solve_one_or_network_fast.3327)@l
	stw	%r12, 0(%r11)
	stw	%r9, 4(%r11)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 16
	addis	%r12, %r0, (trace_or_matrix_fast.3331)@h	# lis
	ori	%r12, %r12, (trace_or_matrix_fast.3331)@l
	stw	%r12, 0(%r9)
	stw	%r10, 8(%r9)
	stw	%r11, 4(%r9)
	or	%r4, %r10, %r4	# mr %r10, %r4
	addi	%r4, %r4, 8
	addis	%r11, %r0, (judge_intersection_fast.3335)@h	# lis
	ori	%r11, %r11, (judge_intersection_fast.3335)@l
	stw	%r11, 0(%r10)
	stw	%r9, 4(%r10)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 8
	addis	%r11, %r0, (get_nvector_second.3341)@h	# lis
	ori	%r11, %r11, (get_nvector_second.3341)@l
	stw	%r11, 0(%r9)
	stw	%r5, 4(%r9)
	or	%r4, %r11, %r4	# mr %r11, %r4
	addi	%r4, %r4, 8
	addis	%r12, %r0, (get_nvector.3343)@h	# lis
	ori	%r12, %r12, (get_nvector.3343)@l
	stw	%r12, 0(%r11)
	stw	%r9, 4(%r11)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 8
	addis	%r12, %r0, (utexture.3346)@h	# lis
	ori	%r12, %r12, (utexture.3346)@l
	stw	%r12, 0(%r9)
	stw	%r2, 4(%r9)
	or	%r4, %r12, %r4	# mr %r12, %r4
	addi	%r4, %r4, 16
	addis	%r13, %r0, (trace_reflections.3353)@h	# lis
	ori	%r13, %r13, (trace_reflections.3353)@l
	stw	%r13, 0(%r12)
	stw	%r6, 8(%r12)
	stw	%r10, 4(%r12)
	or	%r4, %r13, %r4	# mr %r13, %r4
	addi	%r4, %r4, 24
	addis	%r14, %r0, (trace_ray.3358)@h	# lis
	ori	%r14, %r14, (trace_ray.3358)@l
	stw	%r14, 0(%r13)
	stw	%r9, 20(%r13)
	stw	%r12, 16(%r13)
	stw	%r6, 12(%r13)
	stw	%r8, 8(%r13)
	stw	%r11, 4(%r13)
	or	%r4, %r8, %r4	# mr %r8, %r4
	addi	%r4, %r4, 24
	addis	%r12, %r0, (trace_diffuse_ray.3364)@h	# lis
	ori	%r12, %r12, (trace_diffuse_ray.3364)@l
	stw	%r12, 0(%r8)
	stw	%r9, 16(%r8)
	stw	%r6, 12(%r8)
	stw	%r10, 8(%r8)
	stw	%r11, 4(%r8)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r9, %r0, (iter_trace_diffuse_rays.3367)@h	# lis
	ori	%r9, %r9, (iter_trace_diffuse_rays.3367)@l
	stw	%r9, 0(%r6)
	stw	%r8, 4(%r6)
	or	%r4, %r8, %r4	# mr %r8, %r4
	addi	%r4, %r4, 8
	addis	%r9, %r0, (trace_diffuse_rays.3372)@h	# lis
	ori	%r9, %r9, (trace_diffuse_rays.3372)@l
	stw	%r9, 0(%r8)
	stw	%r6, 4(%r8)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r9, %r0, (trace_diffuse_ray_80percent.3376)@h	# lis
	ori	%r9, %r9, (trace_diffuse_ray_80percent.3376)@l
	stw	%r9, 0(%r6)
	stw	%r8, 4(%r6)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 8
	addis	%r10, %r0, (calc_diffuse_using_1point.3380)@h	# lis
	ori	%r10, %r10, (calc_diffuse_using_1point.3380)@l
	stw	%r10, 0(%r9)
	stw	%r6, 4(%r9)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r10, %r0, (do_without_neighbors.3389)@h	# lis
	ori	%r10, %r10, (do_without_neighbors.3389)@l
	stw	%r10, 0(%r6)
	stw	%r9, 4(%r6)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 8
	addis	%r10, %r0, (try_exploit_neighbors.3405)@h	# lis
	ori	%r10, %r10, (try_exploit_neighbors.3405)@l
	stw	%r10, 0(%r9)
	stw	%r6, 4(%r9)
	or	%r4, %r10, %r4	# mr %r10, %r4
	addi	%r4, %r4, 8
	addis	%r11, %r0, (pretrace_diffuse_rays.3418)@h	# lis
	ori	%r11, %r11, (pretrace_diffuse_rays.3418)@l
	stw	%r11, 0(%r10)
	stw	%r8, 4(%r10)
	or	%r4, %r8, %r4	# mr %r8, %r4
	addi	%r4, %r4, 16
	addis	%r11, %r0, (pretrace_pixels.3421)@h	# lis
	ori	%r11, %r11, (pretrace_pixels.3421)@l
	stw	%r11, 0(%r8)
	stw	%r5, 12(%r8)
	stw	%r13, 8(%r8)
	stw	%r10, 4(%r8)
	or	%r4, %r5, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	addis	%r10, %r0, (pretrace_line.3428)@h	# lis
	ori	%r10, %r10, (pretrace_line.3428)@l
	stw	%r10, 0(%r5)
	stw	%r8, 4(%r5)
	or	%r4, %r8, %r4	# mr %r8, %r4
	addi	%r4, %r4, 16
	addis	%r10, %r0, (scan_pixel.3432)@h	# lis
	ori	%r10, %r10, (scan_pixel.3432)@l
	stw	%r10, 0(%r8)
	stw	%r9, 8(%r8)
	stw	%r6, 4(%r8)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 16
	addis	%r9, %r0, (scan_line.3438)@h	# lis
	ori	%r9, %r9, (scan_line.3438)@l
	stw	%r9, 0(%r6)
	stw	%r8, 8(%r6)
	stw	%r5, 4(%r6)
	or	%r4, %r8, %r4	# mr %r8, %r4
	addi	%r4, %r4, 8
	addis	%r9, %r0, (adjust_position.3455)@h	# lis
	ori	%r9, %r9, (adjust_position.3455)@l
	stw	%r9, 0(%r8)
	stw	%r2, 4(%r8)
	or	%r4, %r9, %r4	# mr %r9, %r4
	addi	%r4, %r4, 16
	addis	%r10, %r0, (calc_dirvec.3458)@h	# lis
	ori	%r10, %r10, (calc_dirvec.3458)@l
	stw	%r10, 0(%r9)
	stw	%r2, 8(%r9)
	stw	%r8, 4(%r9)
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 8
	addis	%r8, %r0, (calc_dirvecs.3466)@h	# lis
	ori	%r8, %r8, (calc_dirvecs.3466)@l
	stw	%r8, 0(%r2)
	stw	%r9, 4(%r2)
	or	%r4, %r8, %r4	# mr %r8, %r4
	addi	%r4, %r4, 8
	addis	%r9, %r0, (calc_dirvec_rows.3471)@h	# lis
	ori	%r9, %r9, (calc_dirvec_rows.3471)@l
	stw	%r9, 0(%r8)
	stw	%r2, 4(%r8)
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 8
	addis	%r9, %r0, (init_dirvecs.3487)@h	# lis
	ori	%r9, %r9, (init_dirvecs.3487)@l
	stw	%r9, 0(%r2)
	stw	%r8, 4(%r2)
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 24
	addis	%r8, %r0, (rt.3504)@h	# lis
	ori	%r8, %r8, (rt.3504)@l
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
