	.syntax unified
	.cpu cortex-m4
	.fpu softvfp
	.thumb

	.data
	.type	deadbeef, %object
	.size	deadbeef, 4
deadbeef:
	.word	-559038737
	.text
	.align	2

	.global	optimize_me
	.thumb_func
optimize_me:
	push	{r4, lr}
	mov		r6, r0
	movs	r5, #0
	mov		r7, #3
	mov		r8, #5
	ldr     r9, =deadbeef       @ Load address of deadbeef
	
.L7:
	adds 	r3, r6, r5, lsl #1		@ r3 = r6 + (r5 << 1)	the first element
	ldrh	r1, [r3]
	smulbb	r1, r1, r7				@ *3
	strh	r1, [r3]				@ necessary？
	
	mov 	r4, #11
	mul 	r10, r4, r1				@ * 11

	adds	r5, r5, #1				@ increase index
	adds 	r11, r6, r5, lsl #1		@ calculate second index
	ldrh	r2, [r11]
	smulbb	r2, r2, r8
	strh	r2, [r11]

	mov 	r4, #33
	mul 	r12, r4, r2				@ * 33
	subs 	r12, r10, r12

	ldr		r0, [r9]
	add 	r0, r0, r12
	str 	r0, [r3]
	adds	r5, r5, #1
	cmp 	r5, #500
	blt 	.L7
	movs	r5, #0
	pop		{r4, pc}
