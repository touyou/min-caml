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
print_int.26:
	out	%r2, 0
	bclr	20, %cr0	# blr
g.54:
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
	cmpi	%cr7, 0, %r2, 0	# cmpwi
	bc	4, %cr7, ble_else.94
	neg	%r2, %r2
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
ble_else.94:
	or	%r5, %r2, %r5	# mr %r2, %r5
	bclr	20, %cr0	# blr
h.28:
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
	addis	%r14, %r0, ha16(g.54)	# lis
	addi	%r14, %r14, lo16(g.54)
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
	addi	%r2, %r0, 1	# li
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
_min_caml_start: # main entry point
#	main program starts
	addi	%r2, %r0, 1	# li
	addi	%r5, %r0, 2	# li
	addi	%r6, %r0, 3	# li
	addi	%r7, %r0, 4	# li
	addi	%r8, %r0, 5	# li
	addi	%r9, %r0, 6	# li
	addi	%r10, %r0, 7	# li
	addi	%r11, %r0, 8	# li
	addi	%r12, %r0, 9	# li
	addi	%r13, %r0, 10	# li
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
	bl	h.28
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int.26
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
