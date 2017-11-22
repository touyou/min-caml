	.globl _start
	.text
_start:
# 0x000000 | code & data seg |
# 0x010000 | stack       seg |
# 0x180000 | heap        seg |
	lis	%r3, 0x0001	# sp
	lis	%r4, 0x0018	# hp
	b	_min_caml_start
#	create_array
	.text
	.align	2
	.globl	min_caml_create_array
min_caml_create_array:
	or  %r2, %r6, %r2  # mr	%r6, %r2
	or  %r4, %r2, %r4  # mr	%r2, %r4
create_array_loop:
	cmpwi	%cr7, %r6, 0
	bc  12, %cr7, create_array_cont  # bne	%cr7, create_array_cont
	b	create_array_exit
create_array_exit:
	blr
create_array_cont:
	stw	  %r5, 0(%r4)
	addi  %r6, %r6, -1  # subi  %r6, %r6, 1
	addi	%r4, %r4, 4
	b	create_array_loop
#	create_float_array
	.globl	min_caml_create_float_array
min_caml_create_float_array:
	or  %r2, %r5, %r2  # mr	%r5, %r2
	or  %r4, %r2, %r4  # mr	%r2, %r4
create_float_array_loop:
	cmpwi	%cr7, %r5, 0
	bc  12, %cr7, create_float_array_cont # bne	%cr7, create_float_array_cont
	blr
create_float_array_cont:
	stfd	%f0, 0(%r4)
	addi  %r5, %r5, -1  # subi	%r5, %r5, 1
	addi	%r4, %r4, 8
	b	create_float_array_loop
	.data
	.literal8
	.align 3
l.32:	 # -7.890000
	.long	687194767
	.long	-1071673508
	.align 3
l.31:	 # 4.560000
	.long	-1546188227
	.long	1074937200
	.align 3
l.30:	 # 1.230000
	.long	2061584302
	.long	1072934420
	.text
	.globl _min_caml_start
	.align 2
print_int.13:
	out	%r2, 0
	blr
_min_caml_start: # main entry point
#	main program starts
	addis	%r31, %r0, ha16(l.30)	# lis
	addi	%r31, %r31, lo16(l.30)
	lfd	%f0, 0(%r31)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_truncate
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, ha16(l.31)	# lis
	addi	%r31, %r31, lo16(l.31)
	lfd	%f0, 0(%r31)
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_truncate
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r31, %r0, ha16(l.32)	# lis
	addi	%r31, %r31, lo16(l.32)
	lfd	%f0, 0(%r31)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_truncate
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.38
	lwz	%r5, 0(%r3)
	b	bge_cont.39
bge_else.38:
	lwz	%r5, 4(%r3)
bge_cont.39:
	lwz	%r6, 0(%r3)
	cmpwi	%cr7, %r6, 0	
	bc	4, %cr7, ble_else.40
	lwz	%r7, 4(%r3)
	b	ble_cont.41
ble_else.40:
	or	%r2, %r7, %r2	# mr %r7, %r2
ble_cont.41:
	add	%r5, %r5, %r7
	lwz	%r7, 4(%r3)
	cmpwi	%cr7, %r7, 0
	bc	8, %cr7, bge_else.42
	b	bge_cont.43
bge_else.42:
	or	%r6, %r2, %r6	# mr %r2, %r6
bge_cont.43:
	add	%r2, %r5, %r2
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	print_int.13
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
