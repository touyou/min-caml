	.data
	.literal8
	.align 3
l.4921:	 # 128.000000
	.long	0
	.long	1080033280
	.align 3
l.4910:	 # 40000.000000
	.long	0
	.long	1088653312
	.align 3
l.4858:	 # -2.000000
	.long	0
	.long	-1073741824
	.align 3
l.4857:	 # 0.100000
	.long	-1717986918
	.long	1069128089
	.align 3
l.4856:	 # 0.200000
	.long	-1717986918
	.long	1070176665
	.align 3
l.4828:	 # 20.000000
	.long	0
	.long	1077149696
	.align 3
l.4827:	 # 0.050000
	.long	-1717986918
	.long	1068079513
	.align 3
l.4823:	 # 0.250000
	.long	0
	.long	1070596096
	.align 3
l.4819:	 # 255.000000
	.long	0
	.long	1081073664
	.align 3
l.4818:	 # 3.141593
	.long	1518260631
	.long	1074340347
	.align 3
l.4817:	 # 10.000000
	.long	0
	.long	1076101120
	.align 3
l.4813:	 # 850.000000
	.long	0
	.long	1082822656
	.align 3
l.4812:	 # 0.500000
	.long	0
	.long	1071644672
	.align 3
l.4811:	 # 0.150000
	.long	858993459
	.long	1069757235
	.align 3
l.4809:	 # 9.549296
	.long	1647403911
	.long	1076042045
	.align 3
l.4808:	 # 15.000000
	.long	0
	.long	1076756480
	.align 3
l.4807:	 # 0.000100
	.long	-350469331
	.long	1058682594
	.align 3
l.4761:	 # 100000000.000000
	.long	0
	.long	1100470148
	.align 3
l.4757:	 # 1000000000.000000
	.long	0
	.long	1104006501
	.align 3
l.4724:	 # -0.100000
	.long	-1717986918
	.long	-1078355559
	.align 3
l.4709:	 # 0.010000
	.long	1202590843
	.long	1065646817
	.align 3
l.4708:	 # -0.200000
	.long	-1717986918
	.long	-1077306983
	.align 3
l.4682:	 # 4.000000
	.long	0
	.long	1074790400
	.align 3
l.4481:	 # -200.000000
	.long	0
	.long	-1066860544
	.align 3
l.4467:	 # 0.017453
	.long	-1433277178
	.long	1066524486
	.align 3
l.4466:	 # -1.000000
	.long	0
	.long	-1074790400
	.align 3
l.4465:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
l.4464:	 # 0.000000
	.long	0
	.long	0
	.align 3
l.4440:	 # 2.000000
	.long	0
	.long	1073741824
	.text
	.globl _min_caml_start
	.align 2
xor.1977:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5685
	or	%r2, %r5, %r2	# mr %r2, %r5
	blr
beq_else.5685:
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.5686
	li	%r2, 1
	blr
beq_else.5686:
	li	%r2, 0
	blr
fsqr.1980:
	fmul	%f0, %f0, %f0
	blr
fhalf.1982:
	lis	%r31, ha16(l.4440)
	addi	%r31, %r31, lo16(l.4440)
	lfd	%f1, 0(%r31)
	fdiv	%f0, %f0, %f1
	blr
o_texturetype.1984:
	lwz	%r2, 0(%r2)
	blr
o_form.1986:
	lwz	%r2, 4(%r2)
	blr
o_reflectiontype.1988:
	lwz	%r2, 8(%r2)
	blr
o_isinvert.1990:
	lwz	%r2, 24(%r2)
	blr
o_isrot.1992:
	lwz	%r2, 12(%r2)
	blr
o_param_a.1994:
	lwz	%r2, 16(%r2)
	lfd	%f0, 0(%r2)
	blr
o_param_b.1996:
	lwz	%r2, 16(%r2)
	lfd	%f0, 8(%r2)
	blr
o_param_c.1998:
	lwz	%r2, 16(%r2)
	lfd	%f0, 16(%r2)
	blr
o_param_x.2000:
	lwz	%r2, 20(%r2)
	lfd	%f0, 0(%r2)
	blr
o_param_y.2002:
	lwz	%r2, 20(%r2)
	lfd	%f0, 8(%r2)
	blr
o_param_z.2004:
	lwz	%r2, 20(%r2)
	lfd	%f0, 16(%r2)
	blr
o_diffuse.2006:
	lwz	%r2, 28(%r2)
	lfd	%f0, 0(%r2)
	blr
o_hilight.2008:
	lwz	%r2, 28(%r2)
	lfd	%f0, 8(%r2)
	blr
o_color_red.2010:
	lwz	%r2, 32(%r2)
	lwz	%r2, 0(%r2)
	blr
o_color_green.2012:
	lwz	%r2, 32(%r2)
	lwz	%r2, 4(%r2)
	blr
o_color_blue.2014:
	lwz	%r2, 32(%r2)
	lwz	%r2, 8(%r2)
	blr
o_param_r1.2016:
	lwz	%r2, 36(%r2)
	lfd	%f0, 0(%r2)
	blr
o_param_r2.2018:
	lwz	%r2, 36(%r2)
	lfd	%f0, 8(%r2)
	blr
o_param_r3.2020:
	lwz	%r2, 36(%r2)
	lfd	%f0, 16(%r2)
	blr
normalize_vector.2022:
	lfd	%f0, 0(%r2)
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fsqr.1980
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	lwz	%r2, 4(%r3)
	lfd	%f1, 8(%r2)
	stfd	%f0, 8(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	fsqr.1980
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lfd	%f1, 8(%r3)
	fadd	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	lfd	%f1, 16(%r2)
	stfd	%f0, 16(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fsqr.1980
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lfd	%f1, 16(%r3)
	fadd	%f0, %f1, %f0
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_sqrt
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lwz	%r2, 0(%r3)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5687
	b	beq_cont.5688
beq_else.5687:
	fneg	%f0, %f0
beq_cont.5688:
	lwz	%r2, 4(%r3)
	lfd	%f1, 0(%r2)
	fdiv	%f1, %f1, %f0
	stfd	%f1, 0(%r2)
	lfd	%f1, 8(%r2)
	fdiv	%f1, %f1, %f0
	stfd	%f1, 8(%r2)
	lfd	%f1, 16(%r2)
	fdiv	%f0, %f1, %f0
	stfd	%f0, 16(%r2)
	blr
sgn.2025:
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.5690
	lis	%r31, ha16(l.4466)
	addi	%r31, %r31, lo16(l.4466)
	lfd	%f0, 0(%r31)
	blr
ble_else.5690:
	lis	%r31, ha16(l.4465)
	addi	%r31, %r31, lo16(l.4465)
	lfd	%f0, 0(%r31)
	blr
rad.2027:
	lis	%r31, ha16(l.4467)
	addi	%r31, %r31, lo16(l.4467)
	lfd	%f1, 0(%r31)
	fmul	%f0, %f0, %f1
	blr
read_environ.2029:
	lis	%r2, ha16(min_caml_screen)
	addi	%r2, %r2, lo16(min_caml_screen)
	stw	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_read_float
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lwz	%r2, 0(%r3)
	stfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_screen)
	addi	%r2, %r2, lo16(min_caml_screen)
	stw	%r2, 4(%r3)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_read_float
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	lwz	%r2, 4(%r3)
	stfd	%f0, 8(%r2)
	lis	%r2, ha16(min_caml_screen)
	addi	%r2, %r2, lo16(min_caml_screen)
	stw	%r2, 8(%r3)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_read_float
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	lwz	%r2, 8(%r3)
	stfd	%f0, 16(%r2)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_read_float
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	rad.2027
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_cos_v)
	addi	%r2, %r2, lo16(min_caml_cos_v)
	stfd	%f0, 16(%r3)
	stw	%r2, 24(%r3)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_cos
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lwz	%r2, 24(%r3)
	stfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_sin_v)
	addi	%r2, %r2, lo16(min_caml_sin_v)
	lfd	%f0, 16(%r3)
	stw	%r2, 28(%r3)
	mflr	%r31
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_sin
	subi	%r3, %r3, 40
	lwz	%r31, 36(%r3)
	mtlr	%r31
	lwz	%r2, 28(%r3)
	stfd	%f0, 0(%r2)
	mflr	%r31
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_read_float
	subi	%r3, %r3, 40
	lwz	%r31, 36(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	rad.2027
	subi	%r3, %r3, 40
	lwz	%r31, 36(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_cos_v)
	addi	%r2, %r2, lo16(min_caml_cos_v)
	stfd	%f0, 32(%r3)
	stw	%r2, 40(%r3)
	mflr	%r31
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_cos
	subi	%r3, %r3, 48
	lwz	%r31, 44(%r3)
	mtlr	%r31
	lwz	%r2, 40(%r3)
	stfd	%f0, 8(%r2)
	lis	%r2, ha16(min_caml_sin_v)
	addi	%r2, %r2, lo16(min_caml_sin_v)
	lfd	%f0, 32(%r3)
	stw	%r2, 44(%r3)
	mflr	%r31
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	min_caml_sin
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	lwz	%r2, 44(%r3)
	stfd	%f0, 8(%r2)
	mflr	%r31
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	min_caml_read_float
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	min_caml_read_float
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	rad.2027
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	stfd	%f0, 48(%r3)
	mflr	%r31
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	min_caml_sin
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_light)
	addi	%r2, %r2, lo16(min_caml_light)
	fneg	%f0, %f0
	stfd	%f0, 8(%r2)
	mflr	%r31
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	min_caml_read_float
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	rad.2027
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	lfd	%f1, 48(%r3)
	stfd	%f0, 56(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	min_caml_cos
	subi	%r3, %r3, 72
	lwz	%r31, 68(%r3)
	mtlr	%r31
	lfd	%f1, 56(%r3)
	stfd	%f0, 64(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	min_caml_sin
	subi	%r3, %r3, 80
	lwz	%r31, 76(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_light)
	addi	%r2, %r2, lo16(min_caml_light)
	lfd	%f1, 64(%r3)
	fmul	%f0, %f1, %f0
	stfd	%f0, 0(%r2)
	lfd	%f0, 56(%r3)
	mflr	%r31
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	min_caml_cos
	subi	%r3, %r3, 80
	lwz	%r31, 76(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_light)
	addi	%r2, %r2, lo16(min_caml_light)
	lfd	%f1, 64(%r3)
	fmul	%f0, %f1, %f0
	stfd	%f0, 16(%r2)
	lis	%r2, ha16(min_caml_beam)
	addi	%r2, %r2, lo16(min_caml_beam)
	stw	%r2, 72(%r3)
	mflr	%r31
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	min_caml_read_float
	subi	%r3, %r3, 80
	lwz	%r31, 76(%r3)
	mtlr	%r31
	lwz	%r2, 72(%r3)
	stfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_vp)
	addi	%r2, %r2, lo16(min_caml_vp)
	lis	%r5, ha16(min_caml_cos_v)
	addi	%r5, %r5, lo16(min_caml_cos_v)
	lfd	%f0, 0(%r5)
	lis	%r5, ha16(min_caml_sin_v)
	addi	%r5, %r5, lo16(min_caml_sin_v)
	lfd	%f1, 8(%r5)
	fmul	%f0, %f0, %f1
	lis	%r31, ha16(l.4481)
	addi	%r31, %r31, lo16(l.4481)
	lfd	%f1, 0(%r31)
	fmul	%f0, %f0, %f1
	stfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_vp)
	addi	%r2, %r2, lo16(min_caml_vp)
	lis	%r5, ha16(min_caml_sin_v)
	addi	%r5, %r5, lo16(min_caml_sin_v)
	lfd	%f0, 0(%r5)
	fneg	%f0, %f0
	lis	%r31, ha16(l.4481)
	addi	%r31, %r31, lo16(l.4481)
	lfd	%f1, 0(%r31)
	fmul	%f0, %f0, %f1
	stfd	%f0, 8(%r2)
	lis	%r2, ha16(min_caml_vp)
	addi	%r2, %r2, lo16(min_caml_vp)
	lis	%r5, ha16(min_caml_cos_v)
	addi	%r5, %r5, lo16(min_caml_cos_v)
	lfd	%f0, 0(%r5)
	lis	%r5, ha16(min_caml_cos_v)
	addi	%r5, %r5, lo16(min_caml_cos_v)
	lfd	%f1, 8(%r5)
	fmul	%f0, %f0, %f1
	lis	%r31, ha16(l.4481)
	addi	%r31, %r31, lo16(l.4481)
	lfd	%f1, 0(%r31)
	fmul	%f0, %f0, %f1
	stfd	%f0, 16(%r2)
	lis	%r2, ha16(min_caml_view)
	addi	%r2, %r2, lo16(min_caml_view)
	lis	%r5, ha16(min_caml_vp)
	addi	%r5, %r5, lo16(min_caml_vp)
	lfd	%f0, 0(%r5)
	lis	%r5, ha16(min_caml_screen)
	addi	%r5, %r5, lo16(min_caml_screen)
	lfd	%f1, 0(%r5)
	fadd	%f0, %f0, %f1
	stw	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_view)
	addi	%r2, %r2, lo16(min_caml_view)
	lis	%r5, ha16(min_caml_vp)
	addi	%r5, %r5, lo16(min_caml_vp)
	lfd	%f0, 8(%r5)
	lis	%r5, ha16(min_caml_screen)
	addi	%r5, %r5, lo16(min_caml_screen)
	lfd	%f1, 8(%r5)
	fadd	%f0, %f0, %f1
	stw	%f0, 4(%r2)
	lis	%r2, ha16(min_caml_view)
	addi	%r2, %r2, lo16(min_caml_view)
	lis	%r5, ha16(min_caml_vp)
	addi	%r5, %r5, lo16(min_caml_vp)
	lfd	%f0, 16(%r5)
	lis	%r5, ha16(min_caml_screen)
	addi	%r5, %r5, lo16(min_caml_screen)
	lfd	%f1, 16(%r5)
	fadd	%f0, %f0, %f1
	stw	%f0, 8(%r2)
	blr
read_nth_object.2031:
	stw	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_read_int
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.5693
	li	%r2, 0
	blr
beq_else.5693:
	stw	%r2, 4(%r3)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_read_int
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	stw	%r2, 8(%r3)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	min_caml_read_int
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	stw	%r2, 12(%r3)
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_read_int
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	li	%r5, 3
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	stw	%r2, 16(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_create_float_array
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	stw	%r2, 20(%r3)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_read_float
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lwz	%r2, 20(%r3)
	stfd	%f0, 0(%r2)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_read_float
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lwz	%r2, 20(%r3)
	stfd	%f0, 8(%r2)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_read_float
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lwz	%r2, 20(%r3)
	stfd	%f0, 16(%r2)
	li	%r5, 3
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_create_float_array
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	stw	%r2, 24(%r3)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_read_float
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lwz	%r2, 24(%r3)
	stfd	%f0, 0(%r2)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_read_float
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lwz	%r2, 24(%r3)
	stfd	%f0, 8(%r2)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_read_float
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lwz	%r2, 24(%r3)
	stfd	%f0, 16(%r2)
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	stfd	%f0, 32(%r3)
	mflr	%r31
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_read_float
	subi	%r3, %r3, 48
	lwz	%r31, 44(%r3)
	mtlr	%r31
	lfd	%f1, 32(%r3)
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.5695
	li	%r2, 0
	b	ble_cont.5696
ble_else.5695:
	li	%r2, 1
ble_cont.5696:
	li	%r5, 2
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	stw	%r2, 40(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_create_float_array
	subi	%r3, %r3, 48
	lwz	%r31, 44(%r3)
	mtlr	%r31
	stw	%r2, 44(%r3)
	mflr	%r31
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	min_caml_read_float
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	lwz	%r2, 44(%r3)
	stfd	%f0, 0(%r2)
	mflr	%r31
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	min_caml_read_float
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	lwz	%r2, 44(%r3)
	stfd	%f0, 8(%r2)
	li	%r5, 3
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	min_caml_create_float_array
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	stw	%r2, 48(%r3)
	mflr	%r31
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	min_caml_read_float
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	lwz	%r2, 48(%r3)
	stfd	%f0, 0(%r2)
	mflr	%r31
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	min_caml_read_float
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	lwz	%r2, 48(%r3)
	stfd	%f0, 8(%r2)
	mflr	%r31
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	min_caml_read_float
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	lwz	%r2, 48(%r3)
	stfd	%f0, 16(%r2)
	li	%r5, 3
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	min_caml_create_float_array
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	lwz	%r5, 16(%r3)
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.5697
	b	beq_cont.5698
beq_else.5697:
	stw	%r2, 52(%r3)
	mflr	%r31
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	min_caml_read_float
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	rad.2027
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	lwz	%r2, 52(%r3)
	stfd	%f0, 0(%r2)
	mflr	%r31
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	min_caml_read_float
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	rad.2027
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	lwz	%r2, 52(%r3)
	stfd	%f0, 8(%r2)
	mflr	%r31
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	min_caml_read_float
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	rad.2027
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	lwz	%r2, 52(%r3)
	stfd	%f0, 16(%r2)
beq_cont.5698:
	lwz	%r5, 8(%r3)
	cmpwi	%cr7, %r5, 2
	bne	%cr7, beq_else.5699
	li	%r6, 1
	b	beq_cont.5700
beq_else.5699:
	lwz	%r6, 40(%r3)
beq_cont.5700:
	or	%r7, %r4, %r7	# mr %r7, %r4
	addi	%r4, %r4, 40
	stw	%r2, 36(%r7)
	lwz	%r8, 48(%r3)
	stw	%r8, 32(%r7)
	lwz	%r8, 44(%r3)
	stw	%r8, 28(%r7)
	stw	%r6, 24(%r7)
	lwz	%r6, 24(%r3)
	stw	%r6, 20(%r7)
	lwz	%r6, 20(%r3)
	stw	%r6, 16(%r7)
	lwz	%r8, 16(%r3)
	stw	%r8, 12(%r7)
	lwz	%r9, 12(%r3)
	stw	%r9, 8(%r7)
	stw	%r5, 4(%r7)
	lwz	%r9, 4(%r3)
	stw	%r9, 0(%r7)
	lis	%r9, ha16(min_caml_objects)
	addi	%r9, %r9, lo16(min_caml_objects)
	lwz	%r10, 0(%r3)
	slwi	%r10, %r10, 2
	stwx	%r7, %r9, %r10
	stw	%r2, 52(%r3)
	cmpwi	%cr7, %r5, 3
	bne	%cr7, beq_else.5701
	lfd	%f0, 0(%r6)
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bne	%cr7, beq_else.5703
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	b	beq_cont.5704
beq_else.5703:
	stfd	%f0, 56(%r3)
	mflr	%r31
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	sgn.2025
	subi	%r3, %r3, 72
	lwz	%r31, 68(%r3)
	mtlr	%r31
	lfd	%f1, 56(%r3)
	stfd	%f0, 64(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fsqr.1980
	subi	%r3, %r3, 80
	lwz	%r31, 76(%r3)
	mtlr	%r31
	lfd	%f1, 64(%r3)
	fdiv	%f0, %f1, %f0
beq_cont.5704:
	lwz	%r2, 20(%r3)
	stfd	%f0, 0(%r2)
	lfd	%f0, 8(%r2)
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bne	%cr7, beq_else.5705
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	b	beq_cont.5706
beq_else.5705:
	stfd	%f0, 72(%r3)
	mflr	%r31
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	sgn.2025
	subi	%r3, %r3, 88
	lwz	%r31, 84(%r3)
	mtlr	%r31
	lfd	%f1, 72(%r3)
	stfd	%f0, 80(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	fsqr.1980
	subi	%r3, %r3, 96
	lwz	%r31, 92(%r3)
	mtlr	%r31
	lfd	%f1, 80(%r3)
	fdiv	%f0, %f1, %f0
beq_cont.5706:
	lwz	%r2, 20(%r3)
	stfd	%f0, 8(%r2)
	lfd	%f0, 16(%r2)
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bne	%cr7, beq_else.5707
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	b	beq_cont.5708
beq_else.5707:
	stfd	%f0, 88(%r3)
	mflr	%r31
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	sgn.2025
	subi	%r3, %r3, 104
	lwz	%r31, 100(%r3)
	mtlr	%r31
	lfd	%f1, 88(%r3)
	stfd	%f0, 96(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	fsqr.1980
	subi	%r3, %r3, 112
	lwz	%r31, 108(%r3)
	mtlr	%r31
	lfd	%f1, 96(%r3)
	fdiv	%f0, %f1, %f0
beq_cont.5708:
	lwz	%r2, 20(%r3)
	stfd	%f0, 16(%r2)
	b	beq_cont.5702
beq_else.5701:
	cmpwi	%cr7, %r5, 2
	bne	%cr7, beq_else.5709
	lwz	%r5, 40(%r3)
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.5711
	li	%r5, 1
	b	beq_cont.5712
beq_else.5711:
	li	%r5, 0
beq_cont.5712:
	mflr	%r31
	or	%r2, %r6, %r2	# mr %r2, %r6
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	normalize_vector.2022
	subi	%r3, %r3, 112
	lwz	%r31, 108(%r3)
	mtlr	%r31
	b	beq_cont.5710
beq_else.5709:
beq_cont.5710:
beq_cont.5702:
	lwz	%r2, 16(%r3)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5713
	b	beq_cont.5714
beq_else.5713:
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lwz	%r5, 52(%r3)
	lfd	%f0, 0(%r5)
	stw	%r2, 104(%r3)
	mflr	%r31
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	min_caml_cos
	subi	%r3, %r3, 112
	lwz	%r31, 108(%r3)
	mtlr	%r31
	lwz	%r2, 104(%r3)
	stfd	%f0, 80(%r2)
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lwz	%r5, 52(%r3)
	lfd	%f0, 0(%r5)
	stw	%r2, 108(%r3)
	mflr	%r31
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	min_caml_sin
	subi	%r3, %r3, 120
	lwz	%r31, 116(%r3)
	mtlr	%r31
	lwz	%r2, 108(%r3)
	stfd	%f0, 88(%r2)
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lwz	%r5, 52(%r3)
	lfd	%f0, 8(%r5)
	stw	%r2, 112(%r3)
	mflr	%r31
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	min_caml_cos
	subi	%r3, %r3, 120
	lwz	%r31, 116(%r3)
	mtlr	%r31
	lwz	%r2, 112(%r3)
	stfd	%f0, 96(%r2)
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lwz	%r5, 52(%r3)
	lfd	%f0, 8(%r5)
	stw	%r2, 116(%r3)
	mflr	%r31
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	min_caml_sin
	subi	%r3, %r3, 128
	lwz	%r31, 124(%r3)
	mtlr	%r31
	lwz	%r2, 116(%r3)
	stfd	%f0, 104(%r2)
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lwz	%r5, 52(%r3)
	lfd	%f0, 16(%r5)
	stw	%r2, 120(%r3)
	mflr	%r31
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	min_caml_cos
	subi	%r3, %r3, 128
	lwz	%r31, 124(%r3)
	mtlr	%r31
	lwz	%r2, 120(%r3)
	stfd	%f0, 112(%r2)
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lwz	%r5, 52(%r3)
	lfd	%f0, 16(%r5)
	stw	%r2, 124(%r3)
	mflr	%r31
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	min_caml_sin
	subi	%r3, %r3, 136
	lwz	%r31, 132(%r3)
	mtlr	%r31
	lwz	%r2, 124(%r3)
	stfd	%f0, 120(%r2)
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f0, 96(%r5)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f1, 112(%r5)
	fmul	%f0, %f0, %f1
	stfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f0, 88(%r5)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f1, 104(%r5)
	fmul	%f0, %f0, %f1
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f1, 112(%r5)
	fmul	%f0, %f0, %f1
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f1, 80(%r5)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f2, 120(%r5)
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	stfd	%f0, 8(%r2)
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f0, 80(%r5)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f1, 104(%r5)
	fmul	%f0, %f0, %f1
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f1, 112(%r5)
	fmul	%f0, %f0, %f1
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f1, 88(%r5)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f2, 120(%r5)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfd	%f0, 16(%r2)
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f0, 96(%r5)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f1, 120(%r5)
	fmul	%f0, %f0, %f1
	stfd	%f0, 24(%r2)
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f0, 88(%r5)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f1, 104(%r5)
	fmul	%f0, %f0, %f1
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f1, 120(%r5)
	fmul	%f0, %f0, %f1
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f1, 80(%r5)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f2, 112(%r5)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stfd	%f0, 32(%r2)
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f0, 80(%r5)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f1, 104(%r5)
	fmul	%f0, %f0, %f1
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f1, 120(%r5)
	fmul	%f0, %f0, %f1
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f1, 88(%r5)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f2, 112(%r5)
	fmul	%f1, %f1, %f2
	fsub	%f0, %f0, %f1
	stfd	%f0, 40(%r2)
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f0, 104(%r5)
	fneg	%f0, %f0
	stfd	%f0, 48(%r2)
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f0, 88(%r5)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f1, 96(%r5)
	fmul	%f0, %f0, %f1
	stfd	%f0, 56(%r2)
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f0, 80(%r5)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f1, 96(%r5)
	fmul	%f0, %f0, %f1
	stfd	%f0, 64(%r2)
	lwz	%r2, 20(%r3)
	lfd	%f0, 0(%r2)
	lfd	%f1, 8(%r2)
	lfd	%f2, 16(%r2)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f3, 0(%r5)
	stfd	%f2, 128(%r3)
	stfd	%f1, 136(%r3)
	stfd	%f0, 144(%r3)
	mflr	%r31
	fmr	%f0, %f3
	stw	%r31, 156(%r3)
	addi	%r3, %r3, 160
	bl	fsqr.1980
	subi	%r3, %r3, 160
	lwz	%r31, 156(%r3)
	mtlr	%r31
	lfd	%f1, 144(%r3)
	fmul	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lfd	%f2, 24(%r2)
	stfd	%f0, 152(%r3)
	mflr	%r31
	fmr	%f0, %f2
	stw	%r31, 164(%r3)
	addi	%r3, %r3, 168
	bl	fsqr.1980
	subi	%r3, %r3, 168
	lwz	%r31, 164(%r3)
	mtlr	%r31
	lfd	%f1, 136(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f2, 152(%r3)
	fadd	%f0, %f2, %f0
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lfd	%f2, 48(%r2)
	stfd	%f0, 160(%r3)
	mflr	%r31
	fmr	%f0, %f2
	stw	%r31, 172(%r3)
	addi	%r3, %r3, 176
	bl	fsqr.1980
	subi	%r3, %r3, 176
	lwz	%r31, 172(%r3)
	mtlr	%r31
	lfd	%f1, 128(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f2, 160(%r3)
	fadd	%f0, %f2, %f0
	lwz	%r2, 20(%r3)
	stfd	%f0, 0(%r2)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f0, 8(%r5)
	mflr	%r31
	stw	%r31, 172(%r3)
	addi	%r3, %r3, 176
	bl	fsqr.1980
	subi	%r3, %r3, 176
	lwz	%r31, 172(%r3)
	mtlr	%r31
	lfd	%f1, 144(%r3)
	fmul	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lfd	%f2, 32(%r2)
	stfd	%f0, 168(%r3)
	mflr	%r31
	fmr	%f0, %f2
	stw	%r31, 180(%r3)
	addi	%r3, %r3, 184
	bl	fsqr.1980
	subi	%r3, %r3, 184
	lwz	%r31, 180(%r3)
	mtlr	%r31
	lfd	%f1, 136(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f2, 168(%r3)
	fadd	%f0, %f2, %f0
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lfd	%f2, 56(%r2)
	stfd	%f0, 176(%r3)
	mflr	%r31
	fmr	%f0, %f2
	stw	%r31, 188(%r3)
	addi	%r3, %r3, 192
	bl	fsqr.1980
	subi	%r3, %r3, 192
	lwz	%r31, 188(%r3)
	mtlr	%r31
	lfd	%f1, 128(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f2, 176(%r3)
	fadd	%f0, %f2, %f0
	lwz	%r2, 20(%r3)
	stfd	%f0, 8(%r2)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f0, 16(%r5)
	mflr	%r31
	stw	%r31, 188(%r3)
	addi	%r3, %r3, 192
	bl	fsqr.1980
	subi	%r3, %r3, 192
	lwz	%r31, 188(%r3)
	mtlr	%r31
	lfd	%f1, 144(%r3)
	fmul	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lfd	%f2, 40(%r2)
	stfd	%f0, 184(%r3)
	mflr	%r31
	fmr	%f0, %f2
	stw	%r31, 196(%r3)
	addi	%r3, %r3, 200
	bl	fsqr.1980
	subi	%r3, %r3, 200
	lwz	%r31, 196(%r3)
	mtlr	%r31
	lfd	%f1, 136(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f2, 184(%r3)
	fadd	%f0, %f2, %f0
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lfd	%f2, 64(%r2)
	stfd	%f0, 192(%r3)
	mflr	%r31
	fmr	%f0, %f2
	stw	%r31, 204(%r3)
	addi	%r3, %r3, 208
	bl	fsqr.1980
	subi	%r3, %r3, 208
	lwz	%r31, 204(%r3)
	mtlr	%r31
	lfd	%f1, 128(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f2, 192(%r3)
	fadd	%f0, %f2, %f0
	lwz	%r2, 20(%r3)
	stfd	%f0, 16(%r2)
	lis	%r31, ha16(l.4440)
	addi	%r31, %r31, lo16(l.4440)
	lfd	%f0, 0(%r31)
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lfd	%f2, 8(%r2)
	lfd	%f3, 144(%r3)
	fmul	%f2, %f3, %f2
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lfd	%f4, 16(%r2)
	fmul	%f2, %f2, %f4
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lfd	%f4, 32(%r2)
	lfd	%f5, 136(%r3)
	fmul	%f4, %f5, %f4
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lfd	%f6, 40(%r2)
	fmul	%f4, %f4, %f6
	fadd	%f2, %f2, %f4
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lfd	%f4, 56(%r2)
	fmul	%f4, %f1, %f4
	lis	%r2, ha16(min_caml_cs_temp)
	addi	%r2, %r2, lo16(min_caml_cs_temp)
	lfd	%f6, 64(%r2)
	fmul	%f4, %f4, %f6
	fadd	%f2, %f2, %f4
	fmul	%f0, %f0, %f2
	lwz	%r2, 52(%r3)
	stfd	%f0, 0(%r2)
	lis	%r31, ha16(l.4440)
	addi	%r31, %r31, lo16(l.4440)
	lfd	%f0, 0(%r31)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f2, 0(%r5)
	fmul	%f2, %f3, %f2
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f4, 16(%r5)
	fmul	%f2, %f2, %f4
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f4, 24(%r5)
	fmul	%f4, %f5, %f4
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f6, 40(%r5)
	fmul	%f4, %f4, %f6
	fadd	%f2, %f2, %f4
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f4, 48(%r5)
	fmul	%f4, %f1, %f4
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f6, 64(%r5)
	fmul	%f4, %f4, %f6
	fadd	%f2, %f2, %f4
	fmul	%f0, %f0, %f2
	stfd	%f0, 8(%r2)
	lis	%r31, ha16(l.4440)
	addi	%r31, %r31, lo16(l.4440)
	lfd	%f0, 0(%r31)
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f2, 0(%r5)
	fmul	%f2, %f3, %f2
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f3, 8(%r5)
	fmul	%f2, %f2, %f3
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f3, 24(%r5)
	fmul	%f3, %f5, %f3
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f4, 32(%r5)
	fmul	%f3, %f3, %f4
	fadd	%f2, %f2, %f3
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f3, 48(%r5)
	fmul	%f1, %f1, %f3
	lis	%r5, ha16(min_caml_cs_temp)
	addi	%r5, %r5, lo16(min_caml_cs_temp)
	lfd	%f3, 56(%r5)
	fmul	%f1, %f1, %f3
	fadd	%f1, %f2, %f1
	fmul	%f0, %f0, %f1
	stfd	%f0, 16(%r2)
beq_cont.5714:
	li	%r2, 1
	blr
read_object.2033:
	cmpwi	%cr7, %r2, 61
	blt	%cr7, bge_else.5715
	blr
bge_else.5715:
	stw	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_nth_object.2031
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5717
	blr
beq_else.5717:
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	b	read_object.2033
read_all_object.2035:
	li	%r2, 0
	b	read_object.2033
read_net_item.2037:
	stw	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_read_int
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.5719
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	li	%r5, -1
	b	min_caml_create_array
beq_else.5719:
	lwz	%r5, 0(%r3)
	addi	%r6, %r5, 1
	stw	%r2, 4(%r3)
	mflr	%r31
	or	%r2, %r6, %r2	# mr %r2, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	read_net_item.2037
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	lwz	%r5, 0(%r3)
	slwi	%r5, %r5, 2
	lwz	%r6, 4(%r3)
	stwx	%r6, %r2, %r5
	blr
read_or_network.2039:
	li	%r5, 0
	stw	%r2, 0(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_net_item.2037
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	or	%r5, %r2, %r5	# mr %r5, %r2
	mtlr	%r31
	lwz	%r2, 0(%r5)
	cmpwi	%cr7, %r2, -1
	bne	%cr7, beq_else.5720
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	b	min_caml_create_array
beq_else.5720:
	lwz	%r2, 0(%r3)
	addi	%r6, %r2, 1
	stw	%r5, 4(%r3)
	mflr	%r31
	or	%r2, %r6, %r2	# mr %r2, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	read_or_network.2039
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	lwz	%r5, 0(%r3)
	slwi	%r5, %r5, 2
	lwz	%r6, 4(%r3)
	stwx	%r6, %r2, %r5
	blr
read_and_network.2041:
	li	%r5, 0
	stw	%r2, 0(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_net_item.2037
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lwz	%r5, 0(%r2)
	cmpwi	%cr7, %r5, -1
	bne	%cr7, beq_else.5721
	blr
beq_else.5721:
	lis	%r5, ha16(min_caml_and_net)
	addi	%r5, %r5, lo16(min_caml_and_net)
	lwz	%r6, 0(%r3)
	slwi	%r7, %r6, 2
	stwx	%r2, %r5, %r7
	addi	%r2, %r6, 1
	b	read_and_network.2041
read_parameter.2043:
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_environ.2029
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_all_object.2035
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	li	%r2, 0
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_and_network.2041
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_or_net)
	addi	%r2, %r2, lo16(min_caml_or_net)
	li	%r5, 0
	stw	%r2, 0(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_or_network.2039
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lwz	%r5, 0(%r3)
	stw	%r2, 0(%r5)
	blr
solver_rect.2045:
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	lfd	%f1, 0(%r5)
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.5724
	li	%r2, 0
	b	beq_cont.5725
beq_else.5724:
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_isinvert.1990
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	lwz	%r5, 4(%r3)
	lfd	%f1, 0(%r5)
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.5726
	li	%r6, 0
	b	ble_cont.5727
ble_else.5726:
	li	%r6, 1
ble_cont.5727:
	mflr	%r31
	or	%r5, %r6, %r5	# mr %r5, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	xor.1977
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5728
	lwz	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_param_a.1994
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	fneg	%f0, %f0
	b	beq_cont.5729
beq_else.5728:
	lwz	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_param_a.1994
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
beq_cont.5729:
	lis	%r2, ha16(min_caml_solver_w_vec)
	addi	%r2, %r2, lo16(min_caml_solver_w_vec)
	lfd	%f1, 0(%r2)
	fsub	%f0, %f0, %f1
	lwz	%r2, 4(%r3)
	lfd	%f1, 0(%r2)
	fdiv	%f0, %f0, %f1
	lwz	%r5, 0(%r3)
	stfd	%f0, 8(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_param_b.1996
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lwz	%r2, 4(%r3)
	lfd	%f1, 8(%r2)
	lfd	%f2, 8(%r3)
	fmul	%f1, %f2, %f1
	lis	%r5, ha16(min_caml_solver_w_vec)
	addi	%r5, %r5, lo16(min_caml_solver_w_vec)
	lfd	%f3, 8(%r5)
	fadd	%f1, %f1, %f3
	stfd	%f0, 16(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_abs_float
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lfd	%f0, 16(%r3)
	fcmpu	%cr7, %f0, %r2
	bgt	%cr7, ble_else.5730
	li	%r2, 0
	b	ble_cont.5731
ble_else.5730:
	lwz	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_param_c.1998
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lwz	%r2, 4(%r3)
	lfd	%f1, 16(%r2)
	lfd	%f2, 8(%r3)
	fmul	%f1, %f2, %f1
	lis	%r5, ha16(min_caml_solver_w_vec)
	addi	%r5, %r5, lo16(min_caml_solver_w_vec)
	lfd	%f3, 16(%r5)
	fadd	%f1, %f1, %f3
	stfd	%f0, 24(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_abs_float
	subi	%r3, %r3, 40
	lwz	%r31, 36(%r3)
	mtlr	%r31
	lfd	%f0, 24(%r3)
	fcmpu	%cr7, %f0, %r2
	bgt	%cr7, ble_else.5732
	li	%r2, 0
	b	ble_cont.5733
ble_else.5732:
	lis	%r2, ha16(min_caml_solver_dist)
	addi	%r2, %r2, lo16(min_caml_solver_dist)
	lwz	%r5, 8(%r3)
	stw	%r5, 0(%r2)
	li	%r2, 1
ble_cont.5733:
ble_cont.5731:
beq_cont.5725:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5734
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	lwz	%r2, 4(%r3)
	lfd	%f1, 8(%r2)
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.5735
	li	%r2, 0
	b	beq_cont.5736
beq_else.5735:
	lwz	%r5, 0(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_isinvert.1990
	subi	%r3, %r3, 40
	lwz	%r31, 36(%r3)
	mtlr	%r31
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	lwz	%r5, 4(%r3)
	lfd	%f1, 8(%r5)
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.5737
	li	%r6, 0
	b	ble_cont.5738
ble_else.5737:
	li	%r6, 1
ble_cont.5738:
	mflr	%r31
	or	%r5, %r6, %r5	# mr %r5, %r6
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	xor.1977
	subi	%r3, %r3, 40
	lwz	%r31, 36(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5739
	lwz	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_b.1996
	subi	%r3, %r3, 40
	lwz	%r31, 36(%r3)
	mtlr	%r31
	fneg	%f0, %f0
	b	beq_cont.5740
beq_else.5739:
	lwz	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_b.1996
	subi	%r3, %r3, 40
	lwz	%r31, 36(%r3)
	mtlr	%r31
beq_cont.5740:
	lis	%r2, ha16(min_caml_solver_w_vec)
	addi	%r2, %r2, lo16(min_caml_solver_w_vec)
	lfd	%f1, 8(%r2)
	fsub	%f0, %f0, %f1
	lwz	%r2, 4(%r3)
	lfd	%f1, 8(%r2)
	fdiv	%f0, %f0, %f1
	lwz	%r5, 0(%r3)
	stfd	%f0, 32(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	o_param_c.1998
	subi	%r3, %r3, 48
	lwz	%r31, 44(%r3)
	mtlr	%r31
	lwz	%r2, 4(%r3)
	lfd	%f1, 16(%r2)
	lfd	%f2, 32(%r3)
	fmul	%f1, %f2, %f1
	lis	%r5, ha16(min_caml_solver_w_vec)
	addi	%r5, %r5, lo16(min_caml_solver_w_vec)
	lfd	%f3, 16(%r5)
	fadd	%f1, %f1, %f3
	stfd	%f0, 40(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	min_caml_abs_float
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	lfd	%f0, 40(%r3)
	fcmpu	%cr7, %f0, %r2
	bgt	%cr7, ble_else.5741
	li	%r2, 0
	b	ble_cont.5742
ble_else.5741:
	lwz	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_param_a.1994
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	lwz	%r2, 4(%r3)
	lfd	%f1, 0(%r2)
	lfd	%f2, 32(%r3)
	fmul	%f1, %f2, %f1
	lis	%r5, ha16(min_caml_solver_w_vec)
	addi	%r5, %r5, lo16(min_caml_solver_w_vec)
	lfd	%f3, 0(%r5)
	fadd	%f1, %f1, %f3
	stfd	%f0, 48(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	min_caml_abs_float
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	lfd	%f0, 48(%r3)
	fcmpu	%cr7, %f0, %r2
	bgt	%cr7, ble_else.5743
	li	%r2, 0
	b	ble_cont.5744
ble_else.5743:
	lis	%r2, ha16(min_caml_solver_dist)
	addi	%r2, %r2, lo16(min_caml_solver_dist)
	lwz	%r5, 32(%r3)
	stw	%r5, 0(%r2)
	li	%r2, 1
ble_cont.5744:
ble_cont.5742:
beq_cont.5736:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5745
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	lwz	%r2, 4(%r3)
	lfd	%f1, 16(%r2)
	fcmpu	%cr7, %f0, %f1
	bne	%cr7, beq_else.5746
	li	%r2, 0
	b	beq_cont.5747
beq_else.5746:
	lwz	%r5, 0(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_isinvert.1990
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	lwz	%r5, 4(%r3)
	lfd	%f1, 16(%r5)
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.5748
	li	%r6, 0
	b	ble_cont.5749
ble_else.5748:
	li	%r6, 1
ble_cont.5749:
	mflr	%r31
	or	%r5, %r6, %r5	# mr %r5, %r6
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	xor.1977
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5750
	lwz	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_param_c.1998
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	fneg	%f0, %f0
	b	beq_cont.5751
beq_else.5750:
	lwz	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_param_c.1998
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
beq_cont.5751:
	lis	%r2, ha16(min_caml_solver_w_vec)
	addi	%r2, %r2, lo16(min_caml_solver_w_vec)
	lfd	%f1, 16(%r2)
	fsub	%f0, %f0, %f1
	lwz	%r2, 4(%r3)
	lfd	%f1, 16(%r2)
	fdiv	%f0, %f0, %f1
	lwz	%r5, 0(%r3)
	stfd	%f0, 56(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	o_param_a.1994
	subi	%r3, %r3, 72
	lwz	%r31, 68(%r3)
	mtlr	%r31
	lwz	%r2, 4(%r3)
	lfd	%f1, 0(%r2)
	lfd	%f2, 56(%r3)
	fmul	%f1, %f2, %f1
	lis	%r5, ha16(min_caml_solver_w_vec)
	addi	%r5, %r5, lo16(min_caml_solver_w_vec)
	lfd	%f3, 0(%r5)
	fadd	%f1, %f1, %f3
	stfd	%f0, 64(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	min_caml_abs_float
	subi	%r3, %r3, 80
	lwz	%r31, 76(%r3)
	mtlr	%r31
	lfd	%f0, 64(%r3)
	fcmpu	%cr7, %f0, %r2
	bgt	%cr7, ble_else.5752
	li	%r2, 0
	b	ble_cont.5753
ble_else.5752:
	lwz	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	o_param_b.1996
	subi	%r3, %r3, 80
	lwz	%r31, 76(%r3)
	mtlr	%r31
	lwz	%r2, 4(%r3)
	lfd	%f1, 8(%r2)
	lfd	%f2, 56(%r3)
	fmul	%f1, %f2, %f1
	lis	%r2, ha16(min_caml_solver_w_vec)
	addi	%r2, %r2, lo16(min_caml_solver_w_vec)
	lfd	%f3, 8(%r2)
	fadd	%f1, %f1, %f3
	stfd	%f0, 72(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	min_caml_abs_float
	subi	%r3, %r3, 88
	lwz	%r31, 84(%r3)
	mtlr	%r31
	lfd	%f0, 72(%r3)
	fcmpu	%cr7, %f0, %r2
	bgt	%cr7, ble_else.5754
	li	%r2, 0
	b	ble_cont.5755
ble_else.5754:
	lis	%r2, ha16(min_caml_solver_dist)
	addi	%r2, %r2, lo16(min_caml_solver_dist)
	lwz	%r5, 56(%r3)
	stw	%r5, 0(%r2)
	li	%r2, 1
ble_cont.5755:
ble_cont.5753:
beq_cont.5747:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5756
	li	%r2, 0
	blr
beq_else.5756:
	li	%r2, 3
	blr
beq_else.5745:
	li	%r2, 2
	blr
beq_else.5734:
	li	%r2, 1
	blr
solver_surface.2048:
	lfd	%f0, 0(%r5)
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	stfd	%f0, 8(%r3)
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_param_a.1994
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lfd	%f1, 8(%r3)
	fmul	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	lfd	%f1, 8(%r2)
	lwz	%r5, 0(%r3)
	stfd	%f0, 16(%r3)
	stfd	%f1, 24(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_b.1996
	subi	%r3, %r3, 40
	lwz	%r31, 36(%r3)
	mtlr	%r31
	lfd	%f1, 24(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 16(%r3)
	fadd	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	lfd	%f1, 16(%r2)
	lwz	%r2, 0(%r3)
	stfd	%f0, 32(%r3)
	stfd	%f1, 40(%r3)
	mflr	%r31
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_param_c.1998
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	lfd	%f1, 40(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 32(%r3)
	fadd	%f0, %f1, %f0
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.5757
	li	%r2, 0
	blr
ble_else.5757:
	lis	%r2, ha16(min_caml_solver_w_vec)
	addi	%r2, %r2, lo16(min_caml_solver_w_vec)
	lfd	%f1, 0(%r2)
	lwz	%r2, 0(%r3)
	stfd	%f0, 48(%r3)
	stfd	%f1, 56(%r3)
	mflr	%r31
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	o_param_a.1994
	subi	%r3, %r3, 72
	lwz	%r31, 68(%r3)
	mtlr	%r31
	lfd	%f1, 56(%r3)
	fmul	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_solver_w_vec)
	addi	%r2, %r2, lo16(min_caml_solver_w_vec)
	lfd	%f1, 8(%r2)
	lwz	%r2, 0(%r3)
	stfd	%f0, 64(%r3)
	stfd	%f1, 72(%r3)
	mflr	%r31
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_param_b.1996
	subi	%r3, %r3, 88
	lwz	%r31, 84(%r3)
	mtlr	%r31
	lfd	%f1, 72(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 64(%r3)
	fadd	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_solver_w_vec)
	addi	%r2, %r2, lo16(min_caml_solver_w_vec)
	lfd	%f1, 16(%r2)
	lwz	%r2, 0(%r3)
	stfd	%f0, 80(%r3)
	stfd	%f1, 88(%r3)
	mflr	%r31
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	o_param_c.1998
	subi	%r3, %r3, 104
	lwz	%r31, 100(%r3)
	mtlr	%r31
	lfd	%f1, 88(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 80(%r3)
	fadd	%f0, %f1, %f0
	lfd	%f1, 48(%r3)
	fdiv	%f0, %f0, %f1
	lis	%r2, ha16(min_caml_solver_dist)
	addi	%r2, %r2, lo16(min_caml_solver_dist)
	fneg	%f0, %f0
	stw	%f0, 0(%r2)
	li	%r2, 1
	blr
in_prod_sqr_obj.2051:
	lfd	%f0, 0(%r5)
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	fsqr.1980
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	lwz	%r2, 4(%r3)
	stfd	%f0, 8(%r3)
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_param_a.1994
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lfd	%f1, 8(%r3)
	fmul	%f0, %f1, %f0
	lwz	%r2, 0(%r3)
	lfd	%f1, 8(%r2)
	stfd	%f0, 16(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fsqr.1980
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lwz	%r2, 4(%r3)
	stfd	%f0, 24(%r3)
	mflr	%r31
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_b.1996
	subi	%r3, %r3, 40
	lwz	%r31, 36(%r3)
	mtlr	%r31
	lfd	%f1, 24(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 16(%r3)
	fadd	%f0, %f1, %f0
	lwz	%r2, 0(%r3)
	lfd	%f1, 16(%r2)
	stfd	%f0, 32(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	fsqr.1980
	subi	%r3, %r3, 48
	lwz	%r31, 44(%r3)
	mtlr	%r31
	lwz	%r2, 4(%r3)
	stfd	%f0, 40(%r3)
	mflr	%r31
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_param_c.1998
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	lfd	%f1, 40(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 32(%r3)
	fadd	%f0, %f1, %f0
	blr
in_prod_co_objrot.2054:
	lfd	%f0, 8(%r5)
	lfd	%f1, 16(%r5)
	fmul	%f0, %f0, %f1
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	stfd	%f0, 8(%r3)
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_param_r1.2016
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lfd	%f1, 8(%r3)
	fmul	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	lfd	%f1, 0(%r2)
	lfd	%f2, 16(%r2)
	fmul	%f1, %f1, %f2
	lwz	%r5, 0(%r3)
	stfd	%f0, 16(%r3)
	stfd	%f1, 24(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_r2.2018
	subi	%r3, %r3, 40
	lwz	%r31, 36(%r3)
	mtlr	%r31
	lfd	%f1, 24(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 16(%r3)
	fadd	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	lfd	%f1, 0(%r2)
	lfd	%f2, 8(%r2)
	fmul	%f1, %f1, %f2
	lwz	%r2, 0(%r3)
	stfd	%f0, 32(%r3)
	stfd	%f1, 40(%r3)
	mflr	%r31
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_param_r3.2020
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	lfd	%f1, 40(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 32(%r3)
	fadd	%f0, %f1, %f0
	blr
solver2nd_mul_b.2057:
	lis	%r6, ha16(min_caml_solver_w_vec)
	addi	%r6, %r6, lo16(min_caml_solver_w_vec)
	lfd	%f0, 0(%r6)
	lfd	%f1, 0(%r5)
	fmul	%f0, %f0, %f1
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	stfd	%f0, 8(%r3)
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_param_a.1994
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lfd	%f1, 8(%r3)
	fmul	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_solver_w_vec)
	addi	%r2, %r2, lo16(min_caml_solver_w_vec)
	lfd	%f1, 8(%r2)
	lwz	%r2, 4(%r3)
	lfd	%f2, 8(%r2)
	fmul	%f1, %f1, %f2
	lwz	%r5, 0(%r3)
	stfd	%f0, 16(%r3)
	stfd	%f1, 24(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_b.1996
	subi	%r3, %r3, 40
	lwz	%r31, 36(%r3)
	mtlr	%r31
	lfd	%f1, 24(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 16(%r3)
	fadd	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_solver_w_vec)
	addi	%r2, %r2, lo16(min_caml_solver_w_vec)
	lfd	%f1, 16(%r2)
	lwz	%r2, 4(%r3)
	lfd	%f2, 16(%r2)
	fmul	%f1, %f1, %f2
	lwz	%r2, 0(%r3)
	stfd	%f0, 32(%r3)
	stfd	%f1, 40(%r3)
	mflr	%r31
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_param_c.1998
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	lfd	%f1, 40(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 32(%r3)
	fadd	%f0, %f1, %f0
	blr
solver2nd_rot_b.2060:
	lis	%r6, ha16(min_caml_solver_w_vec)
	addi	%r6, %r6, lo16(min_caml_solver_w_vec)
	lfd	%f0, 16(%r6)
	lfd	%f1, 8(%r5)
	fmul	%f0, %f0, %f1
	lis	%r6, ha16(min_caml_solver_w_vec)
	addi	%r6, %r6, lo16(min_caml_solver_w_vec)
	lfd	%f1, 8(%r6)
	lfd	%f2, 16(%r5)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	stfd	%f0, 8(%r3)
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_param_r1.2016
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lfd	%f1, 8(%r3)
	fmul	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_solver_w_vec)
	addi	%r2, %r2, lo16(min_caml_solver_w_vec)
	lfd	%f1, 0(%r2)
	lwz	%r2, 4(%r3)
	lfd	%f2, 16(%r2)
	fmul	%f1, %f1, %f2
	lis	%r5, ha16(min_caml_solver_w_vec)
	addi	%r5, %r5, lo16(min_caml_solver_w_vec)
	lfd	%f2, 16(%r5)
	lfd	%f3, 0(%r2)
	fmul	%f2, %f2, %f3
	fadd	%f1, %f1, %f2
	lwz	%r5, 0(%r3)
	stfd	%f0, 16(%r3)
	stfd	%f1, 24(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_r2.2018
	subi	%r3, %r3, 40
	lwz	%r31, 36(%r3)
	mtlr	%r31
	lfd	%f1, 24(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 16(%r3)
	fadd	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_solver_w_vec)
	addi	%r2, %r2, lo16(min_caml_solver_w_vec)
	lfd	%f1, 0(%r2)
	lwz	%r2, 4(%r3)
	lfd	%f2, 8(%r2)
	fmul	%f1, %f1, %f2
	lis	%r5, ha16(min_caml_solver_w_vec)
	addi	%r5, %r5, lo16(min_caml_solver_w_vec)
	lfd	%f2, 8(%r5)
	lfd	%f3, 0(%r2)
	fmul	%f2, %f2, %f3
	fadd	%f1, %f1, %f2
	lwz	%r2, 0(%r3)
	stfd	%f0, 32(%r3)
	stfd	%f1, 40(%r3)
	mflr	%r31
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_param_r3.2020
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	lfd	%f1, 40(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 32(%r3)
	fadd	%f0, %f1, %f0
	blr
solver_second.2063:
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	in_prod_sqr_obj.2051
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	lwz	%r2, 4(%r3)
	stfd	%f0, 8(%r3)
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_isrot.1992
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5758
	lfd	%f0, 8(%r3)
	b	beq_cont.5759
beq_else.5758:
	lwz	%r2, 4(%r3)
	lwz	%r5, 0(%r3)
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	in_prod_co_objrot.2054
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lfd	%f1, 8(%r3)
	fadd	%f0, %f1, %f0
beq_cont.5759:
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bne	%cr7, beq_else.5760
	li	%r2, 0
	blr
beq_else.5760:
	lis	%r31, ha16(l.4440)
	addi	%r31, %r31, lo16(l.4440)
	lfd	%f1, 0(%r31)
	lwz	%r2, 4(%r3)
	lwz	%r5, 0(%r3)
	stfd	%f0, 16(%r3)
	stfd	%f1, 24(%r3)
	mflr	%r31
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	solver2nd_mul_b.2057
	subi	%r3, %r3, 40
	lwz	%r31, 36(%r3)
	mtlr	%r31
	lfd	%f1, 24(%r3)
	fmul	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	stfd	%f0, 32(%r3)
	mflr	%r31
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	o_isrot.1992
	subi	%r3, %r3, 48
	lwz	%r31, 44(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5761
	lfd	%f0, 32(%r3)
	b	beq_cont.5762
beq_else.5761:
	lwz	%r2, 4(%r3)
	lwz	%r5, 0(%r3)
	mflr	%r31
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	solver2nd_rot_b.2060
	subi	%r3, %r3, 48
	lwz	%r31, 44(%r3)
	mtlr	%r31
	lfd	%f1, 32(%r3)
	fadd	%f0, %f1, %f0
beq_cont.5762:
	lis	%r5, ha16(min_caml_solver_w_vec)
	addi	%r5, %r5, lo16(min_caml_solver_w_vec)
	lwz	%r2, 4(%r3)
	stfd	%f0, 40(%r3)
	mflr	%r31
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	in_prod_sqr_obj.2051
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	lwz	%r2, 4(%r3)
	stfd	%f0, 48(%r3)
	mflr	%r31
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_isrot.1992
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5763
	lfd	%f0, 48(%r3)
	b	beq_cont.5764
beq_else.5763:
	lis	%r5, ha16(min_caml_solver_w_vec)
	addi	%r5, %r5, lo16(min_caml_solver_w_vec)
	lwz	%r2, 4(%r3)
	mflr	%r31
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	in_prod_co_objrot.2054
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	lfd	%f1, 48(%r3)
	fadd	%f0, %f1, %f0
beq_cont.5764:
	lwz	%r2, 4(%r3)
	stfd	%f0, 56(%r3)
	mflr	%r31
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	o_form.1986
	subi	%r3, %r3, 72
	lwz	%r31, 68(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 3
	bne	%cr7, beq_else.5765
	lis	%r31, ha16(l.4465)
	addi	%r31, %r31, lo16(l.4465)
	lfd	%f0, 0(%r31)
	lfd	%f1, 56(%r3)
	fsub	%f0, %f1, %f0
	b	beq_cont.5766
beq_else.5765:
	lfd	%f0, 56(%r3)
beq_cont.5766:
	lis	%r31, ha16(l.4682)
	addi	%r31, %r31, lo16(l.4682)
	lfd	%f1, 0(%r31)
	lfd	%f2, 16(%r3)
	fmul	%f1, %f1, %f2
	fmul	%f0, %f1, %f0
	lfd	%f1, 40(%r3)
	stfd	%f0, 64(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	fsqr.1980
	subi	%r3, %r3, 80
	lwz	%r31, 76(%r3)
	mtlr	%r31
	lfd	%f1, 64(%r3)
	fsub	%f0, %f0, %f1
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.5767
	li	%r2, 0
	blr
ble_else.5767:
	mflr	%r31
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	min_caml_sqrt
	subi	%r3, %r3, 80
	lwz	%r31, 76(%r3)
	mtlr	%r31
	lwz	%r2, 4(%r3)
	stfd	%f0, 72(%r3)
	mflr	%r31
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_isinvert.1990
	subi	%r3, %r3, 88
	lwz	%r31, 84(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5768
	lfd	%f0, 72(%r3)
	fneg	%f0, %f0
	b	beq_cont.5769
beq_else.5768:
	lfd	%f0, 72(%r3)
beq_cont.5769:
	lis	%r2, ha16(min_caml_solver_dist)
	addi	%r2, %r2, lo16(min_caml_solver_dist)
	lfd	%f1, 40(%r3)
	fsub	%f0, %f0, %f1
	lis	%r31, ha16(l.4440)
	addi	%r31, %r31, lo16(l.4440)
	lfd	%f1, 0(%r31)
	fdiv	%f0, %f0, %f1
	lfd	%f1, 16(%r3)
	fdiv	%f0, %f0, %f1
	stw	%f0, 0(%r2)
	li	%r2, 1
	blr
solver.2066:
	lis	%r7, ha16(min_caml_objects)
	addi	%r7, %r7, lo16(min_caml_objects)
	slwi	%r2, %r2, 2
	lwzx	%r2, %r7, %r2
	lis	%r7, ha16(min_caml_solver_w_vec)
	addi	%r7, %r7, lo16(min_caml_solver_w_vec)
	lfd	%f0, 0(%r6)
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	stw	%r6, 8(%r3)
	stw	%r7, 12(%r3)
	stfd	%f0, 16(%r3)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_param_x.2000
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lfd	%f1, 16(%r3)
	fsub	%f0, %f1, %f0
	lwz	%r2, 12(%r3)
	stfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_solver_w_vec)
	addi	%r2, %r2, lo16(min_caml_solver_w_vec)
	lwz	%r5, 8(%r3)
	lfd	%f0, 8(%r5)
	lwz	%r6, 4(%r3)
	stw	%r2, 24(%r3)
	stfd	%f0, 32(%r3)
	mflr	%r31
	or	%r2, %r6, %r2	# mr %r2, %r6
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	o_param_y.2002
	subi	%r3, %r3, 48
	lwz	%r31, 44(%r3)
	mtlr	%r31
	lfd	%f1, 32(%r3)
	fsub	%f0, %f1, %f0
	lwz	%r2, 24(%r3)
	stfd	%f0, 8(%r2)
	lis	%r2, ha16(min_caml_solver_w_vec)
	addi	%r2, %r2, lo16(min_caml_solver_w_vec)
	lwz	%r5, 8(%r3)
	lfd	%f0, 16(%r5)
	lwz	%r5, 4(%r3)
	stw	%r2, 40(%r3)
	stfd	%f0, 48(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_param_z.2004
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	lfd	%f1, 48(%r3)
	fsub	%f0, %f1, %f0
	lwz	%r2, 40(%r3)
	stfd	%f0, 16(%r2)
	lwz	%r2, 4(%r3)
	mflr	%r31
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_form.1986
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.5772
	lwz	%r2, 4(%r3)
	lwz	%r5, 0(%r3)
	b	solver_rect.2045
beq_else.5772:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.5773
	lwz	%r2, 4(%r3)
	lwz	%r5, 0(%r3)
	b	solver_surface.2048
beq_else.5773:
	lwz	%r2, 4(%r3)
	lwz	%r5, 0(%r3)
	b	solver_second.2063
is_rect_outside.2070:
	stw	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	o_param_a.1994
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_isoutside_q)
	addi	%r2, %r2, lo16(min_caml_isoutside_q)
	lfd	%f1, 0(%r2)
	stfd	%f0, 8(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_abs_float
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lfd	%f0, 8(%r3)
	fcmpu	%cr7, %f0, %r2
	bgt	%cr7, ble_else.5775
	li	%r2, 0
	b	ble_cont.5776
ble_else.5775:
	lwz	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_param_b.1996
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_isoutside_q)
	addi	%r2, %r2, lo16(min_caml_isoutside_q)
	lfd	%f1, 8(%r2)
	stfd	%f0, 16(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	min_caml_abs_float
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lfd	%f0, 16(%r3)
	fcmpu	%cr7, %f0, %r2
	bgt	%cr7, ble_else.5777
	li	%r2, 0
	b	ble_cont.5778
ble_else.5777:
	lwz	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_param_c.1998
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_isoutside_q)
	addi	%r2, %r2, lo16(min_caml_isoutside_q)
	lfd	%f1, 16(%r2)
	stfd	%f0, 24(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	min_caml_abs_float
	subi	%r3, %r3, 40
	lwz	%r31, 36(%r3)
	mtlr	%r31
	lfd	%f0, 24(%r3)
	fcmpu	%cr7, %f0, %r2
	bgt	%cr7, ble_else.5779
	li	%r2, 0
	b	ble_cont.5780
ble_else.5779:
	li	%r2, 1
ble_cont.5780:
ble_cont.5778:
ble_cont.5776:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5781
	lwz	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_isinvert.1990
	subi	%r3, %r3, 40
	lwz	%r31, 36(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5782
	li	%r2, 1
	blr
beq_else.5782:
	li	%r2, 0
	blr
beq_else.5781:
	lwz	%r2, 0(%r3)
	b	o_isinvert.1990
is_plane_outside.2072:
	stw	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	o_param_a.1994
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_isoutside_q)
	addi	%r2, %r2, lo16(min_caml_isoutside_q)
	lfd	%f1, 0(%r2)
	fmul	%f0, %f0, %f1
	lwz	%r2, 0(%r3)
	stfd	%f0, 8(%r3)
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_param_b.1996
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_isoutside_q)
	addi	%r2, %r2, lo16(min_caml_isoutside_q)
	lfd	%f1, 8(%r2)
	fmul	%f0, %f0, %f1
	lfd	%f1, 8(%r3)
	fadd	%f0, %f1, %f0
	lwz	%r2, 0(%r3)
	stfd	%f0, 16(%r3)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_param_c.1998
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_isoutside_q)
	addi	%r2, %r2, lo16(min_caml_isoutside_q)
	lfd	%f1, 16(%r2)
	fmul	%f0, %f0, %f1
	lfd	%f1, 16(%r3)
	fadd	%f0, %f1, %f0
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.5784
	li	%r2, 0
	b	ble_cont.5785
ble_else.5784:
	li	%r2, 1
ble_cont.5785:
	lwz	%r5, 0(%r3)
	stw	%r2, 24(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_isinvert.1990
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lwz	%r5, 24(%r3)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	xor.1977
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5786
	li	%r2, 1
	blr
beq_else.5786:
	li	%r2, 0
	blr
is_second_outside.2074:
	lis	%r5, ha16(min_caml_isoutside_q)
	addi	%r5, %r5, lo16(min_caml_isoutside_q)
	stw	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	in_prod_sqr_obj.2051
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lwz	%r2, 0(%r3)
	stfd	%f0, 8(%r3)
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_form.1986
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 3
	bne	%cr7, beq_else.5788
	lis	%r31, ha16(l.4465)
	addi	%r31, %r31, lo16(l.4465)
	lfd	%f0, 0(%r31)
	lfd	%f1, 8(%r3)
	fsub	%f0, %f1, %f0
	b	beq_cont.5789
beq_else.5788:
	lfd	%f0, 8(%r3)
beq_cont.5789:
	lwz	%r2, 0(%r3)
	stfd	%f0, 16(%r3)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_isrot.1992
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5790
	lfd	%f0, 16(%r3)
	b	beq_cont.5791
beq_else.5790:
	lis	%r5, ha16(min_caml_isoutside_q)
	addi	%r5, %r5, lo16(min_caml_isoutside_q)
	lwz	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	in_prod_co_objrot.2054
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lfd	%f1, 16(%r3)
	fadd	%f0, %f1, %f0
beq_cont.5791:
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.5792
	li	%r2, 0
	b	ble_cont.5793
ble_else.5792:
	li	%r2, 1
ble_cont.5793:
	lwz	%r5, 0(%r3)
	stw	%r2, 24(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_isinvert.1990
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lwz	%r5, 24(%r3)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	xor.1977
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5794
	li	%r2, 1
	blr
beq_else.5794:
	li	%r2, 0
	blr
is_outside.2076:
	lis	%r5, ha16(min_caml_isoutside_q)
	addi	%r5, %r5, lo16(min_caml_isoutside_q)
	lis	%r6, ha16(min_caml_chkinside_p)
	addi	%r6, %r6, lo16(min_caml_chkinside_p)
	lwz	%r6, 0(%r6)
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r6, 8(%r3)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_param_x.2000
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	lfd	%f1, 8(%r3)
	fsub	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	stfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_isoutside_q)
	addi	%r2, %r2, lo16(min_caml_isoutside_q)
	lis	%r5, ha16(min_caml_chkinside_p)
	addi	%r5, %r5, lo16(min_caml_chkinside_p)
	lwz	%r5, 4(%r5)
	lwz	%r6, 0(%r3)
	stw	%r2, 12(%r3)
	stw	%r5, 16(%r3)
	mflr	%r31
	or	%r2, %r6, %r2	# mr %r2, %r6
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_param_y.2002
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lfd	%f1, 16(%r3)
	fsub	%f0, %f1, %f0
	lwz	%r2, 12(%r3)
	stfd	%f0, 8(%r2)
	lis	%r2, ha16(min_caml_isoutside_q)
	addi	%r2, %r2, lo16(min_caml_isoutside_q)
	lis	%r5, ha16(min_caml_chkinside_p)
	addi	%r5, %r5, lo16(min_caml_chkinside_p)
	lwz	%r5, 8(%r5)
	lwz	%r6, 0(%r3)
	stw	%r2, 20(%r3)
	stw	%r5, 24(%r3)
	mflr	%r31
	or	%r2, %r6, %r2	# mr %r2, %r6
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_param_z.2004
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lfd	%f1, 24(%r3)
	fsub	%f0, %f1, %f0
	lwz	%r2, 20(%r3)
	stfd	%f0, 16(%r2)
	lwz	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_form.1986
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.5795
	lwz	%r2, 0(%r3)
	b	is_rect_outside.2070
beq_else.5795:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.5796
	lwz	%r2, 0(%r3)
	b	is_plane_outside.2072
beq_else.5796:
	lwz	%r2, 0(%r3)
	b	is_second_outside.2074
check_all_inside.2078:
	slwi	%r6, %r2, 2
	lwzx	%r6, %r5, %r6
	cmpwi	%cr7, %r6, -1
	bne	%cr7, beq_else.5797
	li	%r2, 1
	blr
beq_else.5797:
	lis	%r7, ha16(min_caml_objects)
	addi	%r7, %r7, lo16(min_caml_objects)
	slwi	%r6, %r6, 2
	lwzx	%r6, %r7, %r6
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mflr	%r31
	or	%r2, %r6, %r2	# mr %r2, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	is_outside.2076
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5798
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 0(%r3)
	b	check_all_inside.2078
beq_else.5798:
	li	%r2, 0
	blr
shadow_check_and_group.2081:
	slwi	%r7, %r2, 2
	lwzx	%r7, %r5, %r7
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.5799
	li	%r2, 0
	blr
beq_else.5799:
	slwi	%r7, %r2, 2
	lwzx	%r7, %r5, %r7
	lis	%r8, ha16(min_caml_light)
	addi	%r8, %r8, lo16(min_caml_light)
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r2, 8(%r3)
	stw	%r7, 12(%r3)
	mflr	%r31
	or	%r5, %r8, %r5	# mr %r5, %r8
	or	%r2, %r7, %r2	# mr %r2, %r7
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	solver.2066
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lis	%r5, ha16(min_caml_solver_dist)
	addi	%r5, %r5, lo16(min_caml_solver_dist)
	lwz	%f0, 0(%r5)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5800
	li	%r2, 0
	b	beq_cont.5801
beq_else.5800:
	lis	%r31, ha16(l.4708)
	addi	%r31, %r31, lo16(l.4708)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.5802
	li	%r2, 0
	b	ble_cont.5803
ble_else.5802:
	li	%r2, 1
ble_cont.5803:
beq_cont.5801:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5804
	lis	%r2, ha16(min_caml_objects)
	addi	%r2, %r2, lo16(min_caml_objects)
	lwz	%r5, 12(%r3)
	slwi	%r5, %r5, 2
	lwzx	%r2, %r2, %r5
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_isinvert.1990
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5805
	li	%r2, 0
	blr
beq_else.5805:
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	b	shadow_check_and_group.2081
beq_else.5804:
	lis	%r31, ha16(l.4709)
	addi	%r31, %r31, lo16(l.4709)
	lfd	%f1, 0(%r31)
	fadd	%f0, %f0, %f1
	lis	%r2, ha16(min_caml_chkinside_p)
	addi	%r2, %r2, lo16(min_caml_chkinside_p)
	lis	%r5, ha16(min_caml_light)
	addi	%r5, %r5, lo16(min_caml_light)
	lfd	%f1, 0(%r5)
	fmul	%f1, %f1, %f0
	lwz	%r5, 0(%r3)
	lfd	%f2, 0(%r5)
	fadd	%f1, %f1, %f2
	stw	%f1, 0(%r2)
	lis	%r2, ha16(min_caml_chkinside_p)
	addi	%r2, %r2, lo16(min_caml_chkinside_p)
	lis	%r6, ha16(min_caml_light)
	addi	%r6, %r6, lo16(min_caml_light)
	lfd	%f1, 8(%r6)
	fmul	%f1, %f1, %f0
	lfd	%f2, 8(%r5)
	fadd	%f1, %f1, %f2
	stw	%f1, 4(%r2)
	lis	%r2, ha16(min_caml_chkinside_p)
	addi	%r2, %r2, lo16(min_caml_chkinside_p)
	lis	%r6, ha16(min_caml_light)
	addi	%r6, %r6, lo16(min_caml_light)
	lfd	%f1, 16(%r6)
	fmul	%f0, %f1, %f0
	lfd	%f1, 16(%r5)
	fadd	%f0, %f0, %f1
	stw	%f0, 8(%r2)
	li	%r2, 0
	lwz	%r6, 4(%r3)
	mflr	%r31
	or	%r5, %r6, %r5	# mr %r5, %r6
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	check_all_inside.2078
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5806
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	b	shadow_check_and_group.2081
beq_else.5806:
	li	%r2, 1
	blr
shadow_check_one_or_group.2085:
	slwi	%r7, %r2, 2
	lwzx	%r7, %r5, %r7
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.5807
	li	%r2, 0
	blr
beq_else.5807:
	lis	%r8, ha16(min_caml_and_net)
	addi	%r8, %r8, lo16(min_caml_and_net)
	slwi	%r7, %r7, 2
	lwzx	%r7, %r8, %r7
	li	%r8, 0
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r2, 8(%r3)
	mflr	%r31
	or	%r5, %r7, %r5	# mr %r5, %r7
	or	%r2, %r8, %r2	# mr %r2, %r8
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	shadow_check_and_group.2081
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5808
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	b	shadow_check_one_or_group.2085
beq_else.5808:
	li	%r2, 1
	blr
shadow_check_one_or_matrix.2089:
	slwi	%r7, %r2, 2
	lwzx	%r7, %r5, %r7
	lwz	%r8, 0(%r7)
	cmpwi	%cr7, %r8, -1
	bne	%cr7, beq_else.5809
	li	%r2, 0
	blr
beq_else.5809:
	cmpwi	%cr7, %r8, 99
	bne	%cr7, beq_else.5810
	li	%r8, 1
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r2, 8(%r3)
	mflr	%r31
	or	%r5, %r7, %r5	# mr %r5, %r7
	or	%r2, %r8, %r2	# mr %r2, %r8
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	shadow_check_one_or_group.2085
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5811
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	b	shadow_check_one_or_matrix.2089
beq_else.5811:
	li	%r2, 1
	blr
beq_else.5810:
	lis	%r9, ha16(min_caml_light)
	addi	%r9, %r9, lo16(min_caml_light)
	stw	%r7, 12(%r3)
	stw	%r6, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r2, 8(%r3)
	mflr	%r31
	or	%r5, %r9, %r5	# mr %r5, %r9
	or	%r2, %r8, %r2	# mr %r2, %r8
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	solver.2066
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5812
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	b	shadow_check_one_or_matrix.2089
beq_else.5812:
	lis	%r31, ha16(l.4724)
	addi	%r31, %r31, lo16(l.4724)
	lfd	%f0, 0(%r31)
	lis	%r2, ha16(min_caml_solver_dist)
	addi	%r2, %r2, lo16(min_caml_solver_dist)
	lwz	%r2, 0(%r2)
	fcmpu	%cr7, %f0, %r2
	bgt	%cr7, ble_else.5813
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	b	shadow_check_one_or_matrix.2089
ble_else.5813:
	li	%r2, 1
	lwz	%r5, 12(%r3)
	lwz	%r6, 0(%r3)
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	shadow_check_one_or_group.2085
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5814
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	lwz	%r6, 0(%r3)
	b	shadow_check_one_or_matrix.2089
beq_else.5814:
	li	%r2, 1
	blr
solve_each_element.2093:
	slwi	%r6, %r2, 2
	lwzx	%r6, %r5, %r6
	cmpwi	%cr7, %r6, -1
	bne	%cr7, beq_else.5815
	blr
beq_else.5815:
	lis	%r7, ha16(min_caml_vscan)
	addi	%r7, %r7, lo16(min_caml_vscan)
	lis	%r8, ha16(min_caml_viewpoint)
	addi	%r8, %r8, lo16(min_caml_viewpoint)
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r6, 8(%r3)
	mflr	%r31
	or	%r5, %r7, %r5	# mr %r5, %r7
	or	%r2, %r6, %r2	# mr %r2, %r6
	or	%r6, %r8, %r6	# mr %r6, %r8
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	solver.2066
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5817
	lis	%r2, ha16(min_caml_objects)
	addi	%r2, %r2, lo16(min_caml_objects)
	lwz	%r5, 8(%r3)
	slwi	%r5, %r5, 2
	lwzx	%r2, %r2, %r5
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_isinvert.1990
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5819
	lis	%r2, ha16(min_caml_end_flag)
	addi	%r2, %r2, lo16(min_caml_end_flag)
	li	%r5, 1
	stw	%r5, 0(%r2)
	b	beq_cont.5820
beq_else.5819:
beq_cont.5820:
	b	beq_cont.5818
beq_else.5817:
	lis	%r5, ha16(min_caml_solver_dist)
	addi	%r5, %r5, lo16(min_caml_solver_dist)
	lwz	%f0, 0(%r5)
	lis	%r31, ha16(l.4724)
	addi	%r31, %r31, lo16(l.4724)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.5821
	b	ble_cont.5822
ble_else.5821:
	lis	%r5, ha16(min_caml_tmin)
	addi	%r5, %r5, lo16(min_caml_tmin)
	lfd	%f1, 0(%r5)
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.5823
	b	ble_cont.5824
ble_else.5823:
	lis	%r31, ha16(l.4709)
	addi	%r31, %r31, lo16(l.4709)
	lfd	%f1, 0(%r31)
	fadd	%f0, %f0, %f1
	lis	%r5, ha16(min_caml_chkinside_p)
	addi	%r5, %r5, lo16(min_caml_chkinside_p)
	lis	%r6, ha16(min_caml_vscan)
	addi	%r6, %r6, lo16(min_caml_vscan)
	lfd	%f1, 0(%r6)
	fmul	%f1, %f1, %f0
	lis	%r6, ha16(min_caml_viewpoint)
	addi	%r6, %r6, lo16(min_caml_viewpoint)
	lwz	%r6, 0(%r6)
	fadd	%f1, %f1, %r6
	stw	%f1, 0(%r5)
	lis	%r5, ha16(min_caml_chkinside_p)
	addi	%r5, %r5, lo16(min_caml_chkinside_p)
	lis	%r6, ha16(min_caml_vscan)
	addi	%r6, %r6, lo16(min_caml_vscan)
	lfd	%f1, 8(%r6)
	fmul	%f1, %f1, %f0
	lis	%r6, ha16(min_caml_viewpoint)
	addi	%r6, %r6, lo16(min_caml_viewpoint)
	lwz	%r6, 4(%r6)
	fadd	%f1, %f1, %r6
	stw	%f1, 4(%r5)
	lis	%r5, ha16(min_caml_chkinside_p)
	addi	%r5, %r5, lo16(min_caml_chkinside_p)
	lis	%r6, ha16(min_caml_vscan)
	addi	%r6, %r6, lo16(min_caml_vscan)
	lfd	%f1, 16(%r6)
	fmul	%f1, %f1, %f0
	lis	%r6, ha16(min_caml_viewpoint)
	addi	%r6, %r6, lo16(min_caml_viewpoint)
	lwz	%r6, 8(%r6)
	fadd	%f1, %f1, %r6
	stw	%f1, 8(%r5)
	li	%r5, 0
	lwz	%r6, 4(%r3)
	stw	%r2, 12(%r3)
	stfd	%f0, 16(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	or	%r5, %r6, %r5	# mr %r5, %r6
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	check_all_inside.2078
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5825
	b	beq_cont.5826
beq_else.5825:
	lis	%r2, ha16(min_caml_tmin)
	addi	%r2, %r2, lo16(min_caml_tmin)
	lfd	%f0, 16(%r3)
	stfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_crashed_point)
	addi	%r2, %r2, lo16(min_caml_crashed_point)
	lis	%r5, ha16(min_caml_chkinside_p)
	addi	%r5, %r5, lo16(min_caml_chkinside_p)
	lwz	%r5, 0(%r5)
	stw	%r5, 0(%r2)
	lis	%r2, ha16(min_caml_crashed_point)
	addi	%r2, %r2, lo16(min_caml_crashed_point)
	lis	%r5, ha16(min_caml_chkinside_p)
	addi	%r5, %r5, lo16(min_caml_chkinside_p)
	lwz	%r5, 4(%r5)
	stw	%r5, 4(%r2)
	lis	%r2, ha16(min_caml_crashed_point)
	addi	%r2, %r2, lo16(min_caml_crashed_point)
	lis	%r5, ha16(min_caml_chkinside_p)
	addi	%r5, %r5, lo16(min_caml_chkinside_p)
	lwz	%r5, 8(%r5)
	stw	%r5, 8(%r2)
	lis	%r2, ha16(min_caml_intsec_rectside)
	addi	%r2, %r2, lo16(min_caml_intsec_rectside)
	lwz	%r5, 12(%r3)
	stw	%r5, 0(%r2)
	lis	%r2, ha16(min_caml_crashed_object)
	addi	%r2, %r2, lo16(min_caml_crashed_object)
	lwz	%r5, 8(%r3)
	stw	%r5, 0(%r2)
beq_cont.5826:
ble_cont.5824:
ble_cont.5822:
beq_cont.5818:
	lis	%r2, ha16(min_caml_end_flag)
	addi	%r2, %r2, lo16(min_caml_end_flag)
	lwz	%r2, 0(%r2)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5827
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 4(%r3)
	b	solve_each_element.2093
beq_else.5827:
	blr
solve_one_or_network.2096:
	slwi	%r6, %r2, 2
	lwzx	%r6, %r5, %r6
	cmpwi	%cr7, %r6, -1
	bne	%cr7, beq_else.5829
	blr
beq_else.5829:
	lis	%r7, ha16(min_caml_and_net)
	addi	%r7, %r7, lo16(min_caml_and_net)
	slwi	%r6, %r6, 2
	lwzx	%r6, %r7, %r6
	lis	%r7, ha16(min_caml_end_flag)
	addi	%r7, %r7, lo16(min_caml_end_flag)
	li	%r8, 0
	stw	%r8, 0(%r7)
	li	%r7, 0
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mflr	%r31
	or	%r5, %r6, %r5	# mr %r5, %r6
	or	%r2, %r7, %r2	# mr %r2, %r7
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	solve_each_element.2093
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 0(%r3)
	b	solve_one_or_network.2096
trace_or_matrix.2099:
	slwi	%r6, %r2, 2
	lwzx	%r6, %r5, %r6
	lwz	%r7, 0(%r6)
	cmpwi	%cr7, %r7, -1
	bne	%cr7, beq_else.5831
	blr
beq_else.5831:
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	cmpwi	%cr7, %r7, 99
	bne	%cr7, beq_else.5833
	li	%r7, 1
	mflr	%r31
	or	%r5, %r6, %r5	# mr %r5, %r6
	or	%r2, %r7, %r2	# mr %r2, %r7
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	solve_one_or_network.2096
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	b	beq_cont.5834
beq_else.5833:
	lis	%r8, ha16(min_caml_vscan)
	addi	%r8, %r8, lo16(min_caml_vscan)
	lis	%r9, ha16(min_caml_viewpoint)
	addi	%r9, %r9, lo16(min_caml_viewpoint)
	stw	%r6, 8(%r3)
	mflr	%r31
	or	%r6, %r9, %r6	# mr %r6, %r9
	or	%r5, %r8, %r5	# mr %r5, %r8
	or	%r2, %r7, %r2	# mr %r2, %r7
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	solver.2066
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5835
	b	beq_cont.5836
beq_else.5835:
	lis	%r2, ha16(min_caml_solver_dist)
	addi	%r2, %r2, lo16(min_caml_solver_dist)
	lwz	%r2, 0(%r2)
	lis	%r5, ha16(min_caml_tmin)
	addi	%r5, %r5, lo16(min_caml_tmin)
	lfd	%f0, 0(%r5)
	fcmpu	%cr7, %f0, %r2
	bgt	%cr7, ble_else.5837
	b	ble_cont.5838
ble_else.5837:
	li	%r2, 1
	lwz	%r5, 8(%r3)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	solve_one_or_network.2096
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
ble_cont.5838:
beq_cont.5836:
beq_cont.5834:
	lwz	%r2, 4(%r3)
	addi	%r2, %r2, 1
	lwz	%r5, 0(%r3)
	b	trace_or_matrix.2099
tracer.2102:
	lis	%r2, ha16(min_caml_tmin)
	addi	%r2, %r2, lo16(min_caml_tmin)
	lis	%r31, ha16(l.4757)
	addi	%r31, %r31, lo16(l.4757)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	li	%r2, 0
	lis	%r5, ha16(min_caml_or_net)
	addi	%r5, %r5, lo16(min_caml_or_net)
	lwz	%r5, 0(%r5)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	trace_or_matrix.2099
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_tmin)
	addi	%r2, %r2, lo16(min_caml_tmin)
	lfd	%f0, 0(%r2)
	lis	%r31, ha16(l.4724)
	addi	%r31, %r31, lo16(l.4724)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.5839
	li	%r2, 0
	blr
ble_else.5839:
	lis	%r31, ha16(l.4761)
	addi	%r31, %r31, lo16(l.4761)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.5840
	li	%r2, 0
	blr
ble_else.5840:
	li	%r2, 1
	blr
get_nvector_rect.2105:
	lis	%r2, ha16(min_caml_intsec_rectside)
	addi	%r2, %r2, lo16(min_caml_intsec_rectside)
	lwz	%r2, 0(%r2)
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.5841
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lis	%r5, ha16(min_caml_vscan)
	addi	%r5, %r5, lo16(min_caml_vscan)
	lfd	%f0, 0(%r5)
	stw	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	sgn.2025
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	fneg	%f0, %f0
	lwz	%r2, 0(%r3)
	stfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	stfd	%f0, 16(%r2)
	blr
beq_else.5841:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.5843
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lis	%r5, ha16(min_caml_vscan)
	addi	%r5, %r5, lo16(min_caml_vscan)
	lfd	%f0, 8(%r5)
	stw	%r2, 4(%r3)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	sgn.2025
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	fneg	%f0, %f0
	lwz	%r2, 4(%r3)
	stfd	%f0, 8(%r2)
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	stfd	%f0, 16(%r2)
	blr
beq_else.5843:
	cmpwi	%cr7, %r2, 3
	bne	%cr7, beq_else.5845
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lis	%r5, ha16(min_caml_vscan)
	addi	%r5, %r5, lo16(min_caml_vscan)
	lfd	%f0, 16(%r5)
	stw	%r2, 8(%r3)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	sgn.2025
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	fneg	%f0, %f0
	lwz	%r2, 8(%r3)
	stfd	%f0, 16(%r2)
	blr
beq_else.5845:
	blr
get_nvector_plane.2107:
	lis	%r5, ha16(min_caml_nvector)
	addi	%r5, %r5, lo16(min_caml_nvector)
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_param_a.1994
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	fneg	%f0, %f0
	lwz	%r2, 4(%r3)
	stfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lwz	%r5, 0(%r3)
	stw	%r2, 8(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_param_b.1996
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	fneg	%f0, %f0
	lwz	%r2, 8(%r3)
	stfd	%f0, 8(%r2)
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lwz	%r5, 0(%r3)
	stw	%r2, 12(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_param_c.1998
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	fneg	%f0, %f0
	lwz	%r2, 12(%r3)
	stfd	%f0, 16(%r2)
	blr
get_nvector_second_norot.2109:
	lis	%r6, ha16(min_caml_nvector)
	addi	%r6, %r6, lo16(min_caml_nvector)
	lfd	%f0, 0(%r5)
	stw	%r5, 0(%r3)
	stw	%r6, 4(%r3)
	stw	%r2, 8(%r3)
	stfd	%f0, 16(%r3)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_param_x.2000
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lfd	%f1, 16(%r3)
	fsub	%f0, %f1, %f0
	lwz	%r2, 8(%r3)
	stfd	%f0, 24(%r3)
	mflr	%r31
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_a.1994
	subi	%r3, %r3, 40
	lwz	%r31, 36(%r3)
	mtlr	%r31
	lfd	%f1, 24(%r3)
	fmul	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	stfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lwz	%r5, 0(%r3)
	lfd	%f0, 8(%r5)
	lwz	%r6, 8(%r3)
	stw	%r2, 32(%r3)
	stfd	%f0, 40(%r3)
	mflr	%r31
	or	%r2, %r6, %r2	# mr %r2, %r6
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	o_param_y.2002
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	lfd	%f1, 40(%r3)
	fsub	%f0, %f1, %f0
	lwz	%r2, 8(%r3)
	stfd	%f0, 48(%r3)
	mflr	%r31
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_param_b.1996
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	lfd	%f1, 48(%r3)
	fmul	%f0, %f1, %f0
	lwz	%r2, 32(%r3)
	stfd	%f0, 8(%r2)
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lwz	%r5, 0(%r3)
	lfd	%f0, 16(%r5)
	lwz	%r5, 8(%r3)
	stw	%r2, 56(%r3)
	stfd	%f0, 64(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	o_param_z.2004
	subi	%r3, %r3, 80
	lwz	%r31, 76(%r3)
	mtlr	%r31
	lfd	%f1, 64(%r3)
	fsub	%f0, %f1, %f0
	lwz	%r2, 8(%r3)
	stfd	%f0, 72(%r3)
	mflr	%r31
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_param_c.1998
	subi	%r3, %r3, 88
	lwz	%r31, 84(%r3)
	mtlr	%r31
	lfd	%f1, 72(%r3)
	fmul	%f0, %f1, %f0
	lwz	%r2, 56(%r3)
	stfd	%f0, 16(%r2)
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lwz	%r5, 8(%r3)
	stw	%r2, 80(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_isinvert.1990
	subi	%r3, %r3, 88
	lwz	%r31, 84(%r3)
	or	%r5, %r2, %r5	# mr %r5, %r2
	mtlr	%r31
	lwz	%r2, 80(%r3)
	b	normalize_vector.2022
get_nvector_second_rot.2112:
	lis	%r6, ha16(min_caml_nvector_w)
	addi	%r6, %r6, lo16(min_caml_nvector_w)
	lfd	%f0, 0(%r5)
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	stw	%r6, 8(%r3)
	stfd	%f0, 16(%r3)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_param_x.2000
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lfd	%f1, 16(%r3)
	fsub	%f0, %f1, %f0
	lwz	%r2, 8(%r3)
	stfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_nvector_w)
	addi	%r2, %r2, lo16(min_caml_nvector_w)
	lwz	%r5, 4(%r3)
	lfd	%f0, 8(%r5)
	lwz	%r6, 0(%r3)
	stw	%r2, 24(%r3)
	stfd	%f0, 32(%r3)
	mflr	%r31
	or	%r2, %r6, %r2	# mr %r2, %r6
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	o_param_y.2002
	subi	%r3, %r3, 48
	lwz	%r31, 44(%r3)
	mtlr	%r31
	lfd	%f1, 32(%r3)
	fsub	%f0, %f1, %f0
	lwz	%r2, 24(%r3)
	stfd	%f0, 8(%r2)
	lis	%r2, ha16(min_caml_nvector_w)
	addi	%r2, %r2, lo16(min_caml_nvector_w)
	lwz	%r5, 4(%r3)
	lfd	%f0, 16(%r5)
	lwz	%r5, 0(%r3)
	stw	%r2, 40(%r3)
	stfd	%f0, 48(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_param_z.2004
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	lfd	%f1, 48(%r3)
	fsub	%f0, %f1, %f0
	lwz	%r2, 40(%r3)
	stfd	%f0, 16(%r2)
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lis	%r5, ha16(min_caml_nvector_w)
	addi	%r5, %r5, lo16(min_caml_nvector_w)
	lfd	%f0, 0(%r5)
	lwz	%r5, 0(%r3)
	stw	%r2, 56(%r3)
	stfd	%f0, 64(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	o_param_a.1994
	subi	%r3, %r3, 80
	lwz	%r31, 76(%r3)
	mtlr	%r31
	lfd	%f1, 64(%r3)
	fmul	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_nvector_w)
	addi	%r2, %r2, lo16(min_caml_nvector_w)
	lfd	%f1, 8(%r2)
	lwz	%r2, 0(%r3)
	stfd	%f0, 72(%r3)
	stfd	%f1, 80(%r3)
	mflr	%r31
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	o_param_r3.2020
	subi	%r3, %r3, 96
	lwz	%r31, 92(%r3)
	mtlr	%r31
	lfd	%f1, 80(%r3)
	fmul	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_nvector_w)
	addi	%r2, %r2, lo16(min_caml_nvector_w)
	lfd	%f1, 16(%r2)
	lwz	%r2, 0(%r3)
	stfd	%f0, 88(%r3)
	stfd	%f1, 96(%r3)
	mflr	%r31
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	o_param_r2.2018
	subi	%r3, %r3, 112
	lwz	%r31, 108(%r3)
	mtlr	%r31
	lfd	%f1, 96(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 88(%r3)
	fadd	%f0, %f1, %f0
	mflr	%r31
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	fhalf.1982
	subi	%r3, %r3, 112
	lwz	%r31, 108(%r3)
	mtlr	%r31
	lfd	%f1, 72(%r3)
	fadd	%f0, %f1, %f0
	lwz	%r2, 56(%r3)
	stfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lis	%r5, ha16(min_caml_nvector_w)
	addi	%r5, %r5, lo16(min_caml_nvector_w)
	lfd	%f0, 8(%r5)
	lwz	%r5, 0(%r3)
	stw	%r2, 104(%r3)
	stfd	%f0, 112(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	o_param_b.1996
	subi	%r3, %r3, 128
	lwz	%r31, 124(%r3)
	mtlr	%r31
	lfd	%f1, 112(%r3)
	fmul	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_nvector_w)
	addi	%r2, %r2, lo16(min_caml_nvector_w)
	lfd	%f1, 0(%r2)
	lwz	%r2, 0(%r3)
	stfd	%f0, 120(%r3)
	stfd	%f1, 128(%r3)
	mflr	%r31
	stw	%r31, 140(%r3)
	addi	%r3, %r3, 144
	bl	o_param_r3.2020
	subi	%r3, %r3, 144
	lwz	%r31, 140(%r3)
	mtlr	%r31
	lfd	%f1, 128(%r3)
	fmul	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_nvector_w)
	addi	%r2, %r2, lo16(min_caml_nvector_w)
	lfd	%f1, 16(%r2)
	lwz	%r2, 0(%r3)
	stfd	%f0, 136(%r3)
	stfd	%f1, 144(%r3)
	mflr	%r31
	stw	%r31, 156(%r3)
	addi	%r3, %r3, 160
	bl	o_param_r1.2016
	subi	%r3, %r3, 160
	lwz	%r31, 156(%r3)
	mtlr	%r31
	lfd	%f1, 144(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 136(%r3)
	fadd	%f0, %f1, %f0
	mflr	%r31
	stw	%r31, 156(%r3)
	addi	%r3, %r3, 160
	bl	fhalf.1982
	subi	%r3, %r3, 160
	lwz	%r31, 156(%r3)
	mtlr	%r31
	lfd	%f1, 120(%r3)
	fadd	%f0, %f1, %f0
	lwz	%r2, 104(%r3)
	stfd	%f0, 8(%r2)
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lis	%r5, ha16(min_caml_nvector_w)
	addi	%r5, %r5, lo16(min_caml_nvector_w)
	lfd	%f0, 16(%r5)
	lwz	%r5, 0(%r3)
	stw	%r2, 152(%r3)
	stfd	%f0, 160(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 172(%r3)
	addi	%r3, %r3, 176
	bl	o_param_c.1998
	subi	%r3, %r3, 176
	lwz	%r31, 172(%r3)
	mtlr	%r31
	lfd	%f1, 160(%r3)
	fmul	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_nvector_w)
	addi	%r2, %r2, lo16(min_caml_nvector_w)
	lfd	%f1, 0(%r2)
	lwz	%r2, 0(%r3)
	stfd	%f0, 168(%r3)
	stfd	%f1, 176(%r3)
	mflr	%r31
	stw	%r31, 188(%r3)
	addi	%r3, %r3, 192
	bl	o_param_r2.2018
	subi	%r3, %r3, 192
	lwz	%r31, 188(%r3)
	mtlr	%r31
	lfd	%f1, 176(%r3)
	fmul	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_nvector_w)
	addi	%r2, %r2, lo16(min_caml_nvector_w)
	lfd	%f1, 8(%r2)
	lwz	%r2, 0(%r3)
	stfd	%f0, 184(%r3)
	stfd	%f1, 192(%r3)
	mflr	%r31
	stw	%r31, 204(%r3)
	addi	%r3, %r3, 208
	bl	o_param_r1.2016
	subi	%r3, %r3, 208
	lwz	%r31, 204(%r3)
	mtlr	%r31
	lfd	%f1, 192(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 184(%r3)
	fadd	%f0, %f1, %f0
	mflr	%r31
	stw	%r31, 204(%r3)
	addi	%r3, %r3, 208
	bl	fhalf.1982
	subi	%r3, %r3, 208
	lwz	%r31, 204(%r3)
	mtlr	%r31
	lfd	%f1, 168(%r3)
	fadd	%f0, %f1, %f0
	lwz	%r2, 152(%r3)
	stfd	%f0, 16(%r2)
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lwz	%r5, 0(%r3)
	stw	%r2, 200(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 204(%r3)
	addi	%r3, %r3, 208
	bl	o_isinvert.1990
	subi	%r3, %r3, 208
	lwz	%r31, 204(%r3)
	or	%r5, %r2, %r5	# mr %r5, %r2
	mtlr	%r31
	lwz	%r2, 200(%r3)
	b	normalize_vector.2022
get_nvector.2115:
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_form.1986
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.5858
	b	get_nvector_rect.2105
beq_else.5858:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.5859
	lwz	%r2, 4(%r3)
	b	get_nvector_plane.2107
beq_else.5859:
	lwz	%r2, 4(%r3)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_isrot.1992
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5860
	lwz	%r2, 4(%r3)
	lwz	%r5, 0(%r3)
	b	get_nvector_second_norot.2109
beq_else.5860:
	lwz	%r2, 4(%r3)
	lwz	%r5, 0(%r3)
	b	get_nvector_second_rot.2112
utexture.2118:
	stw	%r5, 0(%r3)
	stw	%r2, 4(%r3)
	mflr	%r31
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	o_texturetype.1984
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	lis	%r5, ha16(min_caml_texture_color)
	addi	%r5, %r5, lo16(min_caml_texture_color)
	lwz	%r6, 4(%r3)
	stw	%r2, 8(%r3)
	stw	%r5, 12(%r3)
	mflr	%r31
	or	%r2, %r6, %r2	# mr %r2, %r6
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_color_red.2010
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lwz	%r5, 12(%r3)
	stfd	%r2, 0(%r5)
	lis	%r2, ha16(min_caml_texture_color)
	addi	%r2, %r2, lo16(min_caml_texture_color)
	lwz	%r5, 4(%r3)
	stw	%r2, 16(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	o_color_green.2012
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lwz	%r5, 16(%r3)
	stfd	%r2, 8(%r5)
	lis	%r2, ha16(min_caml_texture_color)
	addi	%r2, %r2, lo16(min_caml_texture_color)
	lwz	%r5, 4(%r3)
	stw	%r2, 20(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	o_color_blue.2014
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lwz	%r5, 20(%r3)
	stfd	%r2, 16(%r5)
	lwz	%r2, 8(%r3)
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.5861
	lwz	%r2, 0(%r3)
	lfd	%f0, 0(%r2)
	lwz	%r5, 4(%r3)
	stfd	%f0, 24(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 36(%r3)
	addi	%r3, %r3, 40
	bl	o_param_x.2000
	subi	%r3, %r3, 40
	lwz	%r31, 36(%r3)
	mtlr	%r31
	lfd	%f1, 24(%r3)
	fsub	%f0, %f1, %f0
	lis	%r31, ha16(l.4827)
	addi	%r31, %r31, lo16(l.4827)
	lfd	%f1, 0(%r31)
	fmul	%f1, %f0, %f1
	stfd	%f0, 32(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	min_caml_floor
	subi	%r3, %r3, 48
	lwz	%r31, 44(%r3)
	mtlr	%r31
	lis	%r31, ha16(l.4828)
	addi	%r31, %r31, lo16(l.4828)
	lfd	%f1, 0(%r31)
	fmul	%f0, %f0, %f1
	lis	%r31, ha16(l.4817)
	addi	%r31, %r31, lo16(l.4817)
	lfd	%f1, 0(%r31)
	lfd	%f2, 32(%r3)
	fsub	%f0, %f2, %f0
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.5862
	li	%r2, 0
	b	ble_cont.5863
ble_else.5862:
	li	%r2, 1
ble_cont.5863:
	lwz	%r5, 0(%r3)
	lfd	%f0, 16(%r5)
	lwz	%r5, 4(%r3)
	stw	%r2, 40(%r3)
	stfd	%f0, 48(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_param_z.2004
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	lfd	%f1, 48(%r3)
	fsub	%f0, %f1, %f0
	lis	%r31, ha16(l.4827)
	addi	%r31, %r31, lo16(l.4827)
	lfd	%f1, 0(%r31)
	fmul	%f1, %f0, %f1
	stfd	%f0, 56(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	min_caml_floor
	subi	%r3, %r3, 72
	lwz	%r31, 68(%r3)
	mtlr	%r31
	lis	%r31, ha16(l.4828)
	addi	%r31, %r31, lo16(l.4828)
	lfd	%f1, 0(%r31)
	fmul	%f0, %f0, %f1
	lis	%r31, ha16(l.4817)
	addi	%r31, %r31, lo16(l.4817)
	lfd	%f1, 0(%r31)
	lfd	%f2, 56(%r3)
	fsub	%f0, %f2, %f0
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.5865
	li	%r2, 0
	b	ble_cont.5866
ble_else.5865:
	li	%r2, 1
ble_cont.5866:
	lis	%r5, ha16(min_caml_texture_color)
	addi	%r5, %r5, lo16(min_caml_texture_color)
	lwz	%r6, 40(%r3)
	cmpwi	%cr7, %r6, 0
	bne	%cr7, beq_else.5867
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5869
	lis	%r31, ha16(l.4819)
	addi	%r31, %r31, lo16(l.4819)
	lfd	%f0, 0(%r31)
	b	beq_cont.5870
beq_else.5869:
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
beq_cont.5870:
	b	beq_cont.5868
beq_else.5867:
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5871
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	b	beq_cont.5872
beq_else.5871:
	lis	%r31, ha16(l.4819)
	addi	%r31, %r31, lo16(l.4819)
	lfd	%f0, 0(%r31)
beq_cont.5872:
beq_cont.5868:
	stfd	%f0, 8(%r5)
	blr
beq_else.5861:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.5874
	lwz	%r2, 0(%r3)
	lfd	%f0, 8(%r2)
	lis	%r31, ha16(l.4823)
	addi	%r31, %r31, lo16(l.4823)
	lfd	%f1, 0(%r31)
	fmul	%f0, %f0, %f1
	mflr	%r31
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	min_caml_sin
	subi	%r3, %r3, 72
	lwz	%r31, 68(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fsqr.1980
	subi	%r3, %r3, 72
	lwz	%r31, 68(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_texture_color)
	addi	%r2, %r2, lo16(min_caml_texture_color)
	lis	%r31, ha16(l.4819)
	addi	%r31, %r31, lo16(l.4819)
	lfd	%f1, 0(%r31)
	fmul	%f1, %f1, %f0
	stfd	%f1, 0(%r2)
	lis	%r2, ha16(min_caml_texture_color)
	addi	%r2, %r2, lo16(min_caml_texture_color)
	lis	%r31, ha16(l.4819)
	addi	%r31, %r31, lo16(l.4819)
	lfd	%f1, 0(%r31)
	lis	%r31, ha16(l.4465)
	addi	%r31, %r31, lo16(l.4465)
	lfd	%f2, 0(%r31)
	fsub	%f0, %f2, %f0
	fmul	%f0, %f1, %f0
	stfd	%f0, 8(%r2)
	blr
beq_else.5874:
	cmpwi	%cr7, %r2, 3
	bne	%cr7, beq_else.5876
	lwz	%r2, 0(%r3)
	lfd	%f0, 0(%r2)
	lwz	%r5, 4(%r3)
	stfd	%f0, 64(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	o_param_x.2000
	subi	%r3, %r3, 80
	lwz	%r31, 76(%r3)
	mtlr	%r31
	lfd	%f1, 64(%r3)
	fsub	%f0, %f1, %f0
	lwz	%r2, 0(%r3)
	lfd	%f1, 16(%r2)
	lwz	%r2, 4(%r3)
	stfd	%f0, 72(%r3)
	stfd	%f1, 80(%r3)
	mflr	%r31
	stw	%r31, 92(%r3)
	addi	%r3, %r3, 96
	bl	o_param_z.2004
	subi	%r3, %r3, 96
	lwz	%r31, 92(%r3)
	mtlr	%r31
	lfd	%f1, 80(%r3)
	fsub	%f0, %f1, %f0
	lfd	%f1, 72(%r3)
	stfd	%f0, 88(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 100(%r3)
	addi	%r3, %r3, 104
	bl	fsqr.1980
	subi	%r3, %r3, 104
	lwz	%r31, 100(%r3)
	mtlr	%r31
	lfd	%f1, 88(%r3)
	stfd	%f0, 96(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	fsqr.1980
	subi	%r3, %r3, 112
	lwz	%r31, 108(%r3)
	mtlr	%r31
	lfd	%f1, 96(%r3)
	fadd	%f0, %f1, %f0
	mflr	%r31
	stw	%r31, 108(%r3)
	addi	%r3, %r3, 112
	bl	min_caml_sqrt
	subi	%r3, %r3, 112
	lwz	%r31, 108(%r3)
	mtlr	%r31
	lis	%r31, ha16(l.4817)
	addi	%r31, %r31, lo16(l.4817)
	lfd	%f1, 0(%r31)
	fdiv	%f0, %f0, %f1
	stfd	%f0, 104(%r3)
	mflr	%r31
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	min_caml_floor
	subi	%r3, %r3, 120
	lwz	%r31, 116(%r3)
	mtlr	%r31
	lfd	%f1, 104(%r3)
	fsub	%f0, %f1, %f0
	lis	%r31, ha16(l.4818)
	addi	%r31, %r31, lo16(l.4818)
	lfd	%f1, 0(%r31)
	fmul	%f0, %f0, %f1
	mflr	%r31
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	min_caml_cos
	subi	%r3, %r3, 120
	lwz	%r31, 116(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 116(%r3)
	addi	%r3, %r3, 120
	bl	fsqr.1980
	subi	%r3, %r3, 120
	lwz	%r31, 116(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_texture_color)
	addi	%r2, %r2, lo16(min_caml_texture_color)
	lis	%r31, ha16(l.4819)
	addi	%r31, %r31, lo16(l.4819)
	lfd	%f1, 0(%r31)
	fmul	%f1, %f0, %f1
	stfd	%f1, 8(%r2)
	lis	%r2, ha16(min_caml_texture_color)
	addi	%r2, %r2, lo16(min_caml_texture_color)
	lis	%r31, ha16(l.4465)
	addi	%r31, %r31, lo16(l.4465)
	lfd	%f1, 0(%r31)
	fsub	%f0, %f1, %f0
	lis	%r31, ha16(l.4819)
	addi	%r31, %r31, lo16(l.4819)
	lfd	%f1, 0(%r31)
	fmul	%f0, %f0, %f1
	stfd	%f0, 16(%r2)
	blr
beq_else.5876:
	cmpwi	%cr7, %r2, 4
	bne	%cr7, beq_else.5878
	lwz	%r2, 0(%r3)
	lfd	%f0, 0(%r2)
	lwz	%r5, 4(%r3)
	stfd	%f0, 112(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 124(%r3)
	addi	%r3, %r3, 128
	bl	o_param_x.2000
	subi	%r3, %r3, 128
	lwz	%r31, 124(%r3)
	mtlr	%r31
	lfd	%f1, 112(%r3)
	fsub	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	stfd	%f0, 120(%r3)
	mflr	%r31
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	o_param_a.1994
	subi	%r3, %r3, 136
	lwz	%r31, 132(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 132(%r3)
	addi	%r3, %r3, 136
	bl	min_caml_sqrt
	subi	%r3, %r3, 136
	lwz	%r31, 132(%r3)
	mtlr	%r31
	lfd	%f1, 120(%r3)
	fmul	%f0, %f1, %f0
	lwz	%r2, 0(%r3)
	lfd	%f1, 16(%r2)
	lwz	%r5, 4(%r3)
	stfd	%f0, 128(%r3)
	stfd	%f1, 136(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	stw	%r31, 148(%r3)
	addi	%r3, %r3, 152
	bl	o_param_z.2004
	subi	%r3, %r3, 152
	lwz	%r31, 148(%r3)
	mtlr	%r31
	lfd	%f1, 136(%r3)
	fsub	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	stfd	%f0, 144(%r3)
	mflr	%r31
	stw	%r31, 156(%r3)
	addi	%r3, %r3, 160
	bl	o_param_c.1998
	subi	%r3, %r3, 160
	lwz	%r31, 156(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 156(%r3)
	addi	%r3, %r3, 160
	bl	min_caml_sqrt
	subi	%r3, %r3, 160
	lwz	%r31, 156(%r3)
	mtlr	%r31
	lfd	%f1, 144(%r3)
	fmul	%f0, %f1, %f0
	lfd	%f1, 128(%r3)
	stfd	%f0, 152(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 164(%r3)
	addi	%r3, %r3, 168
	bl	fsqr.1980
	subi	%r3, %r3, 168
	lwz	%r31, 164(%r3)
	mtlr	%r31
	lfd	%f1, 152(%r3)
	stfd	%f0, 160(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 172(%r3)
	addi	%r3, %r3, 176
	bl	fsqr.1980
	subi	%r3, %r3, 176
	lwz	%r31, 172(%r3)
	mtlr	%r31
	lfd	%f1, 160(%r3)
	fadd	%f0, %f1, %f0
	mflr	%r31
	stw	%r31, 172(%r3)
	addi	%r3, %r3, 176
	bl	min_caml_sqrt
	subi	%r3, %r3, 176
	lwz	%r31, 172(%r3)
	mtlr	%r31
	lis	%r31, ha16(l.4807)
	addi	%r31, %r31, lo16(l.4807)
	lfd	%f1, 0(%r31)
	lfd	%f2, 128(%r3)
	stfd	%f0, 168(%r3)
	stfd	%f1, 176(%r3)
	mflr	%r31
	fmr	%f0, %f2
	stw	%r31, 188(%r3)
	addi	%r3, %r3, 192
	bl	min_caml_abs_float
	subi	%r3, %r3, 192
	lwz	%r31, 188(%r3)
	mtlr	%r31
	lfd	%f0, 176(%r3)
	fcmpu	%cr7, %f0, %r2
	bgt	%cr7, ble_else.5879
	lfd	%f0, 128(%r3)
	lfd	%f1, 152(%r3)
	fdiv	%f0, %f1, %f0
	mflr	%r31
	stw	%r31, 188(%r3)
	addi	%r3, %r3, 192
	bl	min_caml_abs_float
	subi	%r3, %r3, 192
	lwz	%r31, 188(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 188(%r3)
	addi	%r3, %r3, 192
	bl	min_caml_atan
	subi	%r3, %r3, 192
	lwz	%r31, 188(%r3)
	mtlr	%r31
	lis	%r31, ha16(l.4809)
	addi	%r31, %r31, lo16(l.4809)
	lfd	%f1, 0(%r31)
	fmul	%f0, %f0, %f1
	b	ble_cont.5880
ble_else.5879:
	lis	%r31, ha16(l.4808)
	addi	%r31, %r31, lo16(l.4808)
	lfd	%f0, 0(%r31)
ble_cont.5880:
	stfd	%f0, 184(%r3)
	mflr	%r31
	stw	%r31, 196(%r3)
	addi	%r3, %r3, 200
	bl	min_caml_floor
	subi	%r3, %r3, 200
	lwz	%r31, 196(%r3)
	mtlr	%r31
	lfd	%f1, 184(%r3)
	fsub	%f0, %f1, %f0
	lwz	%r2, 0(%r3)
	lfd	%f2, 8(%r2)
	lwz	%r2, 4(%r3)
	stfd	%f0, 192(%r3)
	stfd	%f2, 200(%r3)
	mflr	%r31
	stw	%r31, 212(%r3)
	addi	%r3, %r3, 216
	bl	o_param_y.2002
	subi	%r3, %r3, 216
	lwz	%r31, 212(%r3)
	mtlr	%r31
	lfd	%f1, 200(%r3)
	fsub	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	stfd	%f0, 208(%r3)
	mflr	%r31
	stw	%r31, 220(%r3)
	addi	%r3, %r3, 224
	bl	o_param_b.1996
	subi	%r3, %r3, 224
	lwz	%r31, 220(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 220(%r3)
	addi	%r3, %r3, 224
	bl	min_caml_sqrt
	subi	%r3, %r3, 224
	lwz	%r31, 220(%r3)
	mtlr	%r31
	lfd	%f1, 208(%r3)
	fmul	%f0, %f1, %f0
	lis	%r31, ha16(l.4807)
	addi	%r31, %r31, lo16(l.4807)
	lfd	%f1, 0(%r31)
	lfd	%f2, 184(%r3)
	stfd	%f0, 216(%r3)
	stfd	%f1, 224(%r3)
	mflr	%r31
	fmr	%f0, %f2
	stw	%r31, 236(%r3)
	addi	%r3, %r3, 240
	bl	min_caml_abs_float
	subi	%r3, %r3, 240
	lwz	%r31, 236(%r3)
	mtlr	%r31
	lfd	%f0, 224(%r3)
	fcmpu	%cr7, %f0, %r2
	bgt	%cr7, ble_else.5881
	lfd	%f0, 168(%r3)
	lfd	%f1, 216(%r3)
	fdiv	%f0, %f1, %f0
	mflr	%r31
	stw	%r31, 236(%r3)
	addi	%r3, %r3, 240
	bl	min_caml_abs_float
	subi	%r3, %r3, 240
	lwz	%r31, 236(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 236(%r3)
	addi	%r3, %r3, 240
	bl	min_caml_atan
	subi	%r3, %r3, 240
	lwz	%r31, 236(%r3)
	mtlr	%r31
	lis	%r31, ha16(l.4809)
	addi	%r31, %r31, lo16(l.4809)
	lfd	%f1, 0(%r31)
	fmul	%f0, %f0, %f1
	b	ble_cont.5882
ble_else.5881:
	lis	%r31, ha16(l.4808)
	addi	%r31, %r31, lo16(l.4808)
	lfd	%f0, 0(%r31)
ble_cont.5882:
	stfd	%f0, 232(%r3)
	mflr	%r31
	stw	%r31, 244(%r3)
	addi	%r3, %r3, 248
	bl	min_caml_floor
	subi	%r3, %r3, 248
	lwz	%r31, 244(%r3)
	mtlr	%r31
	lfd	%f1, 232(%r3)
	fsub	%f0, %f1, %f0
	lis	%r31, ha16(l.4811)
	addi	%r31, %r31, lo16(l.4811)
	lfd	%f1, 0(%r31)
	lis	%r31, ha16(l.4812)
	addi	%r31, %r31, lo16(l.4812)
	lfd	%f2, 0(%r31)
	lfd	%f3, 192(%r3)
	fsub	%f2, %f2, %f3
	stfd	%f0, 240(%r3)
	stfd	%f1, 248(%r3)
	mflr	%r31
	fmr	%f0, %f2
	stw	%r31, 260(%r3)
	addi	%r3, %r3, 264
	bl	fsqr.1980
	subi	%r3, %r3, 264
	lwz	%r31, 260(%r3)
	mtlr	%r31
	lfd	%f1, 248(%r3)
	fsub	%f0, %f1, %f0
	lis	%r31, ha16(l.4812)
	addi	%r31, %r31, lo16(l.4812)
	lfd	%f1, 0(%r31)
	lfd	%f2, 240(%r3)
	fsub	%f1, %f1, %f2
	stfd	%f0, 256(%r3)
	mflr	%r31
	fmr	%f0, %f1
	stw	%r31, 268(%r3)
	addi	%r3, %r3, 272
	bl	fsqr.1980
	subi	%r3, %r3, 272
	lwz	%r31, 268(%r3)
	mtlr	%r31
	lfd	%f1, 256(%r3)
	fsub	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_texture_color)
	addi	%r2, %r2, lo16(min_caml_texture_color)
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.5883
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	b	ble_cont.5884
ble_else.5883:
	lis	%r31, ha16(l.4813)
	addi	%r31, %r31, lo16(l.4813)
	lfd	%f1, 0(%r31)
	fmul	%f0, %f0, %f1
ble_cont.5884:
	stfd	%f0, 16(%r2)
	blr
beq_else.5878:
	blr
in_prod.2121:
	lfd	%f0, 0(%r2)
	lfd	%f1, 0(%r5)
	fmul	%f0, %f0, %f1
	lfd	%f1, 8(%r2)
	lfd	%f2, 8(%r5)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	lfd	%f1, 16(%r2)
	lfd	%f2, 16(%r5)
	fmul	%f1, %f1, %f2
	fadd	%f0, %f0, %f1
	blr
accumulate_vec_mul.2124:
	lfd	%f1, 0(%r2)
	lfd	%f2, 0(%r5)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	stfd	%f1, 0(%r2)
	lfd	%f1, 8(%r2)
	lfd	%f2, 8(%r5)
	fmul	%f2, %f0, %f2
	fadd	%f1, %f1, %f2
	stfd	%f1, 8(%r2)
	lfd	%f1, 16(%r2)
	lfd	%f2, 16(%r5)
	fmul	%f0, %f0, %f2
	fadd	%f0, %f1, %f0
	stfd	%f0, 16(%r2)
	blr
raytracing.2128:
	lis	%r5, ha16(min_caml_viewpoint)
	addi	%r5, %r5, lo16(min_caml_viewpoint)
	lis	%r6, ha16(min_caml_vscan)
	addi	%r6, %r6, lo16(min_caml_vscan)
	stfd	%f0, 0(%r3)
	stw	%r2, 8(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	or	%r5, %r6, %r5	# mr %r5, %r6
	stw	%r31, 12(%r3)
	addi	%r3, %r3, 16
	bl	tracer.2102
	subi	%r3, %r3, 16
	lwz	%r31, 12(%r3)
	mtlr	%r31
	stw	%r2, 12(%r3)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5888
	lwz	%r5, 8(%r3)
	cmpwi	%cr7, %r5, 0
	bne	%cr7, beq_else.5890
	b	beq_cont.5891
beq_else.5890:
	lis	%r6, ha16(min_caml_vscan)
	addi	%r6, %r6, lo16(min_caml_vscan)
	lis	%r7, ha16(min_caml_light)
	addi	%r7, %r7, lo16(min_caml_light)
	mflr	%r31
	or	%r5, %r7, %r5	# mr %r5, %r7
	or	%r2, %r6, %r2	# mr %r2, %r6
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	in_prod.2121
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	fneg	%f0, %f0
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.5892
	b	ble_cont.5893
ble_else.5892:
	stfd	%f0, 16(%r3)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	fsqr.1980
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	lfd	%f1, 16(%r3)
	fmul	%f0, %f0, %f1
	lfd	%f1, 0(%r3)
	fmul	%f0, %f0, %f1
	lis	%r2, ha16(min_caml_beam)
	addi	%r2, %r2, lo16(min_caml_beam)
	lfd	%f2, 0(%r2)
	fmul	%f0, %f0, %f2
	lis	%r2, ha16(min_caml_rgb)
	addi	%r2, %r2, lo16(min_caml_rgb)
	lis	%r5, ha16(min_caml_rgb)
	addi	%r5, %r5, lo16(min_caml_rgb)
	lfd	%f2, 0(%r5)
	fadd	%f2, %f2, %f0
	stfd	%f2, 0(%r2)
	lis	%r2, ha16(min_caml_rgb)
	addi	%r2, %r2, lo16(min_caml_rgb)
	lis	%r5, ha16(min_caml_rgb)
	addi	%r5, %r5, lo16(min_caml_rgb)
	lfd	%f2, 8(%r5)
	fadd	%f2, %f2, %f0
	stfd	%f2, 8(%r2)
	lis	%r2, ha16(min_caml_rgb)
	addi	%r2, %r2, lo16(min_caml_rgb)
	lis	%r5, ha16(min_caml_rgb)
	addi	%r5, %r5, lo16(min_caml_rgb)
	lfd	%f2, 16(%r5)
	fadd	%f0, %f2, %f0
	stfd	%f0, 16(%r2)
ble_cont.5893:
beq_cont.5891:
	b	beq_cont.5889
beq_else.5888:
beq_cont.5889:
	lwz	%r2, 12(%r3)
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5894
	blr
beq_else.5894:
	lis	%r2, ha16(min_caml_objects)
	addi	%r2, %r2, lo16(min_caml_objects)
	lis	%r5, ha16(min_caml_crashed_object)
	addi	%r5, %r5, lo16(min_caml_crashed_object)
	lwz	%r5, 0(%r5)
	slwi	%r5, %r5, 2
	lwzx	%r2, %r2, %r5
	lis	%r5, ha16(min_caml_crashed_point)
	addi	%r5, %r5, lo16(min_caml_crashed_point)
	stw	%r2, 24(%r3)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	get_nvector.2115
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	li	%r2, 0
	lis	%r5, ha16(min_caml_or_net)
	addi	%r5, %r5, lo16(min_caml_or_net)
	lwz	%r5, 0(%r5)
	lis	%r6, ha16(min_caml_crashed_point)
	addi	%r6, %r6, lo16(min_caml_crashed_point)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	shadow_check_one_or_matrix.2089
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 0
	bne	%cr7, beq_else.5896
	lis	%r2, ha16(min_caml_nvector)
	addi	%r2, %r2, lo16(min_caml_nvector)
	lis	%r5, ha16(min_caml_light)
	addi	%r5, %r5, lo16(min_caml_light)
	mflr	%r31
	stw	%r31, 28(%r3)
	addi	%r3, %r3, 32
	bl	in_prod.2121
	subi	%r3, %r3, 32
	lwz	%r31, 28(%r3)
	mtlr	%r31
	fneg	%f0, %f0
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.5898
	lis	%r31, ha16(l.4856)
	addi	%r31, %r31, lo16(l.4856)
	lfd	%f1, 0(%r31)
	fadd	%f0, %f0, %f1
	b	ble_cont.5899
ble_else.5898:
	lis	%r31, ha16(l.4856)
	addi	%r31, %r31, lo16(l.4856)
	lfd	%f0, 0(%r31)
ble_cont.5899:
	lfd	%f1, 0(%r3)
	fmul	%f0, %f0, %f1
	lwz	%r2, 24(%r3)
	stfd	%f0, 32(%r3)
	mflr	%r31
	stw	%r31, 44(%r3)
	addi	%r3, %r3, 48
	bl	o_diffuse.2006
	subi	%r3, %r3, 48
	lwz	%r31, 44(%r3)
	mtlr	%r31
	lfd	%f1, 32(%r3)
	fmul	%f0, %f1, %f0
	b	beq_cont.5897
beq_else.5896:
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
beq_cont.5897:
	lis	%r5, ha16(min_caml_crashed_point)
	addi	%r5, %r5, lo16(min_caml_crashed_point)
	lwz	%r2, 24(%r3)
	stfd	%f0, 40(%r3)
	mflr	%r31
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	utexture.2118
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_rgb)
	addi	%r2, %r2, lo16(min_caml_rgb)
	lis	%r5, ha16(min_caml_texture_color)
	addi	%r5, %r5, lo16(min_caml_texture_color)
	lfd	%f0, 40(%r3)
	mflr	%r31
	stw	%r31, 52(%r3)
	addi	%r3, %r3, 56
	bl	accumulate_vec_mul.2124
	subi	%r3, %r3, 56
	lwz	%r31, 52(%r3)
	mtlr	%r31
	lwz	%r2, 8(%r3)
	cmpwi	%cr7, %r2, 4
	bgt	%cr7, ble_else.5901
	lis	%r31, ha16(l.4857)
	addi	%r31, %r31, lo16(l.4857)
	lfd	%f0, 0(%r31)
	lfd	%f1, 0(%r3)
	fcmpu	%cr7, %f1, %f0
	bgt	%cr7, ble_else.5902
	blr
ble_else.5902:
	lis	%r31, ha16(l.4858)
	addi	%r31, %r31, lo16(l.4858)
	lfd	%f0, 0(%r31)
	lis	%r5, ha16(min_caml_vscan)
	addi	%r5, %r5, lo16(min_caml_vscan)
	lis	%r6, ha16(min_caml_nvector)
	addi	%r6, %r6, lo16(min_caml_nvector)
	stfd	%f0, 48(%r3)
	mflr	%r31
	or	%r2, %r5, %r2	# mr %r2, %r5
	or	%r5, %r6, %r5	# mr %r5, %r6
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	in_prod.2121
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	lfd	%f1, 48(%r3)
	fmul	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_vscan)
	addi	%r2, %r2, lo16(min_caml_vscan)
	lis	%r5, ha16(min_caml_nvector)
	addi	%r5, %r5, lo16(min_caml_nvector)
	mflr	%r31
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	accumulate_vec_mul.2124
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	lwz	%r2, 24(%r3)
	mflr	%r31
	stw	%r31, 60(%r3)
	addi	%r3, %r3, 64
	bl	o_reflectiontype.1988
	subi	%r3, %r3, 64
	lwz	%r31, 60(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 1
	bne	%cr7, beq_else.5904
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	lwz	%r2, 24(%r3)
	stfd	%f0, 56(%r3)
	mflr	%r31
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	o_hilight.2008
	subi	%r3, %r3, 72
	lwz	%r31, 68(%r3)
	mtlr	%r31
	lfd	%f1, 56(%r3)
	fcmpu	%cr7, %f1, %f0
	bne	%cr7, beq_else.5905
	blr
beq_else.5905:
	lis	%r2, ha16(min_caml_vscan)
	addi	%r2, %r2, lo16(min_caml_vscan)
	lis	%r5, ha16(min_caml_light)
	addi	%r5, %r5, lo16(min_caml_light)
	mflr	%r31
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	in_prod.2121
	subi	%r3, %r3, 72
	lwz	%r31, 68(%r3)
	mtlr	%r31
	fneg	%f0, %f0
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f1, 0(%r31)
	fcmpu	%cr7, %f0, %f1
	bgt	%cr7, ble_else.5907
	blr
ble_else.5907:
	mflr	%r31
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fsqr.1980
	subi	%r3, %r3, 72
	lwz	%r31, 68(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 68(%r3)
	addi	%r3, %r3, 72
	bl	fsqr.1980
	subi	%r3, %r3, 72
	lwz	%r31, 68(%r3)
	mtlr	%r31
	lfd	%f1, 0(%r3)
	fmul	%f0, %f0, %f1
	lfd	%f1, 40(%r3)
	fmul	%f0, %f0, %f1
	lwz	%r2, 24(%r3)
	stfd	%f0, 64(%r3)
	mflr	%r31
	stw	%r31, 76(%r3)
	addi	%r3, %r3, 80
	bl	o_hilight.2008
	subi	%r3, %r3, 80
	lwz	%r31, 76(%r3)
	mtlr	%r31
	lfd	%f1, 64(%r3)
	fmul	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_rgb)
	addi	%r2, %r2, lo16(min_caml_rgb)
	lis	%r5, ha16(min_caml_rgb)
	addi	%r5, %r5, lo16(min_caml_rgb)
	lfd	%f1, 0(%r5)
	fadd	%f1, %f1, %f0
	stfd	%f1, 0(%r2)
	lis	%r2, ha16(min_caml_rgb)
	addi	%r2, %r2, lo16(min_caml_rgb)
	lis	%r5, ha16(min_caml_rgb)
	addi	%r5, %r5, lo16(min_caml_rgb)
	lfd	%f1, 8(%r5)
	fadd	%f1, %f1, %f0
	stfd	%f1, 8(%r2)
	lis	%r2, ha16(min_caml_rgb)
	addi	%r2, %r2, lo16(min_caml_rgb)
	lis	%r5, ha16(min_caml_rgb)
	addi	%r5, %r5, lo16(min_caml_rgb)
	lfd	%f1, 16(%r5)
	fadd	%f0, %f1, %f0
	stfd	%f0, 16(%r2)
	blr
beq_else.5904:
	cmpwi	%cr7, %r2, 2
	bne	%cr7, beq_else.5910
	lis	%r2, ha16(min_caml_viewpoint)
	addi	%r2, %r2, lo16(min_caml_viewpoint)
	lis	%r5, ha16(min_caml_crashed_point)
	addi	%r5, %r5, lo16(min_caml_crashed_point)
	lwz	%r5, 0(%r5)
	stw	%r5, 0(%r2)
	lis	%r2, ha16(min_caml_viewpoint)
	addi	%r2, %r2, lo16(min_caml_viewpoint)
	lis	%r5, ha16(min_caml_crashed_point)
	addi	%r5, %r5, lo16(min_caml_crashed_point)
	lwz	%r5, 4(%r5)
	stw	%r5, 4(%r2)
	lis	%r2, ha16(min_caml_viewpoint)
	addi	%r2, %r2, lo16(min_caml_viewpoint)
	lis	%r5, ha16(min_caml_crashed_point)
	addi	%r5, %r5, lo16(min_caml_crashed_point)
	lwz	%r5, 8(%r5)
	stw	%r5, 8(%r2)
	lis	%r31, ha16(l.4465)
	addi	%r31, %r31, lo16(l.4465)
	lfd	%f0, 0(%r31)
	lwz	%r2, 24(%r3)
	stfd	%f0, 72(%r3)
	mflr	%r31
	stw	%r31, 84(%r3)
	addi	%r3, %r3, 88
	bl	o_diffuse.2006
	subi	%r3, %r3, 88
	lwz	%r31, 84(%r3)
	mtlr	%r31
	lfd	%f1, 72(%r3)
	fsub	%f0, %f1, %f0
	lfd	%f1, 0(%r3)
	fmul	%f0, %f1, %f0
	lwz	%r2, 8(%r3)
	addi	%r2, %r2, 1
	b	raytracing.2128
beq_else.5910:
	blr
ble_else.5901:
	blr
write_rgb.2131:
	lis	%r2, ha16(min_caml_rgb)
	addi	%r2, %r2, lo16(min_caml_rgb)
	lfd	%f0, 0(%r2)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_int_of_float
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 255
	bgt	%cr7, ble_else.5913
	b	ble_cont.5914
ble_else.5913:
	li	%r2, 255
ble_cont.5914:
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_print_byte
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_rgb)
	addi	%r2, %r2, lo16(min_caml_rgb)
	lfd	%f0, 8(%r2)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_int_of_float
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 255
	bgt	%cr7, ble_else.5915
	b	ble_cont.5916
ble_else.5915:
	li	%r2, 255
ble_cont.5916:
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_print_byte
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_rgb)
	addi	%r2, %r2, lo16(min_caml_rgb)
	lfd	%f0, 16(%r2)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_int_of_float
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	cmpwi	%cr7, %r2, 255
	bgt	%cr7, ble_else.5917
	b	ble_cont.5918
ble_else.5917:
	li	%r2, 255
ble_cont.5918:
	b	min_caml_print_byte
write_ppm_header.2133:
	li	%r2, 80
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_print_byte
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	li	%r2, 54
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_print_byte
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	li	%r2, 10
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_print_byte
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_size)
	addi	%r2, %r2, lo16(min_caml_size)
	lwz	%r2, 0(%r2)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_print_int
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	li	%r2, 32
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_print_byte
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_size)
	addi	%r2, %r2, lo16(min_caml_size)
	lwz	%r2, 4(%r2)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_print_int
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	li	%r2, 10
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_print_byte
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	li	%r2, 255
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_print_int
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	li	%r2, 10
	b	min_caml_print_byte
scan_point.2135:
	lis	%r5, ha16(min_caml_size)
	addi	%r5, %r5, lo16(min_caml_size)
	lwz	%r5, 0(%r5)
	cmpw	%cr7, %r5, %r2
	bgt	%cr7, ble_else.5919
	blr
ble_else.5919:
	stw	%r2, 0(%r3)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_float_of_int
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_scan_offset)
	addi	%r2, %r2, lo16(min_caml_scan_offset)
	lfd	%f1, 0(%r2)
	fsub	%f0, %f0, %f1
	lis	%r2, ha16(min_caml_scan_d)
	addi	%r2, %r2, lo16(min_caml_scan_d)
	lfd	%f1, 0(%r2)
	fmul	%f0, %f0, %f1
	lis	%r2, ha16(min_caml_vscan)
	addi	%r2, %r2, lo16(min_caml_vscan)
	lis	%r5, ha16(min_caml_cos_v)
	addi	%r5, %r5, lo16(min_caml_cos_v)
	lfd	%f1, 8(%r5)
	fmul	%f1, %f0, %f1
	lis	%r5, ha16(min_caml_wscan)
	addi	%r5, %r5, lo16(min_caml_wscan)
	lfd	%f2, 0(%r5)
	fadd	%f1, %f1, %f2
	stfd	%f1, 0(%r2)
	lis	%r2, ha16(min_caml_vscan)
	addi	%r2, %r2, lo16(min_caml_vscan)
	lis	%r5, ha16(min_caml_scan_sscany)
	addi	%r5, %r5, lo16(min_caml_scan_sscany)
	lfd	%f1, 0(%r5)
	lis	%r5, ha16(min_caml_cos_v)
	addi	%r5, %r5, lo16(min_caml_cos_v)
	lfd	%f2, 0(%r5)
	fmul	%f1, %f1, %f2
	lis	%r5, ha16(min_caml_vp)
	addi	%r5, %r5, lo16(min_caml_vp)
	lfd	%f2, 8(%r5)
	fsub	%f1, %f1, %f2
	stfd	%f1, 8(%r2)
	lis	%r2, ha16(min_caml_vscan)
	addi	%r2, %r2, lo16(min_caml_vscan)
	fneg	%f1, %f0
	lis	%r5, ha16(min_caml_sin_v)
	addi	%r5, %r5, lo16(min_caml_sin_v)
	lfd	%f2, 8(%r5)
	fmul	%f1, %f1, %f2
	lis	%r5, ha16(min_caml_wscan)
	addi	%r5, %r5, lo16(min_caml_wscan)
	lfd	%f2, 16(%r5)
	fadd	%f1, %f1, %f2
	stfd	%f1, 16(%r2)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	fsqr.1980
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_scan_met1)
	addi	%r2, %r2, lo16(min_caml_scan_met1)
	lfd	%f1, 0(%r2)
	fadd	%f0, %f0, %f1
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_sqrt
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_vscan)
	addi	%r2, %r2, lo16(min_caml_vscan)
	lis	%r5, ha16(min_caml_vscan)
	addi	%r5, %r5, lo16(min_caml_vscan)
	lfd	%f1, 0(%r5)
	fdiv	%f1, %f1, %f0
	stfd	%f1, 0(%r2)
	lis	%r2, ha16(min_caml_vscan)
	addi	%r2, %r2, lo16(min_caml_vscan)
	lis	%r5, ha16(min_caml_vscan)
	addi	%r5, %r5, lo16(min_caml_vscan)
	lfd	%f1, 8(%r5)
	fdiv	%f1, %f1, %f0
	stfd	%f1, 8(%r2)
	lis	%r2, ha16(min_caml_vscan)
	addi	%r2, %r2, lo16(min_caml_vscan)
	lis	%r5, ha16(min_caml_vscan)
	addi	%r5, %r5, lo16(min_caml_vscan)
	lfd	%f1, 16(%r5)
	fdiv	%f0, %f1, %f0
	stfd	%f0, 16(%r2)
	lis	%r2, ha16(min_caml_viewpoint)
	addi	%r2, %r2, lo16(min_caml_viewpoint)
	lis	%r5, ha16(min_caml_view)
	addi	%r5, %r5, lo16(min_caml_view)
	lwz	%r5, 0(%r5)
	stw	%r5, 0(%r2)
	lis	%r2, ha16(min_caml_viewpoint)
	addi	%r2, %r2, lo16(min_caml_viewpoint)
	lis	%r5, ha16(min_caml_view)
	addi	%r5, %r5, lo16(min_caml_view)
	lwz	%r5, 4(%r5)
	stw	%r5, 4(%r2)
	lis	%r2, ha16(min_caml_viewpoint)
	addi	%r2, %r2, lo16(min_caml_viewpoint)
	lis	%r5, ha16(min_caml_view)
	addi	%r5, %r5, lo16(min_caml_view)
	lwz	%r5, 8(%r5)
	stw	%r5, 8(%r2)
	lis	%r2, ha16(min_caml_rgb)
	addi	%r2, %r2, lo16(min_caml_rgb)
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	stfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_rgb)
	addi	%r2, %r2, lo16(min_caml_rgb)
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	stfd	%f0, 8(%r2)
	lis	%r2, ha16(min_caml_rgb)
	addi	%r2, %r2, lo16(min_caml_rgb)
	lis	%r31, ha16(l.4464)
	addi	%r31, %r31, lo16(l.4464)
	lfd	%f0, 0(%r31)
	stfd	%f0, 16(%r2)
	li	%r2, 0
	lis	%r31, ha16(l.4465)
	addi	%r31, %r31, lo16(l.4465)
	lfd	%f0, 0(%r31)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	raytracing.2128
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	write_rgb.2131
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	b	scan_point.2135
scan_line.2137:
	lis	%r5, ha16(min_caml_size)
	addi	%r5, %r5, lo16(min_caml_size)
	lwz	%r5, 0(%r5)
	cmpw	%cr7, %r5, %r2
	bgt	%cr7, ble_else.5921
	blr
ble_else.5921:
	lis	%r5, ha16(min_caml_scan_sscany)
	addi	%r5, %r5, lo16(min_caml_scan_sscany)
	lis	%r6, ha16(min_caml_scan_offset)
	addi	%r6, %r6, lo16(min_caml_scan_offset)
	lfd	%f0, 0(%r6)
	lis	%r31, ha16(l.4465)
	addi	%r31, %r31, lo16(l.4465)
	lfd	%f1, 0(%r31)
	fsub	%f0, %f0, %f1
	stw	%r2, 0(%r3)
	stw	%r5, 4(%r3)
	stfd	%f0, 8(%r3)
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	min_caml_float_of_int
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lfd	%f1, 8(%r3)
	fsub	%f0, %f1, %f0
	lis	%r2, ha16(min_caml_scan_d)
	addi	%r2, %r2, lo16(min_caml_scan_d)
	lfd	%f1, 0(%r2)
	fmul	%f0, %f1, %f0
	lwz	%r2, 4(%r3)
	stfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_scan_met1)
	addi	%r2, %r2, lo16(min_caml_scan_met1)
	lis	%r5, ha16(min_caml_scan_sscany)
	addi	%r5, %r5, lo16(min_caml_scan_sscany)
	lfd	%f0, 0(%r5)
	stw	%r2, 16(%r3)
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	fsqr.1980
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lis	%r31, ha16(l.4910)
	addi	%r31, %r31, lo16(l.4910)
	lfd	%f1, 0(%r31)
	fadd	%f0, %f0, %f1
	lwz	%r2, 16(%r3)
	stfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_scan_sscany)
	addi	%r2, %r2, lo16(min_caml_scan_sscany)
	lfd	%f0, 0(%r2)
	lis	%r2, ha16(min_caml_sin_v)
	addi	%r2, %r2, lo16(min_caml_sin_v)
	lfd	%f1, 0(%r2)
	fmul	%f0, %f0, %f1
	lis	%r2, ha16(min_caml_wscan)
	addi	%r2, %r2, lo16(min_caml_wscan)
	lis	%r5, ha16(min_caml_sin_v)
	addi	%r5, %r5, lo16(min_caml_sin_v)
	lfd	%f1, 8(%r5)
	fmul	%f1, %f0, %f1
	lis	%r5, ha16(min_caml_vp)
	addi	%r5, %r5, lo16(min_caml_vp)
	lfd	%f2, 0(%r5)
	fsub	%f1, %f1, %f2
	stfd	%f1, 0(%r2)
	lis	%r2, ha16(min_caml_wscan)
	addi	%r2, %r2, lo16(min_caml_wscan)
	lis	%r5, ha16(min_caml_cos_v)
	addi	%r5, %r5, lo16(min_caml_cos_v)
	lfd	%f1, 8(%r5)
	fmul	%f0, %f0, %f1
	lis	%r5, ha16(min_caml_vp)
	addi	%r5, %r5, lo16(min_caml_vp)
	lfd	%f1, 16(%r5)
	fsub	%f0, %f0, %f1
	stfd	%f0, 16(%r2)
	li	%r2, 0
	mflr	%r31
	stw	%r31, 20(%r3)
	addi	%r3, %r3, 24
	bl	scan_point.2135
	subi	%r3, %r3, 24
	lwz	%r31, 20(%r3)
	mtlr	%r31
	lwz	%r2, 0(%r3)
	addi	%r2, %r2, 1
	b	scan_line.2137
scan_start.2139:
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	write_ppm_header.2133
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_size)
	addi	%r2, %r2, lo16(min_caml_size)
	lwz	%r2, 0(%r2)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	min_caml_float_of_int
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	lis	%r2, ha16(min_caml_scan_d)
	addi	%r2, %r2, lo16(min_caml_scan_d)
	lis	%r31, ha16(l.4921)
	addi	%r31, %r31, lo16(l.4921)
	lfd	%f1, 0(%r31)
	fdiv	%f1, %f1, %f0
	stfd	%f1, 0(%r2)
	lis	%r2, ha16(min_caml_scan_offset)
	addi	%r2, %r2, lo16(min_caml_scan_offset)
	lis	%r31, ha16(l.4440)
	addi	%r31, %r31, lo16(l.4440)
	lfd	%f1, 0(%r31)
	fdiv	%f0, %f0, %f1
	stfd	%f0, 0(%r2)
	li	%r2, 0
	b	scan_line.2137
rt.2141:
	lis	%r7, ha16(min_caml_size)
	addi	%r7, %r7, lo16(min_caml_size)
	stw	%r2, 0(%r7)
	lis	%r2, ha16(min_caml_size)
	addi	%r2, %r2, lo16(min_caml_size)
	stw	%r5, 4(%r2)
	lis	%r2, ha16(min_caml_dbg)
	addi	%r2, %r2, lo16(min_caml_dbg)
	stw	%r6, 0(%r2)
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	read_parameter.2043
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
	b	scan_start.2139
_min_caml_start: # main entry point
	mflr	%r0
	stmw	%r30, -8(%r1)
	stw	%r0, 8(%r1)
	stwu	%r1, -96(%r1)
#	main program starts
	li	%r2, 768
	li	%r5, 768
	li	%r6, 0
	mflr	%r31
	stw	%r31, 4(%r3)
	addi	%r3, %r3, 8
	bl	rt.2141
	subi	%r3, %r3, 8
	lwz	%r31, 4(%r3)
	mtlr	%r31
#	main program ends
	lwz	%r1, 0(%r1)
	lwz	%r0, 8(%r1)
	mtlr	%r0
	lmw	%r30, -8(%r1)
	blr
