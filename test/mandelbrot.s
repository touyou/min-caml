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
l.948:	 # 1.000000
	.long	1065353216
	.align 3
l.947:	 # 1.500000
	.long	1069547520
	.align 3
l.946:	 # 400.000000
	.long	1137180672
	.align 3
l.945:	 # 4.000000
	.long	1082130432
	.align 3
l.944:	 # 0.000000
	.long	0
	.text
	.globl _min_caml_start
	.align 2
mul_sub.912:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.972
	blr
beq_else.972:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r5 # swap
	and	%r6, %r6, %r8
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.973
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.973:
	slw	%r7, %r6, %r5 # swap
	add	%r2, %r2, %r6
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
mul.402:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.974
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.975
bge_else.974:
	neg	%r6, %r2
bge_cont.975:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.976
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.977
bge_else.976:
	neg	%r7, %r5
bge_cont.977:
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r8, %r0, (mul_sub.912)@h	# lis
	ori	%r8, %r8, (mul_sub.912)@l
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
	bne	%cr7, beq_else.978
	blr
beq_else.978:
	neg	%r2, %r2
	blr
div_sub.878:
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.979
	blr
beq_else.979:
	srw	%r5, %r8, %r7 # swap
	cmp	%cr7, %r6, %r8
	bgt	%cr7, ble_else.980
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7 # swap
	add	%r2, %r8, %r2
	slw	%r6, %r8, %r7 # swap
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.878
ble_else.980:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.878
div.405:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.981
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.982
bge_else.981:
	neg	%r6, %r2
bge_cont.982:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.983
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.984
bge_else.983:
	neg	%r7, %r5
bge_cont.984:
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
	bl	div_sub.878
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
	bne	%cr7, beq_else.985
	blr
beq_else.985:
	neg	%r2, %r2
	blr
print_int_sub.858:
	cmpwi	%cr7, %r2, 10
	blt	%cr7, bge_else.986
	addi	%r5, %r0, 10	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.405
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int_sub.858
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.405
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	mul.402
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	subf	%r2, %r2, %r5	# sub	%r2, %r5, %r2
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
bge_else.986:
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
print_int.410:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.989
	b	print_int_sub.858
bge_else.989:
	addi	%r5, %r0, 45	# li
	out	%r5, 0
	neg	%r2, %r2
	b	print_int_sub.858
msb_sub.653:
	srw	%r2, %r6, %r5 # swap
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.990
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.991
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
beq_else.991:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	b	msb_sub.653
beq_else.990:
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
float_of_int.447:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.992
	addis	%r31, %r0, (l.944)@h	# lis
	ori	%r31, %r31, (l.944)@l
	lfs	%f0, 0(%r31)	# float
	blr
beq_else.992:
	addi	%r5, %r0, 31	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	msb_sub.653
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
dbl.475:
	fadd	%f0, %f0, %f0
	blr
iloop.491:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.993
	addi	%r2, %r0, 1	# li
	b	print_int.410
beq_else.993:
	fsub	%f2, %f2, %f3
	fadd	%f2, %f2, %f4
	stfs	%f4, 0(%r3)	# float
	stw	%r2, 8(%r3)
	stfs	%f2, 16(%r3)	# float
	stfs	%f5, 24(%r3)	# float
	stfs	%f1, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	dbl.475
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 32(%r3)	# float
	fmul	%f0, %f0, %f1
	lfs	%f5, 24(%r3)	# float
	fadd	%f1, %f0, %f5
	lfs	%f0, 16(%r3)	# float
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f4, %f2, %f3
	addis	%r31, %r0, (l.945)@h	# lis
	ori	%r31, %r31, (l.945)@l
	lfs	%f6, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f6
	bgt	%cr7, ble_else.995
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lfs	%f4, 0(%r3)	# float
	b	iloop.491
ble_else.995:
	addi	%r2, %r0, 0	# li
	b	print_int.410
xloop.481:
	cmpwi	%cr7, %r2, 400
	blt	%cr7, bge_else.996
	blr
bge_else.996:
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	float_of_int.447
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	dbl.475
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.946)@h	# lis
	ori	%r31, %r31, (l.946)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	addis	%r31, %r0, (l.947)@h	# lis
	ori	%r31, %r31, (l.947)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	lwz	%r2, 4(%r3)
	stfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	float_of_int.447
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	dbl.475
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, (l.946)@h	# lis
	ori	%r31, %r31, (l.946)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	addis	%r31, %r0, (l.948)@h	# lis
	ori	%r31, %r31, (l.948)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f5, %f0, %f1
	addi	%r2, %r0, 1000	# li
	addis	%r31, %r0, (l.944)@h	# lis
	ori	%r31, %r31, (l.944)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.944)@h	# lis
	ori	%r31, %r31, (l.944)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.944)@h	# lis
	ori	%r31, %r31, (l.944)@l
	lfs	%f2, 0(%r31)	# float
	addis	%r31, %r0, (l.944)@h	# lis
	ori	%r31, %r31, (l.944)@l
	lfs	%f3, 0(%r31)	# float
	lfs	%f4, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	iloop.491
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	b	xloop.481
yloop.477:
	cmpwi	%cr7, %r2, 400
	blt	%cr7, bge_else.998
	blr
bge_else.998:
	addi	%r5, %r0, 0	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r28, %r5	# mr %r28, %r5
	or	%r2, %r5, %r2	# mr %r5, %r2
	or	%r28, %r2, %r28	# mr %r2, %r28
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	xloop.481
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	b	yloop.477
_min_caml_start: # main entry point
#	main program starts
	addi	%r2, %r0, 0	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	yloop.477
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	sc
