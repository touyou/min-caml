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
	.text
	.globl _min_caml_start
	.align 2
print_int.26:
	out	%r2, 0
	blr
f.28:
	addi	%r2, %r0, 12345	# li
	blr
g.30:
	addi	%r2, %r2, 1
	blr
_min_caml_start: # main entry point
#	main program starts
	addi	%r2, %r0, 10	# li
	addi	%r5, %r0, 1	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	f.28
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, 1	# lis
	ori	%r5, %r5, 2354
	lwz	%r6, 0(%r3)
	lwz	%r7, 0(%r6)
	add	%r8, %r7, %r7
	add	%r9, %r8, %r8
	add	%r10, %r9, %r9
	add	%r11, %r10, %r10
	add	%r12, %r11, %r11
	add	%r13, %r12, %r12
	add	%r14, %r13, %r13
	add	%r15, %r14, %r14
	add	%r16, %r15, %r15
	add	%r17, %r16, %r16
	add	%r18, %r17, %r17
	add	%r19, %r18, %r18
	add	%r20, %r19, %r19
	add	%r21, %r20, %r20
	add	%r22, %r21, %r21
	lwz	%r6, 4(%r6)
	cmpwi	%cr7, %r6, 0
	bc	12, %cr7, beq_else.81
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	g.30
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	b	beq_cont.82
beq_else.81:
	add	%r5, %r7, %r8
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
	add	%r2, %r5, %r2
beq_cont.82:
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int.26
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
