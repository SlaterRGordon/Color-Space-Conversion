	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"yccToRgb.c"
	.text
	.align	2
	.global	readFileHeader
	.arch armv7-a
	.syntax unified
	.arm
	.fpu neon
	.type	readFileHeader, %function
readFileHeader:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r0
	mov	r0, #56
	bl	malloc
	mov	r4, r0
	mov	r3, r5
	mov	r2, #1
	mov	r1, #2
	bl	fread
	mov	r3, r5
	add	r0, r4, #4
	mov	r2, #1
	mov	r1, #4
	bl	fread
	mov	r3, r5
	add	r0, r4, #8
	mov	r2, #1
	mov	r1, #2
	bl	fread
	mov	r3, r5
	add	r0, r4, #10
	mov	r2, #1
	mov	r1, #2
	bl	fread
	mov	r3, r5
	add	r0, r4, #12
	mov	r2, #1
	mov	r1, #4
	bl	fread
	mov	r3, r5
	add	r0, r4, #16
	mov	r2, #1
	mov	r1, #4
	bl	fread
	mov	r3, r5
	add	r0, r4, #20
	mov	r2, #1
	mov	r1, #4
	bl	fread
	mov	r3, r5
	add	r0, r4, #24
	mov	r2, #1
	mov	r1, #4
	bl	fread
	mov	r3, r5
	add	r0, r4, #28
	mov	r2, #1
	mov	r1, #2
	bl	fread
	mov	r3, r5
	add	r0, r4, #30
	mov	r2, #1
	mov	r1, #2
	bl	fread
	mov	r3, r5
	add	r0, r4, #32
	mov	r2, #1
	mov	r1, #4
	bl	fread
	mov	r3, r5
	add	r0, r4, #36
	mov	r2, #1
	mov	r1, #4
	bl	fread
	mov	r3, r5
	add	r0, r4, #40
	mov	r2, #1
	mov	r1, #4
	bl	fread
	mov	r3, r5
	add	r0, r4, #44
	mov	r2, #1
	mov	r1, #4
	bl	fread
	mov	r3, r5
	add	r0, r4, #48
	mov	r2, #1
	mov	r1, #4
	bl	fread
	mov	r3, r5
	add	r0, r4, #52
	mov	r2, #1
	mov	r1, #4
	bl	fread
	mov	r0, r4
	pop	{r4, r5, r6, pc}
	.size	readFileHeader, .-readFileHeader
	.align	2
	.global	writeFileHeader
	.syntax unified
	.arm
	.fpu neon
	.type	writeFileHeader, %function
writeFileHeader:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r0
	mov	r4, r1
	mov	r3, r0
	mov	r2, #1
	mov	r0, r1
	mov	r1, #2
	bl	fwrite
	mov	r3, r5
	add	r0, r4, #4
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	mov	r3, r5
	add	r0, r4, #8
	mov	r2, #1
	mov	r1, #2
	bl	fwrite
	mov	r3, r5
	add	r0, r4, #10
	mov	r2, #1
	mov	r1, #2
	bl	fwrite
	mov	r3, r5
	add	r0, r4, #12
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	mov	r3, r5
	add	r0, r4, #16
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	mov	r3, r5
	add	r0, r4, #20
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	mov	r3, r5
	add	r0, r4, #24
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	mov	r3, r5
	add	r0, r4, #28
	mov	r2, #1
	mov	r1, #2
	bl	fwrite
	mov	r3, r5
	add	r0, r4, #30
	mov	r2, #1
	mov	r1, #2
	bl	fwrite
	mov	r3, r5
	add	r0, r4, #32
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	mov	r3, r5
	add	r0, r4, #36
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	mov	r3, r5
	add	r0, r4, #40
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	mov	r3, r5
	add	r0, r4, #44
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	mov	r3, r5
	add	r0, r4, #48
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	mov	r3, r5
	add	r0, r4, #52
	pop	{r4, r5, r6, lr}
	mov	r2, #1
	mov	r1, #4
	b	fwrite
	.size	writeFileHeader, .-writeFileHeader
	.align	2
	.global	bilinear_interp
	.syntax unified
	.arm
	.fpu neon
	.type	bilinear_interp, %function
bilinear_interp:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	r2, r2, r0
	sub	r3, r3, r1
	vmov	s15, r2	@ int
	vmov	s14, r3	@ int
	vcvt.f32.s32	s12, s15
	vcvt.f32.s32	s13, s14
	vmov	s15, r0	@ int
	vmov	s14, r1	@ int
	vcvt.f32.s32	s15, s15
	vcvt.f32.s32	s14, s14
	vmla.f32	s15, s12, s1
	vmla.f32	s14, s13, s1
	vsub.f32	s14, s14, s15
	vmla.f32	s15, s14, s0
	vcvt.s32.f32	s15, s15
	vmov	r0, s15	@ int
	bx	lr
	.size	bilinear_interp, .-bilinear_interp
	.align	2
	.global	interpolate_matrix
	.syntax unified
	.arm
	.fpu neon
	.type	interpolate_matrix, %function
interpolate_matrix:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	vpush.64	{d8, d9, d10, d11, d12, d13, d14, d15}
	lsl	ip, r3, #1
	sub	sp, sp, #76
	cmp	ip, #0
	str	ip, [sp, #52]
	ble	.L7
	lsl	ip, r2, #1
	cmp	ip, #0
	ble	.L7
	mov	r9, r0
	mov	r0, r3
	mov	r4, #0
	vmov.f32	s17, #5.0e-1
	mvn	r8, #51
	mov	r6, r9
	str	r3, [sp, #68]
	add	r3, ip, r2, lsl #2
	add	r1, r1, r3
	lsl	r3, r3, #1
	str	r3, [sp, #60]
	sub	r3, ip, r2, lsl #3
	str	r3, [sp, #56]
	add	r3, ip, #1
	str	r3, [sp, #44]
	sub	r3, r0, #1
	str	r3, [sp, #64]
	sub	r3, r2, #1
	str	r2, [sp, #24]
	str	r1, [sp, #48]
	str	r3, [sp, #40]
.L10:
	vmov	s15, r4	@ int
	vcvt.f32.s32	s20, s15
	vmul.f32	s20, s20, s17
	vmov.f32	s0, s20
	bl	floorf
	add	r3, r4, #1
	vmov	s19, r3	@ int
	vcvt.f32.s32	s19, s19
	add	r3, r4, #2
	vmul.f32	s19, s19, s17
	vmov	s18, r3	@ int
	vcvt.s32.f32	s21, s0
	vmov.f32	s0, s19
	bl	floorf
	vcvt.f32.s32	s15, s18
	vcvt.s32.f32	s22, s0
	vmul.f32	s0, s15, s17
	bl	floorf
	vcvt.s32.f32	s15, s0
	vmov	r3, s15	@ int
	ldr	r1, [sp, #68]
	ldr	r2, [sp, #64]
	cmp	r1, r3
	mov	r1, #1
	movle	r3, r2
	ldr	r2, [sp, #24]
	asr	r4, r4, r1
	mul	r0, r2, r4
	mul	r3, r2, r3
	str	r0, [sp, #36]
	str	r3, [sp, #32]
	vmov	r0, s22	@ int
	vmov	r3, s21	@ int
	ldr	r10, [sp, #48]
	mul	r3, r3, r2
	mul	r0, r0, r2
	ldr	r2, [sp, #56]
	vcvt.f32.s32	s14, s21
	add	fp, r2, r10
	vcvt.f32.s32	s15, s22
	mov	r2, r6
	vldr.32	s16, .L43	@ int
	str	r3, [sp, #28]
	mov	r6, fp
	str	r1, [sp]
	mov	fp, r10
	vsub.f32	s20, s20, s14
	vsub.f32	s19, s19, s15
	str	r0, [sp, #12]
	str	r1, [sp, #20]
	vmov	r3, s16	@ int
	vmov.f32	s23, #1.0e+0
	mov	r10, r2
	b	.L26
.L44:
	.align	2
.L43:
	.word	0
.L42:
	cmp	r3, #255
	movge	r3, #255
	ldr	r2, [sp]
	ldr	r1, [sp, #44]
	add	r2, r2, #2
	cmp	r1, r2
	strb	r3, [fp, #5]
	str	r2, [sp]
	add	r6, r6, #6
	add	fp, fp, #6
	beq	.L40
.L24:
	vldr.32	s15, [sp]	@ int
	vcvt.f32.s32	s23, s15
	vmul.f32	s0, s23, s17
	bl	floorf
	ldr	r3, [sp]
	vcvt.s32.f32	s16, s0
	add	r3, r3, #1
	vmov	s15, r3	@ int
	vcvt.f32.s32	s15, s15
	vmul.f32	s0, s15, s17
	bl	floorf
	vcvt.s32.f32	s15, s0
	ldr	r3, [sp, #20]
	vstr.32	s15, [sp, #20]	@ int
.L26:
	vmov	r2, s16	@ int
	vmov	r1, s16	@ int
	ldr	r5, [sp, #28]
	ldr	r4, [sp, #24]
	add	r0, r5, r2
	add	r0, r0, r0, lsl #1
	add	r0, r10, r0, lsl #1
	ldr	r2, [sp, #12]
	ldrb	ip, [r0, #5]	@ zero_extendqisi2
	add	r7, r2, r3
	add	r1, r2, r1
	mov	r2, ip
	add	r1, r1, r1, lsl #1
	add	r9, r5, r3
	add	r1, r10, r1, lsl #1
	str	r1, [sp, #4]
	add	r9, r9, r9, lsl #1
	ldrb	r1, [r1, #5]	@ zero_extendqisi2
	add	r9, r10, r9, lsl #1
	ldrb	lr, [r9, #5]	@ zero_extendqisi2
	str	r1, [sp, #8]
	add	r7, r7, r7, lsl #1
	ldr	r1, [sp, #20]
	add	r7, r10, r7, lsl #1
	ldrb	ip, [r7, #5]	@ zero_extendqisi2
	cmp	r4, r1
	str	r2, [sp, #16]
	sub	r4, r2, lr
	ldr	r2, [sp, #8]
	vmov	s14, r4	@ int
	sub	r4, r2, ip
	vmov	s12, ip	@ int
	vmov	s15, r4	@ int
	ldr	r4, [sp]
	vmov	s13, lr	@ int
	sub	r2, r4, #1
	vmov	s0, r2	@ int
	movgt	r2, r1
	vmov	r1, s16	@ int
	vcvt.f32.s32	s15, s15
	vcvt.f32.s32	s10, s12
	ldr	lr, [sp, #32]
	ldr	r4, [sp, #40]
	add	ip, lr, r1
	movle	r2, r4
	mov	r1, lr
	vcvt.f32.s32	s14, s14
	vcvt.f32.s32	s13, s13
	vmla.f32	s10, s15, s20
	vmov	s15, r3	@ int
	add	r3, lr, r3
	ldr	lr, [sp, #12]
	add	r5, r5, r2
	add	lr, lr, r2
	add	r2, r1, r2
	ldrb	r1, [r9, #4]	@ zero_extendqisi2
	vmla.f32	s13, s14, s20
	vmov	s14, r1	@ int
	ldrb	r1, [r7, #4]	@ zero_extendqisi2
	vcvt.f32.s32	s31, s15
	add	r5, r5, r5, lsl #1
	vmov	s15, r1	@ int
	ldr	r1, [sp, #4]
	add	r5, r10, r5, lsl #1
	ldrb	r0, [r0, #4]	@ zero_extendqisi2
	ldrb	r4, [r1, #4]	@ zero_extendqisi2
	ldrb	r1, [r5, #4]	@ zero_extendqisi2
	ldrb	r7, [r5, #5]	@ zero_extendqisi2
	sub	r1, r1, r0
	vmov	s11, r1	@ int
	add	lr, lr, lr, lsl #1
	ldr	r1, [sp, #16]
	add	lr, r10, lr, lsl #1
	str	r4, [sp, #4]
	sub	r7, r7, r1
	ldrb	r4, [lr, #4]	@ zero_extendqisi2
	ldr	r1, [sp, #4]
	vcvt.f32.s32	s21, s11
	sub	r4, r4, r1
	vmov	s12, r4	@ int
	vmov	r4, s14	@ int
	vmov	s11, r0	@ int
	add	ip, ip, ip, lsl #1
	add	r2, r2, r2, lsl #1
	add	r2, r10, r2, lsl #1
	add	ip, r10, ip, lsl #1
	ldrb	r5, [lr, #5]	@ zero_extendqisi2
	ldrb	r9, [r2, #4]	@ zero_extendqisi2
	ldrb	lr, [r2, #5]	@ zero_extendqisi2
	ldrb	r2, [ip, #4]	@ zero_extendqisi2
	sub	r0, r0, r4
	sub	r9, r9, r2
	vmov	r4, s15	@ int
	vmov	s7, r0	@ int
	vcvt.f32.s32	s9, s11
	vmov	s11, r9	@ int
	ldrb	ip, [ip, #5]	@ zero_extendqisi2
	ldr	r1, [sp, #8]
	vcvt.f32.s32	s2, s11
	sub	r5, r5, r1
	ldr	r1, [sp, #4]
	vmov	s11, r2	@ int
	sub	r1, r1, r4
	vcvt.f32.s32	s29, s7
	vmov	s7, r1	@ int
	vcvt.f32.s32	s4, s11
	vcvt.f32.s32	s28, s7
	vmov	s11, r7	@ int
	vmov	s7, ip	@ int
	add	r3, r3, r3, lsl #1
	sub	lr, lr, ip
	add	r3, r10, r3, lsl #1
	vmov	s27, lr	@ int
	ldrb	lr, [r3, #4]	@ zero_extendqisi2
	vcvt.f32.s32	s3, s11
	sub	r2, r2, lr
	vldr.32	s11, [sp, #16]	@ int
	vcvt.f32.s32	s5, s7
	vmov	s7, r2	@ int
	vcvt.f32.s32	s22, s0
	vcvt.f32.s32	s1, s12
	vcvt.f32.s32	s8, s11
	vcvt.f32.s32	s26, s7
	vmov	s11, r5	@ int
	vmov	s7, lr	@ int
	vldr.32	s12, [sp, #4]	@ int
	vmul.f32	s22, s22, s17
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	vcvt.f32.s32	s30, s11
	sub	r4, ip, r3
	vmov	s24, r4	@ int
	vcvt.f32.s32	s6, s7
	vcvt.f32.s32	s12, s12
	vmov	s7, r3	@ int
	vldr.32	s11, [sp, #8]	@ int
	vcvt.f32.s32	s14, s14
	vcvt.f32.s32	s15, s15
	vsub.f32	s22, s22, s31
	vsub.f32	s25, s10, s13
	vmla.f32	s12, s1, s19
	vmla.f32	s15, s28, s20
	vmla.f32	s9, s21, s19
	vmla.f32	s14, s29, s20
	vcvt.f32.s32	s11, s11
	vcvt.f32.s32	s27, s27
	vcvt.f32.s32	s24, s24
	vcvt.f32.s32	s7, s7
	vmul.f32	s23, s23, s17
	vcvt.f32.s32	s16, s16
	vmla.f32	s6, s26, s20
	vmla.f32	s13, s25, s22
	vsub.f32	s16, s23, s16
	vmla.f32	s8, s3, s19
	vmla.f32	s11, s30, s19
	vmla.f32	s4, s2, s19
	vsub.f32	s1, s12, s9
	vsub.f32	s3, s15, s14
	vmla.f32	s5, s27, s19
	vmla.f32	s7, s24, s20
	vsub.f32	s6, s6, s15
	vcvt.s32.f32	s13, s13
	vsub.f32	s2, s11, s8
	vsub.f32	s4, s4, s12
	vsub.f32	s5, s5, s11
	vsub.f32	s7, s7, s10
	vmla.f32	s9, s1, s22
	vmla.f32	s14, s3, s22
	vmla.f32	s15, s6, s16
	vmov	r2, s0	@ int
	vmov	ip, s13	@ int
	vmla.f32	s12, s4, s16
	vmla.f32	s8, s2, s22
	vmla.f32	s11, s5, s16
	vmla.f32	s10, s7, s16
	vcvt.s32.f32	s13, s9
	vcvt.s32.f32	s14, s14
	vcvt.s32.f32	s15, s15
	ldr	r3, [sp, #36]
	sub	ip, ip, #128
	add	r2, r3, r2, asr #1
	add	r2, r2, r2, lsl #1
	ldrb	r4, [r10, r2, lsl #1]	@ zero_extendqisi2
	add	r3, ip, ip, lsl #1
	sub	r4, r4, #16
	add	r0, r4, r4, lsl #3
	add	r4, r4, r0, lsl #2
	add	r3, r3, r3, lsl #4
	lsl	r4, r4, #1
	add	r3, r4, r3, lsl #1
	add	lr, r3, #32
	asrs	lr, lr, #6
	add	r2, r10, r2, lsl #1
	vmov	r3, s13	@ int
	vcvt.s32.f32	s12, s12
	vcvt.s32.f32	s8, s8
	vcvt.s32.f32	s11, s11
	vmov	r0, s14	@ int
	vmov	r1, s15	@ int
	vcvt.s32.f32	s10, s10
	movmi	lr, #0
	bmi	.L12
	cmp	lr, #255
	movge	lr, #255
	uxtb	lr, lr
.L12:
	sub	r0, r0, #128
	mla	ip, r8, ip, r4
	rsb	r5, r0, r0, lsl #27
	add	r5, r0, r5, lsl #2
	rsb	r5, r0, r5, lsl #3
	add	ip, ip, r5
	add	ip, ip, #32
	asrs	ip, ip, #6
	strb	lr, [r6]
	movmi	ip, #0
	bmi	.L13
	cmp	ip, #255
	movge	ip, #255
	uxtb	ip, ip
.L13:
	add	lr, r0, r0, lsl #7
	add	r4, lr, r4
	add	r4, r4, #32
	asrs	r4, r4, #6
	strb	ip, [r6, #1]
	movmi	r4, #0
	bmi	.L14
	cmp	r4, #255
	movge	r4, #255
	uxtb	r4, r4
.L14:
	vmov	r0, s10	@ int
	strb	r4, [r6, #2]
	ldrb	lr, [r2, #1]	@ zero_extendqisi2
	sub	r0, r0, #128
	sub	lr, lr, #16
	add	ip, lr, lr, lsl #3
	add	lr, lr, ip, lsl #2
	add	ip, r0, r0, lsl #1
	lsl	lr, lr, #1
	add	ip, ip, ip, lsl #4
	add	ip, lr, ip, lsl #1
	add	ip, ip, #32
	asrs	ip, ip, #6
	movmi	ip, #0
	bmi	.L15
	cmp	ip, #255
	movge	ip, #255
	uxtb	ip, ip
.L15:
	sub	r1, r1, #128
	mla	r0, r8, r0, lr
	rsb	r4, r1, r1, lsl #27
	add	r4, r1, r4, lsl #2
	rsb	r4, r1, r4, lsl #3
	add	r0, r0, r4
	add	r0, r0, #32
	asrs	r0, r0, #6
	strb	ip, [r6, #3]
	movmi	r0, #0
	bmi	.L16
	cmp	r0, #255
	movge	r0, #255
	uxtb	r0, r0
.L16:
	add	ip, r1, r1, lsl #7
	add	lr, ip, lr
	add	lr, lr, #32
	asrs	lr, lr, #6
	strb	r0, [r6, #4]
	movmi	lr, #0
	bmi	.L17
	cmp	lr, #255
	movge	lr, #255
	uxtb	lr, lr
.L17:
	vmov	r1, s8	@ int
	strb	lr, [r6, #5]
	ldrb	ip, [r2, #2]	@ zero_extendqisi2
	sub	r1, r1, #128
	sub	ip, ip, #16
	add	r0, ip, ip, lsl #3
	add	ip, ip, r0, lsl #2
	add	r0, r1, r1, lsl #1
	lsl	ip, ip, #1
	add	r0, r0, r0, lsl #4
	add	r0, ip, r0, lsl #1
	add	r0, r0, #32
	asrs	r0, r0, #6
	movmi	r0, #0
	bmi	.L18
	cmp	r0, #255
	movge	r0, #255
	uxtb	r0, r0
.L18:
	sub	r3, r3, #128
	mla	r1, r8, r1, ip
	rsb	lr, r3, r3, lsl #27
	add	lr, r3, lr, lsl #2
	rsb	lr, r3, lr, lsl #3
	add	r1, r1, lr
	add	r1, r1, #32
	asrs	r1, r1, #6
	strb	r0, [fp]
	movmi	r1, #0
	bmi	.L19
	cmp	r1, #255
	movge	r1, #255
	uxtb	r1, r1
.L19:
	add	r0, r3, r3, lsl #7
	add	ip, r0, ip
	add	ip, ip, #32
	asrs	ip, ip, #6
	strb	r1, [fp, #1]
	movmi	ip, #0
	bmi	.L20
	cmp	ip, #255
	movge	ip, #255
	uxtb	ip, ip
.L20:
	vmov	r3, s11	@ int
	strb	ip, [fp, #2]
	ldrb	r0, [r2, #3]	@ zero_extendqisi2
	sub	r2, r3, #128
	sub	r0, r0, #16
	add	r1, r0, r0, lsl #3
	add	r0, r0, r1, lsl #2
	add	r1, r2, r2, lsl #1
	lsl	r0, r0, #1
	add	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #1
	add	r1, r1, #32
	asrs	r1, r1, #6
	movmi	r1, #0
	bmi	.L21
	cmp	r1, #255
	movge	r1, #255
	uxtb	r1, r1
.L21:
	vmov	r3, s12	@ int
	mla	r2, r8, r2, r0
	sub	r3, r3, #128
	rsb	ip, r3, r3, lsl #27
	add	ip, r3, ip, lsl #2
	rsb	ip, r3, ip, lsl #3
	add	r2, r2, ip
	add	r2, r2, #32
	asrs	r2, r2, #6
	strb	r1, [fp, #3]
	movmi	r2, #0
	bmi	.L22
	cmp	r2, #255
	movge	r2, #255
	uxtb	r2, r2
.L22:
	add	r3, r3, r3, lsl #7
	add	r3, r3, r0
	add	r3, r3, #32
	asrs	r3, r3, #6
	strb	r2, [fp, #4]
	bpl	.L42
	ldr	r3, [sp]
	ldr	r2, [sp, #44]
	add	r3, r3, #2
	str	r3, [sp]
	cmp	r3, r2
	mov	r3, #0
	add	r6, r6, #6
	strb	r3, [fp, #5]
	add	fp, fp, #6
	bne	.L24
.L40:
	vmov	r4, s18	@ int
	ldr	r3, [sp, #52]
	ldr	r2, [sp, #60]
	cmp	r3, r4
	ldr	r3, [sp, #48]
	mov	r6, r10
	add	r3, r3, r2
	str	r3, [sp, #48]
	bgt	.L10
.L7:
	add	sp, sp, #76
	@ sp needed
	vldm	sp!, {d8-d15}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	interpolate_matrix, .-interpolate_matrix
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu neon
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #4
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bgt	.L51
	mov	r4, r1
	movw	r1, #:lower16:.LC1
	ldr	r0, [r4, #4]
	movt	r1, #:upper16:.LC1
	bl	fopen
	subs	r8, r0, #0
	beq	.L52
	movw	r1, #:lower16:.LC3
	ldr	r0, [r4, #8]
	movt	r1, #:upper16:.LC3
	bl	fopen
	subs	r9, r0, #0
	beq	.L53
	mov	r0, r8
	bl	readFileHeader
	mov	r4, r0
	ldr	r5, [r0, #24]
	ldr	r7, [r0, #20]
	lsl	r10, r5, #1
	lsl	r6, r7, #1
	mov	r1, r0
	str	r6, [r0, #20]
	str	r10, [r0, #24]
	mov	r0, r9
	bl	writeFileHeader
	mov	r0, r4
	bl	free
	ldr	r1, [r4, #12]
	mov	r2, #0
	mov	r0, r8
	bl	fseek
	mul	r0, r5, r7
	add	r0, r0, r0, lsl #1
	lsl	r0, r0, #1
	bl	malloc
	add	r4, r6, r7
	lsl	r4, r4, #1
	mov	r1, r4
	mov	r2, r5
	mov	r3, r8
	mov	fp, r0
	bl	fread
	cmp	r5, r0
	bne	.L54
	mov	r0, r8
	bl	fclose
	movw	r0, #:lower16:.LC6
	mov	r2, r5
	mov	r1, r7
	movt	r0, #:upper16:.LC6
	bl	printf
	mul	r0, r10, r6
	add	r0, r0, r0, lsl #1
	bl	malloc
	mov	r6, r0
	mov	r3, r5
	mov	r2, r7
	mov	r1, r0
	mov	r0, fp
	bl	interpolate_matrix
	mov	r0, fp
	bl	free
	mov	r3, r9
	mov	r2, r10
	mov	r1, r4
	mov	r0, r6
	bl	fwrite
	mov	r0, r6
	bl	free
	mov	r0, r9
	bl	fclose
	mov	r0, #0
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L51:
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	puts
	mov	r0, #1
	bl	exit
.L54:
	movw	r3, #:lower16:stderr
	movw	r0, #:lower16:.LC5
	movt	r3, #:upper16:stderr
	ldr	r3, [r3]
	movt	r0, #:upper16:.LC5
	mov	r2, #22
	mov	r1, #1
	bl	fwrite
	mov	r0, #1
	bl	exit
.L53:
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	bl	puts
	mov	r0, #1
	bl	exit
.L52:
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	puts
	mov	r0, #1
	bl	exit
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Error wrong arguments\000"
	.space	2
.LC1:
	.ascii	"rb\000"
	.space	1
.LC2:
	.ascii	"Error opening input file\000"
	.space	3
.LC3:
	.ascii	"wb\000"
	.space	1
.LC4:
	.ascii	"Error opening output file\000"
	.space	2
.LC5:
	.ascii	"Failed to read image \012\000"
	.space	1
.LC6:
	.ascii	"width: %d, height: %d\012\000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
