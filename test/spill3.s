	.text
	.globl _min_caml_start
	.align 2
f.56:
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
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	addi	%r2, %r0, 0	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	f.56
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
