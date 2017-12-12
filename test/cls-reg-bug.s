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
	b	create_array_exit
create_array_exit:
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
	.text
	.globl _min_caml_start
	.align 2
mul_sub.859:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.924
	blr
beq_else.924:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r5 # swap
	and	%r6, %r6, %r8
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.925
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.925:
	slw	%r7, %r6, %r5 # swap
	add	%r2, %r2, %r6
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
mul.381:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.926
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.927
bge_else.926:
	neg	%r6, %r2
bge_cont.927:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.928
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.929
bge_else.928:
	neg	%r7, %r5
bge_cont.929:
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r8, %r0, (mul_sub.859)@h	# lis
	ori	%r8, %r8, (mul_sub.859)@l
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
	bne	%cr7, beq_else.930
	blr
beq_else.930:
	neg	%r2, %r2
	blr
div_sub.825:
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.931
	blr
beq_else.931:
	srw	%r5, %r8, %r7 # swap
	cmp	%cr7, %r6, %r8
	bgt	%cr7, ble_else.932
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7 # swap
	add	%r2, %r8, %r2
	slw	%r6, %r8, %r7 # swap
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.825
ble_else.932:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.825
div.384:
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
	bl	div_sub.825
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
print_newline.387:
	addi	%r2, %r0, 10	# li
	out	%r2, 0
	blr
print_int_sub.805:
	cmpwi	%cr7, %r2, 10
	blt	%cr7, bge_else.939
	addi	%r5, %r0, 10	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.384
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int_sub.805
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.384
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	mul.381
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	subf	%r2, %r2, %r5	# sub	%r2, %r5, %r2
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
bge_else.939:
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
print_int.389:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.942
	b	print_int_sub.805
bge_else.942:
	addi	%r5, %r0, 45	# li
	out	%r5, 0
	neg	%r2, %r2
	b	print_int_sub.805
g.478:
	lwz	%r5, 40(%r29)
	lwz	%r6, 36(%r29)
	lwz	%r7, 32(%r29)
	lwz	%r8, 28(%r29)
	lwz	%r9, 24(%r29)
	lwz	%r10, 20(%r29)
	lwz	%r11, 16(%r29)
	lwz	%r12, 12(%r29)
	lwz	%r13, 8(%r29)
	lwz	%r14, 4(%r29)
	add	%r12, %r14, %r12
	add	%r11, %r12, %r11
	add	%r10, %r11, %r10
	add	%r9, %r10, %r9
	add	%r8, %r9, %r8
	add	%r7, %r8, %r7
	add	%r6, %r7, %r6
	add	%r5, %r6, %r5
	add	%r5, %r5, %r13
	cmpwi	%cr7, %r2, 0
	bgt	%cr7, ble_else.943
	neg	%r2, %r2
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
ble_else.943:
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
h.452:
	lwz	%r5, 36(%r2)
	lwz	%r6, 32(%r2)
	lwz	%r7, 28(%r2)
	lwz	%r8, 24(%r2)
	lwz	%r9, 20(%r2)
	lwz	%r10, 16(%r2)
	lwz	%r11, 12(%r2)
	lwz	%r12, 8(%r2)
	lwz	%r13, 4(%r2)
	lwz	%r2, 0(%r2)
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 48
	addis	%r14, %r0, (g.478)@h	# lis
	ori	%r14, %r14, (g.478)@l
	stw	%r14, 0(%r29)
	stw	%r6, 40(%r29)
	stw	%r7, 36(%r29)
	stw	%r8, 32(%r29)
	stw	%r9, 28(%r29)
	stw	%r10, 24(%r29)
	stw	%r11, 20(%r29)
	stw	%r12, 16(%r29)
	stw	%r13, 12(%r29)
	stw	%r5, 8(%r29)
	stw	%r2, 4(%r29)
	addi	%r2, %r0, 1	# li
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
_min_caml_start: # main entry point
#	main program starts
	addi	%r2, %r0, 1	# li
	addi	%r5, %r0, 2	# li
	addi	%r6, %r0, 3	# li
	addi	%r7, %r0, 4	# li
	addi	%r8, %r0, 5	# li
	addi	%r9, %r0, 6	# li
	addi	%r10, %r0, 7	# li
	addi	%r11, %r0, 8	# li
	addi	%r12, %r0, 9	# li
	addi	%r13, %r0, 10	# li
	or	%r4, %r14, %r4	# mr %r14, %r4
	addi	%r4, %r4, 40
	stw	%r13, 36(%r14)
	stw	%r12, 32(%r14)
	stw	%r11, 28(%r14)
	stw	%r10, 24(%r14)
	stw	%r9, 20(%r14)
	stw	%r8, 16(%r14)
	stw	%r7, 12(%r14)
	stw	%r6, 8(%r14)
	stw	%r5, 4(%r14)
	stw	%r2, 0(%r14)
	or	%r14, %r2, %r14	# mr %r2, %r14
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	h.452
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int.389
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_newline.387
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	sc
