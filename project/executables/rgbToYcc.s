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
	.file	"rgbToYcc.c"
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
	.global	gaussianFilter
	.syntax unified
	.arm
	.fpu neon
	.type	gaussianFilter, %function
gaussianFilter:
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	cmp	r3, #0
	sub	sp, sp, #100
	str	r3, [sp, #92]
	ble	.L7
	lsl	r3, r2, #1
	cmp	r2, #0
	mov	r7, r2
	str	r3, [sp, #80]
	ble	.L7
	mov	r3, #0
	mov	r9, #20
	mov	r8, #32
	mov	r5, r0
	mov	r6, r1
	str	r3, [sp, #32]
	str	r3, [sp, #76]
	ldr	r3, [sp, #92]
	sub	r3, r3, #1
	str	r3, [sp, #84]
	sub	r3, r2, #1
	str	r3, [sp, #88]
.L8:
	mov	fp, #0
	ldr	r3, [sp, #76]
	mov	r10, fp
	mul	r3, r3, r7
	mov	r4, fp
	str	r3, [sp, #36]
	str	r7, [sp, #8]
	b	.L13
.L22:
	lsl	r1, lr, #5
	str	r1, [sp, #64]
	ldr	r1, [sp, #8]
	add	r1, r1, r3
	add	r1, r1, r1, lsl #1
	str	r1, [sp, #4]
	sub	r1, r1, #3
	mov	r7, r1
	str	r1, [sp, #56]
	ldr	r1, [sp, #4]
	add	r1, r1, #3
	str	r1, [sp, #12]
	ldr	r1, [sp, #80]
	add	r3, r1, r3
	add	r3, r3, r3, lsl #1
	add	r1, r3, #3
	str	r1, [sp, #60]
	sub	r1, r2, #3
	add	r1, r5, r1
	str	r1, [sp, #40]
	lsl	r1, ip, #5
	str	r1, [sp, #68]
	add	r1, r2, #3
	add	r1, r5, r1
	str	r1, [sp, #44]
	add	r1, r5, r7
	str	r1, [sp, #48]
	ldr	r7, [sp, #76]
	ldr	r1, [sp, #84]
	cmp	r4, #0
	cmpne	r1, r7
	ldr	r1, [sp, #4]
	add	r7, r5, r1
	ldr	r1, [sp, #12]
	str	r7, [sp, #16]
	add	r7, r5, r1
	sub	r1, r3, #3
	str	r7, [sp, #52]
	add	r7, r5, r1
	add	r1, r3, #3
	add	r1, r5, r1
	str	r7, [sp, #20]
	str	r1, [sp, #28]
	add	r7, r5, r3
	lsl	r1, r0, #5
	str	r7, [sp, #24]
	str	r1, [sp, #72]
	beq	.L10
	ldr	r1, [sp, #88]
	cmp	r1, r10
	beq	.L10
	sub	r1, r2, #3
	ldrb	r0, [r5, r1]	@ zero_extendqisi2
	add	r1, r2, #3
	ldrb	ip, [r5, r1]	@ zero_extendqisi2
	ldr	r1, [sp, #64]
	sub	lr, r3, #3
	smlabb	r0, r9, r0, r1
	ldr	r1, [sp, #56]
	smlabb	r0, r9, ip, r0
	ldrb	ip, [r5, r1]	@ zero_extendqisi2
	ldr	r1, [sp, #4]
	smlabb	r0, r8, ip, r0
	mov	ip, #50
	ldrb	r1, [r5, r1]	@ zero_extendqisi2
	ldrb	lr, [r5, lr]	@ zero_extendqisi2
	smlabb	r0, ip, r1, r0
	ldr	r1, [sp, #12]
	ldr	r7, [sp, #44]
	ldrb	r1, [r5, r1]	@ zero_extendqisi2
	ldr	r10, [sp, #48]
	smlabb	r0, r8, r1, r0
	smlabb	r0, r9, lr, r0
	ldrb	lr, [r5, r3]	@ zero_extendqisi2
	ldr	r3, [sp, #60]
	smlabb	r0, r8, lr, r0
	ldrb	r3, [r5, r3]	@ zero_extendqisi2
	ldr	lr, [sp, #40]
	smlabb	r3, r9, r3, r0
	add	r3, r3, #128
	asr	r3, r3, #8
	strb	r3, [r6, r2]
	ldrb	r3, [lr, #1]	@ zero_extendqisi2
	ldr	r2, [sp, #68]
	ldrb	r1, [r7, #1]	@ zero_extendqisi2
	smlabb	r2, r9, r3, r2
	smlabb	r2, r9, r1, r2
	ldrb	r3, [r10, #1]	@ zero_extendqisi2
	ldr	r1, [sp, #16]
	smlabb	r2, r8, r3, r2
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	mov	r0, ip
	smlabb	r2, ip, r1, r2
	ldr	ip, [sp, #52]
	ldr	r1, [sp, #20]
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	smlabb	r2, r8, r3, r2
	ldr	r3, [sp, #24]
	smlabb	r2, r9, r1, r2
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	ldr	r3, [sp, #28]
	smlabb	r2, r8, r1, r2
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	smlabb	r3, r9, r3, r2
	add	r3, r3, #128
	asr	r3, r3, #8
	strb	r3, [fp, #1]
	ldrb	r3, [lr, #2]	@ zero_extendqisi2
	ldr	lr, [sp, #72]
	ldrb	r2, [r7, #2]	@ zero_extendqisi2
	smlabb	r3, r9, r3, lr
	smlabb	r3, r9, r2, r3
	ldrb	r2, [r10, #2]	@ zero_extendqisi2
	ldr	r1, [sp, #16]
	smlabb	r3, r8, r2, r3
	ldrb	r1, [r1, #2]	@ zero_extendqisi2
	ldr	r2, [sp, #20]
	smlabb	r3, r0, r1, r3
	ldrb	r1, [ip, #2]	@ zero_extendqisi2
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	smlabb	r3, r8, r1, r3
	ldr	r2, [sp, #24]
	smlabb	r3, r9, r0, r3
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	ldr	r2, [sp, #28]
	smlabb	r3, r8, r0, r3
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	smlabb	r3, r9, r2, r3
	add	r3, r3, #128
	asr	r3, r3, #8
	strb	r3, [fp, #2]
.L12:
	add	r3, r4, #1
	sxth	r4, r3
	ldr	r3, [sp, #8]
	mov	r10, r4
	cmp	r4, r3
	bge	.L21
.L13:
	ldr	r3, [sp, #36]
	ldr	r1, [sp, #32]
	add	r3, r3, r10
	add	r2, r3, r3, lsl #1
	cmp	r1, #0
	add	r1, r5, r2
	ldrb	ip, [r1, #1]	@ zero_extendqisi2
	ldrb	r0, [r1, #2]	@ zero_extendqisi2
	add	fp, r6, r2
	ldrb	lr, [r5, r2]	@ zero_extendqisi2
	bne	.L22
.L10:
	strb	lr, [r6, r2]
	strb	ip, [fp, #1]
	strb	r0, [fp, #2]
	b	.L12
.L21:
	mov	r7, r3
	ldr	r3, [sp, #32]
	ldr	r2, [sp, #92]
	add	r3, r3, #1
	sxth	r3, r3
	cmp	r3, r2
	str	r3, [sp, #32]
	str	r3, [sp, #76]
	blt	.L8
.L7:
	add	sp, sp, #100
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	gaussianFilter, .-gaussianFilter
	.align	2
	.global	BiCubicWeightCoeff
	.syntax unified
	.arm
	.fpu neon
	.type	BiCubicWeightCoeff, %function
BiCubicWeightCoeff:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	vmov.f32	s15, #1.0e+0
	vcmpe.f32	s0, s15
	vmrs	APSR_nzcv, FPSCR
	bls	.L33
	vmov.f32	s15, #2.0e+0
	vcmpe.f32	s0, s15
	vmrs	APSR_nzcv, FPSCR
	vmovmi.f32	s13, #5.0e+0
	vmovmi.f32	s14, #8.0e+0
	vsubmi.f32	s13, s13, s0
	vmovmi.f32	s15, #4.0e+0
	vmlsmi.f32	s14, s13, s0
	vnmlsmi.f32	s15, s14, s0
	vmulmi.f32	s0, s15, s1
	vldrpl.32	s0, .L34
	bx	lr
.L33:
	vmov.f32	s13, #2.0e+0
	vmov.f32	s14, #3.0e+0
	vadd.f32	s14, s1, s14
	vadd.f32	s1, s1, s13
	vmls.f32	s14, s1, s0
	vmul.f32	s14, s14, s0
	vmls.f32	s15, s14, s0
	vmov.f32	s0, s15
	bx	lr
.L35:
	.align	2
.L34:
	.word	0
	.size	BiCubicWeightCoeff, .-BiCubicWeightCoeff
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu neon
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	vpush.64	{d8, d9, d10, d11, d12, d13, d14, d15}
	cmp	r0, #4
	sub	sp, sp, #76
	bgt	.L47
	mov	r4, r1
	movw	r1, #:lower16:.LC1
	ldr	r0, [r4, #4]
	movt	r1, #:upper16:.LC1
	bl	fopen
	subs	r6, r0, #0
	beq	.L48
	movw	r1, #:lower16:.LC3
	ldr	r0, [r4, #8]
	movt	r1, #:upper16:.LC3
	bl	fopen
	subs	r9, r0, #0
	beq	.L49
	mov	r0, r6
	bl	readFileHeader
	add	r3, r0, #20
	vld1.32	{d16}, [r3]
	vshr.u32	d16, d16, #1
	mov	r5, r0
	ldr	r7, [r0, #24]
	ldr	r4, [r0, #20]
	mov	r1, r0
	vst1.32	{d16}, [r3]
	mov	r0, r9
	bl	writeFileHeader
	ldr	r1, [r5, #12]
	mov	r2, #0
	mov	r0, r6
	bl	fseek
	mul	r0, r7, r4
	add	r0, r0, r0, lsl #1
	bl	malloc
	mov	r3, r6
	mov	r2, r7
	add	r1, r4, r4, lsl #1
	mov	r5, r0
	bl	fread
	cmp	r7, r0
	bne	.L50
	add	r10, r4, r4, lsr #31
	add	r8, r7, r7, lsr #31
	mov	r0, r6
	asr	r10, r10, #1
	asr	r8, r8, #1
	bl	fclose
	mul	r0, r8, r10
	add	r0, r0, r0, lsl #1
	lsl	r0, r0, #1
	bl	malloc
	cmp	r7, #0
	mov	r6, r0
	ble	.L41
	cmp	r4, #0
	ble	.L41
	mov	ip, #0
	vmov.i8	q9, #128  @ v8hi
	mov	r0, ip
	vmov.i8	d13, #0x26  @ v8qi
	vmov.i8	d7, #0x4a  @ v8qi
	vmov.i8	d6, #0x70  @ v8qi
.L42:
	mov	r2, #0
	vmov.i8	d24, #0x5e  @ v8qi
	mov	r3, r2
	add	r1, ip, ip, lsr #31
	asr	r1, r1, #1
	mul	r1, r4, r1
	mul	r0, r0, r4
	add	r1, r1, r1, lsr #31
	asr	r1, r1, #1
.L43:
	add	r3, r0, r3
	add	lr, r3, r3, lsl #1
	add	r3, r4, r3
	add	r3, r3, r3, lsl #1
	add	lr, r5, lr
	add	r3, r5, r3
	vld3.8	{d10-d12}, [lr]
	vld3.8	{d20-d22}, [r3]
	add	fp, lr, #3
	add	r3, r3, #3
	add	lr, sp, #24
	vst1.64	{d20-d22}, [lr:64]
	vmull.u8	q15, d10, d13
	vmov	d29, d20  @ v8qi
	vld3.8	{d20-d22}, [r3]
	vld3.8	{d2-d4}, [fp]
	vst1.64	{d20-d22}, [sp:64]
	vsub.i16	q11, q9, q15
	vmull.u8	q7, d2, d13
	vmull.u8	q13, d2, d6
	vmull.u8	q10, d10, d6
	vldr	d25, [sp]
	vmlsl.u8	q11, d11, d7
	vmov	d30, d11  @ v8qi
	vmull.u8	q0, d29, d13
	vsub.i16	q7, q9, q7
	vadd.i16	q13, q13, q9
	vadd.i16	q10, q10, q9
	vmov	d17, d25  @ v8qi
	vmlal.u8	q11, d12, d6
	vmull.u8	q4, d29, d6
	vmlsl.u8	q10, d30, d24
	vmov	d28, d10  @ v8qi
	vmlsl.u8	q7, d3, d7
	vsub.i16	q5, q9, q0
	vmlsl.u8	q13, d3, d24
	vmull.u8	q0, d25, d13
	vmov.i8	d25, #0x12  @ v8qi
	vldr	d31, [sp, #32]
	vshr.u16	q11, q11, #8
	vmull.u8	q1, d17, d6
	vadd.i16	q4, q4, q9
	vmlal.u8	q7, d4, d6
	vmlsl.u8	q13, d4, d25
	vmov	q2, q10  @ v8hi
	vldr	d17, [sp, #40]
	vldr	d21, [sp, #8]
	vstr	d22, [sp, #24]
	vstr	d23, [sp, #32]
	vmov	d16, d12  @ v8qi
	vmov.i8	d23, #0x19  @ v8qi
	vmlsl.u8	q5, d31, d7
	vsub.i16	q0, q9, q0
	vmlsl.u8	q4, d31, d24
	vadd.i16	q1, q1, q9
	vmlsl.u8	q2, d12, d25
	vmlal.u8	q5, d17, d6
	vmlsl.u8	q0, d21, d7
	vmlsl.u8	q4, d17, d25
	vmlsl.u8	q1, d21, d24
	vshr.u16	q7, q7, #8
	vmull.u8	q10, d17, d23
	vmull.u8	q8, d16, d23
	vldr	d22, [sp, #24]
	vldr	d23, [sp, #32]
	vldr	d12, [sp, #16]
	vshr.u16	q13, q13, #8
	vshr.u16	q2, q2, #8
	vadd.i16	q7, q7, q11
	vmov.i8	d22, #0x81  @ v8qi
	vshr.u16	q5, q5, #8
	vmlal.u8	q0, d12, d6
	vadd.i16	q13, q13, q2
	vshr.u16	q4, q4, #8
	vmlsl.u8	q1, d12, d25
	vmlal.u8	q10, d31, d22
	vmlal.u8	q8, d30, d22
	vmov.i8	d22, #0x42  @ v8qi
	vadd.i16	q7, q7, q5
	vshr.u16	q0, q0, #8
	vadd.i16	q13, q13, q4
	vshr.u16	q1, q1, #8
	vmlal.u8	q10, d29, d22
	vmlal.u8	q8, d28, d22
	vmov.i16	q11, #4096  @ v8hi
	vadd.i16	q7, q7, q0
	vadd.i16	q13, q13, q1
	vadd.i16	q10, q11, q10
	vadd.i16	q8, q11, q8
	vshrn.i16	d14, q7, #2
	vshrn.i16	d26, q13, #2
	vshrn.i16	d20, q10, #8
	vshrn.i16	d16, q8, #8
	add	lr, sp, #68
	vst1.8	{d14[0]}, [lr]
	add	lr, sp, #69
	vst1.8	{d26[0]}, [lr]
	add	lr, sp, #66
	vst1.8	{d20[0]}, [lr]
	add	lr, sp, #67
	vst1.8	{d20[1]}, [lr]
	add	lr, sp, #64
	vst1.8	{d16[0]}, [lr]
	add	r3, r2, r2, lsr #31
	add	lr, sp, #65
	vst1.8	{d16[1]}, [lr]
	add	r3, r1, r3, asr #1
	add	lr, sp, #70
	vst1.8	{d16[2]}, [lr]
	add	r3, r3, r3, lsl #1
	add	lr, sp, #71
	vst1.8	{d16[3]}, [lr]
	add	r3, r6, r3, lsl #1
	vldr	d17, [sp, #64]
	mov	lr, r3
	add	fp, sp, #58
	vst1.8	{d14[2]}, [fp]
	add	fp, sp, #59
	vst1.8	{d26[2]}, [fp]
	add	fp, sp, #56
	vst1.8	{d20[2]}, [fp]
	add	fp, sp, #57
	vst1.8	{d20[3]}, [fp]
	add	fp, sp, #62
	vst1.8	{d20[4]}, [fp]
	add	fp, sp, #63
	vst1.8	{d20[5]}, [fp]
	add	fp, sp, #60
	vst1.8	{d16[4]}, [fp]
	add	fp, sp, #61
	vst1.8	{d16[5]}, [fp]
	vst1.8	{d17}, [lr]!
	vldr	d17, [sp, #56]
	add	fp, sp, #48
	vst1.8	{d14[4]}, [fp]
	add	fp, sp, #54
	vst1.8	{d14[6]}, [fp]
	add	fp, sp, #49
	vst1.8	{d26[4]}, [fp]
	add	fp, sp, #55
	vst1.8	{d26[6]}, [fp]
	add	fp, sp, #52
	vst1.8	{d20[6]}, [fp]
	add	fp, sp, #53
	vst1.8	{d20[7]}, [fp]
	add	fp, sp, #50
	vst1.8	{d16[6]}, [fp]
	add	fp, sp, #51
	vst1.8	{d16[7]}, [fp]
	vst1.8	{d17}, [lr]
	vldr	d16, [sp, #48]
	add	r2, r2, #8
	sxth	r2, r2
	add	r3, r3, #16
	cmp	r2, r4
	vst1.8	{d16}, [r3]
	mov	r3, r2
	blt	.L43
	add	ip, ip, #2
	sxth	ip, ip
	cmp	ip, r7
	mov	r0, ip
	blt	.L42
.L41:
	mov	r0, r5
	add	r10, r10, r10, lsl #1
	bl	free
	lsl	r1, r10, #1
	mov	r2, r8
	mov	r3, r9
	mov	r0, r6
	bl	fwrite
	mov	r0, r6
	bl	free
	mov	r0, r9
	bl	fclose
	mov	r0, #0
	add	sp, sp, #76
	@ sp needed
	vldm	sp!, {d8-d15}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L47:
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	puts
	mov	r0, #1
	bl	exit
.L50:
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
.L49:
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	bl	puts
	mov	r0, #1
	bl	exit
.L48:
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
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
