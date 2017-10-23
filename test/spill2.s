	.text
	.globl _min_caml_start
	.align 2
f.26:
	addi	%r2, %r0, 12345	# li
	bclr	20, %cr0	# blr
g.28:
	addi	%r2, %r2, 1
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	addi	%r2, %r0, 10	# li
	addi	%r5, %r0, 1	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	f.26
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, 1	# lis
	ori	%r5, %r5, 2354
	lwz	%r6, 0(%r3)
	lwz	%r7, 0(%r6)
	add	%r8, %r7, %r7
	add	%r9, %r8, %r8
	add	%r10, %r9, %r9
	add	%r11, %r10, %r10
	add	%r12, %r11, %r11
	add	%r13, %r12, %r12
	add	%r14, %r13, %r13
	add	%r15, %r14, %r14
	add	%r16, %r15, %r15
	add	%r17, %r16, %r16
	add	%r18, %r17, %r17
	add	%r19, %r18, %r18
	add	%r20, %r19, %r19
	add	%r21, %r20, %r20
	add	%r22, %r21, %r21
	lwz	%r6, 4(%r6)
	cmp	%cr7, 0, %r6, 0	# cmpwi
	bc	1100, %cr7, beq_else.77
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	g.28
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	b	beq_cont.78
beq_else.77:
	add	%r5, %r7, %r8
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
	add	%r2, %r5, %r2
beq_cont.78:
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_print_int
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	lwz	%r1, 0(%r1)
	lwz	%r0, 8(%r1)
	mtspr	8, %r0	# mtlr
	lmw	%r30, -8(%r1)
	bclr	20, %cr0	# blr
