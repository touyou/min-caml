	.text
	.globl _min_caml_start
	.align 2
composed.22:
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
compose.7:
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 16
	addis	%r7, %r0, ha16(composed.22)	# lis
	addi	%r7, %r7, lo16(composed.22)
	stw	%r7, 0(%r6)
	stw	%r5, 8(%r6)
	stw	%r2, 4(%r6)
	or	%r6, %r2, %r6	# mr %r2, %r6
	bclr	20, %cr0	# blr
dbl.10:
	add	%r2, %r2, %r2
	bclr	20, %cr0	# blr
inc.12:
	addi	%r2, %r2, 1
	bclr	20, %cr0	# blr
dec.14:
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 8
	addis	%r5, %r0, ha16(dbl.10)	# lis
	addi	%r5, %r5, lo16(dbl.10)
	stw	%r5, 0(%r2)
	or	%r4, %r5, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	addis	%r6, %r0, ha16(inc.12)	# lis
	addi	%r6, %r6, lo16(inc.12)
	stw	%r6, 0(%r5)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r7, %r0, ha16(dec.14)	# lis
	addi	%r7, %r7, lo16(dec.14)
	stw	%r7, 0(%r6)
	stw	%r5, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	compose.7
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	compose.7
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
