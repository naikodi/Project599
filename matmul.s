	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"matmul.c"
	.text
	.data
	.align	3
	.type	mat_rng, %object
	.size	mat_rng, 16
mat_rng:
	.word	11
	.word	0
	.word	1419247029
	.word	275155412
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	xorshift128plus, %function
xorshift128plus:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, r10, fp}
	add	fp, sp, #28
	sub	sp, sp, #40
	str	r0, [fp, #-48]
	ldr	r3, [fp, #-48]
	ldmia	r3, {r3-r4}
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	ldr	r3, [fp, #-48]
	add	r4, r3, #8
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	ldr	r2, [fp, #-48]
	sub	r4, fp, #44
	ldmia	r4, {r3-r4}
	stm	r2, {r3-r4}
	sub	r4, fp, #36
	ldmia	r4, {r3-r4}
	mov	r1, #0
	mov	r2, #0
	lsl	r2, r4, #23
	orr	r2, r2, r3, lsr #9
	lsl	r1, r3, #23
	sub	r4, fp, #36
	ldmia	r4, {r3-r4}
	eor	r0, r3, r1
	str	r0, [fp, #-68]
	eor	r3, r4, r2
	str	r3, [fp, #-64]
	sub	r4, fp, #68
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	sub	r2, fp, #36
	ldmia	r2, {r1-r2}
	sub	r4, fp, #44
	ldmia	r4, {r3-r4}
	eor	r7, r1, r3
	eor	r8, r2, r4
	sub	r2, fp, #36
	ldmia	r2, {r1-r2}
	mov	r3, #0
	mov	r4, #0
	lsr	r3, r1, #17
	orr	r3, r3, r2, lsl #15
	lsr	r4, r2, #17
	eor	r5, r7, r3
	eor	r6, r8, r4
	sub	r2, fp, #44
	ldmia	r2, {r1-r2}
	mov	r3, #0
	mov	r4, #0
	lsr	r3, r1, #26
	orr	r3, r3, r2, lsl #6
	lsr	r4, r2, #26
	ldr	r2, [fp, #-48]
	add	r2, r2, #8
	eor	r1, r5, r3
	str	r1, [fp, #-60]
	eor	r3, r6, r4
	str	r3, [fp, #-56]
	sub	r4, fp, #60
	ldmia	r4, {r3-r4}
	stm	r2, {r3-r4}
	ldr	r3, [fp, #-48]
	add	r3, r3, #8
	ldmia	r3, {r3-r4}
	sub	r2, fp, #44
	ldmia	r2, {r1-r2}
	adds	r9, r1, r3
	adc	r10, r2, r4
	str	r9, [fp, #-44]
	str	r10, [fp, #-40]
	sub	r4, fp, #44
	ldmia	r4, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp}
	bx	lr
	.size	xorshift128plus, .-xorshift128plus
	.global	__aeabi_ul2d
	.global	__aeabi_dmul
	.align	2
	.global	mat_drand
	.syntax unified
	.arm
	.fpu softvfp
	.type	mat_drand, %function
mat_drand:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	ldr	r0, .L5
	bl	xorshift128plus
	mov	r2, r1
	mov	r1, r0
	mov	r3, #0
	mov	r4, #0
	lsr	r3, r1, #11
	orr	r3, r3, r2, lsl #21
	lsr	r4, r2, #11
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_ul2d
	mov	r2, #0
	ldr	r3, .L5+4
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	mat_rng
	.word	1017118720
	.size	mat_drand, .-mat_drand
	.align	2
	.global	mat_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	mat_init, %function
mat_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mul	r1, r2, r3
	mov	r3, r1
	mov	r1, #4
	mov	r0, r3
	bl	calloc
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-12]
	str	r2, [r3]
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L8
.L9:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #-1073741823
	lsl	r3, r3, #2
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r3, [fp, #-20]
	lsl	r2, r3, #2
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r0, [fp, #-12]
	add	r3, r0, r3
	add	r2, r1, r2
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L8:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L9
	ldr	r3, [fp, #-12]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	mat_init, .-mat_init
	.align	2
	.global	mat_destroy
	.syntax unified
	.arm
	.fpu softvfp
	.type	mat_destroy, %function
mat_destroy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	mov	r0, r3
	bl	free
	ldr	r0, [fp, #-8]
	bl	free
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	mat_destroy, .-mat_destroy
	.global	__aeabi_d2f
	.align	2
	.global	mat_gen_random
	.syntax unified
	.arm
	.fpu softvfp
	.type	mat_gen_random, %function
mat_gen_random:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r1, [fp, #-36]
	ldr	r0, [fp, #-32]
	bl	mat_init
	str	r0, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L13
.L16:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L14
.L15:
	bl	mat_drand
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	add	r4, r2, r3
	bl	__aeabi_d2f
	mov	r3, r0
	str	r3, [r4]	@ float
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L14:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L15
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L13:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L16
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
	.size	mat_gen_random, .-mat_gen_random
	.align	2
	.global	mat_transpose
	.syntax unified
	.arm
	.fpu softvfp
	.type	mat_transpose, %function
mat_transpose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r1, [fp, #-24]
	ldr	r0, [fp, #-28]
	bl	mat_init
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L19
.L22:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L20
.L21:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r1, [fp, #-16]
	add	r3, r1, r3
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r2, [r2]	@ float
	str	r2, [r3]	@ float
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L20:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L21
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L19:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L22
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	mat_transpose, .-mat_transpose
	.global	__aeabi_fmul
	.global	__aeabi_fadd
	.align	2
	.global	sdot_1
	.syntax unified
	.arm
	.fpu softvfp
	.type	sdot_1, %function
sdot_1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-12]	@ float
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L25
.L26:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldr	r0, [r3]	@ float
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-12]	@ float
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-12]	@ float
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L25:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L26
	ldr	r3, [fp, #-12]	@ float
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sdot_1, .-sdot_1
	.align	2
	.global	sdot_8
	.syntax unified
	.arm
	.fpu softvfp
	.type	sdot_8, %function
sdot_8:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #68
	str	r0, [fp, #-64]
	str	r1, [fp, #-68]
	str	r2, [fp, #-72]
	ldr	r3, [fp, #-64]
	bic	r3, r3, #7
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-28]	@ float
	ldr	r3, [fp, #-28]	@ float
	str	r3, [fp, #-32]	@ float
	ldr	r3, [fp, #-32]	@ float
	str	r3, [fp, #-36]	@ float
	ldr	r3, [fp, #-36]	@ float
	str	r3, [fp, #-40]	@ float
	ldr	r3, [fp, #-40]	@ float
	str	r3, [fp, #-44]	@ float
	ldr	r3, [fp, #-44]	@ float
	str	r3, [fp, #-48]	@ float
	ldr	r3, [fp, #-48]	@ float
	str	r3, [fp, #-52]	@ float
	ldr	r3, [fp, #-52]	@ float
	str	r3, [fp, #-56]	@ float
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L29
.L30:
	ldr	r4, [fp, #-56]	@ float
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-68]
	add	r3, r2, r3
	ldr	r0, [r3]	@ float
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-56]	@ float
	ldr	r4, [fp, #-52]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r2, [fp, #-68]
	add	r3, r2, r3
	ldr	r0, [r3]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-52]	@ float
	ldr	r4, [fp, #-48]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-68]
	add	r3, r2, r3
	ldr	r0, [r3]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-48]	@ float
	ldr	r4, [fp, #-44]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #3
	lsl	r3, r3, #2
	ldr	r2, [fp, #-68]
	add	r3, r2, r3
	ldr	r0, [r3]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #3
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-44]	@ float
	ldr	r4, [fp, #-40]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	lsl	r3, r3, #2
	ldr	r2, [fp, #-68]
	add	r3, r2, r3
	ldr	r0, [r3]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-40]	@ float
	ldr	r4, [fp, #-36]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #5
	lsl	r3, r3, #2
	ldr	r2, [fp, #-68]
	add	r3, r2, r3
	ldr	r0, [r3]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #5
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-36]	@ float
	ldr	r4, [fp, #-32]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #6
	lsl	r3, r3, #2
	ldr	r2, [fp, #-68]
	add	r3, r2, r3
	ldr	r0, [r3]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #6
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-32]	@ float
	ldr	r4, [fp, #-28]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #7
	lsl	r3, r3, #2
	ldr	r2, [fp, #-68]
	add	r3, r2, r3
	ldr	r0, [r3]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #7
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-28]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #8
	str	r3, [fp, #-16]
.L29:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L30
	mov	r3, #0
	str	r3, [fp, #-20]	@ float
	b	.L31
.L32:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-68]
	add	r3, r2, r3
	ldr	r0, [r3]	@ float
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-20]	@ float
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-20]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L31:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-64]
	cmp	r2, r3
	blt	.L32
	ldr	r3, [fp, #-56]	@ float
	ldr	r2, [fp, #-52]	@ float
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-48]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-44]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-40]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-36]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-32]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-28]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-20]	@ float
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-20]	@ float
	ldr	r3, [fp, #-20]	@ float
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
	.size	sdot_8, .-sdot_8
	.align	2
	.global	mat_mul0
	.syntax unified
	.arm
	.fpu softvfp
	.type	mat_mul0, %function
mat_mul0:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	ldr	r1, [fp, #-44]
	ldr	r0, [fp, #-32]
	bl	mat_init
	str	r0, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L35
.L40:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L36
.L39:
	mov	r3, #0
	str	r3, [fp, #-20]	@ float
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L37
.L38:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r0, [r3]	@ float
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #4]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-20]	@ float
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-20]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L37:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L38
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [fp, #-20]	@ float
	str	r2, [r3]	@ float
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L36:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	blt	.L39
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L35:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L40
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	mat_mul0, .-mat_mul0
	.align	2
	.global	mat_mul1
	.syntax unified
	.arm
	.fpu softvfp
	.type	mat_mul1, %function
mat_mul1:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #56
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	str	r2, [fp, #-56]
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-60]
	ldr	r0, [fp, #-48]
	bl	mat_init
	str	r0, [fp, #-28]
	ldr	r2, [fp, #4]
	ldr	r1, [fp, #-60]
	ldr	r0, [fp, #-24]
	bl	mat_transpose
	str	r0, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L43
.L48:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L44
.L47:
	mov	r3, #0
	str	r3, [fp, #-20]	@ float
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L45
.L46:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r0, [r3]	@ float
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-44]
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-20]	@ float
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-20]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L45:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	blt	.L46
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r2, [fp, #-20]	@ float
	str	r2, [r3]	@ float
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L44:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-60]
	cmp	r2, r3
	blt	.L47
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L43:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	blt	.L48
	ldr	r0, [fp, #-32]
	bl	mat_destroy
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	mat_mul1, .-mat_mul1
	.align	2
	.global	mat_mul3
	.syntax unified
	.arm
	.fpu softvfp
	.type	mat_mul3, %function
mat_mul3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #44
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-52]
	ldr	r0, [fp, #-40]
	bl	mat_init
	str	r0, [fp, #-28]
	ldr	r2, [fp, #4]
	ldr	r1, [fp, #-52]
	ldr	r0, [fp, #-24]
	bl	mat_transpose
	str	r0, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L51
.L54:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L52
.L53:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r0, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	add	r4, r2, r3
	mov	r2, r0
	ldr	r0, [fp, #-44]
	bl	sdot_8
	mov	r3, r0
	str	r3, [r4]	@ float
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L52:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	blt	.L53
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L51:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	blt	.L54
	ldr	r0, [fp, #-32]
	bl	mat_destroy
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
	.size	mat_mul3, .-mat_mul3
	.align	2
	.global	mat_mul4
	.syntax unified
	.arm
	.fpu softvfp
	.type	mat_mul4, %function
mat_mul4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #44
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-52]
	ldr	r0, [fp, #-40]
	bl	mat_init
	str	r0, [fp, #-28]
	ldr	r2, [fp, #4]
	ldr	r1, [fp, #-52]
	ldr	r0, [fp, #-24]
	bl	mat_transpose
	str	r0, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L57
.L60:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L58
.L59:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r0, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	add	r4, r2, r3
	mov	r2, r0
	ldr	r0, [fp, #-44]
	bl	sdot_1
	mov	r3, r0
	str	r3, [r4]	@ float
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L58:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	blt	.L59
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L57:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	blt	.L60
	ldr	r0, [fp, #-32]
	bl	mat_destroy
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
	.size	mat_mul4, .-mat_mul4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Usage: mat-eval [options]\012\000"
	.align	2
.LC1:
	.ascii	"Options:\012\000"
	.align	2
.LC2:
	.ascii	"  -n INT    size of the square matrix [%d]\012\000"
	.align	2
.LC3:
	.ascii	"  -a INT    matrix multiplication implementation [%"
	.ascii	"d]\012\000"
	.align	2
.LC4:
	.ascii	"            0: naive - no optimization\012\000"
	.align	2
.LC5:
	.ascii	"            1: transposing the second matrix\012\000"
	.align	2
.LC6:
	.ascii	"            3: implicitly vectorized sdot()\012\000"
	.align	2
.LC7:
	.ascii	"            4: no vectorization hints\012\000"
	.align	2
.LC8:
	.ascii	"  -h        this help message\012\000"
	.align	2
.LC9:
	.ascii	"n:a:h\000"
	.align	2
.LC10:
	.ascii	"ERROR: unknown algorithm %d\012\000"
	.global	__aeabi_ui2d
	.global	__aeabi_ddiv
	.align	2
.LC11:
	.ascii	"CPU time: %g\012\000"
	.global	__aeabi_f2d
	.align	2
.LC12:
	.ascii	"Central cell: %g\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #52
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	mov	r3, #1000
	str	r3, [fp, #-16]
	mov	r3, #2
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L63
.L67:
	ldr	r3, [fp, #-28]
	cmp	r3, #110
	bne	.L64
	ldr	r3, .L74
	ldr	r3, [r3]
	mov	r0, r3
	bl	atoi
	str	r0, [fp, #-16]
	b	.L63
.L64:
	ldr	r3, [fp, #-28]
	cmp	r3, #97
	bne	.L65
	ldr	r3, .L74
	ldr	r3, [r3]
	mov	r0, r3
	bl	atoi
	str	r0, [fp, #-20]
	b	.L63
.L65:
	ldr	r3, [fp, #-28]
	cmp	r3, #104
	bne	.L63
	ldr	r3, .L74+4
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	mov	r2, #26
	mov	r1, #1
	ldr	r0, .L74+8
	bl	fwrite
	ldr	r3, .L74+4
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	mov	r2, #9
	mov	r1, #1
	ldr	r0, .L74+12
	bl	fwrite
	ldr	r3, .L74+4
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	ldr	r2, [fp, #-16]
	ldr	r1, .L74+16
	mov	r0, r3
	bl	fprintf
	ldr	r3, .L74+4
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	ldr	r2, [fp, #-20]
	ldr	r1, .L74+20
	mov	r0, r3
	bl	fprintf
	ldr	r3, .L74+4
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	mov	r2, #39
	mov	r1, #1
	ldr	r0, .L74+24
	bl	fwrite
	ldr	r3, .L74+4
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	mov	r2, #45
	mov	r1, #1
	ldr	r0, .L74+28
	bl	fwrite
	ldr	r3, .L74+4
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	mov	r2, #44
	mov	r1, #1
	ldr	r0, .L74+32
	bl	fwrite
	ldr	r3, .L74+4
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	mov	r2, #38
	mov	r1, #1
	ldr	r0, .L74+36
	bl	fwrite
	ldr	r3, .L74+4
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	mov	r2, #30
	mov	r1, #1
	ldr	r0, .L74+40
	bl	fwrite
	mov	r3, #1
	b	.L66
.L63:
	ldr	r2, .L74+44
	ldr	r1, [fp, #-52]
	ldr	r0, [fp, #-48]
	bl	getopt
	str	r0, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bge	.L67
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	mat_gen_random
	str	r0, [fp, #-32]
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	mat_gen_random
	str	r0, [fp, #-36]
	bl	clock
	str	r0, [fp, #-40]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L68
	ldr	r3, [fp, #-36]
	str	r3, [sp]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	mat_mul0
	str	r0, [fp, #-24]
	b	.L69
.L68:
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	bne	.L70
	ldr	r3, [fp, #-36]
	str	r3, [sp]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	mat_mul1
	str	r0, [fp, #-24]
	b	.L69
.L70:
	ldr	r3, [fp, #-20]
	cmp	r3, #3
	bne	.L71
	ldr	r3, [fp, #-36]
	str	r3, [sp]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	mat_mul3
	str	r0, [fp, #-24]
	b	.L69
.L71:
	ldr	r3, [fp, #-20]
	cmp	r3, #4
	bne	.L72
	ldr	r3, [fp, #-36]
	str	r3, [sp]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	mat_mul4
	str	r0, [fp, #-24]
	b	.L69
.L72:
	ldr	r3, .L74+4
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	ldr	r2, [fp, #-20]
	ldr	r1, .L74+48
	mov	r0, r3
	bl	fprintf
	mov	r3, #1
	b	.L66
.L69:
	ldr	r3, .L74+4
	ldr	r3, [r3]
	ldr	r4, [r3, #12]
	bl	clock
	mov	r2, r0
	ldr	r3, [fp, #-40]
	sub	r3, r2, r3
	mov	r0, r3
	bl	__aeabi_ui2d
	mov	r2, #0
	ldr	r3, .L74+52
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	ldr	r1, .L74+56
	mov	r0, r4
	bl	fprintf
	ldr	r3, .L74+4
	ldr	r3, [r3]
	ldr	r4, [r3, #12]
	ldr	r3, [fp, #-16]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	lsr	r1, r3, #31
	add	r3, r1, r3
	asr	r3, r3, #1
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	ldr	r1, .L74+60
	mov	r0, r4
	bl	fprintf
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L73
	ldr	r0, [fp, #-24]
	bl	mat_destroy
.L73:
	ldr	r0, [fp, #-36]
	bl	mat_destroy
	ldr	r0, [fp, #-32]
	bl	mat_destroy
	mov	r3, #0
.L66:
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L75:
	.align	2
.L74:
	.word	optarg
	.word	_impure_ptr
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	1079574528
	.word	.LC11
	.word	.LC12
	.size	main, .-main
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2018-q4-major) 8.2.1 20181213 (release) [gcc-8-branch revision 267074]"
