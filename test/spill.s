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
print_int.43:
	out	%r2, 0
	bclr	20, %cr0	# blr
f.45:
	add	%r8, %r2, %r5
	add	%r9, %r2, %r6
	add	%r10, %r2, %r7
	add	%r11, %r5, %r6
	add	%r12, %r5, %r7
	add	%r13, %r6, %r7
	add	%r14, %r8, %r9
	add	%r15, %r8, %r10
	add	%r16, %r8, %r11
	add	%r17, %r8, %r12
	add	%r18, %r8, %r13
	add	%r19, %r9, %r10
	add	%r20, %r9, %r11
	add	%r21, %r9, %r12
	add	%r22, %r9, %r13
	add	%r23, %r10, %r11
	add	%r24, %r10, %r12
	add	%r25, %r10, %r13
	add	%r26, %r11, %r12
	add	%r27, %r11, %r13
	add	%r28, %r12, %r13
	add	%r29, %r14, %r15
	add	%r30, %r14, %r16
	stw	%r30, 0(%r3)
	add	%r30, %r14, %r17
	stw	%r30, 4(%r3)
	add	%r30, %r14, %r18
	stw	%r30, 8(%r3)
	add	%r30, %r14, %r19
	stw	%r30, 12(%r3)
	add	%r30, %r14, %r20
	stw	%r30, 16(%r3)
	add	%r30, %r14, %r21
	stw	%r30, 20(%r3)
	add	%r30, %r14, %r22
	stw	%r30, 24(%r3)
	add	%r30, %r14, %r23
	stw	%r30, 28(%r3)
	add	%r30, %r14, %r24
	stw	%r30, 32(%r3)
	add	%r30, %r14, %r25
	stw	%r30, 36(%r3)
	add	%r30, %r14, %r26
	stw	%r30, 40(%r3)
	add	%r30, %r14, %r27
	stw	%r30, 44(%r3)
	add	%r30, %r14, %r28
	add	%r2, %r2, %r5
	add	%r2, %r2, %r6
	add	%r2, %r2, %r7
	add	%r2, %r2, %r8
	add	%r2, %r2, %r9
	add	%r2, %r2, %r10
	add	%r2, %r2, %r11
	add	%r2, %r2, %r12
	add	%r2, %r2, %r13
	add	%r2, %r2, %r14
	add	%r2, %r2, %r15
	add	%r2, %r2, %r16
	add	%r2, %r2, %r17
	add	%r2, %r2, %r18
	add	%r2, %r2, %r19
	add	%r2, %r2, %r20
	add	%r2, %r2, %r21
	add	%r2, %r2, %r22
	add	%r2, %r2, %r23
	add	%r2, %r2, %r24
	add	%r2, %r2, %r25
	add	%r2, %r2, %r26
	add	%r2, %r2, %r27
	add	%r2, %r2, %r28
	add	%r2, %r2, %r29
	lwz	%r5, 0(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 4(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 8(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 12(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 16(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 20(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 24(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 28(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 32(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 36(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 40(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 44(%r3)
	add	%r2, %r2, %r5
	add	%r2, %r2, %r30
	neg	%r2, %r2
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
#	main program starts
	addi	%r2, %r0, 1	# li
	addi	%r5, %r0, 2	# li
	addi	%r6, %r0, 3	# li
	addi	%r7, %r0, 4	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	f.45
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int.43
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
