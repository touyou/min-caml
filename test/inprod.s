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
	#.literal8
	.align 3
l.898:	 # 6.000000
	.long	1086324736
	.align 3
l.897:	 # 5.000000
	.long	1084227584
	.align 3
l.896:	 # 4.000000
	.long	1082130432
	.align 3
l.891:	 # 3.000000
	.long	1077936128
	.align 3
l.890:	 # 2.000000
	.long	1073741824
	.align 3
l.889:	 # 1.000000
	.long	1065353216
	.align 3
l.888:	 # 1000000.000000
	.long	1232348160
	.text
	.globl _min_caml_start
	.align 2
mul_sub.856:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r5, -1
	bne %cr7, beq_else.923
	blr
beq_else.923:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r5 # swap
	and	%r6, %r6, %r8
	cmpwi	%cr7, %r6, 0
	bne %cr7, beq_else.924
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.924:
	slw	%r7, %r6, %r5 # swap
	add	%r2, %r2, %r6
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
mul.378:
	cmpwi	%cr7, %r2, 0
	blt %cr7, bge_else.925
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.926
bge_else.925:
	neg	%r6, %r2
bge_cont.926:
	cmpwi	%cr7, %r5, 0
	blt %cr7, bge_else.927
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.928
bge_else.927:
	neg	%r7, %r5
bge_cont.928:
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r8, %r0, (mul_sub.856)@h	# lis
	addi	%r8, %r8, (mul_sub.856)@l
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
	srawi	%r5, %r5, 31 # swap srwi
	lwz	%r6, 0(%r3)
	srawi	%r6, %r6, 31 # swap srwi
	xor	%r5, %r5, %r6
	cmpwi	%cr7, %r5, 0
	bne %cr7, beq_else.929
	blr
beq_else.929:
	neg	%r2, %r2
	blr
div_sub.822:
	cmpwi	%cr7, %r7, -1
	bne %cr7, beq_else.930
	blr
beq_else.930:
	srw	%r5, %r8, %r7 # swap
	cmp	%cr7, %r6, %r8
	bgt %cr7, ble_else.931
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7 # swap
	add	%r2, %r8, %r2
	slw	%r6, %r8, %r7 # swap
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.822
ble_else.931:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.822
div.381:
	cmpwi	%cr7, %r2, 0
	blt %cr7, bge_else.932
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.933
bge_else.932:
	neg	%r6, %r2
bge_cont.933:
	cmpwi	%cr7, %r5, 0
	blt %cr7, bge_else.934
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.935
bge_else.934:
	neg	%r7, %r5
bge_cont.935:
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
	bl	div_sub.822
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	lwz	%r5, 4(%r3)
	srawi	%r5, %r5, 31 # swap srwi
	lwz	%r6, 0(%r3)
	srawi	%r6, %r6, 31 # swap srwi
	xor	%r5, %r5, %r6
	cmpwi	%cr7, %r5, 0
	bne %cr7, beq_else.936
	blr
beq_else.936:
	neg	%r2, %r2
	blr
print_int_sub.802:
	cmpwi	%cr7, %r2, 10
	blt %cr7, bge_else.937
	addi	%r5, %r0, 10	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.381
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int_sub.802
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.381
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	mul.378
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	subf	%r2, %r2, %r5	# sub	%r2, %r5, %r2
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
bge_else.937:
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
print_int.386:
	cmpwi	%cr7, %r2, 0
	blt %cr7, bge_else.940
	b	print_int_sub.802
bge_else.940:
	addi	%r5, %r0, 45	# li
	out	%r5, 0
	neg	%r2, %r2
	b	print_int_sub.802
getx.449:
	lfs	%f0, 0(%r2)	# float
	blr
gety.451:
	lfs	%f0, 8(%r2)	# float
	blr
getz.453:
	lfs	%f0, 16(%r2)	# float
	blr
inprod.455:
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	getx.449
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	stfs	%f0, 8(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	getx.449
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 8(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 0(%r3)
	stfs	%f0, 16(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	gety.451
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	stfs	%f0, 24(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	gety.451
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 24(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 16(%r3)	# float
	fadd	%f0, %f1, %f0
	lwz	%r2, 0(%r3)
	stfs	%f0, 32(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	getz.453
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	stfs	%f0, 40(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	getz.453
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 40(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 32(%r3)	# float
	fadd	%f0, %f1, %f0
	blr
_min_caml_start: # main entry point
#	main program starts
	addis	%r31, %r0, (l.888)@h	# lis
	addi	%r31, %r31, (l.888)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.889)@h	# lis
	addi	%r31, %r31, (l.889)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.890)@h	# lis
	addi	%r31, %r31, (l.890)@l
	lfs	%f2, 0(%r31)	# float
	addis	%r31, %r0, (l.891)@h	# lis
	addi	%r31, %r31, (l.891)@l
	lfs	%f3, 0(%r31)	# float
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 24
	stfs	%f3, 16(%r2)	# float
	stfs	%f2, 8(%r2)	# float
	stfs	%f1, 0(%r2)	# float
	addis	%r31, %r0, (l.896)@h	# lis
	addi	%r31, %r31, (l.896)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.897)@h	# lis
	addi	%r31, %r31, (l.897)@l
	lfs	%f2, 0(%r31)	# float
	addis	%r31, %r0, (l.898)@h	# lis
	addi	%r31, %r31, (l.898)@l
	lfs	%f3, 0(%r31)	# float
	or	%r4, %r5, %r4	# mr %r5, %r4
	addi	%r4, %r4, 24
	stfs	%f3, 16(%r5)	# float
	stfs	%f2, 8(%r5)	# float
	stfs	%f1, 0(%r5)	# float
	stfs	%f0, 0(%r3)	# float
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	inprod.455
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lfs	%f1, 0(%r3)	# float
	fmul	%f0, %f1, %f0
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_truncate
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	print_int.386
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
