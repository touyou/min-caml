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
l.858:	 # 2.000000
	.long	1073741824
	.align 3
l.854:	 # 10.000000
	.long	1092616192
	.align 3
l.853:	 # 0.000000
	.long	0
	.text
	.globl _min_caml_start
	.align 2
mul_sub.821:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.879
	blr
beq_else.879:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r5 # swap
	and	%r6, %r6, %r8
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.880
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.880:
	slw	%r7, %r6, %r5 # swap
	add	%r2, %r2, %r6
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
mul.365:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.881
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.882
bge_else.881:
	neg	%r6, %r2
bge_cont.882:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.883
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.884
bge_else.883:
	neg	%r7, %r5
bge_cont.884:
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r8, %r0, (mul_sub.821)@h	# lis
	ori	%r8, %r8, (mul_sub.821)@l
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
	bne	%cr7, beq_else.885
	blr
beq_else.885:
	neg	%r2, %r2
	blr
div_sub.787:
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.886
	blr
beq_else.886:
	srw	%r5, %r8, %r7 # swap
	cmp	%cr7, %r6, %r8
	bgt	%cr7, ble_else.887
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7 # swap
	add	%r2, %r8, %r2
	slw	%r6, %r8, %r7 # swap
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.787
ble_else.887:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.787
div.368:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.888
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.889
bge_else.888:
	neg	%r6, %r2
bge_cont.889:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.890
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.891
bge_else.890:
	neg	%r7, %r5
bge_cont.891:
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
	bl	div_sub.787
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
	bne	%cr7, beq_else.892
	blr
beq_else.892:
	neg	%r2, %r2
	blr
print_int_sub.767:
	cmpwi	%cr7, %r2, 10
	blt	%cr7, bge_else.893
	addi	%r5, %r0, 10	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.368
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int_sub.767
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.368
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	mul.365
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	subf	%r2, %r2, %r5	# sub	%r2, %r5, %r2
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
bge_else.893:
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
print_int.373:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.896
	b	print_int_sub.767
bge_else.896:
	addi	%r5, %r0, 45	# li
	out	%r5, 0
	neg	%r2, %r2
	b	print_int_sub.767
int_of_float.408:
	addis	%r31, %r0, (l.853)@h	# lis
	ori	%r31, %r31, (l.853)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.897
	addi	%r2, %r0, 0	# li
	blr
beq_else.897:
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
	blt	%cr7, bge_else.898
	srw	%r2, %r2, %r5 # swap
	b	bge_cont.899
bge_else.898:
	neg	%r5, %r5
	slw	%r2, %r2, %r5 # swap
bge_cont.899:
	addis	%r5, %r0, 65535	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	addis	%r31, %r0, (l.853)@h	# lis
	ori	%r31, %r31, (l.853)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.900
	blr
ble_else.900:
	neg	%r2, %r2
	blr
msb_sub.562:
	srw	%r2, %r6, %r5 # swap
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.901
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.902
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
beq_else.902:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	b	msb_sub.562
beq_else.901:
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
float_of_int.410:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.903
	addis	%r31, %r0, (l.853)@h	# lis
	ori	%r31, %r31, (l.853)@l
	lfs	%f0, 0(%r31)	# float
	blr
beq_else.903:
	addi	%r5, %r0, 31	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	msb_sub.562
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
print_float_sub.454:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.904
	blr
beq_else.904:
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	stw	%r2, 0(%r3)
	stfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	int_of_float.408
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r2, 48
	out	%r5, 0
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	float_of_int.410
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	b	print_float_sub.454
print_float.434:
	addis	%r31, %r0, (l.853)@h	# lis
	ori	%r31, %r31, (l.853)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.907
	b	ble_cont.908
ble_else.907:
	addi	%r2, %r0, 45	# li
	out	%r2, 0
	fneg	%f0, %f0
ble_cont.908:
	stfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	int_of_float.408
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	print_int.373
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 46	# li
	out	%r2, 0
	lwz	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	float_of_int.410
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	addi	%r2, %r0, 5	# li
	b	print_float_sub.454
testf.436:
	fadd	%f2, %f0, %f1
	fadd	%f1, %f0, %f1
	addi	%r5, %r0, 4	# li
	addis	%r31, %r0, (l.853)@h	# lis
	ori	%r31, %r31, (l.853)@l
	lfs	%f3, 0(%r31)	# float
	stfs	%f1, 0(%r3)	# float
	stfs	%f2, 8(%r3)	# float
	stfs	%f0, 16(%r3)	# float
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
	addi	%r1, %r0, 3	# li
	slw	%r5, %r6, %r1 # swap
	lfdx	%f0, %r2, %r6
	addi	%r1, %r0, 3	# li
	slw	%r5, %r6, %r1 # swap
	lfs	%f1, 16(%r3)	# float
	stfdx	%f1, %r2, %r6
	addi	%r1, %r0, 3	# li
	slw	%r5, %r5, %r1 # swap
	lfdx	%f1, %r2, %r5
	lfs	%f2, 0(%r3)	# float
	lfs	%f3, 8(%r3)	# float
	fadd	%f2, %f3, %f2
	fadd	%f0, %f2, %f0
	fadd	%f0, %f0, %f1
	blr
_min_caml_start: # main entry point
#	main program starts
	addis	%r31, %r0, (l.854)@h	# lis
	ori	%r31, %r31, (l.854)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.858)@h	# lis
	ori	%r31, %r31, (l.858)@l
	lfs	%f1, 0(%r31)	# float
	addi	%r2, %r0, 2	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	testf.436
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_float.434
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	sc
