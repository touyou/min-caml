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
f.14:
	addi	%r2, %r0, 123	# li
	bclr	20, %cr0	# blr
g.16:
	addi	%r2, %r0, 456	# li
	bclr	20, %cr0	# blr
h.18:
	addi	%r2, %r0, 789	# li
	bclr	20, %cr0	# blr
_min_caml_start: # main entry point
#	main program starts
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	f.14
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	g.16
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	h.18
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	cmpi	%cr7, 0, %r2, 0	# cmpwi
	bc	12, %cr7, beq_else.35
	lwz	%r2, 4(%r3)
	lwz	%r5, 0(%r3)
	subf %r2, %r2, %r5	# sub	%r2, %r5, %r2
	b	beq_cont.36
beq_else.35:
	lwz	%r2, 0(%r3)
	lwz	%r5, 4(%r3)
	subf %r2, %r2, %r5	# sub	%r2, %r5, %r2
beq_cont.36:
	lwz	%r5, 0(%r3)
	add	%r2, %r2, %r5
	lwz	%r5, 4(%r3)
	add	%r2, %r2, %r5
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	print_int.12
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
