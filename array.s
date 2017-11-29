	.data
	.align 	8
	.comm	min_caml_objects, 240
	.comm	min_caml_size, 8
	.comm	min_caml_dbg, 4
	.comm	min_caml_screen, 24
	.comm	min_caml_vp, 24
	.comm	min_caml_view, 24
	.comm	min_caml_light, 24
	.comm	min_caml_cos_v, 16
	.comm	min_caml_sin_v, 16
	.comm	min_caml_beam, 8
	.comm 	min_caml_and_net, 200
	.comm 	min_caml_or_net, 4
	.comm 	min_caml_temp, 112
	.comm	min_caml_cs_temp, 128
	.comm	min_caml_solver_dist, 8
	.comm	min_caml_vscan, 24
	.comm	min_caml_intsec_rectside, 4
	.comm	min_caml_tmin, 8
	.comm	min_caml_crashed_point, 24
	.comm	min_caml_crashed_object, 4
	.comm	min_caml_end_flag, 4
	.comm	min_caml_viewpoint, 24
	.comm	min_caml_nvector, 24
	.comm	min_caml_rgb, 24
	.comm	min_caml_texture_color, 24
	.comm	min_caml_solver_w_vec, 24
	.comm	min_caml_chkinside_p, 24
	.comm	min_caml_isoutside_q, 24
	.comm	min_caml_nvector_w, 24
	.comm	min_caml_scan_d, 8
	.comm	min_caml_scan_offset, 8
	.comm	min_caml_scan_sscany, 8
	.comm	min_caml_scan_met1, 8
	.comm	min_caml_wscan, 24
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
