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
	.file	"rgbToYcc_unopt.c"
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
	.align	2
	.global	rgbToYcc
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	rgbToYcc, %function
rgbToYcc:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mov	r0, #3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, r2
	lsl	r3, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r2, r3, #4096
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	lsl	r3, r3, #7
	add	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r1
	lsl	r1, r3, #2
	add	r3, r3, r1
	add	r3, r2, r3
	add	r3, r3, #128
	asr	r3, r3, #8
	uxtb	r2, r3
	ldr	r3, [fp, #-8]
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	mvn	r3, #37
	mul	r3, r3, r2
	add	r2, r3, #32768
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r1, r3
	mvn	r3, #73
	mul	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	lsl	r3, r3, #3
	sub	r3, r3, r1
	lsl	r3, r3, #4
	add	r3, r2, r3
	add	r3, r3, #128
	asr	r3, r3, #8
	uxtb	r2, r3
	ldr	r3, [fp, #-8]
	strb	r2, [r3, #1]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #4
	add	r2, r3, #32768
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r1, r3
	mvn	r3, #93
	mul	r3, r3, r1
	add	r1, r2, r3
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, r2
	lsl	r3, r3, #28
	sub	r3, r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r1, r3
	add	r3, r3, #128
	asr	r3, r3, #8
	uxtb	r2, r3
	ldr	r3, [fp, #-8]
	strb	r2, [r3, #2]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	rgbToYcc, .-rgbToYcc
	.align	2
	.global	yccToRgb
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	yccToRgb, %function
yccToRgb:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, r2
	strh	r3, [fp, #-30]	@ movhi
	mov	r3, #0
	strh	r3, [fp, #-6]	@ movhi
	b	.L7
.L8:
	ldrsh	r3, [fp, #-6]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #16
	movw	r2, #1191
	mul	r3, r2, r3
	asr	r3, r3, #10
	str	r3, [fp, #-12]
	ldrsh	r3, [fp, #-6]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	sub	r3, r3, #128
	str	r3, [fp, #-16]
	ldrsh	r3, [fp, #-6]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	sub	r3, r3, #128
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	movw	r2, #1836
	mul	r3, r2, r3
	asr	r3, r3, #10
	uxtb	r0, r3
	ldr	r3, [fp, #-12]
	uxtb	r1, r3
	ldrsh	r2, [fp, #-6]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	add	r2, r0, r1
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [fp, #-12]
	uxtb	r0, r3
	ldr	r1, [fp, #-16]
	mov	r3, r1
	lsl	r3, r3, #3
	sub	r3, r3, r1
	lsl	r2, r3, #5
	sub	r2, r2, r3
	add	r3, r2, r1
	asr	r3, r3, #10
	uxtb	r3, r3
	sub	r3, r0, r3
	uxtb	r0, r3
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #4
	add	r3, r3, r2
	lsl	r3, r3, #5
	add	r3, r3, r2
	asr	r3, r3, #10
	uxtb	r1, r3
	ldrsh	r2, [fp, #-6]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	sub	r2, r0, r1
	uxtb	r2, r2
	strb	r2, [r3, #1]
	ldr	r3, [fp, #-16]
	movw	r2, #2162
	mul	r3, r2, r3
	asr	r3, r3, #10
	uxtb	r0, r3
	ldr	r3, [fp, #-12]
	uxtb	r1, r3
	ldrsh	r2, [fp, #-6]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	add	r2, r0, r1
	uxtb	r2, r2
	strb	r2, [r3, #2]
	ldrsh	r3, [fp, #-6]
	uxth	r3, r3
	add	r3, r3, #1
	uxth	r3, r3
	strh	r3, [fp, #-6]	@ movhi
.L7:
	ldrsh	r2, [fp, #-6]
	ldrsh	r3, [fp, #-30]
	cmp	r2, r3
	blt	.L8
	nop
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	yccToRgb, .-yccToRgb
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
	.ascii	"Data offset: %d\012\000"
	.align	2
.LC6:
	.ascii	"Failed to read image \012\000"
	.align	2
.LC7:
	.ascii	"width: %d, height: %d\012\000"
	.align	2
.LC8:
	.ascii	"Writing to file\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #48
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	ldr	r3, [fp, #-48]
	cmp	r3, #4
	ble	.L10
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	puts
	mov	r0, #1
	bl	exit
.L10:
	ldr	r3, [fp, #-52]
	add	r3, r3, #4
	ldr	r3, [r3]
	movw	r1, #:lower16:.LC1
	movt	r1, #:upper16:.LC1
	mov	r0, r3
	bl	fopen
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L11
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	puts
	mov	r0, #1
	bl	exit
.L11:
	ldr	r3, [fp, #-52]
	add	r3, r3, #8
	ldr	r3, [r3]
	movw	r1, #:lower16:.LC3
	movt	r1, #:upper16:.LC3
	mov	r0, r3
	bl	fopen
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L12
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	bl	puts
	mov	r0, #1
	bl	exit
.L12:
	ldr	r0, [fp, #-16]
	bl	readFileHeader
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #20]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #24]
	str	r3, [fp, #-32]
	ldr	r1, [fp, #-24]
	ldr	r0, [fp, #-20]
	bl	writeFileHeader
	ldr	r0, [fp, #-24]
	bl	free
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	mov	r1, r3
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	bl	printf
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
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	mov	r1, r3
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-36]
	bl	fread
	mov	r2, r0
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	beq	.L13
	movw	r3, #:lower16:stderr
	movt	r3, #:upper16:stderr
	ldr	r3, [r3]
	mov	r2, #22
	mov	r1, #1
	movw	r0, #:lower16:.LC6
	movt	r0, #:upper16:.LC6
	bl	fwrite
	mov	r0, #1
	bl	exit
.L13:
	ldr	r0, [fp, #-16]
	bl	fclose
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-28]
	movw	r0, #:lower16:.LC7
	movt	r0, #:upper16:.LC7
	bl	printf
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L14
.L17:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L15
.L16:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-28]
	mul	r2, r2, r3
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	mov	r2, r3
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r0, [fp, #-40]
	bl	rgbToYcc
	str	r0, [fp, #-44]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-28]
	mul	r2, r2, r3
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	mov	r2, r3
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r2, [fp, #-44]
	ldrh	r1, [r2]	@ unaligned
	ldrb	r2, [r2, #2]
	strh	r1, [r3]	@ unaligned
	strb	r2, [r3, #2]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L15:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L16
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L14:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L17
	movw	r0, #:lower16:.LC8
	movt	r0, #:upper16:.LC8
	bl	puts
	ldr	r2, [fp, #-28]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	mov	r1, r3
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-36]
	bl	fwrite
	ldr	r0, [fp, #-36]
	bl	free
	ldr	r0, [fp, #-20]
	bl	fclose
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
