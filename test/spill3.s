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
print_int.56:
	out	%r2, 0
	bclr	20, %cr0	# blr
f.58:
	addi	%r5, %r2, 1
	addi	%r6, %r5, 1
	addi	%r7, %r6, 1
	addi	%r8, %r7, 1
	addi	%r9, %r8, 1
	addi	%r10, %r9, 1
	addi	%r11, %r10, 1
	addi	%r12, %r11, 1
	addi	%r13, %r12, 1
	addi	%r14, %r13, 1
	addi	%r15, %r14, 1
	addi	%r16, %r15, 1
	addi	%r17, %r16, 1
	addi	%r18, %r17, 1
	addi	%r19, %r18, 1
	addi	%r20, %r19, 1
	addi	%r21, %r20, 1
	addi	%r22, %r21, 1
	add	%r23, %r22, %r5
	add	%r24, %r23, %r6
	add	%r25, %r24, %r7
	add	%r26, %r25, %r8
	add	%r27, %r26, %r9
	add	%r28, %r27, %r10
	add	%r29, %r28, %r11
	add	%r30, %r29, %r12
	stw	%r30, 0(%r3)
	add	%r30, %r30, %r13
	stw	%r30, 4(%r3)
	add	%r30, %r30, %r14
	stw	%r30, 8(%r3)
	add	%r30, %r30, %r15
	stw	%r30, 12(%r3)
	add	%r30, %r30, %r16
	stw	%r30, 16(%r3)
	add	%r30, %r30, %r17
	stw	%r30, 20(%r3)
	add	%r30, %r30, %r18
	stw	%r30, 24(%r3)
	add	%r30, %r30, %r19
	stw	%r30, 28(%r3)
	add	%r30, %r30, %r20
	stw	%r30, 32(%r3)
	add	%r30, %r30, %r21
	stw	%r2, 36(%r3)
	add	%r2, %r30, %r2
	add	%r5, %r5, %r6
	add	%r5, %r5, %r7
	add	%r5, %r5, %r8
	add	%r5, %r5, %r9
	add	%r5, %r5, %r10
	add	%r5, %r5, %r11
	add	%r5, %r5, %r12
	add	%r5, %r5, %r13
	add	%r5, %r5, %r14
	add	%r5, %r5, %r15
	add	%r5, %r5, %r16
	add	%r5, %r5, %r17
	add	%r5, %r5, %r18
	add	%r5, %r5, %r19
	add	%r5, %r5, %r20
	add	%r5, %r5, %r21
	add	%r5, %r5, %r22
	add	%r5, %r5, %r23
	add	%r5, %r5, %r24
	add	%r5, %r5, %r25
	add	%r5, %r5, %r26
	add	%r5, %r5, %r27
	add	%r5, %r5, %r28
	add	%r5, %r5, %r29
	lwz	%r6, 0(%r3)
	add	%r5, %r5, %r6
	lwz	%r6, 4(%r3)
	add	%r5, %r5, %r6
	lwz	%r6, 8(%r3)
	add	%r5, %r5, %r6
	lwz	%r6, 12(%r3)
	add	%r5, %r5, %r6
	lwz	%r6, 16(%r3)
	add	%r5, %r5, %r6
	lwz	%r6, 20(%r3)
	add	%r5, %r5, %r6
	lwz	%r6, 24(%r3)
	add	%r5, %r5, %r6
	lwz	%r6, 28(%r3)
	add	%r5, %r5, %r6
	lwz	%r6, 32(%r3)
	add	%r5, %r5, %r6
	add	%r5, %r5, %r30
	add	%r2, %r5, %r2
	lwz	%r5, 36(%r3)
	add	%r2, %r2, %r5
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
#	main program starts
	addi	%r2, %r0, 0	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	f.58
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int.56
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
