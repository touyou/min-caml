	.text
	.globl _min_caml_start
	.align 2
ack.15:
	cmp	%cr7, 0, %r2, 0	# cmpwi
	bc	0100, %cr7, ble_else.34
	addi	%r2, %r5, 1
	bclr	20, %cr0	# blr
ble_else.34:
	cmp	%cr7, 0, %r5, 0	# cmpwi
	bc	0100, %cr7, ble_else.35
	addi	%r5, %r0, 1	# li
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	b	ack.15
ble_else.35:
	addi	%r6, %r2, -1	# subi %r6, %r2, 1
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	stw	%r6, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	ack.15
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	b	ack.15
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	addi	%r2, %r0, 3	# li
	addi	%r5, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	ack.15
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
