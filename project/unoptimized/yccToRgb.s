	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"yccToRgb_unopt.c"
	.text
	.align	2
	.global	readFileHeader
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	readFileHeader, %function
readFileHeader:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mov	r0, #56
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	ldr	r3, [fp, #-16]
	mov	r2, #1
	mov	r1, #2
	bl	fread
	ldr	r3, [fp, #-8]
	add	r0, r3, #4
	ldr	r3, [fp, #-16]
	mov	r2, #1
	mov	r1, #4
	bl	fread
	ldr	r3, [fp, #-8]
	add	r0, r3, #8
	ldr	r3, [fp, #-16]
	mov	r2, #1
	mov	r1, #2
	bl	fread
	ldr	r3, [fp, #-8]
	add	r0, r3, #10
	ldr	r3, [fp, #-16]
	mov	r2, #1
	mov	r1, #2
	bl	fread
	ldr	r3, [fp, #-8]
	add	r0, r3, #12
	ldr	r3, [fp, #-16]
	mov	r2, #1
	mov	r1, #4
	bl	fread
	ldr	r3, [fp, #-8]
	add	r0, r3, #16
	ldr	r3, [fp, #-16]
	mov	r2, #1
	mov	r1, #4
	bl	fread
	ldr	r3, [fp, #-8]
	add	r0, r3, #20
	ldr	r3, [fp, #-16]
	mov	r2, #1
	mov	r1, #4
	bl	fread
	ldr	r3, [fp, #-8]
	add	r0, r3, #24
	ldr	r3, [fp, #-16]
	mov	r2, #1
	mov	r1, #4
	bl	fread
	ldr	r3, [fp, #-8]
	add	r0, r3, #28
	ldr	r3, [fp, #-16]
	mov	r2, #1
	mov	r1, #2
	bl	fread
	ldr	r3, [fp, #-8]
	add	r0, r3, #30
	ldr	r3, [fp, #-16]
	mov	r2, #1
	mov	r1, #2
	bl	fread
	ldr	r3, [fp, #-8]
	add	r0, r3, #32
	ldr	r3, [fp, #-16]
	mov	r2, #1
	mov	r1, #4
	bl	fread
	ldr	r3, [fp, #-8]
	add	r0, r3, #36
	ldr	r3, [fp, #-16]
	mov	r2, #1
	mov	r1, #4
	bl	fread
	ldr	r3, [fp, #-8]
	add	r0, r3, #40
	ldr	r3, [fp, #-16]
	mov	r2, #1
	mov	r1, #4
	bl	fread
	ldr	r3, [fp, #-8]
	add	r0, r3, #44
	ldr	r3, [fp, #-16]
	mov	r2, #1
	mov	r1, #4
	bl	fread
	ldr	r3, [fp, #-8]
	add	r0, r3, #48
	ldr	r3, [fp, #-16]
	mov	r2, #1
	mov	r1, #4
	bl	fread
	ldr	r3, [fp, #-8]
	add	r0, r3, #52
	ldr	r3, [fp, #-16]
	mov	r2, #1
	mov	r1, #4
	bl	fread
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	readFileHeader, .-readFileHeader
	.align	2
	.global	writeFileHeader
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	writeFileHeader, %function
writeFileHeader:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r0, [fp, #-12]
	ldr	r3, [fp, #-8]
	mov	r2, #1
	mov	r1, #2
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r0, r3, #4
	ldr	r3, [fp, #-8]
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r0, r3, #8
	ldr	r3, [fp, #-8]
	mov	r2, #1
	mov	r1, #2
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r0, r3, #10
	ldr	r3, [fp, #-8]
	mov	r2, #1
	mov	r1, #2
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r0, r3, #12
	ldr	r3, [fp, #-8]
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r0, r3, #16
	ldr	r3, [fp, #-8]
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r0, r3, #20
	ldr	r3, [fp, #-8]
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r0, r3, #24
	ldr	r3, [fp, #-8]
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r0, r3, #28
	ldr	r3, [fp, #-8]
	mov	r2, #1
	mov	r1, #2
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r0, r3, #30
	ldr	r3, [fp, #-8]
	mov	r2, #1
	mov	r1, #2
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r0, r3, #32
	ldr	r3, [fp, #-8]
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r0, r3, #36
	ldr	r3, [fp, #-8]
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r0, r3, #40
	ldr	r3, [fp, #-8]
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r0, r3, #44
	ldr	r3, [fp, #-8]
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r0, r3, #48
	ldr	r3, [fp, #-8]
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	ldr	r3, [fp, #-12]
	add	r0, r3, #52
	ldr	r3, [fp, #-8]
	mov	r2, #1
	mov	r1, #4
	bl	fwrite
	nop
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	writeFileHeader, .-writeFileHeader
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Error wrong arguments\000"
	.align	2
.LC1:
	.ascii	"rb\000"
	.align	2
.LC2:
	.ascii	"Error opening input file\000"
	.align	2
.LC3:
	.ascii	"wb\000"
	.align	2
.LC4:
	.ascii	"Error opening output file\000"
	.align	2
.LC5:
	.ascii	"Failed to read image \012\000"
	.align	2
.LC6:
	.ascii	"width: %d, height: %d\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #56
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	ldr	r3, [fp, #-56]
	cmp	r3, #4
	ble	.L5
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	puts
	mov	r0, #1
	bl	exit
.L5:
	ldr	r3, [fp, #-60]
	add	r3, r3, #4
	ldr	r3, [r3]
	movw	r1, #:lower16:.LC1
	movt	r1, #:upper16:.LC1
	mov	r0, r3
	bl	fopen
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L6
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	puts
	mov	r0, #1
	bl	exit
.L6:
	ldr	r3, [fp, #-60]
	add	r3, r3, #8
	ldr	r3, [r3]
	movw	r1, #:lower16:.LC3
	movt	r1, #:upper16:.LC3
	mov	r0, r3
	bl	fopen
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L7
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	bl	puts
	mov	r0, #1
	bl	exit
.L7:
	ldr	r0, [fp, #-16]
	bl	readFileHeader
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #20]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #24]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #20]
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #24]
	ldr	r1, [fp, #-24]
	ldr	r0, [fp, #-20]
	bl	writeFileHeader
	ldr	r0, [fp, #-24]
	bl	free
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	mov	r2, #0
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	fseek
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	mul	r3, r2, r3
	mov	r2, r3
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r1, r3
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-36]
	bl	fread
	mov	r2, r0
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	beq	.L8
	movw	r3, #:lower16:stderr
	movt	r3, #:upper16:stderr
	ldr	r3, [r3]
	mov	r2, #22
	mov	r1, #1
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	bl	fwrite
	mov	r0, #1
	bl	exit
.L8:
	ldr	r0, [fp, #-16]
	bl	fclose
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-28]
	movw	r0, #:lower16:.LC6
	movt	r0, #:upper16:.LC6
	bl	printf
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #1
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #1
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-44]
	mul	r3, r2, r3
	mov	r2, r3
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-48]
	mov	r4, #0
	b	.L9
.L12:
	mov	r5, #0
	b	.L10
.L11:
	lsr	r3, r4, #31
	add	r3, r3, r4
	asr	r3, r3, #1
	sxth	r3, r3
	mov	r2, r3
	ldr	r3, [fp, #-28]
	mul	r3, r3, r2
	lsr	r2, r5, #31
	add	r2, r2, r5
	asr	r2, r2, #1
	sxth	r2, r2
	add	r3, r3, r2
	str	r3, [fp, #-52]
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #16
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L14
	vmul.f64	d7, d7, d6
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r3, [fp, #-64]
	uxtb	r3, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d6, s15
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	sub	r3, r3, #128
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d5, .L14+8
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	mov	r2, r4
	ldr	r3, [fp, #-40]
	mul	r3, r3, r2
	mov	r2, r5
	add	r3, r3, r2
	mov	r2, r3
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r2, [fp, #-64]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #16
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L14
	vmul.f64	d7, d7, d6
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r3, [fp, #-64]
	uxtb	r3, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d6, s15
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	sub	r3, r3, #128
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d5, .L14+16
	vmul.f64	d7, d7, d5
	vadd.f64	d6, d6, d7
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	sub	r3, r3, #128
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d5, .L14+24
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	mov	r2, r4
	ldr	r3, [fp, #-40]
	mul	r3, r3, r2
	mov	r2, r5
	add	r3, r3, r2
	mov	r2, r3
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r2, [fp, #-64]
	uxtb	r2, r2
	strb	r2, [r3, #1]
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #16
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L14
	vmul.f64	d7, d7, d6
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r3, [fp, #-64]
	uxtb	r3, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d6, s15
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	sub	r3, r3, #128
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d5, .L14+40
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	mov	r2, r4
	ldr	r3, [fp, #-40]
	mul	r3, r3, r2
	mov	r2, r5
	add	r3, r3, r2
	mov	r2, r3
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r2, [fp, #-64]
	uxtb	r2, r2
	strb	r2, [r3, #2]
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	sub	r3, r3, #16
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L14
	vmul.f64	d7, d7, d6
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r3, [fp, #-64]
	uxtb	r3, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d6, s15
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	sub	r3, r3, #128
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d5, .L14+8
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	mov	r2, r4
	ldr	r3, [fp, #-40]
	mul	r3, r3, r2
	mov	r2, r5
	add	r3, r3, r2
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r2, [fp, #-64]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	sub	r3, r3, #16
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L14
	vmul.f64	d7, d7, d6
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r3, [fp, #-64]
	uxtb	r3, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d6, s15
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	sub	r3, r3, #128
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d5, .L14+16
	vmul.f64	d7, d7, d5
	vadd.f64	d6, d6, d7
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	sub	r3, r3, #128
	vmov	s15, r3	@ int
	b	.L15
.L16:
	.align	3
.L14:
	.word	1992864825
	.word	1072865214
	.word	1271310320
	.word	1073318199
	.word	-1821066134
	.word	-1075182568
	.word	-584115552
	.word	-1076296156
	.word	1992864825
	.word	1072865214
	.word	790273982
	.word	1073751261
.L15:
	vcvt.f64.s32	d7, s15
	vldr.64	d5, .L14+24
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	mov	r2, r4
	ldr	r3, [fp, #-40]
	mul	r3, r3, r2
	mov	r2, r5
	add	r3, r3, r2
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r2, [fp, #-64]
	uxtb	r2, r2
	strb	r2, [r3, #1]
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	sub	r3, r3, #16
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L14+32
	vmul.f64	d7, d7, d6
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r3, [fp, #-64]
	uxtb	r3, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d6, s15
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	sub	r3, r3, #128
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d5, .L14+40
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	mov	r2, r4
	ldr	r3, [fp, #-40]
	mul	r3, r3, r2
	mov	r2, r5
	add	r3, r3, r2
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r2, [fp, #-64]
	uxtb	r2, r2
	strb	r2, [r3, #2]
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	sub	r3, r3, #16
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L14+32
	vmul.f64	d7, d7, d6
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r3, [fp, #-64]
	uxtb	r3, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d6, s15
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	sub	r3, r3, #128
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d5, .L14+8
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	mov	r3, r4
	add	r3, r3, #1
	ldr	r2, [fp, #-40]
	mul	r3, r2, r3
	mov	r2, r5
	add	r3, r3, r2
	mov	r2, r3
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r2, [fp, #-64]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	sub	r3, r3, #16
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L14+32
	vmul.f64	d7, d7, d6
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r3, [fp, #-64]
	uxtb	r3, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d6, s15
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	sub	r3, r3, #128
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d5, .L14+16
	vmul.f64	d7, d7, d5
	vadd.f64	d6, d6, d7
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	sub	r3, r3, #128
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d5, .L14+24
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	mov	r3, r4
	add	r3, r3, #1
	ldr	r2, [fp, #-40]
	mul	r3, r2, r3
	mov	r2, r5
	add	r3, r3, r2
	mov	r2, r3
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r2, [fp, #-64]
	uxtb	r2, r2
	strb	r2, [r3, #1]
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	sub	r3, r3, #16
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L14+32
	vmul.f64	d7, d7, d6
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r3, [fp, #-64]
	uxtb	r3, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d6, s15
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	sub	r3, r3, #128
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d5, .L14+40
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	mov	r3, r4
	add	r3, r3, #1
	ldr	r2, [fp, #-40]
	mul	r3, r2, r3
	mov	r2, r5
	add	r3, r3, r2
	mov	r2, r3
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r2, [fp, #-64]
	uxtb	r2, r2
	strb	r2, [r3, #2]
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	sub	r3, r3, #16
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L17
	vmul.f64	d7, d7, d6
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r3, [fp, #-64]
	uxtb	r3, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d6, s15
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	sub	r3, r3, #128
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d5, .L17+8
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	mov	r3, r4
	add	r3, r3, #1
	ldr	r2, [fp, #-40]
	mul	r3, r2, r3
	mov	r2, r5
	add	r3, r3, r2
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r2, [fp, #-64]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	sub	r3, r3, #16
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L17
	vmul.f64	d7, d7, d6
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r3, [fp, #-64]
	uxtb	r3, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d6, s15
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	sub	r3, r3, #128
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d5, .L17+16
	vmul.f64	d7, d7, d5
	vadd.f64	d6, d6, d7
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	sub	r3, r3, #128
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d5, .L17+24
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	mov	r3, r4
	add	r3, r3, #1
	ldr	r2, [fp, #-40]
	mul	r3, r2, r3
	mov	r2, r5
	add	r3, r3, r2
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r2, [fp, #-64]
	uxtb	r2, r2
	strb	r2, [r3, #1]
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	sub	r3, r3, #16
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L17
	vmul.f64	d7, d7, d6
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r3, [fp, #-64]
	uxtb	r3, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d6, s15
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	sub	r3, r3, #128
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d5, .L17+32
	vmul.f64	d7, d7, d5
	vadd.f64	d7, d6, d7
	mov	r3, r4
	add	r3, r3, #1
	ldr	r2, [fp, #-40]
	mul	r3, r2, r3
	mov	r2, r5
	add	r3, r3, r2
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	vcvt.u32.f64	s15, d7
	vstr.32	s15, [fp, #-64]	@ int
	ldr	r2, [fp, #-64]
	uxtb	r2, r2
	strb	r2, [r3, #2]
	uxth	r3, r5
	add	r3, r3, #2
	uxth	r3, r3
	sxth	r5, r3
.L10:
	mov	r2, r5
	ldr	r3, [fp, #-40]
	cmp	r3, r2
	bgt	.L11
	uxth	r3, r4
	add	r3, r3, #2
	uxth	r3, r3
	sxth	r4, r3
.L9:
	mov	r2, r4
	ldr	r3, [fp, #-44]
	cmp	r3, r2
	bgt	.L12
	ldr	r0, [fp, #-36]
	bl	free
	ldr	r2, [fp, #-40]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	mov	r1, r3
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-48]
	bl	fwrite
	ldr	r0, [fp, #-48]
	bl	free
	ldr	r0, [fp, #-20]
	bl	fclose
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
.L18:
	.align	3
.L17:
	.word	1992864825
	.word	1072865214
	.word	1271310320
	.word	1073318199
	.word	-1821066134
	.word	-1075182568
	.word	-584115552
	.word	-1076296156
	.word	790273982
	.word	1073751261
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
