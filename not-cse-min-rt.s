	.globl _start
	.text
_start:
# 0x000000 | code & data seg |
# 0x2_0000 | stack       seg |
# 0x8_0000 | heap        seg |
	lis	%r3, 0x0002	# sp
	lis	%r4, 0x0008	# hp
	b	_min_caml_start
#	create_array
	.text
	.align	2
	.globl	min_caml_create_array
min_caml_create_array:
	or	%r6, %r2, %r2  # mr	%r6, %r2
	or	%r2, %r4, %r4  # mr	%r2, %r4
create_array_loop:
	cmpwi	%cr7, %r6, 0
	bne	%cr7, create_array_cont
	blr
create_array_cont:
	stw	%r5, 0(%r4)
	addi	%r6, %r6, -1  # subi  %r6, %r6, 1
	addi	%r4, %r4, 4
	b	create_array_loop
#	create_float_array
	.globl	min_caml_create_float_array
min_caml_create_float_array:
	or	%r5, %r2, %r2  # mr	%r5, %r2
	or	%r2, %r4, %r4  # mr	%r2, %r4
create_float_array_loop:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, create_float_array_cont
	blr
create_float_array_cont:
	stfs	%f0, 0(%r4)
	addi	%r5, %r5, -1  # subi	%r5, %r5, 1
	addi	%r4, %r4, 4
	b	create_float_array_loop
	.data
	#.literal8
	.align 2
l.20082:	 # 0.000000
	.long	786163454
	.align 2
l.20011:	 # 128.000000
	.long	1124073472
	.align 2
l.19697:	 # 0.900000
	.long	1063675494
	.align 2
l.19050:	 # 150.000000
	.long	1125515264
	.align 2
l.19017:	 # -150.000000
	.long	3272998912
	.align 2
l.18957:	 # 0.100000
	.long	1036831948
	.align 2
l.18904:	 # -2.000000
	.long	3221225472
	.align 2
l.18890:	 # 0.003906
	.long	998244352
	.align 2
l.18808:	 # 20.000000
	.long	1101004800
	.align 2
l.18807:	 # 0.050000
	.long	1028443340
	.align 2
l.18802:	 # 0.250000
	.long	1048576000
	.align 2
l.18798:	 # 10.000000
	.long	1092616192
	.align 2
l.18792:	 # 0.300000
	.long	1050253721
	.align 2
l.18791:	 # 255.000000
	.long	1132396544
	.align 2
l.18790:	 # 0.150000
	.long	1041865113
	.align 2
l.18786:	 # 3.141593
	.long	1078530010
	.align 2
l.18785:	 # 30.000000
	.long	1106247680
	.align 2
l.18784:	 # 15.000000
	.long	1097859072
	.align 2
l.18783:	 # 0.000100
	.long	953267991
	.align 2
l.18749:	 # 100000000.000000
	.long	1287568416
	.align 2
l.18733:	 # 1000000000.000000
	.long	1315859240
	.align 2
l.18560:	 # -0.100000
	.long	3184315596
	.align 2
l.18516:	 # 0.010000
	.long	1008981770
	.align 2
l.18515:	 # -0.200000
	.long	3192704204
	.align 2
l.18131:	 # -200.000000
	.long	3276275712
	.align 2
l.18129:	 # 200.000000
	.long	1128792064
	.align 2
l.18128:	 # 0.017453
	.long	1016003125
	.align 2
l.18118:	 # -1.000000
	.long	3212836864
	.align 2
l.18114:	 # 2.000000
	.long	1073741824
	.align 2
l.18113:	 # 1.570796
	.long	1070141402
	.align 2
l.18112:	 # 0.785398
	.long	1061752794
	.align 2
l.18111:	 # 2.437500
	.long	1075576832
	.align 2
l.18110:	 # 0.060035
	.long	1031137220
	.align 2
l.18109:	 # 0.089764
	.long	1035458157
	.align 2
l.18108:	 # 0.111111
	.long	1038323255
	.align 2
l.18107:	 # 0.142857
	.long	1041385764
	.align 2
l.18106:	 # 0.200000
	.long	1045220556
	.align 2
l.18105:	 # 0.333333
	.long	1051372201
	.align 2
l.18104:	 # 0.437500
	.long	1054867456
	.align 2
l.18103:	 # 2.356195
	.long	1075235812
	.align 2
l.18102:	 # 0.001370
	.long	984842501
	.align 2
l.18101:	 # 0.041664
	.long	1026205576
	.align 2
l.18100:	 # 0.500000
	.long	1056964608
	.align 2
l.18099:	 # 1.000000
	.long	1065353216
	.align 2
l.18098:	 # 0.000196
	.long	961373365
	.align 2
l.18097:	 # 0.008333
	.long	1007191653
	.align 2
l.18096:	 # 0.166667
	.long	1042983595
	.align 2
l.18095:	 # 0.785398
	.long	1061752794
	.align 2
l.18094:	 # 1.570796
	.long	1070141402
	.align 2
l.18093:	 # 3.141593
	.long	1078530010
	.align 2
l.18092:	 # 6.283185
	.long	1086918618
	.align 2
l.18091:	 # 0.000000
	.long	0
	.text
	.globl _min_caml_start
	.align 2
mul_sub.2788:
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.23756
	or	%r2, %r6, %r6	# mr %r2, %r6
	blr
beq_else.23756:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7
	and	%r8, %r5, %r8
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.23757
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.23758
	or	%r2, %r6, %r6	# mr %r2, %r6
	blr
beq_else.23758:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7
	and	%r8, %r5, %r8
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.23759
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	mul_sub.2788
beq_else.23759:
	slw	%r8, %r2, %r7
	add	%r6, %r6, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	mul_sub.2788
beq_else.23757:
	slw	%r8, %r2, %r7
	add	%r6, %r6, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.23760
	or	%r2, %r6, %r6	# mr %r2, %r6
	blr
beq_else.23760:
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7
	and	%r8, %r5, %r8
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.23761
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	mul_sub.2788
beq_else.23761:
	slw	%r8, %r2, %r7
	add	%r6, %r6, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	mul_sub.2788
div_sub.6714:
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.23762
	blr
beq_else.23762:
	srw	%r8, %r5, %r7
	cmp	%cr7, %r6, %r8
	bgt	%cr7, ble_else.23763
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7
	add	%r2, %r8, %r2
	slw	%r8, %r6, %r7
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.23764
	blr
beq_else.23764:
	srw	%r8, %r5, %r7
	cmp	%cr7, %r6, %r8
	bgt	%cr7, ble_else.23765
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7
	add	%r2, %r8, %r2
	slw	%r8, %r6, %r7
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.6714
ble_else.23765:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.6714
ble_else.23763:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.23766
	blr
beq_else.23766:
	srw	%r8, %r5, %r7
	cmp	%cr7, %r6, %r8
	bgt	%cr7, ble_else.23767
	addi	%r8, %r0, 1	# li
	slw	%r8, %r8, %r7
	add	%r2, %r8, %r2
	slw	%r8, %r6, %r7
	subf	%r5, %r8, %r5	# sub	%r5, %r5, %r8
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.6714
ble_else.23767:
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	b	div_sub.6714
div.2796:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.23768
	or	%r6, %r2, %r2	# mr %r6, %r2
	b	bge_cont.23769
bge_else.23768:
	neg	%r6, %r2
bge_cont.23769:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.23770
	or	%r7, %r5, %r5	# mr %r7, %r5
	b	bge_cont.23771
bge_else.23770:
	neg	%r7, %r5
bge_cont.23771:
	addi	%r8, %r0, 0	# li
	addi	%r31, %r0, 30	# lis
	srw	%r9, %r6, %r31
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	cmp	%cr7, %r7, %r9
	bgt	%cr7, ble_else.23772
	addis	%r8, %r0, 16384	# lis
	ori	%r8, %r8, 0
	addi	%r31, %r0, 30	# li
	slw	%r9, %r7, %r31
	subf	%r6, %r9, %r6	# sub	%r6, %r6, %r9
	addi	%r9, %r0, 29	# li
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r2, %r8, %r8	# mr %r2, %r8
	or	%r6, %r7, %r7	# mr %r6, %r7
	or	%r7, %r9, %r9	# mr %r7, %r9
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	div_sub.6714
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	b	ble_cont.23773
ble_else.23772:
	addi	%r9, %r0, 29	# li
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r2, %r8, %r8	# mr %r2, %r8
	or	%r6, %r7, %r7	# mr %r6, %r7
	or	%r7, %r9, %r9	# mr %r7, %r9
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	div_sub.6714
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
ble_cont.23773:
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	lwz	%r5, 4(%r3)
	addi	%r31, %r0, 31	# lis
	srw	%r5, %r5, %r31
	lwz	%r6, 0(%r3)
	addi	%r31, %r0, 31	# lis
	srw	%r6, %r6, %r31
	xor	%r5, %r5, %r6
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.23774
	blr
beq_else.23774:
	neg	%r2, %r2
	blr
print_int_sub.2801:
	cmpwi	%cr7, %r2, 10
	blt	%cr7, bge_else.23775
	addi	%r5, %r0, 10	# li
	stw	%r2, 0(%r3)
	mflr	%r31	
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.2796
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 10
	blt	%cr7, bge_else.23776
	addi	%r5, %r0, 10	# li
	stw	%r2, 4(%r3)
	mflr	%r31	
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	div.2796
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	mflr	%r31	
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	print_int_sub.2801
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 10	# li
	lwz	%r2, 4(%r3)
	mflr	%r31	
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	div.2796
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.23778
	or	%r5, %r2, %r2	# mr %r5, %r2
	b	bge_cont.23779
bge_else.23778:
	neg	%r5, %r2
bge_cont.23779:
	addi	%r6, %r0, 10	# li
	addi	%r7, %r0, 0	# li
	addi	%r8, %r0, 29	# li
	stw	%r2, 8(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r6, %r7, %r7	# mr %r6, %r7
	or	%r7, %r8, %r8	# mr %r7, %r8
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	mul_sub.2788
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtlr	%r31	
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	lwz	%r5, 8(%r3)
	addi	%r31, %r0, 31	# lis
	srw	%r5, %r5, %r31
	addis	%r31, %r0, 0	# lis
	ori	%r31, %r31, 0
	xor	%r5, %r31, %r5
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.23780
	b	beq_cont.23781
beq_else.23780:
	neg	%r2, %r2
beq_cont.23781:
	lwz	%r5, 4(%r3)
	subf	%r2, %r2, %r5	# sub	%r2, %r5, %r2
	addi	%r2, %r2, 48
out.23782:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23782
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	b	bge_cont.23777
bge_else.23776:
	addi	%r2, %r2, 48
out.23783:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23783
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
bge_cont.23777:
	addi	%r5, %r0, 10	# li
	lwz	%r2, 0(%r3)
	mflr	%r31	
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	div.2796
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.23784
	or	%r5, %r2, %r2	# mr %r5, %r2
	b	bge_cont.23785
bge_else.23784:
	neg	%r5, %r2
bge_cont.23785:
	addi	%r6, %r0, 10	# li
	addi	%r7, %r0, 0	# li
	addi	%r8, %r0, 30	# li
	stw	%r2, 12(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r6, %r7, %r7	# mr %r6, %r7
	or	%r7, %r8, %r8	# mr %r7, %r8
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	bl	mul_sub.2788
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	lwz	%r5, 12(%r3)
	addi	%r31, %r0, 31	# lis
	srw	%r5, %r5, %r31
	addis	%r31, %r0, 0	# lis
	ori	%r31, %r31, 0
	xor	%r5, %r31, %r5
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.23786
	b	beq_cont.23787
beq_else.23786:
	neg	%r2, %r2
beq_cont.23787:
	lwz	%r5, 0(%r3)
	subf	%r2, %r2, %r5	# sub	%r2, %r5, %r2
	addi	%r2, %r2, 48
out.23789:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23789
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	blr
bge_else.23775:
	addi	%r2, %r2, 48
out.23791:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23791
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	blr
print_int.2803:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.23792
	cmpwi	%cr7, %r2, 10
	blt	%cr7, bge_else.23793
	addi	%r5, %r0, 10	# li
	stw	%r2, 0(%r3)
	mflr	%r31	
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.2796
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtlr	%r31	
	mflr	%r31	
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int_sub.2801
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 10	# li
	lwz	%r2, 0(%r3)
	mflr	%r31	
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	div.2796
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.23794
	or	%r5, %r2, %r2	# mr %r5, %r2
	b	bge_cont.23795
bge_else.23794:
	neg	%r5, %r2
bge_cont.23795:
	addi	%r6, %r0, 10	# li
	addi	%r7, %r0, 0	# li
	addi	%r8, %r0, 29	# li
	stw	%r2, 4(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r6, %r7, %r7	# mr %r6, %r7
	or	%r7, %r8, %r8	# mr %r7, %r8
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	mul_sub.2788
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	lwz	%r5, 4(%r3)
	addi	%r31, %r0, 31	# lis
	srw	%r5, %r5, %r31
	addis	%r31, %r0, 0	# lis
	ori	%r31, %r31, 0
	xor	%r5, %r31, %r5
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.23796
	b	beq_cont.23797
beq_else.23796:
	neg	%r2, %r2
beq_cont.23797:
	lwz	%r5, 0(%r3)
	subf	%r2, %r2, %r5	# sub	%r2, %r5, %r2
	addi	%r2, %r2, 48
out.23799:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23799
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	blr
bge_else.23793:
	addi	%r2, %r2, 48
out.23801:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23801
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	blr
bge_else.23792:
	addi	%r5, %r0, 45	# li
out.23802:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23802
	addi	%r31, %r0, 24	# lis
	slw	%r5, %r5, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
	neg	%r2, %r2
	cmpwi	%cr7, %r2, 10
	blt	%cr7, bge_else.23803
	addi	%r5, %r0, 10	# li
	stw	%r2, 8(%r3)
	mflr	%r31	
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	div.2796
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtlr	%r31	
	mflr	%r31	
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	print_int_sub.2801
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 10	# li
	lwz	%r2, 8(%r3)
	mflr	%r31	
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	div.2796
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.23804
	or	%r5, %r2, %r2	# mr %r5, %r2
	b	bge_cont.23805
bge_else.23804:
	neg	%r5, %r2
bge_cont.23805:
	addi	%r6, %r0, 10	# li
	addi	%r7, %r0, 0	# li
	addi	%r8, %r0, 29	# li
	stw	%r2, 12(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r6, %r7, %r7	# mr %r6, %r7
	or	%r7, %r8, %r8	# mr %r7, %r8
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	bl	mul_sub.2788
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	addis	%r5, %r0, 32767	# lis
	ori	%r5, %r5, 65535
	and	%r2, %r2, %r5
	lwz	%r5, 12(%r3)
	addi	%r31, %r0, 31	# lis
	srw	%r5, %r5, %r31
	addis	%r31, %r0, 0	# lis
	ori	%r31, %r31, 0
	xor	%r5, %r31, %r5
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.23806
	b	beq_cont.23807
beq_else.23806:
	neg	%r2, %r2
beq_cont.23807:
	lwz	%r5, 8(%r3)
	subf	%r2, %r2, %r5	# sub	%r2, %r5, %r2
	addi	%r2, %r2, 48
out.23809:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23809
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	blr
bge_else.23803:
	addi	%r2, %r2, 48
out.23811:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23811
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	blr
sin.2811:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23812
	addis	%r31, %r0, (l.18092)@h	# lis
	ori	%r31, %r31, (l.18092)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.23813
	addis	%r31, %r0, (l.18093)@h	# lis
	ori	%r31, %r31, (l.18093)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23814
	addis	%r31, %r0, (l.18093)@h	# lis
	ori	%r31, %r31, (l.18093)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	addis	%r31, %r0, (l.18094)@h	# lis
	ori	%r31, %r31, (l.18094)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23815
	addis	%r31, %r0, (l.18103)@h	# lis
	ori	%r31, %r31, (l.18103)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23816
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.18093)@h	# lis
	ori	%r31, %r31, (l.18093)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	fmul	%f2, %f0, %f0
	fmul	%f3, %f0, %f2
	fmul	%f4, %f3, %f2
	fmul	%f2, %f4, %f2
	addis	%r31, %r0, (l.18096)@h	# lis
	ori	%r31, %r31, (l.18096)@l
	lfs	%f5, 0(%r31)	# float
	fmul	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	addis	%r31, %r0, (l.18097)@h	# lis
	ori	%r31, %r31, (l.18097)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f3, %f3, %f4
	fadd	%f0, %f0, %f3
	addis	%r31, %r0, (l.18098)@h	# lis
	ori	%r31, %r31, (l.18098)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f2, %f3, %f2
	fsub	%f0, %f0, %f2
	fsub	%f0, %f1, %f0
	blr
ble_else.23816:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.18094)@h	# lis
	ori	%r31, %r31, (l.18094)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f0, %f2
	fmul	%f0, %f0, %f0
	fmul	%f2, %f0, %f0
	fmul	%f3, %f0, %f2
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f4, 0(%r31)	# float
	addis	%r31, %r0, (l.18100)@h	# lis
	ori	%r31, %r31, (l.18100)@l
	lfs	%f5, 0(%r31)	# float
	fmul	%f0, %f5, %f0
	fsub	%f0, %f4, %f0
	addis	%r31, %r0, (l.18101)@h	# lis
	ori	%r31, %r31, (l.18101)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f2, %f4, %f2
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.18102)@h	# lis
	ori	%r31, %r31, (l.18102)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	fsub	%f0, %f1, %f0
	blr
ble_else.23815:
	addis	%r31, %r0, (l.18095)@h	# lis
	ori	%r31, %r31, (l.18095)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23817
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.18094)@h	# lis
	ori	%r31, %r31, (l.18094)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f2, %f0, %f0
	fmul	%f3, %f0, %f2
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f4, 0(%r31)	# float
	addis	%r31, %r0, (l.18100)@h	# lis
	ori	%r31, %r31, (l.18100)@l
	lfs	%f5, 0(%r31)	# float
	fmul	%f0, %f5, %f0
	fsub	%f0, %f4, %f0
	addis	%r31, %r0, (l.18101)@h	# lis
	ori	%r31, %r31, (l.18101)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f2, %f4, %f2
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.18102)@h	# lis
	ori	%r31, %r31, (l.18102)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	fsub	%f0, %f1, %f0
	blr
ble_else.23817:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f2, %f0, %f0
	fmul	%f3, %f0, %f2
	fmul	%f4, %f3, %f2
	fmul	%f2, %f4, %f2
	addis	%r31, %r0, (l.18096)@h	# lis
	ori	%r31, %r31, (l.18096)@l
	lfs	%f5, 0(%r31)	# float
	fmul	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	addis	%r31, %r0, (l.18097)@h	# lis
	ori	%r31, %r31, (l.18097)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f3, %f3, %f4
	fadd	%f0, %f0, %f3
	addis	%r31, %r0, (l.18098)@h	# lis
	ori	%r31, %r31, (l.18098)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f2, %f3, %f2
	fsub	%f0, %f0, %f2
	fsub	%f0, %f1, %f0
	blr
ble_else.23814:
	addis	%r31, %r0, (l.18094)@h	# lis
	ori	%r31, %r31, (l.18094)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23818
	addis	%r31, %r0, (l.18103)@h	# lis
	ori	%r31, %r31, (l.18103)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23819
	addis	%r31, %r0, (l.18093)@h	# lis
	ori	%r31, %r31, (l.18093)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	fmul	%f3, %f2, %f1
	fmul	%f1, %f3, %f1
	addis	%r31, %r0, (l.18096)@h	# lis
	ori	%r31, %r31, (l.18096)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f2, %f4, %f2
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.18097)@h	# lis
	ori	%r31, %r31, (l.18097)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.18098)@h	# lis
	ori	%r31, %r31, (l.18098)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	blr
ble_else.23819:
	addis	%r31, %r0, (l.18094)@h	# lis
	ori	%r31, %r31, (l.18094)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f3, 0(%r31)	# float
	addis	%r31, %r0, (l.18100)@h	# lis
	ori	%r31, %r31, (l.18100)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f0, %f4, %f0
	fsub	%f0, %f3, %f0
	addis	%r31, %r0, (l.18101)@h	# lis
	ori	%r31, %r31, (l.18101)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.18102)@h	# lis
	ori	%r31, %r31, (l.18102)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	blr
ble_else.23818:
	addis	%r31, %r0, (l.18095)@h	# lis
	ori	%r31, %r31, (l.18095)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23820
	addis	%r31, %r0, (l.18094)@h	# lis
	ori	%r31, %r31, (l.18094)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f3, 0(%r31)	# float
	addis	%r31, %r0, (l.18100)@h	# lis
	ori	%r31, %r31, (l.18100)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f0, %f4, %f0
	fsub	%f0, %f3, %f0
	addis	%r31, %r0, (l.18101)@h	# lis
	ori	%r31, %r31, (l.18101)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.18102)@h	# lis
	ori	%r31, %r31, (l.18102)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	blr
ble_else.23820:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	fmul	%f3, %f2, %f1
	fmul	%f1, %f3, %f1
	addis	%r31, %r0, (l.18096)@h	# lis
	ori	%r31, %r31, (l.18096)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f2, %f4, %f2
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.18097)@h	# lis
	ori	%r31, %r31, (l.18097)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.18098)@h	# lis
	ori	%r31, %r31, (l.18098)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	blr
ble_else.23813:
	addis	%r31, %r0, (l.18092)@h	# lis
	ori	%r31, %r31, (l.18092)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	sin.2811
ble_else.23812:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	stfs	%f1, 0(%r3)	# float
	mflr	%r31	
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	sin.2811
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	lfs	%f1, 0(%r3)	# float
	fsub	%f0, %f1, %f0
	blr
cos.2813:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23821
	addis	%r31, %r0, (l.18092)@h	# lis
	ori	%r31, %r31, (l.18092)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.23822
	addis	%r31, %r0, (l.18093)@h	# lis
	ori	%r31, %r31, (l.18093)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23823
	addis	%r31, %r0, (l.18093)@h	# lis
	ori	%r31, %r31, (l.18093)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	addis	%r31, %r0, (l.18094)@h	# lis
	ori	%r31, %r31, (l.18094)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23824
	addis	%r31, %r0, (l.18103)@h	# lis
	ori	%r31, %r31, (l.18103)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23825
	addis	%r31, %r0, (l.18093)@h	# lis
	ori	%r31, %r31, (l.18093)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	fmul	%f3, %f2, %f1
	fmul	%f1, %f3, %f1
	addis	%r31, %r0, (l.18096)@h	# lis
	ori	%r31, %r31, (l.18096)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f2, %f4, %f2
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.18097)@h	# lis
	ori	%r31, %r31, (l.18097)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.18098)@h	# lis
	ori	%r31, %r31, (l.18098)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	blr
ble_else.23825:
	addis	%r31, %r0, (l.18094)@h	# lis
	ori	%r31, %r31, (l.18094)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f3, 0(%r31)	# float
	addis	%r31, %r0, (l.18100)@h	# lis
	ori	%r31, %r31, (l.18100)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f0, %f4, %f0
	fsub	%f0, %f3, %f0
	addis	%r31, %r0, (l.18101)@h	# lis
	ori	%r31, %r31, (l.18101)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.18102)@h	# lis
	ori	%r31, %r31, (l.18102)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	blr
ble_else.23824:
	addis	%r31, %r0, (l.18095)@h	# lis
	ori	%r31, %r31, (l.18095)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23826
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.18094)@h	# lis
	ori	%r31, %r31, (l.18094)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f2, %f0, %f0
	fmul	%f3, %f0, %f2
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f4, 0(%r31)	# float
	addis	%r31, %r0, (l.18100)@h	# lis
	ori	%r31, %r31, (l.18100)@l
	lfs	%f5, 0(%r31)	# float
	fmul	%f0, %f5, %f0
	fsub	%f0, %f4, %f0
	addis	%r31, %r0, (l.18101)@h	# lis
	ori	%r31, %r31, (l.18101)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f2, %f4, %f2
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.18102)@h	# lis
	ori	%r31, %r31, (l.18102)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	fsub	%f0, %f1, %f0
	blr
ble_else.23826:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f2, %f0, %f0
	fmul	%f3, %f0, %f2
	fmul	%f4, %f3, %f2
	fmul	%f2, %f4, %f2
	addis	%r31, %r0, (l.18096)@h	# lis
	ori	%r31, %r31, (l.18096)@l
	lfs	%f5, 0(%r31)	# float
	fmul	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	addis	%r31, %r0, (l.18097)@h	# lis
	ori	%r31, %r31, (l.18097)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f3, %f3, %f4
	fadd	%f0, %f0, %f3
	addis	%r31, %r0, (l.18098)@h	# lis
	ori	%r31, %r31, (l.18098)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f2, %f3, %f2
	fsub	%f0, %f0, %f2
	fsub	%f0, %f1, %f0
	blr
ble_else.23823:
	addis	%r31, %r0, (l.18094)@h	# lis
	ori	%r31, %r31, (l.18094)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23827
	addis	%r31, %r0, (l.18103)@h	# lis
	ori	%r31, %r31, (l.18103)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23828
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.18093)@h	# lis
	ori	%r31, %r31, (l.18093)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f2, %f0, %f0
	fmul	%f3, %f0, %f2
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f4, 0(%r31)	# float
	addis	%r31, %r0, (l.18100)@h	# lis
	ori	%r31, %r31, (l.18100)@l
	lfs	%f5, 0(%r31)	# float
	fmul	%f0, %f5, %f0
	fsub	%f0, %f4, %f0
	addis	%r31, %r0, (l.18101)@h	# lis
	ori	%r31, %r31, (l.18101)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f2, %f4, %f2
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.18102)@h	# lis
	ori	%r31, %r31, (l.18102)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	fsub	%f0, %f0, %f2
	fsub	%f0, %f1, %f0
	blr
ble_else.23828:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.18094)@h	# lis
	ori	%r31, %r31, (l.18094)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f0, %f2
	fmul	%f2, %f0, %f0
	fmul	%f3, %f0, %f2
	fmul	%f4, %f3, %f2
	fmul	%f2, %f4, %f2
	addis	%r31, %r0, (l.18096)@h	# lis
	ori	%r31, %r31, (l.18096)@l
	lfs	%f5, 0(%r31)	# float
	fmul	%f3, %f5, %f3
	fsub	%f0, %f0, %f3
	addis	%r31, %r0, (l.18097)@h	# lis
	ori	%r31, %r31, (l.18097)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f3, %f3, %f4
	fadd	%f0, %f0, %f3
	addis	%r31, %r0, (l.18098)@h	# lis
	ori	%r31, %r31, (l.18098)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f2, %f3, %f2
	fsub	%f0, %f0, %f2
	fsub	%f0, %f1, %f0
	blr
ble_else.23827:
	addis	%r31, %r0, (l.18095)@h	# lis
	ori	%r31, %r31, (l.18095)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23829
	addis	%r31, %r0, (l.18094)@h	# lis
	ori	%r31, %r31, (l.18094)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	fmul	%f3, %f2, %f1
	fmul	%f1, %f3, %f1
	addis	%r31, %r0, (l.18096)@h	# lis
	ori	%r31, %r31, (l.18096)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f2, %f4, %f2
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.18097)@h	# lis
	ori	%r31, %r31, (l.18097)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.18098)@h	# lis
	ori	%r31, %r31, (l.18098)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f1, %f2, %f1
	fsub	%f0, %f0, %f1
	blr
ble_else.23829:
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f3, 0(%r31)	# float
	addis	%r31, %r0, (l.18100)@h	# lis
	ori	%r31, %r31, (l.18100)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f0, %f4, %f0
	fsub	%f0, %f3, %f0
	addis	%r31, %r0, (l.18101)@h	# lis
	ori	%r31, %r31, (l.18101)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.18102)@h	# lis
	ori	%r31, %r31, (l.18102)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	blr
ble_else.23822:
	addis	%r31, %r0, (l.18092)@h	# lis
	ori	%r31, %r31, (l.18092)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	sin.2811
ble_else.23821:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	b	cos.2813
atan.2817:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.23830
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.18104)@h	# lis
	ori	%r31, %r31, (l.18104)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23831
	addis	%r31, %r0, (l.18111)@h	# lis
	ori	%r31, %r31, (l.18111)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23832
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.18113)@h	# lis
	ori	%r31, %r31, (l.18113)@l
	lfs	%f2, 0(%r31)	# float
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f3, 0(%r31)	# float
	fdiv	%f0, %f3, %f0
	fmul	%f3, %f0, %f0
	fmul	%f4, %f0, %f3
	fmul	%f5, %f4, %f3
	fmul	%f6, %f5, %f3
	fmul	%f7, %f6, %f3
	fmul	%f8, %f7, %f3
	fmul	%f3, %f8, %f3
	addis	%r31, %r0, (l.18105)@h	# lis
	ori	%r31, %r31, (l.18105)@l
	lfs	%f9, 0(%r31)	# float
	fmul	%f4, %f9, %f4
	fsub	%f0, %f0, %f4
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f4, %f4, %f5
	fadd	%f0, %f0, %f4
	addis	%r31, %r0, (l.18107)@h	# lis
	ori	%r31, %r31, (l.18107)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f4, %f4, %f6
	fsub	%f0, %f0, %f4
	addis	%r31, %r0, (l.18108)@h	# lis
	ori	%r31, %r31, (l.18108)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f4, %f4, %f7
	fadd	%f0, %f0, %f4
	addis	%r31, %r0, (l.18109)@h	# lis
	ori	%r31, %r31, (l.18109)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f4, %f4, %f8
	fsub	%f0, %f0, %f4
	addis	%r31, %r0, (l.18110)@h	# lis
	ori	%r31, %r31, (l.18110)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f3, %f4, %f3
	fadd	%f0, %f0, %f3
	fsub	%f0, %f2, %f0
	fsub	%f0, %f1, %f0
	blr
ble_else.23832:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.18112)@h	# lis
	ori	%r31, %r31, (l.18112)@l
	lfs	%f2, 0(%r31)	# float
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f3, 0(%r31)	# float
	fsub	%f3, %f0, %f3
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f4, 0(%r31)	# float
	fadd	%f0, %f0, %f4
	fdiv	%f0, %f3, %f0
	fmul	%f3, %f0, %f0
	fmul	%f4, %f0, %f3
	fmul	%f5, %f4, %f3
	fmul	%f6, %f5, %f3
	fmul	%f7, %f6, %f3
	fmul	%f8, %f7, %f3
	fmul	%f3, %f8, %f3
	addis	%r31, %r0, (l.18105)@h	# lis
	ori	%r31, %r31, (l.18105)@l
	lfs	%f9, 0(%r31)	# float
	fmul	%f4, %f9, %f4
	fsub	%f0, %f0, %f4
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f4, %f4, %f5
	fadd	%f0, %f0, %f4
	addis	%r31, %r0, (l.18107)@h	# lis
	ori	%r31, %r31, (l.18107)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f4, %f4, %f6
	fsub	%f0, %f0, %f4
	addis	%r31, %r0, (l.18108)@h	# lis
	ori	%r31, %r31, (l.18108)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f4, %f4, %f7
	fadd	%f0, %f0, %f4
	addis	%r31, %r0, (l.18109)@h	# lis
	ori	%r31, %r31, (l.18109)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f4, %f4, %f8
	fsub	%f0, %f0, %f4
	addis	%r31, %r0, (l.18110)@h	# lis
	ori	%r31, %r31, (l.18110)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f3, %f4, %f3
	fadd	%f0, %f0, %f3
	fadd	%f0, %f2, %f0
	fsub	%f0, %f1, %f0
	blr
ble_else.23831:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f2, %f0, %f0
	fmul	%f3, %f0, %f2
	fmul	%f4, %f3, %f2
	fmul	%f5, %f4, %f2
	fmul	%f6, %f5, %f2
	fmul	%f7, %f6, %f2
	fmul	%f2, %f7, %f2
	addis	%r31, %r0, (l.18105)@h	# lis
	ori	%r31, %r31, (l.18105)@l
	lfs	%f8, 0(%r31)	# float
	fmul	%f3, %f8, %f3
	fsub	%f0, %f0, %f3
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f3, %f3, %f4
	fadd	%f0, %f0, %f3
	addis	%r31, %r0, (l.18107)@h	# lis
	ori	%r31, %r31, (l.18107)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f3, %f3, %f5
	fsub	%f0, %f0, %f3
	addis	%r31, %r0, (l.18108)@h	# lis
	ori	%r31, %r31, (l.18108)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f3, %f3, %f6
	fadd	%f0, %f0, %f3
	addis	%r31, %r0, (l.18109)@h	# lis
	ori	%r31, %r31, (l.18109)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f3, %f3, %f7
	fsub	%f0, %f0, %f3
	addis	%r31, %r0, (l.18110)@h	# lis
	ori	%r31, %r31, (l.18110)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f2, %f3, %f2
	fadd	%f0, %f0, %f2
	fsub	%f0, %f1, %f0
	blr
ble_else.23830:
	addis	%r31, %r0, (l.18104)@h	# lis
	ori	%r31, %r31, (l.18104)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23833
	addis	%r31, %r0, (l.18111)@h	# lis
	ori	%r31, %r31, (l.18111)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.23834
	addis	%r31, %r0, (l.18113)@h	# lis
	ori	%r31, %r31, (l.18113)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f2, 0(%r31)	# float
	fdiv	%f0, %f2, %f0
	fmul	%f2, %f0, %f0
	fmul	%f3, %f0, %f2
	fmul	%f4, %f3, %f2
	fmul	%f5, %f4, %f2
	fmul	%f6, %f5, %f2
	fmul	%f7, %f6, %f2
	fmul	%f2, %f7, %f2
	addis	%r31, %r0, (l.18105)@h	# lis
	ori	%r31, %r31, (l.18105)@l
	lfs	%f8, 0(%r31)	# float
	fmul	%f3, %f8, %f3
	fsub	%f0, %f0, %f3
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f3, %f3, %f4
	fadd	%f0, %f0, %f3
	addis	%r31, %r0, (l.18107)@h	# lis
	ori	%r31, %r31, (l.18107)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f3, %f3, %f5
	fsub	%f0, %f0, %f3
	addis	%r31, %r0, (l.18108)@h	# lis
	ori	%r31, %r31, (l.18108)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f3, %f3, %f6
	fadd	%f0, %f0, %f3
	addis	%r31, %r0, (l.18109)@h	# lis
	ori	%r31, %r31, (l.18109)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f3, %f3, %f7
	fsub	%f0, %f0, %f3
	addis	%r31, %r0, (l.18110)@h	# lis
	ori	%r31, %r31, (l.18110)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f2, %f3, %f2
	fadd	%f0, %f0, %f2
	fsub	%f0, %f1, %f0
	blr
ble_else.23834:
	addis	%r31, %r0, (l.18112)@h	# lis
	ori	%r31, %r31, (l.18112)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f2, %f0, %f2
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f3, 0(%r31)	# float
	fadd	%f0, %f0, %f3
	fdiv	%f0, %f2, %f0
	fmul	%f2, %f0, %f0
	fmul	%f3, %f0, %f2
	fmul	%f4, %f3, %f2
	fmul	%f5, %f4, %f2
	fmul	%f6, %f5, %f2
	fmul	%f7, %f6, %f2
	fmul	%f2, %f7, %f2
	addis	%r31, %r0, (l.18105)@h	# lis
	ori	%r31, %r31, (l.18105)@l
	lfs	%f8, 0(%r31)	# float
	fmul	%f3, %f8, %f3
	fsub	%f0, %f0, %f3
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f3, %f3, %f4
	fadd	%f0, %f0, %f3
	addis	%r31, %r0, (l.18107)@h	# lis
	ori	%r31, %r31, (l.18107)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f3, %f3, %f5
	fsub	%f0, %f0, %f3
	addis	%r31, %r0, (l.18108)@h	# lis
	ori	%r31, %r31, (l.18108)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f3, %f3, %f6
	fadd	%f0, %f0, %f3
	addis	%r31, %r0, (l.18109)@h	# lis
	ori	%r31, %r31, (l.18109)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f3, %f3, %f7
	fsub	%f0, %f0, %f3
	addis	%r31, %r0, (l.18110)@h	# lis
	ori	%r31, %r31, (l.18110)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f2, %f3, %f2
	fadd	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	blr
ble_else.23833:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f0, %f1
	fmul	%f3, %f2, %f1
	fmul	%f4, %f3, %f1
	fmul	%f5, %f4, %f1
	fmul	%f6, %f5, %f1
	fmul	%f1, %f6, %f1
	addis	%r31, %r0, (l.18105)@h	# lis
	ori	%r31, %r31, (l.18105)@l
	lfs	%f7, 0(%r31)	# float
	fmul	%f2, %f7, %f2
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.18107)@h	# lis
	ori	%r31, %r31, (l.18107)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f4
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.18108)@h	# lis
	ori	%r31, %r31, (l.18108)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f5
	fadd	%f0, %f0, %f2
	addis	%r31, %r0, (l.18109)@h	# lis
	ori	%r31, %r31, (l.18109)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f2, %f2, %f6
	fsub	%f0, %f0, %f2
	addis	%r31, %r0, (l.18110)@h	# lis
	ori	%r31, %r31, (l.18110)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f1, %f2, %f1
	fadd	%f0, %f0, %f1
	blr
msb_sub.6489:
	srw	%r6, %r2, %r5
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.23835
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.23836
	or	%r2, %r5, %r5	# mr %r2, %r5
	blr
beq_else.23836:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	srw	%r6, %r2, %r5
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.23837
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.23838
	or	%r2, %r5, %r5	# mr %r2, %r5
	blr
beq_else.23838:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	srw	%r6, %r2, %r5
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.23839
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.23840
	or	%r2, %r5, %r5	# mr %r2, %r5
	blr
beq_else.23840:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	srw	%r6, %r2, %r5
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.23841
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.23842
	or	%r2, %r5, %r5	# mr %r2, %r5
	blr
beq_else.23842:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	srw	%r6, %r2, %r5
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.23843
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.23844
	or	%r2, %r5, %r5	# mr %r2, %r5
	blr
beq_else.23844:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	srw	%r6, %r2, %r5
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.23845
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.23846
	or	%r2, %r5, %r5	# mr %r2, %r5
	blr
beq_else.23846:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	srw	%r6, %r2, %r5
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.23847
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.23848
	or	%r2, %r5, %r5	# mr %r2, %r5
	blr
beq_else.23848:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	srw	%r6, %r2, %r5
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.23849
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.23850
	or	%r2, %r5, %r5	# mr %r2, %r5
	blr
beq_else.23850:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	b	msb_sub.6489
beq_else.23849:
	or	%r2, %r5, %r5	# mr %r2, %r5
	blr
beq_else.23847:
	or	%r2, %r5, %r5	# mr %r2, %r5
	blr
beq_else.23845:
	or	%r2, %r5, %r5	# mr %r2, %r5
	blr
beq_else.23843:
	or	%r2, %r5, %r5	# mr %r2, %r5
	blr
beq_else.23841:
	or	%r2, %r5, %r5	# mr %r2, %r5
	blr
beq_else.23839:
	or	%r2, %r5, %r5	# mr %r2, %r5
	blr
beq_else.23837:
	or	%r2, %r5, %r5	# mr %r2, %r5
	blr
beq_else.23835:
	or	%r2, %r5, %r5	# mr %r2, %r5
	blr
float_of_int.2840:
	cmpwi	%cr7, %r2, 0	
	bgt	%cr7, ble_else.23851
	addi	%r5, %r0, 1	# li
	b	ble_cont.23852
ble_else.23851:
	addi	%r5, %r0, 0	# li
ble_cont.23852:
	cmpwi	%cr7, %r2, 0	
	bgt	%cr7, ble_else.23853
	neg	%r2, %r2
	b	ble_cont.23854
ble_else.23853:
ble_cont.23854:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.23855
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	blr
beq_else.23855:
	addi	%r31, %r0, 31	# lis
	srw	%r6, %r2, %r31
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.23856
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.23858
	addi	%r2, %r0, 31	# li
	b	beq_cont.23859
beq_else.23858:
	addi	%r31, %r0, 30	# lis
	srw	%r6, %r2, %r31
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.23860
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.23862
	addi	%r2, %r0, 30	# li
	b	beq_cont.23863
beq_else.23862:
	addi	%r31, %r0, 29	# lis
	srw	%r6, %r2, %r31
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.23864
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.23866
	addi	%r2, %r0, 29	# li
	b	beq_cont.23867
beq_else.23866:
	addi	%r31, %r0, 28	# lis
	srw	%r6, %r2, %r31
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.23868
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.23870
	addi	%r2, %r0, 28	# li
	b	beq_cont.23871
beq_else.23870:
	addi	%r31, %r0, 27	# lis
	srw	%r6, %r2, %r31
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.23872
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.23874
	addi	%r2, %r0, 27	# li
	b	beq_cont.23875
beq_else.23874:
	addi	%r31, %r0, 26	# lis
	srw	%r6, %r2, %r31
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.23876
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.23878
	addi	%r2, %r0, 26	# li
	b	beq_cont.23879
beq_else.23878:
	addi	%r31, %r0, 25	# lis
	srw	%r6, %r2, %r31
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.23880
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.23882
	addi	%r2, %r0, 25	# li
	b	beq_cont.23883
beq_else.23882:
	addi	%r6, %r0, 24	# li
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	msb_sub.6489
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
beq_cont.23883:
	b	beq_cont.23881
beq_else.23880:
	addi	%r2, %r0, 25	# li
beq_cont.23881:
beq_cont.23879:
	b	beq_cont.23877
beq_else.23876:
	addi	%r2, %r0, 26	# li
beq_cont.23877:
beq_cont.23875:
	b	beq_cont.23873
beq_else.23872:
	addi	%r2, %r0, 27	# li
beq_cont.23873:
beq_cont.23871:
	b	beq_cont.23869
beq_else.23868:
	addi	%r2, %r0, 28	# li
beq_cont.23869:
beq_cont.23867:
	b	beq_cont.23865
beq_else.23864:
	addi	%r2, %r0, 29	# li
beq_cont.23865:
beq_cont.23863:
	b	beq_cont.23861
beq_else.23860:
	addi	%r2, %r0, 30	# li
beq_cont.23861:
beq_cont.23859:
	b	beq_cont.23857
beq_else.23856:
	addi	%r2, %r0, 31	# li
beq_cont.23857:
	addi	%r5, %r2, 127
	addi	%r31, %r0, 23	# li
	slw	%r5, %r5, %r31
	addi	%r6, %r0, 32	# li
	subf	%r2, %r2, %r6	# sub	%r2, %r6, %r2
	lwz	%r6, 4(%r3)
	slw	%r2, %r6, %r2
	addis	%r6, %r0, 65535	# lis
	ori	%r6, %r6, 65535
	and	%r2, %r2, %r6
	addi	%r31, %r0, 9	# lis
	srw	%r2, %r2, %r31
	or	%r2, %r2, %r5
	lwz	%r5, 0(%r3)
	addi	%r31, %r0, 31	# li
	slw	%r5, %r5, %r31
	or	%r2, %r2, %r5
	stw	%r2, 8(%r3)
	lfs	%f0, 8(%r3)	# float
	blr
sqrt_sub.2845:
	lfs	%f2, 4(%r29)	# float
	fdiv	%f3, %f1, %f0
	fadd	%f3, %f0, %f3
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f4, 0(%r31)	# float
	fdiv	%f3, %f3, %f4
	fsub	%f0, %f3, %f0
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f0
	bgt	%cr7, ble_else.23884
	b	ble_cont.23885
ble_else.23884:
	fneg	%f0, %f0
ble_cont.23885:
	fcmpu	%cr7, %f2, %f0
	bgt	%cr7, ble_else.23886
	fdiv	%f0, %f1, %f3
	fadd	%f0, %f3, %f0
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f4, 0(%r31)	# float
	fdiv	%f0, %f0, %f4
	fsub	%f3, %f0, %f3
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f3
	bgt	%cr7, ble_else.23887
	b	ble_cont.23888
ble_else.23887:
	fneg	%f3, %f3
ble_cont.23888:
	fcmpu	%cr7, %f2, %f3
	bgt	%cr7, ble_else.23889
	fdiv	%f3, %f1, %f0
	fadd	%f3, %f0, %f3
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f4, 0(%r31)	# float
	fdiv	%f3, %f3, %f4
	fsub	%f0, %f3, %f0
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f0
	bgt	%cr7, ble_else.23890
	b	ble_cont.23891
ble_else.23890:
	fneg	%f0, %f0
ble_cont.23891:
	fcmpu	%cr7, %f2, %f0
	bgt	%cr7, ble_else.23892
	fdiv	%f0, %f1, %f3
	fadd	%f0, %f3, %f0
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f4, 0(%r31)	# float
	fdiv	%f0, %f0, %f4
	fsub	%f3, %f0, %f3
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f3
	bgt	%cr7, ble_else.23893
	b	ble_cont.23894
ble_else.23893:
	fneg	%f3, %f3
ble_cont.23894:
	fcmpu	%cr7, %f2, %f3
	bgt	%cr7, ble_else.23895
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
ble_else.23895:
	blr
ble_else.23892:
	fmr	%f0, %f3
	blr
ble_else.23889:
	blr
ble_else.23886:
	fmr	%f0, %f3
	blr
vecunit_sgn.2914:
	lfs	%f0, 8(%r29)	# float
	lwz	%r29, 4(%r29)
	lfs	%f1, 0(%r2)	# float
	fmul	%f1, %f1, %f1
	lfs	%f2, 4(%r2)	# float
	fmul	%f2, %f2, %f2
	fadd	%f1, %f1, %f2
	lfs	%f2, 8(%r2)	# float
	fmul	%f2, %f2, %f2
	fadd	%f1, %f1, %f2
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f2, 0(%r31)	# float
	fdiv	%f3, %f1, %f2
	fadd	%f3, %f2, %f3
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f4, 0(%r31)	# float
	fdiv	%f3, %f3, %f4
	fsub	%f2, %f3, %f2
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f2
	bgt	%cr7, ble_else.23896
	b	ble_cont.23897
ble_else.23896:
	fneg	%f2, %f2
ble_cont.23897:
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	fcmpu	%cr7, %f0, %f2
	bgt	%cr7, ble_else.23898
	fdiv	%f2, %f1, %f3
	fadd	%f2, %f3, %f2
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f4, 0(%r31)	# float
	fdiv	%f2, %f2, %f4
	fsub	%f3, %f2, %f3
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f3
	bgt	%cr7, ble_else.23900
	b	ble_cont.23901
ble_else.23900:
	fneg	%f3, %f3
ble_cont.23901:
	fcmpu	%cr7, %f0, %f3
	bgt	%cr7, ble_else.23902
	mflr	%r31	
	fmr	%f0, %f2
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	b	ble_cont.23903
ble_else.23902:
	fmr	%f0, %f2
ble_cont.23903:
	b	ble_cont.23899
ble_else.23898:
	fmr	%f0, %f3
ble_cont.23899:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.23904
	addi	%r2, %r0, 1	# li
	b	beq_cont.23905
beq_else.23904:
	addi	%r2, %r0, 0	# li
beq_cont.23905:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.23906
	lwz	%r2, 4(%r3)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.23908
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f1, %f0
	b	beq_cont.23909
beq_else.23908:
	addis	%r31, %r0, (l.18118)@h	# lis
	ori	%r31, %r31, (l.18118)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f1, %f0
beq_cont.23909:
	b	beq_cont.23907
beq_else.23906:
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.23907:
	lwz	%r2, 0(%r3)
	lfs	%f1, 0(%r2)	# float
	fmul	%f1, %f1, %f0
	stfs	%f1, 0(%r2)	# float
	lfs	%f1, 4(%r2)	# float
	fmul	%f1, %f1, %f0
	stfs	%f1, 4(%r2)	# float
	lfs	%f1, 8(%r2)	# float
	fmul	%f0, %f1, %f0
	stfs	%f0, 8(%r2)	# float
	blr
read_screen_settings.3015:
	lwz	%r2, 20(%r29)
	lwz	%r5, 16(%r29)
	lwz	%r6, 12(%r29)
	lwz	%r7, 8(%r29)
	lwz	%r8, 4(%r29)
out.23912:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23911
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23912
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23911:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23911
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r9, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r9, %r9, %r31
out.23914:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23913
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23914
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23913:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23913
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r10, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r10, %r10, %r31
out.23916:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23915
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23916
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23915:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23915
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r11, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r11, %r11, %r31
out.23918:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23917
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23918
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23917:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23917
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r12, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r12, %r12, %r31
	addi	%r31, %r0, 8	# li
	slw	%r10, %r10, %r31
	or	%r9, %r9, %r10
	addi	%r31, %r0, 16	# li
	slw	%r10, %r11, %r31
	or	%r9, %r9, %r10
	addi	%r31, %r0, 24	# li
	slw	%r10, %r12, %r31
	or	%r9, %r9, %r10
	stw	%r9, 0(%r3)
	lfs	%f0, 0(%r3)	# float
	stfs	%f0, 0(%r8)	# float
out.23920:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23919
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23920
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23919:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23919
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r9, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r9, %r9, %r31
out.23922:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23921
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23922
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23921:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23921
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r10, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r10, %r10, %r31
out.23924:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23923
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23924
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23923:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23923
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r11, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r11, %r11, %r31
out.23926:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23925
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23926
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23925:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23925
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r12, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r12, %r12, %r31
	addi	%r31, %r0, 8	# li
	slw	%r10, %r10, %r31
	or	%r9, %r9, %r10
	addi	%r31, %r0, 16	# li
	slw	%r10, %r11, %r31
	or	%r9, %r9, %r10
	addi	%r31, %r0, 24	# li
	slw	%r10, %r12, %r31
	or	%r9, %r9, %r10
	stw	%r9, 0(%r3)
	lfs	%f0, 0(%r3)	# float
	stfs	%f0, 4(%r8)	# float
out.23928:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23927
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23928
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23927:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23927
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r9, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r9, %r9, %r31
out.23930:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23929
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23930
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23929:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23929
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r10, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r10, %r10, %r31
out.23932:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23931
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23932
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23931:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23931
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r11, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r11, %r11, %r31
out.23934:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23933
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23934
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23933:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23933
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r12, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r12, %r12, %r31
	addi	%r31, %r0, 8	# li
	slw	%r10, %r10, %r31
	or	%r9, %r9, %r10
	addi	%r31, %r0, 16	# li
	slw	%r10, %r11, %r31
	or	%r9, %r9, %r10
	addi	%r31, %r0, 24	# li
	slw	%r10, %r12, %r31
	or	%r9, %r9, %r10
	stw	%r9, 0(%r3)
	lfs	%f0, 0(%r3)	# float
	stfs	%f0, 8(%r8)	# float
out.23936:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23935
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23936
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23935:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23935
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r9, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r9, %r9, %r31
out.23938:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23937
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23938
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23937:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23937
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r10, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r10, %r10, %r31
out.23940:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23939
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23940
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23939:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23939
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r11, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r11, %r11, %r31
out.23942:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23941
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23942
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23941:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23941
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r12, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r12, %r12, %r31
	addi	%r31, %r0, 8	# li
	slw	%r10, %r10, %r31
	or	%r9, %r9, %r10
	addi	%r31, %r0, 16	# li
	slw	%r10, %r11, %r31
	or	%r9, %r9, %r10
	addi	%r31, %r0, 24	# li
	slw	%r10, %r12, %r31
	or	%r9, %r9, %r10
	stw	%r9, 0(%r3)
	lfs	%f0, 0(%r3)	# float
	addis	%r31, %r0, (l.18128)@h	# lis
	ori	%r31, %r31, (l.18128)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	stw	%r2, 0(%r3)
	stw	%r8, 4(%r3)
	stw	%r6, 8(%r3)
	stw	%r7, 12(%r3)
	stw	%r5, 16(%r3)
	stfs	%f0, 24(%r3)	# float
	mflr	%r31	
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	bl	cos.2813
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	lfs	%f1, 24(%r3)	# float
	stfs	%f0, 32(%r3)	# float
	mflr	%r31	
	fmr	%f0, %f1
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	bl	sin.2811
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
out.23945:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23944
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23945
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23944:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23944
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
out.23947:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23946
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23947
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23946:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23946
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.23949:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23948
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23949
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23948:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23948
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.23951:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23950
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23951
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23950:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23950
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
	addi	%r31, %r0, 8	# li
	slw	%r5, %r5, %r31
	or	%r2, %r2, %r5
	addi	%r31, %r0, 16	# li
	slw	%r5, %r6, %r31
	or	%r2, %r2, %r5
	addi	%r31, %r0, 24	# li
	slw	%r5, %r7, %r31
	or	%r2, %r2, %r5
	stw	%r2, 40(%r3)
	lfs	%f1, 40(%r3)	# float
	addis	%r31, %r0, (l.18128)@h	# lis
	ori	%r31, %r31, (l.18128)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f1, %f1, %f2
	stfs	%f0, 40(%r3)	# float
	stfs	%f1, 48(%r3)	# float
	mflr	%r31	
	fmr	%f0, %f1
	stw	%r31, 56(%r3)
	addi	%r3, %r3, 60
	bl	cos.2813
	addi	%r3, %r3, -60	# subi
	lwz	%r31, 56(%r3)
	mtlr	%r31	
	lfs	%f1, 48(%r3)	# float
	stfs	%f0, 56(%r3)	# float
	mflr	%r31	
	fmr	%f0, %f1
	stw	%r31, 64(%r3)
	addi	%r3, %r3, 68
	bl	sin.2811
	addi	%r3, %r3, -68	# subi
	lwz	%r31, 64(%r3)
	mtlr	%r31	
	lfs	%f1, 32(%r3)	# float
	fmul	%f2, %f1, %f0
	addis	%r31, %r0, (l.18129)@h	# lis
	ori	%r31, %r31, (l.18129)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	lwz	%r2, 16(%r3)
	stfs	%f2, 0(%r2)	# float
	addis	%r31, %r0, (l.18131)@h	# lis
	ori	%r31, %r31, (l.18131)@l
	lfs	%f2, 0(%r31)	# float
	lfs	%f3, 40(%r3)	# float
	fmul	%f2, %f3, %f2
	stfs	%f2, 4(%r2)	# float
	lfs	%f2, 56(%r3)	# float
	fmul	%f4, %f1, %f2
	addis	%r31, %r0, (l.18129)@h	# lis
	ori	%r31, %r31, (l.18129)@l
	lfs	%f5, 0(%r31)	# float
	fmul	%f4, %f4, %f5
	stfs	%f4, 8(%r2)	# float
	lwz	%r5, 12(%r3)
	stfs	%f2, 0(%r5)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	stfs	%f4, 4(%r5)	# float
	fneg	%f4, %f0
	stfs	%f4, 8(%r5)	# float
	fneg	%f4, %f3
	fmul	%f0, %f4, %f0
	lwz	%r5, 8(%r3)
	stfs	%f0, 0(%r5)	# float
	fneg	%f0, %f1
	stfs	%f0, 4(%r5)	# float
	fneg	%f0, %f3
	fmul	%f0, %f0, %f2
	stfs	%f0, 8(%r5)	# float
	lwz	%r5, 4(%r3)
	lfs	%f0, 0(%r5)	# float
	lfs	%f1, 0(%r2)	# float
	fsub	%f0, %f0, %f1
	lwz	%r6, 0(%r3)
	stfs	%f0, 0(%r6)	# float
	lfs	%f0, 4(%r5)	# float
	lfs	%f1, 4(%r2)	# float
	fsub	%f0, %f0, %f1
	stfs	%f0, 4(%r6)	# float
	lfs	%f0, 8(%r5)	# float
	lfs	%f1, 8(%r2)	# float
	fsub	%f0, %f0, %f1
	stfs	%f0, 8(%r6)	# float
	blr
read_light.3017:
	lwz	%r2, 8(%r29)
	lwz	%r5, 4(%r29)
out.23954:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23953
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23954
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23953:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23953
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.23956:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23955
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23956
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23955:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23955
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.23958:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23957
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23958
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23957:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23957
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.23960:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23959
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23960
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23959:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23959
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.23962:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23961
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23962
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23961:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23961
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.23964:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23963
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23964
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23963:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23963
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.23966:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23965
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23966
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23965:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23965
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
out.23968:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23967
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23968
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23967:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23967
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r9, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r9, %r9, %r31
	addi	%r31, %r0, 8	# li
	slw	%r7, %r7, %r31
	or	%r6, %r6, %r7
	addi	%r31, %r0, 16	# li
	slw	%r7, %r8, %r31
	or	%r6, %r6, %r7
	addi	%r31, %r0, 24	# li
	slw	%r7, %r9, %r31
	or	%r6, %r6, %r7
	stw	%r6, 0(%r3)
	lfs	%f0, 0(%r3)	# float
	addis	%r31, %r0, (l.18128)@h	# lis
	ori	%r31, %r31, (l.18128)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	stw	%r5, 0(%r3)
	stfs	%f0, 8(%r3)	# float
	stw	%r2, 16(%r3)
	mflr	%r31	
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	sin.2811
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtlr	%r31	
	fneg	%f0, %f0
	lwz	%r2, 16(%r3)
	stfs	%f0, 4(%r2)	# float
out.23971:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23970
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23971
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23970:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23970
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.23973:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23972
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23973
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23972:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23972
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.23975:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23974
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23975
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23974:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23974
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.23977:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23976
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23977
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23976:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23976
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
	addi	%r31, %r0, 8	# li
	slw	%r6, %r6, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 16	# li
	slw	%r6, %r7, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 24	# li
	slw	%r6, %r8, %r31
	or	%r5, %r5, %r6
	stw	%r5, 20(%r3)
	lfs	%f0, 20(%r3)	# float
	addis	%r31, %r0, (l.18128)@h	# lis
	ori	%r31, %r31, (l.18128)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 8(%r3)	# float
	stfs	%f0, 24(%r3)	# float
	mflr	%r31	
	fmr	%f0, %f1
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	bl	cos.2813
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	lfs	%f1, 24(%r3)	# float
	stfs	%f0, 32(%r3)	# float
	mflr	%r31	
	fmr	%f0, %f1
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	bl	sin.2811
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
	lfs	%f1, 32(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 16(%r3)
	stfs	%f0, 0(%r2)	# float
	lfs	%f0, 24(%r3)	# float
	mflr	%r31	
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	bl	cos.2813
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
	lfs	%f1, 32(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 16(%r3)
	stfs	%f0, 8(%r2)	# float
out.23980:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23979
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23980
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23979:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23979
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
out.23982:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23981
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23982
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23981:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23981
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.23984:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23983
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23984
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23983:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23983
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.23986:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23985
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23986
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23985:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23985
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
	addi	%r31, %r0, 8	# li
	slw	%r5, %r5, %r31
	or	%r2, %r2, %r5
	addi	%r31, %r0, 16	# li
	slw	%r5, %r6, %r31
	or	%r2, %r2, %r5
	addi	%r31, %r0, 24	# li
	slw	%r5, %r7, %r31
	or	%r2, %r2, %r5
	stw	%r2, 40(%r3)
	lfs	%f0, 40(%r3)	# float
	lwz	%r2, 0(%r3)
	stfs	%f0, 0(%r2)	# float
	blr
rotate_quadratic_matrix.3019:
	lfs	%f0, 0(%r5)	# float
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mflr	%r31	
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	cos.2813
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	lwz	%r2, 4(%r3)
	lfs	%f1, 0(%r2)	# float
	stfs	%f0, 8(%r3)	# float
	mflr	%r31	
	fmr	%f0, %f1
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	bl	sin.2811
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	lwz	%r2, 4(%r3)
	lfs	%f1, 4(%r2)	# float
	stfs	%f0, 16(%r3)	# float
	mflr	%r31	
	fmr	%f0, %f1
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	bl	cos.2813
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	mtlr	%r31	
	lwz	%r2, 4(%r3)
	lfs	%f1, 4(%r2)	# float
	stfs	%f0, 24(%r3)	# float
	mflr	%r31	
	fmr	%f0, %f1
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	bl	sin.2811
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	lwz	%r2, 4(%r3)
	lfs	%f1, 8(%r2)	# float
	stfs	%f0, 32(%r3)	# float
	mflr	%r31	
	fmr	%f0, %f1
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	bl	cos.2813
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
	lwz	%r2, 4(%r3)
	lfs	%f1, 8(%r2)	# float
	stfs	%f0, 40(%r3)	# float
	mflr	%r31	
	fmr	%f0, %f1
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	bl	sin.2811
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
	lfs	%f1, 40(%r3)	# float
	lfs	%f2, 24(%r3)	# float
	fmul	%f3, %f2, %f1
	lfs	%f4, 32(%r3)	# float
	lfs	%f5, 16(%r3)	# float
	fmul	%f6, %f5, %f4
	fmul	%f6, %f6, %f1
	lfs	%f7, 8(%r3)	# float
	fmul	%f8, %f7, %f0
	fsub	%f6, %f6, %f8
	fmul	%f8, %f7, %f4
	fmul	%f8, %f8, %f1
	fmul	%f9, %f5, %f0
	fadd	%f8, %f8, %f9
	fmul	%f9, %f2, %f0
	fmul	%f10, %f5, %f4
	fmul	%f10, %f10, %f0
	fmul	%f11, %f7, %f1
	fadd	%f10, %f10, %f11
	fmul	%f11, %f7, %f4
	fmul	%f0, %f11, %f0
	fmul	%f1, %f5, %f1
	fsub	%f0, %f0, %f1
	fneg	%f1, %f4
	fmul	%f4, %f5, %f2
	fmul	%f2, %f7, %f2
	lwz	%r2, 0(%r3)
	lfs	%f5, 0(%r2)	# float
	lfs	%f7, 4(%r2)	# float
	lfs	%f11, 8(%r2)	# float
	fmul	%f12, %f3, %f3
	fmul	%f12, %f5, %f12
	fmul	%f13, %f9, %f9
	fmul	%f13, %f7, %f13
	fadd	%f12, %f12, %f13
	fmul	%f13, %f1, %f1
	fmul	%f13, %f11, %f13
	fadd	%f12, %f12, %f13
	stfs	%f12, 0(%r2)	# float
	fmul	%f12, %f6, %f6
	fmul	%f12, %f5, %f12
	fmul	%f13, %f10, %f10
	fmul	%f13, %f7, %f13
	fadd	%f12, %f12, %f13
	fmul	%f13, %f4, %f4
	fmul	%f13, %f11, %f13
	fadd	%f12, %f12, %f13
	stfs	%f12, 4(%r2)	# float
	fmul	%f12, %f8, %f8
	fmul	%f12, %f5, %f12
	fmul	%f13, %f0, %f0
	fmul	%f13, %f7, %f13
	fadd	%f12, %f12, %f13
	fmul	%f13, %f2, %f2
	fmul	%f13, %f11, %f13
	fadd	%f12, %f12, %f13
	stfs	%f12, 8(%r2)	# float
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f12, 0(%r31)	# float
	fmul	%f13, %f5, %f6
	fmul	%f13, %f13, %f8
	fmul	%f14, %f7, %f10
	fmul	%f14, %f14, %f0
	fadd	%f13, %f13, %f14
	fmul	%f14, %f11, %f4
	fmul	%f14, %f14, %f2
	fadd	%f13, %f13, %f14
	fmul	%f12, %f12, %f13
	lwz	%r2, 4(%r3)
	stfs	%f12, 0(%r2)	# float
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f12, 0(%r31)	# float
	fmul	%f13, %f5, %f3
	fmul	%f8, %f13, %f8
	fmul	%f13, %f7, %f9
	fmul	%f0, %f13, %f0
	fadd	%f0, %f8, %f0
	fmul	%f8, %f11, %f1
	fmul	%f2, %f8, %f2
	fadd	%f0, %f0, %f2
	fmul	%f0, %f12, %f0
	stfs	%f0, 4(%r2)	# float
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f0, 0(%r31)	# float
	fmul	%f2, %f5, %f3
	fmul	%f2, %f2, %f6
	fmul	%f3, %f7, %f9
	fmul	%f3, %f3, %f10
	fadd	%f2, %f2, %f3
	fmul	%f1, %f11, %f1
	fmul	%f1, %f1, %f4
	fadd	%f1, %f2, %f1
	fmul	%f0, %f0, %f1
	stfs	%f0, 8(%r2)	# float
	blr
read_nth_object.3022:
	lwz	%r5, 8(%r29)
	lwz	%r6, 4(%r29)
out.23990:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23989
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23990
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23989:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23989
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.23992:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23991
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23992
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23991:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23991
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
out.23994:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23993
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23994
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23993:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23993
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r9, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r9, %r9, %r31
out.23996:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23995
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23996
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23995:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23995
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r10, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r10, %r10, %r31
	addi	%r31, %r0, 8	# li
	slw	%r8, %r8, %r31
	or	%r7, %r7, %r8
	addi	%r31, %r0, 16	# li
	slw	%r8, %r9, %r31
	or	%r7, %r7, %r8
	addi	%r31, %r0, 24	# li
	slw	%r8, %r10, %r31
	or	%r7, %r7, %r8
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.23997
	addi	%r2, %r0, 0	# li
	blr
beq_else.23997:
out.23999:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.23998
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.23999
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.23998:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.23998
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
out.24001:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24000
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24001
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24000:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24000
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r9, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r9, %r9, %r31
out.24003:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24002
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24003
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24002:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24002
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r10, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r10, %r10, %r31
out.24005:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24004
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24005
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24004:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24004
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r11, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r11, %r11, %r31
	addi	%r31, %r0, 8	# li
	slw	%r9, %r9, %r31
	or	%r8, %r8, %r9
	addi	%r31, %r0, 16	# li
	slw	%r9, %r10, %r31
	or	%r8, %r8, %r9
	addi	%r31, %r0, 24	# li
	slw	%r9, %r11, %r31
	or	%r8, %r8, %r9
out.24007:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24006
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24007
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24006:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24006
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r9, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r9, %r9, %r31
out.24009:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24008
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24009
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24008:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24008
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r10, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r10, %r10, %r31
out.24011:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24010
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24011
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24010:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24010
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r11, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r11, %r11, %r31
out.24013:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24012
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24013
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24012:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24012
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r12, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r12, %r12, %r31
	addi	%r31, %r0, 8	# li
	slw	%r10, %r10, %r31
	or	%r9, %r9, %r10
	addi	%r31, %r0, 16	# li
	slw	%r10, %r11, %r31
	or	%r9, %r9, %r10
	addi	%r31, %r0, 24	# li
	slw	%r10, %r12, %r31
	or	%r9, %r9, %r10
out.24015:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24014
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24015
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24014:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24014
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r10, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r10, %r10, %r31
out.24017:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24016
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24017
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24016:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24016
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r11, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r11, %r11, %r31
out.24019:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24018
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24019
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24018:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24018
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r12, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r12, %r12, %r31
out.24021:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24020
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24021
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24020:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24020
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r13, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r13, %r13, %r31
	addi	%r31, %r0, 8	# li
	slw	%r11, %r11, %r31
	or	%r10, %r10, %r11
	addi	%r31, %r0, 16	# li
	slw	%r11, %r12, %r31
	or	%r10, %r10, %r11
	addi	%r31, %r0, 24	# li
	slw	%r11, %r13, %r31
	or	%r10, %r10, %r11
	addi	%r11, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r5, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r2, 8(%r3)
	stw	%r7, 12(%r3)
	stw	%r9, 16(%r3)
	stw	%r8, 20(%r3)
	stw	%r10, 24(%r3)
	mflr	%r31	
	or	%r2, %r11, %r11	# mr %r2, %r11
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_float_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
out.24023:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24022
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24023
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24022:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24022
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.24025:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24024
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24025
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24024:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24024
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24027:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24026
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24027
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24026:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24026
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24029:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24028
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24029
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24028:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24028
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
	addi	%r31, %r0, 8	# li
	slw	%r6, %r6, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 16	# li
	slw	%r6, %r7, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 24	# li
	slw	%r6, %r8, %r31
	or	%r5, %r5, %r6
	stw	%r5, 28(%r3)
	lfs	%f0, 28(%r3)	# float
	stfs	%f0, 0(%r2)	# float
out.24031:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24030
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24031
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24030:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24030
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.24033:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24032
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24033
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24032:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24032
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24035:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24034
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24035
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24034:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24034
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24037:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24036
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24037
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24036:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24036
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
	addi	%r31, %r0, 8	# li
	slw	%r6, %r6, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 16	# li
	slw	%r6, %r7, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 24	# li
	slw	%r6, %r8, %r31
	or	%r5, %r5, %r6
	stw	%r5, 28(%r3)
	lfs	%f0, 28(%r3)	# float
	stfs	%f0, 4(%r2)	# float
out.24039:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24038
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24039
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24038:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24038
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.24041:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24040
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24041
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24040:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24040
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24043:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24042
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24043
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24042:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24042
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24045:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24044
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24045
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24044:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24044
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
	addi	%r31, %r0, 8	# li
	slw	%r6, %r6, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 16	# li
	slw	%r6, %r7, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 24	# li
	slw	%r6, %r8, %r31
	or	%r5, %r5, %r6
	stw	%r5, 28(%r3)
	lfs	%f0, 28(%r3)	# float
	stfs	%f0, 8(%r2)	# float
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 28(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	bl	min_caml_create_float_array
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
out.24047:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24046
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24047
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24046:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24046
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.24049:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24048
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24049
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24048:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24048
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24051:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24050
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24051
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24050:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24050
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24053:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24052
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24053
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24052:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24052
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
	addi	%r31, %r0, 8	# li
	slw	%r6, %r6, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 16	# li
	slw	%r6, %r7, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 24	# li
	slw	%r6, %r8, %r31
	or	%r5, %r5, %r6
	stw	%r5, 32(%r3)
	lfs	%f0, 32(%r3)	# float
	stfs	%f0, 0(%r2)	# float
out.24055:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24054
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24055
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24054:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24054
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.24057:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24056
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24057
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24056:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24056
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24059:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24058
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24059
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24058:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24058
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24061:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24060
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24061
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24060:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24060
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
	addi	%r31, %r0, 8	# li
	slw	%r6, %r6, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 16	# li
	slw	%r6, %r7, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 24	# li
	slw	%r6, %r8, %r31
	or	%r5, %r5, %r6
	stw	%r5, 32(%r3)
	lfs	%f0, 32(%r3)	# float
	stfs	%f0, 4(%r2)	# float
out.24063:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24062
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24063
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24062:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24062
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.24065:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24064
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24065
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24064:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24064
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24067:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24066
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24067
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24066:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24066
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24069:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24068
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24069
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24068:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24068
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
	addi	%r31, %r0, 8	# li
	slw	%r6, %r6, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 16	# li
	slw	%r6, %r7, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 24	# li
	slw	%r6, %r8, %r31
	or	%r5, %r5, %r6
	stw	%r5, 32(%r3)
	lfs	%f0, 32(%r3)	# float
	stfs	%f0, 8(%r2)	# float
out.24071:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24070
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24071
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24070:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24070
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.24073:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24072
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24073
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24072:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24072
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24075:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24074
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24075
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24074:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24074
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24077:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24076
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24077
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24076:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24076
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
	addi	%r31, %r0, 8	# li
	slw	%r6, %r6, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 16	# li
	slw	%r6, %r7, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 24	# li
	slw	%r6, %r8, %r31
	or	%r5, %r5, %r6
	stw	%r5, 32(%r3)
	lfs	%f0, 32(%r3)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24078
	addi	%r5, %r0, 0	# li
	b	ble_cont.24079
ble_else.24078:
	addi	%r5, %r0, 1	# li
ble_cont.24079:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24080
	addi	%r5, %r0, 1	# li
	b	beq_cont.24081
beq_else.24080:
	addi	%r5, %r0, 0	# li
beq_cont.24081:
	addi	%r6, %r0, 2	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 32(%r3)
	stw	%r5, 36(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	bl	min_caml_create_float_array
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
out.24083:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24082
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24083
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24082:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24082
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.24085:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24084
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24085
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24084:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24084
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24087:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24086
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24087
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24086:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24086
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24089:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24088
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24089
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24088:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24088
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
	addi	%r31, %r0, 8	# li
	slw	%r6, %r6, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 16	# li
	slw	%r6, %r7, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 24	# li
	slw	%r6, %r8, %r31
	or	%r5, %r5, %r6
	stw	%r5, 40(%r3)
	lfs	%f0, 40(%r3)	# float
	stfs	%f0, 0(%r2)	# float
out.24091:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24090
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24091
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24090:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24090
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.24093:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24092
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24093
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24092:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24092
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24095:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24094
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24095
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24094:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24094
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24097:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24096
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24097
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24096:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24096
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
	addi	%r31, %r0, 8	# li
	slw	%r6, %r6, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 16	# li
	slw	%r6, %r7, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 24	# li
	slw	%r6, %r8, %r31
	or	%r5, %r5, %r6
	stw	%r5, 40(%r3)
	lfs	%f0, 40(%r3)	# float
	stfs	%f0, 4(%r2)	# float
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 40(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_create_float_array
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
out.24099:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24098
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24099
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24098:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24098
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.24101:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24100
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24101
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24100:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24100
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24103:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24102
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24103
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24102:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24102
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24105:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24104
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24105
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24104:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24104
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
	addi	%r31, %r0, 8	# li
	slw	%r6, %r6, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 16	# li
	slw	%r6, %r7, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 24	# li
	slw	%r6, %r8, %r31
	or	%r5, %r5, %r6
	stw	%r5, 44(%r3)
	lfs	%f0, 44(%r3)	# float
	stfs	%f0, 0(%r2)	# float
out.24107:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24106
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24107
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24106:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24106
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.24109:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24108
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24109
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24108:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24108
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24111:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24110
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24111
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24110:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24110
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24113:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24112
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24113
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24112:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24112
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
	addi	%r31, %r0, 8	# li
	slw	%r6, %r6, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 16	# li
	slw	%r6, %r7, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 24	# li
	slw	%r6, %r8, %r31
	or	%r5, %r5, %r6
	stw	%r5, 44(%r3)
	lfs	%f0, 44(%r3)	# float
	stfs	%f0, 4(%r2)	# float
out.24115:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24114
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24115
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24114:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24114
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.24117:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24116
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24117
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24116:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24116
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24119:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24118
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24119
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24118:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24118
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24121:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24120
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24121
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24120:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24120
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
	addi	%r31, %r0, 8	# li
	slw	%r6, %r6, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 16	# li
	slw	%r6, %r7, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 24	# li
	slw	%r6, %r8, %r31
	or	%r5, %r5, %r6
	stw	%r5, 44(%r3)
	lfs	%f0, 44(%r3)	# float
	stfs	%f0, 8(%r2)	# float
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 44(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	bl	min_caml_create_float_array
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
	lwz	%r5, 24(%r3)
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24122
	b	beq_cont.24123
beq_else.24122:
out.24125:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24124
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24125
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24124:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24124
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24127:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24126
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24127
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24126:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24126
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24129:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24128
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24129
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24128:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24128
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
out.24131:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24130
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24131
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24130:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24130
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r9, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r9, %r9, %r31
	addi	%r31, %r0, 8	# li
	slw	%r7, %r7, %r31
	or	%r6, %r6, %r7
	addi	%r31, %r0, 16	# li
	slw	%r7, %r8, %r31
	or	%r6, %r6, %r7
	addi	%r31, %r0, 24	# li
	slw	%r7, %r9, %r31
	or	%r6, %r6, %r7
	stw	%r6, 48(%r3)
	lfs	%f0, 48(%r3)	# float
	addis	%r31, %r0, (l.18128)@h	# lis
	ori	%r31, %r31, (l.18128)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	stfs	%f0, 0(%r2)	# float
out.24133:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24132
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24133
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24132:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24132
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24135:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24134
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24135
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24134:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24134
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24137:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24136
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24137
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24136:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24136
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
out.24139:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24138
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24139
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24138:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24138
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r9, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r9, %r9, %r31
	addi	%r31, %r0, 8	# li
	slw	%r7, %r7, %r31
	or	%r6, %r6, %r7
	addi	%r31, %r0, 16	# li
	slw	%r7, %r8, %r31
	or	%r6, %r6, %r7
	addi	%r31, %r0, 24	# li
	slw	%r7, %r9, %r31
	or	%r6, %r6, %r7
	stw	%r6, 48(%r3)
	lfs	%f0, 48(%r3)	# float
	addis	%r31, %r0, (l.18128)@h	# lis
	ori	%r31, %r31, (l.18128)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	stfs	%f0, 4(%r2)	# float
out.24141:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24140
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24141
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24140:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24140
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24143:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24142
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24143
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24142:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24142
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24145:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24144
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24145
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24144:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24144
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
out.24147:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24146
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24147
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24146:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24146
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r9, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r9, %r9, %r31
	addi	%r31, %r0, 8	# li
	slw	%r7, %r7, %r31
	or	%r6, %r6, %r7
	addi	%r31, %r0, 16	# li
	slw	%r7, %r8, %r31
	or	%r6, %r6, %r7
	addi	%r31, %r0, 24	# li
	slw	%r7, %r9, %r31
	or	%r6, %r6, %r7
	stw	%r6, 48(%r3)
	lfs	%f0, 48(%r3)	# float
	addis	%r31, %r0, (l.18128)@h	# lis
	ori	%r31, %r31, (l.18128)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	stfs	%f0, 8(%r2)	# float
beq_cont.24123:
	lwz	%r6, 20(%r3)
	cmpwi	%cr7, %r6, 2
	bne	%cr7, beq_else.24148
	addi	%r7, %r0, 1	# li
	b	beq_cont.24149
beq_else.24148:
	lwz	%r7, 36(%r3)
beq_cont.24149:
	addi	%r8, %r0, 4	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r7, 48(%r3)
	stw	%r2, 52(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 56(%r3)
	addi	%r3, %r3, 60
	bl	min_caml_create_float_array
	addi	%r3, %r3, -60	# subi
	lwz	%r31, 56(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 44
	stw	%r2, 40(%r5)
	lwz	%r2, 52(%r3)
	stw	%r2, 36(%r5)
	lwz	%r6, 44(%r3)
	stw	%r6, 32(%r5)
	lwz	%r6, 40(%r3)
	stw	%r6, 28(%r5)
	lwz	%r6, 48(%r3)
	stw	%r6, 24(%r5)
	lwz	%r6, 32(%r3)
	stw	%r6, 20(%r5)
	lwz	%r6, 28(%r3)
	stw	%r6, 16(%r5)
	lwz	%r7, 24(%r3)
	stw	%r7, 12(%r5)
	lwz	%r8, 16(%r3)
	stw	%r8, 8(%r5)
	lwz	%r8, 20(%r3)
	stw	%r8, 4(%r5)
	lwz	%r9, 12(%r3)
	stw	%r9, 0(%r5)
	lwz	%r9, 8(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r9, %r9, %r31
	lwz	%r10, 4(%r3)
	add %r31, %r10, %r9
	stw %r5, 0(%r31)
	cmpwi	%cr7, %r8, 3
	bne	%cr7, beq_else.24150
	lfs	%f0, 0(%r6)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.24152
	addi	%r5, %r0, 1	# li
	b	beq_cont.24153
beq_else.24152:
	addi	%r5, %r0, 0	# li
beq_cont.24153:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24154
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.24156
	addi	%r5, %r0, 1	# li
	b	beq_cont.24157
beq_else.24156:
	addi	%r5, %r0, 0	# li
beq_cont.24157:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24158
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24160
	addi	%r5, %r0, 0	# li
	b	ble_cont.24161
ble_else.24160:
	addi	%r5, %r0, 1	# li
ble_cont.24161:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24162
	addis	%r31, %r0, (l.18118)@h	# lis
	ori	%r31, %r31, (l.18118)@l
	lfs	%f1, 0(%r31)	# float
	b	beq_cont.24163
beq_else.24162:
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f1, 0(%r31)	# float
beq_cont.24163:
	b	beq_cont.24159
beq_else.24158:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
beq_cont.24159:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
	b	beq_cont.24155
beq_else.24154:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.24155:
	stfs	%f0, 0(%r6)	# float
	lfs	%f0, 4(%r6)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.24164
	addi	%r5, %r0, 1	# li
	b	beq_cont.24165
beq_else.24164:
	addi	%r5, %r0, 0	# li
beq_cont.24165:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24166
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.24168
	addi	%r5, %r0, 1	# li
	b	beq_cont.24169
beq_else.24168:
	addi	%r5, %r0, 0	# li
beq_cont.24169:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24170
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24172
	addi	%r5, %r0, 0	# li
	b	ble_cont.24173
ble_else.24172:
	addi	%r5, %r0, 1	# li
ble_cont.24173:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24174
	addis	%r31, %r0, (l.18118)@h	# lis
	ori	%r31, %r31, (l.18118)@l
	lfs	%f1, 0(%r31)	# float
	b	beq_cont.24175
beq_else.24174:
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f1, 0(%r31)	# float
beq_cont.24175:
	b	beq_cont.24171
beq_else.24170:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
beq_cont.24171:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
	b	beq_cont.24167
beq_else.24166:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.24167:
	stfs	%f0, 4(%r6)	# float
	lfs	%f0, 8(%r6)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.24176
	addi	%r5, %r0, 1	# li
	b	beq_cont.24177
beq_else.24176:
	addi	%r5, %r0, 0	# li
beq_cont.24177:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24178
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.24180
	addi	%r5, %r0, 1	# li
	b	beq_cont.24181
beq_else.24180:
	addi	%r5, %r0, 0	# li
beq_cont.24181:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24182
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24184
	addi	%r5, %r0, 0	# li
	b	ble_cont.24185
ble_else.24184:
	addi	%r5, %r0, 1	# li
ble_cont.24185:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24186
	addis	%r31, %r0, (l.18118)@h	# lis
	ori	%r31, %r31, (l.18118)@l
	lfs	%f1, 0(%r31)	# float
	b	beq_cont.24187
beq_else.24186:
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f1, 0(%r31)	# float
beq_cont.24187:
	b	beq_cont.24183
beq_else.24182:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
beq_cont.24183:
	fmul	%f0, %f0, %f0
	fdiv	%f0, %f1, %f0
	b	beq_cont.24179
beq_else.24178:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.24179:
	stfs	%f0, 8(%r6)	# float
	b	beq_cont.24151
beq_else.24150:
	cmpwi	%cr7, %r8, 2
	bne	%cr7, beq_else.24188
	lwz	%r5, 36(%r3)
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24190
	addi	%r5, %r0, 1	# li
	b	beq_cont.24191
beq_else.24190:
	addi	%r5, %r0, 0	# li
beq_cont.24191:
	lwz	%r29, 0(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 56(%r3)
	addi	%r3, %r3, 60
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -60	# subi
	lwz	%r31, 56(%r3)
	mtlr	%r31	
	b	beq_cont.24189
beq_else.24188:
beq_cont.24189:
beq_cont.24151:
	lwz	%r2, 24(%r3)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24192
	b	beq_cont.24193
beq_else.24192:
	lwz	%r2, 28(%r3)
	lwz	%r5, 52(%r3)
	mflr	%r31	
	stw	%r31, 56(%r3)
	addi	%r3, %r3, 60
	bl	rotate_quadratic_matrix.3019
	addi	%r3, %r3, -60	# subi
	lwz	%r31, 56(%r3)
	mtlr	%r31	
beq_cont.24193:
	addi	%r2, %r0, 1	# li
	blr
read_object.3024:
	lwz	%r5, 8(%r29)
	lwz	%r6, 4(%r29)
	cmpwi	%cr7, %r2, 60
	blt	%cr7, bge_else.24194
	blr
bge_else.24194:
	stw	%r29, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r6, 8(%r3)
	stw	%r2, 12(%r3)
	mflr	%r31	
	or	%r29, %r5, %r5	# mr %r29, %r5
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24196
	lwz	%r2, 8(%r3)
	lwz	%r5, 12(%r3)
	stw	%r5, 0(%r2)
	blr
beq_else.24196:
	lwz	%r2, 12(%r3)
	addi	%r2, %r2, 1
	cmpwi	%cr7, %r2, 60
	blt	%cr7, bge_else.24198
	blr
bge_else.24198:
	lwz	%r29, 4(%r3)
	stw	%r2, 16(%r3)
	mflr	%r31	
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24200
	lwz	%r2, 8(%r3)
	lwz	%r5, 16(%r3)
	stw	%r5, 0(%r2)
	blr
beq_else.24200:
	lwz	%r2, 16(%r3)
	addi	%r2, %r2, 1
	cmpwi	%cr7, %r2, 60
	blt	%cr7, bge_else.24202
	blr
bge_else.24202:
	lwz	%r29, 4(%r3)
	stw	%r2, 20(%r3)
	mflr	%r31	
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24204
	lwz	%r2, 8(%r3)
	lwz	%r5, 20(%r3)
	stw	%r5, 0(%r2)
	blr
beq_else.24204:
	lwz	%r2, 20(%r3)
	addi	%r2, %r2, 1
	cmpwi	%cr7, %r2, 60
	blt	%cr7, bge_else.24206
	blr
bge_else.24206:
	lwz	%r29, 4(%r3)
	stw	%r2, 24(%r3)
	mflr	%r31	
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24208
	lwz	%r2, 8(%r3)
	lwz	%r5, 24(%r3)
	stw	%r5, 0(%r2)
	blr
beq_else.24208:
	lwz	%r2, 24(%r3)
	addi	%r2, %r2, 1
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
read_net_item.3028:
out.24211:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24210
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24211
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24210:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24210
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.24213:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24212
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24213
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24212:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24212
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24215:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24214
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24215
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24214:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24214
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24217:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24216
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24217
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24216:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24216
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
	addi	%r31, %r0, 8	# li
	slw	%r6, %r6, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 16	# li
	slw	%r6, %r7, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 24	# li
	slw	%r6, %r8, %r31
	or	%r5, %r5, %r6
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24218
	addi	%r2, %r2, 1
	addi	%r5, %r0, -1	# li
	b	min_caml_create_array
beq_else.24218:
	addi	%r6, %r2, 1
out.24220:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24219
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24220
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24219:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24219
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24222:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24221
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24222
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24221:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24221
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
out.24224:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24223
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24224
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24223:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24223
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r9, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r9, %r9, %r31
out.24226:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24225
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24226
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24225:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24225
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r10, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r10, %r10, %r31
	addi	%r31, %r0, 8	# li
	slw	%r8, %r8, %r31
	or	%r7, %r7, %r8
	addi	%r31, %r0, 16	# li
	slw	%r8, %r9, %r31
	or	%r7, %r7, %r8
	addi	%r31, %r0, 24	# li
	slw	%r8, %r10, %r31
	or	%r7, %r7, %r8
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.24227
	addi	%r6, %r6, 1
	addi	%r7, %r0, -1	# li
	mflr	%r31	
	or	%r5, %r7, %r7	# mr %r5, %r7
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	min_caml_create_array
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	b	beq_cont.24228
beq_else.24227:
	addi	%r8, %r6, 1
	stw	%r7, 8(%r3)
	stw	%r6, 12(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	bl	read_net_item.3028
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	lwz	%r5, 12(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 8(%r3)
	add %r31, %r2, %r5
	stw %r6, 0(%r31)
beq_cont.24228:
	lwz	%r5, 4(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 0(%r3)
	add %r31, %r2, %r5
	stw %r6, 0(%r31)
	blr
read_or_network.3030:
out.24230:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24229
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24230
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24229:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24229
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.24232:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24231
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24232
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24231:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24231
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24234:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24233
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24234
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24233:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24233
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24236:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24235
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24236
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24235:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24235
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
	addi	%r31, %r0, 8	# li
	slw	%r6, %r6, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 16	# li
	slw	%r6, %r7, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 24	# li
	slw	%r6, %r8, %r31
	or	%r5, %r5, %r6
	stw	%r2, 0(%r3)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24237
	addi	%r5, %r0, 1	# li
	addi	%r6, %r0, -1	# li
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	b	beq_cont.24238
beq_else.24237:
	addi	%r6, %r0, 1	# li
	stw	%r5, 4(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	read_net_item.3028
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	lwz	%r5, 4(%r3)
	stw	%r5, 0(%r2)
	or	%r5, %r2, %r2	# mr %r5, %r2
beq_cont.24238:
	lwz	%r2, 0(%r5)
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.24239
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	b	min_caml_create_array
beq_else.24239:
	lwz	%r2, 0(%r3)
	addi	%r6, %r2, 1
	addi	%r7, %r0, 0	# li
	stw	%r5, 8(%r3)
	stw	%r6, 12(%r3)
	mflr	%r31	
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	bl	read_net_item.3028
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 0(%r5)
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.24240
	lwz	%r2, 12(%r3)
	addi	%r2, %r2, 1
	mflr	%r31	
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	bl	min_caml_create_array
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	b	beq_cont.24241
beq_else.24240:
	lwz	%r2, 12(%r3)
	addi	%r6, %r2, 1
	stw	%r5, 16(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	read_or_network.3030
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtlr	%r31	
	lwz	%r5, 12(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 16(%r3)
	add %r31, %r2, %r5
	stw %r6, 0(%r31)
beq_cont.24241:
	lwz	%r5, 0(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 8(%r3)
	add %r31, %r2, %r5
	stw %r6, 0(%r31)
	blr
read_and_network.3032:
	lwz	%r5, 4(%r29)
out.24243:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24242
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24243
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24242:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24242
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24245:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24244
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24245
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24244:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24244
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
out.24247:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24246
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24247
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24246:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24246
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
out.24249:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24248
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24249
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24248:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24248
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r9, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r9, %r9, %r31
	addi	%r31, %r0, 8	# li
	slw	%r7, %r7, %r31
	or	%r6, %r6, %r7
	addi	%r31, %r0, 16	# li
	slw	%r7, %r8, %r31
	or	%r6, %r6, %r7
	addi	%r31, %r0, 24	# li
	slw	%r7, %r9, %r31
	or	%r6, %r6, %r7
	stw	%r29, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r2, 8(%r3)
	cmpwi	%cr7, %r6, -1
	bne	%cr7, beq_else.24250
	addi	%r6, %r0, 1	# li
	addi	%r7, %r0, -1	# li
	mflr	%r31	
	or	%r5, %r7, %r7	# mr %r5, %r7
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtlr	%r31	
	b	beq_cont.24251
beq_else.24250:
	addi	%r7, %r0, 1	# li
	stw	%r6, 12(%r3)
	mflr	%r31	
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	bl	read_net_item.3028
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	lwz	%r5, 12(%r3)
	stw	%r5, 0(%r2)
beq_cont.24251:
	lwz	%r5, 0(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24252
	blr
beq_else.24252:
	lwz	%r5, 8(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 4(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	addi	%r2, %r5, 1
	addi	%r5, %r0, 0	# li
	stw	%r2, 16(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	read_net_item.3028
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtlr	%r31	
	lwz	%r5, 0(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24254
	blr
beq_else.24254:
	lwz	%r5, 16(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 4(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	addi	%r2, %r5, 1
out.24257:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24256
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24257
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24256:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24256
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.24259:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24258
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24259
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24258:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24258
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.24261:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24260
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24261
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24260:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24260
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r8, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r8, %r8, %r31
out.24263:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.24262
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.24263
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.24262:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.24262
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r9, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r9, %r9, %r31
	addi	%r31, %r0, 8	# li
	slw	%r6, %r6, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 16	# li
	slw	%r6, %r8, %r31
	or	%r5, %r5, %r6
	addi	%r31, %r0, 24	# li
	slw	%r6, %r9, %r31
	or	%r5, %r5, %r6
	stw	%r2, 20(%r3)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24264
	addi	%r5, %r0, 1	# li
	addi	%r6, %r0, -1	# li
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	bl	min_caml_create_array
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	mtlr	%r31	
	b	beq_cont.24265
beq_else.24264:
	addi	%r6, %r0, 1	# li
	stw	%r5, 24(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	read_net_item.3028
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	lwz	%r5, 24(%r3)
	stw	%r5, 0(%r2)
beq_cont.24265:
	lwz	%r5, 0(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24266
	blr
beq_else.24266:
	lwz	%r5, 20(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 4(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	addi	%r2, %r5, 1
	addi	%r5, %r0, 0	# li
	stw	%r2, 28(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	bl	read_net_item.3028
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	lwz	%r5, 0(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24268
	blr
beq_else.24268:
	lwz	%r5, 28(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 4(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	addi	%r2, %r5, 1
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
solver_rect_surface.3036:
	lwz	%r9, 4(%r29)
	addi	%r31, %r0, 2	# li
	slw	%r10, %r6, %r31
	add %r31, %r5, %r10
	lfs %f3, 0(%r31)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f3, %f4
	bne	%cr7, beq_else.24270
	addi	%r10, %r0, 1	# li
	b	beq_cont.24271
beq_else.24270:
	addi	%r10, %r0, 0	# li
beq_cont.24271:
	cmpwi	%cr7, %r10, 0
	bne	%cr7, beq_else.24272
	lwz	%r10, 16(%r2)
	lwz	%r2, 24(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r11, %r6, %r31
	add %r31, %r5, %r11
	lfs %f3, 0(%r31)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f3, %f4
	bgt	%cr7, ble_else.24273
	addi	%r11, %r0, 0	# li
	b	ble_cont.24274
ble_else.24273:
	addi	%r11, %r0, 1	# li
ble_cont.24274:
	cmpwi	%cr7, %r11, 0
	bne	%cr7, beq_else.24275
	addi	%r11, %r0, 1	# li
	b	beq_cont.24276
beq_else.24275:
	addi	%r11, %r0, 0	# li
beq_cont.24276:
	xor	%r2, %r2, %r11
	addi	%r31, %r0, 2	# li
	slw	%r11, %r6, %r31
	add %r31, %r10, %r11
	lfs %f3, 0(%r31)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24277
	fneg	%f3, %f3
	b	beq_cont.24278
beq_else.24277:
beq_cont.24278:
	fsub	%f0, %f3, %f0
	addi	%r31, %r0, 2	# li
	slw	%r2, %r6, %r31
	add %r31, %r5, %r2
	lfs %f3, 0(%r31)
	fdiv	%f0, %f0, %f3
	addi	%r31, %r0, 2	# li
	slw	%r2, %r7, %r31
	add %r31, %r5, %r2
	lfs %f3, 0(%r31)
	fmul	%f3, %f0, %f3
	fadd	%f1, %f3, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f3, 0(%r31)	# float
	fcmpu	%cr7, %f3, %f1
	bgt	%cr7, ble_else.24279
	b	ble_cont.24280
ble_else.24279:
	fneg	%f1, %f1
ble_cont.24280:
	addi	%r31, %r0, 2	# li
	slw	%r2, %r7, %r31
	add %r31, %r10, %r2
	lfs %f3, 0(%r31)
	fcmpu	%cr7, %f3, %f1
	bgt	%cr7, ble_else.24281
	addi	%r2, %r0, 0	# li
	b	ble_cont.24282
ble_else.24281:
	addi	%r2, %r0, 1	# li
ble_cont.24282:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24283
	addi	%r2, %r0, 0	# li
	blr
beq_else.24283:
	addi	%r31, %r0, 2	# li
	slw	%r2, %r8, %r31
	add %r31, %r5, %r2
	lfs %f1, 0(%r31)
	fmul	%f1, %f0, %f1
	fadd	%f1, %f1, %f2
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f2, %f1
	bgt	%cr7, ble_else.24284
	b	ble_cont.24285
ble_else.24284:
	fneg	%f1, %f1
ble_cont.24285:
	addi	%r31, %r0, 2	# li
	slw	%r2, %r8, %r31
	add %r31, %r10, %r2
	lfs %f2, 0(%r31)
	fcmpu	%cr7, %f2, %f1
	bgt	%cr7, ble_else.24286
	addi	%r2, %r0, 0	# li
	b	ble_cont.24287
ble_else.24286:
	addi	%r2, %r0, 1	# li
ble_cont.24287:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24288
	addi	%r2, %r0, 0	# li
	blr
beq_else.24288:
	stfs	%f0, 0(%r9)	# float
	addi	%r2, %r0, 1	# li
	blr
beq_else.24272:
	addi	%r2, %r0, 0	# li
	blr
solver_surface.3051:
	lwz	%r6, 4(%r29)
	lwz	%r2, 16(%r2)
	lfs	%f3, 0(%r5)	# float
	lfs	%f4, 0(%r2)	# float
	fmul	%f3, %f3, %f4
	lfs	%f4, 4(%r5)	# float
	lfs	%f5, 4(%r2)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lfs	%f4, 8(%r5)	# float
	lfs	%f5, 8(%r2)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f3, %f4
	bgt	%cr7, ble_else.24289
	addi	%r5, %r0, 0	# li
	b	ble_cont.24290
ble_else.24289:
	addi	%r5, %r0, 1	# li
ble_cont.24290:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24291
	addi	%r2, %r0, 0	# li
	blr
beq_else.24291:
	lfs	%f4, 0(%r2)	# float
	fmul	%f0, %f4, %f0
	lfs	%f4, 4(%r2)	# float
	fmul	%f1, %f4, %f1
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r2)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	stfs	%f0, 0(%r6)	# float
	addi	%r2, %r0, 1	# li
	blr
quadratic.3057:
	fmul	%f3, %f0, %f0
	lwz	%r5, 16(%r2)
	lfs	%f4, 0(%r5)	# float
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	lwz	%r5, 16(%r2)
	lfs	%f5, 4(%r5)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2
	lwz	%r5, 16(%r2)
	lfs	%f5, 8(%r5)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lwz	%r5, 12(%r2)
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24292
	fmr	%f0, %f3
	blr
beq_else.24292:
	fmul	%f4, %f1, %f2
	lwz	%r5, 36(%r2)
	lfs	%f5, 0(%r5)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f2, %f2, %f0
	lwz	%r5, 36(%r2)
	lfs	%f4, 4(%r5)	# float
	fmul	%f2, %f2, %f4
	fadd	%f2, %f3, %f2
	fmul	%f0, %f0, %f1
	lwz	%r2, 36(%r2)
	lfs	%f1, 8(%r2)	# float
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
	blr
bilinear.3062:
	fmul	%f6, %f0, %f3
	lwz	%r5, 16(%r2)
	lfs	%f7, 0(%r5)	# float
	fmul	%f6, %f6, %f7
	fmul	%f7, %f1, %f4
	lwz	%r5, 16(%r2)
	lfs	%f8, 4(%r5)	# float
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f2, %f5
	lwz	%r5, 16(%r2)
	lfs	%f8, 8(%r5)	# float
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lwz	%r5, 12(%r2)
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24293
	fmr	%f0, %f6
	blr
beq_else.24293:
	fmul	%f7, %f2, %f4
	fmul	%f8, %f1, %f5
	fadd	%f7, %f7, %f8
	lwz	%r5, 36(%r2)
	lfs	%f8, 0(%r5)	# float
	fmul	%f7, %f7, %f8
	fmul	%f5, %f0, %f5
	fmul	%f2, %f2, %f3
	fadd	%f2, %f5, %f2
	lwz	%r5, 36(%r2)
	lfs	%f5, 4(%r5)	# float
	fmul	%f2, %f2, %f5
	fadd	%f2, %f7, %f2
	fmul	%f0, %f0, %f4
	fmul	%f1, %f1, %f3
	fadd	%f0, %f0, %f1
	lwz	%r2, 36(%r2)
	lfs	%f1, 8(%r2)	# float
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
	addis	%r31, %r0, (l.18100)@h	# lis
	ori	%r31, %r31, (l.18100)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	fadd	%f0, %f6, %f0
	blr
solver_second.3070:
	lfs	%f3, 12(%r29)	# float
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	lfs	%f4, 0(%r5)	# float
	lfs	%f5, 4(%r5)	# float
	lfs	%f6, 8(%r5)	# float
	fmul	%f7, %f4, %f4
	lwz	%r8, 16(%r2)
	lfs	%f8, 0(%r8)	# float
	fmul	%f7, %f7, %f8
	fmul	%f8, %f5, %f5
	lwz	%r8, 16(%r2)
	lfs	%f9, 4(%r8)	# float
	fmul	%f8, %f8, %f9
	fadd	%f7, %f7, %f8
	fmul	%f8, %f6, %f6
	lwz	%r8, 16(%r2)
	lfs	%f9, 8(%r8)	# float
	fmul	%f8, %f8, %f9
	fadd	%f7, %f7, %f8
	lwz	%r8, 12(%r2)
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24294
	fmr	%f4, %f7
	b	beq_cont.24295
beq_else.24294:
	fmul	%f8, %f5, %f6
	lwz	%r8, 36(%r2)
	lfs	%f9, 0(%r8)	# float
	fmul	%f8, %f8, %f9
	fadd	%f7, %f7, %f8
	fmul	%f6, %f6, %f4
	lwz	%r8, 36(%r2)
	lfs	%f8, 4(%r8)	# float
	fmul	%f6, %f6, %f8
	fadd	%f6, %f7, %f6
	fmul	%f4, %f4, %f5
	lwz	%r8, 36(%r2)
	lfs	%f5, 8(%r8)	# float
	fmul	%f4, %f4, %f5
	fadd	%f4, %f6, %f4
beq_cont.24295:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f5
	bne	%cr7, beq_else.24296
	addi	%r8, %r0, 1	# li
	b	beq_cont.24297
beq_else.24296:
	addi	%r8, %r0, 0	# li
beq_cont.24297:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24298
	lfs	%f5, 0(%r5)	# float
	lfs	%f6, 4(%r5)	# float
	lfs	%f7, 8(%r5)	# float
	stw	%r7, 0(%r3)
	stw	%r6, 4(%r3)
	stfs	%f3, 8(%r3)	# float
	stfs	%f4, 16(%r3)	# float
	stfs	%f2, 24(%r3)	# float
	stfs	%f1, 32(%r3)	# float
	stw	%r2, 40(%r3)
	stfs	%f0, 48(%r3)	# float
	mflr	%r31	
	fmr	%f4, %f1
	fmr	%f3, %f0
	fmr	%f1, %f6
	fmr	%f0, %f5
	fmr	%f5, %f2
	fmr	%f2, %f7
	stw	%r31, 56(%r3)
	addi	%r3, %r3, 60
	bl	bilinear.3062
	addi	%r3, %r3, -60	# subi
	lwz	%r31, 56(%r3)
	mtlr	%r31	
	lfs	%f1, 48(%r3)	# float
	fmul	%f2, %f1, %f1
	lwz	%r2, 40(%r3)
	lwz	%r5, 16(%r2)
	lfs	%f3, 0(%r5)	# float
	fmul	%f2, %f2, %f3
	lfs	%f3, 32(%r3)	# float
	fmul	%f4, %f3, %f3
	lwz	%r5, 16(%r2)
	lfs	%f5, 4(%r5)	# float
	fmul	%f4, %f4, %f5
	fadd	%f2, %f2, %f4
	lfs	%f4, 24(%r3)	# float
	fmul	%f5, %f4, %f4
	lwz	%r5, 16(%r2)
	lfs	%f6, 8(%r5)	# float
	fmul	%f5, %f5, %f6
	fadd	%f2, %f2, %f5
	lwz	%r5, 12(%r2)
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24300
	fmr	%f1, %f2
	b	beq_cont.24301
beq_else.24300:
	fmul	%f5, %f3, %f4
	lwz	%r5, 36(%r2)
	lfs	%f6, 0(%r5)	# float
	fmul	%f5, %f5, %f6
	fadd	%f2, %f2, %f5
	fmul	%f4, %f4, %f1
	lwz	%r5, 36(%r2)
	lfs	%f5, 4(%r5)	# float
	fmul	%f4, %f4, %f5
	fadd	%f2, %f2, %f4
	fmul	%f1, %f1, %f3
	lwz	%r5, 36(%r2)
	lfs	%f3, 8(%r5)	# float
	fmul	%f1, %f1, %f3
	fadd	%f1, %f2, %f1
beq_cont.24301:
	lwz	%r5, 4(%r2)
	cmpwi	%cr7, %r5, 3
	bne	%cr7, beq_else.24302
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f1, %f1, %f2
	b	beq_cont.24303
beq_else.24302:
beq_cont.24303:
	fmul	%f2, %f0, %f0
	lfs	%f3, 16(%r3)	# float
	fmul	%f1, %f3, %f1
	fsub	%f1, %f2, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f2
	bgt	%cr7, ble_else.24304
	addi	%r5, %r0, 0	# li
	b	ble_cont.24305
ble_else.24304:
	addi	%r5, %r0, 1	# li
ble_cont.24305:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24306
	addi	%r2, %r0, 0	# li
	blr
beq_else.24306:
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f2, 0(%r31)	# float
	fdiv	%f4, %f1, %f2
	fadd	%f4, %f2, %f4
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f5, 0(%r31)	# float
	fdiv	%f4, %f4, %f5
	fsub	%f2, %f4, %f2
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	fcmpu	%cr7, %f5, %f2
	bgt	%cr7, ble_else.24307
	b	ble_cont.24308
ble_else.24307:
	fneg	%f2, %f2
ble_cont.24308:
	lfs	%f5, 8(%r3)	# float
	stfs	%f0, 56(%r3)	# float
	fcmpu	%cr7, %f5, %f2
	bgt	%cr7, ble_else.24309
	fdiv	%f2, %f1, %f4
	fadd	%f2, %f4, %f2
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f6, 0(%r31)	# float
	fdiv	%f2, %f2, %f6
	fsub	%f4, %f2, %f4
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f6, 0(%r31)	# float
	fcmpu	%cr7, %f6, %f4
	bgt	%cr7, ble_else.24311
	b	ble_cont.24312
ble_else.24311:
	fneg	%f4, %f4
ble_cont.24312:
	fcmpu	%cr7, %f5, %f4
	bgt	%cr7, ble_else.24313
	lwz	%r29, 4(%r3)
	mflr	%r31	
	fmr	%f0, %f2
	stw	%r31, 64(%r3)
	addi	%r3, %r3, 68
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -68	# subi
	lwz	%r31, 64(%r3)
	mtlr	%r31	
	b	ble_cont.24314
ble_else.24313:
	fmr	%f0, %f2
ble_cont.24314:
	b	ble_cont.24310
ble_else.24309:
	fmr	%f0, %f4
ble_cont.24310:
	lwz	%r2, 40(%r3)
	lwz	%r2, 24(%r2)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24315
	fneg	%f0, %f0
	b	beq_cont.24316
beq_else.24315:
beq_cont.24316:
	lfs	%f1, 56(%r3)	# float
	fsub	%f0, %f0, %f1
	lfs	%f1, 16(%r3)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r2, 0(%r3)
	stfs	%f0, 0(%r2)	# float
	addi	%r2, %r0, 1	# li
	blr
beq_else.24298:
	addi	%r2, %r0, 0	# li
	blr
solver.3076:
	lwz	%r7, 16(%r29)
	lwz	%r8, 12(%r29)
	lwz	%r9, 8(%r29)
	lwz	%r10, 4(%r29)
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	add %r31, %r10, %r2
	lwz %r2, 0(%r31)
	lfs	%f0, 0(%r6)	# float
	lwz	%r10, 20(%r2)
	lfs	%f1, 0(%r10)	# float
	fsub	%f0, %f0, %f1
	lfs	%f1, 4(%r6)	# float
	lwz	%r10, 20(%r2)
	lfs	%f2, 4(%r10)	# float
	fsub	%f1, %f1, %f2
	lfs	%f2, 8(%r6)	# float
	lwz	%r6, 20(%r2)
	lfs	%f3, 8(%r6)	# float
	fsub	%f2, %f2, %f3
	lwz	%r6, 4(%r2)
	cmpwi	%cr7, %r6, 1
	bne	%cr7, beq_else.24317
	addi	%r6, %r0, 0	# li
	addi	%r7, %r0, 1	# li
	addi	%r9, %r0, 2	# li
	stfs	%f0, 0(%r3)	# float
	stfs	%f2, 8(%r3)	# float
	stfs	%f1, 16(%r3)	# float
	stw	%r5, 24(%r3)
	stw	%r2, 28(%r3)
	stw	%r8, 32(%r3)
	mflr	%r31	
	or	%r29, %r8, %r8	# mr %r29, %r8
	or	%r8, %r9, %r9	# mr %r8, %r9
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24318
	addi	%r6, %r0, 1	# li
	addi	%r7, %r0, 2	# li
	addi	%r8, %r0, 0	# li
	lfs	%f0, 16(%r3)	# float
	lfs	%f1, 8(%r3)	# float
	lfs	%f2, 0(%r3)	# float
	lwz	%r2, 28(%r3)
	lwz	%r5, 24(%r3)
	lwz	%r29, 32(%r3)
	mflr	%r31	
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24319
	addi	%r6, %r0, 2	# li
	addi	%r7, %r0, 0	# li
	addi	%r8, %r0, 1	# li
	lfs	%f0, 8(%r3)	# float
	lfs	%f1, 0(%r3)	# float
	lfs	%f2, 16(%r3)	# float
	lwz	%r2, 28(%r3)
	lwz	%r5, 24(%r3)
	lwz	%r29, 32(%r3)
	mflr	%r31	
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24320
	addi	%r2, %r0, 0	# li
	blr
beq_else.24320:
	addi	%r2, %r0, 3	# li
	blr
beq_else.24319:
	addi	%r2, %r0, 2	# li
	blr
beq_else.24318:
	addi	%r2, %r0, 1	# li
	blr
beq_else.24317:
	cmpwi	%cr7, %r6, 2
	bne	%cr7, beq_else.24321
	lwz	%r2, 16(%r2)
	lfs	%f3, 0(%r5)	# float
	lfs	%f4, 0(%r2)	# float
	fmul	%f3, %f3, %f4
	lfs	%f4, 4(%r5)	# float
	lfs	%f5, 4(%r2)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lfs	%f4, 8(%r5)	# float
	lfs	%f5, 8(%r2)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f3, %f4
	bgt	%cr7, ble_else.24322
	addi	%r5, %r0, 0	# li
	b	ble_cont.24323
ble_else.24322:
	addi	%r5, %r0, 1	# li
ble_cont.24323:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24324
	addi	%r2, %r0, 0	# li
	blr
beq_else.24324:
	lfs	%f4, 0(%r2)	# float
	fmul	%f0, %f4, %f0
	lfs	%f4, 4(%r2)	# float
	fmul	%f1, %f4, %f1
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r2)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	fdiv	%f0, %f0, %f3
	stfs	%f0, 0(%r9)	# float
	addi	%r2, %r0, 1	# li
	blr
beq_else.24321:
	or	%r29, %r7, %r7	# mr %r29, %r7
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
solver_rect_fast.3080:
	lwz	%r7, 4(%r29)
	lfs	%f3, 0(%r6)	# float
	fsub	%f3, %f3, %f0
	lfs	%f4, 4(%r6)	# float
	fmul	%f3, %f3, %f4
	lfs	%f4, 4(%r5)	# float
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	fcmpu	%cr7, %f5, %f4
	bgt	%cr7, ble_else.24325
	b	ble_cont.24326
ble_else.24325:
	fneg	%f4, %f4
ble_cont.24326:
	lwz	%r8, 16(%r2)
	lfs	%f5, 4(%r8)	# float
	fcmpu	%cr7, %f5, %f4
	bgt	%cr7, ble_else.24327
	addi	%r8, %r0, 0	# li
	b	ble_cont.24328
ble_else.24327:
	addi	%r8, %r0, 1	# li
ble_cont.24328:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24329
	addi	%r8, %r0, 0	# li
	b	beq_cont.24330
beq_else.24329:
	lfs	%f4, 8(%r5)	# float
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f2
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	fcmpu	%cr7, %f5, %f4
	bgt	%cr7, ble_else.24331
	b	ble_cont.24332
ble_else.24331:
	fneg	%f4, %f4
ble_cont.24332:
	lwz	%r8, 16(%r2)
	lfs	%f5, 8(%r8)	# float
	fcmpu	%cr7, %f5, %f4
	bgt	%cr7, ble_else.24333
	addi	%r8, %r0, 0	# li
	b	ble_cont.24334
ble_else.24333:
	addi	%r8, %r0, 1	# li
ble_cont.24334:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24335
	addi	%r8, %r0, 0	# li
	b	beq_cont.24336
beq_else.24335:
	lfs	%f4, 4(%r6)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f5
	bne	%cr7, beq_else.24337
	addi	%r8, %r0, 1	# li
	b	beq_cont.24338
beq_else.24337:
	addi	%r8, %r0, 0	# li
beq_cont.24338:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24339
	addi	%r8, %r0, 1	# li
	b	beq_cont.24340
beq_else.24339:
	addi	%r8, %r0, 0	# li
beq_cont.24340:
beq_cont.24336:
beq_cont.24330:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24341
	lfs	%f3, 8(%r6)	# float
	fsub	%f3, %f3, %f1
	lfs	%f4, 12(%r6)	# float
	fmul	%f3, %f3, %f4
	lfs	%f4, 0(%r5)	# float
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f0
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	fcmpu	%cr7, %f5, %f4
	bgt	%cr7, ble_else.24342
	b	ble_cont.24343
ble_else.24342:
	fneg	%f4, %f4
ble_cont.24343:
	lwz	%r8, 16(%r2)
	lfs	%f5, 0(%r8)	# float
	fcmpu	%cr7, %f5, %f4
	bgt	%cr7, ble_else.24344
	addi	%r8, %r0, 0	# li
	b	ble_cont.24345
ble_else.24344:
	addi	%r8, %r0, 1	# li
ble_cont.24345:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24346
	addi	%r8, %r0, 0	# li
	b	beq_cont.24347
beq_else.24346:
	lfs	%f4, 8(%r5)	# float
	fmul	%f4, %f3, %f4
	fadd	%f4, %f4, %f2
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	fcmpu	%cr7, %f5, %f4
	bgt	%cr7, ble_else.24348
	b	ble_cont.24349
ble_else.24348:
	fneg	%f4, %f4
ble_cont.24349:
	lwz	%r8, 16(%r2)
	lfs	%f5, 8(%r8)	# float
	fcmpu	%cr7, %f5, %f4
	bgt	%cr7, ble_else.24350
	addi	%r8, %r0, 0	# li
	b	ble_cont.24351
ble_else.24350:
	addi	%r8, %r0, 1	# li
ble_cont.24351:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24352
	addi	%r8, %r0, 0	# li
	b	beq_cont.24353
beq_else.24352:
	lfs	%f4, 12(%r6)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f5
	bne	%cr7, beq_else.24354
	addi	%r8, %r0, 1	# li
	b	beq_cont.24355
beq_else.24354:
	addi	%r8, %r0, 0	# li
beq_cont.24355:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24356
	addi	%r8, %r0, 1	# li
	b	beq_cont.24357
beq_else.24356:
	addi	%r8, %r0, 0	# li
beq_cont.24357:
beq_cont.24353:
beq_cont.24347:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24358
	lfs	%f3, 16(%r6)	# float
	fsub	%f2, %f3, %f2
	lfs	%f3, 20(%r6)	# float
	fmul	%f2, %f2, %f3
	lfs	%f3, 0(%r5)	# float
	fmul	%f3, %f2, %f3
	fadd	%f0, %f3, %f0
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f3, 0(%r31)	# float
	fcmpu	%cr7, %f3, %f0
	bgt	%cr7, ble_else.24359
	b	ble_cont.24360
ble_else.24359:
	fneg	%f0, %f0
ble_cont.24360:
	lwz	%r8, 16(%r2)
	lfs	%f3, 0(%r8)	# float
	fcmpu	%cr7, %f3, %f0
	bgt	%cr7, ble_else.24361
	addi	%r8, %r0, 0	# li
	b	ble_cont.24362
ble_else.24361:
	addi	%r8, %r0, 1	# li
ble_cont.24362:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24363
	addi	%r2, %r0, 0	# li
	b	beq_cont.24364
beq_else.24363:
	lfs	%f0, 4(%r5)	# float
	fmul	%f0, %f2, %f0
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24365
	b	ble_cont.24366
ble_else.24365:
	fneg	%f0, %f0
ble_cont.24366:
	lwz	%r2, 16(%r2)
	lfs	%f1, 4(%r2)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24367
	addi	%r2, %r0, 0	# li
	b	ble_cont.24368
ble_else.24367:
	addi	%r2, %r0, 1	# li
ble_cont.24368:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24369
	addi	%r2, %r0, 0	# li
	b	beq_cont.24370
beq_else.24369:
	lfs	%f0, 20(%r6)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.24371
	addi	%r2, %r0, 1	# li
	b	beq_cont.24372
beq_else.24371:
	addi	%r2, %r0, 0	# li
beq_cont.24372:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24373
	addi	%r2, %r0, 1	# li
	b	beq_cont.24374
beq_else.24373:
	addi	%r2, %r0, 0	# li
beq_cont.24374:
beq_cont.24370:
beq_cont.24364:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24375
	addi	%r2, %r0, 0	# li
	blr
beq_else.24375:
	stfs	%f2, 0(%r7)	# float
	addi	%r2, %r0, 3	# li
	blr
beq_else.24358:
	stfs	%f3, 0(%r7)	# float
	addi	%r2, %r0, 2	# li
	blr
beq_else.24341:
	stfs	%f3, 0(%r7)	# float
	addi	%r2, %r0, 1	# li
	blr
solver_second_fast.3093:
	lfs	%f3, 12(%r29)	# float
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	lfs	%f4, 0(%r5)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f5
	bne	%cr7, beq_else.24376
	addi	%r8, %r0, 1	# li
	b	beq_cont.24377
beq_else.24376:
	addi	%r8, %r0, 0	# li
beq_cont.24377:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24378
	lfs	%f5, 4(%r5)	# float
	fmul	%f5, %f5, %f0
	lfs	%f6, 8(%r5)	# float
	fmul	%f6, %f6, %f1
	fadd	%f5, %f5, %f6
	lfs	%f6, 12(%r5)	# float
	fmul	%f6, %f6, %f2
	fadd	%f5, %f5, %f6
	fmul	%f6, %f0, %f0
	lwz	%r8, 16(%r2)
	lfs	%f7, 0(%r8)	# float
	fmul	%f6, %f6, %f7
	fmul	%f7, %f1, %f1
	lwz	%r8, 16(%r2)
	lfs	%f8, 4(%r8)	# float
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f7, %f2, %f2
	lwz	%r8, 16(%r2)
	lfs	%f8, 8(%r8)	# float
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	lwz	%r8, 12(%r2)
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24379
	fmr	%f0, %f6
	b	beq_cont.24380
beq_else.24379:
	fmul	%f7, %f1, %f2
	lwz	%r8, 36(%r2)
	lfs	%f8, 0(%r8)	# float
	fmul	%f7, %f7, %f8
	fadd	%f6, %f6, %f7
	fmul	%f2, %f2, %f0
	lwz	%r8, 36(%r2)
	lfs	%f7, 4(%r8)	# float
	fmul	%f2, %f2, %f7
	fadd	%f2, %f6, %f2
	fmul	%f0, %f0, %f1
	lwz	%r8, 36(%r2)
	lfs	%f1, 8(%r8)	# float
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
beq_cont.24380:
	lwz	%r8, 4(%r2)
	cmpwi	%cr7, %r8, 3
	bne	%cr7, beq_else.24381
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	beq_cont.24382
beq_else.24381:
beq_cont.24382:
	fmul	%f1, %f5, %f5
	fmul	%f0, %f4, %f0
	fsub	%f1, %f1, %f0
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24383
	addi	%r8, %r0, 0	# li
	b	ble_cont.24384
ble_else.24383:
	addi	%r8, %r0, 1	# li
ble_cont.24384:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24385
	addi	%r2, %r0, 0	# li
	blr
beq_else.24385:
	lwz	%r2, 24(%r2)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24386
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f0, 0(%r31)	# float
	fdiv	%f2, %f1, %f0
	fadd	%f2, %f0, %f2
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f4, 0(%r31)	# float
	fdiv	%f2, %f2, %f4
	fsub	%f0, %f2, %f0
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f0
	bgt	%cr7, ble_else.24388
	b	ble_cont.24389
ble_else.24388:
	fneg	%f0, %f0
ble_cont.24389:
	stw	%r7, 0(%r3)
	stw	%r5, 4(%r3)
	stfs	%f5, 8(%r3)	# float
	fcmpu	%cr7, %f3, %f0
	bgt	%cr7, ble_else.24390
	fdiv	%f0, %f1, %f2
	fadd	%f0, %f2, %f0
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f4, 0(%r31)	# float
	fdiv	%f0, %f0, %f4
	fsub	%f2, %f0, %f2
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f2
	bgt	%cr7, ble_else.24392
	b	ble_cont.24393
ble_else.24392:
	fneg	%f2, %f2
ble_cont.24393:
	fcmpu	%cr7, %f3, %f2
	bgt	%cr7, ble_else.24394
	mflr	%r31	
	or	%r29, %r6, %r6	# mr %r29, %r6
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	b	ble_cont.24395
ble_else.24394:
ble_cont.24395:
	b	ble_cont.24391
ble_else.24390:
	fmr	%f0, %f2
ble_cont.24391:
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	lfs	%f1, 16(%r2)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 0(%r3)
	stfs	%f0, 0(%r2)	# float
	b	beq_cont.24387
beq_else.24386:
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f0, 0(%r31)	# float
	fdiv	%f2, %f1, %f0
	fadd	%f2, %f0, %f2
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f4, 0(%r31)	# float
	fdiv	%f2, %f2, %f4
	fsub	%f0, %f2, %f0
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f0
	bgt	%cr7, ble_else.24396
	b	ble_cont.24397
ble_else.24396:
	fneg	%f0, %f0
ble_cont.24397:
	stw	%r7, 0(%r3)
	stw	%r5, 4(%r3)
	stfs	%f5, 8(%r3)	# float
	fcmpu	%cr7, %f3, %f0
	bgt	%cr7, ble_else.24398
	fdiv	%f0, %f1, %f2
	fadd	%f0, %f2, %f0
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f4, 0(%r31)	# float
	fdiv	%f0, %f0, %f4
	fsub	%f2, %f0, %f2
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f2
	bgt	%cr7, ble_else.24400
	b	ble_cont.24401
ble_else.24400:
	fneg	%f2, %f2
ble_cont.24401:
	fcmpu	%cr7, %f3, %f2
	bgt	%cr7, ble_else.24402
	mflr	%r31	
	or	%r29, %r6, %r6	# mr %r29, %r6
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	b	ble_cont.24403
ble_else.24402:
ble_cont.24403:
	b	ble_cont.24399
ble_else.24398:
	fmr	%f0, %f2
ble_cont.24399:
	lfs	%f1, 8(%r3)	# float
	fadd	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	lfs	%f1, 16(%r2)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 0(%r3)
	stfs	%f0, 0(%r2)	# float
beq_cont.24387:
	addi	%r2, %r0, 1	# li
	blr
beq_else.24378:
	addi	%r2, %r0, 0	# li
	blr
solver_second_fast2.3110:
	lfs	%f3, 12(%r29)	# float
	lwz	%r7, 8(%r29)
	lwz	%r8, 4(%r29)
	lfs	%f4, 0(%r5)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f5
	bne	%cr7, beq_else.24404
	addi	%r9, %r0, 1	# li
	b	beq_cont.24405
beq_else.24404:
	addi	%r9, %r0, 0	# li
beq_cont.24405:
	cmpwi	%cr7, %r9, 0
	bne	%cr7, beq_else.24406
	lfs	%f5, 4(%r5)	# float
	fmul	%f0, %f5, %f0
	lfs	%f5, 8(%r5)	# float
	fmul	%f1, %f5, %f1
	fadd	%f0, %f0, %f1
	lfs	%f1, 12(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 12(%r6)	# float
	fmul	%f2, %f0, %f0
	fmul	%f1, %f4, %f1
	fsub	%f1, %f2, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f2
	bgt	%cr7, ble_else.24407
	addi	%r6, %r0, 0	# li
	b	ble_cont.24408
ble_else.24407:
	addi	%r6, %r0, 1	# li
ble_cont.24408:
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.24409
	addi	%r2, %r0, 0	# li
	blr
beq_else.24409:
	lwz	%r2, 24(%r2)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24410
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f2, 0(%r31)	# float
	fdiv	%f4, %f1, %f2
	fadd	%f4, %f2, %f4
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f5, 0(%r31)	# float
	fdiv	%f4, %f4, %f5
	fsub	%f2, %f4, %f2
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	fcmpu	%cr7, %f5, %f2
	bgt	%cr7, ble_else.24412
	b	ble_cont.24413
ble_else.24412:
	fneg	%f2, %f2
ble_cont.24413:
	stw	%r8, 0(%r3)
	stw	%r5, 4(%r3)
	stfs	%f0, 8(%r3)	# float
	fcmpu	%cr7, %f3, %f2
	bgt	%cr7, ble_else.24414
	fdiv	%f2, %f1, %f4
	fadd	%f2, %f4, %f2
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f5, 0(%r31)	# float
	fdiv	%f2, %f2, %f5
	fsub	%f4, %f2, %f4
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	fcmpu	%cr7, %f5, %f4
	bgt	%cr7, ble_else.24416
	b	ble_cont.24417
ble_else.24416:
	fneg	%f4, %f4
ble_cont.24417:
	fcmpu	%cr7, %f3, %f4
	bgt	%cr7, ble_else.24418
	mflr	%r31	
	or	%r29, %r7, %r7	# mr %r29, %r7
	fmr	%f0, %f2
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	b	ble_cont.24419
ble_else.24418:
	fmr	%f0, %f2
ble_cont.24419:
	b	ble_cont.24415
ble_else.24414:
	fmr	%f0, %f4
ble_cont.24415:
	lfs	%f1, 8(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	lfs	%f1, 16(%r2)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 0(%r3)
	stfs	%f0, 0(%r2)	# float
	b	beq_cont.24411
beq_else.24410:
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f2, 0(%r31)	# float
	fdiv	%f4, %f1, %f2
	fadd	%f4, %f2, %f4
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f5, 0(%r31)	# float
	fdiv	%f4, %f4, %f5
	fsub	%f2, %f4, %f2
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	fcmpu	%cr7, %f5, %f2
	bgt	%cr7, ble_else.24420
	b	ble_cont.24421
ble_else.24420:
	fneg	%f2, %f2
ble_cont.24421:
	stw	%r8, 0(%r3)
	stw	%r5, 4(%r3)
	stfs	%f0, 8(%r3)	# float
	fcmpu	%cr7, %f3, %f2
	bgt	%cr7, ble_else.24422
	fdiv	%f2, %f1, %f4
	fadd	%f2, %f4, %f2
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f5, 0(%r31)	# float
	fdiv	%f2, %f2, %f5
	fsub	%f4, %f2, %f4
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	fcmpu	%cr7, %f5, %f4
	bgt	%cr7, ble_else.24424
	b	ble_cont.24425
ble_else.24424:
	fneg	%f4, %f4
ble_cont.24425:
	fcmpu	%cr7, %f3, %f4
	bgt	%cr7, ble_else.24426
	mflr	%r31	
	or	%r29, %r7, %r7	# mr %r29, %r7
	fmr	%f0, %f2
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	b	ble_cont.24427
ble_else.24426:
	fmr	%f0, %f2
ble_cont.24427:
	b	ble_cont.24423
ble_else.24422:
	fmr	%f0, %f4
ble_cont.24423:
	lfs	%f1, 8(%r3)	# float
	fadd	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	lfs	%f1, 16(%r2)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 0(%r3)
	stfs	%f0, 0(%r2)	# float
beq_cont.24411:
	addi	%r2, %r0, 1	# li
	blr
beq_else.24406:
	addi	%r2, %r0, 0	# li
	blr
solver_fast2.3117:
	lwz	%r6, 16(%r29)
	lwz	%r7, 12(%r29)
	lwz	%r8, 8(%r29)
	lwz	%r9, 4(%r29)
	addi	%r31, %r0, 2	# li
	slw	%r10, %r2, %r31
	add %r31, %r9, %r10
	lwz %r9, 0(%r31)
	lwz	%r10, 40(%r9)
	lfs	%f0, 0(%r10)	# float
	lfs	%f1, 4(%r10)	# float
	lfs	%f2, 8(%r10)	# float
	lwz	%r11, 4(%r5)
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	add %r31, %r11, %r2
	lwz %r2, 0(%r31)
	lwz	%r11, 4(%r9)
	cmpwi	%cr7, %r11, 1
	bne	%cr7, beq_else.24428
	lwz	%r5, 0(%r5)
	or	%r6, %r2, %r2	# mr %r6, %r2
	or	%r29, %r7, %r7	# mr %r29, %r7
	or	%r2, %r9, %r9	# mr %r2, %r9
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
beq_else.24428:
	cmpwi	%cr7, %r11, 2
	bne	%cr7, beq_else.24429
	lfs	%f0, 0(%r2)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24430
	addi	%r5, %r0, 0	# li
	b	ble_cont.24431
ble_else.24430:
	addi	%r5, %r0, 1	# li
ble_cont.24431:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24432
	addi	%r5, %r0, 1	# li
	b	beq_cont.24433
beq_else.24432:
	addi	%r5, %r0, 0	# li
beq_cont.24433:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24434
	addi	%r2, %r0, 0	# li
	blr
beq_else.24434:
	lfs	%f0, 0(%r2)	# float
	lfs	%f1, 12(%r10)	# float
	fmul	%f0, %f0, %f1
	stfs	%f0, 0(%r8)	# float
	addi	%r2, %r0, 1	# li
	blr
beq_else.24429:
	or	%r5, %r2, %r2	# mr %r5, %r2
	or	%r29, %r6, %r6	# mr %r29, %r6
	or	%r6, %r10, %r10	# mr %r6, %r10
	or	%r2, %r9, %r9	# mr %r2, %r9
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
setup_rect_table.3120:
	addi	%r6, %r0, 6	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	min_caml_create_float_array
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	lwz	%r5, 4(%r3)
	lfs	%f0, 0(%r5)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.24435
	addi	%r6, %r0, 1	# li
	b	beq_cont.24436
beq_else.24435:
	addi	%r6, %r0, 0	# li
beq_cont.24436:
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.24437
	lwz	%r6, 0(%r3)
	lwz	%r7, 24(%r6)
	lfs	%f0, 0(%r5)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24439
	addi	%r8, %r0, 0	# li
	b	ble_cont.24440
ble_else.24439:
	addi	%r8, %r0, 1	# li
ble_cont.24440:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24441
	addi	%r8, %r0, 1	# li
	b	beq_cont.24442
beq_else.24441:
	addi	%r8, %r0, 0	# li
beq_cont.24442:
	xor	%r7, %r7, %r8
	lwz	%r8, 16(%r6)
	lfs	%f0, 0(%r8)	# float
	cmpwi	%cr7, %r7, 0
	bne	%cr7, beq_else.24443
	fneg	%f0, %f0
	b	beq_cont.24444
beq_else.24443:
beq_cont.24444:
	stfs	%f0, 0(%r2)	# float
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 0(%r5)	# float
	fdiv	%f0, %f0, %f1
	stfs	%f0, 4(%r2)	# float
	b	beq_cont.24438
beq_else.24437:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stfs	%f0, 4(%r2)	# float
beq_cont.24438:
	lfs	%f0, 4(%r5)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.24445
	addi	%r6, %r0, 1	# li
	b	beq_cont.24446
beq_else.24445:
	addi	%r6, %r0, 0	# li
beq_cont.24446:
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.24447
	lwz	%r6, 0(%r3)
	lwz	%r7, 24(%r6)
	lfs	%f0, 4(%r5)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24449
	addi	%r8, %r0, 0	# li
	b	ble_cont.24450
ble_else.24449:
	addi	%r8, %r0, 1	# li
ble_cont.24450:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24451
	addi	%r8, %r0, 1	# li
	b	beq_cont.24452
beq_else.24451:
	addi	%r8, %r0, 0	# li
beq_cont.24452:
	xor	%r7, %r7, %r8
	lwz	%r8, 16(%r6)
	lfs	%f0, 4(%r8)	# float
	cmpwi	%cr7, %r7, 0
	bne	%cr7, beq_else.24453
	fneg	%f0, %f0
	b	beq_cont.24454
beq_else.24453:
beq_cont.24454:
	stfs	%f0, 8(%r2)	# float
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 4(%r5)	# float
	fdiv	%f0, %f0, %f1
	stfs	%f0, 12(%r2)	# float
	b	beq_cont.24448
beq_else.24447:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stfs	%f0, 12(%r2)	# float
beq_cont.24448:
	lfs	%f0, 8(%r5)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.24455
	addi	%r6, %r0, 1	# li
	b	beq_cont.24456
beq_else.24455:
	addi	%r6, %r0, 0	# li
beq_cont.24456:
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.24457
	lwz	%r6, 0(%r3)
	lwz	%r7, 24(%r6)
	lfs	%f0, 8(%r5)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24459
	addi	%r8, %r0, 0	# li
	b	ble_cont.24460
ble_else.24459:
	addi	%r8, %r0, 1	# li
ble_cont.24460:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24461
	addi	%r8, %r0, 1	# li
	b	beq_cont.24462
beq_else.24461:
	addi	%r8, %r0, 0	# li
beq_cont.24462:
	xor	%r7, %r7, %r8
	lwz	%r6, 16(%r6)
	lfs	%f0, 8(%r6)	# float
	cmpwi	%cr7, %r7, 0
	bne	%cr7, beq_else.24463
	fneg	%f0, %f0
	b	beq_cont.24464
beq_else.24463:
beq_cont.24464:
	stfs	%f0, 16(%r2)	# float
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 8(%r5)	# float
	fdiv	%f0, %f0, %f1
	stfs	%f0, 20(%r2)	# float
	b	beq_cont.24458
beq_else.24457:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stfs	%f0, 20(%r2)	# float
beq_cont.24458:
	blr
setup_surface_table.3123:
	addi	%r6, %r0, 4	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	min_caml_create_float_array
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	lwz	%r5, 4(%r3)
	lfs	%f0, 0(%r5)	# float
	lwz	%r6, 0(%r3)
	lwz	%r7, 16(%r6)
	lfs	%f1, 0(%r7)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 4(%r5)	# float
	lwz	%r7, 16(%r6)
	lfs	%f2, 4(%r7)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r5)	# float
	lwz	%r5, 16(%r6)
	lfs	%f2, 8(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24465
	addi	%r5, %r0, 0	# li
	b	ble_cont.24466
ble_else.24465:
	addi	%r5, %r0, 1	# li
ble_cont.24466:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24467
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stfs	%f0, 0(%r2)	# float
	b	beq_cont.24468
beq_else.24467:
	addis	%r31, %r0, (l.18118)@h	# lis
	ori	%r31, %r31, (l.18118)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f1, %f1, %f0
	stfs	%f1, 0(%r2)	# float
	lwz	%r5, 16(%r6)
	lfs	%f1, 0(%r5)	# float
	fdiv	%f1, %f1, %f0
	fneg	%f1, %f1
	stfs	%f1, 4(%r2)	# float
	lwz	%r5, 16(%r6)
	lfs	%f1, 4(%r5)	# float
	fdiv	%f1, %f1, %f0
	fneg	%f1, %f1
	stfs	%f1, 8(%r2)	# float
	lwz	%r5, 16(%r6)
	lfs	%f1, 8(%r5)	# float
	fdiv	%f0, %f1, %f0
	fneg	%f0, %f0
	stfs	%f0, 12(%r2)	# float
beq_cont.24468:
	blr
setup_second_table.3126:
	addi	%r6, %r0, 5	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	min_caml_create_float_array
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	lwz	%r5, 4(%r3)
	lfs	%f0, 0(%r5)	# float
	lfs	%f1, 4(%r5)	# float
	lfs	%f2, 8(%r5)	# float
	fmul	%f3, %f0, %f0
	lwz	%r6, 0(%r3)
	lwz	%r7, 16(%r6)
	lfs	%f4, 0(%r7)	# float
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	lwz	%r7, 16(%r6)
	lfs	%f5, 4(%r7)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2
	lwz	%r7, 16(%r6)
	lfs	%f5, 8(%r7)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lwz	%r7, 12(%r6)
	cmpwi	%cr7, %r7, 0
	bne	%cr7, beq_else.24469
	fmr	%f0, %f3
	b	beq_cont.24470
beq_else.24469:
	fmul	%f4, %f1, %f2
	lwz	%r7, 36(%r6)
	lfs	%f5, 0(%r7)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f2, %f2, %f0
	lwz	%r7, 36(%r6)
	lfs	%f4, 4(%r7)	# float
	fmul	%f2, %f2, %f4
	fadd	%f2, %f3, %f2
	fmul	%f0, %f0, %f1
	lwz	%r7, 36(%r6)
	lfs	%f1, 8(%r7)	# float
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
beq_cont.24470:
	lfs	%f1, 0(%r5)	# float
	lwz	%r7, 16(%r6)
	lfs	%f2, 0(%r7)	# float
	fmul	%f1, %f1, %f2
	fneg	%f1, %f1
	lfs	%f2, 4(%r5)	# float
	lwz	%r7, 16(%r6)
	lfs	%f3, 4(%r7)	# float
	fmul	%f2, %f2, %f3
	fneg	%f2, %f2
	lfs	%f3, 8(%r5)	# float
	lwz	%r7, 16(%r6)
	lfs	%f4, 8(%r7)	# float
	fmul	%f3, %f3, %f4
	fneg	%f3, %f3
	stfs	%f0, 0(%r2)	# float
	lwz	%r7, 12(%r6)
	cmpwi	%cr7, %r7, 0
	bne	%cr7, beq_else.24471
	stfs	%f1, 4(%r2)	# float
	stfs	%f2, 8(%r2)	# float
	stfs	%f3, 12(%r2)	# float
	b	beq_cont.24472
beq_else.24471:
	lfs	%f4, 8(%r5)	# float
	lwz	%r7, 36(%r6)
	lfs	%f5, 4(%r7)	# float
	fmul	%f4, %f4, %f5
	lfs	%f5, 4(%r5)	# float
	lwz	%r7, 36(%r6)
	lfs	%f6, 8(%r7)	# float
	fmul	%f5, %f5, %f6
	fadd	%f4, %f4, %f5
	addis	%r31, %r0, (l.18100)@h	# lis
	ori	%r31, %r31, (l.18100)@l
	lfs	%f5, 0(%r31)	# float
	fmul	%f4, %f4, %f5
	fsub	%f1, %f1, %f4
	stfs	%f1, 4(%r2)	# float
	lfs	%f1, 8(%r5)	# float
	lwz	%r7, 36(%r6)
	lfs	%f4, 0(%r7)	# float
	fmul	%f1, %f1, %f4
	lfs	%f4, 0(%r5)	# float
	lwz	%r7, 36(%r6)
	lfs	%f5, 8(%r7)	# float
	fmul	%f4, %f4, %f5
	fadd	%f1, %f1, %f4
	addis	%r31, %r0, (l.18100)@h	# lis
	ori	%r31, %r31, (l.18100)@l
	lfs	%f4, 0(%r31)	# float
	fmul	%f1, %f1, %f4
	fsub	%f1, %f2, %f1
	stfs	%f1, 8(%r2)	# float
	lfs	%f1, 4(%r5)	# float
	lwz	%r7, 36(%r6)
	lfs	%f2, 0(%r7)	# float
	fmul	%f1, %f1, %f2
	lfs	%f2, 0(%r5)	# float
	lwz	%r5, 36(%r6)
	lfs	%f4, 4(%r5)	# float
	fmul	%f2, %f2, %f4
	fadd	%f1, %f1, %f2
	addis	%r31, %r0, (l.18100)@h	# lis
	ori	%r31, %r31, (l.18100)@l
	lfs	%f2, 0(%r31)	# float
	fmul	%f1, %f1, %f2
	fsub	%f1, %f3, %f1
	stfs	%f1, 12(%r2)	# float
beq_cont.24472:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.24473
	addi	%r5, %r0, 1	# li
	b	beq_cont.24474
beq_else.24473:
	addi	%r5, %r0, 0	# li
beq_cont.24474:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24475
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f1, %f0
	stfs	%f0, 16(%r2)	# float
	b	beq_cont.24476
beq_else.24475:
beq_cont.24476:
	blr
iter_setup_dirvec_constants.3129:
	lwz	%r6, 4(%r29)
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.24477
	addi	%r31, %r0, 2	# li
	slw	%r7, %r5, %r31
	add %r31, %r6, %r7
	lwz %r7, 0(%r31)
	lwz	%r8, 4(%r2)
	lwz	%r9, 0(%r2)
	lwz	%r10, 4(%r7)
	stw	%r29, 0(%r3)
	stw	%r2, 4(%r3)
	stw	%r6, 8(%r3)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.24478
	stw	%r8, 12(%r3)
	stw	%r5, 16(%r3)
	mflr	%r31	
	or	%r5, %r7, %r7	# mr %r5, %r7
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	setup_rect_table.3120
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtlr	%r31	
	lwz	%r5, 16(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 12(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.24479
beq_else.24478:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.24480
	stw	%r8, 12(%r3)
	stw	%r5, 16(%r3)
	mflr	%r31	
	or	%r5, %r7, %r7	# mr %r5, %r7
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	setup_surface_table.3123
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtlr	%r31	
	lwz	%r5, 16(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 12(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.24481
beq_else.24480:
	stw	%r8, 12(%r3)
	stw	%r5, 16(%r3)
	mflr	%r31	
	or	%r5, %r7, %r7	# mr %r5, %r7
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	setup_second_table.3126
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtlr	%r31	
	lwz	%r5, 16(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 12(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.24481:
beq_cont.24479:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.24482
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 8(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 4(%r3)
	lwz	%r8, 4(%r7)
	lwz	%r9, 0(%r7)
	lwz	%r10, 4(%r5)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.24483
	stw	%r8, 20(%r3)
	stw	%r2, 24(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	setup_rect_table.3120
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	lwz	%r5, 24(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 20(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.24484
beq_else.24483:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.24485
	stw	%r8, 20(%r3)
	stw	%r2, 24(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	setup_surface_table.3123
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	lwz	%r5, 24(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 20(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.24486
beq_else.24485:
	stw	%r8, 20(%r3)
	stw	%r2, 24(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	setup_second_table.3126
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	lwz	%r5, 24(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 20(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.24486:
beq_cont.24484:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.24487
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 8(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 4(%r3)
	lwz	%r8, 4(%r7)
	lwz	%r9, 0(%r7)
	lwz	%r10, 4(%r5)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.24488
	stw	%r8, 28(%r3)
	stw	%r2, 32(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	setup_rect_table.3120
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	lwz	%r5, 32(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 28(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.24489
beq_else.24488:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.24490
	stw	%r8, 28(%r3)
	stw	%r2, 32(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	setup_surface_table.3123
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	lwz	%r5, 32(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 28(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.24491
beq_else.24490:
	stw	%r8, 28(%r3)
	stw	%r2, 32(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	setup_second_table.3126
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	lwz	%r5, 32(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 28(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.24491:
beq_cont.24489:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.24492
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 8(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r6, 4(%r3)
	lwz	%r7, 4(%r6)
	lwz	%r8, 0(%r6)
	lwz	%r9, 4(%r5)
	cmpwi	%cr7, %r9, 1
	bne	%cr7, beq_else.24493
	stw	%r7, 36(%r3)
	stw	%r2, 40(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	setup_rect_table.3120
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	lwz	%r5, 40(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 36(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.24494
beq_else.24493:
	cmpwi	%cr7, %r9, 2
	bne	%cr7, beq_else.24495
	stw	%r7, 36(%r3)
	stw	%r2, 40(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	setup_surface_table.3123
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	lwz	%r5, 40(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 36(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.24496
beq_else.24495:
	stw	%r7, 36(%r3)
	stw	%r2, 40(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	setup_second_table.3126
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	lwz	%r5, 40(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 36(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.24496:
beq_cont.24494:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 4(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
bge_else.24492:
	blr
bge_else.24487:
	blr
bge_else.24482:
	blr
bge_else.24477:
	blr
setup_startp_constants.3134:
	lwz	%r6, 4(%r29)
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.24501
	addi	%r31, %r0, 2	# li
	slw	%r7, %r5, %r31
	add %r31, %r6, %r7
	lwz %r6, 0(%r31)
	lwz	%r7, 40(%r6)
	lwz	%r8, 4(%r6)
	lfs	%f0, 0(%r2)	# float
	lwz	%r9, 20(%r6)
	lfs	%f1, 0(%r9)	# float
	fsub	%f0, %f0, %f1
	stfs	%f0, 0(%r7)	# float
	lfs	%f0, 4(%r2)	# float
	lwz	%r9, 20(%r6)
	lfs	%f1, 4(%r9)	# float
	fsub	%f0, %f0, %f1
	stfs	%f0, 4(%r7)	# float
	lfs	%f0, 8(%r2)	# float
	lwz	%r9, 20(%r6)
	lfs	%f1, 8(%r9)	# float
	fsub	%f0, %f0, %f1
	stfs	%f0, 8(%r7)	# float
	cmpwi	%cr7, %r8, 2
	bne	%cr7, beq_else.24502
	lwz	%r6, 16(%r6)
	lfs	%f0, 0(%r7)	# float
	lfs	%f1, 4(%r7)	# float
	lfs	%f2, 8(%r7)	# float
	lfs	%f3, 0(%r6)	# float
	fmul	%f0, %f3, %f0
	lfs	%f3, 4(%r6)	# float
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 12(%r7)	# float
	b	beq_cont.24503
beq_else.24502:
	cmpwi	%cr7, %r8, 2	
	bgt	%cr7, ble_else.24504
	b	ble_cont.24505
ble_else.24504:
	lfs	%f0, 0(%r7)	# float
	lfs	%f1, 4(%r7)	# float
	lfs	%f2, 8(%r7)	# float
	fmul	%f3, %f0, %f0
	lwz	%r9, 16(%r6)
	lfs	%f4, 0(%r9)	# float
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	lwz	%r9, 16(%r6)
	lfs	%f5, 4(%r9)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2
	lwz	%r9, 16(%r6)
	lfs	%f5, 8(%r9)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lwz	%r9, 12(%r6)
	cmpwi	%cr7, %r9, 0
	bne	%cr7, beq_else.24506
	fmr	%f0, %f3
	b	beq_cont.24507
beq_else.24506:
	fmul	%f4, %f1, %f2
	lwz	%r9, 36(%r6)
	lfs	%f5, 0(%r9)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f2, %f2, %f0
	lwz	%r9, 36(%r6)
	lfs	%f4, 4(%r9)	# float
	fmul	%f2, %f2, %f4
	fadd	%f2, %f3, %f2
	fmul	%f0, %f0, %f1
	lwz	%r6, 36(%r6)
	lfs	%f1, 8(%r6)	# float
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
beq_cont.24507:
	cmpwi	%cr7, %r8, 3
	bne	%cr7, beq_else.24508
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	beq_cont.24509
beq_else.24508:
beq_cont.24509:
	stfs	%f0, 12(%r7)	# float
ble_cont.24505:
beq_cont.24503:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
bge_else.24501:
	blr
is_rect_outside.3139:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f3, 0(%r31)	# float
	fcmpu	%cr7, %f3, %f0
	bgt	%cr7, ble_else.24511
	b	ble_cont.24512
ble_else.24511:
	fneg	%f0, %f0
ble_cont.24512:
	lwz	%r5, 16(%r2)
	lfs	%f3, 0(%r5)	# float
	fcmpu	%cr7, %f3, %f0
	bgt	%cr7, ble_else.24513
	addi	%r5, %r0, 0	# li
	b	ble_cont.24514
ble_else.24513:
	addi	%r5, %r0, 1	# li
ble_cont.24514:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24515
	addi	%r5, %r0, 0	# li
	b	beq_cont.24516
beq_else.24515:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24517
	fmr	%f0, %f1
	b	ble_cont.24518
ble_else.24517:
	fneg	%f0, %f1
ble_cont.24518:
	lwz	%r5, 16(%r2)
	lfs	%f1, 4(%r5)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24519
	addi	%r5, %r0, 0	# li
	b	ble_cont.24520
ble_else.24519:
	addi	%r5, %r0, 1	# li
ble_cont.24520:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24521
	addi	%r5, %r0, 0	# li
	b	beq_cont.24522
beq_else.24521:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f2
	bgt	%cr7, ble_else.24523
	fmr	%f0, %f2
	b	ble_cont.24524
ble_else.24523:
	fneg	%f0, %f2
ble_cont.24524:
	lwz	%r5, 16(%r2)
	lfs	%f1, 8(%r5)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24525
	addi	%r5, %r0, 0	# li
	b	ble_cont.24526
ble_else.24525:
	addi	%r5, %r0, 1	# li
ble_cont.24526:
beq_cont.24522:
beq_cont.24516:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24527
	lwz	%r2, 24(%r2)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24528
	addi	%r2, %r0, 1	# li
	blr
beq_else.24528:
	addi	%r2, %r0, 0	# li
	blr
beq_else.24527:
	lwz	%r2, 24(%r2)
	blr
is_second_outside.3149:
	fmul	%f3, %f0, %f0
	lwz	%r5, 16(%r2)
	lfs	%f4, 0(%r5)	# float
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1
	lwz	%r5, 16(%r2)
	lfs	%f5, 4(%r5)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2
	lwz	%r5, 16(%r2)
	lfs	%f5, 8(%r5)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lwz	%r5, 12(%r2)
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24529
	fmr	%f0, %f3
	b	beq_cont.24530
beq_else.24529:
	fmul	%f4, %f1, %f2
	lwz	%r5, 36(%r2)
	lfs	%f5, 0(%r5)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f2, %f2, %f0
	lwz	%r5, 36(%r2)
	lfs	%f4, 4(%r5)	# float
	fmul	%f2, %f2, %f4
	fadd	%f2, %f3, %f2
	fmul	%f0, %f0, %f1
	lwz	%r5, 36(%r2)
	lfs	%f1, 8(%r5)	# float
	fmul	%f0, %f0, %f1
	fadd	%f0, %f2, %f0
beq_cont.24530:
	lwz	%r5, 4(%r2)
	cmpwi	%cr7, %r5, 3
	bne	%cr7, beq_else.24531
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	beq_cont.24532
beq_else.24531:
beq_cont.24532:
	lwz	%r2, 24(%r2)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24533
	addi	%r5, %r0, 0	# li
	b	ble_cont.24534
ble_else.24533:
	addi	%r5, %r0, 1	# li
ble_cont.24534:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24535
	addi	%r5, %r0, 1	# li
	b	beq_cont.24536
beq_else.24535:
	addi	%r5, %r0, 0	# li
beq_cont.24536:
	xor	%r2, %r2, %r5
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24537
	addi	%r2, %r0, 1	# li
	blr
beq_else.24537:
	addi	%r2, %r0, 0	# li
	blr
is_outside.3154:
	lwz	%r5, 20(%r2)
	lfs	%f3, 0(%r5)	# float
	fsub	%f0, %f0, %f3
	lwz	%r5, 20(%r2)
	lfs	%f3, 4(%r5)	# float
	fsub	%f1, %f1, %f3
	lwz	%r5, 20(%r2)
	lfs	%f3, 8(%r5)	# float
	fsub	%f2, %f2, %f3
	lwz	%r5, 4(%r2)
	cmpwi	%cr7, %r5, 1
	bne	%cr7, beq_else.24538
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f3, 0(%r31)	# float
	fcmpu	%cr7, %f3, %f0
	bgt	%cr7, ble_else.24539
	b	ble_cont.24540
ble_else.24539:
	fneg	%f0, %f0
ble_cont.24540:
	lwz	%r5, 16(%r2)
	lfs	%f3, 0(%r5)	# float
	fcmpu	%cr7, %f3, %f0
	bgt	%cr7, ble_else.24541
	addi	%r5, %r0, 0	# li
	b	ble_cont.24542
ble_else.24541:
	addi	%r5, %r0, 1	# li
ble_cont.24542:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24543
	addi	%r5, %r0, 0	# li
	b	beq_cont.24544
beq_else.24543:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24545
	fmr	%f0, %f1
	b	ble_cont.24546
ble_else.24545:
	fneg	%f0, %f1
ble_cont.24546:
	lwz	%r5, 16(%r2)
	lfs	%f1, 4(%r5)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24547
	addi	%r5, %r0, 0	# li
	b	ble_cont.24548
ble_else.24547:
	addi	%r5, %r0, 1	# li
ble_cont.24548:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24549
	addi	%r5, %r0, 0	# li
	b	beq_cont.24550
beq_else.24549:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f2
	bgt	%cr7, ble_else.24551
	fmr	%f0, %f2
	b	ble_cont.24552
ble_else.24551:
	fneg	%f0, %f2
ble_cont.24552:
	lwz	%r5, 16(%r2)
	lfs	%f1, 8(%r5)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24553
	addi	%r5, %r0, 0	# li
	b	ble_cont.24554
ble_else.24553:
	addi	%r5, %r0, 1	# li
ble_cont.24554:
beq_cont.24550:
beq_cont.24544:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24555
	lwz	%r2, 24(%r2)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24556
	addi	%r2, %r0, 1	# li
	blr
beq_else.24556:
	addi	%r2, %r0, 0	# li
	blr
beq_else.24555:
	lwz	%r2, 24(%r2)
	blr
beq_else.24538:
	cmpwi	%cr7, %r5, 2
	bne	%cr7, beq_else.24557
	lwz	%r5, 16(%r2)
	lfs	%f3, 0(%r5)	# float
	fmul	%f0, %f3, %f0
	lfs	%f3, 4(%r5)	# float
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lwz	%r2, 24(%r2)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24558
	addi	%r5, %r0, 0	# li
	b	ble_cont.24559
ble_else.24558:
	addi	%r5, %r0, 1	# li
ble_cont.24559:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24560
	addi	%r5, %r0, 1	# li
	b	beq_cont.24561
beq_else.24560:
	addi	%r5, %r0, 0	# li
beq_cont.24561:
	xor	%r2, %r2, %r5
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24562
	addi	%r2, %r0, 1	# li
	blr
beq_else.24562:
	addi	%r2, %r0, 0	# li
	blr
beq_else.24557:
	stw	%r2, 0(%r3)
	mflr	%r31	
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	quadratic.3057
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtlr	%r31	
	lwz	%r2, 0(%r3)
	lwz	%r5, 4(%r2)
	cmpwi	%cr7, %r5, 3
	bne	%cr7, beq_else.24563
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	b	beq_cont.24564
beq_else.24563:
beq_cont.24564:
	lwz	%r2, 24(%r2)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24565
	addi	%r5, %r0, 0	# li
	b	ble_cont.24566
ble_else.24565:
	addi	%r5, %r0, 1	# li
ble_cont.24566:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24567
	addi	%r5, %r0, 1	# li
	b	beq_cont.24568
beq_else.24567:
	addi	%r5, %r0, 0	# li
beq_cont.24568:
	xor	%r2, %r2, %r5
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24569
	addi	%r2, %r0, 1	# li
	blr
beq_else.24569:
	addi	%r2, %r0, 0	# li
	blr
check_all_inside.3159:
	lwz	%r6, 4(%r29)
	addi	%r31, %r0, 2	# li
	slw	%r7, %r2, %r31
	add %r31, %r5, %r7
	lwz %r7, 0(%r31)
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.24570
	addi	%r2, %r0, 1	# li
	blr
beq_else.24570:
	addi	%r31, %r0, 2	# li
	slw	%r7, %r7, %r31
	add %r31, %r6, %r7
	lwz %r7, 0(%r31)
	lwz	%r8, 20(%r7)
	lfs	%f3, 0(%r8)	# float
	fsub	%f3, %f0, %f3
	lwz	%r8, 20(%r7)
	lfs	%f4, 4(%r8)	# float
	fsub	%f4, %f1, %f4
	lwz	%r8, 20(%r7)
	lfs	%f5, 8(%r8)	# float
	fsub	%f5, %f2, %f5
	lwz	%r8, 4(%r7)
	stw	%r29, 0(%r3)
	stfs	%f2, 8(%r3)	# float
	stfs	%f1, 16(%r3)	# float
	stfs	%f0, 24(%r3)	# float
	stw	%r6, 32(%r3)
	stw	%r5, 36(%r3)
	stw	%r2, 40(%r3)
	cmpwi	%cr7, %r8, 1
	bne	%cr7, beq_else.24572
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f6, 0(%r31)	# float
	fcmpu	%cr7, %f6, %f3
	bgt	%cr7, ble_else.24574
	b	ble_cont.24575
ble_else.24574:
	fneg	%f3, %f3
ble_cont.24575:
	lwz	%r8, 16(%r7)
	lfs	%f6, 0(%r8)	# float
	fcmpu	%cr7, %f6, %f3
	bgt	%cr7, ble_else.24576
	addi	%r8, %r0, 0	# li
	b	ble_cont.24577
ble_else.24576:
	addi	%r8, %r0, 1	# li
ble_cont.24577:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24578
	addi	%r8, %r0, 0	# li
	b	beq_cont.24579
beq_else.24578:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f3, 0(%r31)	# float
	fcmpu	%cr7, %f3, %f4
	bgt	%cr7, ble_else.24580
	fmr	%f3, %f4
	b	ble_cont.24581
ble_else.24580:
	fneg	%f3, %f4
ble_cont.24581:
	lwz	%r8, 16(%r7)
	lfs	%f4, 4(%r8)	# float
	fcmpu	%cr7, %f4, %f3
	bgt	%cr7, ble_else.24582
	addi	%r8, %r0, 0	# li
	b	ble_cont.24583
ble_else.24582:
	addi	%r8, %r0, 1	# li
ble_cont.24583:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24584
	addi	%r8, %r0, 0	# li
	b	beq_cont.24585
beq_else.24584:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f3, 0(%r31)	# float
	fcmpu	%cr7, %f3, %f5
	bgt	%cr7, ble_else.24586
	fmr	%f3, %f5
	b	ble_cont.24587
ble_else.24586:
	fneg	%f3, %f5
ble_cont.24587:
	lwz	%r8, 16(%r7)
	lfs	%f4, 8(%r8)	# float
	fcmpu	%cr7, %f4, %f3
	bgt	%cr7, ble_else.24588
	addi	%r8, %r0, 0	# li
	b	ble_cont.24589
ble_else.24588:
	addi	%r8, %r0, 1	# li
ble_cont.24589:
beq_cont.24585:
beq_cont.24579:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24590
	lwz	%r7, 24(%r7)
	cmpwi	%cr7, %r7, 0
	bne	%cr7, beq_else.24592
	addi	%r2, %r0, 1	# li
	b	beq_cont.24593
beq_else.24592:
	addi	%r2, %r0, 0	# li
beq_cont.24593:
	b	beq_cont.24591
beq_else.24590:
	lwz	%r7, 24(%r7)
	or	%r2, %r7, %r7	# mr %r2, %r7
beq_cont.24591:
	b	beq_cont.24573
beq_else.24572:
	cmpwi	%cr7, %r8, 2
	bne	%cr7, beq_else.24594
	lwz	%r8, 16(%r7)
	lfs	%f6, 0(%r8)	# float
	fmul	%f3, %f6, %f3
	lfs	%f6, 4(%r8)	# float
	fmul	%f4, %f6, %f4
	fadd	%f3, %f3, %f4
	lfs	%f4, 8(%r8)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lwz	%r7, 24(%r7)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f3, %f4
	bgt	%cr7, ble_else.24596
	addi	%r8, %r0, 0	# li
	b	ble_cont.24597
ble_else.24596:
	addi	%r8, %r0, 1	# li
ble_cont.24597:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24598
	addi	%r8, %r0, 1	# li
	b	beq_cont.24599
beq_else.24598:
	addi	%r8, %r0, 0	# li
beq_cont.24599:
	xor	%r7, %r7, %r8
	cmpwi	%cr7, %r7, 0
	bne	%cr7, beq_else.24600
	addi	%r2, %r0, 1	# li
	b	beq_cont.24601
beq_else.24600:
	addi	%r2, %r0, 0	# li
beq_cont.24601:
	b	beq_cont.24595
beq_else.24594:
	mflr	%r31	
	or	%r2, %r7, %r7	# mr %r2, %r7
	fmr	%f2, %f5
	fmr	%f1, %f4
	fmr	%f0, %f3
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	is_second_outside.3149
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
beq_cont.24595:
beq_cont.24573:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24602
	lwz	%r2, 40(%r3)
	addi	%r2, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 36(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24603
	addi	%r2, %r0, 1	# li
	blr
beq_else.24603:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r7, 32(%r3)
	add %r31, %r7, %r5
	lwz %r5, 0(%r31)
	lfs	%f0, 24(%r3)	# float
	lfs	%f1, 16(%r3)	# float
	lfs	%f2, 8(%r3)	# float
	stw	%r2, 44(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	bl	is_outside.3154
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24604
	lwz	%r2, 44(%r3)
	addi	%r2, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 36(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24605
	addi	%r2, %r0, 1	# li
	blr
beq_else.24605:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r7, 32(%r3)
	add %r31, %r7, %r5
	lwz %r5, 0(%r31)
	lwz	%r8, 20(%r5)
	lfs	%f0, 0(%r8)	# float
	lfs	%f1, 24(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r8, 20(%r5)
	lfs	%f2, 4(%r8)	# float
	lfs	%f3, 16(%r3)	# float
	fsub	%f2, %f3, %f2
	lwz	%r8, 20(%r5)
	lfs	%f4, 8(%r8)	# float
	lfs	%f5, 8(%r3)	# float
	fsub	%f4, %f5, %f4
	lwz	%r8, 4(%r5)
	stw	%r2, 48(%r3)
	cmpwi	%cr7, %r8, 1
	bne	%cr7, beq_else.24606
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	fmr	%f1, %f2
	fmr	%f2, %f4
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	is_rect_outside.3139
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
	b	beq_cont.24607
beq_else.24606:
	cmpwi	%cr7, %r8, 2
	bne	%cr7, beq_else.24608
	lwz	%r8, 16(%r5)
	lfs	%f6, 0(%r8)	# float
	fmul	%f0, %f6, %f0
	lfs	%f6, 4(%r8)	# float
	fmul	%f2, %f6, %f2
	fadd	%f0, %f0, %f2
	lfs	%f2, 8(%r8)	# float
	fmul	%f2, %f2, %f4
	fadd	%f0, %f0, %f2
	lwz	%r5, 24(%r5)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f2
	bgt	%cr7, ble_else.24610
	addi	%r8, %r0, 0	# li
	b	ble_cont.24611
ble_else.24610:
	addi	%r8, %r0, 1	# li
ble_cont.24611:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24612
	addi	%r8, %r0, 1	# li
	b	beq_cont.24613
beq_else.24612:
	addi	%r8, %r0, 0	# li
beq_cont.24613:
	xor	%r5, %r5, %r8
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24614
	addi	%r2, %r0, 1	# li
	b	beq_cont.24615
beq_else.24614:
	addi	%r2, %r0, 0	# li
beq_cont.24615:
	b	beq_cont.24609
beq_else.24608:
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	fmr	%f1, %f2
	fmr	%f2, %f4
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	is_second_outside.3149
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
beq_cont.24609:
beq_cont.24607:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24616
	lwz	%r2, 48(%r3)
	addi	%r2, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 36(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24617
	addi	%r2, %r0, 1	# li
	blr
beq_else.24617:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r7, 32(%r3)
	add %r31, %r7, %r5
	lwz %r5, 0(%r31)
	lfs	%f0, 24(%r3)	# float
	lfs	%f1, 16(%r3)	# float
	lfs	%f2, 8(%r3)	# float
	stw	%r2, 52(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 56(%r3)
	addi	%r3, %r3, 60
	bl	is_outside.3154
	addi	%r3, %r3, -60	# subi
	lwz	%r31, 56(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24618
	lwz	%r2, 52(%r3)
	addi	%r2, %r2, 1
	lfs	%f0, 24(%r3)	# float
	lfs	%f1, 16(%r3)	# float
	lfs	%f2, 8(%r3)	# float
	lwz	%r5, 36(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
beq_else.24618:
	addi	%r2, %r0, 0	# li
	blr
beq_else.24616:
	addi	%r2, %r0, 0	# li
	blr
beq_else.24604:
	addi	%r2, %r0, 0	# li
	blr
beq_else.24602:
	addi	%r2, %r0, 0	# li
	blr
shadow_check_and_group.3165:
	lwz	%r6, 36(%r29)
	lwz	%r7, 32(%r29)
	lwz	%r8, 28(%r29)
	lwz	%r9, 24(%r29)
	lwz	%r10, 20(%r29)
	lwz	%r11, 16(%r29)
	lwz	%r12, 12(%r29)
	lwz	%r13, 8(%r29)
	lwz	%r14, 4(%r29)
	addi	%r31, %r0, 2	# li
	slw	%r15, %r2, %r31
	add %r31, %r5, %r15
	lwz %r15, 0(%r31)
	cmpwi	%cr7, %r15, -1
	bne	%cr7, beq_else.24619
	addi	%r2, %r0, 0	# li
	blr
beq_else.24619:
	addi	%r31, %r0, 2	# li
	slw	%r15, %r2, %r31
	add %r31, %r5, %r15
	lwz %r15, 0(%r31)
	addi	%r31, %r0, 2	# li
	slw	%r16, %r15, %r31
	add %r31, %r10, %r16
	lwz %r16, 0(%r31)
	lfs	%f0, 0(%r12)	# float
	lwz	%r17, 20(%r16)
	lfs	%f1, 0(%r17)	# float
	fsub	%f0, %f0, %f1
	lfs	%f1, 4(%r12)	# float
	lwz	%r17, 20(%r16)
	lfs	%f2, 4(%r17)	# float
	fsub	%f1, %f1, %f2
	lfs	%f2, 8(%r12)	# float
	lwz	%r17, 20(%r16)
	lfs	%f3, 8(%r17)	# float
	fsub	%f2, %f2, %f3
	addi	%r31, %r0, 2	# li
	slw	%r17, %r15, %r31
	add %r31, %r13, %r17
	lwz %r13, 0(%r31)
	lwz	%r17, 4(%r16)
	stw	%r14, 0(%r3)
	stw	%r12, 4(%r3)
	stw	%r11, 8(%r3)
	stw	%r5, 12(%r3)
	stw	%r29, 16(%r3)
	stw	%r2, 20(%r3)
	stw	%r10, 24(%r3)
	stw	%r15, 28(%r3)
	stw	%r9, 32(%r3)
	cmpwi	%cr7, %r17, 1
	bne	%cr7, beq_else.24620
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r2, %r16, %r16	# mr %r2, %r16
	or	%r29, %r8, %r8	# mr %r29, %r8
	or	%r6, %r13, %r13	# mr %r6, %r13
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	b	beq_cont.24621
beq_else.24620:
	cmpwi	%cr7, %r17, 2
	bne	%cr7, beq_else.24622
	lfs	%f3, 0(%r13)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f3, %f4
	bgt	%cr7, ble_else.24624
	addi	%r6, %r0, 0	# li
	b	ble_cont.24625
ble_else.24624:
	addi	%r6, %r0, 1	# li
ble_cont.24625:
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.24626
	addi	%r6, %r0, 1	# li
	b	beq_cont.24627
beq_else.24626:
	addi	%r6, %r0, 0	# li
beq_cont.24627:
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.24628
	addi	%r2, %r0, 0	# li
	b	beq_cont.24629
beq_else.24628:
	lfs	%f3, 4(%r13)	# float
	fmul	%f0, %f3, %f0
	lfs	%f3, 8(%r13)	# float
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	lfs	%f1, 12(%r13)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 0(%r9)	# float
	addi	%r2, %r0, 1	# li
beq_cont.24629:
	b	beq_cont.24623
beq_else.24622:
	mflr	%r31	
	or	%r5, %r13, %r13	# mr %r5, %r13
	or	%r2, %r16, %r16	# mr %r2, %r16
	or	%r29, %r7, %r7	# mr %r29, %r7
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
beq_cont.24623:
beq_cont.24621:
	lwz	%r5, 32(%r3)
	lfs	%f0, 0(%r5)	# float
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24630
	addi	%r2, %r0, 0	# li
	b	beq_cont.24631
beq_else.24630:
	addis	%r31, %r0, (l.18515)@h	# lis
	ori	%r31, %r31, (l.18515)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24632
	addi	%r2, %r0, 0	# li
	b	ble_cont.24633
ble_else.24632:
	addi	%r2, %r0, 1	# li
ble_cont.24633:
beq_cont.24631:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24634
	lwz	%r2, 28(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	lwz	%r5, 24(%r3)
	add %r31, %r5, %r2
	lwz %r2, 0(%r31)
	lwz	%r2, 24(%r2)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24635
	addi	%r2, %r0, 0	# li
	blr
beq_else.24635:
	lwz	%r2, 20(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 12(%r3)
	lwz	%r29, 16(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
beq_else.24634:
	addis	%r31, %r0, (l.18516)@h	# lis
	ori	%r31, %r31, (l.18516)@l
	lfs	%f1, 0(%r31)	# float
	fadd	%f0, %f0, %f1
	lwz	%r2, 8(%r3)
	lfs	%f1, 0(%r2)	# float
	fmul	%f1, %f1, %f0
	lwz	%r5, 4(%r3)
	lfs	%f2, 0(%r5)	# float
	fadd	%f1, %f1, %f2
	lfs	%f2, 4(%r2)	# float
	fmul	%f2, %f2, %f0
	lfs	%f3, 4(%r5)	# float
	fadd	%f2, %f2, %f3
	lfs	%f3, 8(%r2)	# float
	fmul	%f0, %f3, %f0
	lfs	%f3, 8(%r5)	# float
	fadd	%f0, %f0, %f3
	lwz	%r5, 12(%r3)
	lwz	%r2, 0(%r5)
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.24636
	addi	%r2, %r0, 1	# li
	b	beq_cont.24637
beq_else.24636:
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	lwz	%r6, 24(%r3)
	add %r31, %r6, %r2
	lwz %r2, 0(%r31)
	stfs	%f0, 40(%r3)	# float
	stfs	%f2, 48(%r3)	# float
	stfs	%f1, 56(%r3)	# float
	mflr	%r31	
	fmr	%f31, %f2
	fmr	%f2, %f0
	fmr	%f0, %f1
	fmr	%f1, %f31
	stw	%r31, 64(%r3)
	addi	%r3, %r3, 68
	bl	is_outside.3154
	addi	%r3, %r3, -68	# subi
	lwz	%r31, 64(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24639
	lwz	%r5, 12(%r3)
	lwz	%r2, 4(%r5)
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.24641
	addi	%r2, %r0, 1	# li
	b	beq_cont.24642
beq_else.24641:
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	lwz	%r6, 24(%r3)
	add %r31, %r6, %r2
	lwz %r2, 0(%r31)
	lwz	%r7, 20(%r2)
	lfs	%f0, 0(%r7)	# float
	lfs	%f1, 56(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r7, 20(%r2)
	lfs	%f2, 4(%r7)	# float
	lfs	%f3, 48(%r3)	# float
	fsub	%f2, %f3, %f2
	lwz	%r7, 20(%r2)
	lfs	%f4, 8(%r7)	# float
	lfs	%f5, 40(%r3)	# float
	fsub	%f4, %f5, %f4
	lwz	%r7, 4(%r2)
	cmpwi	%cr7, %r7, 1
	bne	%cr7, beq_else.24643
	mflr	%r31	
	fmr	%f1, %f2
	fmr	%f2, %f4
	stw	%r31, 64(%r3)
	addi	%r3, %r3, 68
	bl	is_rect_outside.3139
	addi	%r3, %r3, -68	# subi
	lwz	%r31, 64(%r3)
	mtlr	%r31	
	b	beq_cont.24644
beq_else.24643:
	cmpwi	%cr7, %r7, 2
	bne	%cr7, beq_else.24645
	lwz	%r7, 16(%r2)
	lfs	%f6, 0(%r7)	# float
	fmul	%f0, %f6, %f0
	lfs	%f6, 4(%r7)	# float
	fmul	%f2, %f6, %f2
	fadd	%f0, %f0, %f2
	lfs	%f2, 8(%r7)	# float
	fmul	%f2, %f2, %f4
	fadd	%f0, %f0, %f2
	lwz	%r2, 24(%r2)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f2
	bgt	%cr7, ble_else.24647
	addi	%r7, %r0, 0	# li
	b	ble_cont.24648
ble_else.24647:
	addi	%r7, %r0, 1	# li
ble_cont.24648:
	cmpwi	%cr7, %r7, 0
	bne	%cr7, beq_else.24649
	addi	%r7, %r0, 1	# li
	b	beq_cont.24650
beq_else.24649:
	addi	%r7, %r0, 0	# li
beq_cont.24650:
	xor	%r2, %r2, %r7
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24651
	addi	%r2, %r0, 1	# li
	b	beq_cont.24652
beq_else.24651:
	addi	%r2, %r0, 0	# li
beq_cont.24652:
	b	beq_cont.24646
beq_else.24645:
	mflr	%r31	
	fmr	%f1, %f2
	fmr	%f2, %f4
	stw	%r31, 64(%r3)
	addi	%r3, %r3, 68
	bl	is_second_outside.3149
	addi	%r3, %r3, -68	# subi
	lwz	%r31, 64(%r3)
	mtlr	%r31	
beq_cont.24646:
beq_cont.24644:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24653
	lwz	%r5, 12(%r3)
	lwz	%r2, 8(%r5)
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.24655
	addi	%r2, %r0, 1	# li
	b	beq_cont.24656
beq_else.24655:
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	lwz	%r6, 24(%r3)
	add %r31, %r6, %r2
	lwz %r2, 0(%r31)
	lfs	%f0, 56(%r3)	# float
	lfs	%f1, 48(%r3)	# float
	lfs	%f2, 40(%r3)	# float
	mflr	%r31	
	stw	%r31, 64(%r3)
	addi	%r3, %r3, 68
	bl	is_outside.3154
	addi	%r3, %r3, -68	# subi
	lwz	%r31, 64(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24657
	addi	%r2, %r0, 3	# li
	lfs	%f0, 56(%r3)	# float
	lfs	%f1, 48(%r3)	# float
	lfs	%f2, 40(%r3)	# float
	lwz	%r5, 12(%r3)
	lwz	%r29, 0(%r3)
	mflr	%r31	
	stw	%r31, 64(%r3)
	addi	%r3, %r3, 68
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -68	# subi
	lwz	%r31, 64(%r3)
	mtlr	%r31	
	b	beq_cont.24658
beq_else.24657:
	addi	%r2, %r0, 0	# li
beq_cont.24658:
beq_cont.24656:
	b	beq_cont.24654
beq_else.24653:
	addi	%r2, %r0, 0	# li
beq_cont.24654:
beq_cont.24642:
	b	beq_cont.24640
beq_else.24639:
	addi	%r2, %r0, 0	# li
beq_cont.24640:
beq_cont.24637:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24659
	lwz	%r2, 20(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 12(%r3)
	lwz	%r29, 16(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
beq_else.24659:
	addi	%r2, %r0, 1	# li
	blr
shadow_check_one_or_group.3168:
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	addi	%r31, %r0, 2	# li
	slw	%r8, %r2, %r31
	add %r31, %r5, %r8
	lwz %r8, 0(%r31)
	cmpwi	%cr7, %r8, -1
	bne	%cr7, beq_else.24660
	addi	%r2, %r0, 0	# li
	blr
beq_else.24660:
	addi	%r31, %r0, 2	# li
	slw	%r8, %r8, %r31
	add %r31, %r7, %r8
	lwz %r8, 0(%r31)
	addi	%r9, %r0, 0	# li
	stw	%r29, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r7, 8(%r3)
	stw	%r5, 12(%r3)
	stw	%r2, 16(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r9, %r9	# mr %r2, %r9
	or	%r29, %r6, %r6	# mr %r29, %r6
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24661
	lwz	%r2, 16(%r3)
	addi	%r2, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 12(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24662
	addi	%r2, %r0, 0	# li
	blr
beq_else.24662:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r7, 8(%r3)
	add %r31, %r7, %r5
	lwz %r5, 0(%r31)
	addi	%r8, %r0, 0	# li
	lwz	%r29, 4(%r3)
	stw	%r2, 20(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24663
	lwz	%r2, 20(%r3)
	addi	%r2, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 12(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24664
	addi	%r2, %r0, 0	# li
	blr
beq_else.24664:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r7, 8(%r3)
	add %r31, %r7, %r5
	lwz %r5, 0(%r31)
	addi	%r8, %r0, 0	# li
	lwz	%r29, 4(%r3)
	stw	%r2, 24(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24665
	lwz	%r2, 24(%r3)
	addi	%r2, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 12(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24666
	addi	%r2, %r0, 0	# li
	blr
beq_else.24666:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r7, 8(%r3)
	add %r31, %r7, %r5
	lwz %r5, 0(%r31)
	addi	%r7, %r0, 0	# li
	lwz	%r29, 4(%r3)
	stw	%r2, 28(%r3)
	mflr	%r31	
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24667
	lwz	%r2, 28(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 12(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
beq_else.24667:
	addi	%r2, %r0, 1	# li
	blr
beq_else.24665:
	addi	%r2, %r0, 1	# li
	blr
beq_else.24663:
	addi	%r2, %r0, 1	# li
	blr
beq_else.24661:
	addi	%r2, %r0, 1	# li
	blr
shadow_check_one_or_matrix.3171:
	lwz	%r6, 40(%r29)
	lwz	%r7, 36(%r29)
	lwz	%r8, 32(%r29)
	lwz	%r9, 28(%r29)
	lwz	%r10, 24(%r29)
	lwz	%r11, 20(%r29)
	lwz	%r12, 16(%r29)
	lwz	%r13, 12(%r29)
	lwz	%r14, 8(%r29)
	lwz	%r15, 4(%r29)
	addi	%r31, %r0, 2	# li
	slw	%r16, %r2, %r31
	add %r31, %r5, %r16
	lwz %r16, 0(%r31)
	lwz	%r17, 0(%r16)
	cmpwi	%cr7, %r17, -1
	bne	%cr7, beq_else.24668
	addi	%r2, %r0, 0	# li
	blr
beq_else.24668:
	stw	%r10, 0(%r3)
	stw	%r11, 4(%r3)
	stw	%r15, 8(%r3)
	stw	%r16, 12(%r3)
	stw	%r5, 16(%r3)
	stw	%r29, 20(%r3)
	stw	%r2, 24(%r3)
	cmpwi	%cr7, %r17, 99
	bne	%cr7, beq_else.24669
	addi	%r2, %r0, 1	# li
	b	beq_cont.24670
beq_else.24669:
	addi	%r31, %r0, 2	# li
	slw	%r18, %r17, %r31
	add %r31, %r12, %r18
	lwz %r12, 0(%r31)
	lfs	%f0, 0(%r13)	# float
	lwz	%r18, 20(%r12)
	lfs	%f1, 0(%r18)	# float
	fsub	%f0, %f0, %f1
	lfs	%f1, 4(%r13)	# float
	lwz	%r18, 20(%r12)
	lfs	%f2, 4(%r18)	# float
	fsub	%f1, %f1, %f2
	lfs	%f2, 8(%r13)	# float
	lwz	%r13, 20(%r12)
	lfs	%f3, 8(%r13)	# float
	fsub	%f2, %f2, %f3
	addi	%r31, %r0, 2	# li
	slw	%r13, %r17, %r31
	add %r31, %r14, %r13
	lwz %r13, 0(%r31)
	lwz	%r14, 4(%r12)
	stw	%r9, 28(%r3)
	cmpwi	%cr7, %r14, 1
	bne	%cr7, beq_else.24671
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r2, %r12, %r12	# mr %r2, %r12
	or	%r29, %r8, %r8	# mr %r29, %r8
	or	%r6, %r13, %r13	# mr %r6, %r13
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	b	beq_cont.24672
beq_else.24671:
	cmpwi	%cr7, %r14, 2
	bne	%cr7, beq_else.24673
	lfs	%f3, 0(%r13)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f3, %f4
	bgt	%cr7, ble_else.24675
	addi	%r6, %r0, 0	# li
	b	ble_cont.24676
ble_else.24675:
	addi	%r6, %r0, 1	# li
ble_cont.24676:
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.24677
	addi	%r6, %r0, 1	# li
	b	beq_cont.24678
beq_else.24677:
	addi	%r6, %r0, 0	# li
beq_cont.24678:
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.24679
	addi	%r2, %r0, 0	# li
	b	beq_cont.24680
beq_else.24679:
	lfs	%f3, 4(%r13)	# float
	fmul	%f0, %f3, %f0
	lfs	%f3, 8(%r13)	# float
	fmul	%f1, %f3, %f1
	fadd	%f0, %f0, %f1
	lfs	%f1, 12(%r13)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 0(%r9)	# float
	addi	%r2, %r0, 1	# li
beq_cont.24680:
	b	beq_cont.24674
beq_else.24673:
	mflr	%r31	
	or	%r5, %r13, %r13	# mr %r5, %r13
	or	%r2, %r12, %r12	# mr %r2, %r12
	or	%r29, %r7, %r7	# mr %r29, %r7
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
beq_cont.24674:
beq_cont.24672:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24681
	addi	%r2, %r0, 0	# li
	b	beq_cont.24682
beq_else.24681:
	lwz	%r2, 28(%r3)
	lfs	%f0, 0(%r2)	# float
	addis	%r31, %r0, (l.18560)@h	# lis
	ori	%r31, %r31, (l.18560)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24683
	addi	%r2, %r0, 0	# li
	b	ble_cont.24684
ble_else.24683:
	addi	%r2, %r0, 1	# li
ble_cont.24684:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24685
	addi	%r2, %r0, 0	# li
	b	beq_cont.24686
beq_else.24685:
	lwz	%r2, 12(%r3)
	lwz	%r5, 4(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24687
	addi	%r2, %r0, 0	# li
	b	beq_cont.24688
beq_else.24687:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 8(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r7, %r0, 0	# li
	lwz	%r29, 4(%r3)
	mflr	%r31	
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24689
	lwz	%r2, 12(%r3)
	lwz	%r5, 8(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24691
	addi	%r2, %r0, 0	# li
	b	beq_cont.24692
beq_else.24691:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 8(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r7, %r0, 0	# li
	lwz	%r29, 4(%r3)
	mflr	%r31	
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24693
	lwz	%r2, 12(%r3)
	lwz	%r5, 12(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24695
	addi	%r2, %r0, 0	# li
	b	beq_cont.24696
beq_else.24695:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 8(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r7, %r0, 0	# li
	lwz	%r29, 4(%r3)
	mflr	%r31	
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24697
	addi	%r2, %r0, 4	# li
	lwz	%r5, 12(%r3)
	lwz	%r29, 0(%r3)
	mflr	%r31	
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	b	beq_cont.24698
beq_else.24697:
	addi	%r2, %r0, 1	# li
beq_cont.24698:
beq_cont.24696:
	b	beq_cont.24694
beq_else.24693:
	addi	%r2, %r0, 1	# li
beq_cont.24694:
beq_cont.24692:
	b	beq_cont.24690
beq_else.24689:
	addi	%r2, %r0, 1	# li
beq_cont.24690:
beq_cont.24688:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24699
	addi	%r2, %r0, 0	# li
	b	beq_cont.24700
beq_else.24699:
	addi	%r2, %r0, 1	# li
beq_cont.24700:
beq_cont.24686:
beq_cont.24682:
beq_cont.24670:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24701
	lwz	%r2, 24(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 16(%r3)
	lwz	%r29, 20(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
beq_else.24701:
	lwz	%r2, 12(%r3)
	lwz	%r5, 4(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24702
	addi	%r2, %r0, 0	# li
	b	beq_cont.24703
beq_else.24702:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 8(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r7, %r0, 0	# li
	lwz	%r29, 4(%r3)
	mflr	%r31	
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24704
	lwz	%r2, 12(%r3)
	lwz	%r5, 8(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24706
	addi	%r2, %r0, 0	# li
	b	beq_cont.24707
beq_else.24706:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 8(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r7, %r0, 0	# li
	lwz	%r29, 4(%r3)
	mflr	%r31	
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24708
	lwz	%r2, 12(%r3)
	lwz	%r5, 12(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24710
	addi	%r2, %r0, 0	# li
	b	beq_cont.24711
beq_else.24710:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 8(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r6, %r0, 0	# li
	lwz	%r29, 4(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24712
	addi	%r2, %r0, 4	# li
	lwz	%r5, 12(%r3)
	lwz	%r29, 0(%r3)
	mflr	%r31	
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	b	beq_cont.24713
beq_else.24712:
	addi	%r2, %r0, 1	# li
beq_cont.24713:
beq_cont.24711:
	b	beq_cont.24709
beq_else.24708:
	addi	%r2, %r0, 1	# li
beq_cont.24709:
beq_cont.24707:
	b	beq_cont.24705
beq_else.24704:
	addi	%r2, %r0, 1	# li
beq_cont.24705:
beq_cont.24703:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24714
	lwz	%r2, 24(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 16(%r3)
	lwz	%r29, 20(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
beq_else.24714:
	addi	%r2, %r0, 1	# li
	blr
solve_each_element.3174:
	lwz	%r7, 44(%r29)
	lwz	%r8, 40(%r29)
	lwz	%r9, 36(%r29)
	lwz	%r10, 32(%r29)
	lwz	%r11, 28(%r29)
	lwz	%r12, 24(%r29)
	lwz	%r13, 20(%r29)
	lwz	%r14, 16(%r29)
	lwz	%r15, 12(%r29)
	lwz	%r16, 8(%r29)
	lwz	%r17, 4(%r29)
	addi	%r31, %r0, 2	# li
	slw	%r18, %r2, %r31
	add %r31, %r5, %r18
	lwz %r18, 0(%r31)
	cmpwi	%cr7, %r18, -1
	bne	%cr7, beq_else.24715
	blr
beq_else.24715:
	addi	%r31, %r0, 2	# li
	slw	%r19, %r18, %r31
	add %r31, %r13, %r19
	lwz %r19, 0(%r31)
	lfs	%f0, 0(%r8)	# float
	lwz	%r20, 20(%r19)
	lfs	%f1, 0(%r20)	# float
	fsub	%f0, %f0, %f1
	lfs	%f1, 4(%r8)	# float
	lwz	%r20, 20(%r19)
	lfs	%f2, 4(%r20)	# float
	fsub	%f1, %f1, %f2
	lfs	%f2, 8(%r8)	# float
	lwz	%r20, 20(%r19)
	lfs	%f3, 8(%r20)	# float
	fsub	%f2, %f2, %f3
	lwz	%r20, 4(%r19)
	stw	%r14, 0(%r3)
	stw	%r16, 4(%r3)
	stw	%r15, 8(%r3)
	stw	%r17, 12(%r3)
	stw	%r8, 16(%r3)
	stw	%r7, 20(%r3)
	stw	%r12, 24(%r3)
	stw	%r6, 28(%r3)
	stw	%r5, 32(%r3)
	stw	%r29, 36(%r3)
	stw	%r2, 40(%r3)
	stw	%r13, 44(%r3)
	stw	%r18, 48(%r3)
	cmpwi	%cr7, %r20, 1
	bne	%cr7, beq_else.24717
	addi	%r9, %r0, 0	# li
	addi	%r10, %r0, 1	# li
	addi	%r20, %r0, 2	# li
	stfs	%f0, 56(%r3)	# float
	stfs	%f2, 64(%r3)	# float
	stfs	%f1, 72(%r3)	# float
	stw	%r19, 80(%r3)
	stw	%r11, 84(%r3)
	mflr	%r31	
	or	%r8, %r20, %r20	# mr %r8, %r20
	or	%r7, %r10, %r10	# mr %r7, %r10
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r2, %r19, %r19	# mr %r2, %r19
	or	%r29, %r11, %r11	# mr %r29, %r11
	or	%r6, %r9, %r9	# mr %r6, %r9
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24720
	addi	%r6, %r0, 1	# li
	addi	%r7, %r0, 2	# li
	addi	%r8, %r0, 0	# li
	lfs	%f0, 72(%r3)	# float
	lfs	%f1, 64(%r3)	# float
	lfs	%f2, 56(%r3)	# float
	lwz	%r2, 80(%r3)
	lwz	%r5, 28(%r3)
	lwz	%r29, 84(%r3)
	mflr	%r31	
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24722
	addi	%r6, %r0, 2	# li
	addi	%r7, %r0, 0	# li
	addi	%r8, %r0, 1	# li
	lfs	%f0, 64(%r3)	# float
	lfs	%f1, 56(%r3)	# float
	lfs	%f2, 72(%r3)	# float
	lwz	%r2, 80(%r3)
	lwz	%r5, 28(%r3)
	lwz	%r29, 84(%r3)
	mflr	%r31	
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24724
	addi	%r2, %r0, 0	# li
	b	beq_cont.24725
beq_else.24724:
	addi	%r2, %r0, 3	# li
beq_cont.24725:
	b	beq_cont.24723
beq_else.24722:
	addi	%r2, %r0, 2	# li
beq_cont.24723:
	b	beq_cont.24721
beq_else.24720:
	addi	%r2, %r0, 1	# li
beq_cont.24721:
	b	beq_cont.24718
beq_else.24717:
	cmpwi	%cr7, %r20, 2
	bne	%cr7, beq_else.24726
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r2, %r19, %r19	# mr %r2, %r19
	or	%r29, %r9, %r9	# mr %r29, %r9
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
	b	beq_cont.24727
beq_else.24726:
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r2, %r19, %r19	# mr %r2, %r19
	or	%r29, %r10, %r10	# mr %r29, %r10
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
beq_cont.24727:
beq_cont.24718:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24728
	lwz	%r2, 48(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	lwz	%r5, 44(%r3)
	add %r31, %r5, %r2
	lwz %r2, 0(%r31)
	lwz	%r2, 24(%r2)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24729
	blr
beq_else.24729:
	lwz	%r2, 40(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 32(%r3)
	lwz	%r6, 28(%r3)
	lwz	%r29, 36(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
beq_else.24728:
	lwz	%r5, 24(%r3)
	lfs	%f0, 0(%r5)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24731
	addi	%r5, %r0, 0	# li
	b	ble_cont.24732
ble_else.24731:
	addi	%r5, %r0, 1	# li
ble_cont.24732:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24733
	b	beq_cont.24734
beq_else.24733:
	lwz	%r5, 20(%r3)
	lfs	%f1, 0(%r5)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24735
	addi	%r6, %r0, 0	# li
	b	ble_cont.24736
ble_else.24735:
	addi	%r6, %r0, 1	# li
ble_cont.24736:
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.24737
	b	beq_cont.24738
beq_else.24737:
	addis	%r31, %r0, (l.18516)@h	# lis
	ori	%r31, %r31, (l.18516)@l
	lfs	%f1, 0(%r31)	# float
	fadd	%f0, %f0, %f1
	lwz	%r6, 28(%r3)
	lfs	%f1, 0(%r6)	# float
	fmul	%f1, %f1, %f0
	lwz	%r7, 16(%r3)
	lfs	%f2, 0(%r7)	# float
	fadd	%f1, %f1, %f2
	lfs	%f2, 4(%r6)	# float
	fmul	%f2, %f2, %f0
	lfs	%f3, 4(%r7)	# float
	fadd	%f2, %f2, %f3
	lfs	%f3, 8(%r6)	# float
	fmul	%f3, %f3, %f0
	lfs	%f4, 8(%r7)	# float
	fadd	%f3, %f3, %f4
	lwz	%r7, 32(%r3)
	lwz	%r8, 0(%r7)
	stw	%r2, 88(%r3)
	stfs	%f3, 96(%r3)	# float
	stfs	%f2, 104(%r3)	# float
	stfs	%f1, 112(%r3)	# float
	stfs	%f0, 120(%r3)	# float
	cmpwi	%cr7, %r8, -1
	bne	%cr7, beq_else.24740
	addi	%r2, %r0, 1	# li
	b	beq_cont.24741
beq_else.24740:
	addi	%r31, %r0, 2	# li
	slw	%r8, %r8, %r31
	lwz	%r9, 44(%r3)
	add %r31, %r9, %r8
	lwz %r8, 0(%r31)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	fmr	%f0, %f1
	fmr	%f1, %f2
	fmr	%f2, %f3
	stw	%r31, 128(%r3)
	addi	%r3, %r3, 132
	bl	is_outside.3154
	addi	%r3, %r3, -132	# subi
	lwz	%r31, 128(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24742
	lwz	%r5, 32(%r3)
	lwz	%r2, 4(%r5)
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.24744
	addi	%r2, %r0, 1	# li
	b	beq_cont.24745
beq_else.24744:
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	lwz	%r6, 44(%r3)
	add %r31, %r6, %r2
	lwz %r2, 0(%r31)
	lwz	%r7, 20(%r2)
	lfs	%f0, 0(%r7)	# float
	lfs	%f1, 112(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r7, 20(%r2)
	lfs	%f2, 4(%r7)	# float
	lfs	%f3, 104(%r3)	# float
	fsub	%f2, %f3, %f2
	lwz	%r7, 20(%r2)
	lfs	%f4, 8(%r7)	# float
	lfs	%f5, 96(%r3)	# float
	fsub	%f4, %f5, %f4
	lwz	%r7, 4(%r2)
	cmpwi	%cr7, %r7, 1
	bne	%cr7, beq_else.24746
	mflr	%r31	
	fmr	%f1, %f2
	fmr	%f2, %f4
	stw	%r31, 128(%r3)
	addi	%r3, %r3, 132
	bl	is_rect_outside.3139
	addi	%r3, %r3, -132	# subi
	lwz	%r31, 128(%r3)
	mtlr	%r31	
	b	beq_cont.24747
beq_else.24746:
	cmpwi	%cr7, %r7, 2
	bne	%cr7, beq_else.24748
	lwz	%r7, 16(%r2)
	lfs	%f6, 0(%r7)	# float
	fmul	%f0, %f6, %f0
	lfs	%f6, 4(%r7)	# float
	fmul	%f2, %f6, %f2
	fadd	%f0, %f0, %f2
	lfs	%f2, 8(%r7)	# float
	fmul	%f2, %f2, %f4
	fadd	%f0, %f0, %f2
	lwz	%r2, 24(%r2)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f2
	bgt	%cr7, ble_else.24750
	addi	%r7, %r0, 0	# li
	b	ble_cont.24751
ble_else.24750:
	addi	%r7, %r0, 1	# li
ble_cont.24751:
	cmpwi	%cr7, %r7, 0
	bne	%cr7, beq_else.24752
	addi	%r7, %r0, 1	# li
	b	beq_cont.24753
beq_else.24752:
	addi	%r7, %r0, 0	# li
beq_cont.24753:
	xor	%r2, %r2, %r7
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24754
	addi	%r2, %r0, 1	# li
	b	beq_cont.24755
beq_else.24754:
	addi	%r2, %r0, 0	# li
beq_cont.24755:
	b	beq_cont.24749
beq_else.24748:
	mflr	%r31	
	fmr	%f1, %f2
	fmr	%f2, %f4
	stw	%r31, 128(%r3)
	addi	%r3, %r3, 132
	bl	is_second_outside.3149
	addi	%r3, %r3, -132	# subi
	lwz	%r31, 128(%r3)
	mtlr	%r31	
beq_cont.24749:
beq_cont.24747:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24756
	lwz	%r5, 32(%r3)
	lwz	%r2, 8(%r5)
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.24758
	addi	%r2, %r0, 1	# li
	b	beq_cont.24759
beq_else.24758:
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	lwz	%r6, 44(%r3)
	add %r31, %r6, %r2
	lwz %r2, 0(%r31)
	lfs	%f0, 112(%r3)	# float
	lfs	%f1, 104(%r3)	# float
	lfs	%f2, 96(%r3)	# float
	mflr	%r31	
	stw	%r31, 128(%r3)
	addi	%r3, %r3, 132
	bl	is_outside.3154
	addi	%r3, %r3, -132	# subi
	lwz	%r31, 128(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24760
	addi	%r2, %r0, 3	# li
	lfs	%f0, 112(%r3)	# float
	lfs	%f1, 104(%r3)	# float
	lfs	%f2, 96(%r3)	# float
	lwz	%r5, 32(%r3)
	lwz	%r29, 12(%r3)
	mflr	%r31	
	stw	%r31, 128(%r3)
	addi	%r3, %r3, 132
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -132	# subi
	lwz	%r31, 128(%r3)
	mtlr	%r31	
	b	beq_cont.24761
beq_else.24760:
	addi	%r2, %r0, 0	# li
beq_cont.24761:
beq_cont.24759:
	b	beq_cont.24757
beq_else.24756:
	addi	%r2, %r0, 0	# li
beq_cont.24757:
beq_cont.24745:
	b	beq_cont.24743
beq_else.24742:
	addi	%r2, %r0, 0	# li
beq_cont.24743:
beq_cont.24741:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24762
	b	beq_cont.24763
beq_else.24762:
	lwz	%r2, 20(%r3)
	lfs	%f0, 120(%r3)	# float
	stfs	%f0, 0(%r2)	# float
	lwz	%r2, 8(%r3)
	lfs	%f0, 112(%r3)	# float
	stfs	%f0, 0(%r2)	# float
	lfs	%f0, 104(%r3)	# float
	stfs	%f0, 4(%r2)	# float
	lfs	%f0, 96(%r3)	# float
	stfs	%f0, 8(%r2)	# float
	lwz	%r2, 4(%r3)
	lwz	%r5, 48(%r3)
	stw	%r5, 0(%r2)
	lwz	%r2, 0(%r3)
	lwz	%r5, 88(%r3)
	stw	%r5, 0(%r2)
beq_cont.24763:
beq_cont.24738:
beq_cont.24734:
	lwz	%r2, 40(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 32(%r3)
	lwz	%r6, 28(%r3)
	lwz	%r29, 36(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
solve_one_or_network.3178:
	lwz	%r7, 8(%r29)
	lwz	%r8, 4(%r29)
	addi	%r31, %r0, 2	# li
	slw	%r9, %r2, %r31
	add %r31, %r5, %r9
	lwz %r9, 0(%r31)
	cmpwi	%cr7, %r9, -1
	bne	%cr7, beq_else.24764
	blr
beq_else.24764:
	addi	%r31, %r0, 2	# li
	slw	%r9, %r9, %r31
	add %r31, %r8, %r9
	lwz %r9, 0(%r31)
	addi	%r10, %r0, 0	# li
	stw	%r29, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r7, 8(%r3)
	stw	%r8, 12(%r3)
	stw	%r5, 16(%r3)
	stw	%r2, 20(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r10, %r10	# mr %r2, %r10
	or	%r29, %r7, %r7	# mr %r29, %r7
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	mtlr	%r31	
	lwz	%r2, 20(%r3)
	addi	%r2, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 16(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24766
	blr
beq_else.24766:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r7, 12(%r3)
	add %r31, %r7, %r5
	lwz %r5, 0(%r31)
	addi	%r8, %r0, 0	# li
	lwz	%r9, 4(%r3)
	lwz	%r29, 8(%r3)
	stw	%r2, 24(%r3)
	mflr	%r31	
	or	%r6, %r9, %r9	# mr %r6, %r9
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	lwz	%r2, 24(%r3)
	addi	%r2, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 16(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24768
	blr
beq_else.24768:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r7, 12(%r3)
	add %r31, %r7, %r5
	lwz %r5, 0(%r31)
	addi	%r8, %r0, 0	# li
	lwz	%r9, 4(%r3)
	lwz	%r29, 8(%r3)
	stw	%r2, 28(%r3)
	mflr	%r31	
	or	%r6, %r9, %r9	# mr %r6, %r9
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	lwz	%r2, 28(%r3)
	addi	%r2, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 16(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24770
	blr
beq_else.24770:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r7, 12(%r3)
	add %r31, %r7, %r5
	lwz %r5, 0(%r31)
	addi	%r7, %r0, 0	# li
	lwz	%r8, 4(%r3)
	lwz	%r29, 8(%r3)
	stw	%r2, 32(%r3)
	mflr	%r31	
	or	%r6, %r8, %r8	# mr %r6, %r8
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	lwz	%r2, 32(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 16(%r3)
	lwz	%r6, 4(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
trace_or_matrix.3182:
	lwz	%r7, 44(%r29)
	lwz	%r8, 40(%r29)
	lwz	%r9, 36(%r29)
	lwz	%r10, 32(%r29)
	lwz	%r11, 28(%r29)
	lwz	%r12, 24(%r29)
	lwz	%r13, 20(%r29)
	lwz	%r14, 16(%r29)
	lwz	%r15, 12(%r29)
	lwz	%r16, 8(%r29)
	lwz	%r17, 4(%r29)
	addi	%r31, %r0, 2	# li
	slw	%r18, %r2, %r31
	add %r31, %r5, %r18
	lwz %r18, 0(%r31)
	lwz	%r19, 0(%r18)
	cmpwi	%cr7, %r19, -1
	bne	%cr7, beq_else.24772
	blr
beq_else.24772:
	stw	%r29, 0(%r3)
	stw	%r7, 4(%r3)
	stw	%r12, 8(%r3)
	stw	%r8, 12(%r3)
	stw	%r13, 16(%r3)
	stw	%r14, 20(%r3)
	stw	%r6, 24(%r3)
	stw	%r15, 28(%r3)
	stw	%r17, 32(%r3)
	stw	%r5, 36(%r3)
	stw	%r2, 40(%r3)
	cmpwi	%cr7, %r19, 99
	bne	%cr7, beq_else.24774
	lwz	%r9, 4(%r18)
	cmpwi	%cr7, %r9, -1
	bne	%cr7, beq_else.24776
	b	beq_cont.24777
beq_else.24776:
	addi	%r31, %r0, 2	# li
	slw	%r9, %r9, %r31
	add %r31, %r17, %r9
	lwz %r9, 0(%r31)
	addi	%r10, %r0, 0	# li
	stw	%r18, 44(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r10, %r10	# mr %r2, %r10
	or	%r29, %r15, %r15	# mr %r29, %r15
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
	lwz	%r2, 44(%r3)
	lwz	%r5, 8(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24778
	b	beq_cont.24779
beq_else.24778:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 32(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r7, %r0, 0	# li
	lwz	%r8, 24(%r3)
	lwz	%r29, 28(%r3)
	mflr	%r31	
	or	%r6, %r8, %r8	# mr %r6, %r8
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
	lwz	%r2, 44(%r3)
	lwz	%r5, 12(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24780
	b	beq_cont.24781
beq_else.24780:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 32(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r7, %r0, 0	# li
	lwz	%r8, 24(%r3)
	lwz	%r29, 28(%r3)
	mflr	%r31	
	or	%r6, %r8, %r8	# mr %r6, %r8
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 4	# li
	lwz	%r5, 44(%r3)
	lwz	%r6, 24(%r3)
	lwz	%r29, 20(%r3)
	mflr	%r31	
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
beq_cont.24781:
beq_cont.24779:
beq_cont.24777:
	b	beq_cont.24775
beq_else.24774:
	addi	%r31, %r0, 2	# li
	slw	%r19, %r19, %r31
	add %r31, %r16, %r19
	lwz %r16, 0(%r31)
	lfs	%f0, 0(%r8)	# float
	lwz	%r19, 20(%r16)
	lfs	%f1, 0(%r19)	# float
	fsub	%f0, %f0, %f1
	lfs	%f1, 4(%r8)	# float
	lwz	%r19, 20(%r16)
	lfs	%f2, 4(%r19)	# float
	fsub	%f1, %f1, %f2
	lfs	%f2, 8(%r8)	# float
	lwz	%r19, 20(%r16)
	lfs	%f3, 8(%r19)	# float
	fsub	%f2, %f2, %f3
	lwz	%r19, 4(%r16)
	stw	%r18, 44(%r3)
	cmpwi	%cr7, %r19, 1
	bne	%cr7, beq_else.24782
	addi	%r9, %r0, 0	# li
	addi	%r10, %r0, 1	# li
	addi	%r19, %r0, 2	# li
	stfs	%f0, 48(%r3)	# float
	stfs	%f2, 56(%r3)	# float
	stfs	%f1, 64(%r3)	# float
	stw	%r16, 72(%r3)
	stw	%r11, 76(%r3)
	mflr	%r31	
	or	%r8, %r19, %r19	# mr %r8, %r19
	or	%r7, %r10, %r10	# mr %r7, %r10
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r2, %r16, %r16	# mr %r2, %r16
	or	%r29, %r11, %r11	# mr %r29, %r11
	or	%r6, %r9, %r9	# mr %r6, %r9
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24784
	addi	%r6, %r0, 1	# li
	addi	%r7, %r0, 2	# li
	addi	%r8, %r0, 0	# li
	lfs	%f0, 64(%r3)	# float
	lfs	%f1, 56(%r3)	# float
	lfs	%f2, 48(%r3)	# float
	lwz	%r2, 72(%r3)
	lwz	%r5, 24(%r3)
	lwz	%r29, 76(%r3)
	mflr	%r31	
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24786
	addi	%r6, %r0, 2	# li
	addi	%r7, %r0, 0	# li
	addi	%r8, %r0, 1	# li
	lfs	%f0, 56(%r3)	# float
	lfs	%f1, 48(%r3)	# float
	lfs	%f2, 64(%r3)	# float
	lwz	%r2, 72(%r3)
	lwz	%r5, 24(%r3)
	lwz	%r29, 76(%r3)
	mflr	%r31	
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24788
	addi	%r2, %r0, 0	# li
	b	beq_cont.24789
beq_else.24788:
	addi	%r2, %r0, 3	# li
beq_cont.24789:
	b	beq_cont.24787
beq_else.24786:
	addi	%r2, %r0, 2	# li
beq_cont.24787:
	b	beq_cont.24785
beq_else.24784:
	addi	%r2, %r0, 1	# li
beq_cont.24785:
	b	beq_cont.24783
beq_else.24782:
	cmpwi	%cr7, %r19, 2
	bne	%cr7, beq_else.24790
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r2, %r16, %r16	# mr %r2, %r16
	or	%r29, %r9, %r9	# mr %r29, %r9
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	b	beq_cont.24791
beq_else.24790:
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r2, %r16, %r16	# mr %r2, %r16
	or	%r29, %r10, %r10	# mr %r29, %r10
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
beq_cont.24791:
beq_cont.24783:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24792
	b	beq_cont.24793
beq_else.24792:
	lwz	%r2, 8(%r3)
	lfs	%f0, 0(%r2)	# float
	lwz	%r5, 4(%r3)
	lfs	%f1, 0(%r5)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24794
	addi	%r6, %r0, 0	# li
	b	ble_cont.24795
ble_else.24794:
	addi	%r6, %r0, 1	# li
ble_cont.24795:
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.24796
	b	beq_cont.24797
beq_else.24796:
	lwz	%r6, 44(%r3)
	lwz	%r7, 4(%r6)
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.24798
	b	beq_cont.24799
beq_else.24798:
	addi	%r31, %r0, 2	# li
	slw	%r7, %r7, %r31
	lwz	%r8, 32(%r3)
	add %r31, %r8, %r7
	lwz %r7, 0(%r31)
	addi	%r9, %r0, 0	# li
	lwz	%r10, 24(%r3)
	lwz	%r29, 28(%r3)
	mflr	%r31	
	or	%r6, %r10, %r10	# mr %r6, %r10
	or	%r5, %r7, %r7	# mr %r5, %r7
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	lwz	%r2, 44(%r3)
	lwz	%r5, 8(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24800
	b	beq_cont.24801
beq_else.24800:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 32(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r7, %r0, 0	# li
	lwz	%r8, 24(%r3)
	lwz	%r29, 28(%r3)
	mflr	%r31	
	or	%r6, %r8, %r8	# mr %r6, %r8
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	lwz	%r2, 44(%r3)
	lwz	%r5, 12(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24802
	b	beq_cont.24803
beq_else.24802:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 32(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r7, %r0, 0	# li
	lwz	%r8, 24(%r3)
	lwz	%r29, 28(%r3)
	mflr	%r31	
	or	%r6, %r8, %r8	# mr %r6, %r8
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 4	# li
	lwz	%r5, 44(%r3)
	lwz	%r6, 24(%r3)
	lwz	%r29, 20(%r3)
	mflr	%r31	
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
beq_cont.24803:
beq_cont.24801:
beq_cont.24799:
beq_cont.24797:
beq_cont.24793:
beq_cont.24775:
	lwz	%r2, 40(%r3)
	addi	%r2, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 36(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 0(%r5)
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.24804
	blr
beq_else.24804:
	stw	%r2, 80(%r3)
	cmpwi	%cr7, %r7, 99
	bne	%cr7, beq_else.24806
	lwz	%r7, 4(%r5)
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.24808
	b	beq_cont.24809
beq_else.24808:
	addi	%r31, %r0, 2	# li
	slw	%r7, %r7, %r31
	lwz	%r8, 32(%r3)
	add %r31, %r8, %r7
	lwz %r7, 0(%r31)
	addi	%r9, %r0, 0	# li
	lwz	%r10, 24(%r3)
	lwz	%r29, 28(%r3)
	stw	%r5, 84(%r3)
	mflr	%r31	
	or	%r6, %r10, %r10	# mr %r6, %r10
	or	%r5, %r7, %r7	# mr %r5, %r7
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
	lwz	%r2, 84(%r3)
	lwz	%r5, 8(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24810
	b	beq_cont.24811
beq_else.24810:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 32(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r6, %r0, 0	# li
	lwz	%r7, 24(%r3)
	lwz	%r29, 28(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	or	%r6, %r7, %r7	# mr %r6, %r7
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 3	# li
	lwz	%r5, 84(%r3)
	lwz	%r6, 24(%r3)
	lwz	%r29, 20(%r3)
	mflr	%r31	
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
beq_cont.24811:
beq_cont.24809:
	b	beq_cont.24807
beq_else.24806:
	lwz	%r8, 24(%r3)
	lwz	%r9, 12(%r3)
	lwz	%r29, 16(%r3)
	stw	%r5, 84(%r3)
	mflr	%r31	
	or	%r6, %r9, %r9	# mr %r6, %r9
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24812
	b	beq_cont.24813
beq_else.24812:
	lwz	%r2, 8(%r3)
	lfs	%f0, 0(%r2)	# float
	lwz	%r2, 4(%r3)
	lfs	%f1, 0(%r2)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24814
	addi	%r2, %r0, 0	# li
	b	ble_cont.24815
ble_else.24814:
	addi	%r2, %r0, 1	# li
ble_cont.24815:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24816
	b	beq_cont.24817
beq_else.24816:
	lwz	%r2, 84(%r3)
	lwz	%r5, 4(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24818
	b	beq_cont.24819
beq_else.24818:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 32(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r7, %r0, 0	# li
	lwz	%r8, 24(%r3)
	lwz	%r29, 28(%r3)
	mflr	%r31	
	or	%r6, %r8, %r8	# mr %r6, %r8
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
	lwz	%r2, 84(%r3)
	lwz	%r5, 8(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24820
	b	beq_cont.24821
beq_else.24820:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 32(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r6, %r0, 0	# li
	lwz	%r7, 24(%r3)
	lwz	%r29, 28(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	or	%r6, %r7, %r7	# mr %r6, %r7
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 3	# li
	lwz	%r5, 84(%r3)
	lwz	%r6, 24(%r3)
	lwz	%r29, 20(%r3)
	mflr	%r31	
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
beq_cont.24821:
beq_cont.24819:
beq_cont.24817:
beq_cont.24813:
beq_cont.24807:
	lwz	%r2, 80(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 36(%r3)
	lwz	%r6, 24(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
solve_each_element_fast.3188:
	lwz	%r7, 40(%r29)
	lwz	%r8, 36(%r29)
	lwz	%r9, 32(%r29)
	lwz	%r10, 28(%r29)
	lwz	%r11, 24(%r29)
	lwz	%r12, 20(%r29)
	lwz	%r13, 16(%r29)
	lwz	%r14, 12(%r29)
	lwz	%r15, 8(%r29)
	lwz	%r16, 4(%r29)
	lwz	%r17, 0(%r6)
	addi	%r31, %r0, 2	# li
	slw	%r18, %r2, %r31
	add %r31, %r5, %r18
	lwz %r18, 0(%r31)
	cmpwi	%cr7, %r18, -1
	bne	%cr7, beq_else.24822
	blr
beq_else.24822:
	addi	%r31, %r0, 2	# li
	slw	%r19, %r18, %r31
	add %r31, %r12, %r19
	lwz %r19, 0(%r31)
	lwz	%r20, 40(%r19)
	lfs	%f0, 0(%r20)	# float
	lfs	%f1, 4(%r20)	# float
	lfs	%f2, 8(%r20)	# float
	lwz	%r21, 4(%r6)
	addi	%r31, %r0, 2	# li
	slw	%r22, %r18, %r31
	add %r31, %r21, %r22
	lwz %r21, 0(%r31)
	lwz	%r22, 4(%r19)
	stw	%r13, 0(%r3)
	stw	%r15, 4(%r3)
	stw	%r14, 8(%r3)
	stw	%r16, 12(%r3)
	stw	%r8, 16(%r3)
	stw	%r17, 20(%r3)
	stw	%r7, 24(%r3)
	stw	%r11, 28(%r3)
	stw	%r6, 32(%r3)
	stw	%r5, 36(%r3)
	stw	%r29, 40(%r3)
	stw	%r2, 44(%r3)
	stw	%r12, 48(%r3)
	stw	%r18, 52(%r3)
	cmpwi	%cr7, %r22, 1
	bne	%cr7, beq_else.24824
	lwz	%r9, 0(%r6)
	mflr	%r31	
	or	%r6, %r21, %r21	# mr %r6, %r21
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r19, %r19	# mr %r2, %r19
	or	%r29, %r10, %r10	# mr %r29, %r10
	stw	%r31, 56(%r3)
	addi	%r3, %r3, 60
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -60	# subi
	lwz	%r31, 56(%r3)
	mtlr	%r31	
	b	beq_cont.24825
beq_else.24824:
	cmpwi	%cr7, %r22, 2
	bne	%cr7, beq_else.24826
	lfs	%f0, 0(%r21)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24828
	addi	%r9, %r0, 0	# li
	b	ble_cont.24829
ble_else.24828:
	addi	%r9, %r0, 1	# li
ble_cont.24829:
	cmpwi	%cr7, %r9, 0
	bne	%cr7, beq_else.24830
	addi	%r9, %r0, 1	# li
	b	beq_cont.24831
beq_else.24830:
	addi	%r9, %r0, 0	# li
beq_cont.24831:
	cmpwi	%cr7, %r9, 0
	bne	%cr7, beq_else.24832
	addi	%r2, %r0, 0	# li
	b	beq_cont.24833
beq_else.24832:
	lfs	%f0, 0(%r21)	# float
	lfs	%f1, 12(%r20)	# float
	fmul	%f0, %f0, %f1
	stfs	%f0, 0(%r11)	# float
	addi	%r2, %r0, 1	# li
beq_cont.24833:
	b	beq_cont.24827
beq_else.24826:
	mflr	%r31	
	or	%r6, %r20, %r20	# mr %r6, %r20
	or	%r5, %r21, %r21	# mr %r5, %r21
	or	%r2, %r19, %r19	# mr %r2, %r19
	or	%r29, %r9, %r9	# mr %r29, %r9
	stw	%r31, 56(%r3)
	addi	%r3, %r3, 60
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -60	# subi
	lwz	%r31, 56(%r3)
	mtlr	%r31	
beq_cont.24827:
beq_cont.24825:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24834
	lwz	%r2, 52(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	lwz	%r5, 48(%r3)
	add %r31, %r5, %r2
	lwz %r2, 0(%r31)
	lwz	%r2, 24(%r2)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24835
	blr
beq_else.24835:
	lwz	%r2, 44(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 36(%r3)
	lwz	%r6, 32(%r3)
	lwz	%r29, 40(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
beq_else.24834:
	lwz	%r5, 28(%r3)
	lfs	%f0, 0(%r5)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24837
	addi	%r5, %r0, 0	# li
	b	ble_cont.24838
ble_else.24837:
	addi	%r5, %r0, 1	# li
ble_cont.24838:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24839
	b	beq_cont.24840
beq_else.24839:
	lwz	%r5, 24(%r3)
	lfs	%f1, 0(%r5)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24841
	addi	%r6, %r0, 0	# li
	b	ble_cont.24842
ble_else.24841:
	addi	%r6, %r0, 1	# li
ble_cont.24842:
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.24843
	b	beq_cont.24844
beq_else.24843:
	addis	%r31, %r0, (l.18516)@h	# lis
	ori	%r31, %r31, (l.18516)@l
	lfs	%f1, 0(%r31)	# float
	fadd	%f0, %f0, %f1
	lwz	%r6, 20(%r3)
	lfs	%f1, 0(%r6)	# float
	fmul	%f1, %f1, %f0
	lwz	%r7, 16(%r3)
	lfs	%f2, 0(%r7)	# float
	fadd	%f1, %f1, %f2
	lfs	%f2, 4(%r6)	# float
	fmul	%f2, %f2, %f0
	lfs	%f3, 4(%r7)	# float
	fadd	%f2, %f2, %f3
	lfs	%f3, 8(%r6)	# float
	fmul	%f3, %f3, %f0
	lfs	%f4, 8(%r7)	# float
	fadd	%f3, %f3, %f4
	lwz	%r6, 36(%r3)
	lwz	%r7, 0(%r6)
	stw	%r2, 56(%r3)
	stfs	%f3, 64(%r3)	# float
	stfs	%f2, 72(%r3)	# float
	stfs	%f1, 80(%r3)	# float
	stfs	%f0, 88(%r3)	# float
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.24846
	addi	%r2, %r0, 1	# li
	b	beq_cont.24847
beq_else.24846:
	addi	%r31, %r0, 2	# li
	slw	%r7, %r7, %r31
	lwz	%r8, 48(%r3)
	add %r31, %r8, %r7
	lwz %r7, 0(%r31)
	mflr	%r31	
	or	%r2, %r7, %r7	# mr %r2, %r7
	fmr	%f0, %f1
	fmr	%f1, %f2
	fmr	%f2, %f3
	stw	%r31, 96(%r3)
	addi	%r3, %r3, 100
	bl	is_outside.3154
	addi	%r3, %r3, -100	# subi
	lwz	%r31, 96(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24848
	lwz	%r5, 36(%r3)
	lwz	%r2, 4(%r5)
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.24850
	addi	%r2, %r0, 1	# li
	b	beq_cont.24851
beq_else.24850:
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	lwz	%r6, 48(%r3)
	add %r31, %r6, %r2
	lwz %r2, 0(%r31)
	lwz	%r7, 20(%r2)
	lfs	%f0, 0(%r7)	# float
	lfs	%f1, 80(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r7, 20(%r2)
	lfs	%f2, 4(%r7)	# float
	lfs	%f3, 72(%r3)	# float
	fsub	%f2, %f3, %f2
	lwz	%r7, 20(%r2)
	lfs	%f4, 8(%r7)	# float
	lfs	%f5, 64(%r3)	# float
	fsub	%f4, %f5, %f4
	lwz	%r7, 4(%r2)
	cmpwi	%cr7, %r7, 1
	bne	%cr7, beq_else.24852
	mflr	%r31	
	fmr	%f1, %f2
	fmr	%f2, %f4
	stw	%r31, 96(%r3)
	addi	%r3, %r3, 100
	bl	is_rect_outside.3139
	addi	%r3, %r3, -100	# subi
	lwz	%r31, 96(%r3)
	mtlr	%r31	
	b	beq_cont.24853
beq_else.24852:
	cmpwi	%cr7, %r7, 2
	bne	%cr7, beq_else.24854
	lwz	%r7, 16(%r2)
	lfs	%f6, 0(%r7)	# float
	fmul	%f0, %f6, %f0
	lfs	%f6, 4(%r7)	# float
	fmul	%f2, %f6, %f2
	fadd	%f0, %f0, %f2
	lfs	%f2, 8(%r7)	# float
	fmul	%f2, %f2, %f4
	fadd	%f0, %f0, %f2
	lwz	%r2, 24(%r2)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f2
	bgt	%cr7, ble_else.24856
	addi	%r7, %r0, 0	# li
	b	ble_cont.24857
ble_else.24856:
	addi	%r7, %r0, 1	# li
ble_cont.24857:
	cmpwi	%cr7, %r7, 0
	bne	%cr7, beq_else.24858
	addi	%r7, %r0, 1	# li
	b	beq_cont.24859
beq_else.24858:
	addi	%r7, %r0, 0	# li
beq_cont.24859:
	xor	%r2, %r2, %r7
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24860
	addi	%r2, %r0, 1	# li
	b	beq_cont.24861
beq_else.24860:
	addi	%r2, %r0, 0	# li
beq_cont.24861:
	b	beq_cont.24855
beq_else.24854:
	mflr	%r31	
	fmr	%f1, %f2
	fmr	%f2, %f4
	stw	%r31, 96(%r3)
	addi	%r3, %r3, 100
	bl	is_second_outside.3149
	addi	%r3, %r3, -100	# subi
	lwz	%r31, 96(%r3)
	mtlr	%r31	
beq_cont.24855:
beq_cont.24853:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24862
	lwz	%r5, 36(%r3)
	lwz	%r2, 8(%r5)
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.24864
	addi	%r2, %r0, 1	# li
	b	beq_cont.24865
beq_else.24864:
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	lwz	%r6, 48(%r3)
	add %r31, %r6, %r2
	lwz %r2, 0(%r31)
	lfs	%f0, 80(%r3)	# float
	lfs	%f1, 72(%r3)	# float
	lfs	%f2, 64(%r3)	# float
	mflr	%r31	
	stw	%r31, 96(%r3)
	addi	%r3, %r3, 100
	bl	is_outside.3154
	addi	%r3, %r3, -100	# subi
	lwz	%r31, 96(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24866
	addi	%r2, %r0, 3	# li
	lfs	%f0, 80(%r3)	# float
	lfs	%f1, 72(%r3)	# float
	lfs	%f2, 64(%r3)	# float
	lwz	%r5, 36(%r3)
	lwz	%r29, 12(%r3)
	mflr	%r31	
	stw	%r31, 96(%r3)
	addi	%r3, %r3, 100
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -100	# subi
	lwz	%r31, 96(%r3)
	mtlr	%r31	
	b	beq_cont.24867
beq_else.24866:
	addi	%r2, %r0, 0	# li
beq_cont.24867:
beq_cont.24865:
	b	beq_cont.24863
beq_else.24862:
	addi	%r2, %r0, 0	# li
beq_cont.24863:
beq_cont.24851:
	b	beq_cont.24849
beq_else.24848:
	addi	%r2, %r0, 0	# li
beq_cont.24849:
beq_cont.24847:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24868
	b	beq_cont.24869
beq_else.24868:
	lwz	%r2, 24(%r3)
	lfs	%f0, 88(%r3)	# float
	stfs	%f0, 0(%r2)	# float
	lwz	%r2, 8(%r3)
	lfs	%f0, 80(%r3)	# float
	stfs	%f0, 0(%r2)	# float
	lfs	%f0, 72(%r3)	# float
	stfs	%f0, 4(%r2)	# float
	lfs	%f0, 64(%r3)	# float
	stfs	%f0, 8(%r2)	# float
	lwz	%r2, 4(%r3)
	lwz	%r5, 52(%r3)
	stw	%r5, 0(%r2)
	lwz	%r2, 0(%r3)
	lwz	%r5, 56(%r3)
	stw	%r5, 0(%r2)
beq_cont.24869:
beq_cont.24844:
beq_cont.24840:
	lwz	%r2, 44(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 36(%r3)
	lwz	%r6, 32(%r3)
	lwz	%r29, 40(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
solve_one_or_network_fast.3192:
	lwz	%r7, 8(%r29)
	lwz	%r8, 4(%r29)
	addi	%r31, %r0, 2	# li
	slw	%r9, %r2, %r31
	add %r31, %r5, %r9
	lwz %r9, 0(%r31)
	cmpwi	%cr7, %r9, -1
	bne	%cr7, beq_else.24870
	blr
beq_else.24870:
	addi	%r31, %r0, 2	# li
	slw	%r9, %r9, %r31
	add %r31, %r8, %r9
	lwz %r9, 0(%r31)
	addi	%r10, %r0, 0	# li
	stw	%r29, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r7, 8(%r3)
	stw	%r8, 12(%r3)
	stw	%r5, 16(%r3)
	stw	%r2, 20(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r10, %r10	# mr %r2, %r10
	or	%r29, %r7, %r7	# mr %r29, %r7
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	mtlr	%r31	
	lwz	%r2, 20(%r3)
	addi	%r2, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 16(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24872
	blr
beq_else.24872:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r7, 12(%r3)
	add %r31, %r7, %r5
	lwz %r5, 0(%r31)
	addi	%r8, %r0, 0	# li
	lwz	%r9, 4(%r3)
	lwz	%r29, 8(%r3)
	stw	%r2, 24(%r3)
	mflr	%r31	
	or	%r6, %r9, %r9	# mr %r6, %r9
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	lwz	%r2, 24(%r3)
	addi	%r2, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 16(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24874
	blr
beq_else.24874:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r7, 12(%r3)
	add %r31, %r7, %r5
	lwz %r5, 0(%r31)
	addi	%r8, %r0, 0	# li
	lwz	%r9, 4(%r3)
	lwz	%r29, 8(%r3)
	stw	%r2, 28(%r3)
	mflr	%r31	
	or	%r6, %r9, %r9	# mr %r6, %r9
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	lwz	%r2, 28(%r3)
	addi	%r2, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 16(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24876
	blr
beq_else.24876:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r7, 12(%r3)
	add %r31, %r7, %r5
	lwz %r5, 0(%r31)
	addi	%r7, %r0, 0	# li
	lwz	%r8, 4(%r3)
	lwz	%r29, 8(%r3)
	stw	%r2, 32(%r3)
	mflr	%r31	
	or	%r6, %r8, %r8	# mr %r6, %r8
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	lwz	%r2, 32(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 16(%r3)
	lwz	%r6, 4(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
trace_or_matrix_fast.3196:
	lwz	%r7, 36(%r29)
	lwz	%r8, 32(%r29)
	lwz	%r9, 28(%r29)
	lwz	%r10, 24(%r29)
	lwz	%r11, 20(%r29)
	lwz	%r12, 16(%r29)
	lwz	%r13, 12(%r29)
	lwz	%r14, 8(%r29)
	lwz	%r15, 4(%r29)
	addi	%r31, %r0, 2	# li
	slw	%r16, %r2, %r31
	add %r31, %r5, %r16
	lwz %r16, 0(%r31)
	lwz	%r17, 0(%r16)
	cmpwi	%cr7, %r17, -1
	bne	%cr7, beq_else.24878
	blr
beq_else.24878:
	stw	%r29, 0(%r3)
	stw	%r7, 4(%r3)
	stw	%r11, 8(%r3)
	stw	%r10, 12(%r3)
	stw	%r12, 16(%r3)
	stw	%r6, 20(%r3)
	stw	%r13, 24(%r3)
	stw	%r15, 28(%r3)
	stw	%r5, 32(%r3)
	stw	%r2, 36(%r3)
	cmpwi	%cr7, %r17, 99
	bne	%cr7, beq_else.24880
	lwz	%r8, 4(%r16)
	cmpwi	%cr7, %r8, -1
	bne	%cr7, beq_else.24882
	b	beq_cont.24883
beq_else.24882:
	addi	%r31, %r0, 2	# li
	slw	%r8, %r8, %r31
	add %r31, %r15, %r8
	lwz %r8, 0(%r31)
	addi	%r9, %r0, 0	# li
	stw	%r16, 40(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r9, %r9	# mr %r2, %r9
	or	%r29, %r13, %r13	# mr %r29, %r13
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	lwz	%r2, 40(%r3)
	lwz	%r5, 8(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24884
	b	beq_cont.24885
beq_else.24884:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 28(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r7, %r0, 0	# li
	lwz	%r8, 20(%r3)
	lwz	%r29, 24(%r3)
	mflr	%r31	
	or	%r6, %r8, %r8	# mr %r6, %r8
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	lwz	%r2, 40(%r3)
	lwz	%r5, 12(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24886
	b	beq_cont.24887
beq_else.24886:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 28(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r7, %r0, 0	# li
	lwz	%r8, 20(%r3)
	lwz	%r29, 24(%r3)
	mflr	%r31	
	or	%r6, %r8, %r8	# mr %r6, %r8
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 4	# li
	lwz	%r5, 40(%r3)
	lwz	%r6, 20(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
beq_cont.24887:
beq_cont.24885:
beq_cont.24883:
	b	beq_cont.24881
beq_else.24880:
	addi	%r31, %r0, 2	# li
	slw	%r18, %r17, %r31
	add %r31, %r14, %r18
	lwz %r14, 0(%r31)
	lwz	%r18, 40(%r14)
	lfs	%f0, 0(%r18)	# float
	lfs	%f1, 4(%r18)	# float
	lfs	%f2, 8(%r18)	# float
	lwz	%r19, 4(%r6)
	addi	%r31, %r0, 2	# li
	slw	%r17, %r17, %r31
	add %r31, %r19, %r17
	lwz %r17, 0(%r31)
	lwz	%r19, 4(%r14)
	stw	%r16, 40(%r3)
	cmpwi	%cr7, %r19, 1
	bne	%cr7, beq_else.24888
	lwz	%r8, 0(%r6)
	mflr	%r31	
	or	%r6, %r17, %r17	# mr %r6, %r17
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r14, %r14	# mr %r2, %r14
	or	%r29, %r9, %r9	# mr %r29, %r9
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	b	beq_cont.24889
beq_else.24888:
	cmpwi	%cr7, %r19, 2
	bne	%cr7, beq_else.24890
	lfs	%f0, 0(%r17)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24892
	addi	%r8, %r0, 0	# li
	b	ble_cont.24893
ble_else.24892:
	addi	%r8, %r0, 1	# li
ble_cont.24893:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24894
	addi	%r8, %r0, 1	# li
	b	beq_cont.24895
beq_else.24894:
	addi	%r8, %r0, 0	# li
beq_cont.24895:
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.24896
	addi	%r2, %r0, 0	# li
	b	beq_cont.24897
beq_else.24896:
	lfs	%f0, 0(%r17)	# float
	lfs	%f1, 12(%r18)	# float
	fmul	%f0, %f0, %f1
	stfs	%f0, 0(%r11)	# float
	addi	%r2, %r0, 1	# li
beq_cont.24897:
	b	beq_cont.24891
beq_else.24890:
	mflr	%r31	
	or	%r6, %r18, %r18	# mr %r6, %r18
	or	%r5, %r17, %r17	# mr %r5, %r17
	or	%r2, %r14, %r14	# mr %r2, %r14
	or	%r29, %r8, %r8	# mr %r29, %r8
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
beq_cont.24891:
beq_cont.24889:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24898
	b	beq_cont.24899
beq_else.24898:
	lwz	%r2, 8(%r3)
	lfs	%f0, 0(%r2)	# float
	lwz	%r5, 4(%r3)
	lfs	%f1, 0(%r5)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24900
	addi	%r6, %r0, 0	# li
	b	ble_cont.24901
ble_else.24900:
	addi	%r6, %r0, 1	# li
ble_cont.24901:
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.24902
	b	beq_cont.24903
beq_else.24902:
	lwz	%r6, 40(%r3)
	lwz	%r7, 4(%r6)
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.24904
	b	beq_cont.24905
beq_else.24904:
	addi	%r31, %r0, 2	# li
	slw	%r7, %r7, %r31
	lwz	%r8, 28(%r3)
	add %r31, %r8, %r7
	lwz %r7, 0(%r31)
	addi	%r9, %r0, 0	# li
	lwz	%r10, 20(%r3)
	lwz	%r29, 24(%r3)
	mflr	%r31	
	or	%r6, %r10, %r10	# mr %r6, %r10
	or	%r5, %r7, %r7	# mr %r5, %r7
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	lwz	%r2, 40(%r3)
	lwz	%r5, 8(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24906
	b	beq_cont.24907
beq_else.24906:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 28(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r7, %r0, 0	# li
	lwz	%r8, 20(%r3)
	lwz	%r29, 24(%r3)
	mflr	%r31	
	or	%r6, %r8, %r8	# mr %r6, %r8
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	lwz	%r2, 40(%r3)
	lwz	%r5, 12(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24908
	b	beq_cont.24909
beq_else.24908:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 28(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r7, %r0, 0	# li
	lwz	%r8, 20(%r3)
	lwz	%r29, 24(%r3)
	mflr	%r31	
	or	%r6, %r8, %r8	# mr %r6, %r8
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 4	# li
	lwz	%r5, 40(%r3)
	lwz	%r6, 20(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
beq_cont.24909:
beq_cont.24907:
beq_cont.24905:
beq_cont.24903:
beq_cont.24899:
beq_cont.24881:
	lwz	%r2, 36(%r3)
	addi	%r2, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 32(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 0(%r5)
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.24910
	blr
beq_else.24910:
	stw	%r2, 44(%r3)
	cmpwi	%cr7, %r7, 99
	bne	%cr7, beq_else.24912
	lwz	%r7, 4(%r5)
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.24914
	b	beq_cont.24915
beq_else.24914:
	addi	%r31, %r0, 2	# li
	slw	%r7, %r7, %r31
	lwz	%r8, 28(%r3)
	add %r31, %r8, %r7
	lwz %r7, 0(%r31)
	addi	%r9, %r0, 0	# li
	lwz	%r10, 20(%r3)
	lwz	%r29, 24(%r3)
	stw	%r5, 48(%r3)
	mflr	%r31	
	or	%r6, %r10, %r10	# mr %r6, %r10
	or	%r5, %r7, %r7	# mr %r5, %r7
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
	lwz	%r2, 48(%r3)
	lwz	%r5, 8(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24916
	b	beq_cont.24917
beq_else.24916:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 28(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r6, %r0, 0	# li
	lwz	%r7, 20(%r3)
	lwz	%r29, 24(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	or	%r6, %r7, %r7	# mr %r6, %r7
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 3	# li
	lwz	%r5, 48(%r3)
	lwz	%r6, 20(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
beq_cont.24917:
beq_cont.24915:
	b	beq_cont.24913
beq_else.24912:
	lwz	%r8, 20(%r3)
	lwz	%r29, 12(%r3)
	stw	%r5, 48(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24918
	b	beq_cont.24919
beq_else.24918:
	lwz	%r2, 8(%r3)
	lfs	%f0, 0(%r2)	# float
	lwz	%r2, 4(%r3)
	lfs	%f1, 0(%r2)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24920
	addi	%r2, %r0, 0	# li
	b	ble_cont.24921
ble_else.24920:
	addi	%r2, %r0, 1	# li
ble_cont.24921:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24922
	b	beq_cont.24923
beq_else.24922:
	lwz	%r2, 48(%r3)
	lwz	%r5, 4(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24924
	b	beq_cont.24925
beq_else.24924:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 28(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r7, %r0, 0	# li
	lwz	%r8, 20(%r3)
	lwz	%r29, 24(%r3)
	mflr	%r31	
	or	%r6, %r8, %r8	# mr %r6, %r8
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
	lwz	%r2, 48(%r3)
	lwz	%r5, 8(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24926
	b	beq_cont.24927
beq_else.24926:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 28(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r6, %r0, 0	# li
	lwz	%r7, 20(%r3)
	lwz	%r29, 24(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	or	%r6, %r7, %r7	# mr %r6, %r7
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 3	# li
	lwz	%r5, 48(%r3)
	lwz	%r6, 20(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
beq_cont.24927:
beq_cont.24925:
beq_cont.24923:
beq_cont.24919:
beq_cont.24913:
	lwz	%r2, 44(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 32(%r3)
	lwz	%r6, 20(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
judge_intersection_fast.3200:
	lwz	%r5, 32(%r29)
	lwz	%r6, 28(%r29)
	lwz	%r7, 24(%r29)
	lwz	%r8, 20(%r29)
	lwz	%r9, 16(%r29)
	lwz	%r10, 12(%r29)
	lwz	%r11, 8(%r29)
	lwz	%r12, 4(%r29)
	addis	%r31, %r0, (l.18733)@h	# lis
	ori	%r31, %r31, (l.18733)@l
	lfs	%f0, 0(%r31)	# float
	stfs	%f0, 0(%r6)	# float
	lwz	%r11, 0(%r11)
	lwz	%r13, 0(%r11)
	lwz	%r14, 0(%r13)
	stw	%r6, 0(%r3)
	cmpwi	%cr7, %r14, -1
	bne	%cr7, beq_else.24928
	b	beq_cont.24929
beq_else.24928:
	stw	%r2, 4(%r3)
	stw	%r11, 8(%r3)
	stw	%r5, 12(%r3)
	cmpwi	%cr7, %r14, 99
	bne	%cr7, beq_else.24930
	lwz	%r7, 4(%r13)
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.24932
	b	beq_cont.24933
beq_else.24932:
	addi	%r31, %r0, 2	# li
	slw	%r7, %r7, %r31
	add %r31, %r12, %r7
	lwz %r7, 0(%r31)
	addi	%r8, %r0, 0	# li
	stw	%r9, 16(%r3)
	stw	%r10, 20(%r3)
	stw	%r12, 24(%r3)
	stw	%r13, 28(%r3)
	mflr	%r31	
	or	%r6, %r2, %r2	# mr %r6, %r2
	or	%r5, %r7, %r7	# mr %r5, %r7
	or	%r29, %r10, %r10	# mr %r29, %r10
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	lwz	%r2, 28(%r3)
	lwz	%r5, 8(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24934
	b	beq_cont.24935
beq_else.24934:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 24(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r6, %r0, 0	# li
	lwz	%r7, 4(%r3)
	lwz	%r29, 20(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	or	%r6, %r7, %r7	# mr %r6, %r7
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 3	# li
	lwz	%r5, 28(%r3)
	lwz	%r6, 4(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
beq_cont.24935:
beq_cont.24933:
	b	beq_cont.24931
beq_else.24930:
	stw	%r9, 16(%r3)
	stw	%r10, 20(%r3)
	stw	%r12, 24(%r3)
	stw	%r13, 28(%r3)
	stw	%r8, 32(%r3)
	mflr	%r31	
	or	%r5, %r2, %r2	# mr %r5, %r2
	or	%r29, %r7, %r7	# mr %r29, %r7
	or	%r2, %r14, %r14	# mr %r2, %r14
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24936
	b	beq_cont.24937
beq_else.24936:
	lwz	%r2, 32(%r3)
	lfs	%f0, 0(%r2)	# float
	lwz	%r2, 0(%r3)
	lfs	%f1, 0(%r2)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24938
	addi	%r5, %r0, 0	# li
	b	ble_cont.24939
ble_else.24938:
	addi	%r5, %r0, 1	# li
ble_cont.24939:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24940
	b	beq_cont.24941
beq_else.24940:
	lwz	%r5, 28(%r3)
	lwz	%r6, 4(%r5)
	cmpwi	%cr7, %r6, -1
	bne	%cr7, beq_else.24942
	b	beq_cont.24943
beq_else.24942:
	addi	%r31, %r0, 2	# li
	slw	%r6, %r6, %r31
	lwz	%r7, 24(%r3)
	add %r31, %r7, %r6
	lwz %r6, 0(%r31)
	addi	%r8, %r0, 0	# li
	lwz	%r9, 4(%r3)
	lwz	%r29, 20(%r3)
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r2, %r8, %r8	# mr %r2, %r8
	or	%r6, %r9, %r9	# mr %r6, %r9
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	lwz	%r2, 28(%r3)
	lwz	%r5, 8(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.24944
	b	beq_cont.24945
beq_else.24944:
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 24(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r6, %r0, 0	# li
	lwz	%r7, 4(%r3)
	lwz	%r29, 20(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	or	%r6, %r7, %r7	# mr %r6, %r7
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 3	# li
	lwz	%r5, 28(%r3)
	lwz	%r6, 4(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
beq_cont.24945:
beq_cont.24943:
beq_cont.24941:
beq_cont.24937:
beq_cont.24931:
	addi	%r2, %r0, 1	# li
	lwz	%r5, 8(%r3)
	lwz	%r6, 4(%r3)
	lwz	%r29, 12(%r3)
	mflr	%r31	
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
beq_cont.24929:
	lwz	%r2, 0(%r3)
	lfs	%f0, 0(%r2)	# float
	addis	%r31, %r0, (l.18560)@h	# lis
	ori	%r31, %r31, (l.18560)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.24946
	addi	%r2, %r0, 0	# li
	b	ble_cont.24947
ble_else.24946:
	addi	%r2, %r0, 1	# li
ble_cont.24947:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24948
	addi	%r2, %r0, 0	# li
	blr
beq_else.24948:
	addis	%r31, %r0, (l.18749)@h	# lis
	ori	%r31, %r31, (l.18749)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24949
	addi	%r2, %r0, 0	# li
	blr
ble_else.24949:
	addi	%r2, %r0, 1	# li
	blr
get_nvector_second.3206:
	lwz	%r5, 12(%r29)
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	lfs	%f0, 0(%r7)	# float
	lwz	%r8, 20(%r2)
	lfs	%f1, 0(%r8)	# float
	fsub	%f0, %f0, %f1
	lfs	%f1, 4(%r7)	# float
	lwz	%r8, 20(%r2)
	lfs	%f2, 4(%r8)	# float
	fsub	%f1, %f1, %f2
	lfs	%f2, 8(%r7)	# float
	lwz	%r7, 20(%r2)
	lfs	%f3, 8(%r7)	# float
	fsub	%f2, %f2, %f3
	lwz	%r7, 16(%r2)
	lfs	%f3, 0(%r7)	# float
	fmul	%f3, %f0, %f3
	lwz	%r7, 16(%r2)
	lfs	%f4, 4(%r7)	# float
	fmul	%f4, %f1, %f4
	lwz	%r7, 16(%r2)
	lfs	%f5, 8(%r7)	# float
	fmul	%f5, %f2, %f5
	lwz	%r7, 12(%r2)
	cmpwi	%cr7, %r7, 0
	bne	%cr7, beq_else.24950
	stfs	%f3, 0(%r6)	# float
	stfs	%f4, 4(%r6)	# float
	stfs	%f5, 8(%r6)	# float
	b	beq_cont.24951
beq_else.24950:
	lwz	%r7, 36(%r2)
	lfs	%f6, 8(%r7)	# float
	fmul	%f6, %f1, %f6
	lwz	%r7, 36(%r2)
	lfs	%f7, 4(%r7)	# float
	fmul	%f7, %f2, %f7
	fadd	%f6, %f6, %f7
	addis	%r31, %r0, (l.18100)@h	# lis
	ori	%r31, %r31, (l.18100)@l
	lfs	%f7, 0(%r31)	# float
	fmul	%f6, %f6, %f7
	fadd	%f3, %f3, %f6
	stfs	%f3, 0(%r6)	# float
	lwz	%r7, 36(%r2)
	lfs	%f3, 8(%r7)	# float
	fmul	%f3, %f0, %f3
	lwz	%r7, 36(%r2)
	lfs	%f6, 0(%r7)	# float
	fmul	%f2, %f2, %f6
	fadd	%f2, %f3, %f2
	addis	%r31, %r0, (l.18100)@h	# lis
	ori	%r31, %r31, (l.18100)@l
	lfs	%f3, 0(%r31)	# float
	fmul	%f2, %f2, %f3
	fadd	%f2, %f4, %f2
	stfs	%f2, 4(%r6)	# float
	lwz	%r7, 36(%r2)
	lfs	%f2, 4(%r7)	# float
	fmul	%f0, %f0, %f2
	lwz	%r7, 36(%r2)
	lfs	%f2, 0(%r7)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.18100)@h	# lis
	ori	%r31, %r31, (l.18100)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	fadd	%f0, %f5, %f0
	stfs	%f0, 8(%r6)	# float
beq_cont.24951:
	lwz	%r2, 24(%r2)
	or	%r29, %r5, %r5	# mr %r29, %r5
	or	%r5, %r2, %r2	# mr %r5, %r2
	or	%r2, %r6, %r6	# mr %r2, %r6
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
utexture.3211:
	lfs	%f0, 12(%r29)	# float
	lwz	%r6, 8(%r29)
	lwz	%r29, 4(%r29)
	lwz	%r7, 0(%r2)
	lwz	%r8, 32(%r2)
	lfs	%f1, 0(%r8)	# float
	stfs	%f1, 0(%r6)	# float
	lwz	%r8, 32(%r2)
	lfs	%f1, 4(%r8)	# float
	stfs	%f1, 4(%r6)	# float
	lwz	%r8, 32(%r2)
	lfs	%f1, 8(%r8)	# float
	stfs	%f1, 8(%r6)	# float
	cmpwi	%cr7, %r7, 1
	bne	%cr7, beq_else.24952
	lfs	%f0, 0(%r5)	# float
	lwz	%r7, 20(%r2)
	lfs	%f1, 0(%r7)	# float
	fsub	%f0, %f0, %f1
	addis	%r31, %r0, (l.18807)@h	# lis
	ori	%r31, %r31, (l.18807)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f0, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	stw	%r6, 0(%r3)
	stw	%r2, 4(%r3)
	stw	%r5, 8(%r3)
	stfs	%f0, 16(%r3)	# float
	fcmpu	%cr7, %f2, %f1
	bgt	%cr7, ble_else.24954
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f2
	bne	%cr7, beq_else.24956
	addi	%r7, %r0, 0	# li
	b	beq_cont.24957
beq_else.24956:
	stfs	%f1, 24(%r3)	# float
	lwz	%r7, 24(%r3)
	addi	%r31, %r0, 23	# lis
	srw	%r8, %r7, %r31
	andi.	%r8, %r8, 255
	addi	%r8, %r8, -127	# subi %r8, %r8, 127
	addis	%r9, %r0, 128	# lis
	ori	%r9, %r9, 0
	or	%r7, %r7, %r9
	addis	%r9, %r0, 255	# lis
	ori	%r9, %r9, 65535
	and	%r7, %r7, %r9
	addi	%r9, %r0, 23	# li
	subf	%r8, %r8, %r9	# sub	%r8, %r9, %r8
	cmpwi	%cr7, %r8, 32
	blt	%cr7, bge_else.24958
	addi	%r7, %r0, 0	# li
	b	bge_cont.24959
bge_else.24958:
	cmpwi	%cr7, %r8, 0
	blt	%cr7, bge_else.24960
	srw	%r7, %r7, %r8
	b	bge_cont.24961
bge_else.24960:
	neg	%r8, %r8
	slw	%r7, %r7, %r8
bge_cont.24961:
bge_cont.24959:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f2, %f1
	bgt	%cr7, ble_else.24962
	b	ble_cont.24963
ble_else.24962:
	neg	%r7, %r7
ble_cont.24963:
beq_cont.24957:
	mflr	%r31	
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	bl	float_of_int.2840
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	mtlr	%r31	
	b	ble_cont.24955
ble_else.24954:
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f1, %f1, %f2
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f2
	bne	%cr7, beq_else.24964
	addi	%r7, %r0, 0	# li
	b	beq_cont.24965
beq_else.24964:
	stfs	%f1, 24(%r3)	# float
	lwz	%r7, 24(%r3)
	addi	%r31, %r0, 23	# lis
	srw	%r8, %r7, %r31
	andi.	%r8, %r8, 255
	addi	%r8, %r8, -127	# subi %r8, %r8, 127
	addis	%r9, %r0, 128	# lis
	ori	%r9, %r9, 0
	or	%r7, %r7, %r9
	addis	%r9, %r0, 255	# lis
	ori	%r9, %r9, 65535
	and	%r7, %r7, %r9
	addi	%r9, %r0, 23	# li
	subf	%r8, %r8, %r9	# sub	%r8, %r9, %r8
	cmpwi	%cr7, %r8, 32
	blt	%cr7, bge_else.24966
	addi	%r7, %r0, 0	# li
	b	bge_cont.24967
bge_else.24966:
	cmpwi	%cr7, %r8, 0
	blt	%cr7, bge_else.24968
	srw	%r7, %r7, %r8
	b	bge_cont.24969
bge_else.24968:
	neg	%r8, %r8
	slw	%r7, %r7, %r8
bge_cont.24969:
bge_cont.24967:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f2, %f1
	bgt	%cr7, ble_else.24970
	b	ble_cont.24971
ble_else.24970:
	neg	%r7, %r7
ble_cont.24971:
beq_cont.24965:
	mflr	%r31	
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	bl	float_of_int.2840
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	mtlr	%r31	
ble_cont.24955:
	addis	%r31, %r0, (l.18808)@h	# lis
	ori	%r31, %r31, (l.18808)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 16(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.18798)@h	# lis
	ori	%r31, %r31, (l.18798)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24972
	addi	%r2, %r0, 0	# li
	b	ble_cont.24973
ble_else.24972:
	addi	%r2, %r0, 1	# li
ble_cont.24973:
	lwz	%r5, 8(%r3)
	lfs	%f0, 8(%r5)	# float
	lwz	%r5, 4(%r3)
	lwz	%r5, 20(%r5)
	lfs	%f1, 8(%r5)	# float
	fsub	%f0, %f0, %f1
	addis	%r31, %r0, (l.18807)@h	# lis
	ori	%r31, %r31, (l.18807)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f0, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	stw	%r2, 24(%r3)
	stfs	%f0, 32(%r3)	# float
	fcmpu	%cr7, %f2, %f1
	bgt	%cr7, ble_else.24975
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f2
	bne	%cr7, beq_else.24977
	addi	%r5, %r0, 0	# li
	b	beq_cont.24978
beq_else.24977:
	stfs	%f1, 40(%r3)	# float
	lwz	%r5, 40(%r3)
	addi	%r31, %r0, 23	# lis
	srw	%r6, %r5, %r31
	andi.	%r6, %r6, 255
	addi	%r6, %r6, -127	# subi %r6, %r6, 127
	addis	%r7, %r0, 128	# lis
	ori	%r7, %r7, 0
	or	%r5, %r5, %r7
	addis	%r7, %r0, 255	# lis
	ori	%r7, %r7, 65535
	and	%r5, %r5, %r7
	addi	%r7, %r0, 23	# li
	subf	%r6, %r6, %r7	# sub	%r6, %r7, %r6
	cmpwi	%cr7, %r6, 32
	blt	%cr7, bge_else.24979
	addi	%r5, %r0, 0	# li
	b	bge_cont.24980
bge_else.24979:
	cmpwi	%cr7, %r6, 0
	blt	%cr7, bge_else.24981
	srw	%r5, %r5, %r6
	b	bge_cont.24982
bge_else.24981:
	neg	%r6, %r6
	slw	%r5, %r5, %r6
bge_cont.24982:
bge_cont.24980:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f2, %f1
	bgt	%cr7, ble_else.24983
	b	ble_cont.24984
ble_else.24983:
	neg	%r5, %r5
ble_cont.24984:
beq_cont.24978:
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	bl	float_of_int.2840
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
	b	ble_cont.24976
ble_else.24975:
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f1, %f1, %f2
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f2
	bne	%cr7, beq_else.24985
	addi	%r5, %r0, 0	# li
	b	beq_cont.24986
beq_else.24985:
	stfs	%f1, 40(%r3)	# float
	lwz	%r5, 40(%r3)
	addi	%r31, %r0, 23	# lis
	srw	%r6, %r5, %r31
	andi.	%r6, %r6, 255
	addi	%r6, %r6, -127	# subi %r6, %r6, 127
	addis	%r7, %r0, 128	# lis
	ori	%r7, %r7, 0
	or	%r5, %r5, %r7
	addis	%r7, %r0, 255	# lis
	ori	%r7, %r7, 65535
	and	%r5, %r5, %r7
	addi	%r7, %r0, 23	# li
	subf	%r6, %r6, %r7	# sub	%r6, %r7, %r6
	cmpwi	%cr7, %r6, 32
	blt	%cr7, bge_else.24987
	addi	%r5, %r0, 0	# li
	b	bge_cont.24988
bge_else.24987:
	cmpwi	%cr7, %r6, 0
	blt	%cr7, bge_else.24989
	srw	%r5, %r5, %r6
	b	bge_cont.24990
bge_else.24989:
	neg	%r6, %r6
	slw	%r5, %r5, %r6
bge_cont.24990:
bge_cont.24988:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f2, %f1
	bgt	%cr7, ble_else.24991
	b	ble_cont.24992
ble_else.24991:
	neg	%r5, %r5
ble_cont.24992:
beq_cont.24986:
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	bl	float_of_int.2840
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
ble_cont.24976:
	addis	%r31, %r0, (l.18808)@h	# lis
	ori	%r31, %r31, (l.18808)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 32(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.18798)@h	# lis
	ori	%r31, %r31, (l.18798)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.24993
	addi	%r2, %r0, 0	# li
	b	ble_cont.24994
ble_else.24993:
	addi	%r2, %r0, 1	# li
ble_cont.24994:
	lwz	%r5, 24(%r3)
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.24995
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24997
	addis	%r31, %r0, (l.18791)@h	# lis
	ori	%r31, %r31, (l.18791)@l
	lfs	%f0, 0(%r31)	# float
	b	beq_cont.24998
beq_else.24997:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.24998:
	b	beq_cont.24996
beq_else.24995:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.24999
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	b	beq_cont.25000
beq_else.24999:
	addis	%r31, %r0, (l.18791)@h	# lis
	ori	%r31, %r31, (l.18791)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.25000:
beq_cont.24996:
	lwz	%r2, 0(%r3)
	stfs	%f0, 4(%r2)	# float
	blr
beq_else.24952:
	cmpwi	%cr7, %r7, 2
	bne	%cr7, beq_else.25002
	lfs	%f0, 4(%r5)	# float
	addis	%r31, %r0, (l.18802)@h	# lis
	ori	%r31, %r31, (l.18802)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	stw	%r6, 0(%r3)
	mflr	%r31	
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	bl	sin.2811
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
	fmul	%f0, %f0, %f0
	addis	%r31, %r0, (l.18791)@h	# lis
	ori	%r31, %r31, (l.18791)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f1, %f0
	lwz	%r2, 0(%r3)
	stfs	%f1, 0(%r2)	# float
	addis	%r31, %r0, (l.18791)@h	# lis
	ori	%r31, %r31, (l.18791)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	stfs	%f0, 4(%r2)	# float
	blr
beq_else.25002:
	cmpwi	%cr7, %r7, 3
	bne	%cr7, beq_else.25004
	lfs	%f1, 0(%r5)	# float
	lwz	%r7, 20(%r2)
	lfs	%f2, 0(%r7)	# float
	fsub	%f1, %f1, %f2
	lfs	%f2, 8(%r5)	# float
	lwz	%r2, 20(%r2)
	lfs	%f3, 8(%r2)	# float
	fsub	%f2, %f2, %f3
	fmul	%f1, %f1, %f1
	fmul	%f2, %f2, %f2
	fadd	%f1, %f1, %f2
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f2, 0(%r31)	# float
	fdiv	%f3, %f1, %f2
	fadd	%f3, %f2, %f3
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f4, 0(%r31)	# float
	fdiv	%f3, %f3, %f4
	fsub	%f2, %f3, %f2
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f2
	bgt	%cr7, ble_else.25005
	b	ble_cont.25006
ble_else.25005:
	fneg	%f2, %f2
ble_cont.25006:
	stw	%r6, 0(%r3)
	fcmpu	%cr7, %f0, %f2
	bgt	%cr7, ble_else.25007
	fdiv	%f2, %f1, %f3
	fadd	%f2, %f3, %f2
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f4, 0(%r31)	# float
	fdiv	%f2, %f2, %f4
	fsub	%f3, %f2, %f3
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f3
	bgt	%cr7, ble_else.25009
	b	ble_cont.25010
ble_else.25009:
	fneg	%f3, %f3
ble_cont.25010:
	fcmpu	%cr7, %f0, %f3
	bgt	%cr7, ble_else.25011
	mflr	%r31	
	fmr	%f0, %f2
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
	b	ble_cont.25012
ble_else.25011:
	fmr	%f0, %f2
ble_cont.25012:
	b	ble_cont.25008
ble_else.25007:
	fmr	%f0, %f3
ble_cont.25008:
	addis	%r31, %r0, (l.18798)@h	# lis
	ori	%r31, %r31, (l.18798)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f0, 40(%r3)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25013
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.25015
	addi	%r2, %r0, 0	# li
	b	beq_cont.25016
beq_else.25015:
	stfs	%f0, 48(%r3)	# float
	lwz	%r2, 48(%r3)
	addi	%r31, %r0, 23	# lis
	srw	%r5, %r2, %r31
	andi.	%r5, %r5, 255
	addi	%r5, %r5, -127	# subi %r5, %r5, 127
	addis	%r6, %r0, 128	# lis
	ori	%r6, %r6, 0
	or	%r2, %r2, %r6
	addis	%r6, %r0, 255	# lis
	ori	%r6, %r6, 65535
	and	%r2, %r2, %r6
	addi	%r6, %r0, 23	# li
	subf	%r5, %r5, %r6	# sub	%r5, %r6, %r5
	cmpwi	%cr7, %r5, 32
	blt	%cr7, bge_else.25017
	addi	%r2, %r0, 0	# li
	b	bge_cont.25018
bge_else.25017:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.25019
	srw	%r2, %r2, %r5
	b	bge_cont.25020
bge_else.25019:
	neg	%r5, %r5
	slw	%r2, %r2, %r5
bge_cont.25020:
bge_cont.25018:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25021
	b	ble_cont.25022
ble_else.25021:
	neg	%r2, %r2
ble_cont.25022:
beq_cont.25016:
	mflr	%r31	
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	bl	float_of_int.2840
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
	b	ble_cont.25014
ble_else.25013:
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f1, %f0, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f2
	bne	%cr7, beq_else.25023
	addi	%r2, %r0, 0	# li
	b	beq_cont.25024
beq_else.25023:
	stfs	%f1, 48(%r3)	# float
	lwz	%r2, 48(%r3)
	addi	%r31, %r0, 23	# lis
	srw	%r5, %r2, %r31
	andi.	%r5, %r5, 255
	addi	%r5, %r5, -127	# subi %r5, %r5, 127
	addis	%r6, %r0, 128	# lis
	ori	%r6, %r6, 0
	or	%r2, %r2, %r6
	addis	%r6, %r0, 255	# lis
	ori	%r6, %r6, 65535
	and	%r2, %r2, %r6
	addi	%r6, %r0, 23	# li
	subf	%r5, %r5, %r6	# sub	%r5, %r6, %r5
	cmpwi	%cr7, %r5, 32
	blt	%cr7, bge_else.25025
	addi	%r2, %r0, 0	# li
	b	bge_cont.25026
bge_else.25025:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.25027
	srw	%r2, %r2, %r5
	b	bge_cont.25028
bge_else.25027:
	neg	%r5, %r5
	slw	%r2, %r2, %r5
bge_cont.25028:
bge_cont.25026:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f2, %f1
	bgt	%cr7, ble_else.25029
	b	ble_cont.25030
ble_else.25029:
	neg	%r2, %r2
ble_cont.25030:
beq_cont.25024:
	mflr	%r31	
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	bl	float_of_int.2840
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
ble_cont.25014:
	lfs	%f1, 40(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.18786)@h	# lis
	ori	%r31, %r31, (l.18786)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	mflr	%r31	
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	bl	cos.2813
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
	fmul	%f0, %f0, %f0
	addis	%r31, %r0, (l.18791)@h	# lis
	ori	%r31, %r31, (l.18791)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f1, %f0, %f1
	lwz	%r2, 0(%r3)
	stfs	%f1, 4(%r2)	# float
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.18791)@h	# lis
	ori	%r31, %r31, (l.18791)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	stfs	%f0, 8(%r2)	# float
	blr
beq_else.25004:
	cmpwi	%cr7, %r7, 4
	bne	%cr7, beq_else.25032
	lfs	%f1, 0(%r5)	# float
	lwz	%r7, 20(%r2)
	lfs	%f2, 0(%r7)	# float
	fsub	%f1, %f1, %f2
	lwz	%r7, 16(%r2)
	lfs	%f2, 0(%r7)	# float
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f3, 0(%r31)	# float
	fdiv	%f4, %f2, %f3
	fadd	%f4, %f3, %f4
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f5, 0(%r31)	# float
	fdiv	%f4, %f4, %f5
	fsub	%f3, %f4, %f3
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	fcmpu	%cr7, %f5, %f3
	bgt	%cr7, ble_else.25033
	b	ble_cont.25034
ble_else.25033:
	fneg	%f3, %f3
ble_cont.25034:
	stw	%r6, 0(%r3)
	stw	%r29, 48(%r3)
	stfs	%f0, 56(%r3)	# float
	stw	%r2, 4(%r3)
	stw	%r5, 8(%r3)
	stfs	%f1, 64(%r3)	# float
	fcmpu	%cr7, %f0, %f3
	bgt	%cr7, ble_else.25036
	fdiv	%f3, %f2, %f4
	fadd	%f3, %f4, %f3
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f5, 0(%r31)	# float
	fdiv	%f3, %f3, %f5
	fsub	%f4, %f3, %f4
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	fcmpu	%cr7, %f5, %f4
	bgt	%cr7, ble_else.25038
	b	ble_cont.25039
ble_else.25038:
	fneg	%f4, %f4
ble_cont.25039:
	fcmpu	%cr7, %f0, %f4
	bgt	%cr7, ble_else.25040
	mflr	%r31	
	fmr	%f1, %f2
	fmr	%f0, %f3
	stw	%r31, 72(%r3)
	addi	%r3, %r3, 76
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -76	# subi
	lwz	%r31, 72(%r3)
	mtlr	%r31	
	b	ble_cont.25041
ble_else.25040:
	fmr	%f0, %f3
ble_cont.25041:
	b	ble_cont.25037
ble_else.25036:
	fmr	%f0, %f4
ble_cont.25037:
	lfs	%f1, 64(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 8(%r3)
	lfs	%f1, 8(%r2)	# float
	lwz	%r5, 4(%r3)
	lwz	%r6, 20(%r5)
	lfs	%f2, 8(%r6)	# float
	fsub	%f1, %f1, %f2
	lwz	%r6, 16(%r5)
	lfs	%f2, 8(%r6)	# float
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f3, 0(%r31)	# float
	fdiv	%f4, %f2, %f3
	fadd	%f4, %f3, %f4
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f5, 0(%r31)	# float
	fdiv	%f4, %f4, %f5
	fsub	%f3, %f4, %f3
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	fcmpu	%cr7, %f5, %f3
	bgt	%cr7, ble_else.25042
	b	ble_cont.25043
ble_else.25042:
	fneg	%f3, %f3
ble_cont.25043:
	lfs	%f5, 56(%r3)	# float
	stfs	%f0, 72(%r3)	# float
	stfs	%f1, 80(%r3)	# float
	fcmpu	%cr7, %f5, %f3
	bgt	%cr7, ble_else.25044
	fdiv	%f3, %f2, %f4
	fadd	%f3, %f4, %f3
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f6, 0(%r31)	# float
	fdiv	%f3, %f3, %f6
	fsub	%f4, %f3, %f4
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f6, 0(%r31)	# float
	fcmpu	%cr7, %f6, %f4
	bgt	%cr7, ble_else.25046
	b	ble_cont.25047
ble_else.25046:
	fneg	%f4, %f4
ble_cont.25047:
	fcmpu	%cr7, %f5, %f4
	bgt	%cr7, ble_else.25048
	lwz	%r29, 48(%r3)
	mflr	%r31	
	fmr	%f1, %f2
	fmr	%f0, %f3
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
	b	ble_cont.25049
ble_else.25048:
	fmr	%f0, %f3
ble_cont.25049:
	b	ble_cont.25045
ble_else.25044:
	fmr	%f0, %f4
ble_cont.25045:
	lfs	%f1, 80(%r3)	# float
	fmul	%f0, %f1, %f0
	lfs	%f1, 72(%r3)	# float
	fmul	%f2, %f1, %f1
	fmul	%f3, %f0, %f0
	fadd	%f2, %f2, %f3
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f3, 0(%r31)	# float
	fcmpu	%cr7, %f3, %f1
	bgt	%cr7, ble_else.25050
	fmr	%f3, %f1
	b	ble_cont.25051
ble_else.25050:
	fneg	%f3, %f1
ble_cont.25051:
	addis	%r31, %r0, (l.18783)@h	# lis
	ori	%r31, %r31, (l.18783)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f3
	bgt	%cr7, ble_else.25052
	addi	%r2, %r0, 0	# li
	b	ble_cont.25053
ble_else.25052:
	addi	%r2, %r0, 1	# li
ble_cont.25053:
	stfs	%f2, 88(%r3)	# float
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25054
	fdiv	%f0, %f0, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25056
	b	ble_cont.25057
ble_else.25056:
	fneg	%f0, %f0
ble_cont.25057:
	mflr	%r31	
	stw	%r31, 96(%r3)
	addi	%r3, %r3, 100
	bl	atan.2817
	addi	%r3, %r3, -100	# subi
	lwz	%r31, 96(%r3)
	mtlr	%r31	
	addis	%r31, %r0, (l.18785)@h	# lis
	ori	%r31, %r31, (l.18785)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.18786)@h	# lis
	ori	%r31, %r31, (l.18786)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	b	beq_cont.25055
beq_else.25054:
	addis	%r31, %r0, (l.18784)@h	# lis
	ori	%r31, %r31, (l.18784)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.25055:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f0, 96(%r3)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25058
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.25060
	addi	%r2, %r0, 0	# li
	b	beq_cont.25061
beq_else.25060:
	stfs	%f0, 104(%r3)	# float
	lwz	%r2, 104(%r3)
	addi	%r31, %r0, 23	# lis
	srw	%r5, %r2, %r31
	andi.	%r5, %r5, 255
	addi	%r5, %r5, -127	# subi %r5, %r5, 127
	addis	%r6, %r0, 128	# lis
	ori	%r6, %r6, 0
	or	%r2, %r2, %r6
	addis	%r6, %r0, 255	# lis
	ori	%r6, %r6, 65535
	and	%r2, %r2, %r6
	addi	%r6, %r0, 23	# li
	subf	%r5, %r5, %r6	# sub	%r5, %r6, %r5
	cmpwi	%cr7, %r5, 32
	blt	%cr7, bge_else.25062
	addi	%r2, %r0, 0	# li
	b	bge_cont.25063
bge_else.25062:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.25064
	srw	%r2, %r2, %r5
	b	bge_cont.25065
bge_else.25064:
	neg	%r5, %r5
	slw	%r2, %r2, %r5
bge_cont.25065:
bge_cont.25063:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25066
	b	ble_cont.25067
ble_else.25066:
	neg	%r2, %r2
ble_cont.25067:
beq_cont.25061:
	mflr	%r31	
	stw	%r31, 104(%r3)
	addi	%r3, %r3, 108
	bl	float_of_int.2840
	addi	%r3, %r3, -108	# subi
	lwz	%r31, 104(%r3)
	mtlr	%r31	
	b	ble_cont.25059
ble_else.25058:
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f1, %f0, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f2
	bne	%cr7, beq_else.25068
	addi	%r2, %r0, 0	# li
	b	beq_cont.25069
beq_else.25068:
	stfs	%f1, 104(%r3)	# float
	lwz	%r2, 104(%r3)
	addi	%r31, %r0, 23	# lis
	srw	%r5, %r2, %r31
	andi.	%r5, %r5, 255
	addi	%r5, %r5, -127	# subi %r5, %r5, 127
	addis	%r6, %r0, 128	# lis
	ori	%r6, %r6, 0
	or	%r2, %r2, %r6
	addis	%r6, %r0, 255	# lis
	ori	%r6, %r6, 65535
	and	%r2, %r2, %r6
	addi	%r6, %r0, 23	# li
	subf	%r5, %r5, %r6	# sub	%r5, %r6, %r5
	cmpwi	%cr7, %r5, 32
	blt	%cr7, bge_else.25070
	addi	%r2, %r0, 0	# li
	b	bge_cont.25071
bge_else.25070:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.25072
	srw	%r2, %r2, %r5
	b	bge_cont.25073
bge_else.25072:
	neg	%r5, %r5
	slw	%r2, %r2, %r5
bge_cont.25073:
bge_cont.25071:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f2, %f1
	bgt	%cr7, ble_else.25074
	b	ble_cont.25075
ble_else.25074:
	neg	%r2, %r2
ble_cont.25075:
beq_cont.25069:
	mflr	%r31	
	stw	%r31, 104(%r3)
	addi	%r3, %r3, 108
	bl	float_of_int.2840
	addi	%r3, %r3, -108	# subi
	lwz	%r31, 104(%r3)
	mtlr	%r31	
ble_cont.25059:
	lfs	%f1, 96(%r3)	# float
	fsub	%f0, %f1, %f0
	lwz	%r2, 8(%r3)
	lfs	%f1, 4(%r2)	# float
	lwz	%r2, 4(%r3)
	lwz	%r5, 20(%r2)
	lfs	%f2, 4(%r5)	# float
	fsub	%f1, %f1, %f2
	lwz	%r2, 16(%r2)
	lfs	%f2, 4(%r2)	# float
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f3, 0(%r31)	# float
	fdiv	%f4, %f2, %f3
	fadd	%f4, %f3, %f4
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f5, 0(%r31)	# float
	fdiv	%f4, %f4, %f5
	fsub	%f3, %f4, %f3
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	fcmpu	%cr7, %f5, %f3
	bgt	%cr7, ble_else.25076
	b	ble_cont.25077
ble_else.25076:
	fneg	%f3, %f3
ble_cont.25077:
	lfs	%f5, 56(%r3)	# float
	stfs	%f0, 104(%r3)	# float
	stfs	%f1, 112(%r3)	# float
	fcmpu	%cr7, %f5, %f3
	bgt	%cr7, ble_else.25078
	fdiv	%f3, %f2, %f4
	fadd	%f3, %f4, %f3
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f6, 0(%r31)	# float
	fdiv	%f3, %f3, %f6
	fsub	%f4, %f3, %f4
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f6, 0(%r31)	# float
	fcmpu	%cr7, %f6, %f4
	bgt	%cr7, ble_else.25080
	b	ble_cont.25081
ble_else.25080:
	fneg	%f4, %f4
ble_cont.25081:
	fcmpu	%cr7, %f5, %f4
	bgt	%cr7, ble_else.25082
	lwz	%r29, 48(%r3)
	mflr	%r31	
	fmr	%f1, %f2
	fmr	%f0, %f3
	stw	%r31, 120(%r3)
	addi	%r3, %r3, 124
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -124	# subi
	lwz	%r31, 120(%r3)
	mtlr	%r31	
	b	ble_cont.25083
ble_else.25082:
	fmr	%f0, %f3
ble_cont.25083:
	b	ble_cont.25079
ble_else.25078:
	fmr	%f0, %f4
ble_cont.25079:
	lfs	%f1, 112(%r3)	# float
	fmul	%f0, %f1, %f0
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	lfs	%f2, 88(%r3)	# float
	fcmpu	%cr7, %f1, %f2
	bgt	%cr7, ble_else.25084
	fmr	%f1, %f2
	b	ble_cont.25085
ble_else.25084:
	fneg	%f1, %f2
ble_cont.25085:
	addis	%r31, %r0, (l.18783)@h	# lis
	ori	%r31, %r31, (l.18783)@l
	lfs	%f3, 0(%r31)	# float
	fcmpu	%cr7, %f3, %f1
	bgt	%cr7, ble_else.25086
	addi	%r2, %r0, 0	# li
	b	ble_cont.25087
ble_else.25086:
	addi	%r2, %r0, 1	# li
ble_cont.25087:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25088
	fdiv	%f0, %f0, %f2
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25090
	b	ble_cont.25091
ble_else.25090:
	fneg	%f0, %f0
ble_cont.25091:
	mflr	%r31	
	stw	%r31, 120(%r3)
	addi	%r3, %r3, 124
	bl	atan.2817
	addi	%r3, %r3, -124	# subi
	lwz	%r31, 120(%r3)
	mtlr	%r31	
	addis	%r31, %r0, (l.18785)@h	# lis
	ori	%r31, %r31, (l.18785)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.18786)@h	# lis
	ori	%r31, %r31, (l.18786)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	b	beq_cont.25089
beq_else.25088:
	addis	%r31, %r0, (l.18784)@h	# lis
	ori	%r31, %r31, (l.18784)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.25089:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f0, 120(%r3)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25092
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.25094
	addi	%r2, %r0, 0	# li
	b	beq_cont.25095
beq_else.25094:
	stfs	%f0, 128(%r3)	# float
	lwz	%r2, 128(%r3)
	addi	%r31, %r0, 23	# lis
	srw	%r5, %r2, %r31
	andi.	%r5, %r5, 255
	addi	%r5, %r5, -127	# subi %r5, %r5, 127
	addis	%r6, %r0, 128	# lis
	ori	%r6, %r6, 0
	or	%r2, %r2, %r6
	addis	%r6, %r0, 255	# lis
	ori	%r6, %r6, 65535
	and	%r2, %r2, %r6
	addi	%r6, %r0, 23	# li
	subf	%r5, %r5, %r6	# sub	%r5, %r6, %r5
	cmpwi	%cr7, %r5, 32
	blt	%cr7, bge_else.25096
	addi	%r2, %r0, 0	# li
	b	bge_cont.25097
bge_else.25096:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.25098
	srw	%r2, %r2, %r5
	b	bge_cont.25099
bge_else.25098:
	neg	%r5, %r5
	slw	%r2, %r2, %r5
bge_cont.25099:
bge_cont.25097:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25100
	b	ble_cont.25101
ble_else.25100:
	neg	%r2, %r2
ble_cont.25101:
beq_cont.25095:
	mflr	%r31	
	stw	%r31, 128(%r3)
	addi	%r3, %r3, 132
	bl	float_of_int.2840
	addi	%r3, %r3, -132	# subi
	lwz	%r31, 128(%r3)
	mtlr	%r31	
	b	ble_cont.25093
ble_else.25092:
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f1, %f0, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f2
	bne	%cr7, beq_else.25102
	addi	%r2, %r0, 0	# li
	b	beq_cont.25103
beq_else.25102:
	stfs	%f1, 128(%r3)	# float
	lwz	%r2, 128(%r3)
	addi	%r31, %r0, 23	# lis
	srw	%r5, %r2, %r31
	andi.	%r5, %r5, 255
	addi	%r5, %r5, -127	# subi %r5, %r5, 127
	addis	%r6, %r0, 128	# lis
	ori	%r6, %r6, 0
	or	%r2, %r2, %r6
	addis	%r6, %r0, 255	# lis
	ori	%r6, %r6, 65535
	and	%r2, %r2, %r6
	addi	%r6, %r0, 23	# li
	subf	%r5, %r5, %r6	# sub	%r5, %r6, %r5
	cmpwi	%cr7, %r5, 32
	blt	%cr7, bge_else.25104
	addi	%r2, %r0, 0	# li
	b	bge_cont.25105
bge_else.25104:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.25106
	srw	%r2, %r2, %r5
	b	bge_cont.25107
bge_else.25106:
	neg	%r5, %r5
	slw	%r2, %r2, %r5
bge_cont.25107:
bge_cont.25105:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	fcmpu	%cr7, %f2, %f1
	bgt	%cr7, ble_else.25108
	b	ble_cont.25109
ble_else.25108:
	neg	%r2, %r2
ble_cont.25109:
beq_cont.25103:
	mflr	%r31	
	stw	%r31, 128(%r3)
	addi	%r3, %r3, 132
	bl	float_of_int.2840
	addi	%r3, %r3, -132	# subi
	lwz	%r31, 128(%r3)
	mtlr	%r31	
ble_cont.25093:
	lfs	%f1, 120(%r3)	# float
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.18790)@h	# lis
	ori	%r31, %r31, (l.18790)@l
	lfs	%f1, 0(%r31)	# float
	addis	%r31, %r0, (l.18100)@h	# lis
	ori	%r31, %r31, (l.18100)@l
	lfs	%f2, 0(%r31)	# float
	lfs	%f3, 104(%r3)	# float
	fsub	%f2, %f2, %f3
	fmul	%f2, %f2, %f2
	fsub	%f1, %f1, %f2
	addis	%r31, %r0, (l.18100)@h	# lis
	ori	%r31, %r31, (l.18100)@l
	lfs	%f2, 0(%r31)	# float
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fsub	%f0, %f1, %f0
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25110
	addi	%r2, %r0, 0	# li
	b	ble_cont.25111
ble_else.25110:
	addi	%r2, %r0, 1	# li
ble_cont.25111:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25112
	addi	%r2, %r0, 1	# li
	b	beq_cont.25113
beq_else.25112:
	addi	%r2, %r0, 0	# li
beq_cont.25113:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25114
	b	beq_cont.25115
beq_else.25114:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.25115:
	addis	%r31, %r0, (l.18791)@h	# lis
	ori	%r31, %r31, (l.18791)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f1, %f0
	addis	%r31, %r0, (l.18792)@h	# lis
	ori	%r31, %r31, (l.18792)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r2, 0(%r3)
	stfs	%f0, 8(%r2)	# float
	blr
beq_else.25032:
	blr
trace_reflections.3218:
	lwz	%r6, 40(%r29)
	lwz	%r7, 36(%r29)
	lwz	%r8, 32(%r29)
	lwz	%r9, 28(%r29)
	lwz	%r10, 24(%r29)
	lwz	%r11, 20(%r29)
	lwz	%r12, 16(%r29)
	lwz	%r13, 12(%r29)
	lwz	%r14, 8(%r29)
	lwz	%r15, 4(%r29)
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25118
	addi	%r31, %r0, 2	# li
	slw	%r16, %r2, %r31
	add %r31, %r11, %r16
	lwz %r11, 0(%r31)
	lwz	%r16, 4(%r11)
	addis	%r31, %r0, (l.18733)@h	# lis
	ori	%r31, %r31, (l.18733)@l
	lfs	%f2, 0(%r31)	# float
	stfs	%f2, 0(%r7)	# float
	addi	%r17, %r0, 0	# li
	lwz	%r18, 0(%r12)
	stw	%r29, 0(%r3)
	stw	%r2, 4(%r3)
	stfs	%f1, 8(%r3)	# float
	stw	%r8, 16(%r3)
	stw	%r10, 20(%r3)
	stw	%r5, 24(%r3)
	stfs	%f0, 32(%r3)	# float
	stw	%r13, 40(%r3)
	stw	%r16, 44(%r3)
	stw	%r9, 48(%r3)
	stw	%r12, 52(%r3)
	stw	%r11, 56(%r3)
	stw	%r14, 60(%r3)
	stw	%r15, 64(%r3)
	stw	%r7, 68(%r3)
	mflr	%r31	
	or	%r5, %r18, %r18	# mr %r5, %r18
	or	%r2, %r17, %r17	# mr %r2, %r17
	or	%r29, %r6, %r6	# mr %r29, %r6
	or	%r6, %r16, %r16	# mr %r6, %r16
	stw	%r31, 72(%r3)
	addi	%r3, %r3, 76
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -76	# subi
	lwz	%r31, 72(%r3)
	mtlr	%r31	
	lwz	%r2, 68(%r3)
	lfs	%f0, 0(%r2)	# float
	addis	%r31, %r0, (l.18560)@h	# lis
	ori	%r31, %r31, (l.18560)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25120
	addi	%r2, %r0, 0	# li
	b	ble_cont.25121
ble_else.25120:
	addi	%r2, %r0, 1	# li
ble_cont.25121:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25122
	addi	%r2, %r0, 0	# li
	b	beq_cont.25123
beq_else.25122:
	addis	%r31, %r0, (l.18749)@h	# lis
	ori	%r31, %r31, (l.18749)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25124
	addi	%r2, %r0, 0	# li
	b	ble_cont.25125
ble_else.25124:
	addi	%r2, %r0, 1	# li
ble_cont.25125:
beq_cont.25123:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25126
	b	beq_cont.25127
beq_else.25126:
	lwz	%r2, 64(%r3)
	lwz	%r2, 0(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	lwz	%r5, 60(%r3)
	lwz	%r5, 0(%r5)
	add	%r2, %r2, %r5
	lwz	%r5, 56(%r3)
	lwz	%r6, 0(%r5)
	cmp	%cr7, %r2, %r6
	bne	%cr7, beq_else.25128
	addi	%r2, %r0, 0	# li
	lwz	%r6, 52(%r3)
	lwz	%r6, 0(%r6)
	lwz	%r29, 48(%r3)
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 72(%r3)
	addi	%r3, %r3, 76
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -76	# subi
	lwz	%r31, 72(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25130
	lwz	%r2, 44(%r3)
	lwz	%r5, 0(%r2)
	lwz	%r6, 40(%r3)
	lfs	%f0, 0(%r6)	# float
	lfs	%f1, 0(%r5)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 4(%r6)	# float
	lfs	%f2, 4(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r6)	# float
	lfs	%f2, 8(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lwz	%r5, 56(%r3)
	lfs	%f1, 8(%r5)	# float
	lfs	%f2, 32(%r3)	# float
	fmul	%f3, %f1, %f2
	fmul	%f0, %f3, %f0
	lwz	%r2, 0(%r2)
	lwz	%r5, 24(%r3)
	lfs	%f3, 0(%r5)	# float
	lfs	%f4, 0(%r2)	# float
	fmul	%f3, %f3, %f4
	lfs	%f4, 4(%r5)	# float
	lfs	%f5, 4(%r2)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	lfs	%f4, 8(%r5)	# float
	lfs	%f5, 8(%r2)	# float
	fmul	%f4, %f4, %f5
	fadd	%f3, %f3, %f4
	fmul	%f1, %f1, %f3
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f3, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f3
	bgt	%cr7, ble_else.25132
	addi	%r2, %r0, 0	# li
	b	ble_cont.25133
ble_else.25132:
	addi	%r2, %r0, 1	# li
ble_cont.25133:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25134
	b	beq_cont.25135
beq_else.25134:
	lwz	%r2, 20(%r3)
	lfs	%f3, 0(%r2)	# float
	lwz	%r6, 16(%r3)
	lfs	%f4, 0(%r6)	# float
	fmul	%f4, %f0, %f4
	fadd	%f3, %f3, %f4
	stfs	%f3, 0(%r2)	# float
	lfs	%f3, 4(%r2)	# float
	lfs	%f4, 4(%r6)	# float
	fmul	%f4, %f0, %f4
	fadd	%f3, %f3, %f4
	stfs	%f3, 4(%r2)	# float
	lfs	%f3, 8(%r2)	# float
	lfs	%f4, 8(%r6)	# float
	fmul	%f0, %f0, %f4
	fadd	%f0, %f3, %f0
	stfs	%f0, 8(%r2)	# float
beq_cont.25135:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25136
	addi	%r2, %r0, 0	# li
	b	ble_cont.25137
ble_else.25136:
	addi	%r2, %r0, 1	# li
ble_cont.25137:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25138
	b	beq_cont.25139
beq_else.25138:
	fmul	%f0, %f1, %f1
	fmul	%f0, %f0, %f0
	lfs	%f1, 8(%r3)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 20(%r3)
	lfs	%f3, 0(%r2)	# float
	fadd	%f3, %f3, %f0
	stfs	%f3, 0(%r2)	# float
	lfs	%f3, 4(%r2)	# float
	fadd	%f3, %f3, %f0
	stfs	%f3, 4(%r2)	# float
	lfs	%f3, 8(%r2)	# float
	fadd	%f0, %f3, %f0
	stfs	%f0, 8(%r2)	# float
beq_cont.25139:
	b	beq_cont.25131
beq_else.25130:
beq_cont.25131:
	b	beq_cont.25129
beq_else.25128:
beq_cont.25129:
beq_cont.25127:
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lfs	%f0, 32(%r3)	# float
	lfs	%f1, 8(%r3)	# float
	lwz	%r5, 24(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
bge_else.25118:
	blr
trace_ray.3223:
	lwz	%r7, 84(%r29)
	lwz	%r8, 80(%r29)
	lwz	%r9, 76(%r29)
	lwz	%r10, 72(%r29)
	lwz	%r11, 68(%r29)
	lwz	%r12, 64(%r29)
	lwz	%r13, 60(%r29)
	lwz	%r14, 56(%r29)
	lwz	%r15, 52(%r29)
	lwz	%r16, 48(%r29)
	lwz	%r17, 44(%r29)
	lwz	%r18, 40(%r29)
	lwz	%r19, 36(%r29)
	lwz	%r20, 32(%r29)
	lwz	%r21, 28(%r29)
	lwz	%r22, 24(%r29)
	lwz	%r23, 20(%r29)
	lwz	%r24, 16(%r29)
	lwz	%r25, 12(%r29)
	lwz	%r26, 8(%r29)
	lwz	%r27, 4(%r29)
	cmpwi	%cr7, %r2, 4
	bgt	%cr7, ble_else.25141
	lwz	%r28, 8(%r6)
	addis	%r31, %r0, (l.18733)@h	# lis
	ori	%r31, %r31, (l.18733)@l
	lfs	%f2, 0(%r31)	# float
	stfs	%f2, 0(%r10)	# float
	addi	%r30, %r0, 0	# li
	stw	%r29, 0(%r3)
	lwz	%r29, 0(%r17)
	stfs	%f1, 8(%r3)	# float
	stw	%r8, 16(%r3)
	stw	%r20, 20(%r3)
	stw	%r15, 24(%r3)
	stw	%r21, 28(%r3)
	stw	%r12, 32(%r3)
	stw	%r14, 36(%r3)
	stw	%r17, 40(%r3)
	stw	%r11, 44(%r3)
	stw	%r6, 48(%r3)
	stw	%r7, 52(%r3)
	stw	%r13, 56(%r3)
	stw	%r24, 60(%r3)
	stw	%r26, 64(%r3)
	stw	%r19, 68(%r3)
	stw	%r23, 72(%r3)
	stw	%r18, 76(%r3)
	stw	%r25, 80(%r3)
	stw	%r16, 84(%r3)
	stw	%r27, 88(%r3)
	stfs	%f0, 96(%r3)	# float
	stw	%r22, 104(%r3)
	stw	%r5, 108(%r3)
	stw	%r28, 112(%r3)
	stw	%r2, 116(%r3)
	stw	%r10, 120(%r3)
	mflr	%r31	
	or	%r6, %r5, %r5	# mr %r6, %r5
	or	%r2, %r30, %r30	# mr %r2, %r30
	or	%r5, %r29, %r29	# mr %r5, %r29
	or	%r29, %r9, %r9	# mr %r29, %r9
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtlr	%r31	
	lwz	%r2, 120(%r3)
	lfs	%f0, 0(%r2)	# float
	addis	%r31, %r0, (l.18560)@h	# lis
	ori	%r31, %r31, (l.18560)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25144
	addi	%r5, %r0, 0	# li
	b	ble_cont.25145
ble_else.25144:
	addi	%r5, %r0, 1	# li
ble_cont.25145:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25146
	addi	%r5, %r0, 0	# li
	b	beq_cont.25147
beq_else.25146:
	addis	%r31, %r0, (l.18749)@h	# lis
	ori	%r31, %r31, (l.18749)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25148
	addi	%r5, %r0, 0	# li
	b	ble_cont.25149
ble_else.25148:
	addi	%r5, %r0, 1	# li
ble_cont.25149:
beq_cont.25147:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25150
	addi	%r2, %r0, -1	# li
	lwz	%r5, 116(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 112(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25151
	blr
beq_else.25151:
	lwz	%r2, 108(%r3)
	lfs	%f0, 0(%r2)	# float
	lwz	%r5, 104(%r3)
	lfs	%f1, 0(%r5)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 4(%r2)	# float
	lfs	%f2, 4(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r2)	# float
	lfs	%f2, 8(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25153
	addi	%r2, %r0, 0	# li
	b	ble_cont.25154
ble_else.25153:
	addi	%r2, %r0, 1	# li
ble_cont.25154:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25155
	blr
beq_else.25155:
	fmul	%f1, %f0, %f0
	fmul	%f0, %f1, %f0
	lfs	%f1, 96(%r3)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 88(%r3)
	lfs	%f1, 0(%r2)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 84(%r3)
	lfs	%f1, 0(%r2)	# float
	fadd	%f1, %f1, %f0
	stfs	%f1, 0(%r2)	# float
	lfs	%f1, 4(%r2)	# float
	fadd	%f1, %f1, %f0
	stfs	%f1, 4(%r2)	# float
	lfs	%f1, 8(%r2)	# float
	fadd	%f0, %f1, %f0
	stfs	%f0, 8(%r2)	# float
	blr
beq_else.25150:
	lwz	%r5, 80(%r3)
	lwz	%r5, 0(%r5)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 76(%r3)
	add %r31, %r7, %r6
	lwz %r6, 0(%r31)
	lwz	%r7, 8(%r6)
	lwz	%r8, 28(%r6)
	lfs	%f0, 0(%r8)	# float
	lfs	%f1, 96(%r3)	# float
	fmul	%f0, %f0, %f1
	lwz	%r8, 4(%r6)
	stw	%r7, 124(%r3)
	stfs	%f0, 128(%r3)	# float
	stw	%r5, 136(%r3)
	stw	%r6, 140(%r3)
	cmpwi	%cr7, %r8, 1
	bne	%cr7, beq_else.25158
	lwz	%r8, 72(%r3)
	lwz	%r9, 0(%r8)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	lwz	%r10, 68(%r3)
	stfs	%f2, 0(%r10)	# float
	stfs	%f2, 4(%r10)	# float
	stfs	%f2, 8(%r10)	# float
	addi	%r11, %r9, -1	# subi %r11, %r9, 1
	addi	%r9, %r9, -1	# subi %r9, %r9, 1
	addi	%r31, %r0, 2	# li
	slw	%r9, %r9, %r31
	lwz	%r12, 108(%r3)
	add %r31, %r12, %r9
	lfs %f2, 0(%r31)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f3, 0(%r31)	# float
	fcmpu	%cr7, %f2, %f3
	bne	%cr7, beq_else.25160
	addi	%r9, %r0, 1	# li
	b	beq_cont.25161
beq_else.25160:
	addi	%r9, %r0, 0	# li
beq_cont.25161:
	cmpwi	%cr7, %r9, 0
	bne	%cr7, beq_else.25162
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f3, 0(%r31)	# float
	fcmpu	%cr7, %f2, %f3
	bgt	%cr7, ble_else.25164
	addi	%r9, %r0, 0	# li
	b	ble_cont.25165
ble_else.25164:
	addi	%r9, %r0, 1	# li
ble_cont.25165:
	cmpwi	%cr7, %r9, 0
	bne	%cr7, beq_else.25166
	addis	%r31, %r0, (l.18118)@h	# lis
	ori	%r31, %r31, (l.18118)@l
	lfs	%f2, 0(%r31)	# float
	b	beq_cont.25167
beq_else.25166:
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f2, 0(%r31)	# float
beq_cont.25167:
	b	beq_cont.25163
beq_else.25162:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
beq_cont.25163:
	fneg	%f2, %f2
	addi	%r31, %r0, 2	# li
	slw	%r9, %r11, %r31
	add %r31, %r10, %r9
	stfs %f2, 0(%r31)
	b	beq_cont.25159
beq_else.25158:
	cmpwi	%cr7, %r8, 2
	bne	%cr7, beq_else.25168
	lwz	%r8, 16(%r6)
	lfs	%f2, 0(%r8)	# float
	fneg	%f2, %f2
	lwz	%r8, 68(%r3)
	stfs	%f2, 0(%r8)	# float
	lwz	%r9, 16(%r6)
	lfs	%f2, 4(%r9)	# float
	fneg	%f2, %f2
	stfs	%f2, 4(%r8)	# float
	lwz	%r9, 16(%r6)
	lfs	%f2, 8(%r9)	# float
	fneg	%f2, %f2
	stfs	%f2, 8(%r8)	# float
	b	beq_cont.25169
beq_else.25168:
	lwz	%r29, 64(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 144(%r3)
	addi	%r3, %r3, 148
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -148	# subi
	lwz	%r31, 144(%r3)
	mtlr	%r31	
beq_cont.25169:
beq_cont.25159:
	lwz	%r5, 60(%r3)
	lfs	%f0, 0(%r5)	# float
	lwz	%r2, 56(%r3)
	stfs	%f0, 0(%r2)	# float
	lfs	%f0, 4(%r5)	# float
	stfs	%f0, 4(%r2)	# float
	lfs	%f0, 8(%r5)	# float
	stfs	%f0, 8(%r2)	# float
	lwz	%r2, 140(%r3)
	lwz	%r29, 52(%r3)
	mflr	%r31	
	stw	%r31, 144(%r3)
	addi	%r3, %r3, 148
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -148	# subi
	lwz	%r31, 144(%r3)
	mtlr	%r31	
	lwz	%r2, 136(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	lwz	%r5, 72(%r3)
	lwz	%r5, 0(%r5)
	add	%r2, %r2, %r5
	lwz	%r5, 116(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 112(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	lwz	%r2, 48(%r3)
	lwz	%r6, 4(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r8, %r5, %r31
	add %r31, %r6, %r8
	lwz %r6, 0(%r31)
	lwz	%r8, 60(%r3)
	lfs	%f0, 0(%r8)	# float
	stfs	%f0, 0(%r6)	# float
	lfs	%f0, 4(%r8)	# float
	stfs	%f0, 4(%r6)	# float
	lfs	%f0, 8(%r8)	# float
	stfs	%f0, 8(%r6)	# float
	lwz	%r6, 12(%r2)
	lwz	%r9, 140(%r3)
	lwz	%r10, 28(%r9)
	lfs	%f0, 0(%r10)	# float
	addis	%r31, %r0, (l.18100)@h	# lis
	ori	%r31, %r31, (l.18100)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25170
	addi	%r10, %r0, 0	# li
	b	ble_cont.25171
ble_else.25170:
	addi	%r10, %r0, 1	# li
ble_cont.25171:
	cmpwi	%cr7, %r10, 0
	bne	%cr7, beq_else.25172
	addi	%r10, %r0, 1	# li
	addi	%r31, %r0, 2	# li
	slw	%r11, %r5, %r31
	add %r31, %r6, %r11
	stw %r10, 0(%r31)
	lwz	%r6, 16(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r10, %r5, %r31
	add %r31, %r6, %r10
	lwz %r10, 0(%r31)
	lwz	%r11, 44(%r3)
	lfs	%f0, 0(%r11)	# float
	stfs	%f0, 0(%r10)	# float
	lfs	%f0, 4(%r11)	# float
	stfs	%f0, 4(%r10)	# float
	lfs	%f0, 8(%r11)	# float
	stfs	%f0, 8(%r10)	# float
	addi	%r31, %r0, 2	# li
	slw	%r10, %r5, %r31
	add %r31, %r6, %r10
	lwz %r6, 0(%r31)
	addis	%r31, %r0, (l.18890)@h	# lis
	ori	%r31, %r31, (l.18890)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 128(%r3)	# float
	fmul	%f0, %f0, %f1
	lfs	%f2, 0(%r6)	# float
	fmul	%f2, %f2, %f0
	stfs	%f2, 0(%r6)	# float
	lfs	%f2, 4(%r6)	# float
	fmul	%f2, %f2, %f0
	stfs	%f2, 4(%r6)	# float
	lfs	%f2, 8(%r6)	# float
	fmul	%f0, %f2, %f0
	stfs	%f0, 8(%r6)	# float
	lwz	%r6, 28(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r10, %r5, %r31
	add %r31, %r6, %r10
	lwz %r6, 0(%r31)
	lwz	%r10, 68(%r3)
	lfs	%f0, 0(%r10)	# float
	stfs	%f0, 0(%r6)	# float
	lfs	%f0, 4(%r10)	# float
	stfs	%f0, 4(%r6)	# float
	lfs	%f0, 8(%r10)	# float
	stfs	%f0, 8(%r6)	# float
	b	beq_cont.25173
beq_else.25172:
	addi	%r10, %r0, 0	# li
	addi	%r31, %r0, 2	# li
	slw	%r11, %r5, %r31
	add %r31, %r6, %r11
	stw %r10, 0(%r31)
beq_cont.25173:
	addis	%r31, %r0, (l.18904)@h	# lis
	ori	%r31, %r31, (l.18904)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r6, 108(%r3)
	lfs	%f1, 0(%r6)	# float
	lwz	%r10, 68(%r3)
	lfs	%f2, 0(%r10)	# float
	fmul	%f1, %f1, %f2
	lfs	%f2, 4(%r6)	# float
	lfs	%f3, 4(%r10)	# float
	fmul	%f2, %f2, %f3
	fadd	%f1, %f1, %f2
	lfs	%f2, 8(%r6)	# float
	lfs	%f3, 8(%r10)	# float
	fmul	%f2, %f2, %f3
	fadd	%f1, %f1, %f2
	fmul	%f0, %f0, %f1
	lfs	%f1, 0(%r6)	# float
	lfs	%f2, 0(%r10)	# float
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	stfs	%f1, 0(%r6)	# float
	lfs	%f1, 4(%r6)	# float
	lfs	%f2, 4(%r10)	# float
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	stfs	%f1, 4(%r6)	# float
	lfs	%f1, 8(%r6)	# float
	lfs	%f2, 8(%r10)	# float
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	stfs	%f0, 8(%r6)	# float
	lwz	%r11, 28(%r9)
	lfs	%f0, 4(%r11)	# float
	lfs	%f1, 96(%r3)	# float
	fmul	%f0, %f1, %f0
	addi	%r11, %r0, 0	# li
	lwz	%r12, 40(%r3)
	lwz	%r12, 0(%r12)
	lwz	%r29, 36(%r3)
	stfs	%f0, 144(%r3)	# float
	mflr	%r31	
	or	%r5, %r12, %r12	# mr %r5, %r12
	or	%r2, %r11, %r11	# mr %r2, %r11
	stw	%r31, 152(%r3)
	addi	%r3, %r3, 156
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -156	# subi
	lwz	%r31, 152(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25174
	lwz	%r2, 68(%r3)
	lfs	%f0, 0(%r2)	# float
	lwz	%r5, 104(%r3)
	lfs	%f1, 0(%r5)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 4(%r2)	# float
	lfs	%f2, 4(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r2)	# float
	lfs	%f2, 8(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	lfs	%f1, 128(%r3)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 108(%r3)
	lfs	%f2, 0(%r2)	# float
	lfs	%f3, 0(%r5)	# float
	fmul	%f2, %f2, %f3
	lfs	%f3, 4(%r2)	# float
	lfs	%f4, 4(%r5)	# float
	fmul	%f3, %f3, %f4
	fadd	%f2, %f2, %f3
	lfs	%f3, 8(%r2)	# float
	lfs	%f4, 8(%r5)	# float
	fmul	%f3, %f3, %f4
	fadd	%f2, %f2, %f3
	fneg	%f2, %f2
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f3, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f3
	bgt	%cr7, ble_else.25176
	addi	%r5, %r0, 0	# li
	b	ble_cont.25177
ble_else.25176:
	addi	%r5, %r0, 1	# li
ble_cont.25177:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25178
	b	beq_cont.25179
beq_else.25178:
	lwz	%r5, 84(%r3)
	lfs	%f3, 0(%r5)	# float
	lwz	%r6, 44(%r3)
	lfs	%f4, 0(%r6)	# float
	fmul	%f4, %f0, %f4
	fadd	%f3, %f3, %f4
	stfs	%f3, 0(%r5)	# float
	lfs	%f3, 4(%r5)	# float
	lfs	%f4, 4(%r6)	# float
	fmul	%f4, %f0, %f4
	fadd	%f3, %f3, %f4
	stfs	%f3, 4(%r5)	# float
	lfs	%f3, 8(%r5)	# float
	lfs	%f4, 8(%r6)	# float
	fmul	%f0, %f0, %f4
	fadd	%f0, %f3, %f0
	stfs	%f0, 8(%r5)	# float
beq_cont.25179:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	fcmpu	%cr7, %f2, %f0
	bgt	%cr7, ble_else.25180
	addi	%r5, %r0, 0	# li
	b	ble_cont.25181
ble_else.25180:
	addi	%r5, %r0, 1	# li
ble_cont.25181:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25182
	b	beq_cont.25183
beq_else.25182:
	fmul	%f0, %f2, %f2
	fmul	%f0, %f0, %f0
	lfs	%f2, 144(%r3)	# float
	fmul	%f0, %f0, %f2
	lwz	%r5, 84(%r3)
	lfs	%f3, 0(%r5)	# float
	fadd	%f3, %f3, %f0
	stfs	%f3, 0(%r5)	# float
	lfs	%f3, 4(%r5)	# float
	fadd	%f3, %f3, %f0
	stfs	%f3, 4(%r5)	# float
	lfs	%f3, 8(%r5)	# float
	fadd	%f0, %f3, %f0
	stfs	%f0, 8(%r5)	# float
beq_cont.25183:
	b	beq_cont.25175
beq_else.25174:
beq_cont.25175:
	lwz	%r2, 60(%r3)
	lfs	%f0, 0(%r2)	# float
	lwz	%r5, 32(%r3)
	stfs	%f0, 0(%r5)	# float
	lfs	%f0, 4(%r2)	# float
	stfs	%f0, 4(%r5)	# float
	lfs	%f0, 8(%r2)	# float
	stfs	%f0, 8(%r5)	# float
	lwz	%r5, 28(%r3)
	lwz	%r5, 0(%r5)
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r29, 24(%r3)
	mflr	%r31	
	stw	%r31, 152(%r3)
	addi	%r3, %r3, 156
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -156	# subi
	lwz	%r31, 152(%r3)
	mtlr	%r31	
	lwz	%r2, 20(%r3)
	lwz	%r2, 0(%r2)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lfs	%f0, 128(%r3)	# float
	lfs	%f1, 144(%r3)	# float
	lwz	%r5, 108(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 152(%r3)
	addi	%r3, %r3, 156
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -156	# subi
	lwz	%r31, 152(%r3)
	mtlr	%r31	
	addis	%r31, %r0, (l.18957)@h	# lis
	ori	%r31, %r31, (l.18957)@l
	lfs	%f0, 0(%r31)	# float
	lfs	%f1, 96(%r3)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25184
	addi	%r2, %r0, 0	# li
	b	ble_cont.25185
ble_else.25184:
	addi	%r2, %r0, 1	# li
ble_cont.25185:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25186
	blr
beq_else.25186:
	lwz	%r2, 116(%r3)
	cmpwi	%cr7, %r2, 4
	blt	%cr7, bge_else.25188
	b	bge_cont.25189
bge_else.25188:
	addi	%r5, %r2, 1
	addi	%r6, %r0, -1	# li
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r7, 112(%r3)
	add %r31, %r7, %r5
	stw %r6, 0(%r31)
bge_cont.25189:
	lwz	%r5, 124(%r3)
	cmpwi	%cr7, %r5, 2
	bne	%cr7, beq_else.25190
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r5, 140(%r3)
	lwz	%r5, 28(%r5)
	lfs	%f2, 0(%r5)	# float
	fsub	%f0, %f0, %f2
	fmul	%f0, %f1, %f0
	addi	%r2, %r2, 1
	lwz	%r5, 120(%r3)
	lfs	%f1, 0(%r5)	# float
	lfs	%f2, 8(%r3)	# float
	fadd	%f1, %f2, %f1
	lwz	%r5, 108(%r3)
	lwz	%r6, 48(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
beq_else.25190:
	blr
ble_else.25141:
	blr
trace_diffuse_ray.3229:
	lwz	%r5, 56(%r29)
	lwz	%r6, 52(%r29)
	lwz	%r7, 48(%r29)
	lwz	%r8, 44(%r29)
	lwz	%r9, 40(%r29)
	lwz	%r10, 36(%r29)
	lwz	%r11, 32(%r29)
	lwz	%r12, 28(%r29)
	lwz	%r13, 24(%r29)
	lwz	%r14, 20(%r29)
	lwz	%r15, 16(%r29)
	lwz	%r16, 12(%r29)
	lwz	%r17, 8(%r29)
	lwz	%r18, 4(%r29)
	addis	%r31, %r0, (l.18733)@h	# lis
	ori	%r31, %r31, (l.18733)@l
	lfs	%f1, 0(%r31)	# float
	stfs	%f1, 0(%r7)	# float
	addi	%r19, %r0, 0	# li
	lwz	%r20, 0(%r10)
	stw	%r8, 0(%r3)
	stw	%r18, 4(%r3)
	stfs	%f0, 8(%r3)	# float
	stw	%r13, 16(%r3)
	stw	%r9, 20(%r3)
	stw	%r10, 24(%r3)
	stw	%r15, 28(%r3)
	stw	%r5, 32(%r3)
	stw	%r17, 36(%r3)
	stw	%r12, 40(%r3)
	stw	%r14, 44(%r3)
	stw	%r2, 48(%r3)
	stw	%r11, 52(%r3)
	stw	%r16, 56(%r3)
	stw	%r7, 60(%r3)
	mflr	%r31	
	or	%r5, %r20, %r20	# mr %r5, %r20
	or	%r29, %r6, %r6	# mr %r29, %r6
	or	%r6, %r2, %r2	# mr %r6, %r2
	or	%r2, %r19, %r19	# mr %r2, %r19
	stw	%r31, 64(%r3)
	addi	%r3, %r3, 68
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -68	# subi
	lwz	%r31, 64(%r3)
	mtlr	%r31	
	lwz	%r2, 60(%r3)
	lfs	%f0, 0(%r2)	# float
	addis	%r31, %r0, (l.18560)@h	# lis
	ori	%r31, %r31, (l.18560)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25193
	addi	%r2, %r0, 0	# li
	b	ble_cont.25194
ble_else.25193:
	addi	%r2, %r0, 1	# li
ble_cont.25194:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25195
	addi	%r2, %r0, 0	# li
	b	beq_cont.25196
beq_else.25195:
	addis	%r31, %r0, (l.18749)@h	# lis
	ori	%r31, %r31, (l.18749)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25197
	addi	%r2, %r0, 0	# li
	b	ble_cont.25198
ble_else.25197:
	addi	%r2, %r0, 1	# li
ble_cont.25198:
beq_cont.25196:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25199
	blr
beq_else.25199:
	lwz	%r2, 56(%r3)
	lwz	%r2, 0(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	lwz	%r5, 52(%r3)
	add %r31, %r5, %r2
	lwz %r2, 0(%r31)
	lwz	%r5, 48(%r3)
	lwz	%r5, 0(%r5)
	lwz	%r6, 4(%r2)
	stw	%r2, 64(%r3)
	cmpwi	%cr7, %r6, 1
	bne	%cr7, beq_else.25201
	lwz	%r6, 44(%r3)
	lwz	%r6, 0(%r6)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r7, 40(%r3)
	stfs	%f0, 0(%r7)	# float
	stfs	%f0, 4(%r7)	# float
	stfs	%f0, 8(%r7)	# float
	addi	%r8, %r6, -1	# subi %r8, %r6, 1
	addi	%r6, %r6, -1	# subi %r6, %r6, 1
	addi	%r31, %r0, 2	# li
	slw	%r6, %r6, %r31
	add %r31, %r5, %r6
	lfs %f0, 0(%r31)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.25203
	addi	%r5, %r0, 1	# li
	b	beq_cont.25204
beq_else.25203:
	addi	%r5, %r0, 0	# li
beq_cont.25204:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25205
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25207
	addi	%r5, %r0, 0	# li
	b	ble_cont.25208
ble_else.25207:
	addi	%r5, %r0, 1	# li
ble_cont.25208:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25209
	addis	%r31, %r0, (l.18118)@h	# lis
	ori	%r31, %r31, (l.18118)@l
	lfs	%f0, 0(%r31)	# float
	b	beq_cont.25210
beq_else.25209:
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.25210:
	b	beq_cont.25206
beq_else.25205:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.25206:
	fneg	%f0, %f0
	addi	%r31, %r0, 2	# li
	slw	%r5, %r8, %r31
	add %r31, %r7, %r5
	stfs %f0, 0(%r31)
	b	beq_cont.25202
beq_else.25201:
	cmpwi	%cr7, %r6, 2
	bne	%cr7, beq_else.25211
	lwz	%r5, 16(%r2)
	lfs	%f0, 0(%r5)	# float
	fneg	%f0, %f0
	lwz	%r5, 40(%r3)
	stfs	%f0, 0(%r5)	# float
	lwz	%r6, 16(%r2)
	lfs	%f0, 4(%r6)	# float
	fneg	%f0, %f0
	stfs	%f0, 4(%r5)	# float
	lwz	%r6, 16(%r2)
	lfs	%f0, 8(%r6)	# float
	fneg	%f0, %f0
	stfs	%f0, 8(%r5)	# float
	b	beq_cont.25212
beq_else.25211:
	lwz	%r29, 36(%r3)
	mflr	%r31	
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtlr	%r31	
beq_cont.25212:
beq_cont.25202:
	lwz	%r2, 64(%r3)
	lwz	%r5, 28(%r3)
	lwz	%r29, 32(%r3)
	mflr	%r31	
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 0	# li
	lwz	%r5, 24(%r3)
	lwz	%r5, 0(%r5)
	lwz	%r29, 20(%r3)
	mflr	%r31	
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25213
	lwz	%r2, 40(%r3)
	lfs	%f0, 0(%r2)	# float
	lwz	%r5, 16(%r3)
	lfs	%f1, 0(%r5)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 4(%r2)	# float
	lfs	%f2, 4(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r2)	# float
	lfs	%f2, 8(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25214
	addi	%r2, %r0, 0	# li
	b	ble_cont.25215
ble_else.25214:
	addi	%r2, %r0, 1	# li
ble_cont.25215:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25216
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	b	beq_cont.25217
beq_else.25216:
beq_cont.25217:
	lfs	%f1, 8(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 64(%r3)
	lwz	%r2, 28(%r2)
	lfs	%f1, 0(%r2)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 4(%r3)
	lfs	%f1, 0(%r2)	# float
	lwz	%r5, 0(%r3)
	lfs	%f2, 0(%r5)	# float
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	stfs	%f1, 0(%r2)	# float
	lfs	%f1, 4(%r2)	# float
	lfs	%f2, 4(%r5)	# float
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	stfs	%f1, 4(%r2)	# float
	lfs	%f1, 8(%r2)	# float
	lfs	%f2, 8(%r5)	# float
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	stfs	%f0, 8(%r2)	# float
	blr
beq_else.25213:
	blr
iter_trace_diffuse_rays.3232:
	lwz	%r8, 56(%r29)
	lwz	%r9, 52(%r29)
	lwz	%r10, 48(%r29)
	lwz	%r11, 44(%r29)
	lwz	%r12, 40(%r29)
	lwz	%r13, 36(%r29)
	lwz	%r14, 32(%r29)
	lwz	%r15, 28(%r29)
	lwz	%r16, 24(%r29)
	lwz	%r17, 20(%r29)
	lwz	%r18, 16(%r29)
	lwz	%r19, 12(%r29)
	lwz	%r20, 8(%r29)
	lwz	%r21, 4(%r29)
	cmpwi	%cr7, %r7, 0
	blt	%cr7, bge_else.25220
	addi	%r31, %r0, 2	# li
	slw	%r22, %r7, %r31
	add %r31, %r2, %r22
	lwz %r22, 0(%r31)
	lwz	%r22, 0(%r22)
	lfs	%f0, 0(%r22)	# float
	lfs	%f1, 0(%r5)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 4(%r22)	# float
	lfs	%f2, 4(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r22)	# float
	lfs	%f2, 8(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25221
	addi	%r22, %r0, 0	# li
	b	ble_cont.25222
ble_else.25221:
	addi	%r22, %r0, 1	# li
ble_cont.25222:
	cmpwi	%cr7, %r22, 0
	bne	%cr7, beq_else.25223
	addi	%r22, %r0, 1	# li
	b	beq_cont.25224
beq_else.25223:
	addi	%r22, %r0, 0	# li
beq_cont.25224:
	stw	%r6, 0(%r3)
	stw	%r29, 4(%r3)
	stw	%r9, 8(%r3)
	stw	%r5, 12(%r3)
	stw	%r2, 16(%r3)
	stw	%r7, 20(%r3)
	cmpwi	%cr7, %r22, 0
	bne	%cr7, beq_else.25225
	addi	%r31, %r0, 2	# li
	slw	%r22, %r7, %r31
	add %r31, %r2, %r22
	lwz %r22, 0(%r31)
	addis	%r31, %r0, (l.19050)@h	# lis
	ori	%r31, %r31, (l.19050)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	stw	%r10, 24(%r3)
	stw	%r21, 28(%r3)
	stfs	%f0, 32(%r3)	# float
	stw	%r15, 40(%r3)
	stw	%r11, 44(%r3)
	stw	%r12, 48(%r3)
	stw	%r18, 52(%r3)
	stw	%r8, 56(%r3)
	stw	%r20, 60(%r3)
	stw	%r14, 64(%r3)
	stw	%r17, 68(%r3)
	stw	%r22, 72(%r3)
	stw	%r13, 76(%r3)
	stw	%r19, 80(%r3)
	mflr	%r31	
	or	%r2, %r22, %r22	# mr %r2, %r22
	or	%r29, %r16, %r16	# mr %r29, %r16
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25227
	b	beq_cont.25228
beq_else.25227:
	lwz	%r2, 80(%r3)
	lwz	%r2, 0(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	lwz	%r5, 76(%r3)
	add %r31, %r5, %r2
	lwz %r2, 0(%r31)
	lwz	%r5, 72(%r3)
	lwz	%r5, 0(%r5)
	lwz	%r6, 4(%r2)
	stw	%r2, 84(%r3)
	cmpwi	%cr7, %r6, 1
	bne	%cr7, beq_else.25229
	lwz	%r6, 68(%r3)
	lwz	%r6, 0(%r6)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r7, 64(%r3)
	stfs	%f0, 0(%r7)	# float
	stfs	%f0, 4(%r7)	# float
	stfs	%f0, 8(%r7)	# float
	addi	%r8, %r6, -1	# subi %r8, %r6, 1
	addi	%r6, %r6, -1	# subi %r6, %r6, 1
	addi	%r31, %r0, 2	# li
	slw	%r6, %r6, %r31
	add %r31, %r5, %r6
	lfs %f0, 0(%r31)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.25231
	addi	%r5, %r0, 1	# li
	b	beq_cont.25232
beq_else.25231:
	addi	%r5, %r0, 0	# li
beq_cont.25232:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25233
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25235
	addi	%r5, %r0, 0	# li
	b	ble_cont.25236
ble_else.25235:
	addi	%r5, %r0, 1	# li
ble_cont.25236:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25237
	addis	%r31, %r0, (l.18118)@h	# lis
	ori	%r31, %r31, (l.18118)@l
	lfs	%f0, 0(%r31)	# float
	b	beq_cont.25238
beq_else.25237:
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.25238:
	b	beq_cont.25234
beq_else.25233:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.25234:
	fneg	%f0, %f0
	addi	%r31, %r0, 2	# li
	slw	%r5, %r8, %r31
	add %r31, %r7, %r5
	stfs %f0, 0(%r31)
	b	beq_cont.25230
beq_else.25229:
	cmpwi	%cr7, %r6, 2
	bne	%cr7, beq_else.25239
	lwz	%r5, 16(%r2)
	lfs	%f0, 0(%r5)	# float
	fneg	%f0, %f0
	lwz	%r5, 64(%r3)
	stfs	%f0, 0(%r5)	# float
	lwz	%r6, 16(%r2)
	lfs	%f0, 4(%r6)	# float
	fneg	%f0, %f0
	stfs	%f0, 4(%r5)	# float
	lwz	%r6, 16(%r2)
	lfs	%f0, 8(%r6)	# float
	fneg	%f0, %f0
	stfs	%f0, 8(%r5)	# float
	b	beq_cont.25240
beq_else.25239:
	lwz	%r29, 60(%r3)
	mflr	%r31	
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
beq_cont.25240:
beq_cont.25230:
	lwz	%r2, 84(%r3)
	lwz	%r5, 52(%r3)
	lwz	%r29, 56(%r3)
	mflr	%r31	
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 0	# li
	lwz	%r5, 48(%r3)
	lwz	%r5, 0(%r5)
	lwz	%r29, 44(%r3)
	mflr	%r31	
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25241
	lwz	%r2, 64(%r3)
	lfs	%f0, 0(%r2)	# float
	lwz	%r5, 40(%r3)
	lfs	%f1, 0(%r5)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 4(%r2)	# float
	lfs	%f2, 4(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r2)	# float
	lfs	%f2, 8(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25243
	addi	%r2, %r0, 0	# li
	b	ble_cont.25244
ble_else.25243:
	addi	%r2, %r0, 1	# li
ble_cont.25244:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25245
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	b	beq_cont.25246
beq_else.25245:
beq_cont.25246:
	lfs	%f1, 32(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 84(%r3)
	lwz	%r2, 28(%r2)
	lfs	%f1, 0(%r2)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 28(%r3)
	lfs	%f1, 0(%r2)	# float
	lwz	%r5, 24(%r3)
	lfs	%f2, 0(%r5)	# float
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	stfs	%f1, 0(%r2)	# float
	lfs	%f1, 4(%r2)	# float
	lfs	%f2, 4(%r5)	# float
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	stfs	%f1, 4(%r2)	# float
	lfs	%f1, 8(%r2)	# float
	lfs	%f2, 8(%r5)	# float
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	stfs	%f0, 8(%r2)	# float
	b	beq_cont.25242
beq_else.25241:
beq_cont.25242:
beq_cont.25228:
	b	beq_cont.25226
beq_else.25225:
	addi	%r22, %r7, 1
	addi	%r31, %r0, 2	# li
	slw	%r22, %r22, %r31
	add %r31, %r2, %r22
	lwz %r22, 0(%r31)
	addis	%r31, %r0, (l.19017)@h	# lis
	ori	%r31, %r31, (l.19017)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	stw	%r10, 24(%r3)
	stw	%r21, 28(%r3)
	stfs	%f0, 88(%r3)	# float
	stw	%r15, 40(%r3)
	stw	%r11, 44(%r3)
	stw	%r12, 48(%r3)
	stw	%r18, 52(%r3)
	stw	%r8, 56(%r3)
	stw	%r20, 60(%r3)
	stw	%r14, 64(%r3)
	stw	%r17, 68(%r3)
	stw	%r22, 96(%r3)
	stw	%r13, 76(%r3)
	stw	%r19, 80(%r3)
	mflr	%r31	
	or	%r2, %r22, %r22	# mr %r2, %r22
	or	%r29, %r16, %r16	# mr %r29, %r16
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25247
	b	beq_cont.25248
beq_else.25247:
	lwz	%r2, 80(%r3)
	lwz	%r2, 0(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	lwz	%r5, 76(%r3)
	add %r31, %r5, %r2
	lwz %r2, 0(%r31)
	lwz	%r5, 96(%r3)
	lwz	%r5, 0(%r5)
	lwz	%r6, 4(%r2)
	stw	%r2, 100(%r3)
	cmpwi	%cr7, %r6, 1
	bne	%cr7, beq_else.25249
	lwz	%r6, 68(%r3)
	lwz	%r6, 0(%r6)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r7, 64(%r3)
	stfs	%f0, 0(%r7)	# float
	stfs	%f0, 4(%r7)	# float
	stfs	%f0, 8(%r7)	# float
	addi	%r8, %r6, -1	# subi %r8, %r6, 1
	addi	%r6, %r6, -1	# subi %r6, %r6, 1
	addi	%r31, %r0, 2	# li
	slw	%r6, %r6, %r31
	add %r31, %r5, %r6
	lfs %f0, 0(%r31)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.25251
	addi	%r5, %r0, 1	# li
	b	beq_cont.25252
beq_else.25251:
	addi	%r5, %r0, 0	# li
beq_cont.25252:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25253
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25255
	addi	%r5, %r0, 0	# li
	b	ble_cont.25256
ble_else.25255:
	addi	%r5, %r0, 1	# li
ble_cont.25256:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25257
	addis	%r31, %r0, (l.18118)@h	# lis
	ori	%r31, %r31, (l.18118)@l
	lfs	%f0, 0(%r31)	# float
	b	beq_cont.25258
beq_else.25257:
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.25258:
	b	beq_cont.25254
beq_else.25253:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
beq_cont.25254:
	fneg	%f0, %f0
	addi	%r31, %r0, 2	# li
	slw	%r5, %r8, %r31
	add %r31, %r7, %r5
	stfs %f0, 0(%r31)
	b	beq_cont.25250
beq_else.25249:
	cmpwi	%cr7, %r6, 2
	bne	%cr7, beq_else.25259
	lwz	%r5, 16(%r2)
	lfs	%f0, 0(%r5)	# float
	fneg	%f0, %f0
	lwz	%r5, 64(%r3)
	stfs	%f0, 0(%r5)	# float
	lwz	%r6, 16(%r2)
	lfs	%f0, 4(%r6)	# float
	fneg	%f0, %f0
	stfs	%f0, 4(%r5)	# float
	lwz	%r6, 16(%r2)
	lfs	%f0, 8(%r6)	# float
	fneg	%f0, %f0
	stfs	%f0, 8(%r5)	# float
	b	beq_cont.25260
beq_else.25259:
	lwz	%r29, 60(%r3)
	mflr	%r31	
	stw	%r31, 104(%r3)
	addi	%r3, %r3, 108
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -108	# subi
	lwz	%r31, 104(%r3)
	mtlr	%r31	
beq_cont.25260:
beq_cont.25250:
	lwz	%r2, 100(%r3)
	lwz	%r5, 52(%r3)
	lwz	%r29, 56(%r3)
	mflr	%r31	
	stw	%r31, 104(%r3)
	addi	%r3, %r3, 108
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -108	# subi
	lwz	%r31, 104(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 0	# li
	lwz	%r5, 48(%r3)
	lwz	%r5, 0(%r5)
	lwz	%r29, 44(%r3)
	mflr	%r31	
	stw	%r31, 104(%r3)
	addi	%r3, %r3, 108
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -108	# subi
	lwz	%r31, 104(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25261
	lwz	%r2, 64(%r3)
	lfs	%f0, 0(%r2)	# float
	lwz	%r5, 40(%r3)
	lfs	%f1, 0(%r5)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 4(%r2)	# float
	lfs	%f2, 4(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r2)	# float
	lfs	%f2, 8(%r5)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	fneg	%f0, %f0
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25263
	addi	%r2, %r0, 0	# li
	b	ble_cont.25264
ble_else.25263:
	addi	%r2, %r0, 1	# li
ble_cont.25264:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25265
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	b	beq_cont.25266
beq_else.25265:
beq_cont.25266:
	lfs	%f1, 88(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 100(%r3)
	lwz	%r2, 28(%r2)
	lfs	%f1, 0(%r2)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 28(%r3)
	lfs	%f1, 0(%r2)	# float
	lwz	%r5, 24(%r3)
	lfs	%f2, 0(%r5)	# float
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	stfs	%f1, 0(%r2)	# float
	lfs	%f1, 4(%r2)	# float
	lfs	%f2, 4(%r5)	# float
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	stfs	%f1, 4(%r2)	# float
	lfs	%f1, 8(%r2)	# float
	lfs	%f2, 8(%r5)	# float
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	stfs	%f0, 8(%r2)	# float
	b	beq_cont.25262
beq_else.25261:
beq_cont.25262:
beq_cont.25248:
beq_cont.25226:
	lwz	%r2, 20(%r3)
	addi	%r2, %r2, -2	# subi %r2, %r2, 2
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25267
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 16(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r5, 0(%r5)
	lfs	%f0, 0(%r5)	# float
	lwz	%r7, 12(%r3)
	lfs	%f1, 0(%r7)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 4(%r5)	# float
	lfs	%f2, 4(%r7)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r5)	# float
	lfs	%f2, 8(%r7)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25268
	addi	%r5, %r0, 0	# li
	b	ble_cont.25269
ble_else.25268:
	addi	%r5, %r0, 1	# li
ble_cont.25269:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25270
	addi	%r5, %r0, 1	# li
	b	beq_cont.25271
beq_else.25270:
	addi	%r5, %r0, 0	# li
beq_cont.25271:
	stw	%r2, 104(%r3)
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25272
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addis	%r31, %r0, (l.19050)@h	# lis
	ori	%r31, %r31, (l.19050)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r29, 8(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtlr	%r31	
	b	beq_cont.25273
beq_else.25272:
	addi	%r5, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addis	%r31, %r0, (l.19017)@h	# lis
	ori	%r31, %r31, (l.19017)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r29, 8(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtlr	%r31	
beq_cont.25273:
	lwz	%r2, 104(%r3)
	addi	%r7, %r2, -2	# subi %r7, %r2, 2
	lwz	%r2, 16(%r3)
	lwz	%r5, 12(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 4(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
bge_else.25267:
	blr
bge_else.25220:
	blr
trace_diffuse_ray_80percent.3241:
	lwz	%r7, 20(%r29)
	lwz	%r8, 16(%r29)
	lwz	%r9, 12(%r29)
	lwz	%r10, 8(%r29)
	lwz	%r11, 4(%r29)
	stw	%r5, 0(%r3)
	stw	%r10, 4(%r3)
	stw	%r8, 8(%r3)
	stw	%r9, 12(%r3)
	stw	%r7, 16(%r3)
	stw	%r6, 20(%r3)
	stw	%r11, 24(%r3)
	stw	%r2, 28(%r3)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25276
	b	beq_cont.25277
beq_else.25276:
	lwz	%r12, 0(%r11)
	lfs	%f0, 0(%r6)	# float
	stfs	%f0, 0(%r7)	# float
	lfs	%f0, 4(%r6)	# float
	stfs	%f0, 4(%r7)	# float
	lfs	%f0, 8(%r6)	# float
	stfs	%f0, 8(%r7)	# float
	lwz	%r13, 0(%r9)
	addi	%r13, %r13, -1	# subi %r13, %r13, 1
	stw	%r12, 32(%r3)
	mflr	%r31	
	or	%r5, %r13, %r13	# mr %r5, %r13
	or	%r2, %r6, %r6	# mr %r2, %r6
	or	%r29, %r8, %r8	# mr %r29, %r8
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	addi	%r7, %r0, 118	# li
	lwz	%r2, 32(%r3)
	lwz	%r5, 0(%r3)
	lwz	%r6, 20(%r3)
	lwz	%r29, 4(%r3)
	mflr	%r31	
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
beq_cont.25277:
	lwz	%r2, 28(%r3)
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.25278
	b	beq_cont.25279
beq_else.25278:
	lwz	%r5, 24(%r3)
	lwz	%r6, 4(%r5)
	lwz	%r7, 20(%r3)
	lfs	%f0, 0(%r7)	# float
	lwz	%r8, 16(%r3)
	stfs	%f0, 0(%r8)	# float
	lfs	%f0, 4(%r7)	# float
	stfs	%f0, 4(%r8)	# float
	lfs	%f0, 8(%r7)	# float
	stfs	%f0, 8(%r8)	# float
	lwz	%r9, 12(%r3)
	lwz	%r10, 0(%r9)
	addi	%r10, %r10, -1	# subi %r10, %r10, 1
	lwz	%r29, 8(%r3)
	stw	%r6, 36(%r3)
	mflr	%r31	
	or	%r5, %r10, %r10	# mr %r5, %r10
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
	addi	%r7, %r0, 118	# li
	lwz	%r2, 36(%r3)
	lwz	%r5, 0(%r3)
	lwz	%r6, 20(%r3)
	lwz	%r29, 4(%r3)
	mflr	%r31	
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
beq_cont.25279:
	lwz	%r2, 28(%r3)
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.25280
	b	beq_cont.25281
beq_else.25280:
	lwz	%r5, 24(%r3)
	lwz	%r6, 8(%r5)
	lwz	%r7, 20(%r3)
	lfs	%f0, 0(%r7)	# float
	lwz	%r8, 16(%r3)
	stfs	%f0, 0(%r8)	# float
	lfs	%f0, 4(%r7)	# float
	stfs	%f0, 4(%r8)	# float
	lfs	%f0, 8(%r7)	# float
	stfs	%f0, 8(%r8)	# float
	lwz	%r9, 12(%r3)
	lwz	%r10, 0(%r9)
	addi	%r10, %r10, -1	# subi %r10, %r10, 1
	lwz	%r29, 8(%r3)
	stw	%r6, 40(%r3)
	mflr	%r31	
	or	%r5, %r10, %r10	# mr %r5, %r10
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	addi	%r7, %r0, 118	# li
	lwz	%r2, 40(%r3)
	lwz	%r5, 0(%r3)
	lwz	%r6, 20(%r3)
	lwz	%r29, 4(%r3)
	mflr	%r31	
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
beq_cont.25281:
	lwz	%r2, 28(%r3)
	cmpwi	%cr7, %r2, 3
	bne	%cr7, beq_else.25282
	b	beq_cont.25283
beq_else.25282:
	lwz	%r5, 24(%r3)
	lwz	%r6, 12(%r5)
	lwz	%r7, 20(%r3)
	lfs	%f0, 0(%r7)	# float
	lwz	%r8, 16(%r3)
	stfs	%f0, 0(%r8)	# float
	lfs	%f0, 4(%r7)	# float
	stfs	%f0, 4(%r8)	# float
	lfs	%f0, 8(%r7)	# float
	stfs	%f0, 8(%r8)	# float
	lwz	%r9, 12(%r3)
	lwz	%r10, 0(%r9)
	addi	%r10, %r10, -1	# subi %r10, %r10, 1
	lwz	%r29, 8(%r3)
	stw	%r6, 44(%r3)
	mflr	%r31	
	or	%r5, %r10, %r10	# mr %r5, %r10
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
	addi	%r7, %r0, 118	# li
	lwz	%r2, 44(%r3)
	lwz	%r5, 0(%r3)
	lwz	%r6, 20(%r3)
	lwz	%r29, 4(%r3)
	mflr	%r31	
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
beq_cont.25283:
	lwz	%r2, 28(%r3)
	cmpwi	%cr7, %r2, 4
	bne	%cr7, beq_else.25284
	blr
beq_else.25284:
	lwz	%r2, 24(%r3)
	lwz	%r2, 16(%r2)
	lwz	%r5, 20(%r3)
	lfs	%f0, 0(%r5)	# float
	lwz	%r6, 16(%r3)
	stfs	%f0, 0(%r6)	# float
	lfs	%f0, 4(%r5)	# float
	stfs	%f0, 4(%r6)	# float
	lfs	%f0, 8(%r5)	# float
	stfs	%f0, 8(%r6)	# float
	lwz	%r6, 12(%r3)
	lwz	%r6, 0(%r6)
	addi	%r6, %r6, -1	# subi %r6, %r6, 1
	lwz	%r29, 8(%r3)
	stw	%r2, 48(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
	addi	%r7, %r0, 118	# li
	lwz	%r2, 48(%r3)
	lwz	%r5, 0(%r3)
	lwz	%r6, 20(%r3)
	lwz	%r29, 4(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
calc_diffuse_using_1point.3245:
	lwz	%r6, 32(%r29)
	lwz	%r7, 28(%r29)
	lwz	%r8, 24(%r29)
	lwz	%r9, 20(%r29)
	lwz	%r10, 16(%r29)
	lwz	%r11, 12(%r29)
	lwz	%r12, 8(%r29)
	lwz	%r13, 4(%r29)
	lwz	%r14, 20(%r2)
	lwz	%r15, 28(%r2)
	lwz	%r16, 4(%r2)
	lwz	%r17, 16(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r18, %r5, %r31
	add %r31, %r14, %r18
	lwz %r14, 0(%r31)
	lfs	%f0, 0(%r14)	# float
	stfs	%f0, 0(%r13)	# float
	lfs	%f0, 4(%r14)	# float
	stfs	%f0, 4(%r13)	# float
	lfs	%f0, 8(%r14)	# float
	stfs	%f0, 8(%r13)	# float
	lwz	%r2, 24(%r2)
	lwz	%r2, 0(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r14, %r5, %r31
	add %r31, %r15, %r14
	lwz %r14, 0(%r31)
	addi	%r31, %r0, 2	# li
	slw	%r15, %r5, %r31
	add %r31, %r16, %r15
	lwz %r15, 0(%r31)
	stw	%r13, 0(%r3)
	stw	%r9, 4(%r3)
	stw	%r17, 8(%r3)
	stw	%r5, 12(%r3)
	stw	%r11, 16(%r3)
	stw	%r6, 20(%r3)
	stw	%r14, 24(%r3)
	stw	%r8, 28(%r3)
	stw	%r10, 32(%r3)
	stw	%r7, 36(%r3)
	stw	%r15, 40(%r3)
	stw	%r12, 44(%r3)
	stw	%r2, 48(%r3)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25286
	b	beq_cont.25287
beq_else.25286:
	lwz	%r16, 0(%r12)
	lfs	%f0, 0(%r15)	# float
	stfs	%f0, 0(%r7)	# float
	lfs	%f0, 4(%r15)	# float
	stfs	%f0, 4(%r7)	# float
	lfs	%f0, 8(%r15)	# float
	stfs	%f0, 8(%r7)	# float
	lwz	%r18, 0(%r10)
	addi	%r18, %r18, -1	# subi %r18, %r18, 1
	stw	%r16, 52(%r3)
	mflr	%r31	
	or	%r5, %r18, %r18	# mr %r5, %r18
	or	%r2, %r15, %r15	# mr %r2, %r15
	or	%r29, %r8, %r8	# mr %r29, %r8
	stw	%r31, 56(%r3)
	addi	%r3, %r3, 60
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -60	# subi
	lwz	%r31, 56(%r3)
	mtlr	%r31	
	lwz	%r2, 52(%r3)
	lwz	%r5, 472(%r2)
	lwz	%r5, 0(%r5)
	lfs	%f0, 0(%r5)	# float
	lwz	%r6, 24(%r3)
	lfs	%f1, 0(%r6)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 4(%r5)	# float
	lfs	%f2, 4(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r5)	# float
	lfs	%f2, 8(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25288
	addi	%r5, %r0, 0	# li
	b	ble_cont.25289
ble_else.25288:
	addi	%r5, %r0, 1	# li
ble_cont.25289:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25290
	addi	%r5, %r0, 1	# li
	b	beq_cont.25291
beq_else.25290:
	addi	%r5, %r0, 0	# li
beq_cont.25291:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25292
	lwz	%r5, 472(%r2)
	addis	%r31, %r0, (l.19050)@h	# lis
	ori	%r31, %r31, (l.19050)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r29, 20(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 56(%r3)
	addi	%r3, %r3, 60
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -60	# subi
	lwz	%r31, 56(%r3)
	mtlr	%r31	
	b	beq_cont.25293
beq_else.25292:
	lwz	%r5, 476(%r2)
	addis	%r31, %r0, (l.19017)@h	# lis
	ori	%r31, %r31, (l.19017)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r29, 20(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 56(%r3)
	addi	%r3, %r3, 60
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -60	# subi
	lwz	%r31, 56(%r3)
	mtlr	%r31	
beq_cont.25293:
	addi	%r7, %r0, 116	# li
	lwz	%r2, 52(%r3)
	lwz	%r5, 24(%r3)
	lwz	%r6, 40(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 56(%r3)
	addi	%r3, %r3, 60
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -60	# subi
	lwz	%r31, 56(%r3)
	mtlr	%r31	
beq_cont.25287:
	lwz	%r2, 48(%r3)
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.25294
	b	beq_cont.25295
beq_else.25294:
	lwz	%r5, 44(%r3)
	lwz	%r6, 4(%r5)
	lwz	%r7, 40(%r3)
	lfs	%f0, 0(%r7)	# float
	lwz	%r8, 36(%r3)
	stfs	%f0, 0(%r8)	# float
	lfs	%f0, 4(%r7)	# float
	stfs	%f0, 4(%r8)	# float
	lfs	%f0, 8(%r7)	# float
	stfs	%f0, 8(%r8)	# float
	lwz	%r9, 32(%r3)
	lwz	%r10, 0(%r9)
	addi	%r10, %r10, -1	# subi %r10, %r10, 1
	lwz	%r29, 28(%r3)
	stw	%r6, 56(%r3)
	mflr	%r31	
	or	%r5, %r10, %r10	# mr %r5, %r10
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtlr	%r31	
	lwz	%r2, 56(%r3)
	lwz	%r5, 472(%r2)
	lwz	%r5, 0(%r5)
	lfs	%f0, 0(%r5)	# float
	lwz	%r6, 24(%r3)
	lfs	%f1, 0(%r6)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 4(%r5)	# float
	lfs	%f2, 4(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r5)	# float
	lfs	%f2, 8(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25296
	addi	%r5, %r0, 0	# li
	b	ble_cont.25297
ble_else.25296:
	addi	%r5, %r0, 1	# li
ble_cont.25297:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25298
	addi	%r5, %r0, 1	# li
	b	beq_cont.25299
beq_else.25298:
	addi	%r5, %r0, 0	# li
beq_cont.25299:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25300
	lwz	%r5, 472(%r2)
	addis	%r31, %r0, (l.19050)@h	# lis
	ori	%r31, %r31, (l.19050)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r29, 20(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtlr	%r31	
	b	beq_cont.25301
beq_else.25300:
	lwz	%r5, 476(%r2)
	addis	%r31, %r0, (l.19017)@h	# lis
	ori	%r31, %r31, (l.19017)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r29, 20(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtlr	%r31	
beq_cont.25301:
	addi	%r7, %r0, 116	# li
	lwz	%r2, 56(%r3)
	lwz	%r5, 24(%r3)
	lwz	%r6, 40(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtlr	%r31	
beq_cont.25295:
	lwz	%r2, 48(%r3)
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.25302
	b	beq_cont.25303
beq_else.25302:
	lwz	%r5, 44(%r3)
	lwz	%r6, 8(%r5)
	lwz	%r7, 40(%r3)
	lfs	%f0, 0(%r7)	# float
	lwz	%r8, 36(%r3)
	stfs	%f0, 0(%r8)	# float
	lfs	%f0, 4(%r7)	# float
	stfs	%f0, 4(%r8)	# float
	lfs	%f0, 8(%r7)	# float
	stfs	%f0, 8(%r8)	# float
	lwz	%r9, 32(%r3)
	lwz	%r10, 0(%r9)
	addi	%r10, %r10, -1	# subi %r10, %r10, 1
	lwz	%r29, 28(%r3)
	stw	%r6, 60(%r3)
	mflr	%r31	
	or	%r5, %r10, %r10	# mr %r5, %r10
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 64(%r3)
	addi	%r3, %r3, 68
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -68	# subi
	lwz	%r31, 64(%r3)
	mtlr	%r31	
	lwz	%r2, 60(%r3)
	lwz	%r5, 472(%r2)
	lwz	%r5, 0(%r5)
	lfs	%f0, 0(%r5)	# float
	lwz	%r6, 24(%r3)
	lfs	%f1, 0(%r6)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 4(%r5)	# float
	lfs	%f2, 4(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r5)	# float
	lfs	%f2, 8(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25304
	addi	%r5, %r0, 0	# li
	b	ble_cont.25305
ble_else.25304:
	addi	%r5, %r0, 1	# li
ble_cont.25305:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25306
	addi	%r5, %r0, 1	# li
	b	beq_cont.25307
beq_else.25306:
	addi	%r5, %r0, 0	# li
beq_cont.25307:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25308
	lwz	%r5, 472(%r2)
	addis	%r31, %r0, (l.19050)@h	# lis
	ori	%r31, %r31, (l.19050)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r29, 20(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 64(%r3)
	addi	%r3, %r3, 68
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -68	# subi
	lwz	%r31, 64(%r3)
	mtlr	%r31	
	b	beq_cont.25309
beq_else.25308:
	lwz	%r5, 476(%r2)
	addis	%r31, %r0, (l.19017)@h	# lis
	ori	%r31, %r31, (l.19017)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r29, 20(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 64(%r3)
	addi	%r3, %r3, 68
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -68	# subi
	lwz	%r31, 64(%r3)
	mtlr	%r31	
beq_cont.25309:
	addi	%r7, %r0, 116	# li
	lwz	%r2, 60(%r3)
	lwz	%r5, 24(%r3)
	lwz	%r6, 40(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 64(%r3)
	addi	%r3, %r3, 68
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -68	# subi
	lwz	%r31, 64(%r3)
	mtlr	%r31	
beq_cont.25303:
	lwz	%r2, 48(%r3)
	cmpwi	%cr7, %r2, 3
	bne	%cr7, beq_else.25310
	b	beq_cont.25311
beq_else.25310:
	lwz	%r5, 44(%r3)
	lwz	%r6, 12(%r5)
	lwz	%r7, 40(%r3)
	lfs	%f0, 0(%r7)	# float
	lwz	%r8, 36(%r3)
	stfs	%f0, 0(%r8)	# float
	lfs	%f0, 4(%r7)	# float
	stfs	%f0, 4(%r8)	# float
	lfs	%f0, 8(%r7)	# float
	stfs	%f0, 8(%r8)	# float
	lwz	%r9, 32(%r3)
	lwz	%r10, 0(%r9)
	addi	%r10, %r10, -1	# subi %r10, %r10, 1
	lwz	%r29, 28(%r3)
	stw	%r6, 64(%r3)
	mflr	%r31	
	or	%r5, %r10, %r10	# mr %r5, %r10
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtlr	%r31	
	lwz	%r2, 64(%r3)
	lwz	%r5, 472(%r2)
	lwz	%r5, 0(%r5)
	lfs	%f0, 0(%r5)	# float
	lwz	%r6, 24(%r3)
	lfs	%f1, 0(%r6)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 4(%r5)	# float
	lfs	%f2, 4(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r5)	# float
	lfs	%f2, 8(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25312
	addi	%r5, %r0, 0	# li
	b	ble_cont.25313
ble_else.25312:
	addi	%r5, %r0, 1	# li
ble_cont.25313:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25314
	addi	%r5, %r0, 1	# li
	b	beq_cont.25315
beq_else.25314:
	addi	%r5, %r0, 0	# li
beq_cont.25315:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25316
	lwz	%r5, 472(%r2)
	addis	%r31, %r0, (l.19050)@h	# lis
	ori	%r31, %r31, (l.19050)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r29, 20(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtlr	%r31	
	b	beq_cont.25317
beq_else.25316:
	lwz	%r5, 476(%r2)
	addis	%r31, %r0, (l.19017)@h	# lis
	ori	%r31, %r31, (l.19017)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r29, 20(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtlr	%r31	
beq_cont.25317:
	addi	%r7, %r0, 116	# li
	lwz	%r2, 64(%r3)
	lwz	%r5, 24(%r3)
	lwz	%r6, 40(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtlr	%r31	
beq_cont.25311:
	lwz	%r2, 48(%r3)
	cmpwi	%cr7, %r2, 4
	bne	%cr7, beq_else.25318
	b	beq_cont.25319
beq_else.25318:
	lwz	%r2, 44(%r3)
	lwz	%r2, 16(%r2)
	lwz	%r5, 40(%r3)
	lfs	%f0, 0(%r5)	# float
	lwz	%r6, 36(%r3)
	stfs	%f0, 0(%r6)	# float
	lfs	%f0, 4(%r5)	# float
	stfs	%f0, 4(%r6)	# float
	lfs	%f0, 8(%r5)	# float
	stfs	%f0, 8(%r6)	# float
	lwz	%r6, 32(%r3)
	lwz	%r6, 0(%r6)
	addi	%r6, %r6, -1	# subi %r6, %r6, 1
	lwz	%r29, 28(%r3)
	stw	%r2, 68(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 72(%r3)
	addi	%r3, %r3, 76
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -76	# subi
	lwz	%r31, 72(%r3)
	mtlr	%r31	
	lwz	%r2, 68(%r3)
	lwz	%r5, 472(%r2)
	lwz	%r5, 0(%r5)
	lfs	%f0, 0(%r5)	# float
	lwz	%r6, 24(%r3)
	lfs	%f1, 0(%r6)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 4(%r5)	# float
	lfs	%f2, 4(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r5)	# float
	lfs	%f2, 8(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25320
	addi	%r5, %r0, 0	# li
	b	ble_cont.25321
ble_else.25320:
	addi	%r5, %r0, 1	# li
ble_cont.25321:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25322
	addi	%r5, %r0, 1	# li
	b	beq_cont.25323
beq_else.25322:
	addi	%r5, %r0, 0	# li
beq_cont.25323:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25324
	lwz	%r5, 472(%r2)
	addis	%r31, %r0, (l.19050)@h	# lis
	ori	%r31, %r31, (l.19050)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r29, 20(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 72(%r3)
	addi	%r3, %r3, 76
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -76	# subi
	lwz	%r31, 72(%r3)
	mtlr	%r31	
	b	beq_cont.25325
beq_else.25324:
	lwz	%r5, 476(%r2)
	addis	%r31, %r0, (l.19017)@h	# lis
	ori	%r31, %r31, (l.19017)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r29, 20(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 72(%r3)
	addi	%r3, %r3, 76
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -76	# subi
	lwz	%r31, 72(%r3)
	mtlr	%r31	
beq_cont.25325:
	addi	%r7, %r0, 116	# li
	lwz	%r2, 68(%r3)
	lwz	%r5, 24(%r3)
	lwz	%r6, 40(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 72(%r3)
	addi	%r3, %r3, 76
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -76	# subi
	lwz	%r31, 72(%r3)
	mtlr	%r31	
beq_cont.25319:
	lwz	%r2, 12(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	lwz	%r5, 8(%r3)
	add %r31, %r5, %r2
	lwz %r2, 0(%r31)
	lwz	%r5, 4(%r3)
	lfs	%f0, 0(%r5)	# float
	lfs	%f1, 0(%r2)	# float
	lwz	%r6, 0(%r3)
	lfs	%f2, 0(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 0(%r5)	# float
	lfs	%f0, 4(%r5)	# float
	lfs	%f1, 4(%r2)	# float
	lfs	%f2, 4(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 4(%r5)	# float
	lfs	%f0, 8(%r5)	# float
	lfs	%f1, 8(%r2)	# float
	lfs	%f2, 8(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 8(%r5)	# float
	blr
calc_diffuse_using_5points.3248:
	lwz	%r9, 8(%r29)
	lwz	%r10, 4(%r29)
	addi	%r31, %r0, 2	# li
	slw	%r11, %r2, %r31
	add %r31, %r5, %r11
	lwz %r5, 0(%r31)
	lwz	%r5, 20(%r5)
	addi	%r11, %r2, -1	# subi %r11, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r11, %r11, %r31
	add %r31, %r6, %r11
	lwz %r11, 0(%r31)
	lwz	%r11, 20(%r11)
	addi	%r31, %r0, 2	# li
	slw	%r12, %r2, %r31
	add %r31, %r6, %r12
	lwz %r12, 0(%r31)
	lwz	%r12, 20(%r12)
	addi	%r13, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r13, %r13, %r31
	add %r31, %r6, %r13
	lwz %r13, 0(%r31)
	lwz	%r13, 20(%r13)
	addi	%r31, %r0, 2	# li
	slw	%r14, %r2, %r31
	add %r31, %r7, %r14
	lwz %r7, 0(%r31)
	lwz	%r7, 20(%r7)
	addi	%r31, %r0, 2	# li
	slw	%r14, %r8, %r31
	add %r31, %r5, %r14
	lwz %r5, 0(%r31)
	lfs	%f0, 0(%r5)	# float
	stfs	%f0, 0(%r10)	# float
	lfs	%f0, 4(%r5)	# float
	stfs	%f0, 4(%r10)	# float
	lfs	%f0, 8(%r5)	# float
	stfs	%f0, 8(%r10)	# float
	addi	%r31, %r0, 2	# li
	slw	%r5, %r8, %r31
	add %r31, %r11, %r5
	lwz %r5, 0(%r31)
	lfs	%f0, 0(%r10)	# float
	lfs	%f1, 0(%r5)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 0(%r10)	# float
	lfs	%f0, 4(%r10)	# float
	lfs	%f1, 4(%r5)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 4(%r10)	# float
	lfs	%f0, 8(%r10)	# float
	lfs	%f1, 8(%r5)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 8(%r10)	# float
	addi	%r31, %r0, 2	# li
	slw	%r5, %r8, %r31
	add %r31, %r12, %r5
	lwz %r5, 0(%r31)
	lfs	%f0, 0(%r10)	# float
	lfs	%f1, 0(%r5)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 0(%r10)	# float
	lfs	%f0, 4(%r10)	# float
	lfs	%f1, 4(%r5)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 4(%r10)	# float
	lfs	%f0, 8(%r10)	# float
	lfs	%f1, 8(%r5)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 8(%r10)	# float
	addi	%r31, %r0, 2	# li
	slw	%r5, %r8, %r31
	add %r31, %r13, %r5
	lwz %r5, 0(%r31)
	lfs	%f0, 0(%r10)	# float
	lfs	%f1, 0(%r5)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 0(%r10)	# float
	lfs	%f0, 4(%r10)	# float
	lfs	%f1, 4(%r5)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 4(%r10)	# float
	lfs	%f0, 8(%r10)	# float
	lfs	%f1, 8(%r5)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 8(%r10)	# float
	addi	%r31, %r0, 2	# li
	slw	%r5, %r8, %r31
	add %r31, %r7, %r5
	lwz %r5, 0(%r31)
	lfs	%f0, 0(%r10)	# float
	lfs	%f1, 0(%r5)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 0(%r10)	# float
	lfs	%f0, 4(%r10)	# float
	lfs	%f1, 4(%r5)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 4(%r10)	# float
	lfs	%f0, 8(%r10)	# float
	lfs	%f1, 8(%r5)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 8(%r10)	# float
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	add %r31, %r6, %r2
	lwz %r2, 0(%r31)
	lwz	%r2, 16(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r5, %r8, %r31
	add %r31, %r2, %r5
	lwz %r2, 0(%r31)
	lfs	%f0, 0(%r9)	# float
	lfs	%f1, 0(%r2)	# float
	lfs	%f2, 0(%r10)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 0(%r9)	# float
	lfs	%f0, 4(%r9)	# float
	lfs	%f1, 4(%r2)	# float
	lfs	%f2, 4(%r10)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 4(%r9)	# float
	lfs	%f0, 8(%r9)	# float
	lfs	%f1, 8(%r2)	# float
	lfs	%f2, 8(%r10)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 8(%r9)	# float
	blr
do_without_neighbors.3254:
	lwz	%r6, 16(%r29)
	lwz	%r7, 12(%r29)
	lwz	%r8, 8(%r29)
	lwz	%r9, 4(%r29)
	cmpwi	%cr7, %r5, 4
	bgt	%cr7, ble_else.25328
	lwz	%r10, 8(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r11, %r5, %r31
	add %r31, %r10, %r11
	lwz %r10, 0(%r31)
	cmpwi	%cr7, %r10, 0
	blt	%cr7, bge_else.25329
	lwz	%r10, 12(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r11, %r5, %r31
	add %r31, %r10, %r11
	lwz %r10, 0(%r31)
	stw	%r29, 0(%r3)
	stw	%r9, 4(%r3)
	stw	%r2, 8(%r3)
	stw	%r5, 12(%r3)
	cmpwi	%cr7, %r10, 0
	bne	%cr7, beq_else.25330
	b	beq_cont.25331
beq_else.25330:
	lwz	%r10, 20(%r2)
	lwz	%r11, 28(%r2)
	lwz	%r12, 4(%r2)
	lwz	%r13, 16(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r14, %r5, %r31
	add %r31, %r10, %r14
	lwz %r10, 0(%r31)
	lfs	%f0, 0(%r10)	# float
	stfs	%f0, 0(%r8)	# float
	lfs	%f0, 4(%r10)	# float
	stfs	%f0, 4(%r8)	# float
	lfs	%f0, 8(%r10)	# float
	stfs	%f0, 8(%r8)	# float
	lwz	%r10, 24(%r2)
	lwz	%r10, 0(%r10)
	addi	%r31, %r0, 2	# li
	slw	%r14, %r5, %r31
	add %r31, %r11, %r14
	lwz %r11, 0(%r31)
	addi	%r31, %r0, 2	# li
	slw	%r14, %r5, %r31
	add %r31, %r12, %r14
	lwz %r12, 0(%r31)
	stw	%r8, 16(%r3)
	stw	%r7, 20(%r3)
	stw	%r13, 24(%r3)
	mflr	%r31	
	or	%r5, %r11, %r11	# mr %r5, %r11
	or	%r2, %r10, %r10	# mr %r2, %r10
	or	%r29, %r6, %r6	# mr %r29, %r6
	or	%r6, %r12, %r12	# mr %r6, %r12
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	lwz	%r2, 12(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 24(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r6, 20(%r3)
	lfs	%f0, 0(%r6)	# float
	lfs	%f1, 0(%r5)	# float
	lwz	%r7, 16(%r3)
	lfs	%f2, 0(%r7)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 0(%r6)	# float
	lfs	%f0, 4(%r6)	# float
	lfs	%f1, 4(%r5)	# float
	lfs	%f2, 4(%r7)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 4(%r6)	# float
	lfs	%f0, 8(%r6)	# float
	lfs	%f1, 8(%r5)	# float
	lfs	%f2, 8(%r7)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 8(%r6)	# float
beq_cont.25331:
	lwz	%r2, 12(%r3)
	addi	%r5, %r2, 1
	cmpwi	%cr7, %r5, 4
	bgt	%cr7, ble_else.25332
	lwz	%r2, 8(%r3)
	lwz	%r6, 8(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r7, %r5, %r31
	add %r31, %r6, %r7
	lwz %r6, 0(%r31)
	cmpwi	%cr7, %r6, 0
	blt	%cr7, bge_else.25333
	lwz	%r6, 12(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r7, %r5, %r31
	add %r31, %r6, %r7
	lwz %r6, 0(%r31)
	stw	%r5, 28(%r3)
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.25334
	b	beq_cont.25335
beq_else.25334:
	lwz	%r29, 4(%r3)
	mflr	%r31	
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
beq_cont.25335:
	lwz	%r2, 28(%r3)
	addi	%r5, %r2, 1
	lwz	%r2, 8(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
bge_else.25333:
	blr
ble_else.25332:
	blr
bge_else.25329:
	blr
ble_else.25328:
	blr
try_exploit_neighbors.3270:
	lwz	%r10, 20(%r29)
	lwz	%r11, 16(%r29)
	lwz	%r12, 12(%r29)
	lwz	%r13, 8(%r29)
	lwz	%r14, 4(%r29)
	addi	%r31, %r0, 2	# li
	slw	%r15, %r2, %r31
	add %r31, %r7, %r15
	lwz %r15, 0(%r31)
	cmpwi	%cr7, %r9, 4
	bgt	%cr7, ble_else.25340
	lwz	%r16, 8(%r15)
	addi	%r31, %r0, 2	# li
	slw	%r17, %r9, %r31
	add %r31, %r16, %r17
	lwz %r16, 0(%r31)
	cmpwi	%cr7, %r16, 0
	blt	%cr7, bge_else.25341
	addi	%r31, %r0, 2	# li
	slw	%r16, %r2, %r31
	add %r31, %r7, %r16
	lwz %r16, 0(%r31)
	lwz	%r16, 8(%r16)
	addi	%r31, %r0, 2	# li
	slw	%r17, %r9, %r31
	add %r31, %r16, %r17
	lwz %r16, 0(%r31)
	addi	%r31, %r0, 2	# li
	slw	%r17, %r2, %r31
	add %r31, %r6, %r17
	lwz %r17, 0(%r31)
	lwz	%r17, 8(%r17)
	addi	%r31, %r0, 2	# li
	slw	%r18, %r9, %r31
	add %r31, %r17, %r18
	lwz %r17, 0(%r31)
	cmp	%cr7, %r17, %r16
	bne	%cr7, beq_else.25342
	addi	%r31, %r0, 2	# li
	slw	%r17, %r2, %r31
	add %r31, %r8, %r17
	lwz %r17, 0(%r31)
	lwz	%r17, 8(%r17)
	addi	%r31, %r0, 2	# li
	slw	%r18, %r9, %r31
	add %r31, %r17, %r18
	lwz %r17, 0(%r31)
	cmp	%cr7, %r17, %r16
	bne	%cr7, beq_else.25344
	addi	%r17, %r2, -1	# subi %r17, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r17, %r17, %r31
	add %r31, %r7, %r17
	lwz %r17, 0(%r31)
	lwz	%r17, 8(%r17)
	addi	%r31, %r0, 2	# li
	slw	%r18, %r9, %r31
	add %r31, %r17, %r18
	lwz %r17, 0(%r31)
	cmp	%cr7, %r17, %r16
	bne	%cr7, beq_else.25346
	addi	%r17, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r17, %r17, %r31
	add %r31, %r7, %r17
	lwz %r17, 0(%r31)
	lwz	%r17, 8(%r17)
	addi	%r31, %r0, 2	# li
	slw	%r18, %r9, %r31
	add %r31, %r17, %r18
	lwz %r17, 0(%r31)
	cmp	%cr7, %r17, %r16
	bne	%cr7, beq_else.25348
	addi	%r16, %r0, 1	# li
	b	beq_cont.25349
beq_else.25348:
	addi	%r16, %r0, 0	# li
beq_cont.25349:
	b	beq_cont.25347
beq_else.25346:
	addi	%r16, %r0, 0	# li
beq_cont.25347:
	b	beq_cont.25345
beq_else.25344:
	addi	%r16, %r0, 0	# li
beq_cont.25345:
	b	beq_cont.25343
beq_else.25342:
	addi	%r16, %r0, 0	# li
beq_cont.25343:
	cmpwi	%cr7, %r16, 0
	bne	%cr7, beq_else.25350
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	add %r31, %r7, %r2
	lwz %r2, 0(%r31)
	cmpwi	%cr7, %r9, 4
	bgt	%cr7, ble_else.25351
	lwz	%r5, 8(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r9, %r31
	add %r31, %r5, %r6
	lwz %r5, 0(%r31)
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.25352
	lwz	%r5, 12(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r9, %r31
	add %r31, %r5, %r6
	lwz %r5, 0(%r31)
	stw	%r2, 0(%r3)
	stw	%r11, 4(%r3)
	stw	%r9, 8(%r3)
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25353
	b	beq_cont.25354
beq_else.25353:
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r29, %r14, %r14	# mr %r29, %r14
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtlr	%r31	
beq_cont.25354:
	lwz	%r2, 8(%r3)
	addi	%r5, %r2, 1
	lwz	%r2, 0(%r3)
	lwz	%r29, 4(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
bge_else.25352:
	blr
ble_else.25351:
	blr
beq_else.25350:
	lwz	%r14, 12(%r15)
	addi	%r31, %r0, 2	# li
	slw	%r15, %r9, %r31
	add %r31, %r14, %r15
	lwz %r14, 0(%r31)
	cmpwi	%cr7, %r14, 0
	bne	%cr7, beq_else.25357
	b	beq_cont.25358
beq_else.25357:
	addi	%r31, %r0, 2	# li
	slw	%r14, %r2, %r31
	add %r31, %r6, %r14
	lwz %r14, 0(%r31)
	lwz	%r14, 20(%r14)
	addi	%r15, %r2, -1	# subi %r15, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r15, %r15, %r31
	add %r31, %r7, %r15
	lwz %r15, 0(%r31)
	lwz	%r15, 20(%r15)
	addi	%r31, %r0, 2	# li
	slw	%r16, %r2, %r31
	add %r31, %r7, %r16
	lwz %r16, 0(%r31)
	lwz	%r16, 20(%r16)
	addi	%r17, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r17, %r17, %r31
	add %r31, %r7, %r17
	lwz %r17, 0(%r31)
	lwz	%r17, 20(%r17)
	addi	%r31, %r0, 2	# li
	slw	%r18, %r2, %r31
	add %r31, %r8, %r18
	lwz %r18, 0(%r31)
	lwz	%r18, 20(%r18)
	addi	%r31, %r0, 2	# li
	slw	%r19, %r9, %r31
	add %r31, %r14, %r19
	lwz %r14, 0(%r31)
	lfs	%f0, 0(%r14)	# float
	stfs	%f0, 0(%r12)	# float
	lfs	%f0, 4(%r14)	# float
	stfs	%f0, 4(%r12)	# float
	lfs	%f0, 8(%r14)	# float
	stfs	%f0, 8(%r12)	# float
	addi	%r31, %r0, 2	# li
	slw	%r14, %r9, %r31
	add %r31, %r15, %r14
	lwz %r14, 0(%r31)
	lfs	%f0, 0(%r12)	# float
	lfs	%f1, 0(%r14)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 0(%r12)	# float
	lfs	%f0, 4(%r12)	# float
	lfs	%f1, 4(%r14)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 4(%r12)	# float
	lfs	%f0, 8(%r12)	# float
	lfs	%f1, 8(%r14)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 8(%r12)	# float
	addi	%r31, %r0, 2	# li
	slw	%r14, %r9, %r31
	add %r31, %r16, %r14
	lwz %r14, 0(%r31)
	lfs	%f0, 0(%r12)	# float
	lfs	%f1, 0(%r14)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 0(%r12)	# float
	lfs	%f0, 4(%r12)	# float
	lfs	%f1, 4(%r14)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 4(%r12)	# float
	lfs	%f0, 8(%r12)	# float
	lfs	%f1, 8(%r14)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 8(%r12)	# float
	addi	%r31, %r0, 2	# li
	slw	%r14, %r9, %r31
	add %r31, %r17, %r14
	lwz %r14, 0(%r31)
	lfs	%f0, 0(%r12)	# float
	lfs	%f1, 0(%r14)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 0(%r12)	# float
	lfs	%f0, 4(%r12)	# float
	lfs	%f1, 4(%r14)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 4(%r12)	# float
	lfs	%f0, 8(%r12)	# float
	lfs	%f1, 8(%r14)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 8(%r12)	# float
	addi	%r31, %r0, 2	# li
	slw	%r14, %r9, %r31
	add %r31, %r18, %r14
	lwz %r14, 0(%r31)
	lfs	%f0, 0(%r12)	# float
	lfs	%f1, 0(%r14)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 0(%r12)	# float
	lfs	%f0, 4(%r12)	# float
	lfs	%f1, 4(%r14)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 4(%r12)	# float
	lfs	%f0, 8(%r12)	# float
	lfs	%f1, 8(%r14)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 8(%r12)	# float
	addi	%r31, %r0, 2	# li
	slw	%r14, %r2, %r31
	add %r31, %r7, %r14
	lwz %r14, 0(%r31)
	lwz	%r14, 16(%r14)
	addi	%r31, %r0, 2	# li
	slw	%r15, %r9, %r31
	add %r31, %r14, %r15
	lwz %r14, 0(%r31)
	lfs	%f0, 0(%r10)	# float
	lfs	%f1, 0(%r14)	# float
	lfs	%f2, 0(%r12)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 0(%r10)	# float
	lfs	%f0, 4(%r10)	# float
	lfs	%f1, 4(%r14)	# float
	lfs	%f2, 4(%r12)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 4(%r10)	# float
	lfs	%f0, 8(%r10)	# float
	lfs	%f1, 8(%r14)	# float
	lfs	%f2, 8(%r12)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfs	%f0, 8(%r10)	# float
beq_cont.25358:
	addi	%r9, %r9, 1
	addi	%r31, %r0, 2	# li
	slw	%r10, %r2, %r31
	add %r31, %r7, %r10
	lwz %r10, 0(%r31)
	cmpwi	%cr7, %r9, 4
	bgt	%cr7, ble_else.25359
	lwz	%r12, 8(%r10)
	addi	%r31, %r0, 2	# li
	slw	%r14, %r9, %r31
	add %r31, %r12, %r14
	lwz %r12, 0(%r31)
	cmpwi	%cr7, %r12, 0
	blt	%cr7, bge_else.25360
	addi	%r31, %r0, 2	# li
	slw	%r12, %r2, %r31
	add %r31, %r7, %r12
	lwz %r12, 0(%r31)
	lwz	%r12, 8(%r12)
	addi	%r31, %r0, 2	# li
	slw	%r14, %r9, %r31
	add %r31, %r12, %r14
	lwz %r12, 0(%r31)
	addi	%r31, %r0, 2	# li
	slw	%r14, %r2, %r31
	add %r31, %r6, %r14
	lwz %r14, 0(%r31)
	lwz	%r14, 8(%r14)
	addi	%r31, %r0, 2	# li
	slw	%r15, %r9, %r31
	add %r31, %r14, %r15
	lwz %r14, 0(%r31)
	cmp	%cr7, %r14, %r12
	bne	%cr7, beq_else.25361
	addi	%r31, %r0, 2	# li
	slw	%r14, %r2, %r31
	add %r31, %r8, %r14
	lwz %r14, 0(%r31)
	lwz	%r14, 8(%r14)
	addi	%r31, %r0, 2	# li
	slw	%r15, %r9, %r31
	add %r31, %r14, %r15
	lwz %r14, 0(%r31)
	cmp	%cr7, %r14, %r12
	bne	%cr7, beq_else.25363
	addi	%r14, %r2, -1	# subi %r14, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r14, %r14, %r31
	add %r31, %r7, %r14
	lwz %r14, 0(%r31)
	lwz	%r14, 8(%r14)
	addi	%r31, %r0, 2	# li
	slw	%r15, %r9, %r31
	add %r31, %r14, %r15
	lwz %r14, 0(%r31)
	cmp	%cr7, %r14, %r12
	bne	%cr7, beq_else.25365
	addi	%r14, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r14, %r14, %r31
	add %r31, %r7, %r14
	lwz %r14, 0(%r31)
	lwz	%r14, 8(%r14)
	addi	%r31, %r0, 2	# li
	slw	%r15, %r9, %r31
	add %r31, %r14, %r15
	lwz %r14, 0(%r31)
	cmp	%cr7, %r14, %r12
	bne	%cr7, beq_else.25367
	addi	%r12, %r0, 1	# li
	b	beq_cont.25368
beq_else.25367:
	addi	%r12, %r0, 0	# li
beq_cont.25368:
	b	beq_cont.25366
beq_else.25365:
	addi	%r12, %r0, 0	# li
beq_cont.25366:
	b	beq_cont.25364
beq_else.25363:
	addi	%r12, %r0, 0	# li
beq_cont.25364:
	b	beq_cont.25362
beq_else.25361:
	addi	%r12, %r0, 0	# li
beq_cont.25362:
	cmpwi	%cr7, %r12, 0
	bne	%cr7, beq_else.25369
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	add %r31, %r7, %r2
	lwz %r2, 0(%r31)
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r29, %r11, %r11	# mr %r29, %r11
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
beq_else.25369:
	lwz	%r10, 12(%r10)
	addi	%r31, %r0, 2	# li
	slw	%r11, %r9, %r31
	add %r31, %r10, %r11
	lwz %r10, 0(%r31)
	stw	%r8, 12(%r3)
	stw	%r7, 16(%r3)
	stw	%r6, 20(%r3)
	stw	%r5, 24(%r3)
	stw	%r2, 28(%r3)
	stw	%r29, 32(%r3)
	stw	%r9, 36(%r3)
	cmpwi	%cr7, %r10, 0
	bne	%cr7, beq_else.25370
	b	beq_cont.25371
beq_else.25370:
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r29, %r13, %r13	# mr %r29, %r13
	or	%r6, %r7, %r7	# mr %r6, %r7
	or	%r7, %r8, %r8	# mr %r7, %r8
	or	%r8, %r9, %r9	# mr %r8, %r9
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
beq_cont.25371:
	lwz	%r2, 36(%r3)
	addi	%r9, %r2, 1
	lwz	%r2, 28(%r3)
	lwz	%r5, 24(%r3)
	lwz	%r6, 20(%r3)
	lwz	%r7, 16(%r3)
	lwz	%r8, 12(%r3)
	lwz	%r29, 32(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
bge_else.25360:
	blr
ble_else.25359:
	blr
bge_else.25341:
	blr
ble_else.25340:
	blr
write_rgb_element.3279:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.25376
	addi	%r2, %r0, 0	# li
	b	beq_cont.25377
beq_else.25376:
	stfs	%f0, 0(%r3)	# float
	lwz	%r2, 0(%r3)
	addi	%r31, %r0, 23	# lis
	srw	%r5, %r2, %r31
	andi.	%r5, %r5, 255
	addi	%r5, %r5, -127	# subi %r5, %r5, 127
	addis	%r6, %r0, 128	# lis
	ori	%r6, %r6, 0
	or	%r2, %r2, %r6
	addis	%r6, %r0, 255	# lis
	ori	%r6, %r6, 65535
	and	%r2, %r2, %r6
	addi	%r6, %r0, 23	# li
	subf	%r5, %r5, %r6	# sub	%r5, %r6, %r5
	cmpwi	%cr7, %r5, 32
	blt	%cr7, bge_else.25378
	addi	%r2, %r0, 0	# li
	b	bge_cont.25379
bge_else.25378:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.25380
	srw	%r2, %r2, %r5
	b	bge_cont.25381
bge_else.25380:
	neg	%r5, %r5
	slw	%r2, %r2, %r5
bge_cont.25381:
bge_cont.25379:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25382
	b	ble_cont.25383
ble_else.25382:
	neg	%r2, %r2
ble_cont.25383:
beq_cont.25377:
	cmpwi	%cr7, %r2, 255	
	bgt	%cr7, ble_else.25384
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25386
	b	bge_cont.25387
bge_else.25386:
	addi	%r2, %r0, 0	# li
bge_cont.25387:
	b	ble_cont.25385
ble_else.25384:
	addi	%r2, %r0, 255	# li
ble_cont.25385:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25388
	b	print_int_sub.2801
bge_else.25388:
	addi	%r5, %r0, 45	# li
out.25389:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.25389
	addi	%r31, %r0, 24	# lis
	slw	%r5, %r5, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
	neg	%r2, %r2
	b	print_int_sub.2801
write_rgb.3281:
	lwz	%r2, 4(%r29)
	lfs	%f0, 0(%r2)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.25390
	addi	%r5, %r0, 0	# li
	b	beq_cont.25391
beq_else.25390:
	stfs	%f0, 0(%r3)	# float
	lwz	%r5, 0(%r3)
	addi	%r31, %r0, 23	# lis
	srw	%r6, %r5, %r31
	andi.	%r6, %r6, 255
	addi	%r6, %r6, -127	# subi %r6, %r6, 127
	addis	%r7, %r0, 128	# lis
	ori	%r7, %r7, 0
	or	%r5, %r5, %r7
	addis	%r7, %r0, 255	# lis
	ori	%r7, %r7, 65535
	and	%r5, %r5, %r7
	addi	%r7, %r0, 23	# li
	subf	%r6, %r6, %r7	# sub	%r6, %r7, %r6
	cmpwi	%cr7, %r6, 32
	blt	%cr7, bge_else.25392
	addi	%r5, %r0, 0	# li
	b	bge_cont.25393
bge_else.25392:
	cmpwi	%cr7, %r6, 0
	blt	%cr7, bge_else.25394
	srw	%r5, %r5, %r6
	b	bge_cont.25395
bge_else.25394:
	neg	%r6, %r6
	slw	%r5, %r5, %r6
bge_cont.25395:
bge_cont.25393:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25396
	b	ble_cont.25397
ble_else.25396:
	neg	%r5, %r5
ble_cont.25397:
beq_cont.25391:
	cmpwi	%cr7, %r5, 255	
	bgt	%cr7, ble_else.25398
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.25400
	b	bge_cont.25401
bge_else.25400:
	addi	%r5, %r0, 0	# li
bge_cont.25401:
	b	ble_cont.25399
ble_else.25398:
	addi	%r5, %r0, 255	# li
ble_cont.25399:
	stw	%r2, 0(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int.2803
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 32	# li
out.25402:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.25402
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	lwz	%r2, 0(%r3)
	lfs	%f0, 4(%r2)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.25403
	addi	%r5, %r0, 0	# li
	b	beq_cont.25404
beq_else.25403:
	stfs	%f0, 4(%r3)	# float
	lwz	%r5, 4(%r3)
	addi	%r31, %r0, 23	# lis
	srw	%r6, %r5, %r31
	andi.	%r6, %r6, 255
	addi	%r6, %r6, -127	# subi %r6, %r6, 127
	addis	%r7, %r0, 128	# lis
	ori	%r7, %r7, 0
	or	%r5, %r5, %r7
	addis	%r7, %r0, 255	# lis
	ori	%r7, %r7, 65535
	and	%r5, %r5, %r7
	addi	%r7, %r0, 23	# li
	subf	%r6, %r6, %r7	# sub	%r6, %r7, %r6
	cmpwi	%cr7, %r6, 32
	blt	%cr7, bge_else.25405
	addi	%r5, %r0, 0	# li
	b	bge_cont.25406
bge_else.25405:
	cmpwi	%cr7, %r6, 0
	blt	%cr7, bge_else.25407
	srw	%r5, %r5, %r6
	b	bge_cont.25408
bge_else.25407:
	neg	%r6, %r6
	slw	%r5, %r5, %r6
bge_cont.25408:
bge_cont.25406:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25409
	b	ble_cont.25410
ble_else.25409:
	neg	%r5, %r5
ble_cont.25410:
beq_cont.25404:
	cmpwi	%cr7, %r5, 255	
	bgt	%cr7, ble_else.25411
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.25413
	b	bge_cont.25414
bge_else.25413:
	addi	%r5, %r0, 0	# li
bge_cont.25414:
	b	ble_cont.25412
ble_else.25411:
	addi	%r5, %r0, 255	# li
ble_cont.25412:
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int.2803
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 32	# li
out.25415:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.25415
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	lwz	%r2, 0(%r3)
	lfs	%f0, 8(%r2)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.25416
	addi	%r2, %r0, 0	# li
	b	beq_cont.25417
beq_else.25416:
	stfs	%f0, 4(%r3)	# float
	lwz	%r2, 4(%r3)
	addi	%r31, %r0, 23	# lis
	srw	%r5, %r2, %r31
	andi.	%r5, %r5, 255
	addi	%r5, %r5, -127	# subi %r5, %r5, 127
	addis	%r6, %r0, 128	# lis
	ori	%r6, %r6, 0
	or	%r2, %r2, %r6
	addis	%r6, %r0, 255	# lis
	ori	%r6, %r6, 65535
	and	%r2, %r2, %r6
	addi	%r6, %r0, 23	# li
	subf	%r5, %r5, %r6	# sub	%r5, %r6, %r5
	cmpwi	%cr7, %r5, 32
	blt	%cr7, bge_else.25418
	addi	%r2, %r0, 0	# li
	b	bge_cont.25419
bge_else.25418:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.25420
	srw	%r2, %r2, %r5
	b	bge_cont.25421
bge_else.25420:
	neg	%r5, %r5
	slw	%r2, %r2, %r5
bge_cont.25421:
bge_cont.25419:
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25422
	b	ble_cont.25423
ble_else.25422:
	neg	%r2, %r2
ble_cont.25423:
beq_cont.25417:
	cmpwi	%cr7, %r2, 255	
	bgt	%cr7, ble_else.25424
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25426
	b	bge_cont.25427
bge_else.25426:
	addi	%r2, %r0, 0	# li
bge_cont.25427:
	b	ble_cont.25425
ble_else.25424:
	addi	%r2, %r0, 255	# li
ble_cont.25425:
	mflr	%r31	
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	print_int.2803
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 10	# li
out.25429:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.25429
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	blr
pretrace_diffuse_rays.3283:
	lwz	%r6, 28(%r29)
	lwz	%r7, 24(%r29)
	lwz	%r8, 20(%r29)
	lwz	%r9, 16(%r29)
	lwz	%r10, 12(%r29)
	lwz	%r11, 8(%r29)
	lwz	%r12, 4(%r29)
	cmpwi	%cr7, %r5, 4
	bgt	%cr7, ble_else.25430
	lwz	%r13, 8(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r14, %r5, %r31
	add %r31, %r13, %r14
	lwz %r13, 0(%r31)
	cmpwi	%cr7, %r13, 0
	blt	%cr7, bge_else.25431
	lwz	%r13, 12(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r14, %r5, %r31
	add %r31, %r13, %r14
	lwz %r13, 0(%r31)
	stw	%r29, 0(%r3)
	stw	%r10, 4(%r3)
	stw	%r6, 8(%r3)
	stw	%r8, 12(%r3)
	stw	%r9, 16(%r3)
	stw	%r7, 20(%r3)
	stw	%r11, 24(%r3)
	stw	%r12, 28(%r3)
	stw	%r5, 32(%r3)
	cmpwi	%cr7, %r13, 0
	bne	%cr7, beq_else.25432
	b	beq_cont.25433
beq_else.25432:
	lwz	%r13, 24(%r2)
	lwz	%r13, 0(%r13)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stfs	%f0, 0(%r12)	# float
	stfs	%f0, 4(%r12)	# float
	stfs	%f0, 8(%r12)	# float
	lwz	%r14, 28(%r2)
	lwz	%r15, 4(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r13, %r13, %r31
	add %r31, %r11, %r13
	lwz %r13, 0(%r31)
	addi	%r31, %r0, 2	# li
	slw	%r16, %r5, %r31
	add %r31, %r14, %r16
	lwz %r14, 0(%r31)
	addi	%r31, %r0, 2	# li
	slw	%r16, %r5, %r31
	add %r31, %r15, %r16
	lwz %r15, 0(%r31)
	lfs	%f0, 0(%r15)	# float
	stfs	%f0, 0(%r7)	# float
	lfs	%f0, 4(%r15)	# float
	stfs	%f0, 4(%r7)	# float
	lfs	%f0, 8(%r15)	# float
	stfs	%f0, 8(%r7)	# float
	lwz	%r16, 0(%r9)
	addi	%r16, %r16, -1	# subi %r16, %r16, 1
	stw	%r2, 36(%r3)
	stw	%r15, 40(%r3)
	stw	%r14, 44(%r3)
	stw	%r13, 48(%r3)
	mflr	%r31	
	or	%r5, %r16, %r16	# mr %r5, %r16
	or	%r2, %r15, %r15	# mr %r2, %r15
	or	%r29, %r8, %r8	# mr %r29, %r8
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
	addi	%r7, %r0, 118	# li
	lwz	%r2, 48(%r3)
	lwz	%r5, 44(%r3)
	lwz	%r6, 40(%r3)
	lwz	%r29, 4(%r3)
	mflr	%r31	
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
	lwz	%r2, 36(%r3)
	lwz	%r5, 20(%r2)
	lwz	%r6, 32(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r7, %r6, %r31
	add %r31, %r5, %r7
	lwz %r5, 0(%r31)
	lwz	%r7, 28(%r3)
	lfs	%f0, 0(%r7)	# float
	stfs	%f0, 0(%r5)	# float
	lfs	%f0, 4(%r7)	# float
	stfs	%f0, 4(%r5)	# float
	lfs	%f0, 8(%r7)	# float
	stfs	%f0, 8(%r5)	# float
beq_cont.25433:
	lwz	%r5, 32(%r3)
	addi	%r5, %r5, 1
	cmpwi	%cr7, %r5, 4
	bgt	%cr7, ble_else.25434
	lwz	%r6, 8(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r7, %r5, %r31
	add %r31, %r6, %r7
	lwz %r6, 0(%r31)
	cmpwi	%cr7, %r6, 0
	blt	%cr7, bge_else.25435
	lwz	%r6, 12(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r7, %r5, %r31
	add %r31, %r6, %r7
	lwz %r6, 0(%r31)
	stw	%r5, 52(%r3)
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.25436
	b	beq_cont.25437
beq_else.25436:
	lwz	%r6, 24(%r2)
	lwz	%r6, 0(%r6)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r7, 28(%r3)
	stfs	%f0, 0(%r7)	# float
	stfs	%f0, 4(%r7)	# float
	stfs	%f0, 8(%r7)	# float
	lwz	%r8, 28(%r2)
	lwz	%r9, 4(%r2)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r6, %r31
	lwz	%r10, 24(%r3)
	add %r31, %r10, %r6
	lwz %r6, 0(%r31)
	addi	%r31, %r0, 2	# li
	slw	%r10, %r5, %r31
	add %r31, %r8, %r10
	lwz %r8, 0(%r31)
	addi	%r31, %r0, 2	# li
	slw	%r10, %r5, %r31
	add %r31, %r9, %r10
	lwz %r9, 0(%r31)
	lfs	%f0, 0(%r9)	# float
	lwz	%r10, 20(%r3)
	stfs	%f0, 0(%r10)	# float
	lfs	%f0, 4(%r9)	# float
	stfs	%f0, 4(%r10)	# float
	lfs	%f0, 8(%r9)	# float
	stfs	%f0, 8(%r10)	# float
	lwz	%r10, 16(%r3)
	lwz	%r10, 0(%r10)
	addi	%r10, %r10, -1	# subi %r10, %r10, 1
	lwz	%r29, 12(%r3)
	stw	%r2, 36(%r3)
	stw	%r9, 56(%r3)
	stw	%r8, 60(%r3)
	stw	%r6, 64(%r3)
	mflr	%r31	
	or	%r5, %r10, %r10	# mr %r5, %r10
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtlr	%r31	
	lwz	%r2, 64(%r3)
	lwz	%r5, 472(%r2)
	lwz	%r5, 0(%r5)
	lfs	%f0, 0(%r5)	# float
	lwz	%r6, 60(%r3)
	lfs	%f1, 0(%r6)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 4(%r5)	# float
	lfs	%f2, 4(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r5)	# float
	lfs	%f2, 8(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25438
	addi	%r5, %r0, 0	# li
	b	ble_cont.25439
ble_else.25438:
	addi	%r5, %r0, 1	# li
ble_cont.25439:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25440
	addi	%r5, %r0, 1	# li
	b	beq_cont.25441
beq_else.25440:
	addi	%r5, %r0, 0	# li
beq_cont.25441:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25442
	lwz	%r5, 472(%r2)
	addis	%r31, %r0, (l.19050)@h	# lis
	ori	%r31, %r31, (l.19050)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r29, 8(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtlr	%r31	
	b	beq_cont.25443
beq_else.25442:
	lwz	%r5, 476(%r2)
	addis	%r31, %r0, (l.19017)@h	# lis
	ori	%r31, %r31, (l.19017)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r29, 8(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtlr	%r31	
beq_cont.25443:
	addi	%r7, %r0, 116	# li
	lwz	%r2, 64(%r3)
	lwz	%r5, 60(%r3)
	lwz	%r6, 56(%r3)
	lwz	%r29, 4(%r3)
	mflr	%r31	
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtlr	%r31	
	lwz	%r2, 36(%r3)
	lwz	%r5, 20(%r2)
	lwz	%r6, 52(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r7, %r6, %r31
	add %r31, %r5, %r7
	lwz %r5, 0(%r31)
	lwz	%r7, 28(%r3)
	lfs	%f0, 0(%r7)	# float
	stfs	%f0, 0(%r5)	# float
	lfs	%f0, 4(%r7)	# float
	stfs	%f0, 4(%r5)	# float
	lfs	%f0, 8(%r7)	# float
	stfs	%f0, 8(%r5)	# float
beq_cont.25437:
	lwz	%r5, 52(%r3)
	addi	%r5, %r5, 1
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
bge_else.25435:
	blr
ble_else.25434:
	blr
bge_else.25431:
	blr
ble_else.25430:
	blr
pretrace_pixels.3286:
	lwz	%r7, 68(%r29)
	lwz	%r8, 64(%r29)
	lwz	%r9, 60(%r29)
	lwz	%r10, 56(%r29)
	lwz	%r11, 52(%r29)
	lwz	%r12, 48(%r29)
	lwz	%r13, 44(%r29)
	lwz	%r14, 40(%r29)
	lwz	%r15, 36(%r29)
	lwz	%r16, 32(%r29)
	lwz	%r17, 28(%r29)
	lwz	%r18, 24(%r29)
	lwz	%r19, 20(%r29)
	lwz	%r20, 16(%r29)
	lwz	%r21, 12(%r29)
	lwz	%r22, 8(%r29)
	lwz	%r23, 4(%r29)
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.25448
	lfs	%f3, 0(%r15)	# float
	lwz	%r15, 0(%r21)
	subf	%r15, %r15, %r5	# sub	%r15, %r5, %r15
	stw	%r29, 0(%r3)
	stw	%r18, 4(%r3)
	stw	%r20, 8(%r3)
	stw	%r10, 12(%r3)
	stw	%r13, 16(%r3)
	stw	%r19, 20(%r3)
	stw	%r11, 24(%r3)
	stw	%r22, 28(%r3)
	stw	%r23, 32(%r3)
	stw	%r6, 36(%r3)
	stw	%r9, 40(%r3)
	stw	%r2, 44(%r3)
	stw	%r5, 48(%r3)
	stw	%r12, 52(%r3)
	stw	%r7, 56(%r3)
	stw	%r16, 60(%r3)
	stw	%r8, 64(%r3)
	stfs	%f2, 72(%r3)	# float
	stfs	%f1, 80(%r3)	# float
	stw	%r17, 88(%r3)
	stfs	%f0, 96(%r3)	# float
	stw	%r14, 104(%r3)
	stfs	%f3, 112(%r3)	# float
	mflr	%r31	
	or	%r2, %r15, %r15	# mr %r2, %r15
	stw	%r31, 120(%r3)
	addi	%r3, %r3, 124
	bl	float_of_int.2840
	addi	%r3, %r3, -124	# subi
	lwz	%r31, 120(%r3)
	mtlr	%r31	
	lfs	%f1, 112(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 104(%r3)
	lfs	%f1, 0(%r2)	# float
	fmul	%f1, %f0, %f1
	lfs	%f2, 96(%r3)	# float
	fadd	%f1, %f1, %f2
	lwz	%r5, 88(%r3)
	stfs	%f1, 0(%r5)	# float
	lfs	%f1, 4(%r2)	# float
	fmul	%f1, %f0, %f1
	lfs	%f3, 80(%r3)	# float
	fadd	%f1, %f1, %f3
	stfs	%f1, 4(%r5)	# float
	lfs	%f1, 8(%r2)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 72(%r3)	# float
	fadd	%f0, %f0, %f1
	stfs	%f0, 8(%r5)	# float
	addi	%r2, %r0, 0	# li
	lwz	%r29, 64(%r3)
	mflr	%r31	
	or	%r28, %r5, %r5	# mr %r28, %r5
	or	%r5, %r2, %r2	# mr %r5, %r2
	or	%r2, %r28, %r28	# mr %r2, %r28
	stw	%r31, 120(%r3)
	addi	%r3, %r3, 124
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -124	# subi
	lwz	%r31, 120(%r3)
	mtlr	%r31	
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r2, 60(%r3)
	stfs	%f0, 0(%r2)	# float
	stfs	%f0, 4(%r2)	# float
	stfs	%f0, 8(%r2)	# float
	lwz	%r5, 56(%r3)
	lfs	%f0, 0(%r5)	# float
	lwz	%r6, 52(%r3)
	stfs	%f0, 0(%r6)	# float
	lfs	%f0, 4(%r5)	# float
	stfs	%f0, 4(%r6)	# float
	lfs	%f0, 8(%r5)	# float
	stfs	%f0, 8(%r6)	# float
	addi	%r5, %r0, 0	# li
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r6, 48(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r7, %r6, %r31
	lwz	%r8, 44(%r3)
	add %r31, %r8, %r7
	lwz %r7, 0(%r31)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	lwz	%r9, 88(%r3)
	lwz	%r29, 40(%r3)
	mflr	%r31	
	or	%r6, %r7, %r7	# mr %r6, %r7
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r9, %r9	# mr %r5, %r9
	stw	%r31, 120(%r3)
	addi	%r3, %r3, 124
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -124	# subi
	lwz	%r31, 120(%r3)
	mtlr	%r31	
	lwz	%r2, 48(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 44(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r5, 0(%r5)
	lwz	%r7, 60(%r3)
	lfs	%f0, 0(%r7)	# float
	stfs	%f0, 0(%r5)	# float
	lfs	%f0, 4(%r7)	# float
	stfs	%f0, 4(%r5)	# float
	lfs	%f0, 8(%r7)	# float
	stfs	%f0, 8(%r5)	# float
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r5, 24(%r5)
	lwz	%r7, 36(%r3)
	stw	%r7, 0(%r5)
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r8, 8(%r5)
	lwz	%r8, 0(%r8)
	cmpwi	%cr7, %r8, 0
	blt	%cr7, bge_else.25452
	lwz	%r8, 12(%r5)
	lwz	%r8, 0(%r8)
	stw	%r5, 120(%r3)
	cmpwi	%cr7, %r8, 0
	bne	%cr7, beq_else.25454
	b	beq_cont.25455
beq_else.25454:
	lwz	%r8, 24(%r5)
	lwz	%r8, 0(%r8)
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r9, 32(%r3)
	stfs	%f0, 0(%r9)	# float
	stfs	%f0, 4(%r9)	# float
	stfs	%f0, 8(%r9)	# float
	lwz	%r10, 28(%r5)
	lwz	%r11, 4(%r5)
	addi	%r31, %r0, 2	# li
	slw	%r8, %r8, %r31
	lwz	%r12, 28(%r3)
	add %r31, %r12, %r8
	lwz %r8, 0(%r31)
	lwz	%r10, 0(%r10)
	lwz	%r11, 0(%r11)
	lfs	%f0, 0(%r11)	# float
	lwz	%r12, 24(%r3)
	stfs	%f0, 0(%r12)	# float
	lfs	%f0, 4(%r11)	# float
	stfs	%f0, 4(%r12)	# float
	lfs	%f0, 8(%r11)	# float
	stfs	%f0, 8(%r12)	# float
	lwz	%r12, 20(%r3)
	lwz	%r12, 0(%r12)
	addi	%r12, %r12, -1	# subi %r12, %r12, 1
	lwz	%r29, 16(%r3)
	stw	%r11, 124(%r3)
	stw	%r10, 128(%r3)
	stw	%r8, 132(%r3)
	mflr	%r31	
	or	%r5, %r12, %r12	# mr %r5, %r12
	or	%r2, %r11, %r11	# mr %r2, %r11
	stw	%r31, 136(%r3)
	addi	%r3, %r3, 140
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -140	# subi
	lwz	%r31, 136(%r3)
	mtlr	%r31	
	lwz	%r2, 132(%r3)
	lwz	%r5, 472(%r2)
	lwz	%r5, 0(%r5)
	lfs	%f0, 0(%r5)	# float
	lwz	%r6, 128(%r3)
	lfs	%f1, 0(%r6)	# float
	fmul	%f0, %f0, %f1
	lfs	%f1, 4(%r5)	# float
	lfs	%f2, 4(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfs	%f1, 8(%r5)	# float
	lfs	%f2, 8(%r6)	# float
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.25456
	addi	%r5, %r0, 0	# li
	b	ble_cont.25457
ble_else.25456:
	addi	%r5, %r0, 1	# li
ble_cont.25457:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25458
	addi	%r5, %r0, 1	# li
	b	beq_cont.25459
beq_else.25458:
	addi	%r5, %r0, 0	# li
beq_cont.25459:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25460
	lwz	%r5, 472(%r2)
	addis	%r31, %r0, (l.19050)@h	# lis
	ori	%r31, %r31, (l.19050)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r29, 12(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 136(%r3)
	addi	%r3, %r3, 140
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -140	# subi
	lwz	%r31, 136(%r3)
	mtlr	%r31	
	b	beq_cont.25461
beq_else.25460:
	lwz	%r5, 476(%r2)
	addis	%r31, %r0, (l.19017)@h	# lis
	ori	%r31, %r31, (l.19017)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f0, %f0, %f1
	lwz	%r29, 12(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 136(%r3)
	addi	%r3, %r3, 140
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -140	# subi
	lwz	%r31, 136(%r3)
	mtlr	%r31	
beq_cont.25461:
	addi	%r7, %r0, 116	# li
	lwz	%r2, 132(%r3)
	lwz	%r5, 128(%r3)
	lwz	%r6, 124(%r3)
	lwz	%r29, 8(%r3)
	mflr	%r31	
	stw	%r31, 136(%r3)
	addi	%r3, %r3, 140
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -140	# subi
	lwz	%r31, 136(%r3)
	mtlr	%r31	
	lwz	%r2, 120(%r3)
	lwz	%r5, 20(%r2)
	lwz	%r5, 0(%r5)
	lwz	%r6, 32(%r3)
	lfs	%f0, 0(%r6)	# float
	stfs	%f0, 0(%r5)	# float
	lfs	%f0, 4(%r6)	# float
	stfs	%f0, 4(%r5)	# float
	lfs	%f0, 8(%r6)	# float
	stfs	%f0, 8(%r5)	# float
beq_cont.25455:
	addi	%r5, %r0, 1	# li
	lwz	%r2, 120(%r3)
	lwz	%r29, 4(%r3)
	mflr	%r31	
	stw	%r31, 136(%r3)
	addi	%r3, %r3, 140
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -140	# subi
	lwz	%r31, 136(%r3)
	mtlr	%r31	
	b	bge_cont.25453
bge_else.25452:
bge_cont.25453:
	lwz	%r2, 48(%r3)
	addi	%r5, %r2, -1	# subi %r5, %r2, 1
	lwz	%r2, 36(%r3)
	addi	%r2, %r2, 1
	cmpwi	%cr7, %r2, 5
	blt	%cr7, bge_else.25462
	addi	%r6, %r2, -5	# subi %r6, %r2, 5
	b	bge_cont.25463
bge_else.25462:
	or	%r6, %r2, %r2	# mr %r6, %r2
bge_cont.25463:
	lfs	%f0, 96(%r3)	# float
	lfs	%f1, 80(%r3)	# float
	lfs	%f2, 72(%r3)	# float
	lwz	%r2, 44(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
bge_else.25448:
	blr
scan_pixel.3297:
	lwz	%r9, 28(%r29)
	lwz	%r10, 24(%r29)
	lwz	%r11, 20(%r29)
	lwz	%r12, 16(%r29)
	lwz	%r13, 12(%r29)
	lwz	%r14, 8(%r29)
	lwz	%r15, 4(%r29)
	lwz	%r16, 0(%r12)
	cmp	%cr7, %r16, %r2
	bgt	%cr7, ble_else.25465
	blr
ble_else.25465:
	addi	%r31, %r0, 2	# li
	slw	%r16, %r2, %r31
	add %r31, %r7, %r16
	lwz %r16, 0(%r31)
	lwz	%r16, 0(%r16)
	lfs	%f0, 0(%r16)	# float
	stfs	%f0, 0(%r11)	# float
	lfs	%f0, 4(%r16)	# float
	stfs	%f0, 4(%r11)	# float
	lfs	%f0, 8(%r16)	# float
	stfs	%f0, 8(%r11)	# float
	lwz	%r16, 4(%r12)
	addi	%r17, %r5, 1
	cmp	%cr7, %r16, %r17
	bgt	%cr7, ble_else.25467
	addi	%r16, %r0, 0	# li
	b	ble_cont.25468
ble_else.25467:
	cmpwi	%cr7, %r5, 0	
	bgt	%cr7, ble_else.25469
	addi	%r16, %r0, 0	# li
	b	ble_cont.25470
ble_else.25469:
	lwz	%r16, 0(%r12)
	addi	%r17, %r2, 1
	cmp	%cr7, %r16, %r17
	bgt	%cr7, ble_else.25471
	addi	%r16, %r0, 0	# li
	b	ble_cont.25472
ble_else.25471:
	cmpwi	%cr7, %r2, 0	
	bgt	%cr7, ble_else.25473
	addi	%r16, %r0, 0	# li
	b	ble_cont.25474
ble_else.25473:
	addi	%r16, %r0, 1	# li
ble_cont.25474:
ble_cont.25472:
ble_cont.25470:
ble_cont.25468:
	stw	%r29, 0(%r3)
	stw	%r9, 4(%r3)
	stw	%r8, 8(%r3)
	stw	%r6, 12(%r3)
	stw	%r10, 16(%r3)
	stw	%r13, 20(%r3)
	stw	%r5, 24(%r3)
	stw	%r7, 28(%r3)
	stw	%r12, 32(%r3)
	stw	%r2, 36(%r3)
	stw	%r11, 40(%r3)
	cmpwi	%cr7, %r16, 0
	bne	%cr7, beq_else.25475
	addi	%r31, %r0, 2	# li
	slw	%r14, %r2, %r31
	add %r31, %r7, %r14
	lwz %r14, 0(%r31)
	addi	%r16, %r0, 0	# li
	lwz	%r17, 8(%r14)
	lwz	%r17, 0(%r17)
	cmpwi	%cr7, %r17, 0
	blt	%cr7, bge_else.25477
	lwz	%r17, 12(%r14)
	lwz	%r17, 0(%r17)
	stw	%r14, 44(%r3)
	cmpwi	%cr7, %r17, 0
	bne	%cr7, beq_else.25479
	b	beq_cont.25480
beq_else.25479:
	mflr	%r31	
	or	%r5, %r16, %r16	# mr %r5, %r16
	or	%r2, %r14, %r14	# mr %r2, %r14
	or	%r29, %r15, %r15	# mr %r29, %r15
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
beq_cont.25480:
	addi	%r5, %r0, 1	# li
	lwz	%r2, 44(%r3)
	lwz	%r29, 20(%r3)
	mflr	%r31	
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
	b	bge_cont.25478
bge_else.25477:
bge_cont.25478:
	b	beq_cont.25476
beq_else.25475:
	addi	%r15, %r0, 0	# li
	addi	%r31, %r0, 2	# li
	slw	%r16, %r2, %r31
	add %r31, %r7, %r16
	lwz %r16, 0(%r31)
	lwz	%r17, 8(%r16)
	lwz	%r17, 0(%r17)
	cmpwi	%cr7, %r17, 0
	blt	%cr7, bge_else.25481
	addi	%r31, %r0, 2	# li
	slw	%r17, %r2, %r31
	add %r31, %r7, %r17
	lwz %r17, 0(%r31)
	lwz	%r17, 8(%r17)
	lwz	%r17, 0(%r17)
	addi	%r31, %r0, 2	# li
	slw	%r18, %r2, %r31
	add %r31, %r6, %r18
	lwz %r18, 0(%r31)
	lwz	%r18, 8(%r18)
	lwz	%r18, 0(%r18)
	cmp	%cr7, %r18, %r17
	bne	%cr7, beq_else.25483
	addi	%r31, %r0, 2	# li
	slw	%r18, %r2, %r31
	add %r31, %r8, %r18
	lwz %r18, 0(%r31)
	lwz	%r18, 8(%r18)
	lwz	%r18, 0(%r18)
	cmp	%cr7, %r18, %r17
	bne	%cr7, beq_else.25485
	addi	%r18, %r2, -1	# subi %r18, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r18, %r18, %r31
	add %r31, %r7, %r18
	lwz %r18, 0(%r31)
	lwz	%r18, 8(%r18)
	lwz	%r18, 0(%r18)
	cmp	%cr7, %r18, %r17
	bne	%cr7, beq_else.25487
	addi	%r18, %r2, 1
	addi	%r31, %r0, 2	# li
	slw	%r18, %r18, %r31
	add %r31, %r7, %r18
	lwz %r18, 0(%r31)
	lwz	%r18, 8(%r18)
	lwz	%r18, 0(%r18)
	cmp	%cr7, %r18, %r17
	bne	%cr7, beq_else.25489
	addi	%r17, %r0, 1	# li
	b	beq_cont.25490
beq_else.25489:
	addi	%r17, %r0, 0	# li
beq_cont.25490:
	b	beq_cont.25488
beq_else.25487:
	addi	%r17, %r0, 0	# li
beq_cont.25488:
	b	beq_cont.25486
beq_else.25485:
	addi	%r17, %r0, 0	# li
beq_cont.25486:
	b	beq_cont.25484
beq_else.25483:
	addi	%r17, %r0, 0	# li
beq_cont.25484:
	cmpwi	%cr7, %r17, 0
	bne	%cr7, beq_else.25491
	addi	%r31, %r0, 2	# li
	slw	%r14, %r2, %r31
	add %r31, %r7, %r14
	lwz %r14, 0(%r31)
	mflr	%r31	
	or	%r5, %r15, %r15	# mr %r5, %r15
	or	%r2, %r14, %r14	# mr %r2, %r14
	or	%r29, %r13, %r13	# mr %r29, %r13
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
	b	beq_cont.25492
beq_else.25491:
	lwz	%r16, 12(%r16)
	lwz	%r16, 0(%r16)
	cmpwi	%cr7, %r16, 0
	bne	%cr7, beq_else.25493
	b	beq_cont.25494
beq_else.25493:
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r29, %r14, %r14	# mr %r29, %r14
	or	%r6, %r7, %r7	# mr %r6, %r7
	or	%r7, %r8, %r8	# mr %r7, %r8
	or	%r8, %r15, %r15	# mr %r8, %r15
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
beq_cont.25494:
	addi	%r9, %r0, 1	# li
	lwz	%r2, 36(%r3)
	lwz	%r5, 24(%r3)
	lwz	%r6, 12(%r3)
	lwz	%r7, 28(%r3)
	lwz	%r8, 8(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
beq_cont.25492:
	b	bge_cont.25482
bge_else.25481:
bge_cont.25482:
beq_cont.25476:
	lwz	%r2, 40(%r3)
	lfs	%f0, 0(%r2)	# float
	mflr	%r31	
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	bl	write_rgb_element.3279
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 32	# li
out.25495:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.25495
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	lwz	%r2, 40(%r3)
	lfs	%f0, 4(%r2)	# float
	mflr	%r31	
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	bl	write_rgb_element.3279
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 32	# li
out.25496:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.25496
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	lwz	%r2, 40(%r3)
	lfs	%f0, 8(%r2)	# float
	mflr	%r31	
	stw	%r31, 48(%r3)
	addi	%r3, %r3, 52
	bl	write_rgb_element.3279
	addi	%r3, %r3, -52	# subi
	lwz	%r31, 48(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 10	# li
out.25497:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.25497
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	lwz	%r2, 36(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 32(%r3)
	lwz	%r6, 0(%r5)
	cmp	%cr7, %r6, %r2
	bgt	%cr7, ble_else.25498
	blr
ble_else.25498:
	addi	%r31, %r0, 2	# li
	slw	%r6, %r2, %r31
	lwz	%r7, 28(%r3)
	add %r31, %r7, %r6
	lwz %r6, 0(%r31)
	lwz	%r6, 0(%r6)
	lfs	%f0, 0(%r6)	# float
	lwz	%r8, 40(%r3)
	stfs	%f0, 0(%r8)	# float
	lfs	%f0, 4(%r6)	# float
	stfs	%f0, 4(%r8)	# float
	lfs	%f0, 8(%r6)	# float
	stfs	%f0, 8(%r8)	# float
	lwz	%r6, 4(%r5)
	lwz	%r8, 24(%r3)
	addi	%r9, %r8, 1
	cmp	%cr7, %r6, %r9
	bgt	%cr7, ble_else.25500
	addi	%r5, %r0, 0	# li
	b	ble_cont.25501
ble_else.25500:
	cmpwi	%cr7, %r8, 0	
	bgt	%cr7, ble_else.25502
	addi	%r5, %r0, 0	# li
	b	ble_cont.25503
ble_else.25502:
	lwz	%r5, 0(%r5)
	addi	%r6, %r2, 1
	cmp	%cr7, %r5, %r6
	bgt	%cr7, ble_else.25504
	addi	%r5, %r0, 0	# li
	b	ble_cont.25505
ble_else.25504:
	cmpwi	%cr7, %r2, 0	
	bgt	%cr7, ble_else.25506
	addi	%r5, %r0, 0	# li
	b	ble_cont.25507
ble_else.25506:
	addi	%r5, %r0, 1	# li
ble_cont.25507:
ble_cont.25505:
ble_cont.25503:
ble_cont.25501:
	stw	%r2, 48(%r3)
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.25508
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	add %r31, %r7, %r5
	lwz %r5, 0(%r31)
	addi	%r6, %r0, 0	# li
	lwz	%r29, 20(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
	b	beq_cont.25509
beq_else.25508:
	addi	%r9, %r0, 0	# li
	lwz	%r6, 12(%r3)
	lwz	%r5, 8(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	or	%r28, %r8, %r8	# mr %r28, %r8
	or	%r8, %r5, %r5	# mr %r8, %r5
	or	%r5, %r28, %r28	# mr %r5, %r28
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
beq_cont.25509:
	lwz	%r29, 4(%r3)
	mflr	%r31	
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
	lwz	%r2, 48(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 24(%r3)
	lwz	%r6, 12(%r3)
	lwz	%r7, 28(%r3)
	lwz	%r8, 8(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
scan_line.3303:
	lwz	%r9, 44(%r29)
	lwz	%r10, 40(%r29)
	lwz	%r11, 36(%r29)
	lwz	%r12, 32(%r29)
	lwz	%r13, 28(%r29)
	lwz	%r14, 24(%r29)
	lwz	%r15, 20(%r29)
	lwz	%r16, 16(%r29)
	lwz	%r17, 12(%r29)
	lwz	%r18, 8(%r29)
	lwz	%r19, 4(%r29)
	lwz	%r20, 4(%r17)
	cmp	%cr7, %r20, %r2
	bgt	%cr7, ble_else.25510
	blr
ble_else.25510:
	lwz	%r20, 4(%r17)
	addi	%r20, %r20, -1	# subi %r20, %r20, 1
	stw	%r29, 0(%r3)
	stw	%r16, 4(%r3)
	stw	%r11, 8(%r3)
	stw	%r12, 12(%r3)
	stw	%r18, 16(%r3)
	stw	%r14, 20(%r3)
	stw	%r8, 24(%r3)
	stw	%r13, 28(%r3)
	stw	%r9, 32(%r3)
	stw	%r7, 36(%r3)
	stw	%r5, 40(%r3)
	stw	%r10, 44(%r3)
	stw	%r19, 48(%r3)
	stw	%r2, 52(%r3)
	stw	%r15, 56(%r3)
	stw	%r6, 60(%r3)
	stw	%r17, 64(%r3)
	cmp	%cr7, %r20, %r2
	bgt	%cr7, ble_else.25512
	b	ble_cont.25513
ble_else.25512:
	addi	%r20, %r2, 1
	lfs	%f0, 0(%r14)	# float
	lwz	%r21, 4(%r18)
	subf	%r20, %r21, %r20	# sub	%r20, %r20, %r21
	stfs	%f0, 72(%r3)	# float
	mflr	%r31	
	or	%r2, %r20, %r20	# mr %r2, %r20
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	bl	float_of_int.2840
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	lfs	%f1, 72(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 12(%r3)
	lfs	%f1, 0(%r2)	# float
	fmul	%f1, %f0, %f1
	lwz	%r5, 8(%r3)
	lfs	%f2, 0(%r5)	# float
	fadd	%f1, %f1, %f2
	lfs	%f2, 4(%r2)	# float
	fmul	%f2, %f0, %f2
	lfs	%f3, 4(%r5)	# float
	fadd	%f2, %f2, %f3
	lfs	%f3, 8(%r2)	# float
	fmul	%f0, %f0, %f3
	lfs	%f3, 8(%r5)	# float
	fadd	%f0, %f0, %f3
	lwz	%r6, 64(%r3)
	lwz	%r7, 0(%r6)
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	lwz	%r8, 36(%r3)
	lwz	%r9, 24(%r3)
	lwz	%r29, 4(%r3)
	mflr	%r31	
	or	%r6, %r9, %r9	# mr %r6, %r9
	or	%r5, %r7, %r7	# mr %r5, %r7
	or	%r2, %r8, %r8	# mr %r2, %r8
	fmr	%f31, %f2
	fmr	%f2, %f0
	fmr	%f0, %f1
	fmr	%f1, %f31
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
ble_cont.25513:
	addi	%r2, %r0, 0	# li
	lwz	%r5, 64(%r3)
	lwz	%r6, 0(%r5)
	cmpwi	%cr7, %r6, 0	
	bgt	%cr7, ble_else.25515
	b	ble_cont.25516
ble_else.25515:
	lwz	%r7, 60(%r3)
	lwz	%r6, 0(%r7)
	lwz	%r6, 0(%r6)
	lfs	%f0, 0(%r6)	# float
	lwz	%r8, 56(%r3)
	stfs	%f0, 0(%r8)	# float
	lfs	%f0, 4(%r6)	# float
	stfs	%f0, 4(%r8)	# float
	lfs	%f0, 8(%r6)	# float
	stfs	%f0, 8(%r8)	# float
	lwz	%r6, 4(%r5)
	lwz	%r8, 52(%r3)
	addi	%r9, %r8, 1
	cmp	%cr7, %r6, %r9
	bgt	%cr7, ble_else.25517
	addi	%r6, %r0, 0	# li
	b	ble_cont.25518
ble_else.25517:
	cmpwi	%cr7, %r8, 0	
	bgt	%cr7, ble_else.25519
	addi	%r6, %r0, 0	# li
	b	ble_cont.25520
ble_else.25519:
	lwz	%r6, 0(%r5)
	cmpwi	%cr7, %r6, 1	
	bgt	%cr7, ble_else.25521
	addi	%r6, %r0, 0	# li
	b	ble_cont.25522
ble_else.25521:
	addi	%r6, %r0, 0	# li
ble_cont.25522:
ble_cont.25520:
ble_cont.25518:
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.25523
	lwz	%r2, 0(%r7)
	addi	%r6, %r0, 0	# li
	lwz	%r29, 48(%r3)
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	b	beq_cont.25524
beq_else.25523:
	addi	%r9, %r0, 0	# li
	lwz	%r6, 40(%r3)
	lwz	%r10, 36(%r3)
	lwz	%r29, 44(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r8, %r10, %r10	# mr %r8, %r10
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
beq_cont.25524:
	lwz	%r29, 32(%r3)
	mflr	%r31	
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 1	# li
	lwz	%r5, 52(%r3)
	lwz	%r6, 40(%r3)
	lwz	%r7, 60(%r3)
	lwz	%r8, 36(%r3)
	lwz	%r29, 28(%r3)
	mflr	%r31	
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
ble_cont.25516:
	lwz	%r2, 52(%r3)
	addi	%r5, %r2, 1
	lwz	%r2, 24(%r3)
	addi	%r2, %r2, 2
	cmpwi	%cr7, %r2, 5
	blt	%cr7, bge_else.25525
	addi	%r2, %r2, -5	# subi %r2, %r2, 5
	b	bge_cont.25526
bge_else.25525:
bge_cont.25526:
	lwz	%r6, 64(%r3)
	lwz	%r7, 4(%r6)
	cmp	%cr7, %r7, %r5
	bgt	%cr7, ble_else.25527
	blr
ble_else.25527:
	lwz	%r7, 4(%r6)
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	stw	%r2, 80(%r3)
	stw	%r5, 84(%r3)
	cmp	%cr7, %r7, %r5
	bgt	%cr7, ble_else.25529
	b	ble_cont.25530
ble_else.25529:
	addi	%r7, %r5, 1
	lwz	%r8, 20(%r3)
	lfs	%f0, 0(%r8)	# float
	lwz	%r8, 16(%r3)
	lwz	%r8, 4(%r8)
	subf	%r7, %r8, %r7	# sub	%r7, %r7, %r8
	stfs	%f0, 88(%r3)	# float
	mflr	%r31	
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 96(%r3)
	addi	%r3, %r3, 100
	bl	float_of_int.2840
	addi	%r3, %r3, -100	# subi
	lwz	%r31, 96(%r3)
	mtlr	%r31	
	lfs	%f1, 88(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 12(%r3)
	lfs	%f1, 0(%r2)	# float
	fmul	%f1, %f0, %f1
	lwz	%r5, 8(%r3)
	lfs	%f2, 0(%r5)	# float
	fadd	%f1, %f1, %f2
	lfs	%f2, 4(%r2)	# float
	fmul	%f2, %f0, %f2
	lfs	%f3, 4(%r5)	# float
	fadd	%f2, %f2, %f3
	lfs	%f3, 8(%r2)	# float
	fmul	%f0, %f0, %f3
	lfs	%f3, 8(%r5)	# float
	fadd	%f0, %f0, %f3
	lwz	%r2, 64(%r3)
	lwz	%r2, 0(%r2)
	addi	%r5, %r2, -1	# subi %r5, %r2, 1
	lwz	%r2, 40(%r3)
	lwz	%r6, 80(%r3)
	lwz	%r29, 4(%r3)
	mflr	%r31	
	fmr	%f31, %f2
	fmr	%f2, %f0
	fmr	%f0, %f1
	fmr	%f1, %f31
	stw	%r31, 96(%r3)
	addi	%r3, %r3, 100
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -100	# subi
	lwz	%r31, 96(%r3)
	mtlr	%r31	
ble_cont.25530:
	addi	%r2, %r0, 0	# li
	lwz	%r5, 84(%r3)
	lwz	%r6, 60(%r3)
	lwz	%r7, 36(%r3)
	lwz	%r8, 40(%r3)
	lwz	%r29, 28(%r3)
	mflr	%r31	
	stw	%r31, 96(%r3)
	addi	%r3, %r3, 100
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -100	# subi
	lwz	%r31, 96(%r3)
	mtlr	%r31	
	lwz	%r2, 84(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 80(%r3)
	addi	%r5, %r5, 2
	cmpwi	%cr7, %r5, 5
	blt	%cr7, bge_else.25531
	addi	%r8, %r5, -5	# subi %r8, %r5, 5
	b	bge_cont.25532
bge_else.25531:
	or	%r8, %r5, %r5	# mr %r8, %r5
bge_cont.25532:
	lwz	%r5, 36(%r3)
	lwz	%r6, 40(%r3)
	lwz	%r7, 60(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
create_pixel.3311:
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 0(%r3)
	addi	%r3, %r3, 4
	bl	min_caml_create_float_array
	addi	%r3, %r3, -4	# subi
	lwz	%r31, 0(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 0(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_float_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	addi	%r2, %r0, 5	# li
	mflr	%r31	
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_create_array
	addi	%r3, %r3, -8	# subi
	lwz	%r31, 4(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 4(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	min_caml_create_float_array
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	lwz	%r5, 4(%r3)
	stw	%r2, 4(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	min_caml_create_float_array
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	lwz	%r5, 4(%r3)
	stw	%r2, 8(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	min_caml_create_float_array
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	lwz	%r5, 4(%r3)
	stw	%r2, 12(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	min_caml_create_float_array
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	lwz	%r5, 4(%r3)
	stw	%r2, 16(%r5)
	addi	%r2, %r0, 5	# li
	addi	%r6, %r0, 0	# li
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	min_caml_create_array
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 5	# li
	addi	%r6, %r0, 0	# li
	stw	%r2, 8(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 12(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	bl	min_caml_create_float_array
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	addi	%r2, %r0, 5	# li
	mflr	%r31	
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	bl	min_caml_create_array
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 16(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_create_float_array
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtlr	%r31	
	lwz	%r5, 16(%r3)
	stw	%r2, 4(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_create_float_array
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtlr	%r31	
	lwz	%r5, 16(%r3)
	stw	%r2, 8(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_create_float_array
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtlr	%r31	
	lwz	%r5, 16(%r3)
	stw	%r2, 12(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_create_float_array
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtlr	%r31	
	lwz	%r5, 16(%r3)
	stw	%r2, 16(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_create_float_array
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	addi	%r2, %r0, 5	# li
	mflr	%r31	
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_create_array
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 20(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	bl	min_caml_create_float_array
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	mtlr	%r31	
	lwz	%r5, 20(%r3)
	stw	%r2, 4(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	bl	min_caml_create_float_array
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	mtlr	%r31	
	lwz	%r5, 20(%r3)
	stw	%r2, 8(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	bl	min_caml_create_float_array
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	mtlr	%r31	
	lwz	%r5, 20(%r3)
	stw	%r2, 12(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	bl	min_caml_create_float_array
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	mtlr	%r31	
	lwz	%r5, 20(%r3)
	stw	%r2, 16(%r5)
	addi	%r2, %r0, 1	# li
	addi	%r6, %r0, 0	# li
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	bl	min_caml_create_array
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 24(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_float_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	addi	%r2, %r0, 5	# li
	mflr	%r31	
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 28(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	bl	min_caml_create_float_array
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	lwz	%r5, 28(%r3)
	stw	%r2, 4(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	bl	min_caml_create_float_array
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	lwz	%r5, 28(%r3)
	stw	%r2, 8(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	bl	min_caml_create_float_array
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	lwz	%r5, 28(%r3)
	stw	%r2, 12(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	bl	min_caml_create_float_array
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	lwz	%r5, 28(%r3)
	stw	%r2, 16(%r5)
	or	%r2, %r4, %r4	# mr %r2, %r4
	addi	%r4, %r4, 32
	stw	%r5, 28(%r2)
	lwz	%r5, 24(%r3)
	stw	%r5, 24(%r2)
	lwz	%r5, 20(%r3)
	stw	%r5, 20(%r2)
	lwz	%r5, 16(%r3)
	stw	%r5, 16(%r2)
	lwz	%r5, 12(%r3)
	stw	%r5, 12(%r2)
	lwz	%r5, 8(%r3)
	stw	%r5, 8(%r2)
	lwz	%r5, 4(%r3)
	stw	%r5, 4(%r2)
	lwz	%r5, 0(%r3)
	stw	%r5, 0(%r2)
	blr
init_line_elements.3313:
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.25533
	addi	%r6, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 8(%r3)
	addi	%r3, %r3, 12
	bl	min_caml_create_float_array
	addi	%r3, %r3, -12	# subi
	lwz	%r31, 8(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 8(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_float_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	addi	%r2, %r0, 5	# li
	mflr	%r31	
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_create_array
	addi	%r3, %r3, -16	# subi
	lwz	%r31, 12(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 12(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	bl	min_caml_create_float_array
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	lwz	%r5, 12(%r3)
	stw	%r2, 4(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	bl	min_caml_create_float_array
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	lwz	%r5, 12(%r3)
	stw	%r2, 8(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	bl	min_caml_create_float_array
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	lwz	%r5, 12(%r3)
	stw	%r2, 12(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	bl	min_caml_create_float_array
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	lwz	%r5, 12(%r3)
	stw	%r2, 16(%r5)
	addi	%r2, %r0, 5	# li
	addi	%r6, %r0, 0	# li
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	bl	min_caml_create_array
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 5	# li
	addi	%r6, %r0, 0	# li
	stw	%r2, 16(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_create_array
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 20(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	bl	min_caml_create_float_array
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	addi	%r2, %r0, 5	# li
	mflr	%r31	
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	bl	min_caml_create_array
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 24(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_float_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	lwz	%r5, 24(%r3)
	stw	%r2, 4(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_float_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	lwz	%r5, 24(%r3)
	stw	%r2, 8(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_float_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	lwz	%r5, 24(%r3)
	stw	%r2, 12(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_float_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	lwz	%r5, 24(%r3)
	stw	%r2, 16(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_float_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	addi	%r2, %r0, 5	# li
	mflr	%r31	
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 28(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	bl	min_caml_create_float_array
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	lwz	%r5, 28(%r3)
	stw	%r2, 4(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	bl	min_caml_create_float_array
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	lwz	%r5, 28(%r3)
	stw	%r2, 8(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	bl	min_caml_create_float_array
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	lwz	%r5, 28(%r3)
	stw	%r2, 12(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	bl	min_caml_create_float_array
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	lwz	%r5, 28(%r3)
	stw	%r2, 16(%r5)
	addi	%r2, %r0, 1	# li
	addi	%r6, %r0, 0	# li
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	bl	min_caml_create_array
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 32(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_create_float_array
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	addi	%r2, %r0, 5	# li
	mflr	%r31	
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_create_array
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 36(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	bl	min_caml_create_float_array
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
	lwz	%r5, 36(%r3)
	stw	%r2, 4(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	bl	min_caml_create_float_array
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
	lwz	%r5, 36(%r3)
	stw	%r2, 8(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	bl	min_caml_create_float_array
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
	lwz	%r5, 36(%r3)
	stw	%r2, 12(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	bl	min_caml_create_float_array
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
	lwz	%r5, 36(%r3)
	stw	%r2, 16(%r5)
	or	%r2, %r4, %r4	# mr %r2, %r4
	addi	%r4, %r4, 32
	stw	%r5, 28(%r2)
	lwz	%r5, 32(%r3)
	stw	%r5, 24(%r2)
	lwz	%r5, 28(%r3)
	stw	%r5, 20(%r2)
	lwz	%r5, 24(%r3)
	stw	%r5, 16(%r2)
	lwz	%r5, 20(%r3)
	stw	%r5, 12(%r2)
	lwz	%r5, 16(%r3)
	stw	%r5, 8(%r2)
	lwz	%r5, 12(%r3)
	stw	%r5, 4(%r2)
	lwz	%r5, 8(%r3)
	stw	%r5, 0(%r2)
	lwz	%r5, 4(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 0(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25534
	stw	%r2, 40(%r3)
	mflr	%r31	
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	create_pixel.3311
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	lwz	%r5, 40(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 0(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	or	%r2, %r7, %r7	# mr %r2, %r7
	b	init_line_elements.3313
bge_else.25534:
	or	%r2, %r7, %r7	# mr %r2, %r7
	blr
bge_else.25533:
	blr
calc_dirvec.3323:
	lfs	%f4, 12(%r29)	# float
	lwz	%r7, 8(%r29)
	lwz	%r8, 4(%r29)
	cmpwi	%cr7, %r2, 5
	blt	%cr7, bge_else.25535
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f3, 0(%r31)	# float
	fadd	%f2, %f2, %f3
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f3, 0(%r31)	# float
	fdiv	%f5, %f2, %f3
	fadd	%f5, %f3, %f5
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f6, 0(%r31)	# float
	fdiv	%f5, %f5, %f6
	fsub	%f3, %f5, %f3
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f6, 0(%r31)	# float
	fcmpu	%cr7, %f6, %f3
	bgt	%cr7, ble_else.25536
	b	ble_cont.25537
ble_else.25536:
	fneg	%f3, %f3
ble_cont.25537:
	stw	%r6, 0(%r3)
	stw	%r8, 4(%r3)
	stw	%r5, 8(%r3)
	stfs	%f1, 16(%r3)	# float
	stfs	%f0, 24(%r3)	# float
	fcmpu	%cr7, %f4, %f3
	bgt	%cr7, ble_else.25539
	fdiv	%f3, %f2, %f5
	fadd	%f3, %f5, %f3
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f6, 0(%r31)	# float
	fdiv	%f3, %f3, %f6
	fsub	%f5, %f3, %f5
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f6, 0(%r31)	# float
	fcmpu	%cr7, %f6, %f5
	bgt	%cr7, ble_else.25541
	b	ble_cont.25542
ble_else.25541:
	fneg	%f5, %f5
ble_cont.25542:
	fcmpu	%cr7, %f4, %f5
	bgt	%cr7, ble_else.25543
	mflr	%r31	
	or	%r29, %r7, %r7	# mr %r29, %r7
	fmr	%f1, %f2
	fmr	%f0, %f3
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	b	ble_cont.25544
ble_else.25543:
	fmr	%f0, %f3
ble_cont.25544:
	b	ble_cont.25540
ble_else.25539:
	fmr	%f0, %f5
ble_cont.25540:
	lfs	%f1, 24(%r3)	# float
	fdiv	%f1, %f1, %f0
	lfs	%f2, 16(%r3)	# float
	fdiv	%f2, %f2, %f0
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f3, 0(%r31)	# float
	fdiv	%f0, %f3, %f0
	lwz	%r2, 8(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	lwz	%r5, 4(%r3)
	add %r31, %r5, %r2
	lwz %r2, 0(%r31)
	lwz	%r5, 0(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	add %r31, %r2, %r6
	lwz %r6, 0(%r31)
	lwz	%r6, 0(%r6)
	stfs	%f1, 0(%r6)	# float
	stfs	%f2, 4(%r6)	# float
	stfs	%f0, 8(%r6)	# float
	addi	%r6, %r5, 40
	addi	%r31, %r0, 2	# li
	slw	%r6, %r6, %r31
	add %r31, %r2, %r6
	lwz %r6, 0(%r31)
	lwz	%r6, 0(%r6)
	fneg	%f3, %f2
	stfs	%f1, 0(%r6)	# float
	stfs	%f0, 4(%r6)	# float
	stfs	%f3, 8(%r6)	# float
	addi	%r6, %r5, 80
	addi	%r31, %r0, 2	# li
	slw	%r6, %r6, %r31
	add %r31, %r2, %r6
	lwz %r6, 0(%r31)
	lwz	%r6, 0(%r6)
	fneg	%f3, %f1
	fneg	%f4, %f2
	stfs	%f0, 0(%r6)	# float
	stfs	%f3, 4(%r6)	# float
	stfs	%f4, 8(%r6)	# float
	addi	%r6, %r5, 1
	addi	%r31, %r0, 2	# li
	slw	%r6, %r6, %r31
	add %r31, %r2, %r6
	lwz %r6, 0(%r31)
	lwz	%r6, 0(%r6)
	fneg	%f3, %f1
	fneg	%f4, %f2
	fneg	%f5, %f0
	stfs	%f3, 0(%r6)	# float
	stfs	%f4, 4(%r6)	# float
	stfs	%f5, 8(%r6)	# float
	addi	%r6, %r5, 41
	addi	%r31, %r0, 2	# li
	slw	%r6, %r6, %r31
	add %r31, %r2, %r6
	lwz %r6, 0(%r31)
	lwz	%r6, 0(%r6)
	fneg	%f3, %f1
	fneg	%f4, %f0
	stfs	%f3, 0(%r6)	# float
	stfs	%f4, 4(%r6)	# float
	stfs	%f2, 8(%r6)	# float
	addi	%r5, %r5, 81
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	add %r31, %r2, %r5
	lwz %r2, 0(%r31)
	lwz	%r2, 0(%r2)
	fneg	%f0, %f0
	stfs	%f0, 0(%r2)	# float
	stfs	%f1, 4(%r2)	# float
	stfs	%f2, 8(%r2)	# float
	blr
bge_else.25535:
	fmul	%f0, %f1, %f1
	addis	%r31, %r0, (l.18957)@h	# lis
	ori	%r31, %r31, (l.18957)@l
	lfs	%f1, 0(%r31)	# float
	fadd	%f1, %f0, %f1
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f0, 0(%r31)	# float
	fdiv	%f5, %f1, %f0
	fadd	%f5, %f0, %f5
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f6, 0(%r31)	# float
	fdiv	%f5, %f5, %f6
	fsub	%f0, %f5, %f0
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f6, 0(%r31)	# float
	fcmpu	%cr7, %f6, %f0
	bgt	%cr7, ble_else.25546
	b	ble_cont.25547
ble_else.25546:
	fneg	%f0, %f0
ble_cont.25547:
	stw	%r6, 0(%r3)
	stw	%r5, 8(%r3)
	stw	%r29, 32(%r3)
	stfs	%f3, 40(%r3)	# float
	stw	%r7, 48(%r3)
	stfs	%f4, 56(%r3)	# float
	stw	%r2, 64(%r3)
	stfs	%f2, 72(%r3)	# float
	fcmpu	%cr7, %f4, %f0
	bgt	%cr7, ble_else.25551
	mflr	%r31	
	or	%r29, %r7, %r7	# mr %r29, %r7
	fmr	%f0, %f5
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	b	ble_cont.25552
ble_else.25551:
	fmr	%f0, %f5
ble_cont.25552:
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f1, %f1, %f0
	stfs	%f0, 80(%r3)	# float
	mflr	%r31	
	fmr	%f0, %f1
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	bl	atan.2817
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
	lfs	%f1, 72(%r3)	# float
	fmul	%f0, %f0, %f1
	stfs	%f0, 88(%r3)	# float
	mflr	%r31	
	stw	%r31, 96(%r3)
	addi	%r3, %r3, 100
	bl	sin.2811
	addi	%r3, %r3, -100	# subi
	lwz	%r31, 96(%r3)
	mtlr	%r31	
	lfs	%f1, 88(%r3)	# float
	stfs	%f0, 96(%r3)	# float
	mflr	%r31	
	fmr	%f0, %f1
	stw	%r31, 104(%r3)
	addi	%r3, %r3, 108
	bl	cos.2813
	addi	%r3, %r3, -108	# subi
	lwz	%r31, 104(%r3)
	mtlr	%r31	
	lfs	%f1, 96(%r3)	# float
	fdiv	%f0, %f1, %f0
	lfs	%f1, 80(%r3)	# float
	fmul	%f0, %f0, %f1
	lwz	%r2, 64(%r3)
	addi	%r2, %r2, 1
	fmul	%f1, %f0, %f0
	addis	%r31, %r0, (l.18957)@h	# lis
	ori	%r31, %r31, (l.18957)@l
	lfs	%f2, 0(%r31)	# float
	fadd	%f1, %f1, %f2
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f2, 0(%r31)	# float
	fdiv	%f3, %f1, %f2
	fadd	%f3, %f2, %f3
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f4, 0(%r31)	# float
	fdiv	%f3, %f3, %f4
	fsub	%f2, %f3, %f2
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	fcmpu	%cr7, %f4, %f2
	bgt	%cr7, ble_else.25553
	b	ble_cont.25554
ble_else.25553:
	fneg	%f2, %f2
ble_cont.25554:
	lfs	%f4, 56(%r3)	# float
	stfs	%f0, 104(%r3)	# float
	stw	%r2, 112(%r3)
	fcmpu	%cr7, %f4, %f2
	bgt	%cr7, ble_else.25555
	lwz	%r29, 48(%r3)
	mflr	%r31	
	fmr	%f0, %f3
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtlr	%r31	
	b	ble_cont.25556
ble_else.25555:
	fmr	%f0, %f3
ble_cont.25556:
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f1, 0(%r31)	# float
	fdiv	%f1, %f1, %f0
	stfs	%f0, 120(%r3)	# float
	mflr	%r31	
	fmr	%f0, %f1
	stw	%r31, 128(%r3)
	addi	%r3, %r3, 132
	bl	atan.2817
	addi	%r3, %r3, -132	# subi
	lwz	%r31, 128(%r3)
	mtlr	%r31	
	lfs	%f1, 40(%r3)	# float
	fmul	%f0, %f0, %f1
	stfs	%f0, 128(%r3)	# float
	mflr	%r31	
	stw	%r31, 136(%r3)
	addi	%r3, %r3, 140
	bl	sin.2811
	addi	%r3, %r3, -140	# subi
	lwz	%r31, 136(%r3)
	mtlr	%r31	
	lfs	%f1, 128(%r3)	# float
	stfs	%f0, 136(%r3)	# float
	mflr	%r31	
	fmr	%f0, %f1
	stw	%r31, 144(%r3)
	addi	%r3, %r3, 148
	bl	cos.2813
	addi	%r3, %r3, -148	# subi
	lwz	%r31, 144(%r3)
	mtlr	%r31	
	lfs	%f1, 136(%r3)	# float
	fdiv	%f0, %f1, %f0
	lfs	%f1, 120(%r3)	# float
	fmul	%f1, %f0, %f1
	lfs	%f0, 104(%r3)	# float
	lfs	%f2, 72(%r3)	# float
	lfs	%f3, 40(%r3)	# float
	lwz	%r2, 112(%r3)
	lwz	%r5, 8(%r3)
	lwz	%r6, 0(%r3)
	lwz	%r29, 32(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
calc_dirvecs.3331:
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25558
	stw	%r29, 0(%r3)
	stw	%r2, 4(%r3)
	stfs	%f0, 8(%r3)	# float
	stw	%r6, 16(%r3)
	stw	%r5, 20(%r3)
	stw	%r7, 24(%r3)
	mflr	%r31	
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	float_of_int.2840
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.19697)@h	# lis
	ori	%r31, %r31, (l.19697)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f2, %f0, %f1
	addi	%r2, %r0, 0	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	lfs	%f3, 8(%r3)	# float
	lwz	%r5, 20(%r3)
	lwz	%r6, 16(%r3)
	lwz	%r29, 24(%r3)
	mflr	%r31	
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	lwz	%r2, 4(%r3)
	mflr	%r31	
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	float_of_int.2840
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.18957)@h	# lis
	ori	%r31, %r31, (l.18957)@l
	lfs	%f1, 0(%r31)	# float
	fadd	%f2, %f0, %f1
	addi	%r2, %r0, 0	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	lwz	%r5, 16(%r3)
	addi	%r6, %r5, 2
	lfs	%f3, 8(%r3)	# float
	lwz	%r7, 20(%r3)
	lwz	%r29, 24(%r3)
	mflr	%r31	
	or	%r5, %r7, %r7	# mr %r5, %r7
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lwz	%r5, 20(%r3)
	addi	%r5, %r5, 1
	cmpwi	%cr7, %r5, 5
	blt	%cr7, bge_else.25559
	addi	%r5, %r5, -5	# subi %r5, %r5, 5
	b	bge_cont.25560
bge_else.25559:
bge_cont.25560:
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25561
	stw	%r2, 28(%r3)
	stw	%r5, 32(%r3)
	mflr	%r31	
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	float_of_int.2840
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.19697)@h	# lis
	ori	%r31, %r31, (l.19697)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f2, %f0, %f1
	addi	%r2, %r0, 0	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	lfs	%f3, 8(%r3)	# float
	lwz	%r5, 32(%r3)
	lwz	%r6, 16(%r3)
	lwz	%r29, 24(%r3)
	mflr	%r31	
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	lwz	%r2, 28(%r3)
	mflr	%r31	
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	float_of_int.2840
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.18957)@h	# lis
	ori	%r31, %r31, (l.18957)@l
	lfs	%f1, 0(%r31)	# float
	fadd	%f2, %f0, %f1
	addi	%r2, %r0, 0	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	lwz	%r5, 16(%r3)
	addi	%r6, %r5, 2
	lfs	%f3, 8(%r3)	# float
	lwz	%r7, 32(%r3)
	lwz	%r29, 24(%r3)
	mflr	%r31	
	or	%r5, %r7, %r7	# mr %r5, %r7
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	lwz	%r2, 28(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lwz	%r5, 32(%r3)
	addi	%r5, %r5, 1
	cmpwi	%cr7, %r5, 5
	blt	%cr7, bge_else.25562
	addi	%r5, %r5, -5	# subi %r5, %r5, 5
	b	bge_cont.25563
bge_else.25562:
bge_cont.25563:
	lfs	%f0, 8(%r3)	# float
	lwz	%r6, 16(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
bge_else.25561:
	blr
bge_else.25558:
	blr
calc_dirvec_rows.3336:
	lwz	%r7, 8(%r29)
	lwz	%r8, 4(%r29)
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25566
	stw	%r29, 0(%r3)
	stw	%r2, 4(%r3)
	stw	%r7, 8(%r3)
	stw	%r6, 12(%r3)
	stw	%r5, 16(%r3)
	stw	%r8, 20(%r3)
	mflr	%r31	
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	bl	float_of_int.2840
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	mtlr	%r31	
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.19697)@h	# lis
	ori	%r31, %r31, (l.19697)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	addi	%r2, %r0, 4	# li
	stw	%r2, 24(%r3)
	stfs	%f0, 32(%r3)	# float
	mflr	%r31	
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	bl	float_of_int.2840
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.19697)@h	# lis
	ori	%r31, %r31, (l.19697)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f2, %f0, %f1
	addi	%r2, %r0, 0	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	lfs	%f3, 32(%r3)	# float
	lwz	%r5, 16(%r3)
	lwz	%r6, 12(%r3)
	lwz	%r29, 20(%r3)
	mflr	%r31	
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
	lwz	%r2, 24(%r3)
	mflr	%r31	
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	bl	float_of_int.2840
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.18957)@h	# lis
	ori	%r31, %r31, (l.18957)@l
	lfs	%f1, 0(%r31)	# float
	fadd	%f2, %f0, %f1
	addi	%r2, %r0, 0	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f1, 0(%r31)	# float
	lwz	%r5, 12(%r3)
	addi	%r6, %r5, 2
	lfs	%f3, 32(%r3)	# float
	lwz	%r7, 16(%r3)
	lwz	%r29, 20(%r3)
	mflr	%r31	
	or	%r5, %r7, %r7	# mr %r5, %r7
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 3	# li
	lwz	%r5, 16(%r3)
	addi	%r6, %r5, 1
	cmpwi	%cr7, %r6, 5
	blt	%cr7, bge_else.25568
	addi	%r6, %r6, -5	# subi %r6, %r6, 5
	b	bge_cont.25569
bge_else.25568:
bge_cont.25569:
	lfs	%f0, 32(%r3)	# float
	lwz	%r7, 12(%r3)
	lwz	%r29, 8(%r3)
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	or	%r6, %r7, %r7	# mr %r6, %r7
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lwz	%r5, 16(%r3)
	addi	%r5, %r5, 2
	cmpwi	%cr7, %r5, 5
	blt	%cr7, bge_else.25570
	addi	%r5, %r5, -5	# subi %r5, %r5, 5
	b	bge_cont.25571
bge_else.25570:
bge_cont.25571:
	lwz	%r6, 12(%r3)
	addi	%r6, %r6, 4
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25572
	stw	%r2, 40(%r3)
	stw	%r6, 44(%r3)
	stw	%r5, 48(%r3)
	mflr	%r31	
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	float_of_int.2840
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
	addis	%r31, %r0, (l.18106)@h	# lis
	ori	%r31, %r31, (l.18106)@l
	lfs	%f1, 0(%r31)	# float
	fmul	%f0, %f0, %f1
	addis	%r31, %r0, (l.19697)@h	# lis
	ori	%r31, %r31, (l.19697)@l
	lfs	%f1, 0(%r31)	# float
	fsub	%f0, %f0, %f1
	addi	%r2, %r0, 4	# li
	lwz	%r5, 48(%r3)
	lwz	%r6, 44(%r3)
	lwz	%r29, 8(%r3)
	mflr	%r31	
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
	lwz	%r2, 40(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lwz	%r5, 48(%r3)
	addi	%r5, %r5, 2
	cmpwi	%cr7, %r5, 5
	blt	%cr7, bge_else.25573
	addi	%r5, %r5, -5	# subi %r5, %r5, 5
	b	bge_cont.25574
bge_else.25573:
bge_cont.25574:
	lwz	%r6, 44(%r3)
	addi	%r6, %r6, 4
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
bge_else.25572:
	blr
bge_else.25566:
	blr
create_dirvec_elements.3342:
	lwz	%r6, 4(%r29)
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.25577
	addi	%r7, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r29, 0(%r3)
	stw	%r2, 4(%r3)
	stw	%r5, 8(%r3)
	stw	%r6, 12(%r3)
	mflr	%r31	
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	bl	min_caml_create_float_array
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 12(%r3)
	lwz	%r6, 0(%r2)
	stw	%r5, 16(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_create_array
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r5)
	lwz	%r2, 16(%r3)
	stw	%r2, 0(%r5)
	or	%r2, %r5, %r5	# mr %r2, %r5
	lwz	%r5, 8(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 4(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25578
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 20(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	bl	min_caml_create_float_array
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 12(%r3)
	lwz	%r6, 0(%r2)
	stw	%r5, 24(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r5)
	lwz	%r2, 24(%r3)
	stw	%r2, 0(%r5)
	or	%r2, %r5, %r5	# mr %r2, %r5
	lwz	%r5, 20(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 4(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25579
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 28(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	bl	min_caml_create_float_array
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 12(%r3)
	lwz	%r6, 0(%r2)
	stw	%r5, 32(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_create_array
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r5)
	lwz	%r2, 32(%r3)
	stw	%r2, 0(%r5)
	or	%r2, %r5, %r5	# mr %r2, %r5
	lwz	%r5, 28(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 4(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25580
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 36(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	bl	min_caml_create_float_array
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 12(%r3)
	lwz	%r2, 0(%r2)
	stw	%r5, 40(%r3)
	mflr	%r31	
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_create_array
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r5)
	lwz	%r2, 40(%r3)
	stw	%r2, 0(%r5)
	or	%r2, %r5, %r5	# mr %r2, %r5
	lwz	%r5, 36(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 4(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r29, 0(%r3)
	or	%r2, %r7, %r7	# mr %r2, %r7
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
bge_else.25580:
	blr
bge_else.25579:
	blr
bge_else.25578:
	blr
bge_else.25577:
	blr
create_dirvecs.3345:
	lwz	%r5, 12(%r29)
	lwz	%r6, 8(%r29)
	lwz	%r7, 4(%r29)
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25585
	addi	%r8, %r0, 120	# li
	addi	%r9, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r29, 0(%r3)
	stw	%r7, 4(%r3)
	stw	%r6, 8(%r3)
	stw	%r2, 12(%r3)
	stw	%r8, 16(%r3)
	stw	%r5, 20(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	bl	min_caml_create_float_array
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 20(%r3)
	lwz	%r6, 0(%r2)
	stw	%r5, 24(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r5)
	lwz	%r2, 24(%r3)
	stw	%r2, 0(%r5)
	lwz	%r2, 16(%r3)
	mflr	%r31	
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	lwz	%r5, 12(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 8(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	addi	%r31, %r0, 2	# li
	slw	%r2, %r5, %r31
	add %r31, %r7, %r2
	lwz %r2, 0(%r31)
	addi	%r6, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 28(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	bl	min_caml_create_float_array
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 20(%r3)
	lwz	%r6, 0(%r2)
	stw	%r5, 32(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_create_array
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r5)
	lwz	%r2, 32(%r3)
	stw	%r2, 0(%r5)
	or	%r2, %r5, %r5	# mr %r2, %r5
	lwz	%r5, 28(%r3)
	stw	%r2, 472(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_create_float_array
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 20(%r3)
	lwz	%r6, 0(%r2)
	stw	%r5, 36(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	bl	min_caml_create_array
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r5)
	lwz	%r2, 36(%r3)
	stw	%r2, 0(%r5)
	or	%r2, %r5, %r5	# mr %r2, %r5
	lwz	%r5, 28(%r3)
	stw	%r2, 468(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 40(%r3)
	addi	%r3, %r3, 44
	bl	min_caml_create_float_array
	addi	%r3, %r3, -44	# subi
	lwz	%r31, 40(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 20(%r3)
	lwz	%r6, 0(%r2)
	stw	%r5, 40(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_create_array
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r5)
	lwz	%r2, 40(%r3)
	stw	%r2, 0(%r5)
	or	%r2, %r5, %r5	# mr %r2, %r5
	lwz	%r5, 28(%r3)
	stw	%r2, 464(%r5)
	addi	%r2, %r0, 115	# li
	lwz	%r29, 4(%r3)
	mflr	%r31	
	or	%r28, %r5, %r5	# mr %r28, %r5
	or	%r5, %r2, %r2	# mr %r5, %r2
	or	%r2, %r28, %r28	# mr %r2, %r28
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	lwz	%r2, 12(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25586
	addi	%r5, %r0, 120	# li
	addi	%r6, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 44(%r3)
	stw	%r5, 48(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	min_caml_create_float_array
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 20(%r3)
	lwz	%r6, 0(%r2)
	stw	%r5, 52(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 56(%r3)
	addi	%r3, %r3, 60
	bl	min_caml_create_array
	addi	%r3, %r3, -60	# subi
	lwz	%r31, 56(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r5)
	lwz	%r2, 52(%r3)
	stw	%r2, 0(%r5)
	lwz	%r2, 48(%r3)
	mflr	%r31	
	stw	%r31, 56(%r3)
	addi	%r3, %r3, 60
	bl	min_caml_create_array
	addi	%r3, %r3, -60	# subi
	lwz	%r31, 56(%r3)
	mtlr	%r31	
	lwz	%r5, 44(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 8(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	addi	%r31, %r0, 2	# li
	slw	%r2, %r5, %r31
	add %r31, %r7, %r2
	lwz %r2, 0(%r31)
	addi	%r6, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 56(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	min_caml_create_float_array
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 20(%r3)
	lwz	%r6, 0(%r2)
	stw	%r5, 60(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 64(%r3)
	addi	%r3, %r3, 68
	bl	min_caml_create_array
	addi	%r3, %r3, -68	# subi
	lwz	%r31, 64(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r5)
	lwz	%r2, 60(%r3)
	stw	%r2, 0(%r5)
	or	%r2, %r5, %r5	# mr %r2, %r5
	lwz	%r5, 56(%r3)
	stw	%r2, 472(%r5)
	addi	%r2, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	mflr	%r31	
	stw	%r31, 64(%r3)
	addi	%r3, %r3, 68
	bl	min_caml_create_float_array
	addi	%r3, %r3, -68	# subi
	lwz	%r31, 64(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 20(%r3)
	lwz	%r2, 0(%r2)
	stw	%r5, 64(%r3)
	mflr	%r31	
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	min_caml_create_array
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r5)
	lwz	%r2, 64(%r3)
	stw	%r2, 0(%r5)
	or	%r2, %r5, %r5	# mr %r2, %r5
	lwz	%r5, 56(%r3)
	stw	%r2, 468(%r5)
	addi	%r2, %r0, 116	# li
	lwz	%r29, 4(%r3)
	mflr	%r31	
	or	%r28, %r5, %r5	# mr %r28, %r5
	or	%r5, %r2, %r2	# mr %r5, %r2
	or	%r2, %r28, %r28	# mr %r2, %r28
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtlr	%r31	
	lwz	%r2, 44(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
bge_else.25586:
	blr
bge_else.25585:
	blr
init_dirvec_constants.3347:
	lwz	%r6, 12(%r29)
	lwz	%r7, 8(%r29)
	lwz	%r8, 4(%r29)
	cmpwi	%cr7, %r5, 0
	blt	%cr7, bge_else.25589
	addi	%r31, %r0, 2	# li
	slw	%r9, %r5, %r31
	add %r31, %r2, %r9
	lwz %r9, 0(%r31)
	lwz	%r10, 0(%r7)
	addi	%r10, %r10, -1	# subi %r10, %r10, 1
	stw	%r29, 0(%r3)
	stw	%r8, 4(%r3)
	stw	%r6, 8(%r3)
	stw	%r7, 12(%r3)
	stw	%r2, 16(%r3)
	stw	%r5, 20(%r3)
	cmpwi	%cr7, %r10, 0
	blt	%cr7, bge_else.25590
	addi	%r31, %r0, 2	# li
	slw	%r11, %r10, %r31
	add %r31, %r6, %r11
	lwz %r11, 0(%r31)
	lwz	%r12, 4(%r9)
	lwz	%r13, 0(%r9)
	lwz	%r14, 4(%r11)
	stw	%r9, 24(%r3)
	cmpwi	%cr7, %r14, 1
	bne	%cr7, beq_else.25592
	stw	%r12, 28(%r3)
	stw	%r10, 32(%r3)
	mflr	%r31	
	or	%r5, %r11, %r11	# mr %r5, %r11
	or	%r2, %r13, %r13	# mr %r2, %r13
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	setup_rect_table.3120
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	lwz	%r5, 32(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 28(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25593
beq_else.25592:
	cmpwi	%cr7, %r14, 2
	bne	%cr7, beq_else.25594
	stw	%r12, 28(%r3)
	stw	%r10, 32(%r3)
	mflr	%r31	
	or	%r5, %r11, %r11	# mr %r5, %r11
	or	%r2, %r13, %r13	# mr %r2, %r13
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	setup_surface_table.3123
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	lwz	%r5, 32(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 28(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25595
beq_else.25594:
	stw	%r12, 28(%r3)
	stw	%r10, 32(%r3)
	mflr	%r31	
	or	%r5, %r11, %r11	# mr %r5, %r11
	or	%r2, %r13, %r13	# mr %r2, %r13
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	setup_second_table.3126
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	lwz	%r5, 32(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 28(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25595:
beq_cont.25593:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25596
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 8(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 24(%r3)
	lwz	%r8, 4(%r7)
	lwz	%r9, 0(%r7)
	lwz	%r10, 4(%r5)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.25598
	stw	%r8, 36(%r3)
	stw	%r2, 40(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	setup_rect_table.3120
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	lwz	%r5, 40(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 36(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25599
beq_else.25598:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.25600
	stw	%r8, 36(%r3)
	stw	%r2, 40(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	setup_surface_table.3123
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	lwz	%r5, 40(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 36(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25601
beq_else.25600:
	stw	%r8, 36(%r3)
	stw	%r2, 40(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	setup_second_table.3126
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	lwz	%r5, 40(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 36(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25601:
beq_cont.25599:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 24(%r3)
	lwz	%r29, 4(%r3)
	mflr	%r31	
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	b	bge_cont.25597
bge_else.25596:
bge_cont.25597:
	b	bge_cont.25591
bge_else.25590:
bge_cont.25591:
	lwz	%r2, 20(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25602
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 16(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 12(%r3)
	lwz	%r8, 0(%r7)
	addi	%r8, %r8, -1	# subi %r8, %r8, 1
	stw	%r2, 44(%r3)
	cmpwi	%cr7, %r8, 0
	blt	%cr7, bge_else.25603
	addi	%r31, %r0, 2	# li
	slw	%r9, %r8, %r31
	lwz	%r10, 8(%r3)
	add %r31, %r10, %r9
	lwz %r9, 0(%r31)
	lwz	%r11, 4(%r5)
	lwz	%r12, 0(%r5)
	lwz	%r13, 4(%r9)
	stw	%r5, 48(%r3)
	cmpwi	%cr7, %r13, 1
	bne	%cr7, beq_else.25605
	stw	%r11, 52(%r3)
	stw	%r8, 56(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r12, %r12	# mr %r2, %r12
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	setup_rect_table.3120
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtlr	%r31	
	lwz	%r5, 56(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 52(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25606
beq_else.25605:
	cmpwi	%cr7, %r13, 2
	bne	%cr7, beq_else.25607
	stw	%r11, 52(%r3)
	stw	%r8, 56(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r12, %r12	# mr %r2, %r12
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	setup_surface_table.3123
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtlr	%r31	
	lwz	%r5, 56(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 52(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25608
beq_else.25607:
	stw	%r11, 52(%r3)
	stw	%r8, 56(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r12, %r12	# mr %r2, %r12
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	setup_second_table.3126
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtlr	%r31	
	lwz	%r5, 56(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 52(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25608:
beq_cont.25606:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25609
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 8(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 48(%r3)
	lwz	%r8, 4(%r7)
	lwz	%r9, 0(%r7)
	lwz	%r10, 4(%r5)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.25611
	stw	%r8, 60(%r3)
	stw	%r2, 64(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	setup_rect_table.3120
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtlr	%r31	
	lwz	%r5, 64(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 60(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25612
beq_else.25611:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.25613
	stw	%r8, 60(%r3)
	stw	%r2, 64(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	setup_surface_table.3123
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtlr	%r31	
	lwz	%r5, 64(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 60(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25614
beq_else.25613:
	stw	%r8, 60(%r3)
	stw	%r2, 64(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	setup_second_table.3126
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtlr	%r31	
	lwz	%r5, 64(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 60(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25614:
beq_cont.25612:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25615
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 8(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 48(%r3)
	lwz	%r8, 4(%r7)
	lwz	%r9, 0(%r7)
	lwz	%r10, 4(%r5)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.25617
	stw	%r8, 68(%r3)
	stw	%r2, 72(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	setup_rect_table.3120
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtlr	%r31	
	lwz	%r5, 72(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 68(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25618
beq_else.25617:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.25619
	stw	%r8, 68(%r3)
	stw	%r2, 72(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	setup_surface_table.3123
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtlr	%r31	
	lwz	%r5, 72(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 68(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25620
beq_else.25619:
	stw	%r8, 68(%r3)
	stw	%r2, 72(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	setup_second_table.3126
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtlr	%r31	
	lwz	%r5, 72(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 68(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25620:
beq_cont.25618:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 48(%r3)
	lwz	%r29, 4(%r3)
	mflr	%r31	
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtlr	%r31	
	b	bge_cont.25616
bge_else.25615:
bge_cont.25616:
	b	bge_cont.25610
bge_else.25609:
bge_cont.25610:
	b	bge_cont.25604
bge_else.25603:
bge_cont.25604:
	lwz	%r2, 44(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25621
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 16(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 12(%r3)
	lwz	%r8, 0(%r7)
	addi	%r8, %r8, -1	# subi %r8, %r8, 1
	stw	%r2, 76(%r3)
	cmpwi	%cr7, %r8, 0
	blt	%cr7, bge_else.25622
	addi	%r31, %r0, 2	# li
	slw	%r9, %r8, %r31
	lwz	%r10, 8(%r3)
	add %r31, %r10, %r9
	lwz %r9, 0(%r31)
	lwz	%r11, 4(%r5)
	lwz	%r12, 0(%r5)
	lwz	%r13, 4(%r9)
	stw	%r5, 80(%r3)
	cmpwi	%cr7, %r13, 1
	bne	%cr7, beq_else.25624
	stw	%r11, 84(%r3)
	stw	%r8, 88(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r12, %r12	# mr %r2, %r12
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	setup_rect_table.3120
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtlr	%r31	
	lwz	%r5, 88(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 84(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25625
beq_else.25624:
	cmpwi	%cr7, %r13, 2
	bne	%cr7, beq_else.25626
	stw	%r11, 84(%r3)
	stw	%r8, 88(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r12, %r12	# mr %r2, %r12
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	setup_surface_table.3123
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtlr	%r31	
	lwz	%r5, 88(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 84(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25627
beq_else.25626:
	stw	%r11, 84(%r3)
	stw	%r8, 88(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r12, %r12	# mr %r2, %r12
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	setup_second_table.3126
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtlr	%r31	
	lwz	%r5, 88(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 84(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25627:
beq_cont.25625:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25628
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 8(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 80(%r3)
	lwz	%r8, 4(%r7)
	lwz	%r9, 0(%r7)
	lwz	%r10, 4(%r5)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.25630
	stw	%r8, 92(%r3)
	stw	%r2, 96(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	setup_rect_table.3120
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtlr	%r31	
	lwz	%r5, 96(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 92(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25631
beq_else.25630:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.25632
	stw	%r8, 92(%r3)
	stw	%r2, 96(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	setup_surface_table.3123
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtlr	%r31	
	lwz	%r5, 96(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 92(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25633
beq_else.25632:
	stw	%r8, 92(%r3)
	stw	%r2, 96(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	setup_second_table.3126
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtlr	%r31	
	lwz	%r5, 96(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 92(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25633:
beq_cont.25631:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 80(%r3)
	lwz	%r29, 4(%r3)
	mflr	%r31	
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtlr	%r31	
	b	bge_cont.25629
bge_else.25628:
bge_cont.25629:
	b	bge_cont.25623
bge_else.25622:
bge_cont.25623:
	lwz	%r2, 76(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25634
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 16(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 12(%r3)
	lwz	%r7, 0(%r7)
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	stw	%r2, 100(%r3)
	cmpwi	%cr7, %r7, 0
	blt	%cr7, bge_else.25635
	addi	%r31, %r0, 2	# li
	slw	%r8, %r7, %r31
	lwz	%r9, 8(%r3)
	add %r31, %r9, %r8
	lwz %r8, 0(%r31)
	lwz	%r10, 4(%r5)
	lwz	%r11, 0(%r5)
	lwz	%r12, 4(%r8)
	stw	%r5, 104(%r3)
	cmpwi	%cr7, %r12, 1
	bne	%cr7, beq_else.25637
	stw	%r10, 108(%r3)
	stw	%r7, 112(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r11, %r11	# mr %r2, %r11
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	setup_rect_table.3120
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtlr	%r31	
	lwz	%r5, 112(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 108(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25638
beq_else.25637:
	cmpwi	%cr7, %r12, 2
	bne	%cr7, beq_else.25639
	stw	%r10, 108(%r3)
	stw	%r7, 112(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r11, %r11	# mr %r2, %r11
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	setup_surface_table.3123
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtlr	%r31	
	lwz	%r5, 112(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 108(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25640
beq_else.25639:
	stw	%r10, 108(%r3)
	stw	%r7, 112(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r11, %r11	# mr %r2, %r11
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	setup_second_table.3126
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtlr	%r31	
	lwz	%r5, 112(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 108(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25640:
beq_cont.25638:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25641
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 8(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 104(%r3)
	lwz	%r8, 4(%r7)
	lwz	%r9, 0(%r7)
	lwz	%r10, 4(%r5)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.25643
	stw	%r8, 116(%r3)
	stw	%r2, 120(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	setup_rect_table.3120
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtlr	%r31	
	lwz	%r5, 120(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 116(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25644
beq_else.25643:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.25645
	stw	%r8, 116(%r3)
	stw	%r2, 120(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	setup_surface_table.3123
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtlr	%r31	
	lwz	%r5, 120(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 116(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25646
beq_else.25645:
	stw	%r8, 116(%r3)
	stw	%r2, 120(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	setup_second_table.3126
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtlr	%r31	
	lwz	%r5, 120(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 116(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25646:
beq_cont.25644:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25647
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 8(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r6, 104(%r3)
	lwz	%r7, 4(%r6)
	lwz	%r8, 0(%r6)
	lwz	%r9, 4(%r5)
	cmpwi	%cr7, %r9, 1
	bne	%cr7, beq_else.25649
	stw	%r7, 124(%r3)
	stw	%r2, 128(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	setup_rect_table.3120
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtlr	%r31	
	lwz	%r5, 128(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 124(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25650
beq_else.25649:
	cmpwi	%cr7, %r9, 2
	bne	%cr7, beq_else.25651
	stw	%r7, 124(%r3)
	stw	%r2, 128(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	setup_surface_table.3123
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtlr	%r31	
	lwz	%r5, 128(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 124(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25652
beq_else.25651:
	stw	%r7, 124(%r3)
	stw	%r2, 128(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	setup_second_table.3126
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtlr	%r31	
	lwz	%r5, 128(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 124(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25652:
beq_cont.25650:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 104(%r3)
	lwz	%r29, 4(%r3)
	mflr	%r31	
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtlr	%r31	
	b	bge_cont.25648
bge_else.25647:
bge_cont.25648:
	b	bge_cont.25642
bge_else.25641:
bge_cont.25642:
	b	bge_cont.25636
bge_else.25635:
bge_cont.25636:
	lwz	%r2, 100(%r3)
	addi	%r5, %r2, -1	# subi %r5, %r2, 1
	lwz	%r2, 16(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
bge_else.25634:
	blr
bge_else.25621:
	blr
bge_else.25602:
	blr
bge_else.25589:
	blr
init_vecset_constants.3350:
	lwz	%r5, 20(%r29)
	lwz	%r6, 16(%r29)
	lwz	%r7, 12(%r29)
	lwz	%r8, 8(%r29)
	lwz	%r9, 4(%r29)
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25657
	addi	%r31, %r0, 2	# li
	slw	%r10, %r2, %r31
	add %r31, %r9, %r10
	lwz %r10, 0(%r31)
	lwz	%r11, 476(%r10)
	lwz	%r12, 0(%r6)
	addi	%r12, %r12, -1	# subi %r12, %r12, 1
	stw	%r29, 0(%r3)
	stw	%r9, 4(%r3)
	stw	%r2, 8(%r3)
	stw	%r8, 12(%r3)
	stw	%r7, 16(%r3)
	stw	%r5, 20(%r3)
	stw	%r6, 24(%r3)
	stw	%r10, 28(%r3)
	cmpwi	%cr7, %r12, 0
	blt	%cr7, bge_else.25658
	addi	%r31, %r0, 2	# li
	slw	%r13, %r12, %r31
	add %r31, %r5, %r13
	lwz %r13, 0(%r31)
	lwz	%r14, 4(%r11)
	lwz	%r15, 0(%r11)
	lwz	%r16, 4(%r13)
	stw	%r11, 32(%r3)
	cmpwi	%cr7, %r16, 1
	bne	%cr7, beq_else.25660
	stw	%r14, 36(%r3)
	stw	%r12, 40(%r3)
	mflr	%r31	
	or	%r5, %r13, %r13	# mr %r5, %r13
	or	%r2, %r15, %r15	# mr %r2, %r15
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	setup_rect_table.3120
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	lwz	%r5, 40(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 36(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25661
beq_else.25660:
	cmpwi	%cr7, %r16, 2
	bne	%cr7, beq_else.25662
	stw	%r14, 36(%r3)
	stw	%r12, 40(%r3)
	mflr	%r31	
	or	%r5, %r13, %r13	# mr %r5, %r13
	or	%r2, %r15, %r15	# mr %r2, %r15
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	setup_surface_table.3123
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	lwz	%r5, 40(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 36(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25663
beq_else.25662:
	stw	%r14, 36(%r3)
	stw	%r12, 40(%r3)
	mflr	%r31	
	or	%r5, %r13, %r13	# mr %r5, %r13
	or	%r2, %r15, %r15	# mr %r2, %r15
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	setup_second_table.3126
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	lwz	%r5, 40(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 36(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25663:
beq_cont.25661:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25664
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 20(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 32(%r3)
	lwz	%r8, 4(%r7)
	lwz	%r9, 0(%r7)
	lwz	%r10, 4(%r5)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.25666
	stw	%r8, 44(%r3)
	stw	%r2, 48(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	setup_rect_table.3120
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
	lwz	%r5, 48(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 44(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25667
beq_else.25666:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.25668
	stw	%r8, 44(%r3)
	stw	%r2, 48(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	setup_surface_table.3123
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
	lwz	%r5, 48(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 44(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25669
beq_else.25668:
	stw	%r8, 44(%r3)
	stw	%r2, 48(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	setup_second_table.3126
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
	lwz	%r5, 48(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 44(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25669:
beq_cont.25667:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25670
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 20(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 32(%r3)
	lwz	%r8, 4(%r7)
	lwz	%r9, 0(%r7)
	lwz	%r10, 4(%r5)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.25672
	stw	%r8, 52(%r3)
	stw	%r2, 56(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	setup_rect_table.3120
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtlr	%r31	
	lwz	%r5, 56(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 52(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25673
beq_else.25672:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.25674
	stw	%r8, 52(%r3)
	stw	%r2, 56(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	setup_surface_table.3123
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtlr	%r31	
	lwz	%r5, 56(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 52(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25675
beq_else.25674:
	stw	%r8, 52(%r3)
	stw	%r2, 56(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	setup_second_table.3126
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtlr	%r31	
	lwz	%r5, 56(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 52(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25675:
beq_cont.25673:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 32(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtlr	%r31	
	b	bge_cont.25671
bge_else.25670:
bge_cont.25671:
	b	bge_cont.25665
bge_else.25664:
bge_cont.25665:
	b	bge_cont.25659
bge_else.25658:
bge_cont.25659:
	lwz	%r2, 28(%r3)
	lwz	%r5, 472(%r2)
	lwz	%r6, 24(%r3)
	lwz	%r7, 0(%r6)
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	cmpwi	%cr7, %r7, 0
	blt	%cr7, bge_else.25676
	addi	%r31, %r0, 2	# li
	slw	%r8, %r7, %r31
	lwz	%r9, 20(%r3)
	add %r31, %r9, %r8
	lwz %r8, 0(%r31)
	lwz	%r10, 4(%r5)
	lwz	%r11, 0(%r5)
	lwz	%r12, 4(%r8)
	stw	%r5, 60(%r3)
	cmpwi	%cr7, %r12, 1
	bne	%cr7, beq_else.25678
	stw	%r10, 64(%r3)
	stw	%r7, 68(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r11, %r11	# mr %r2, %r11
	stw	%r31, 72(%r3)
	addi	%r3, %r3, 76
	bl	setup_rect_table.3120
	addi	%r3, %r3, -76	# subi
	lwz	%r31, 72(%r3)
	mtlr	%r31	
	lwz	%r5, 68(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 64(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25679
beq_else.25678:
	cmpwi	%cr7, %r12, 2
	bne	%cr7, beq_else.25680
	stw	%r10, 64(%r3)
	stw	%r7, 68(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r11, %r11	# mr %r2, %r11
	stw	%r31, 72(%r3)
	addi	%r3, %r3, 76
	bl	setup_surface_table.3123
	addi	%r3, %r3, -76	# subi
	lwz	%r31, 72(%r3)
	mtlr	%r31	
	lwz	%r5, 68(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 64(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25681
beq_else.25680:
	stw	%r10, 64(%r3)
	stw	%r7, 68(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r11, %r11	# mr %r2, %r11
	stw	%r31, 72(%r3)
	addi	%r3, %r3, 76
	bl	setup_second_table.3126
	addi	%r3, %r3, -76	# subi
	lwz	%r31, 72(%r3)
	mtlr	%r31	
	lwz	%r5, 68(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 64(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25681:
beq_cont.25679:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25682
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 20(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 60(%r3)
	lwz	%r8, 4(%r7)
	lwz	%r9, 0(%r7)
	lwz	%r10, 4(%r5)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.25684
	stw	%r8, 72(%r3)
	stw	%r2, 76(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	bl	setup_rect_table.3120
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	lwz	%r5, 76(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 72(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25685
beq_else.25684:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.25686
	stw	%r8, 72(%r3)
	stw	%r2, 76(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	bl	setup_surface_table.3123
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	lwz	%r5, 76(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 72(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25687
beq_else.25686:
	stw	%r8, 72(%r3)
	stw	%r2, 76(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	bl	setup_second_table.3126
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	lwz	%r5, 76(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 72(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25687:
beq_cont.25685:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 60(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	b	bge_cont.25683
bge_else.25682:
bge_cont.25683:
	b	bge_cont.25677
bge_else.25676:
bge_cont.25677:
	lwz	%r2, 28(%r3)
	lwz	%r5, 468(%r2)
	lwz	%r6, 24(%r3)
	lwz	%r7, 0(%r6)
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	cmpwi	%cr7, %r7, 0
	blt	%cr7, bge_else.25688
	addi	%r31, %r0, 2	# li
	slw	%r8, %r7, %r31
	lwz	%r9, 20(%r3)
	add %r31, %r9, %r8
	lwz %r8, 0(%r31)
	lwz	%r10, 4(%r5)
	lwz	%r11, 0(%r5)
	lwz	%r12, 4(%r8)
	stw	%r5, 80(%r3)
	cmpwi	%cr7, %r12, 1
	bne	%cr7, beq_else.25690
	stw	%r10, 84(%r3)
	stw	%r7, 88(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r11, %r11	# mr %r2, %r11
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	setup_rect_table.3120
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtlr	%r31	
	lwz	%r5, 88(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 84(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25691
beq_else.25690:
	cmpwi	%cr7, %r12, 2
	bne	%cr7, beq_else.25692
	stw	%r10, 84(%r3)
	stw	%r7, 88(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r11, %r11	# mr %r2, %r11
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	setup_surface_table.3123
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtlr	%r31	
	lwz	%r5, 88(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 84(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25693
beq_else.25692:
	stw	%r10, 84(%r3)
	stw	%r7, 88(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r11, %r11	# mr %r2, %r11
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	setup_second_table.3126
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtlr	%r31	
	lwz	%r5, 88(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 84(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25693:
beq_cont.25691:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25694
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 20(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 80(%r3)
	lwz	%r8, 4(%r7)
	lwz	%r9, 0(%r7)
	lwz	%r10, 4(%r5)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.25696
	stw	%r8, 92(%r3)
	stw	%r2, 96(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	setup_rect_table.3120
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtlr	%r31	
	lwz	%r5, 96(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 92(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25697
beq_else.25696:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.25698
	stw	%r8, 92(%r3)
	stw	%r2, 96(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	setup_surface_table.3123
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtlr	%r31	
	lwz	%r5, 96(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 92(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25699
beq_else.25698:
	stw	%r8, 92(%r3)
	stw	%r2, 96(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	setup_second_table.3126
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtlr	%r31	
	lwz	%r5, 96(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 92(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25699:
beq_cont.25697:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25700
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 20(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 80(%r3)
	lwz	%r8, 4(%r7)
	lwz	%r9, 0(%r7)
	lwz	%r10, 4(%r5)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.25702
	stw	%r8, 100(%r3)
	stw	%r2, 104(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	setup_rect_table.3120
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtlr	%r31	
	lwz	%r5, 104(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 100(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25703
beq_else.25702:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.25704
	stw	%r8, 100(%r3)
	stw	%r2, 104(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	setup_surface_table.3123
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtlr	%r31	
	lwz	%r5, 104(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 100(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25705
beq_else.25704:
	stw	%r8, 100(%r3)
	stw	%r2, 104(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	setup_second_table.3126
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtlr	%r31	
	lwz	%r5, 104(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 100(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25705:
beq_cont.25703:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 80(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtlr	%r31	
	b	bge_cont.25701
bge_else.25700:
bge_cont.25701:
	b	bge_cont.25695
bge_else.25694:
bge_cont.25695:
	b	bge_cont.25689
bge_else.25688:
bge_cont.25689:
	addi	%r5, %r0, 116	# li
	lwz	%r2, 28(%r3)
	lwz	%r29, 12(%r3)
	mflr	%r31	
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtlr	%r31	
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25706
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 4(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 476(%r5)
	lwz	%r8, 24(%r3)
	lwz	%r9, 0(%r8)
	addi	%r9, %r9, -1	# subi %r9, %r9, 1
	stw	%r2, 108(%r3)
	stw	%r5, 112(%r3)
	cmpwi	%cr7, %r9, 0
	blt	%cr7, bge_else.25707
	addi	%r31, %r0, 2	# li
	slw	%r10, %r9, %r31
	lwz	%r11, 20(%r3)
	add %r31, %r11, %r10
	lwz %r10, 0(%r31)
	lwz	%r12, 4(%r7)
	lwz	%r13, 0(%r7)
	lwz	%r14, 4(%r10)
	stw	%r7, 116(%r3)
	cmpwi	%cr7, %r14, 1
	bne	%cr7, beq_else.25709
	stw	%r12, 120(%r3)
	stw	%r9, 124(%r3)
	mflr	%r31	
	or	%r5, %r10, %r10	# mr %r5, %r10
	or	%r2, %r13, %r13	# mr %r2, %r13
	stw	%r31, 128(%r3)
	addi	%r3, %r3, 132
	bl	setup_rect_table.3120
	addi	%r3, %r3, -132	# subi
	lwz	%r31, 128(%r3)
	mtlr	%r31	
	lwz	%r5, 124(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 120(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25710
beq_else.25709:
	cmpwi	%cr7, %r14, 2
	bne	%cr7, beq_else.25711
	stw	%r12, 120(%r3)
	stw	%r9, 124(%r3)
	mflr	%r31	
	or	%r5, %r10, %r10	# mr %r5, %r10
	or	%r2, %r13, %r13	# mr %r2, %r13
	stw	%r31, 128(%r3)
	addi	%r3, %r3, 132
	bl	setup_surface_table.3123
	addi	%r3, %r3, -132	# subi
	lwz	%r31, 128(%r3)
	mtlr	%r31	
	lwz	%r5, 124(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 120(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25712
beq_else.25711:
	stw	%r12, 120(%r3)
	stw	%r9, 124(%r3)
	mflr	%r31	
	or	%r5, %r10, %r10	# mr %r5, %r10
	or	%r2, %r13, %r13	# mr %r2, %r13
	stw	%r31, 128(%r3)
	addi	%r3, %r3, 132
	bl	setup_second_table.3126
	addi	%r3, %r3, -132	# subi
	lwz	%r31, 128(%r3)
	mtlr	%r31	
	lwz	%r5, 124(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 120(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25712:
beq_cont.25710:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25713
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 20(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 116(%r3)
	lwz	%r8, 4(%r7)
	lwz	%r9, 0(%r7)
	lwz	%r10, 4(%r5)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.25715
	stw	%r8, 128(%r3)
	stw	%r2, 132(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 136(%r3)
	addi	%r3, %r3, 140
	bl	setup_rect_table.3120
	addi	%r3, %r3, -140	# subi
	lwz	%r31, 136(%r3)
	mtlr	%r31	
	lwz	%r5, 132(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 128(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25716
beq_else.25715:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.25717
	stw	%r8, 128(%r3)
	stw	%r2, 132(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 136(%r3)
	addi	%r3, %r3, 140
	bl	setup_surface_table.3123
	addi	%r3, %r3, -140	# subi
	lwz	%r31, 136(%r3)
	mtlr	%r31	
	lwz	%r5, 132(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 128(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25718
beq_else.25717:
	stw	%r8, 128(%r3)
	stw	%r2, 132(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 136(%r3)
	addi	%r3, %r3, 140
	bl	setup_second_table.3126
	addi	%r3, %r3, -140	# subi
	lwz	%r31, 136(%r3)
	mtlr	%r31	
	lwz	%r5, 132(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 128(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25718:
beq_cont.25716:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 116(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 136(%r3)
	addi	%r3, %r3, 140
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -140	# subi
	lwz	%r31, 136(%r3)
	mtlr	%r31	
	b	bge_cont.25714
bge_else.25713:
bge_cont.25714:
	b	bge_cont.25708
bge_else.25707:
bge_cont.25708:
	lwz	%r2, 112(%r3)
	lwz	%r5, 472(%r2)
	lwz	%r6, 24(%r3)
	lwz	%r7, 0(%r6)
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	cmpwi	%cr7, %r7, 0
	blt	%cr7, bge_else.25719
	addi	%r31, %r0, 2	# li
	slw	%r8, %r7, %r31
	lwz	%r9, 20(%r3)
	add %r31, %r9, %r8
	lwz %r8, 0(%r31)
	lwz	%r10, 4(%r5)
	lwz	%r11, 0(%r5)
	lwz	%r12, 4(%r8)
	stw	%r5, 136(%r3)
	cmpwi	%cr7, %r12, 1
	bne	%cr7, beq_else.25721
	stw	%r10, 140(%r3)
	stw	%r7, 144(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r11, %r11	# mr %r2, %r11
	stw	%r31, 148(%r3)
	addi	%r3, %r3, 152
	bl	setup_rect_table.3120
	addi	%r3, %r3, -152	# subi
	lwz	%r31, 148(%r3)
	mtlr	%r31	
	lwz	%r5, 144(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 140(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25722
beq_else.25721:
	cmpwi	%cr7, %r12, 2
	bne	%cr7, beq_else.25723
	stw	%r10, 140(%r3)
	stw	%r7, 144(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r11, %r11	# mr %r2, %r11
	stw	%r31, 148(%r3)
	addi	%r3, %r3, 152
	bl	setup_surface_table.3123
	addi	%r3, %r3, -152	# subi
	lwz	%r31, 148(%r3)
	mtlr	%r31	
	lwz	%r5, 144(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 140(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25724
beq_else.25723:
	stw	%r10, 140(%r3)
	stw	%r7, 144(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r11, %r11	# mr %r2, %r11
	stw	%r31, 148(%r3)
	addi	%r3, %r3, 152
	bl	setup_second_table.3126
	addi	%r3, %r3, -152	# subi
	lwz	%r31, 148(%r3)
	mtlr	%r31	
	lwz	%r5, 144(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 140(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25724:
beq_cont.25722:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25725
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 20(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 136(%r3)
	lwz	%r8, 4(%r7)
	lwz	%r9, 0(%r7)
	lwz	%r10, 4(%r5)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.25727
	stw	%r8, 148(%r3)
	stw	%r2, 152(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 156(%r3)
	addi	%r3, %r3, 160
	bl	setup_rect_table.3120
	addi	%r3, %r3, -160	# subi
	lwz	%r31, 156(%r3)
	mtlr	%r31	
	lwz	%r5, 152(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 148(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25728
beq_else.25727:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.25729
	stw	%r8, 148(%r3)
	stw	%r2, 152(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 156(%r3)
	addi	%r3, %r3, 160
	bl	setup_surface_table.3123
	addi	%r3, %r3, -160	# subi
	lwz	%r31, 156(%r3)
	mtlr	%r31	
	lwz	%r5, 152(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 148(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25730
beq_else.25729:
	stw	%r8, 148(%r3)
	stw	%r2, 152(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 156(%r3)
	addi	%r3, %r3, 160
	bl	setup_second_table.3126
	addi	%r3, %r3, -160	# subi
	lwz	%r31, 156(%r3)
	mtlr	%r31	
	lwz	%r5, 152(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 148(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25730:
beq_cont.25728:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25731
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 20(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 136(%r3)
	lwz	%r8, 4(%r7)
	lwz	%r9, 0(%r7)
	lwz	%r10, 4(%r5)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.25733
	stw	%r8, 156(%r3)
	stw	%r2, 160(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 164(%r3)
	addi	%r3, %r3, 168
	bl	setup_rect_table.3120
	addi	%r3, %r3, -168	# subi
	lwz	%r31, 164(%r3)
	mtlr	%r31	
	lwz	%r5, 160(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 156(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25734
beq_else.25733:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.25735
	stw	%r8, 156(%r3)
	stw	%r2, 160(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 164(%r3)
	addi	%r3, %r3, 168
	bl	setup_surface_table.3123
	addi	%r3, %r3, -168	# subi
	lwz	%r31, 164(%r3)
	mtlr	%r31	
	lwz	%r5, 160(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 156(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25736
beq_else.25735:
	stw	%r8, 156(%r3)
	stw	%r2, 160(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 164(%r3)
	addi	%r3, %r3, 168
	bl	setup_second_table.3126
	addi	%r3, %r3, -168	# subi
	lwz	%r31, 164(%r3)
	mtlr	%r31	
	lwz	%r5, 160(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 156(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25736:
beq_cont.25734:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 136(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 164(%r3)
	addi	%r3, %r3, 168
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -168	# subi
	lwz	%r31, 164(%r3)
	mtlr	%r31	
	b	bge_cont.25732
bge_else.25731:
bge_cont.25732:
	b	bge_cont.25726
bge_else.25725:
bge_cont.25726:
	b	bge_cont.25720
bge_else.25719:
bge_cont.25720:
	addi	%r5, %r0, 117	# li
	lwz	%r2, 112(%r3)
	lwz	%r29, 12(%r3)
	mflr	%r31	
	stw	%r31, 164(%r3)
	addi	%r3, %r3, 168
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -168	# subi
	lwz	%r31, 164(%r3)
	mtlr	%r31	
	lwz	%r2, 108(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25737
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 4(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 476(%r5)
	lwz	%r8, 24(%r3)
	lwz	%r8, 0(%r8)
	addi	%r8, %r8, -1	# subi %r8, %r8, 1
	stw	%r2, 164(%r3)
	stw	%r5, 168(%r3)
	cmpwi	%cr7, %r8, 0
	blt	%cr7, bge_else.25738
	addi	%r31, %r0, 2	# li
	slw	%r9, %r8, %r31
	lwz	%r10, 20(%r3)
	add %r31, %r10, %r9
	lwz %r9, 0(%r31)
	lwz	%r11, 4(%r7)
	lwz	%r12, 0(%r7)
	lwz	%r13, 4(%r9)
	stw	%r7, 172(%r3)
	cmpwi	%cr7, %r13, 1
	bne	%cr7, beq_else.25740
	stw	%r11, 176(%r3)
	stw	%r8, 180(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r12, %r12	# mr %r2, %r12
	stw	%r31, 184(%r3)
	addi	%r3, %r3, 188
	bl	setup_rect_table.3120
	addi	%r3, %r3, -188	# subi
	lwz	%r31, 184(%r3)
	mtlr	%r31	
	lwz	%r5, 180(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 176(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25741
beq_else.25740:
	cmpwi	%cr7, %r13, 2
	bne	%cr7, beq_else.25742
	stw	%r11, 176(%r3)
	stw	%r8, 180(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r12, %r12	# mr %r2, %r12
	stw	%r31, 184(%r3)
	addi	%r3, %r3, 188
	bl	setup_surface_table.3123
	addi	%r3, %r3, -188	# subi
	lwz	%r31, 184(%r3)
	mtlr	%r31	
	lwz	%r5, 180(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 176(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25743
beq_else.25742:
	stw	%r11, 176(%r3)
	stw	%r8, 180(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r12, %r12	# mr %r2, %r12
	stw	%r31, 184(%r3)
	addi	%r3, %r3, 188
	bl	setup_second_table.3126
	addi	%r3, %r3, -188	# subi
	lwz	%r31, 184(%r3)
	mtlr	%r31	
	lwz	%r5, 180(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 176(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25743:
beq_cont.25741:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25744
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 20(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 172(%r3)
	lwz	%r8, 4(%r7)
	lwz	%r9, 0(%r7)
	lwz	%r10, 4(%r5)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.25746
	stw	%r8, 184(%r3)
	stw	%r2, 188(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 192(%r3)
	addi	%r3, %r3, 196
	bl	setup_rect_table.3120
	addi	%r3, %r3, -196	# subi
	lwz	%r31, 192(%r3)
	mtlr	%r31	
	lwz	%r5, 188(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 184(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25747
beq_else.25746:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.25748
	stw	%r8, 184(%r3)
	stw	%r2, 188(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 192(%r3)
	addi	%r3, %r3, 196
	bl	setup_surface_table.3123
	addi	%r3, %r3, -196	# subi
	lwz	%r31, 192(%r3)
	mtlr	%r31	
	lwz	%r5, 188(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 184(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25749
beq_else.25748:
	stw	%r8, 184(%r3)
	stw	%r2, 188(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 192(%r3)
	addi	%r3, %r3, 196
	bl	setup_second_table.3126
	addi	%r3, %r3, -196	# subi
	lwz	%r31, 192(%r3)
	mtlr	%r31	
	lwz	%r5, 188(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 184(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25749:
beq_cont.25747:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25750
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 20(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r6, 172(%r3)
	lwz	%r7, 4(%r6)
	lwz	%r8, 0(%r6)
	lwz	%r9, 4(%r5)
	cmpwi	%cr7, %r9, 1
	bne	%cr7, beq_else.25752
	stw	%r7, 192(%r3)
	stw	%r2, 196(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 200(%r3)
	addi	%r3, %r3, 204
	bl	setup_rect_table.3120
	addi	%r3, %r3, -204	# subi
	lwz	%r31, 200(%r3)
	mtlr	%r31	
	lwz	%r5, 196(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 192(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25753
beq_else.25752:
	cmpwi	%cr7, %r9, 2
	bne	%cr7, beq_else.25754
	stw	%r7, 192(%r3)
	stw	%r2, 196(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 200(%r3)
	addi	%r3, %r3, 204
	bl	setup_surface_table.3123
	addi	%r3, %r3, -204	# subi
	lwz	%r31, 200(%r3)
	mtlr	%r31	
	lwz	%r5, 196(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 192(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25755
beq_else.25754:
	stw	%r7, 192(%r3)
	stw	%r2, 196(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 200(%r3)
	addi	%r3, %r3, 204
	bl	setup_second_table.3126
	addi	%r3, %r3, -204	# subi
	lwz	%r31, 200(%r3)
	mtlr	%r31	
	lwz	%r5, 196(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 192(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25755:
beq_cont.25753:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 172(%r3)
	lwz	%r29, 16(%r3)
	mflr	%r31	
	stw	%r31, 200(%r3)
	addi	%r3, %r3, 204
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -204	# subi
	lwz	%r31, 200(%r3)
	mtlr	%r31	
	b	bge_cont.25751
bge_else.25750:
bge_cont.25751:
	b	bge_cont.25745
bge_else.25744:
bge_cont.25745:
	b	bge_cont.25739
bge_else.25738:
bge_cont.25739:
	addi	%r5, %r0, 118	# li
	lwz	%r2, 168(%r3)
	lwz	%r29, 12(%r3)
	mflr	%r31	
	stw	%r31, 200(%r3)
	addi	%r3, %r3, 204
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -204	# subi
	lwz	%r31, 200(%r3)
	mtlr	%r31	
	lwz	%r2, 164(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25756
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 4(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	addi	%r6, %r0, 119	# li
	lwz	%r29, 12(%r3)
	stw	%r2, 200(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 204(%r3)
	addi	%r3, %r3, 208
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -208	# subi
	lwz	%r31, 204(%r3)
	mtlr	%r31	
	lwz	%r2, 200(%r3)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
bge_else.25756:
	blr
bge_else.25737:
	blr
bge_else.25706:
	blr
bge_else.25657:
	blr
setup_rect_reflection.3361:
	lwz	%r6, 24(%r29)
	lwz	%r7, 20(%r29)
	lwz	%r8, 16(%r29)
	lwz	%r9, 12(%r29)
	lwz	%r10, 8(%r29)
	lwz	%r11, 4(%r29)
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	lwz	%r12, 0(%r8)
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r5, 28(%r5)
	lfs	%f1, 0(%r5)	# float
	fsub	%f0, %f0, %f1
	lfs	%f1, 0(%r10)	# float
	fneg	%f1, %f1
	lfs	%f2, 4(%r10)	# float
	fneg	%f2, %f2
	lfs	%f3, 8(%r10)	# float
	fneg	%f3, %f3
	addi	%r5, %r2, 1
	lfs	%f4, 0(%r10)	# float
	addi	%r13, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f5, 0(%r31)	# float
	stw	%r8, 0(%r3)
	stfs	%f1, 8(%r3)	# float
	stw	%r10, 16(%r3)
	stw	%r2, 20(%r3)
	stw	%r6, 24(%r3)
	stw	%r12, 28(%r3)
	stw	%r5, 32(%r3)
	stfs	%f0, 40(%r3)	# float
	stw	%r11, 48(%r3)
	stw	%r7, 52(%r3)
	stfs	%f3, 56(%r3)	# float
	stfs	%f2, 64(%r3)	# float
	stfs	%f4, 72(%r3)	# float
	stw	%r9, 80(%r3)
	mflr	%r31	
	or	%r2, %r13, %r13	# mr %r2, %r13
	fmr	%f0, %f5
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	min_caml_create_float_array
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 80(%r3)
	lwz	%r6, 0(%r2)
	stw	%r5, 84(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	bl	min_caml_create_array
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r5)
	lwz	%r6, 84(%r3)
	stw	%r6, 0(%r5)
	lfs	%f0, 72(%r3)	# float
	stfs	%f0, 0(%r6)	# float
	lfs	%f0, 64(%r3)	# float
	stfs	%f0, 4(%r6)	# float
	lfs	%f1, 56(%r3)	# float
	stfs	%f1, 8(%r6)	# float
	lwz	%r7, 80(%r3)
	lwz	%r8, 0(%r7)
	addi	%r8, %r8, -1	# subi %r8, %r8, 1
	stw	%r5, 88(%r3)
	cmpwi	%cr7, %r8, 0
	blt	%cr7, bge_else.25763
	addi	%r31, %r0, 2	# li
	slw	%r9, %r8, %r31
	lwz	%r10, 52(%r3)
	add %r31, %r10, %r9
	lwz %r9, 0(%r31)
	lwz	%r11, 4(%r9)
	cmpwi	%cr7, %r11, 1
	bne	%cr7, beq_else.25765
	stw	%r2, 92(%r3)
	stw	%r8, 96(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	setup_rect_table.3120
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtlr	%r31	
	lwz	%r5, 96(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 92(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25766
beq_else.25765:
	cmpwi	%cr7, %r11, 2
	bne	%cr7, beq_else.25767
	stw	%r2, 92(%r3)
	stw	%r8, 96(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	setup_surface_table.3123
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtlr	%r31	
	lwz	%r5, 96(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 92(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25768
beq_else.25767:
	stw	%r2, 92(%r3)
	stw	%r8, 96(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	setup_second_table.3126
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtlr	%r31	
	lwz	%r5, 96(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 92(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25768:
beq_cont.25766:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25769
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 52(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r8, 4(%r5)
	cmpwi	%cr7, %r8, 1
	bne	%cr7, beq_else.25771
	lwz	%r8, 84(%r3)
	stw	%r2, 100(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 104(%r3)
	addi	%r3, %r3, 108
	bl	setup_rect_table.3120
	addi	%r3, %r3, -108	# subi
	lwz	%r31, 104(%r3)
	mtlr	%r31	
	lwz	%r5, 100(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 92(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25772
beq_else.25771:
	cmpwi	%cr7, %r8, 2
	bne	%cr7, beq_else.25773
	lwz	%r8, 84(%r3)
	stw	%r2, 100(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 104(%r3)
	addi	%r3, %r3, 108
	bl	setup_surface_table.3123
	addi	%r3, %r3, -108	# subi
	lwz	%r31, 104(%r3)
	mtlr	%r31	
	lwz	%r5, 100(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 92(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25774
beq_else.25773:
	lwz	%r8, 84(%r3)
	stw	%r2, 100(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 104(%r3)
	addi	%r3, %r3, 108
	bl	setup_second_table.3126
	addi	%r3, %r3, -108	# subi
	lwz	%r31, 104(%r3)
	mtlr	%r31	
	lwz	%r5, 100(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 92(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25774:
beq_cont.25772:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25775
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 52(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r8, 4(%r5)
	cmpwi	%cr7, %r8, 1
	bne	%cr7, beq_else.25777
	lwz	%r8, 84(%r3)
	stw	%r2, 104(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	setup_rect_table.3120
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtlr	%r31	
	lwz	%r5, 104(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 92(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25778
beq_else.25777:
	cmpwi	%cr7, %r8, 2
	bne	%cr7, beq_else.25779
	lwz	%r8, 84(%r3)
	stw	%r2, 104(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	setup_surface_table.3123
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtlr	%r31	
	lwz	%r5, 104(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 92(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25780
beq_else.25779:
	lwz	%r8, 84(%r3)
	stw	%r2, 104(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	setup_second_table.3126
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtlr	%r31	
	lwz	%r5, 104(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 92(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25780:
beq_cont.25778:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 88(%r3)
	lwz	%r29, 48(%r3)
	mflr	%r31	
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtlr	%r31	
	b	bge_cont.25776
bge_else.25775:
bge_cont.25776:
	b	bge_cont.25770
bge_else.25769:
bge_cont.25770:
	b	bge_cont.25764
bge_else.25763:
bge_cont.25764:
	or	%r2, %r4, %r4	# mr %r2, %r4
	addi	%r4, %r4, 12
	lfs	%f0, 40(%r3)	# float
	stfs	%f0, 8(%r2)	# float
	lwz	%r5, 88(%r3)
	stw	%r5, 4(%r2)
	lwz	%r5, 32(%r3)
	stw	%r5, 0(%r2)
	lwz	%r5, 28(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 24(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	addi	%r2, %r5, 1
	lwz	%r6, 20(%r3)
	addi	%r8, %r6, 2
	lwz	%r9, 16(%r3)
	lfs	%f1, 4(%r9)	# float
	addi	%r10, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	stw	%r2, 108(%r3)
	stw	%r8, 112(%r3)
	stfs	%f1, 120(%r3)	# float
	mflr	%r31	
	or	%r2, %r10, %r10	# mr %r2, %r10
	fmr	%f0, %f2
	stw	%r31, 128(%r3)
	addi	%r3, %r3, 132
	bl	min_caml_create_float_array
	addi	%r3, %r3, -132	# subi
	lwz	%r31, 128(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 80(%r3)
	lwz	%r6, 0(%r2)
	stw	%r5, 128(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	min_caml_create_array
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r5)
	lwz	%r6, 128(%r3)
	stw	%r6, 0(%r5)
	lfs	%f0, 8(%r3)	# float
	stfs	%f0, 0(%r6)	# float
	lfs	%f1, 120(%r3)	# float
	stfs	%f1, 4(%r6)	# float
	lfs	%f1, 56(%r3)	# float
	stfs	%f1, 8(%r6)	# float
	lwz	%r7, 80(%r3)
	lwz	%r8, 0(%r7)
	addi	%r8, %r8, -1	# subi %r8, %r8, 1
	stw	%r5, 132(%r3)
	cmpwi	%cr7, %r8, 0
	blt	%cr7, bge_else.25782
	addi	%r31, %r0, 2	# li
	slw	%r9, %r8, %r31
	lwz	%r10, 52(%r3)
	add %r31, %r10, %r9
	lwz %r9, 0(%r31)
	lwz	%r11, 4(%r9)
	cmpwi	%cr7, %r11, 1
	bne	%cr7, beq_else.25784
	stw	%r2, 136(%r3)
	stw	%r8, 140(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 144(%r3)
	addi	%r3, %r3, 148
	bl	setup_rect_table.3120
	addi	%r3, %r3, -148	# subi
	lwz	%r31, 144(%r3)
	mtlr	%r31	
	lwz	%r5, 140(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 136(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25785
beq_else.25784:
	cmpwi	%cr7, %r11, 2
	bne	%cr7, beq_else.25786
	stw	%r2, 136(%r3)
	stw	%r8, 140(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 144(%r3)
	addi	%r3, %r3, 148
	bl	setup_surface_table.3123
	addi	%r3, %r3, -148	# subi
	lwz	%r31, 144(%r3)
	mtlr	%r31	
	lwz	%r5, 140(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 136(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25787
beq_else.25786:
	stw	%r2, 136(%r3)
	stw	%r8, 140(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 144(%r3)
	addi	%r3, %r3, 148
	bl	setup_second_table.3126
	addi	%r3, %r3, -148	# subi
	lwz	%r31, 144(%r3)
	mtlr	%r31	
	lwz	%r5, 140(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 136(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25787:
beq_cont.25785:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25788
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 52(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r8, 4(%r5)
	cmpwi	%cr7, %r8, 1
	bne	%cr7, beq_else.25790
	lwz	%r8, 128(%r3)
	stw	%r2, 144(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 148(%r3)
	addi	%r3, %r3, 152
	bl	setup_rect_table.3120
	addi	%r3, %r3, -152	# subi
	lwz	%r31, 148(%r3)
	mtlr	%r31	
	lwz	%r5, 144(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 136(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25791
beq_else.25790:
	cmpwi	%cr7, %r8, 2
	bne	%cr7, beq_else.25792
	lwz	%r8, 128(%r3)
	stw	%r2, 144(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 148(%r3)
	addi	%r3, %r3, 152
	bl	setup_surface_table.3123
	addi	%r3, %r3, -152	# subi
	lwz	%r31, 148(%r3)
	mtlr	%r31	
	lwz	%r5, 144(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 136(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25793
beq_else.25792:
	lwz	%r8, 128(%r3)
	stw	%r2, 144(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 148(%r3)
	addi	%r3, %r3, 152
	bl	setup_second_table.3126
	addi	%r3, %r3, -152	# subi
	lwz	%r31, 148(%r3)
	mtlr	%r31	
	lwz	%r5, 144(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 136(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25793:
beq_cont.25791:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25794
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 52(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r8, 4(%r5)
	cmpwi	%cr7, %r8, 1
	bne	%cr7, beq_else.25796
	lwz	%r8, 128(%r3)
	stw	%r2, 148(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 152(%r3)
	addi	%r3, %r3, 156
	bl	setup_rect_table.3120
	addi	%r3, %r3, -156	# subi
	lwz	%r31, 152(%r3)
	mtlr	%r31	
	lwz	%r5, 148(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 136(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25797
beq_else.25796:
	cmpwi	%cr7, %r8, 2
	bne	%cr7, beq_else.25798
	lwz	%r8, 128(%r3)
	stw	%r2, 148(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 152(%r3)
	addi	%r3, %r3, 156
	bl	setup_surface_table.3123
	addi	%r3, %r3, -156	# subi
	lwz	%r31, 152(%r3)
	mtlr	%r31	
	lwz	%r5, 148(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 136(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25799
beq_else.25798:
	lwz	%r8, 128(%r3)
	stw	%r2, 148(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 152(%r3)
	addi	%r3, %r3, 156
	bl	setup_second_table.3126
	addi	%r3, %r3, -156	# subi
	lwz	%r31, 152(%r3)
	mtlr	%r31	
	lwz	%r5, 148(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 136(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25799:
beq_cont.25797:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 132(%r3)
	lwz	%r29, 48(%r3)
	mflr	%r31	
	stw	%r31, 152(%r3)
	addi	%r3, %r3, 156
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -156	# subi
	lwz	%r31, 152(%r3)
	mtlr	%r31	
	b	bge_cont.25795
bge_else.25794:
bge_cont.25795:
	b	bge_cont.25789
bge_else.25788:
bge_cont.25789:
	b	bge_cont.25783
bge_else.25782:
bge_cont.25783:
	or	%r2, %r4, %r4	# mr %r2, %r4
	addi	%r4, %r4, 12
	lfs	%f0, 40(%r3)	# float
	stfs	%f0, 8(%r2)	# float
	lwz	%r5, 132(%r3)
	stw	%r5, 4(%r2)
	lwz	%r5, 112(%r3)
	stw	%r5, 0(%r2)
	lwz	%r5, 108(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 24(%r3)
	add %r31, %r6, %r5
	stw %r2, 0(%r31)
	lwz	%r2, 28(%r3)
	addi	%r5, %r2, 2
	lwz	%r7, 20(%r3)
	addi	%r7, %r7, 3
	lwz	%r8, 16(%r3)
	lfs	%f1, 8(%r8)	# float
	addi	%r8, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f2, 0(%r31)	# float
	stw	%r5, 152(%r3)
	stw	%r7, 156(%r3)
	stfs	%f1, 160(%r3)	# float
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	fmr	%f0, %f2
	stw	%r31, 168(%r3)
	addi	%r3, %r3, 172
	bl	min_caml_create_float_array
	addi	%r3, %r3, -172	# subi
	lwz	%r31, 168(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 80(%r3)
	lwz	%r6, 0(%r2)
	stw	%r5, 168(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 172(%r3)
	addi	%r3, %r3, 176
	bl	min_caml_create_array
	addi	%r3, %r3, -176	# subi
	lwz	%r31, 172(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r5)
	lwz	%r6, 168(%r3)
	stw	%r6, 0(%r5)
	lfs	%f0, 8(%r3)	# float
	stfs	%f0, 0(%r6)	# float
	lfs	%f0, 64(%r3)	# float
	stfs	%f0, 4(%r6)	# float
	lfs	%f0, 160(%r3)	# float
	stfs	%f0, 8(%r6)	# float
	lwz	%r7, 80(%r3)
	lwz	%r7, 0(%r7)
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	stw	%r5, 172(%r3)
	cmpwi	%cr7, %r7, 0
	blt	%cr7, bge_else.25800
	addi	%r31, %r0, 2	# li
	slw	%r8, %r7, %r31
	lwz	%r9, 52(%r3)
	add %r31, %r9, %r8
	lwz %r8, 0(%r31)
	lwz	%r10, 4(%r8)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.25802
	stw	%r2, 176(%r3)
	stw	%r7, 180(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 184(%r3)
	addi	%r3, %r3, 188
	bl	setup_rect_table.3120
	addi	%r3, %r3, -188	# subi
	lwz	%r31, 184(%r3)
	mtlr	%r31	
	lwz	%r5, 180(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 176(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25803
beq_else.25802:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.25804
	stw	%r2, 176(%r3)
	stw	%r7, 180(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 184(%r3)
	addi	%r3, %r3, 188
	bl	setup_surface_table.3123
	addi	%r3, %r3, -188	# subi
	lwz	%r31, 184(%r3)
	mtlr	%r31	
	lwz	%r5, 180(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 176(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25805
beq_else.25804:
	stw	%r2, 176(%r3)
	stw	%r7, 180(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 184(%r3)
	addi	%r3, %r3, 188
	bl	setup_second_table.3126
	addi	%r3, %r3, -188	# subi
	lwz	%r31, 184(%r3)
	mtlr	%r31	
	lwz	%r5, 180(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 176(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25805:
beq_cont.25803:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25806
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 52(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r8, 4(%r5)
	cmpwi	%cr7, %r8, 1
	bne	%cr7, beq_else.25808
	lwz	%r8, 168(%r3)
	stw	%r2, 184(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 188(%r3)
	addi	%r3, %r3, 192
	bl	setup_rect_table.3120
	addi	%r3, %r3, -192	# subi
	lwz	%r31, 188(%r3)
	mtlr	%r31	
	lwz	%r5, 184(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 176(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25809
beq_else.25808:
	cmpwi	%cr7, %r8, 2
	bne	%cr7, beq_else.25810
	lwz	%r8, 168(%r3)
	stw	%r2, 184(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 188(%r3)
	addi	%r3, %r3, 192
	bl	setup_surface_table.3123
	addi	%r3, %r3, -192	# subi
	lwz	%r31, 188(%r3)
	mtlr	%r31	
	lwz	%r5, 184(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 176(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25811
beq_else.25810:
	lwz	%r8, 168(%r3)
	stw	%r2, 184(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 188(%r3)
	addi	%r3, %r3, 192
	bl	setup_second_table.3126
	addi	%r3, %r3, -192	# subi
	lwz	%r31, 188(%r3)
	mtlr	%r31	
	lwz	%r5, 184(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 176(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25811:
beq_cont.25809:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25812
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 52(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r6, 4(%r5)
	cmpwi	%cr7, %r6, 1
	bne	%cr7, beq_else.25814
	lwz	%r6, 168(%r3)
	stw	%r2, 188(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 192(%r3)
	addi	%r3, %r3, 196
	bl	setup_rect_table.3120
	addi	%r3, %r3, -196	# subi
	lwz	%r31, 192(%r3)
	mtlr	%r31	
	lwz	%r5, 188(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 176(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25815
beq_else.25814:
	cmpwi	%cr7, %r6, 2
	bne	%cr7, beq_else.25816
	lwz	%r6, 168(%r3)
	stw	%r2, 188(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 192(%r3)
	addi	%r3, %r3, 196
	bl	setup_surface_table.3123
	addi	%r3, %r3, -196	# subi
	lwz	%r31, 192(%r3)
	mtlr	%r31	
	lwz	%r5, 188(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 176(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25817
beq_else.25816:
	lwz	%r6, 168(%r3)
	stw	%r2, 188(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 192(%r3)
	addi	%r3, %r3, 196
	bl	setup_second_table.3126
	addi	%r3, %r3, -196	# subi
	lwz	%r31, 192(%r3)
	mtlr	%r31	
	lwz	%r5, 188(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 176(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25817:
beq_cont.25815:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 172(%r3)
	lwz	%r29, 48(%r3)
	mflr	%r31	
	stw	%r31, 192(%r3)
	addi	%r3, %r3, 196
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -196	# subi
	lwz	%r31, 192(%r3)
	mtlr	%r31	
	b	bge_cont.25813
bge_else.25812:
bge_cont.25813:
	b	bge_cont.25807
bge_else.25806:
bge_cont.25807:
	b	bge_cont.25801
bge_else.25800:
bge_cont.25801:
	or	%r2, %r4, %r4	# mr %r2, %r4
	addi	%r4, %r4, 12
	lfs	%f0, 40(%r3)	# float
	stfs	%f0, 8(%r2)	# float
	lwz	%r5, 172(%r3)
	stw	%r5, 4(%r2)
	lwz	%r5, 156(%r3)
	stw	%r5, 0(%r2)
	lwz	%r5, 152(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r5, %r5, %r31
	lwz	%r6, 24(%r3)
	add %r31, %r6, %r5
	stw %r2, 0(%r31)
	lwz	%r2, 28(%r3)
	addi	%r2, %r2, 3
	lwz	%r5, 0(%r3)
	stw	%r2, 0(%r5)
	blr
setup_surface_reflection.3364:
	lwz	%r6, 24(%r29)
	lwz	%r7, 20(%r29)
	lwz	%r8, 16(%r29)
	lwz	%r9, 12(%r29)
	lwz	%r10, 8(%r29)
	lwz	%r11, 4(%r29)
	addi	%r31, %r0, 2	# li
	slw	%r2, %r2, %r31
	addi	%r2, %r2, 1
	lwz	%r12, 0(%r8)
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f0, 0(%r31)	# float
	lwz	%r13, 28(%r5)
	lfs	%f1, 0(%r13)	# float
	fsub	%f0, %f0, %f1
	lwz	%r13, 16(%r5)
	lfs	%f1, 0(%r10)	# float
	lfs	%f2, 0(%r13)	# float
	fmul	%f1, %f1, %f2
	lfs	%f2, 4(%r10)	# float
	lfs	%f3, 4(%r13)	# float
	fmul	%f2, %f2, %f3
	fadd	%f1, %f1, %f2
	lfs	%f2, 8(%r10)	# float
	lfs	%f3, 8(%r13)	# float
	fmul	%f2, %f2, %f3
	fadd	%f1, %f1, %f2
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f2, 0(%r31)	# float
	lwz	%r13, 16(%r5)
	lfs	%f3, 0(%r13)	# float
	fmul	%f2, %f2, %f3
	fmul	%f2, %f2, %f1
	lfs	%f3, 0(%r10)	# float
	fsub	%f2, %f2, %f3
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f3, 0(%r31)	# float
	lwz	%r13, 16(%r5)
	lfs	%f4, 4(%r13)	# float
	fmul	%f3, %f3, %f4
	fmul	%f3, %f3, %f1
	lfs	%f4, 4(%r10)	# float
	fsub	%f3, %f3, %f4
	addis	%r31, %r0, (l.18114)@h	# lis
	ori	%r31, %r31, (l.18114)@l
	lfs	%f4, 0(%r31)	# float
	lwz	%r5, 16(%r5)
	lfs	%f5, 8(%r5)	# float
	fmul	%f4, %f4, %f5
	fmul	%f1, %f4, %f1
	lfs	%f4, 8(%r10)	# float
	fsub	%f1, %f1, %f4
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f4, 0(%r31)	# float
	stw	%r8, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r12, 8(%r3)
	stw	%r2, 12(%r3)
	stfs	%f0, 16(%r3)	# float
	stw	%r11, 24(%r3)
	stw	%r7, 28(%r3)
	stfs	%f1, 32(%r3)	# float
	stfs	%f3, 40(%r3)	# float
	stfs	%f2, 48(%r3)	# float
	stw	%r9, 56(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	fmr	%f0, %f4
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	min_caml_create_float_array
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 56(%r3)
	lwz	%r6, 0(%r2)
	stw	%r5, 60(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 64(%r3)
	addi	%r3, %r3, 68
	bl	min_caml_create_array
	addi	%r3, %r3, -68	# subi
	lwz	%r31, 64(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r5)
	lwz	%r6, 60(%r3)
	stw	%r6, 0(%r5)
	lfs	%f0, 48(%r3)	# float
	stfs	%f0, 0(%r6)	# float
	lfs	%f0, 40(%r3)	# float
	stfs	%f0, 4(%r6)	# float
	lfs	%f0, 32(%r3)	# float
	stfs	%f0, 8(%r6)	# float
	lwz	%r7, 56(%r3)
	lwz	%r7, 0(%r7)
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	stw	%r5, 64(%r3)
	cmpwi	%cr7, %r7, 0
	blt	%cr7, bge_else.25819
	addi	%r31, %r0, 2	# li
	slw	%r8, %r7, %r31
	lwz	%r9, 28(%r3)
	add %r31, %r9, %r8
	lwz %r8, 0(%r31)
	lwz	%r10, 4(%r8)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.25821
	stw	%r2, 68(%r3)
	stw	%r7, 72(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	setup_rect_table.3120
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtlr	%r31	
	lwz	%r5, 72(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 68(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25822
beq_else.25821:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.25823
	stw	%r2, 68(%r3)
	stw	%r7, 72(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	setup_surface_table.3123
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtlr	%r31	
	lwz	%r5, 72(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 68(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25824
beq_else.25823:
	stw	%r2, 68(%r3)
	stw	%r7, 72(%r3)
	mflr	%r31	
	or	%r5, %r8, %r8	# mr %r5, %r8
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	setup_second_table.3126
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtlr	%r31	
	lwz	%r5, 72(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 68(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25824:
beq_cont.25822:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25825
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 28(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r8, 4(%r5)
	cmpwi	%cr7, %r8, 1
	bne	%cr7, beq_else.25827
	lwz	%r8, 60(%r3)
	stw	%r2, 76(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	bl	setup_rect_table.3120
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	lwz	%r5, 76(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 68(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25828
beq_else.25827:
	cmpwi	%cr7, %r8, 2
	bne	%cr7, beq_else.25829
	lwz	%r8, 60(%r3)
	stw	%r2, 76(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	bl	setup_surface_table.3123
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	lwz	%r5, 76(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 68(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25830
beq_else.25829:
	lwz	%r8, 60(%r3)
	stw	%r2, 76(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	bl	setup_second_table.3126
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	lwz	%r5, 76(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 68(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25830:
beq_cont.25828:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25831
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 28(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r6, 4(%r5)
	cmpwi	%cr7, %r6, 1
	bne	%cr7, beq_else.25833
	lwz	%r6, 60(%r3)
	stw	%r2, 80(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	setup_rect_table.3120
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtlr	%r31	
	lwz	%r5, 80(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 68(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25834
beq_else.25833:
	cmpwi	%cr7, %r6, 2
	bne	%cr7, beq_else.25835
	lwz	%r6, 60(%r3)
	stw	%r2, 80(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	setup_surface_table.3123
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtlr	%r31	
	lwz	%r5, 80(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 68(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25836
beq_else.25835:
	lwz	%r6, 60(%r3)
	stw	%r2, 80(%r3)
	mflr	%r31	
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	setup_second_table.3126
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtlr	%r31	
	lwz	%r5, 80(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 68(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25836:
beq_cont.25834:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 64(%r3)
	lwz	%r29, 24(%r3)
	mflr	%r31	
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtlr	%r31	
	b	bge_cont.25832
bge_else.25831:
bge_cont.25832:
	b	bge_cont.25826
bge_else.25825:
bge_cont.25826:
	b	bge_cont.25820
bge_else.25819:
bge_cont.25820:
	or	%r2, %r4, %r4	# mr %r2, %r4
	addi	%r4, %r4, 12
	lfs	%f0, 16(%r3)	# float
	stfs	%f0, 8(%r2)	# float
	lwz	%r5, 64(%r3)
	stw	%r5, 4(%r2)
	lwz	%r5, 12(%r3)
	stw	%r5, 0(%r2)
	lwz	%r5, 8(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 4(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	addi	%r2, %r5, 1
	lwz	%r5, 0(%r3)
	stw	%r2, 0(%r5)
	blr
rt.3369:
	lwz	%r6, 116(%r29)
	lwz	%r7, 112(%r29)
	lwz	%r8, 108(%r29)
	lwz	%r9, 104(%r29)
	lwz	%r10, 100(%r29)
	lwz	%r11, 96(%r29)
	lwz	%r12, 92(%r29)
	lwz	%r13, 88(%r29)
	lwz	%r14, 84(%r29)
	lwz	%r15, 80(%r29)
	lwz	%r16, 76(%r29)
	lwz	%r17, 72(%r29)
	lwz	%r18, 68(%r29)
	lwz	%r19, 64(%r29)
	lwz	%r20, 60(%r29)
	lwz	%r21, 56(%r29)
	lwz	%r22, 52(%r29)
	lwz	%r23, 48(%r29)
	lwz	%r24, 44(%r29)
	lwz	%r25, 40(%r29)
	lwz	%r26, 36(%r29)
	lwz	%r27, 32(%r29)
	lwz	%r28, 28(%r29)
	lwz	%r30, 24(%r29)
	stw	%r13, 0(%r3)
	lwz	%r13, 20(%r29)
	stw	%r11, 4(%r3)
	lwz	%r11, 16(%r29)
	stw	%r19, 8(%r3)
	lwz	%r19, 12(%r29)
	stw	%r9, 12(%r3)
	lwz	%r9, 8(%r29)
	lwz	%r29, 4(%r29)
	stw	%r2, 0(%r28)
	stw	%r5, 4(%r28)
	stw	%r10, 16(%r3)
	addi	%r31, %r0, 1	# lis
	srw	%r10, %r2, %r31
	stw	%r10, 0(%r30)
	addi	%r31, %r0, 1	# lis
	srw	%r5, %r5, %r31
	stw	%r5, 4(%r30)
	addis	%r31, %r0, (l.20011)@h	# lis
	ori	%r31, %r31, (l.20011)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r30, 20(%r3)
	stw	%r7, 24(%r3)
	stw	%r8, 28(%r3)
	stw	%r23, 32(%r3)
	stw	%r19, 36(%r3)
	stw	%r6, 40(%r3)
	stw	%r24, 44(%r3)
	stw	%r26, 48(%r3)
	stw	%r27, 52(%r3)
	stw	%r25, 56(%r3)
	stw	%r21, 60(%r3)
	stw	%r13, 64(%r3)
	stw	%r9, 68(%r3)
	stw	%r11, 72(%r3)
	stw	%r20, 76(%r3)
	stw	%r18, 80(%r3)
	stw	%r29, 84(%r3)
	stw	%r15, 88(%r3)
	stw	%r22, 92(%r3)
	stw	%r16, 96(%r3)
	stw	%r17, 100(%r3)
	stw	%r14, 104(%r3)
	stw	%r28, 108(%r3)
	stw	%r12, 112(%r3)
	stfs	%f0, 120(%r3)	# float
	mflr	%r31	
	stw	%r31, 128(%r3)
	addi	%r3, %r3, 132
	bl	float_of_int.2840
	addi	%r3, %r3, -132	# subi
	lwz	%r31, 128(%r3)
	mtlr	%r31	
	lfs	%f1, 120(%r3)	# float
	fdiv	%f0, %f1, %f0
	lwz	%r2, 112(%r3)
	stfs	%f0, 0(%r2)	# float
	lwz	%r5, 108(%r3)
	lwz	%r6, 0(%r5)
	stw	%r6, 128(%r3)
	mflr	%r31	
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	create_pixel.3311
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 128(%r3)
	mflr	%r31	
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	min_caml_create_array
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtlr	%r31	
	lwz	%r5, 108(%r3)
	lwz	%r6, 0(%r5)
	addi	%r6, %r6, -2	# subi %r6, %r6, 2
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	init_line_elements.3313
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtlr	%r31	
	lwz	%r5, 108(%r3)
	lwz	%r6, 0(%r5)
	stw	%r2, 132(%r3)
	stw	%r6, 136(%r3)
	mflr	%r31	
	stw	%r31, 140(%r3)
	addi	%r3, %r3, 144
	bl	create_pixel.3311
	addi	%r3, %r3, -144	# subi
	lwz	%r31, 140(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 136(%r3)
	mflr	%r31	
	stw	%r31, 140(%r3)
	addi	%r3, %r3, 144
	bl	min_caml_create_array
	addi	%r3, %r3, -144	# subi
	lwz	%r31, 140(%r3)
	mtlr	%r31	
	lwz	%r5, 108(%r3)
	lwz	%r6, 0(%r5)
	addi	%r6, %r6, -2	# subi %r6, %r6, 2
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 140(%r3)
	addi	%r3, %r3, 144
	bl	init_line_elements.3313
	addi	%r3, %r3, -144	# subi
	lwz	%r31, 140(%r3)
	mtlr	%r31	
	lwz	%r5, 108(%r3)
	lwz	%r6, 0(%r5)
	stw	%r2, 140(%r3)
	stw	%r6, 144(%r3)
	mflr	%r31	
	stw	%r31, 148(%r3)
	addi	%r3, %r3, 152
	bl	create_pixel.3311
	addi	%r3, %r3, -152	# subi
	lwz	%r31, 148(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 144(%r3)
	mflr	%r31	
	stw	%r31, 148(%r3)
	addi	%r3, %r3, 152
	bl	min_caml_create_array
	addi	%r3, %r3, -152	# subi
	lwz	%r31, 148(%r3)
	mtlr	%r31	
	lwz	%r5, 108(%r3)
	lwz	%r6, 0(%r5)
	addi	%r6, %r6, -2	# subi %r6, %r6, 2
	mflr	%r31	
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 148(%r3)
	addi	%r3, %r3, 152
	bl	init_line_elements.3313
	addi	%r3, %r3, -152	# subi
	lwz	%r31, 148(%r3)
	mtlr	%r31	
	lwz	%r29, 104(%r3)
	stw	%r2, 148(%r3)
	mflr	%r31	
	stw	%r31, 152(%r3)
	addi	%r3, %r3, 156
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -156	# subi
	lwz	%r31, 152(%r3)
	mtlr	%r31	
	lwz	%r29, 100(%r3)
	mflr	%r31	
	stw	%r31, 152(%r3)
	addi	%r3, %r3, 156
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -156	# subi
	lwz	%r31, 152(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 0	# li
	lwz	%r29, 96(%r3)
	stw	%r2, 152(%r3)
	mflr	%r31	
	stw	%r31, 156(%r3)
	addi	%r3, %r3, 160
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -160	# subi
	lwz	%r31, 156(%r3)
	mtlr	%r31	
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.25839
	lwz	%r2, 92(%r3)
	lwz	%r5, 152(%r3)
	stw	%r5, 0(%r2)
	b	beq_cont.25840
beq_else.25839:
	addi	%r2, %r0, 1	# li
	lwz	%r29, 88(%r3)
	mflr	%r31	
	stw	%r31, 156(%r3)
	addi	%r3, %r3, 160
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -160	# subi
	lwz	%r31, 156(%r3)
	mtlr	%r31	
beq_cont.25840:
out.25842:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.25841
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.25842
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.25841:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.25841
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
out.25844:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.25843
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.25844
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.25843:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.25843
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r5, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r5, %r5, %r31
out.25846:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.25845
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.25846
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.25845:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.25845
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r6, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r6, %r6, %r31
out.25848:
	cmp	%cr7, %r1, %r0
	beq	%cr7, in.25847
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.25848
	addi	%r31, %r0, 24	# lis
	slw	%r1, %r1, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r1, 0(%r31)
	addi	%r1, %r0, 0	
in.25847:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x0100
	beq	%cr0, in.25847
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	lwz	%r7, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r7, %r7, %r31
	addi	%r31, %r0, 8	# li
	slw	%r5, %r5, %r31
	or	%r2, %r2, %r5
	addi	%r31, %r0, 16	# li
	slw	%r5, %r6, %r31
	or	%r2, %r2, %r5
	addi	%r31, %r0, 24	# li
	slw	%r5, %r7, %r31
	or	%r2, %r2, %r5
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.25849
	addi	%r2, %r0, 1	# li
	addi	%r5, %r0, -1	# li
	mflr	%r31	
	stw	%r31, 156(%r3)
	addi	%r3, %r3, 160
	bl	min_caml_create_array
	addi	%r3, %r3, -160	# subi
	lwz	%r31, 156(%r3)
	mtlr	%r31	
	b	beq_cont.25850
beq_else.25849:
	addi	%r5, %r0, 1	# li
	stw	%r2, 156(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 160(%r3)
	addi	%r3, %r3, 164
	bl	read_net_item.3028
	addi	%r3, %r3, -164	# subi
	lwz	%r31, 160(%r3)
	mtlr	%r31	
	lwz	%r5, 156(%r3)
	stw	%r5, 0(%r2)
beq_cont.25850:
	lwz	%r5, 0(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.25851
	b	beq_cont.25852
beq_else.25851:
	lwz	%r5, 84(%r3)
	stw	%r2, 0(%r5)
	addi	%r2, %r0, 0	# li
	mflr	%r31	
	stw	%r31, 160(%r3)
	addi	%r3, %r3, 164
	bl	read_net_item.3028
	addi	%r3, %r3, -164	# subi
	lwz	%r31, 160(%r3)
	mtlr	%r31	
	lwz	%r5, 0(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.25853
	b	beq_cont.25854
beq_else.25853:
	lwz	%r5, 84(%r3)
	stw	%r2, 4(%r5)
	addi	%r2, %r0, 2	# li
	lwz	%r29, 80(%r3)
	mflr	%r31	
	stw	%r31, 160(%r3)
	addi	%r3, %r3, 164
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -164	# subi
	lwz	%r31, 160(%r3)
	mtlr	%r31	
beq_cont.25854:
beq_cont.25852:
	addi	%r2, %r0, 0	# li
	mflr	%r31	
	stw	%r31, 160(%r3)
	addi	%r3, %r3, 164
	bl	read_or_network.3030
	addi	%r3, %r3, -164	# subi
	lwz	%r31, 160(%r3)
	mtlr	%r31	
	lwz	%r5, 76(%r3)
	stw	%r2, 0(%r5)
	addi	%r2, %r0, 80	# li
out.25855:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.25855
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	addi	%r2, %r0, 51	# li
out.25856:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.25856
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	addi	%r2, %r0, 10	# li
out.25857:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.25857
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	lwz	%r2, 108(%r3)
	lwz	%r5, 0(%r2)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 160(%r3)
	addi	%r3, %r3, 164
	bl	print_int.2803
	addi	%r3, %r3, -164	# subi
	lwz	%r31, 160(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 32	# li
out.25858:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.25858
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	lwz	%r2, 108(%r3)
	lwz	%r5, 4(%r2)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 160(%r3)
	addi	%r3, %r3, 164
	bl	print_int.2803
	addi	%r3, %r3, -164	# subi
	lwz	%r31, 160(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 32	# li
out.25859:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.25859
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	addi	%r2, %r0, 255	# li
	mflr	%r31	
	stw	%r31, 160(%r3)
	addi	%r3, %r3, 164
	bl	print_int.2803
	addi	%r3, %r3, -164	# subi
	lwz	%r31, 160(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 10	# li
out.25860:
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4116
	lwz	%r31, 0(%r31)
	andis.	%r31, %r31, 0x4000
	beq	%cr0, out.25860
	addi	%r31, %r0, 24	# lis
	slw	%r2, %r2, %r31
	addis	%r31, %r0, 61440	# lis
	ori	%r31, %r31, 4096
	stw	%r2, 0(%r31)
	addi	%r31, %r0, 24	# lis
	srw	%r2, %r2, %r31
	addi	%r2, %r0, 4	# li
	lwz	%r29, 72(%r3)
	mflr	%r31	
	stw	%r31, 160(%r3)
	addi	%r3, %r3, 164
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -164	# subi
	lwz	%r31, 160(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 9	# li
	addi	%r5, %r0, 0	# li
	addi	%r6, %r0, 0	# li
	lwz	%r29, 68(%r3)
	mflr	%r31	
	stw	%r31, 160(%r3)
	addi	%r3, %r3, 164
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -164	# subi
	lwz	%r31, 160(%r3)
	mtlr	%r31	
	lwz	%r2, 64(%r3)
	lwz	%r5, 16(%r2)
	lwz	%r6, 476(%r5)
	lwz	%r7, 92(%r3)
	lwz	%r8, 0(%r7)
	addi	%r8, %r8, -1	# subi %r8, %r8, 1
	stw	%r5, 160(%r3)
	cmpwi	%cr7, %r8, 0
	blt	%cr7, bge_else.25861
	addi	%r31, %r0, 2	# li
	slw	%r9, %r8, %r31
	lwz	%r10, 60(%r3)
	add %r31, %r10, %r9
	lwz %r9, 0(%r31)
	lwz	%r11, 4(%r6)
	lwz	%r12, 0(%r6)
	lwz	%r13, 4(%r9)
	stw	%r6, 164(%r3)
	cmpwi	%cr7, %r13, 1
	bne	%cr7, beq_else.25863
	stw	%r11, 168(%r3)
	stw	%r8, 172(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r12, %r12	# mr %r2, %r12
	stw	%r31, 176(%r3)
	addi	%r3, %r3, 180
	bl	setup_rect_table.3120
	addi	%r3, %r3, -180	# subi
	lwz	%r31, 176(%r3)
	mtlr	%r31	
	lwz	%r5, 172(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 168(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25864
beq_else.25863:
	cmpwi	%cr7, %r13, 2
	bne	%cr7, beq_else.25865
	stw	%r11, 168(%r3)
	stw	%r8, 172(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r12, %r12	# mr %r2, %r12
	stw	%r31, 176(%r3)
	addi	%r3, %r3, 180
	bl	setup_surface_table.3123
	addi	%r3, %r3, -180	# subi
	lwz	%r31, 176(%r3)
	mtlr	%r31	
	lwz	%r5, 172(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 168(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25866
beq_else.25865:
	stw	%r11, 168(%r3)
	stw	%r8, 172(%r3)
	mflr	%r31	
	or	%r5, %r9, %r9	# mr %r5, %r9
	or	%r2, %r12, %r12	# mr %r2, %r12
	stw	%r31, 176(%r3)
	addi	%r3, %r3, 180
	bl	setup_second_table.3126
	addi	%r3, %r3, -180	# subi
	lwz	%r31, 176(%r3)
	mtlr	%r31	
	lwz	%r5, 172(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 168(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25866:
beq_cont.25864:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25867
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 60(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 164(%r3)
	lwz	%r8, 4(%r7)
	lwz	%r9, 0(%r7)
	lwz	%r10, 4(%r5)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.25869
	stw	%r8, 176(%r3)
	stw	%r2, 180(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 184(%r3)
	addi	%r3, %r3, 188
	bl	setup_rect_table.3120
	addi	%r3, %r3, -188	# subi
	lwz	%r31, 184(%r3)
	mtlr	%r31	
	lwz	%r5, 180(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 176(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25870
beq_else.25869:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.25871
	stw	%r8, 176(%r3)
	stw	%r2, 180(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 184(%r3)
	addi	%r3, %r3, 188
	bl	setup_surface_table.3123
	addi	%r3, %r3, -188	# subi
	lwz	%r31, 184(%r3)
	mtlr	%r31	
	lwz	%r5, 180(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 176(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25872
beq_else.25871:
	stw	%r8, 176(%r3)
	stw	%r2, 180(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 184(%r3)
	addi	%r3, %r3, 188
	bl	setup_second_table.3126
	addi	%r3, %r3, -188	# subi
	lwz	%r31, 184(%r3)
	mtlr	%r31	
	lwz	%r5, 180(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 176(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25872:
beq_cont.25870:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25873
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 60(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r7, 164(%r3)
	lwz	%r8, 4(%r7)
	lwz	%r9, 0(%r7)
	lwz	%r10, 4(%r5)
	cmpwi	%cr7, %r10, 1
	bne	%cr7, beq_else.25875
	stw	%r8, 184(%r3)
	stw	%r2, 188(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 192(%r3)
	addi	%r3, %r3, 196
	bl	setup_rect_table.3120
	addi	%r3, %r3, -196	# subi
	lwz	%r31, 192(%r3)
	mtlr	%r31	
	lwz	%r5, 188(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 184(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25876
beq_else.25875:
	cmpwi	%cr7, %r10, 2
	bne	%cr7, beq_else.25877
	stw	%r8, 184(%r3)
	stw	%r2, 188(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 192(%r3)
	addi	%r3, %r3, 196
	bl	setup_surface_table.3123
	addi	%r3, %r3, -196	# subi
	lwz	%r31, 192(%r3)
	mtlr	%r31	
	lwz	%r5, 188(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 184(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25878
beq_else.25877:
	stw	%r8, 184(%r3)
	stw	%r2, 188(%r3)
	mflr	%r31	
	or	%r2, %r9, %r9	# mr %r2, %r9
	stw	%r31, 192(%r3)
	addi	%r3, %r3, 196
	bl	setup_second_table.3126
	addi	%r3, %r3, -196	# subi
	lwz	%r31, 192(%r3)
	mtlr	%r31	
	lwz	%r5, 188(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 184(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25878:
beq_cont.25876:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 164(%r3)
	lwz	%r29, 56(%r3)
	mflr	%r31	
	stw	%r31, 192(%r3)
	addi	%r3, %r3, 196
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -196	# subi
	lwz	%r31, 192(%r3)
	mtlr	%r31	
	b	bge_cont.25874
bge_else.25873:
bge_cont.25874:
	b	bge_cont.25868
bge_else.25867:
bge_cont.25868:
	b	bge_cont.25862
bge_else.25861:
bge_cont.25862:
	addi	%r5, %r0, 118	# li
	lwz	%r2, 160(%r3)
	lwz	%r29, 52(%r3)
	mflr	%r31	
	stw	%r31, 192(%r3)
	addi	%r3, %r3, 196
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -196	# subi
	lwz	%r31, 192(%r3)
	mtlr	%r31	
	lwz	%r2, 64(%r3)
	lwz	%r2, 12(%r2)
	addi	%r5, %r0, 119	# li
	lwz	%r29, 52(%r3)
	mflr	%r31	
	stw	%r31, 192(%r3)
	addi	%r3, %r3, 196
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -196	# subi
	lwz	%r31, 192(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 2	# li
	lwz	%r29, 48(%r3)
	mflr	%r31	
	stw	%r31, 192(%r3)
	addi	%r3, %r3, 196
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -196	# subi
	lwz	%r31, 192(%r3)
	mtlr	%r31	
	lwz	%r2, 44(%r3)
	lfs	%f0, 0(%r2)	# float
	lwz	%r5, 40(%r3)
	stfs	%f0, 0(%r5)	# float
	lfs	%f0, 4(%r2)	# float
	stfs	%f0, 4(%r5)	# float
	lfs	%f0, 8(%r2)	# float
	stfs	%f0, 8(%r5)	# float
	lwz	%r2, 92(%r3)
	lwz	%r6, 0(%r2)
	addi	%r6, %r6, -1	# subi %r6, %r6, 1
	cmpwi	%cr7, %r6, 0
	blt	%cr7, bge_else.25879
	addi	%r31, %r0, 2	# li
	slw	%r7, %r6, %r31
	lwz	%r8, 60(%r3)
	add %r31, %r8, %r7
	lwz %r7, 0(%r31)
	lwz	%r9, 4(%r7)
	cmpwi	%cr7, %r9, 1
	bne	%cr7, beq_else.25881
	stw	%r6, 192(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r7, %r7	# mr %r5, %r7
	stw	%r31, 196(%r3)
	addi	%r3, %r3, 200
	bl	setup_rect_table.3120
	addi	%r3, %r3, -200	# subi
	lwz	%r31, 196(%r3)
	mtlr	%r31	
	lwz	%r5, 192(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 36(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25882
beq_else.25881:
	cmpwi	%cr7, %r9, 2
	bne	%cr7, beq_else.25883
	stw	%r6, 192(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r7, %r7	# mr %r5, %r7
	stw	%r31, 196(%r3)
	addi	%r3, %r3, 200
	bl	setup_surface_table.3123
	addi	%r3, %r3, -200	# subi
	lwz	%r31, 196(%r3)
	mtlr	%r31	
	lwz	%r5, 192(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 36(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25884
beq_else.25883:
	stw	%r6, 192(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r7, %r7	# mr %r5, %r7
	stw	%r31, 196(%r3)
	addi	%r3, %r3, 200
	bl	setup_second_table.3126
	addi	%r3, %r3, -200	# subi
	lwz	%r31, 196(%r3)
	mtlr	%r31	
	lwz	%r5, 192(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 36(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25884:
beq_cont.25882:
	addi	%r2, %r5, -1	# subi %r2, %r5, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25885
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 60(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r8, 4(%r5)
	cmpwi	%cr7, %r8, 1
	bne	%cr7, beq_else.25887
	lwz	%r8, 40(%r3)
	stw	%r2, 196(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 200(%r3)
	addi	%r3, %r3, 204
	bl	setup_rect_table.3120
	addi	%r3, %r3, -204	# subi
	lwz	%r31, 200(%r3)
	mtlr	%r31	
	lwz	%r5, 196(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 36(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25888
beq_else.25887:
	cmpwi	%cr7, %r8, 2
	bne	%cr7, beq_else.25889
	lwz	%r8, 40(%r3)
	stw	%r2, 196(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 200(%r3)
	addi	%r3, %r3, 204
	bl	setup_surface_table.3123
	addi	%r3, %r3, -204	# subi
	lwz	%r31, 200(%r3)
	mtlr	%r31	
	lwz	%r5, 196(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 36(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
	b	beq_cont.25890
beq_else.25889:
	lwz	%r8, 40(%r3)
	stw	%r2, 196(%r3)
	mflr	%r31	
	or	%r2, %r8, %r8	# mr %r2, %r8
	stw	%r31, 200(%r3)
	addi	%r3, %r3, 204
	bl	setup_second_table.3126
	addi	%r3, %r3, -204	# subi
	lwz	%r31, 200(%r3)
	mtlr	%r31	
	lwz	%r5, 196(%r3)
	addi	%r31, %r0, 2	# li
	slw	%r6, %r5, %r31
	lwz	%r7, 36(%r3)
	add %r31, %r7, %r6
	stw %r2, 0(%r31)
beq_cont.25890:
beq_cont.25888:
	addi	%r5, %r5, -1	# subi %r5, %r5, 1
	lwz	%r2, 32(%r3)
	lwz	%r29, 56(%r3)
	mflr	%r31	
	stw	%r31, 200(%r3)
	addi	%r3, %r3, 204
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -204	# subi
	lwz	%r31, 200(%r3)
	mtlr	%r31	
	b	bge_cont.25886
bge_else.25885:
bge_cont.25886:
	b	bge_cont.25880
bge_else.25879:
bge_cont.25880:
	lwz	%r2, 92(%r3)
	lwz	%r2, 0(%r2)
	addi	%r2, %r2, -1	# subi %r2, %r2, 1
	cmpwi	%cr7, %r2, 0
	blt	%cr7, bge_else.25891
	addi	%r31, %r0, 2	# li
	slw	%r5, %r2, %r31
	lwz	%r6, 60(%r3)
	add %r31, %r6, %r5
	lwz %r5, 0(%r31)
	lwz	%r6, 8(%r5)
	cmpwi	%cr7, %r6, 2
	bne	%cr7, beq_else.25893
	lwz	%r6, 28(%r5)
	lfs	%f0, 0(%r6)	# float
	addis	%r31, %r0, (l.18099)@h	# lis
	ori	%r31, %r31, (l.18099)@l
	lfs	%f1, 0(%r31)	# float
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.25895
	addi	%r6, %r0, 0	# li
	b	ble_cont.25896
ble_else.25895:
	addi	%r6, %r0, 1	# li
ble_cont.25896:
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.25897
	b	beq_cont.25898
beq_else.25897:
	lwz	%r6, 4(%r5)
	cmpwi	%cr7, %r6, 1
	bne	%cr7, beq_else.25899
	lwz	%r29, 28(%r3)
	mflr	%r31	
	stw	%r31, 200(%r3)
	addi	%r3, %r3, 204
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -204	# subi
	lwz	%r31, 200(%r3)
	mtlr	%r31	
	b	beq_cont.25900
beq_else.25899:
	cmpwi	%cr7, %r6, 2
	bne	%cr7, beq_else.25901
	lwz	%r29, 24(%r3)
	mflr	%r31	
	stw	%r31, 200(%r3)
	addi	%r3, %r3, 204
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -204	# subi
	lwz	%r31, 200(%r3)
	mtlr	%r31	
	b	beq_cont.25902
beq_else.25901:
beq_cont.25902:
beq_cont.25900:
beq_cont.25898:
	b	beq_cont.25894
beq_else.25893:
beq_cont.25894:
	b	bge_cont.25892
bge_else.25891:
bge_cont.25892:
	addi	%r2, %r0, 0	# li
	addi	%r5, %r0, 0	# li
	lwz	%r6, 112(%r3)
	lfs	%f0, 0(%r6)	# float
	lwz	%r7, 20(%r3)
	lwz	%r8, 4(%r7)
	subf	%r2, %r8, %r2	# sub	%r2, %r2, %r8
	stw	%r5, 200(%r3)
	stfs	%f0, 208(%r3)	# float
	mflr	%r31	
	stw	%r31, 216(%r3)
	addi	%r3, %r3, 220
	bl	float_of_int.2840
	addi	%r3, %r3, -220	# subi
	lwz	%r31, 216(%r3)
	mtlr	%r31	
	lfs	%f1, 208(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 16(%r3)
	lfs	%f1, 0(%r2)	# float
	fmul	%f1, %f0, %f1
	lwz	%r5, 12(%r3)
	lfs	%f2, 0(%r5)	# float
	fadd	%f1, %f1, %f2
	lfs	%f2, 4(%r2)	# float
	fmul	%f2, %f0, %f2
	lfs	%f3, 4(%r5)	# float
	fadd	%f2, %f2, %f3
	lfs	%f3, 8(%r2)	# float
	fmul	%f0, %f0, %f3
	lfs	%f3, 8(%r5)	# float
	fadd	%f0, %f0, %f3
	lwz	%r6, 108(%r3)
	lwz	%r7, 0(%r6)
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	lwz	%r8, 140(%r3)
	lwz	%r9, 200(%r3)
	lwz	%r29, 8(%r3)
	mflr	%r31	
	or	%r6, %r9, %r9	# mr %r6, %r9
	or	%r5, %r7, %r7	# mr %r5, %r7
	or	%r2, %r8, %r8	# mr %r2, %r8
	fmr	%f31, %f2
	fmr	%f2, %f0
	fmr	%f0, %f1
	fmr	%f1, %f31
	stw	%r31, 216(%r3)
	addi	%r3, %r3, 220
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -220	# subi
	lwz	%r31, 216(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 0	# li
	addi	%r2, %r0, 2	# li
	lwz	%r6, 108(%r3)
	lwz	%r7, 4(%r6)
	cmpwi	%cr7, %r7, 0
	bgt	%cr7, ble_else.25904
	blr
ble_else.25904:
	lwz	%r7, 4(%r6)
	addi	%r7, %r7, -1	# subi %r7, %r7, 1
	stw	%r5, 216(%r3)
	cmpwi	%cr7, %r7, 0	
	bgt	%cr7, ble_else.25906
	b	ble_cont.25907
ble_else.25906:
	addi	%r7, %r0, 1	# li
	lwz	%r8, 112(%r3)
	lfs	%f0, 0(%r8)	# float
	lwz	%r8, 20(%r3)
	lwz	%r8, 4(%r8)
	subf	%r7, %r8, %r7	# sub	%r7, %r7, %r8
	stw	%r2, 220(%r3)
	stfs	%f0, 224(%r3)	# float
	mflr	%r31	
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 232(%r3)
	addi	%r3, %r3, 236
	bl	float_of_int.2840
	addi	%r3, %r3, -236	# subi
	lwz	%r31, 232(%r3)
	mtlr	%r31	
	lfs	%f1, 224(%r3)	# float
	fmul	%f0, %f1, %f0
	lwz	%r2, 16(%r3)
	lfs	%f1, 0(%r2)	# float
	fmul	%f1, %f0, %f1
	lwz	%r5, 12(%r3)
	lfs	%f2, 0(%r5)	# float
	fadd	%f1, %f1, %f2
	lfs	%f2, 4(%r2)	# float
	fmul	%f2, %f0, %f2
	lfs	%f3, 4(%r5)	# float
	fadd	%f2, %f2, %f3
	lfs	%f3, 8(%r2)	# float
	fmul	%f0, %f0, %f3
	lfs	%f3, 8(%r5)	# float
	fadd	%f0, %f0, %f3
	lwz	%r2, 108(%r3)
	lwz	%r2, 0(%r2)
	addi	%r5, %r2, -1	# subi %r5, %r2, 1
	lwz	%r2, 148(%r3)
	lwz	%r6, 220(%r3)
	lwz	%r29, 8(%r3)
	mflr	%r31	
	fmr	%f31, %f2
	fmr	%f2, %f0
	fmr	%f0, %f1
	fmr	%f1, %f31
	stw	%r31, 232(%r3)
	addi	%r3, %r3, 236
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -236	# subi
	lwz	%r31, 232(%r3)
	mtlr	%r31	
ble_cont.25907:
	addi	%r2, %r0, 0	# li
	lwz	%r5, 216(%r3)
	lwz	%r6, 132(%r3)
	lwz	%r7, 140(%r3)
	lwz	%r8, 148(%r3)
	lwz	%r29, 4(%r3)
	mflr	%r31	
	stw	%r31, 232(%r3)
	addi	%r3, %r3, 236
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -236	# subi
	lwz	%r31, 232(%r3)
	mtlr	%r31	
	addi	%r2, %r0, 1	# li
	addi	%r8, %r0, 4	# li
	lwz	%r5, 140(%r3)
	lwz	%r6, 148(%r3)
	lwz	%r7, 132(%r3)
	lwz	%r29, 0(%r3)
	lwz	%r28, 0(%r29)
	mtctr	%r28	
	bctr
_min_caml_start: # main entry point
	addi	%r1, %r0, 170
#	main program starts
	addis	%r31, %r0, (l.20082)@h	# lis
	ori	%r31, %r31, (l.20082)@l
	lfs	%f0, 0(%r31)	# float
	or	%r2, %r4, %r4	# mr %r2, %r4
	addi	%r4, %r4, 8
	addis	%r5, %r0, (sqrt_sub.2845)@h	# lis
	ori	%r5, %r5, (sqrt_sub.2845)@l
	stw	%r5, 0(%r2)
	stfs	%f0, 4(%r2)	# float
	addi	%r5, %r0, 1	# li
	addi	%r6, %r0, 0	# li
	stw	%r2, 0(%r3)
	stfs	%f0, 8(%r3)	# float
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 16(%r3)
	addi	%r3, %r3, 20
	bl	min_caml_create_array
	addi	%r3, %r3, -20	# subi
	lwz	%r31, 16(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 0	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 16(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_create_float_array
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 60	# li
	addi	%r6, %r0, 0	# li
	addi	%r7, %r0, 0	# li
	addi	%r8, %r0, 0	# li
	addi	%r9, %r0, 0	# li
	addi	%r10, %r0, 0	# li
	or	%r11, %r4, %r4	# mr %r11, %r4
	addi	%r4, %r4, 44
	stw	%r2, 40(%r11)
	stw	%r2, 36(%r11)
	stw	%r2, 32(%r11)
	stw	%r2, 28(%r11)
	stw	%r10, 24(%r11)
	stw	%r2, 20(%r11)
	stw	%r2, 16(%r11)
	stw	%r9, 12(%r11)
	stw	%r8, 8(%r11)
	stw	%r7, 4(%r11)
	stw	%r6, 0(%r11)
	or	%r2, %r11, %r11	# mr %r2, %r11
	mflr	%r31	
	or	%r28, %r5, %r5	# mr %r28, %r5
	or	%r5, %r2, %r2	# mr %r5, %r2
	or	%r2, %r28, %r28	# mr %r2, %r28
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_create_array
	addi	%r3, %r3, -24	# subi
	lwz	%r31, 20(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 20(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 24(%r3)
	addi	%r3, %r3, 28
	bl	min_caml_create_float_array
	addi	%r3, %r3, -28	# subi
	lwz	%r31, 24(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 24(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_float_array
	addi	%r3, %r3, -32	# subi
	lwz	%r31, 28(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 28(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 32(%r3)
	addi	%r3, %r3, 36
	bl	min_caml_create_float_array
	addi	%r3, %r3, -36	# subi
	lwz	%r31, 32(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 1	# li
	addis	%r31, %r0, (l.18791)@h	# lis
	ori	%r31, %r31, (l.18791)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 32(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_create_float_array
	addi	%r3, %r3, -40	# subi
	lwz	%r31, 36(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 50	# li
	addi	%r6, %r0, 1	# li
	addi	%r7, %r0, -1	# li
	stw	%r2, 36(%r3)
	stw	%r5, 40(%r3)
	mflr	%r31	
	or	%r5, %r7, %r7	# mr %r5, %r7
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_create_array
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 40(%r3)
	mflr	%r31	
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_create_array
	addi	%r3, %r3, -48	# subi
	lwz	%r31, 44(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 1	# li
	addi	%r6, %r0, 1	# li
	lwz	%r7, 0(%r2)
	stw	%r2, 44(%r3)
	stw	%r5, 48(%r3)
	mflr	%r31	
	or	%r5, %r7, %r7	# mr %r5, %r7
	or	%r2, %r6, %r6	# mr %r2, %r6
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	min_caml_create_array
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	lwz	%r2, 48(%r3)
	mflr	%r31	
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	min_caml_create_array
	addi	%r3, %r3, -56	# subi
	lwz	%r31, 52(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 1	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 52(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 56(%r3)
	addi	%r3, %r3, 60
	bl	min_caml_create_float_array
	addi	%r3, %r3, -60	# subi
	lwz	%r31, 56(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 1	# li
	addi	%r6, %r0, 0	# li
	stw	%r2, 56(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	min_caml_create_array
	addi	%r3, %r3, -64	# subi
	lwz	%r31, 60(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 1	# li
	addis	%r31, %r0, (l.18733)@h	# lis
	ori	%r31, %r31, (l.18733)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 60(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 64(%r3)
	addi	%r3, %r3, 68
	bl	min_caml_create_float_array
	addi	%r3, %r3, -68	# subi
	lwz	%r31, 64(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 64(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	min_caml_create_float_array
	addi	%r3, %r3, -72	# subi
	lwz	%r31, 68(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 1	# li
	addi	%r6, %r0, 0	# li
	stw	%r2, 68(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 72(%r3)
	addi	%r3, %r3, 76
	bl	min_caml_create_array
	addi	%r3, %r3, -76	# subi
	lwz	%r31, 72(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 72(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	min_caml_create_float_array
	addi	%r3, %r3, -80	# subi
	lwz	%r31, 76(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 76(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 80(%r3)
	addi	%r3, %r3, 84
	bl	min_caml_create_float_array
	addi	%r3, %r3, -84	# subi
	lwz	%r31, 80(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 80(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	min_caml_create_float_array
	addi	%r3, %r3, -88	# subi
	lwz	%r31, 84(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 84(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 88(%r3)
	addi	%r3, %r3, 92
	bl	min_caml_create_float_array
	addi	%r3, %r3, -92	# subi
	lwz	%r31, 88(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 2	# li
	addi	%r6, %r0, 0	# li
	stw	%r2, 88(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	min_caml_create_array
	addi	%r3, %r3, -96	# subi
	lwz	%r31, 92(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 2	# li
	addi	%r6, %r0, 0	# li
	stw	%r2, 92(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 96(%r3)
	addi	%r3, %r3, 100
	bl	min_caml_create_array
	addi	%r3, %r3, -100	# subi
	lwz	%r31, 96(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 1	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 96(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	min_caml_create_float_array
	addi	%r3, %r3, -104	# subi
	lwz	%r31, 100(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 100(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 104(%r3)
	addi	%r3, %r3, 108
	bl	min_caml_create_float_array
	addi	%r3, %r3, -108	# subi
	lwz	%r31, 104(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 104(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	min_caml_create_float_array
	addi	%r3, %r3, -112	# subi
	lwz	%r31, 108(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 108(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 112(%r3)
	addi	%r3, %r3, 116
	bl	min_caml_create_float_array
	addi	%r3, %r3, -116	# subi
	lwz	%r31, 112(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 112(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	min_caml_create_float_array
	addi	%r3, %r3, -120	# subi
	lwz	%r31, 116(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 116(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 120(%r3)
	addi	%r3, %r3, 124
	bl	min_caml_create_float_array
	addi	%r3, %r3, -124	# subi
	lwz	%r31, 120(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 120(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	min_caml_create_float_array
	addi	%r3, %r3, -128	# subi
	lwz	%r31, 124(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 0	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 124(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 128(%r3)
	addi	%r3, %r3, 132
	bl	min_caml_create_float_array
	addi	%r3, %r3, -132	# subi
	lwz	%r31, 128(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	addi	%r2, %r0, 0	# li
	stw	%r5, 128(%r3)
	mflr	%r31	
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	min_caml_create_array
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 0	# li
	or	%r6, %r4, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r6)
	lwz	%r2, 128(%r3)
	stw	%r2, 0(%r6)
	or	%r2, %r6, %r6	# mr %r2, %r6
	mflr	%r31	
	or	%r28, %r5, %r5	# mr %r28, %r5
	or	%r5, %r2, %r2	# mr %r5, %r2
	or	%r2, %r28, %r28	# mr %r2, %r28
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	min_caml_create_array
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	addi	%r2, %r0, 5	# li
	mflr	%r31	
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	min_caml_create_array
	addi	%r3, %r3, -136	# subi
	lwz	%r31, 132(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 0	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 132(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 136(%r3)
	addi	%r3, %r3, 140
	bl	min_caml_create_float_array
	addi	%r3, %r3, -140	# subi
	lwz	%r31, 136(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 3	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r2, 136(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	stw	%r31, 140(%r3)
	addi	%r3, %r3, 144
	bl	min_caml_create_float_array
	addi	%r3, %r3, -144	# subi
	lwz	%r31, 140(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 60	# li
	lwz	%r6, 136(%r3)
	stw	%r2, 140(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 144(%r3)
	addi	%r3, %r3, 148
	bl	min_caml_create_array
	addi	%r3, %r3, -148	# subi
	lwz	%r31, 144(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r5)
	lwz	%r6, 140(%r3)
	stw	%r6, 0(%r5)
	addi	%r7, %r0, 0	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	stw	%r5, 144(%r3)
	stw	%r2, 148(%r3)
	mflr	%r31	
	or	%r2, %r7, %r7	# mr %r2, %r7
	stw	%r31, 152(%r3)
	addi	%r3, %r3, 156
	bl	min_caml_create_float_array
	addi	%r3, %r3, -156	# subi
	lwz	%r31, 152(%r3)
	or	%r5, %r2, %r2	# mr %r5, %r2
	mtlr	%r31	
	addi	%r2, %r0, 0	# li
	stw	%r5, 152(%r3)
	mflr	%r31	
	stw	%r31, 156(%r3)
	addi	%r3, %r3, 160
	bl	min_caml_create_array
	addi	%r3, %r3, -160	# subi
	lwz	%r31, 156(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 8
	stw	%r2, 4(%r5)
	lwz	%r2, 152(%r3)
	stw	%r2, 0(%r5)
	or	%r2, %r5, %r5	# mr %r2, %r5
	addi	%r5, %r0, 180	# li
	addi	%r6, %r0, 0	# li
	addis	%r31, %r0, (l.18091)@h	# lis
	ori	%r31, %r31, (l.18091)@l
	lfs	%f0, 0(%r31)	# float
	or	%r7, %r4, %r4	# mr %r7, %r4
	addi	%r4, %r4, 12
	stfs	%f0, 8(%r7)	# float
	stw	%r2, 4(%r7)
	stw	%r6, 0(%r7)
	or	%r2, %r7, %r7	# mr %r2, %r7
	mflr	%r31	
	or	%r28, %r5, %r5	# mr %r28, %r5
	or	%r5, %r2, %r2	# mr %r5, %r2
	or	%r2, %r28, %r28	# mr %r2, %r28
	stw	%r31, 156(%r3)
	addi	%r3, %r3, 160
	bl	min_caml_create_array
	addi	%r3, %r3, -160	# subi
	lwz	%r31, 156(%r3)
	mtlr	%r31	
	addi	%r5, %r0, 1	# li
	addi	%r6, %r0, 0	# li
	stw	%r2, 156(%r3)
	mflr	%r31	
	or	%r2, %r5, %r5	# mr %r2, %r5
	or	%r5, %r6, %r6	# mr %r5, %r6
	stw	%r31, 160(%r3)
	addi	%r3, %r3, 164
	bl	min_caml_create_array
	addi	%r3, %r3, -164	# subi
	lwz	%r31, 160(%r3)
	mtlr	%r31	
	or	%r5, %r4, %r4	# mr %r5, %r4
	addi	%r4, %r4, 12
	addis	%r6, %r0, (vecunit_sgn.2914)@h	# lis
	ori	%r6, %r6, (vecunit_sgn.2914)@l
	stw	%r6, 0(%r5)
	lfs	%f0, 8(%r3)	# float
	stfs	%f0, 8(%r5)	# float
	lwz	%r6, 0(%r3)
	stw	%r6, 4(%r5)
	or	%r7, %r4, %r4	# mr %r7, %r4
	addi	%r4, %r4, 24
	addis	%r8, %r0, (read_screen_settings.3015)@h	# lis
	ori	%r8, %r8, (read_screen_settings.3015)@l
	stw	%r8, 0(%r7)
	lwz	%r8, 28(%r3)
	stw	%r8, 20(%r7)
	lwz	%r9, 120(%r3)
	stw	%r9, 16(%r7)
	lwz	%r10, 116(%r3)
	stw	%r10, 12(%r7)
	lwz	%r11, 112(%r3)
	stw	%r11, 8(%r7)
	lwz	%r12, 24(%r3)
	stw	%r12, 4(%r7)
	or	%r12, %r4, %r4	# mr %r12, %r4
	addi	%r4, %r4, 12
	addis	%r13, %r0, (read_light.3017)@h	# lis
	ori	%r13, %r13, (read_light.3017)@l
	stw	%r13, 0(%r12)
	lwz	%r13, 32(%r3)
	stw	%r13, 8(%r12)
	lwz	%r14, 36(%r3)
	stw	%r14, 4(%r12)
	or	%r15, %r4, %r4	# mr %r15, %r4
	addi	%r4, %r4, 12
	addis	%r16, %r0, (read_nth_object.3022)@h	# lis
	ori	%r16, %r16, (read_nth_object.3022)@l
	stw	%r16, 0(%r15)
	stw	%r5, 8(%r15)
	lwz	%r16, 20(%r3)
	stw	%r16, 4(%r15)
	or	%r17, %r4, %r4	# mr %r17, %r4
	addi	%r4, %r4, 12
	addis	%r18, %r0, (read_object.3024)@h	# lis
	ori	%r18, %r18, (read_object.3024)@l
	stw	%r18, 0(%r17)
	stw	%r15, 8(%r17)
	lwz	%r18, 16(%r3)
	stw	%r18, 4(%r17)
	or	%r19, %r4, %r4	# mr %r19, %r4
	addi	%r4, %r4, 8
	addis	%r20, %r0, (read_and_network.3032)@h	# lis
	ori	%r20, %r20, (read_and_network.3032)@l
	stw	%r20, 0(%r19)
	lwz	%r20, 44(%r3)
	stw	%r20, 4(%r19)
	or	%r21, %r4, %r4	# mr %r21, %r4
	addi	%r4, %r4, 8
	addis	%r22, %r0, (solver_rect_surface.3036)@h	# lis
	ori	%r22, %r22, (solver_rect_surface.3036)@l
	stw	%r22, 0(%r21)
	lwz	%r22, 56(%r3)
	stw	%r22, 4(%r21)
	or	%r23, %r4, %r4	# mr %r23, %r4
	addi	%r4, %r4, 8
	addis	%r24, %r0, (solver_surface.3051)@h	# lis
	ori	%r24, %r24, (solver_surface.3051)@l
	stw	%r24, 0(%r23)
	stw	%r22, 4(%r23)
	or	%r24, %r4, %r4	# mr %r24, %r4
	addi	%r4, %r4, 16
	addis	%r25, %r0, (solver_second.3070)@h	# lis
	ori	%r25, %r25, (solver_second.3070)@l
	stw	%r25, 0(%r24)
	stfs	%f0, 12(%r24)	# float
	stw	%r6, 8(%r24)
	stw	%r22, 4(%r24)
	or	%r25, %r4, %r4	# mr %r25, %r4
	addi	%r4, %r4, 20
	addis	%r26, %r0, (solver.3076)@h	# lis
	ori	%r26, %r26, (solver.3076)@l
	stw	%r26, 0(%r25)
	stw	%r24, 16(%r25)
	stw	%r21, 12(%r25)
	stw	%r22, 8(%r25)
	stw	%r16, 4(%r25)
	or	%r26, %r4, %r4	# mr %r26, %r4
	addi	%r4, %r4, 8
	addis	%r27, %r0, (solver_rect_fast.3080)@h	# lis
	ori	%r27, %r27, (solver_rect_fast.3080)@l
	stw	%r27, 0(%r26)
	stw	%r22, 4(%r26)
	or	%r27, %r4, %r4	# mr %r27, %r4
	addi	%r4, %r4, 16
	addis	%r28, %r0, (solver_second_fast.3093)@h	# lis
	ori	%r28, %r28, (solver_second_fast.3093)@l
	stw	%r28, 0(%r27)
	stfs	%f0, 12(%r27)	# float
	stw	%r6, 8(%r27)
	stw	%r22, 4(%r27)
	or	%r28, %r4, %r4	# mr %r28, %r4
	addi	%r4, %r4, 16
	addis	%r29, %r0, (solver_second_fast2.3110)@h	# lis
	ori	%r29, %r29, (solver_second_fast2.3110)@l
	stw	%r29, 0(%r28)
	stfs	%f0, 12(%r28)	# float
	stw	%r6, 8(%r28)
	stw	%r22, 4(%r28)
	or	%r29, %r4, %r4	# mr %r29, %r4
	addi	%r4, %r4, 20
	addis	%r30, %r0, (solver_fast2.3117)@h	# lis
	ori	%r30, %r30, (solver_fast2.3117)@l
	stw	%r30, 0(%r29)
	stw	%r28, 16(%r29)
	stw	%r26, 12(%r29)
	stw	%r22, 8(%r29)
	stw	%r16, 4(%r29)
	or	%r30, %r4, %r4	# mr %r30, %r4
	addi	%r4, %r4, 8
	stw	%r19, 160(%r3)
	addis	%r19, %r0, (iter_setup_dirvec_constants.3129)@h	# lis
	ori	%r19, %r19, (iter_setup_dirvec_constants.3129)@l
	stw	%r19, 0(%r30)
	stw	%r16, 4(%r30)
	or	%r19, %r4, %r4	# mr %r19, %r4
	addi	%r4, %r4, 8
	stw	%r12, 164(%r3)
	addis	%r12, %r0, (setup_startp_constants.3134)@h	# lis
	ori	%r12, %r12, (setup_startp_constants.3134)@l
	stw	%r12, 0(%r19)
	stw	%r16, 4(%r19)
	or	%r12, %r4, %r4	# mr %r12, %r4
	addi	%r4, %r4, 8
	stw	%r15, 168(%r3)
	addis	%r15, %r0, (check_all_inside.3159)@h	# lis
	ori	%r15, %r15, (check_all_inside.3159)@l
	stw	%r15, 0(%r12)
	stw	%r16, 4(%r12)
	or	%r15, %r4, %r4	# mr %r15, %r4
	addi	%r4, %r4, 40
	stw	%r17, 172(%r3)
	addis	%r17, %r0, (shadow_check_and_group.3165)@h	# lis
	ori	%r17, %r17, (shadow_check_and_group.3165)@l
	stw	%r17, 0(%r15)
	lwz	%r17, 140(%r3)
	stw	%r17, 36(%r15)
	stw	%r27, 32(%r15)
	stw	%r26, 28(%r15)
	stw	%r22, 24(%r15)
	stw	%r16, 20(%r15)
	stw	%r13, 16(%r15)
	stw	%r7, 176(%r3)
	lwz	%r7, 68(%r3)
	stw	%r7, 12(%r15)
	stw	%r30, 180(%r3)
	lwz	%r30, 148(%r3)
	stw	%r30, 8(%r15)
	stw	%r12, 4(%r15)
	or	%r10, %r4, %r4	# mr %r10, %r4
	addi	%r4, %r4, 12
	addis	%r9, %r0, (shadow_check_one_or_group.3168)@h	# lis
	ori	%r9, %r9, (shadow_check_one_or_group.3168)@l
	stw	%r9, 0(%r10)
	stw	%r15, 8(%r10)
	stw	%r20, 4(%r10)
	or	%r9, %r4, %r4	# mr %r9, %r4
	addi	%r4, %r4, 44
	addis	%r11, %r0, (shadow_check_one_or_matrix.3171)@h	# lis
	ori	%r11, %r11, (shadow_check_one_or_matrix.3171)@l
	stw	%r11, 0(%r9)
	stw	%r17, 40(%r9)
	stw	%r27, 36(%r9)
	stw	%r26, 32(%r9)
	stw	%r22, 28(%r9)
	stw	%r10, 24(%r9)
	stw	%r15, 20(%r9)
	stw	%r16, 16(%r9)
	stw	%r7, 12(%r9)
	stw	%r30, 8(%r9)
	stw	%r20, 4(%r9)
	or	%r10, %r4, %r4	# mr %r10, %r4
	addi	%r4, %r4, 48
	addis	%r11, %r0, (solve_each_element.3174)@h	# lis
	ori	%r11, %r11, (solve_each_element.3174)@l
	stw	%r11, 0(%r10)
	lwz	%r11, 64(%r3)
	stw	%r11, 44(%r10)
	lwz	%r15, 104(%r3)
	stw	%r15, 40(%r10)
	stw	%r23, 36(%r10)
	stw	%r24, 32(%r10)
	stw	%r21, 28(%r10)
	stw	%r22, 24(%r10)
	stw	%r16, 20(%r10)
	lwz	%r27, 60(%r3)
	stw	%r27, 16(%r10)
	stw	%r7, 12(%r10)
	lwz	%r30, 72(%r3)
	stw	%r30, 8(%r10)
	stw	%r12, 4(%r10)
	or	%r17, %r4, %r4	# mr %r17, %r4
	addi	%r4, %r4, 12
	addis	%r8, %r0, (solve_one_or_network.3178)@h	# lis
	ori	%r8, %r8, (solve_one_or_network.3178)@l
	stw	%r8, 0(%r17)
	stw	%r10, 8(%r17)
	stw	%r20, 4(%r17)
	or	%r8, %r4, %r4	# mr %r8, %r4
	addi	%r4, %r4, 48
	addis	%r14, %r0, (trace_or_matrix.3182)@h	# lis
	ori	%r14, %r14, (trace_or_matrix.3182)@l
	stw	%r14, 0(%r8)
	stw	%r11, 44(%r8)
	stw	%r15, 40(%r8)
	stw	%r23, 36(%r8)
	stw	%r24, 32(%r8)
	stw	%r21, 28(%r8)
	stw	%r22, 24(%r8)
	stw	%r25, 20(%r8)
	stw	%r17, 16(%r8)
	stw	%r10, 12(%r8)
	stw	%r16, 8(%r8)
	stw	%r20, 4(%r8)
	or	%r10, %r4, %r4	# mr %r10, %r4
	addi	%r4, %r4, 44
	addis	%r14, %r0, (solve_each_element_fast.3188)@h	# lis
	ori	%r14, %r14, (solve_each_element_fast.3188)@l
	stw	%r14, 0(%r10)
	stw	%r11, 40(%r10)
	lwz	%r14, 108(%r3)
	stw	%r14, 36(%r10)
	stw	%r28, 32(%r10)
	stw	%r26, 28(%r10)
	stw	%r22, 24(%r10)
	stw	%r16, 20(%r10)
	stw	%r27, 16(%r10)
	stw	%r7, 12(%r10)
	stw	%r30, 8(%r10)
	stw	%r12, 4(%r10)
	or	%r12, %r4, %r4	# mr %r12, %r4
	addi	%r4, %r4, 12
	addis	%r17, %r0, (solve_one_or_network_fast.3192)@h	# lis
	ori	%r17, %r17, (solve_one_or_network_fast.3192)@l
	stw	%r17, 0(%r12)
	stw	%r10, 8(%r12)
	stw	%r20, 4(%r12)
	or	%r17, %r4, %r4	# mr %r17, %r4
	addi	%r4, %r4, 40
	addis	%r21, %r0, (trace_or_matrix_fast.3196)@h	# lis
	ori	%r21, %r21, (trace_or_matrix_fast.3196)@l
	stw	%r21, 0(%r17)
	stw	%r11, 36(%r17)
	stw	%r28, 32(%r17)
	stw	%r26, 28(%r17)
	stw	%r29, 24(%r17)
	stw	%r22, 20(%r17)
	stw	%r12, 16(%r17)
	stw	%r10, 12(%r17)
	stw	%r16, 8(%r17)
	stw	%r20, 4(%r17)
	or	%r21, %r4, %r4	# mr %r21, %r4
	addi	%r4, %r4, 36
	addis	%r23, %r0, (judge_intersection_fast.3200)@h	# lis
	ori	%r23, %r23, (judge_intersection_fast.3200)@l
	stw	%r23, 0(%r21)
	stw	%r17, 32(%r21)
	stw	%r11, 28(%r21)
	stw	%r29, 24(%r21)
	stw	%r22, 20(%r21)
	stw	%r12, 16(%r21)
	stw	%r10, 12(%r21)
	lwz	%r10, 52(%r3)
	stw	%r10, 8(%r21)
	stw	%r20, 4(%r21)
	or	%r12, %r4, %r4	# mr %r12, %r4
	addi	%r4, %r4, 16
	addis	%r22, %r0, (get_nvector_second.3206)@h	# lis
	ori	%r22, %r22, (get_nvector_second.3206)@l
	stw	%r22, 0(%r12)
	stw	%r5, 12(%r12)
	lwz	%r22, 76(%r3)
	stw	%r22, 8(%r12)
	stw	%r7, 4(%r12)
	or	%r23, %r4, %r4	# mr %r23, %r4
	addi	%r4, %r4, 16
	addis	%r24, %r0, (utexture.3211)@h	# lis
	ori	%r24, %r24, (utexture.3211)@l
	stw	%r24, 0(%r23)
	stfs	%f0, 12(%r23)	# float
	lwz	%r24, 80(%r3)
	stw	%r24, 8(%r23)
	stw	%r6, 4(%r23)
	or	%r25, %r4, %r4	# mr %r25, %r4
	addi	%r4, %r4, 44
	addis	%r26, %r0, (trace_reflections.3218)@h	# lis
	ori	%r26, %r26, (trace_reflections.3218)@l
	stw	%r26, 0(%r25)
	stw	%r17, 40(%r25)
	stw	%r11, 36(%r25)
	stw	%r24, 32(%r25)
	stw	%r9, 28(%r25)
	lwz	%r26, 88(%r3)
	stw	%r26, 24(%r25)
	lwz	%r28, 156(%r3)
	stw	%r28, 20(%r25)
	stw	%r10, 16(%r25)
	stw	%r22, 12(%r25)
	stw	%r27, 8(%r25)
	stw	%r30, 4(%r25)
	or	%r29, %r4, %r4	# mr %r29, %r4
	addi	%r4, %r4, 88
	addis	%r20, %r0, (trace_ray.3223)@h	# lis
	ori	%r20, %r20, (trace_ray.3223)@l
	stw	%r20, 0(%r29)
	stw	%r23, 84(%r29)
	stw	%r25, 80(%r29)
	stw	%r8, 76(%r29)
	stw	%r11, 72(%r29)
	stw	%r24, 68(%r29)
	stw	%r14, 64(%r29)
	stw	%r15, 60(%r29)
	stw	%r9, 56(%r29)
	stw	%r19, 52(%r29)
	stw	%r26, 48(%r29)
	stw	%r10, 44(%r29)
	stw	%r16, 40(%r29)
	stw	%r22, 36(%r29)
	stw	%r2, 32(%r29)
	stw	%r18, 28(%r29)
	stw	%r13, 24(%r29)
	stw	%r27, 20(%r29)
	stw	%r7, 16(%r29)
	stw	%r30, 12(%r29)
	stw	%r12, 8(%r29)
	lwz	%r8, 36(%r3)
	stw	%r8, 4(%r29)
	or	%r8, %r4, %r4	# mr %r8, %r4
	addi	%r4, %r4, 60
	addis	%r20, %r0, (trace_diffuse_ray.3229)@h	# lis
	ori	%r20, %r20, (trace_diffuse_ray.3229)@l
	stw	%r20, 0(%r8)
	stw	%r23, 56(%r8)
	stw	%r17, 52(%r8)
	stw	%r11, 48(%r8)
	stw	%r24, 44(%r8)
	stw	%r9, 40(%r8)
	stw	%r10, 36(%r8)
	stw	%r16, 32(%r8)
	stw	%r22, 28(%r8)
	stw	%r13, 24(%r8)
	stw	%r27, 20(%r8)
	stw	%r7, 16(%r8)
	stw	%r30, 12(%r8)
	stw	%r12, 8(%r8)
	lwz	%r11, 84(%r3)
	stw	%r11, 4(%r8)
	or	%r17, %r4, %r4	# mr %r17, %r4
	addi	%r4, %r4, 60
	addis	%r20, %r0, (iter_trace_diffuse_rays.3232)@h	# lis
	ori	%r20, %r20, (iter_trace_diffuse_rays.3232)@l
	stw	%r20, 0(%r17)
	stw	%r23, 56(%r17)
	stw	%r8, 52(%r17)
	stw	%r24, 48(%r17)
	stw	%r9, 44(%r17)
	stw	%r10, 40(%r17)
	stw	%r16, 36(%r17)
	stw	%r22, 32(%r17)
	stw	%r13, 28(%r17)
	stw	%r21, 24(%r17)
	stw	%r27, 20(%r17)
	stw	%r7, 16(%r17)
	stw	%r30, 12(%r17)
	stw	%r12, 8(%r17)
	stw	%r11, 4(%r17)
	or	%r7, %r4, %r4	# mr %r7, %r4
	addi	%r4, %r4, 24
	addis	%r9, %r0, (trace_diffuse_ray_80percent.3241)@h	# lis
	ori	%r9, %r9, (trace_diffuse_ray_80percent.3241)@l
	stw	%r9, 0(%r7)
	stw	%r14, 20(%r7)
	stw	%r19, 16(%r7)
	stw	%r18, 12(%r7)
	stw	%r17, 8(%r7)
	lwz	%r9, 132(%r3)
	stw	%r9, 4(%r7)
	or	%r12, %r4, %r4	# mr %r12, %r4
	addi	%r4, %r4, 36
	addis	%r20, %r0, (calc_diffuse_using_1point.3245)@h	# lis
	ori	%r20, %r20, (calc_diffuse_using_1point.3245)@l
	stw	%r20, 0(%r12)
	stw	%r8, 32(%r12)
	stw	%r14, 28(%r12)
	stw	%r19, 24(%r12)
	stw	%r26, 20(%r12)
	stw	%r18, 16(%r12)
	stw	%r17, 12(%r12)
	stw	%r9, 8(%r12)
	stw	%r11, 4(%r12)
	or	%r20, %r4, %r4	# mr %r20, %r4
	addi	%r4, %r4, 12
	addis	%r21, %r0, (calc_diffuse_using_5points.3248)@h	# lis
	ori	%r21, %r21, (calc_diffuse_using_5points.3248)@l
	stw	%r21, 0(%r20)
	stw	%r26, 8(%r20)
	stw	%r11, 4(%r20)
	or	%r21, %r4, %r4	# mr %r21, %r4
	addi	%r4, %r4, 20
	addis	%r22, %r0, (do_without_neighbors.3254)@h	# lis
	ori	%r22, %r22, (do_without_neighbors.3254)@l
	stw	%r22, 0(%r21)
	stw	%r7, 16(%r21)
	stw	%r26, 12(%r21)
	stw	%r11, 8(%r21)
	stw	%r12, 4(%r21)
	or	%r7, %r4, %r4	# mr %r7, %r4
	addi	%r4, %r4, 24
	addis	%r22, %r0, (try_exploit_neighbors.3270)@h	# lis
	ori	%r22, %r22, (try_exploit_neighbors.3270)@l
	stw	%r22, 0(%r7)
	stw	%r26, 20(%r7)
	stw	%r21, 16(%r7)
	stw	%r11, 12(%r7)
	stw	%r20, 8(%r7)
	stw	%r12, 4(%r7)
	or	%r22, %r4, %r4	# mr %r22, %r4
	addi	%r4, %r4, 8
	addis	%r23, %r0, (write_rgb.3281)@h	# lis
	ori	%r23, %r23, (write_rgb.3281)@l
	stw	%r23, 0(%r22)
	stw	%r26, 4(%r22)
	or	%r23, %r4, %r4	# mr %r23, %r4
	addi	%r4, %r4, 32
	addis	%r24, %r0, (pretrace_diffuse_rays.3283)@h	# lis
	ori	%r24, %r24, (pretrace_diffuse_rays.3283)@l
	stw	%r24, 0(%r23)
	stw	%r8, 28(%r23)
	stw	%r14, 24(%r23)
	stw	%r19, 20(%r23)
	stw	%r18, 16(%r23)
	stw	%r17, 12(%r23)
	stw	%r9, 8(%r23)
	stw	%r11, 4(%r23)
	or	%r24, %r4, %r4	# mr %r24, %r4
	addi	%r4, %r4, 72
	addis	%r25, %r0, (pretrace_pixels.3286)@h	# lis
	ori	%r25, %r25, (pretrace_pixels.3286)@l
	stw	%r25, 0(%r24)
	lwz	%r25, 28(%r3)
	stw	%r25, 68(%r24)
	stw	%r5, 64(%r24)
	stw	%r29, 60(%r24)
	stw	%r8, 56(%r24)
	stw	%r14, 52(%r24)
	stw	%r15, 48(%r24)
	stw	%r19, 44(%r24)
	lwz	%r5, 112(%r3)
	stw	%r5, 40(%r24)
	lwz	%r5, 100(%r3)
	stw	%r5, 36(%r24)
	stw	%r26, 32(%r24)
	lwz	%r8, 124(%r3)
	stw	%r8, 28(%r24)
	stw	%r23, 24(%r24)
	stw	%r18, 20(%r24)
	stw	%r17, 16(%r24)
	lwz	%r8, 96(%r3)
	stw	%r8, 12(%r24)
	stw	%r9, 8(%r24)
	stw	%r11, 4(%r24)
	or	%r11, %r4, %r4	# mr %r11, %r4
	addi	%r4, %r4, 32
	addis	%r14, %r0, (scan_pixel.3297)@h	# lis
	ori	%r14, %r14, (scan_pixel.3297)@l
	stw	%r14, 0(%r11)
	stw	%r22, 28(%r11)
	stw	%r7, 24(%r11)
	stw	%r26, 20(%r11)
	lwz	%r14, 92(%r3)
	stw	%r14, 16(%r11)
	stw	%r21, 12(%r11)
	stw	%r20, 8(%r11)
	stw	%r12, 4(%r11)
	or	%r12, %r4, %r4	# mr %r12, %r4
	addi	%r4, %r4, 48
	addis	%r15, %r0, (scan_line.3303)@h	# lis
	ori	%r15, %r15, (scan_line.3303)@l
	stw	%r15, 0(%r12)
	stw	%r22, 44(%r12)
	stw	%r7, 40(%r12)
	lwz	%r7, 120(%r3)
	stw	%r7, 36(%r12)
	lwz	%r15, 116(%r3)
	stw	%r15, 32(%r12)
	stw	%r11, 28(%r12)
	stw	%r5, 24(%r12)
	stw	%r26, 20(%r12)
	stw	%r24, 16(%r12)
	stw	%r14, 12(%r12)
	stw	%r8, 8(%r12)
	stw	%r21, 4(%r12)
	or	%r17, %r4, %r4	# mr %r17, %r4
	addi	%r4, %r4, 16
	addis	%r19, %r0, (calc_dirvec.3323)@h	# lis
	ori	%r19, %r19, (calc_dirvec.3323)@l
	stw	%r19, 0(%r17)
	stfs	%f0, 12(%r17)	# float
	stw	%r6, 8(%r17)
	stw	%r9, 4(%r17)
	or	%r6, %r4, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r19, %r0, (calc_dirvecs.3331)@h	# lis
	ori	%r19, %r19, (calc_dirvecs.3331)@l
	stw	%r19, 0(%r6)
	stw	%r17, 4(%r6)
	or	%r19, %r4, %r4	# mr %r19, %r4
	addi	%r4, %r4, 12
	addis	%r20, %r0, (calc_dirvec_rows.3336)@h	# lis
	ori	%r20, %r20, (calc_dirvec_rows.3336)@l
	stw	%r20, 0(%r19)
	stw	%r6, 8(%r19)
	stw	%r17, 4(%r19)
	or	%r6, %r4, %r4	# mr %r6, %r4
	addi	%r4, %r4, 8
	addis	%r17, %r0, (create_dirvec_elements.3342)@h	# lis
	ori	%r17, %r17, (create_dirvec_elements.3342)@l
	stw	%r17, 0(%r6)
	stw	%r18, 4(%r6)
	or	%r17, %r4, %r4	# mr %r17, %r4
	addi	%r4, %r4, 16
	addis	%r20, %r0, (create_dirvecs.3345)@h	# lis
	ori	%r20, %r20, (create_dirvecs.3345)@l
	stw	%r20, 0(%r17)
	stw	%r18, 12(%r17)
	stw	%r9, 8(%r17)
	stw	%r6, 4(%r17)
	or	%r6, %r4, %r4	# mr %r6, %r4
	addi	%r4, %r4, 16
	addis	%r20, %r0, (init_dirvec_constants.3347)@h	# lis
	ori	%r20, %r20, (init_dirvec_constants.3347)@l
	stw	%r20, 0(%r6)
	stw	%r16, 12(%r6)
	stw	%r18, 8(%r6)
	lwz	%r20, 180(%r3)
	stw	%r20, 4(%r6)
	or	%r21, %r4, %r4	# mr %r21, %r4
	addi	%r4, %r4, 24
	addis	%r22, %r0, (init_vecset_constants.3350)@h	# lis
	ori	%r22, %r22, (init_vecset_constants.3350)@l
	stw	%r22, 0(%r21)
	stw	%r16, 20(%r21)
	stw	%r18, 16(%r21)
	stw	%r20, 12(%r21)
	stw	%r6, 8(%r21)
	stw	%r9, 4(%r21)
	or	%r22, %r4, %r4	# mr %r22, %r4
	addi	%r4, %r4, 28
	addis	%r23, %r0, (setup_rect_reflection.3361)@h	# lis
	ori	%r23, %r23, (setup_rect_reflection.3361)@l
	stw	%r23, 0(%r22)
	stw	%r28, 24(%r22)
	stw	%r16, 20(%r22)
	stw	%r2, 16(%r22)
	stw	%r18, 12(%r22)
	stw	%r13, 8(%r22)
	stw	%r20, 4(%r22)
	or	%r23, %r4, %r4	# mr %r23, %r4
	addi	%r4, %r4, 28
	addis	%r25, %r0, (setup_surface_reflection.3364)@h	# lis
	ori	%r25, %r25, (setup_surface_reflection.3364)@l
	stw	%r25, 0(%r23)
	stw	%r28, 24(%r23)
	stw	%r16, 20(%r23)
	stw	%r2, 16(%r23)
	stw	%r18, 12(%r23)
	stw	%r13, 8(%r23)
	stw	%r20, 4(%r23)
	or	%r29, %r4, %r4	# mr %r29, %r4
	addi	%r4, %r4, 120
	addis	%r2, %r0, (rt.3369)@h	# lis
	ori	%r2, %r2, (rt.3369)@l
	stw	%r2, 0(%r29)
	lwz	%r2, 140(%r3)
	stw	%r2, 116(%r29)
	stw	%r23, 112(%r29)
	stw	%r22, 108(%r29)
	stw	%r7, 104(%r29)
	stw	%r15, 100(%r29)
	stw	%r11, 96(%r29)
	stw	%r5, 92(%r29)
	stw	%r12, 88(%r29)
	lwz	%r2, 176(%r3)
	stw	%r2, 84(%r29)
	lwz	%r2, 172(%r3)
	stw	%r2, 80(%r29)
	lwz	%r2, 168(%r3)
	stw	%r2, 76(%r29)
	lwz	%r2, 164(%r3)
	stw	%r2, 72(%r29)
	lwz	%r2, 160(%r3)
	stw	%r2, 68(%r29)
	stw	%r24, 64(%r29)
	stw	%r10, 60(%r29)
	stw	%r16, 56(%r29)
	stw	%r18, 52(%r29)
	lwz	%r2, 144(%r3)
	stw	%r2, 48(%r29)
	stw	%r13, 44(%r29)
	stw	%r20, 40(%r29)
	stw	%r21, 36(%r29)
	stw	%r6, 32(%r29)
	stw	%r14, 28(%r29)
	stw	%r8, 24(%r29)
	stw	%r9, 20(%r29)
	stw	%r17, 16(%r29)
	lwz	%r2, 148(%r3)
	stw	%r2, 12(%r29)
	stw	%r19, 8(%r29)
	lwz	%r2, 44(%r3)
	stw	%r2, 4(%r29)
	addi	%r2, %r0, 128	# li
	addi	%r5, %r0, 128	# li
	mflr	%r31	
	stw	%r31, 184(%r3)
	addi	%r3, %r3, 188
	lwz	%r31, 0(%r29)
	mtctr	%r31	
	bctrl
	addi	%r3, %r3, -188	# subi
	lwz	%r31, 184(%r3)
	mtlr	%r31	
#	main program ends
	sc
