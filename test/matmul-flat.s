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
l.1189:	 # 12.000000
	.long	0
	.long	1094713344
	.align 3
l.1186:	 # 11.000000
	.long	0
	.long	1093664768
	.align 3
l.1183:	 # 10.000000
	.long	0
	.long	1092616192
	.align 3
l.1180:	 # 9.000000
	.long	0
	.long	1091567616
	.align 3
l.1177:	 # 8.000000
	.long	0
	.long	1090519040
	.align 3
l.1174:	 # 7.000000
	.long	0
	.long	1088421888
	.align 3
l.1171:	 # 6.000000
	.long	0
	.long	1086324736
	.align 3
l.1168:	 # 5.000000
	.long	0
	.long	1084227584
	.align 3
l.1165:	 # 4.000000
	.long	0
	.long	1082130432
	.align 3
l.1162:	 # 3.000000
	.long	0
	.long	1077936128
	.align 3
l.1159:	 # 2.000000
	.long	0
	.long	1073741824
	.align 3
l.1156:	 # 1.000000
	.long	0
	.long	1065353216
	.align 3
l.1153:	 # 0.000000
	.long	0
	.long	0
	.text
	.globl _min_caml_start
	.align 2
mul_sub.1113:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r5, -1
	bc	12, %cr7, beq_else.1240
	blr
beq_else.1240:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r5
	and	%r6, %r6, %r8
	cmpwi	%cr7, %r6, 0
	bc	12, %cr7, beq_else.1241
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
beq_else.1241:
	slw	%r6, %r7, %r5
	add	%r2, %r2, %r6
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtspr	9, %r28	# mtctr
	bctr
mul.495:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.1242
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.1243
bge_else.1242:
	neg	%r6, %r2
bge_cont.1243:
	cmpwi	%cr7, %r5, 0
	bc	8, %cr7, bge_else.1244
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.1245
bge_else.1244:
	neg	%r7, %r5
bge_cont.1245:
	or	%r4, %r29, %r4	# mr %r29, %r4
	addi	%r4, %r4, 16
	addis	%r8, %r0, ha16(mul_sub.1113)	# lis
	addi	%r8, %r8, lo16(mul_sub.1113)
	stw	%r8, 0(%r29)
	stw	%r7, 8(%r29)
	stw	%r6, 4(%r29)
	addi	%r6, %r0, 0	# li
	addi	%r7, %r0, 30	# li
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r7, %r5, %r7	# mr %r5, %r7
	or	%r6, %r2, %r6	# mr %r2, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	lwz	%r31, 0(%r29)
	mtspr	9, %r31	#mtctr
	bctrl
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	lwz	%r5, 4(%r3)
	srwi	%r5, %r5, 31
	lwz	%r6, 0(%r3)
	srwi	%r6, %r6, 31
	xor	%r5, %r5, %r6
	cmpwi	%cr7, %r5, 0
	bc	12, %cr7, beq_else.1246
	blr
beq_else.1246:
	neg	%r2, %r2
	blr
div_sub.1079:
	cmpwi	%cr7, %r7, -1
	bc	12, %cr7, beq_else.1247
	blr
beq_else.1247:
	srw	%r8, %r5, %r7
	cmp	%cr7, %r6, %r8
	bc	4, %cr7, ble_else.1248
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7
	add	%r2, %r8, %r2
	slw	%r8, %r6, %r7
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.1079
ble_else.1248:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.1079
div.498:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.1249
	or	%r2, %r6, %r2	# mr %r6, %r2
	b	bge_cont.1250
bge_else.1249:
	neg	%r6, %r2
bge_cont.1250:
	cmpwi	%cr7, %r5, 0
	bc	8, %cr7, bge_else.1251
	or	%r5, %r7, %r5	# mr %r7, %r5
	b	bge_cont.1252
bge_else.1251:
	neg	%r7, %r5
bge_cont.1252:
	addi	%r8, %r0, 0	# li
	addi	%r9, %r0, 30	# li
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	or	%r8, %r2, %r8	# mr %r2, %r8
	or	%r7, %r6, %r7	# mr %r6, %r7
	or	%r9, %r7, %r9	# mr %r7, %r9
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	div_sub.1079
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	lwz	%r5, 4(%r3)
	srwi	%r5, %r5, 31
	lwz	%r6, 0(%r3)
	srwi	%r6, %r6, 31
	xor	%r5, %r5, %r6
	cmpwi	%cr7, %r5, 0
	bc	12, %cr7, beq_else.1253
	blr
beq_else.1253:
	neg	%r2, %r2
	blr
print_newline.501:
	addi	%r2, %r0, 10	# li
	out	%r2, 0
	blr
print_int_sub.1059:
	cmpwi	%cr7, %r2, 10
	bc	8, %cr7, bge_else.1255
	addi	%r5, %r0, 10	# li
	stw	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.498
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int_sub.1059
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	lwz	%r2, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.498
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 10	# li
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	mul.495
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 0(%r3)
	subf	%r2, %r2, %r5	# sub	%r2, %r5, %r2
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
bge_else.1255:
	addi	%r2, %r2, 48
	out	%r2, 0
	blr
print_int.503:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.1258
	b	print_int_sub.1059
bge_else.1258:
	addi	%r5, %r0, 45	# li
	out	%r5, 0
	neg	%r2, %r2
	b	print_int_sub.1059
loop3.566:
	cmpwi	%cr7, %r5, 0
	bc	8, %cr7, bge_else.1259
	slwi	%r10, %r2, 2
	lwzx	%r10, %r9, %r10
	slwi	%r11, %r2, 2
	lwzx	%r11, %r9, %r11
	slwi	%r12, %r6, 3
	lfdx	%f0, %r11, %r12
	slwi	%r11, %r2, 2
	lwzx	%r11, %r7, %r11
	slwi	%r12, %r5, 3
	lfdx	%f1, %r11, %r12
	slwi	%r11, %r5, 2
	lwzx	%r11, %r8, %r11
	slwi	%r12, %r6, 3
	lfdx	%f2, %r11, %r12
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	slwi	%r11, %r6, 3
	stfdx	%f0, %r10, %r11
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	b	loop3.566
bge_else.1259:
	blr
loop2.573:
	cmpwi	%cr7, %r6, 0
	bc	8, %cr7, bge_else.1261
	addi	%r10, %r5, -1	# subi %r10, %r5, 1
	stw	%r9, 0(%r3)
	stw	%r8, 4(%r3)
	stw	%r7, 8(%r3)
	stw	%r5, 12(%r3)
	stw	%r2, 16(%r3)
	stw	%r6, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r10, %r5, %r10	# mr %r5, %r10
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	loop3.566
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 20(%r3)
	addi	%r6, %r2, -1	# subi %r6, %r2, 1
	lwz	%r2, 16(%r3)
	lwz	%r5, 12(%r3)
	lwz	%r7, 8(%r3)
	lwz	%r8, 4(%r3)
	lwz	%r9, 0(%r3)
	b	loop2.573
bge_else.1261:
	blr
loop1.580:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.1263
	addi	%r10, %r6, -1	# subi %r10, %r6, 1
	stw	%r9, 0(%r3)
	stw	%r8, 4(%r3)
	stw	%r7, 8(%r3)
	stw	%r6, 12(%r3)
	stw	%r5, 16(%r3)
	stw	%r2, 20(%r3)
	mfspr	%r31, 8	# mflr
	or	%r10, %r6, %r10	# mr %r6, %r10
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	loop2.573
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 20(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lwz	%r5, 16(%r3)
	lwz	%r6, 12(%r3)
	lwz	%r7, 8(%r3)
	lwz	%r8, 4(%r3)
	lwz	%r9, 0(%r3)
	b	loop1.580
bge_else.1263:
	blr
mul.587:
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	b	loop1.580
init.595:
	cmpwi	%cr7, %r2, 0
	bc	8, %cr7, bge_else.1265
	addis	%r31, %r0, ha16(l.1153)	# lis
	addi	%r31, %r31, lo16(l.1153)
	lfd	%f0, 0(%r31)
	stw	%r5, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_float_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r5, 8(%r3)
	slwi	%r6, %r5, 2
	lwz	%r7, 4(%r3)
	stwx	%r2, %r7, %r6
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	lwz	%r5, 0(%r3)
	or	%r7, %r6, %r7	# mr %r6, %r7
	b	init.595
bge_else.1265:
	blr
make.599:
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r6, %r5, %r6	# mr %r5, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	or	%r2, %r6, %r2	# mr %r6, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lwz	%r5, 0(%r3)
	stw	%r6, 8(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	init.595
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 8(%r3)
	blr
_min_caml_start: # main entry point
#	main program starts
	addi	%r2, %r0, 0	# li
	addis	%r31, %r0, ha16(l.1153)	# lis
	addi	%r31, %r31, lo16(l.1153)
	lfd	%f0, 0(%r31)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_float_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	or	%r2, %r6, %r2	# mr %r6, %r2
	mtspr	8, %r31	# mtlr
	addi	%r2, %r0, 2	# li
	addi	%r5, %r0, 3	# li
	stw	%r6, 0(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	make.599
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 3	# li
	addi	%r6, %r0, 2	# li
	lwz	%r7, 0(%r3)
	stw	%r2, 4(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r6, %r5, %r6	# mr %r5, %r6
	or	%r7, %r6, %r7	# mr %r6, %r7
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	make.599
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtspr	8, %r31	# mtlr
	addi	%r5, %r0, 2	# li
	addi	%r6, %r0, 2	# li
	lwz	%r7, 0(%r3)
	stw	%r2, 8(%r3)
	mfspr	%r31, 8	# mflr
	or	%r5, %r2, %r5	# mr %r2, %r5
	or	%r6, %r5, %r6	# mr %r5, %r6
	or	%r7, %r6, %r7	# mr %r6, %r7
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	make.599
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	or	%r2, %r9, %r2	# mr %r9, %r2
	mtspr	8, %r31	# mtlr
	lwz	%r7, 4(%r3)
	lwz	%r2, 0(%r7)
	addis	%r31, %r0, ha16(l.1156)	# lis
	addi	%r31, %r31, lo16(l.1156)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 0(%r7)
	addis	%r31, %r0, ha16(l.1159)	# lis
	addi	%r31, %r31, lo16(l.1159)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 0(%r7)
	addis	%r31, %r0, ha16(l.1162)	# lis
	addi	%r31, %r31, lo16(l.1162)
	lfd	%f0, 0(%r31)
	stfd	%f0, 16(%r2)
	lwz	%r2, 4(%r7)
	addis	%r31, %r0, ha16(l.1165)	# lis
	addi	%r31, %r31, lo16(l.1165)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 4(%r7)
	addis	%r31, %r0, ha16(l.1168)	# lis
	addi	%r31, %r31, lo16(l.1168)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 4(%r7)
	addis	%r31, %r0, ha16(l.1171)	# lis
	addi	%r31, %r31, lo16(l.1171)
	lfd	%f0, 0(%r31)
	stfd	%f0, 16(%r2)
	lwz	%r8, 8(%r3)
	lwz	%r2, 0(%r8)
	addis	%r31, %r0, ha16(l.1174)	# lis
	addi	%r31, %r31, lo16(l.1174)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 0(%r8)
	addis	%r31, %r0, ha16(l.1177)	# lis
	addi	%r31, %r31, lo16(l.1177)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 4(%r8)
	addis	%r31, %r0, ha16(l.1180)	# lis
	addi	%r31, %r31, lo16(l.1180)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 4(%r8)
	addis	%r31, %r0, ha16(l.1183)	# lis
	addi	%r31, %r31, lo16(l.1183)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lwz	%r2, 8(%r8)
	addis	%r31, %r0, ha16(l.1186)	# lis
	addi	%r31, %r31, lo16(l.1186)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lwz	%r2, 8(%r8)
	addis	%r31, %r0, ha16(l.1189)	# lis
	addi	%r31, %r31, lo16(l.1189)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	addi	%r2, %r0, 2	# li
	addi	%r5, %r0, 3	# li
	addi	%r6, %r0, 2	# li
	stw	%r9, 12(%r3)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	mul.587
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	lwz	%r5, 0(%r2)
	lfd	%f0, 0(%r5)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_truncate
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	print_int.503
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	print_newline.501
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	lwz	%r5, 0(%r2)
	lfd	%f0, 8(%r5)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_truncate
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	print_int.503
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	print_newline.501
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	lwz	%r5, 4(%r2)
	lfd	%f0, 0(%r5)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_truncate
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	print_int.503
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	print_newline.501
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	lwz	%r2, 12(%r3)
	lwz	%r2, 4(%r2)
	lfd	%f0, 8(%r2)
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_truncate
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	print_int.503
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
	mfspr	%r31, 8	# mflr
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	print_newline.501
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtspr	8, %r31	# mtlr
#	main program ends
