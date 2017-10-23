	.text
	.globl _min_caml_start
	.align 2
f.43:
	add	%r8, %r2, %r5
	add	%r9, %r2, %r6
	add	%r2, %r2, %r7
	add	%r10, %r5, %r6
	add	%r5, %r5, %r7
	add	%r11, %r6, %r7
	add	%r12, %r8, %r9
	add	%r13, %r8, %r2
	add	%r14, %r8, %r10
	add	%r15, %r8, %r5
	add	%r16, %r8, %r11
	add	%r17, %r9, %r2
	add	%r18, %r9, %r10
	add	%r19, %r9, %r5
	add	%r20, %r9, %r11
	add	%r21, %r2, %r10
	add	%r22, %r2, %r5
	add	%r23, %r2, %r11
	add	%r24, %r10, %r5
	add	%r25, %r10, %r11
	add	%r26, %r5, %r11
	add	%r27, %r12, %r13
	add	%r28, %r12, %r14
	add	%r29, %r12, %r15
	add	%r30, %r12, %r16
	stw	%r30, 0(%r3)
	add	%r30, %r12, %r17
	stw	%r30, 4(%r3)
	add	%r30, %r12, %r18
	stw	%r30, 8(%r3)
	add	%r30, %r12, %r19
	stw	%r30, 12(%r3)
	add	%r30, %r12, %r20
	stw	%r30, 16(%r3)
	add	%r30, %r12, %r21
	stw	%r30, 20(%r3)
	add	%r30, %r12, %r22
	stw	%r30, 24(%r3)
	add	%r30, %r12, %r23
	stw	%r30, 28(%r3)
	add	%r30, %r12, %r24
	stw	%r30, 32(%r3)
	add	%r30, %r12, %r25
	stw	%r30, 36(%r3)
	add	%r30, %r12, %r26
	add	%r6, %r8, %r6
	add	%r6, %r6, %r7
	add	%r6, %r6, %r8
	add	%r6, %r6, %r9
	add	%r2, %r6, %r2
	add	%r2, %r2, %r10
	add	%r2, %r2, %r5
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
	add	%r2, %r2, %r30
	neg	%r2, %r2
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	li	%r2, 1
	li	%r5, 2
	li	%r6, 3
	li	%r7, 4
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	f.43
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
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
