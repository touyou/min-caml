	.text
	.globl _min_caml_start
	.align 2
f.6:
	addi	%r2, %r2, 123
	bclr	20, %cr0	# blr
g.8:
	lwz	%r2, 4(%r29)
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 8
	addis	%r5, %r0, ha16(f.6)	# lis
	addi	%r5, %r5, lo16(f.6)
	stw	%r5, 0(%r2)
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 8
	addis	%r5, %r0, ha16(g.8)	# lis
	addi	%r5, %r5, lo16(g.8)
	stw	%r5, 0(%r29)
	stw	%r2, 4(%r29)
	addi	%r2, %r0, 456	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	or	%r2, %r29, %r2	# mr %r29, %r2
	mtspr	8, %r31	# mtlr
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
