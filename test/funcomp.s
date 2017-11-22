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
	cmpi  %cr7, 0, %r6, 0 # cmpwi	%cr7, %r6, 0
	bc  12, %cr7, create_array_cont  # bne	%cr7, create_array_cont
	b	create_array_exit
create_array_exit:
	bclr  20, %cr0     # blr
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
	cmpi  %cr7, 0, %r5, 0  # cmpwi	%cr7, %r5, 0
	bc  12, %cr7, create_float_array_cont # bne	%cr7, create_float_array_cont
	bclr  20, %cr0     # blr
create_float_array_cont:
	stfd	%f0, 0(%r4)
	addi  %r5, %r5, -1  # subi	%r5, %r5, 1
	addi	%r4, %r4, 8
	b	create_float_array_loop
	.text
	.globl _min_caml_start
	.align 2
print_int.7:
	out	%r2, 0
	bclr	20, %cr0	# blr
composed.24:
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
compose.9:
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 16
	addis	%r7, %r0, ha16(composed.24)	# lis
	addi	%r7, %r7, lo16(composed.24)
	stw	%r7, 0(%r6)
	stw	%r5, 8(%r6)
	stw	%r2, 4(%r6)
	or	%r6, %r2, %r6	# mr %r2, %r6
	bclr	20, %cr0	# blr
dbl.12:
	add	%r2, %r2, %r2
	bclr	20, %cr0	# blr
inc.14:
	addi	%r2, %r2, 1
	bclr	20, %cr0	# blr
dec.16:
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
#	main program starts
	or	%r4, %r2, %r4	# mr %r2, %r4
	addi	%r4, %r4, 8
	addis	%r5, %r0, ha16(dbl.12)	# lis
	addi	%r5, %r5, lo16(dbl.12)
	stw	%r5, 0(%r2)
	or	%r4, %r5, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	addis	%r6, %r0, ha16(inc.14)	# lis
	addi	%r6, %r6, lo16(inc.14)
	stw	%r6, 0(%r5)
	or	%r4, %r6, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r7, %r0, ha16(dec.16)	# lis
	addi	%r7, %r7, lo16(dec.16)
	stw	%r7, 0(%r6)
	stw	%r5, 0(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	compose.9
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	or	%r2, %r5, %r2	# mr %r5, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	compose.9
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
	bl	print_int.7
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
