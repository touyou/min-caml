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
	.text
	.globl _min_caml_start
	.align 2
mul_sub.942:
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
mul.411:
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
	addis	%r8, %r0, (mul_sub.942)@h	# lis
	ori	%r8, %r8, (mul_sub.942)@l
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
div_sub.908:
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
	b	div_sub.908
ble_else.1001:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.908
div.414:
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
	bl	div_sub.908
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
print_int_sub.888:
	cmpwi	%cr7, %r2, 10
	blt	%cr7, bge_else.1007
	addi	%r5, %r0, 10	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.414
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int_sub.888
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.414
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	mul.411
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
print_int.419:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.1010
	b	print_int_sub.888
bge_else.1010:
	addi	%r5, %r0, 45	# li
	out	%r5, 0
	neg	%r2, %r2
	b	print_int_sub.888
f.482:
	addi	%r5, %r2, 1
	addi	%r6, %r5, 1
	addi	%r7, %r6, 1
	addi	%r8, %r7, 1
	addi	%r9, %r8, 1
	addi	%r10, %r9, 1
	addi	%r11, %r10, 1
	addi	%r12, %r11, 1
	addi	%r13, %r12, 1
	addi	%r14, %r13, 1
	addi	%r15, %r14, 1
	addi	%r16, %r15, 1
	addi	%r17, %r16, 1
	addi	%r18, %r17, 1
	addi	%r19, %r18, 1
	addi	%r20, %r19, 1
	addi	%r21, %r20, 1
	addi	%r22, %r21, 1
	add	%r23, %r22, %r5
	add	%r24, %r23, %r6
	add	%r25, %r24, %r7
	add	%r26, %r25, %r8
	add	%r27, %r26, %r9
	add	%r28, %r27, %r10
	add	%r29, %r28, %r11
	add	%r30, %r29, %r12
	stw	%r30, 0(%r3)
	add	%r30, %r30, %r13
	stw	%r30, 4(%r3)
	add	%r30, %r30, %r14
	stw	%r30, 8(%r3)
	add	%r30, %r30, %r15
	stw	%r30, 12(%r3)
	add	%r30, %r30, %r16
	stw	%r30, 16(%r3)
	add	%r30, %r30, %r17
	stw	%r30, 20(%r3)
	add	%r30, %r30, %r18
	stw	%r30, 24(%r3)
	add	%r30, %r30, %r19
	stw	%r30, 28(%r3)
	add	%r30, %r30, %r20
	stw	%r30, 32(%r3)
	add	%r30, %r30, %r21
	stw	%r2, 36(%r3)
	add	%r2, %r30, %r2
	add	%r5, %r5, %r6
	add	%r5, %r5, %r7
	add	%r5, %r5, %r8
	add	%r5, %r5, %r9
	add	%r5, %r5, %r10
	add	%r5, %r5, %r11
	add	%r5, %r5, %r12
	add	%r5, %r5, %r13
	add	%r5, %r5, %r14
	add	%r5, %r5, %r15
	add	%r5, %r5, %r16
	add	%r5, %r5, %r17
	add	%r5, %r5, %r18
	add	%r5, %r5, %r19
	add	%r5, %r5, %r20
	add	%r5, %r5, %r21
	add	%r5, %r5, %r22
	add	%r5, %r5, %r23
	add	%r5, %r5, %r24
	add	%r5, %r5, %r25
	add	%r5, %r5, %r26
	add	%r5, %r5, %r27
	add	%r5, %r5, %r28
	add	%r5, %r5, %r29
	lwz	%r6, 0(%r3)
	add	%r5, %r5, %r6
	lwz	%r6, 4(%r3)
	add	%r5, %r5, %r6
	lwz	%r6, 8(%r3)
	add	%r5, %r5, %r6
	lwz	%r6, 12(%r3)
	add	%r5, %r5, %r6
	lwz	%r6, 16(%r3)
	add	%r5, %r5, %r6
	lwz	%r6, 20(%r3)
	add	%r5, %r5, %r6
	lwz	%r6, 24(%r3)
	add	%r5, %r5, %r6
	lwz	%r6, 28(%r3)
	add	%r5, %r5, %r6
	lwz	%r6, 32(%r3)
	add	%r5, %r5, %r6
	add	%r5, %r5, %r30
	add	%r2, %r5, %r2
	lwz	%r5, 36(%r3)
	add	%r2, %r2, %r5
	blr
_min_caml_start: # main entry point
#	main program starts
	addi	%r2, %r0, 0	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	f.482
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int.419
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	sc
