	.globl _start
	.text
_start:
# 0x000000 | code & data seg |
# 0x010000 | stack       seg |
# 0x180000 | heap        seg |
	lis	%r3, 0x0001	# sp
	lis	%r4, 0x0018	# hp
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
	stfd	%f0, 0(%r4)
	addi  %r5, %r5, -1  # subi	%r5, %r5, 1
	addi	%r4, %r4, 8
	b	create_float_array_loop
	.data
	.literal8
	.align 3
l.927:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
l.926:	 # 1.500000
	.long	0
	.long	1073217536
	.align 3
l.925:	 # 400.000000
	.long	0
	.long	1081671680
	.align 3
l.924:	 # 4.000000
	.long	0
	.long	1074790400
	.align 3
l.923:	 # 0.000000
	.long	0
	.long	0
	.text
	.globl _min_caml_start
	.align 2
mul_sub.891:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r5, -1
	bc	12, %cr7, beq_else.951
	blr
beq_else.951:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r5
	and	%r6, %r6, %r8
	cmpwi	%cr7, %r6, 0
	bc	12, %cr7, beq_else.952
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.952:
	slw	%r6, %r7, %r5
	add	%r2, %r2, %r6
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
mul.393:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.953
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.954
bge_else.953:
	neg	%r6, %r2
bge_cont.954:
	cmpwi	%cr7, %r5, 0
	bc	8, %cr7, bge_else.955
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.956
bge_else.955:
	neg	%r7, %r5
bge_cont.956:
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r8, %r0, ha16(mul_sub.891)	# lis
	addi	%r8, %r8, lo16(mul_sub.891)
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
	bc	12, %cr7, beq_else.957
	blr
beq_else.957:
	neg	%r2, %r2
	blr
div_sub.857:
	cmpwi	%cr7, %r7, -1
	bc	12, %cr7, beq_else.958
	blr
beq_else.958:
	srw	%r8, %r5, %r7
	cmp	%cr7, %r6, %r8
	bc	4, %cr7, ble_else.959
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7
	add	%r2, %r8, %r2
	slw	%r8, %r6, %r7
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.857
ble_else.959:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.857
div.396:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.960
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.961
bge_else.960:
	neg	%r6, %r2
bge_cont.961:
	cmpwi	%cr7, %r5, 0
	bc	8, %cr7, bge_else.962
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.963
bge_else.962:
	neg	%r7, %r5
bge_cont.963:
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
	bl	div_sub.857
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
	bc	12, %cr7, beq_else.964
	blr
beq_else.964:
	neg	%r2, %r2
	blr
print_int_sub.837:
	cmpwi	%cr7, %r2, 10
	bc	8, %cr7, bge_else.965
	addi	%r5, %r0, 10	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.396
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int_sub.837
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.396
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	mul.393
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	subf	%r2, %r2, %r5	# sub	%r2, %r5, %r2
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
bge_else.965:
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
print_int.401:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.968
	b	print_int_sub.837
bge_else.968:
	addi	%r5, %r0, 45	# li
	out	%r5, 0
	neg	%r2, %r2
	b	print_int_sub.837
msb_sub.632:
	srw	%r6, %r2, %r5
	cmpwi	%cr7, %r6, 0
	bc	12, %cr7, beq_else.969
	cmpwi	%cr7, %r2, 0
	bc	12, %cr7, beq_else.970
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
beq_else.970:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	b	msb_sub.632
beq_else.969:
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
float_of_int.438:
	cmpwi	%cr7, %r2, 0
	bc	12, %cr7, beq_else.971
	addis	%r31, %r0, ha16(l.923)	# lis
	addi	%r31, %r31, lo16(l.923)
	lfd	%f0, 0(%r31)
	blr
beq_else.971:
	addi	%r5, %r0, 31	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	msb_sub.632
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
dbl.464:
	fadd	%f0, %f0, %f0
	blr
iloop.480:
	cmpwi	%cr7, %r2, 0
	bc	12, %cr7, beq_else.972
	addi	%r2, %r0, 1	# li
	b	print_int.401
beq_else.972:
	fsub	%f2, %f2, %f3
	fadd	%f2, %f2, %f4
	stfd	%f4, 0(%r3)
	stw	%r2, 8(%r3)
	stfd	%f2, 16(%r3)
	stfd	%f5, 24(%r3)
	stfd	%f1, 32(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	dbl.464
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lfd	%f1, 32(%r3)
	fmul	%f0, %f0, %f1
	lfd	%f5, 24(%r3)
	fadd	%f1, %f0, %f5
	lfd	%f0, 16(%r3)
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f4, %f2, %f3
	addis	%r31, %r0, ha16(l.924)	# lis
	addi	%r31, %r31, lo16(l.924)
	lfd	%f6, 0(%r31)
	fcmpu	%cr7, %f4, %f6
	bc	4, %cr7, ble_else.974
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lfd	%f4, 0(%r3)
	b	iloop.480
ble_else.974:
	addi	%r2, %r0, 0	# li
	b	print_int.401
xloop.470:
	cmpwi	%cr7, %r2, 400
	bc	8, %cr7, bge_else.975
	blr
bge_else.975:
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	float_of_int.438
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	dbl.464
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, ha16(l.925)	# lis
	addi	%r31, %r31, lo16(l.925)
	lfd	%f1, 0(%r31)
	fdiv	%f0, %f0, %f1
	addis	%r31, %r0, ha16(l.926)	# lis
	addi	%r31, %r31, lo16(l.926)
	lfd	%f1, 0(%r31)
	fsub	%f0, %f0, %f1
	lwz	%r2, 4(%r3)
	stfd	%f0, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	float_of_int.438
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	dbl.464
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, ha16(l.925)	# lis
	addi	%r31, %r31, lo16(l.925)
	lfd	%f1, 0(%r31)
	fdiv	%f0, %f0, %f1
	addis	%r31, %r0, ha16(l.927)	# lis
	addi	%r31, %r31, lo16(l.927)
	lfd	%f1, 0(%r31)
	fsub	%f5, %f0, %f1
	addi	%r2, %r0, 1000	# li
	addis	%r31, %r0, ha16(l.923)	# lis
	addi	%r31, %r31, lo16(l.923)
	lfd	%f0, 0(%r31)
	addis	%r31, %r0, ha16(l.923)	# lis
	addi	%r31, %r31, lo16(l.923)
	lfd	%f1, 0(%r31)
	addis	%r31, %r0, ha16(l.923)	# lis
	addi	%r31, %r31, lo16(l.923)
	lfd	%f2, 0(%r31)
	addis	%r31, %r0, ha16(l.923)	# lis
	addi	%r31, %r31, lo16(l.923)
	lfd	%f3, 0(%r31)
	lfd	%f4, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	iloop.480
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	b	xloop.470
yloop.466:
	cmpwi	%cr7, %r2, 400
	bc	8, %cr7, bge_else.977
	blr
bge_else.977:
	addi	%r5, %r0, 0	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r28, %r5	# mr %r28, %r5
	or	%r2, %r5, %r2	# mr %r5, %r2
	or	%r28, %r2, %r28	# mr %r2, %r28
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	xloop.470
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	b	yloop.466
_min_caml_start: # main entry point
#	main program starts
	addi	%r2, %r0, 0	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	yloop.466
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
