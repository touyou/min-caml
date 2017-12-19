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
	.text
	.globl _min_caml_start
	.align 2
mul_sub.940:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.993
	blr
beq_else.993:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r5 # swap
	and	%r6, %r6, %r8
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.994
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.994:
	slw	%r7, %r6, %r5 # swap
	add	%r2, %r2, %r6
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
mul.407:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.995
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.996
bge_else.995:
	neg	%r6, %r2
bge_cont.996:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.997
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.998
bge_else.997:
	neg	%r7, %r5
bge_cont.998:
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r8, %r0, (mul_sub.940)@h	# lis
	ori	%r8, %r8, (mul_sub.940)@l
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
	bne	%cr7, beq_else.999
	blr
beq_else.999:
	neg	%r2, %r2
	blr
div_sub.906:
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.1000
	blr
beq_else.1000:
	srw	%r5, %r8, %r7 # swap
	cmp	%cr7, %r6, %r8
	bgt	%cr7, ble_else.1001
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7 # swap
	add	%r2, %r8, %r2
	slw	%r6, %r8, %r7 # swap
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.906
ble_else.1001:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.906
div.410:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.1002
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.1003
bge_else.1002:
	neg	%r6, %r2
bge_cont.1003:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.1004
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.1005
bge_else.1004:
	neg	%r7, %r5
bge_cont.1005:
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
	bl	div_sub.906
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
	bne	%cr7, beq_else.1006
	blr
beq_else.1006:
	neg	%r2, %r2
	blr
print_int_sub.886:
	cmpwi	%cr7, %r2, 10
	blt	%cr7, bge_else.1007
	addi	%r5, %r0, 10	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.410
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int_sub.886
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.410
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	mul.407
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	subf	%r2, %r2, %r5	# sub	%r2, %r5, %r2
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
bge_else.1007:
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
print_int.415:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.1010
	b	print_int_sub.886
bge_else.1010:
	addi	%r5, %r0, 45	# li
	out	%r5, 0
	neg	%r2, %r2
	b	print_int_sub.886
f.480:
	add	%r8, %r2, %r5
	add	%r9, %r2, %r6
	add	%r10, %r2, %r7
	add	%r11, %r5, %r6
	add	%r12, %r5, %r7
	add	%r13, %r6, %r7
	add	%r14, %r8, %r9
	add	%r15, %r8, %r10
	add	%r16, %r8, %r11
	add	%r17, %r8, %r12
	add	%r18, %r8, %r13
	add	%r19, %r9, %r10
	add	%r20, %r9, %r11
	add	%r21, %r9, %r12
	add	%r22, %r9, %r13
	add	%r23, %r10, %r11
	add	%r24, %r10, %r12
	add	%r25, %r10, %r13
	add	%r26, %r11, %r12
	add	%r27, %r11, %r13
	add	%r28, %r12, %r13
	add	%r29, %r14, %r15
	add	%r30, %r14, %r16
	stw	%r30, 0(%r3)
	add	%r30, %r14, %r17
	stw	%r30, 4(%r3)
	add	%r30, %r14, %r18
	stw	%r30, 8(%r3)
	add	%r30, %r14, %r19
	stw	%r30, 12(%r3)
	add	%r30, %r14, %r20
	stw	%r30, 16(%r3)
	add	%r30, %r14, %r21
	stw	%r30, 20(%r3)
	add	%r30, %r14, %r22
	stw	%r30, 24(%r3)
	add	%r30, %r14, %r23
	stw	%r30, 28(%r3)
	add	%r30, %r14, %r24
	stw	%r30, 32(%r3)
	add	%r30, %r14, %r25
	stw	%r30, 36(%r3)
	add	%r30, %r14, %r26
	stw	%r30, 40(%r3)
	add	%r30, %r14, %r27
	stw	%r30, 44(%r3)
	add	%r30, %r14, %r28
	add	%r2, %r2, %r5
	add	%r2, %r2, %r6
	add	%r2, %r2, %r7
	add	%r2, %r2, %r8
	add	%r2, %r2, %r9
	add	%r2, %r2, %r10
	add	%r2, %r2, %r11
	add	%r2, %r2, %r12
	add	%r2, %r2, %r13
	add	%r2, %r2, %r14
	add	%r2, %r2, %r15
	add	%r2, %r2, %r16
	add	%r2, %r2, %r17
	add	%r2, %r2, %r18
	add	%r2, %r2, %r19
	add	%r2, %r2, %r20
	add	%r2, %r2, %r21
	add	%r2, %r2, %r22
	add	%r2, %r2, %r23
	add	%r2, %r2, %r24
	add	%r2, %r2, %r25
	add	%r2, %r2, %r26
	add	%r2, %r2, %r27
	add	%r2, %r2, %r28
	add	%r2, %r2, %r29
	lwz	%r5, 0(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 4(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 8(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 12(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 16(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 20(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 24(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 28(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 32(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 36(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 40(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 44(%r3)
	add	%r2, %r2, %r5
	add	%r2, %r2, %r30
	neg	%r2, %r2
	blr
_min_caml_start: # main entry point
#	main program starts
	addi	%r2, %r0, 1	# li
	addi	%r5, %r0, 2	# li
	addi	%r6, %r0, 3	# li
	addi	%r7, %r0, 4	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	f.480
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int.415
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	sc
