	.text
	.globl _min_caml_start
	.align 2
fold.8:
	cmpi	%cr7, 0, %r5, 0	# cmpwi
	bc	12, %cr7, beq_else.23
	or	%r2, %r29, %r2	# mr %r29, %r2
	or	%r5, %r2, %r5	# mr %r2, %r5
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.23:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	b	fold.8
fun.1.14:
	addi	%r2, %r2, 1
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 8
	addis	%r5, %r0, ha16(fun.1.14)	# lis
	addi	%r5, %r5, lo16(fun.1.14)
	stw	%r5, 0(%r2)
	addi	%r5, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	fold.8
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
