	.data
	.literal8
	.align 3
l.30:	 # -7.890000
	.long	687194767
	.long	-1071673508
	.align 3
l.29:	 # 4.560000
	.long	-1546188227
	.long	1074937200
	.align 3
l.28:	 # 1.230000
	.long	2061584302
	.long	1072934420
	.text
	.globl _min_caml_start
	.align 2
_min_caml_start: # main entry point
	mfspr	%r0, 8	# mflr
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	addis	%r31, %r0, ha16(l.28)	# lis
	addi	%r31, %r31, lo16(l.28)
	lfd	%f0, 0(%r31)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_truncate
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, ha16(l.29)	# lis
	addi	%r31, %r31, lo16(l.29)
	lfd	%f0, 0(%r31)
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_truncate
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, ha16(l.30)	# lis
	addi	%r31, %r31, lo16(l.30)
	lfd	%f0, 0(%r31)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_truncate
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmp	%cr7, 0, %r2, 0	# cmpwi
	bc	1000, %cr7, bge_else.34
	lwz	%r5, 0(%r3)
	b	bge_cont.35
bge_else.34:
	lwz	%r5, 4(%r3)
bge_cont.35:
	lwz	%r6, 0(%r3)
	cmp	%cr7, 0, %r6, 0	# cmpwi
	bc	0100, %cr7, ble_else.36
	lwz	%r7, 4(%r3)
	b	ble_cont.37
ble_else.36:
	or	%r2, %r7, %r2	# mr %r7, %r2
ble_cont.37:
	add	%r5, %r5, %r7
	lwz	%r7, 4(%r3)
	cmp	%cr7, 0, %r7, 0	# cmpwi
	bc	1000, %cr7, bge_else.38
	b	bge_cont.39
bge_else.38:
	or	%r6, %r2, %r6	# mr %r2, %r6
bge_cont.39:
	add	%r2, %r5, %r2
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_print_int
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
	lwz	%r1, 0(%r1)
	lwz	%r0, 8(%r1)
	mtspr	8, %r0	# mtlr
	lmw	%r30, -8(%r1)
	bclr	20, %cr0	# blr
