	.text
	.globl _min_caml_start
	.align 2
g.52:
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
	cmp	%cr7, 0, %r2, 0	# cmpwi
	bc	0100, %cr7, ble_else.90
	neg	%r2, %r2
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
ble_else.90:
	or	%r5, %r2, %r5	# mr %r2, %r5
	bclr	20, %cr0	# blr
h.26:
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
	addis	%r14, %r0, ha16(g.52)	# lis
	addi	%r14, %r14, lo16(g.52)
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
	li	%r2, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
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
	li	%r8, 5
	li	%r9, 6
	li	%r10, 7
	li	%r11, 8
	li	%r12, 9
	li	%r13, 10
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
	bl	h.26
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
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_print_newline
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	lwz	%r1, 0(%r1)
	lwz	%r0, 8(%r1)
	mtspr	8, %r0	# mtlr
	lmw	%r30, -8(%r1)
	bclr	20, %cr0	# blr