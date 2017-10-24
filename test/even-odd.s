	.text
	.globl _min_caml_start
	.align 2
odd.21:
	lwz	%r5, 8(%r29)
	lwz	%r29, 4(%r29)
	cmpi	%cr7, 0, %r2, 0	# cmpwi
	bc	4, %cr7, ble_else.44
	cmpi	%cr7, 0, %r2, 0	# cmpwi
	bc	8, %cr7, bge_else.45
	or	%r5, %r2, %r5	# mr %r2, %r5
	bclr	20, %cr0	# blr
bge_else.45:
	addi	%r2, %r2, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
ble_else.44:
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
even.17:
	lwz	%r5, 8(%r29)
	lwz	%r6, 4(%r29)
	or	%r4, %r7, %r4	# mr %r7, %r4
	addi	%r4, %r4, 16
	addis	%r8, %r0, ha16(odd.21)	# lis
	addi	%r8, %r8, lo16(odd.21)
	stw	%r8, 0(%r7)
	stw	%r6, 8(%r7)
	stw	%r29, 4(%r7)
	cmpi	%cr7, 0, %r2, 0	# cmpwi
	bc	4, %cr7, ble_else.46
	cmpi	%cr7, 0, %r2, 0	# cmpwi
	bc	8, %cr7, bge_else.47
	or	%r5, %r2, %r5	# mr %r2, %r5
	bclr	20, %cr0	# blr
bge_else.47:
	addi	%r2, %r2, 1
	or	%r7, %r29, %r7	# mr %r29, %r7
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
ble_else.46:
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	or	%r7, %r29, %r7	# mr %r29, %r7
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	addi	%r2, %r0, 123	# li
	addi	%r5, %r0, 456	# li
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r6, %r0, ha16(even.17)	# lis
	addi	%r6, %r6, lo16(even.17)
	stw	%r6, 0(%r29)
	stw	%r2, 8(%r29)
	stw	%r5, 4(%r29)
	addi	%r2, %r0, 789	# li
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
