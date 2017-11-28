	.globl _start
	.text
_start:
# 0x000000 | code & data seg |
# 0x010000 | stack       seg |
# 0x180000 | heap        seg |
	lis	%r3, 0x0001	# sp
	lis	%r4, 0x0018	# hp
	b	_min_caml_start
#	create_array
	.text
	.align	2
	.globl	min_caml_create_array
min_caml_create_array:
	or  %r2, %r6, %r2  # mr	%r6, %r2
	or  %r4, %r2, %r4  # mr	%r2, %r4
create_array_loop:
	cmpwi	%cr7, %r6, 0
	bc  12, %cr7, create_array_cont  # bne	%cr7, create_array_cont
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
	bc  12, %cr7, create_float_array_cont # bne	%cr7, create_float_array_cont
	blr
create_float_array_cont:
	stfd	%f0, 0(%r4)
	addi  %r5, %r5, -1  # subi	%r5, %r5, 1
	addi	%r4, %r4, 8
	b	create_float_array_loop
	.text
	.globl _min_caml_start
	.align 2
mul_sub.818:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r5, -1
	bc	12, %cr7, beq_else.871
	blr
beq_else.871:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r5
	and	%r6, %r6, %r8
	cmpwi	%cr7, %r6, 0
	bc	12, %cr7, beq_else.872
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.872:
	slw	%r6, %r7, %r5
	add	%r2, %r2, %r6
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
mul.362:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.873
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.874
bge_else.873:
	neg	%r6, %r2
bge_cont.874:
	cmpwi	%cr7, %r5, 0
	bc	8, %cr7, bge_else.875
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.876
bge_else.875:
	neg	%r7, %r5
bge_cont.876:
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r8, %r0, ha16(mul_sub.818)	# lis
	addi	%r8, %r8, lo16(mul_sub.818)
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
	bc	12, %cr7, beq_else.877
	blr
beq_else.877:
	neg	%r2, %r2
	blr
div_sub.784:
	cmpwi	%cr7, %r7, -1
	bc	12, %cr7, beq_else.878
	blr
beq_else.878:
	srw	%r8, %r5, %r7
	cmp	%cr7, %r6, %r8
	bc	4, %cr7, ble_else.879
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7
	add	%r2, %r8, %r2
	slw	%r8, %r6, %r7
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.784
ble_else.879:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.784
div.365:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.880
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.881
bge_else.880:
	neg	%r6, %r2
bge_cont.881:
	cmpwi	%cr7, %r5, 0
	bc	8, %cr7, bge_else.882
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.883
bge_else.882:
	neg	%r7, %r5
bge_cont.883:
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
	bl	div_sub.784
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
	bc	12, %cr7, beq_else.884
	blr
beq_else.884:
	neg	%r2, %r2
	blr
print_int_sub.764:
	cmpwi	%cr7, %r2, 10
	bc	8, %cr7, bge_else.885
	addi	%r5, %r0, 10	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.365
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int_sub.764
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.365
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	mul.362
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	subf	%r2, %r2, %r5	# sub	%r2, %r5, %r2
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
bge_else.885:
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
print_int.370:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.888
	b	print_int_sub.764
bge_else.888:
	addi	%r5, %r0, 45	# li
	out	%r5, 0
	neg	%r2, %r2
	b	print_int_sub.764
composed.448:
	lwz	%r5, 8(%r29)
	lwz	%r29, 4(%r29)
	stw	%r5, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
compose.433:
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 16
	addis	%r7, %r0, ha16(composed.448)	# lis
	addi	%r7, %r7, lo16(composed.448)
	stw	%r7, 0(%r6)
	stw	%r5, 8(%r6)
	stw	%r2, 4(%r6)
	or	%r6, %r2, %r6	# mr %r2, %r6
	blr
dbl.436:
	add	%r2, %r2, %r2
	blr
inc.438:
	addi	%r2, %r2, 1
	blr
dec.440:
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	blr
_min_caml_start: # main entry point
#	main program starts
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 8
	addis	%r5, %r0, ha16(dbl.436)	# lis
	addi	%r5, %r5, lo16(dbl.436)
	stw	%r5, 0(%r2)
	or	%r4, %r5, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	addis	%r6, %r0, ha16(inc.438)	# lis
	addi	%r6, %r6, lo16(inc.438)
	stw	%r6, 0(%r5)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r7, %r0, ha16(dec.440)	# lis
	addi	%r7, %r7, lo16(dec.440)
	stw	%r7, 0(%r6)
	stw	%r5, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	compose.433
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	compose.433
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	or	%r2, %r29, %r2	# mr %r29, %r2
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 123	# li
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
	bl	print_int.370
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
