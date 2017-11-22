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
print_int.12:
	out	%r2, 0
	bclr	20, %cr0	# blr
foo.14:
	stw	%r9, 0(%r3)
	stw	%r8, 4(%r3)
	stw	%r7, 8(%r3)
	stw	%r6, 12(%r3)
	stw	%r5, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	print_int.12
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 16(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	print_int.12
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	print_int.12
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	print_int.12
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	print_int.12
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 0(%r3)
	b	print_int.12
bar.21:
	or	%r9, %r28, %r9	# mr %r28, %r9
	or	%r6, %r9, %r6	# mr %r9, %r6
	or	%r7, %r6, %r7	# mr %r6, %r7
	or	%r8, %r7, %r8	# mr %r7, %r8
	or	%r28, %r8, %r28	# mr %r8, %r28
	or	%r5, %r28, %r5	# mr %r28, %r5
	or	%r2, %r5, %r2	# mr %r5, %r2
	or	%r28, %r2, %r28	# mr %r2, %r28
	b	foo.14
_min_caml_start: # main entry point
#	main program starts
	addi	%r2, %r0, 1	# li
	addi	%r5, %r0, 2	# li
	addi	%r6, %r0, 3	# li
	addi	%r7, %r0, 4	# li
	addi	%r8, %r0, 5	# li
	addi	%r9, %r0, 6	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	bar.21
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
