	.text
	.globl _min_caml_start
	.align 2
adder.11:
	lwz	%r5, 4(%r29)
	add	%r2, %r5, %r2
	blr
make_adder.5:
	or	%r4, %r5, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	addis	%r6, %r0, ha16(adder.11)	# lis
	addi	%r6, %r6, lo16(adder.11)
	stw	%r6, 0(%r5)
	stw	%r2, 4(%r5)
	or	%r5, %r2, %r5	# mr %r2, %r5
	blr
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	li	%r2, 3
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	make_adder.5
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	or	%r2, %r29, %r2	# mr %r29, %r2
	mtspr	8, %r31	# mtlr
	li	%r2, 7
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
	blr
