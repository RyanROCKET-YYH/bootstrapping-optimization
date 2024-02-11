	.syntax unified
	.cpu cortex-m4
	.fpu softvfp
	.thumb

	.data
	.type	deacbd82, %object
	.size	deacbd82, 4
deacbd82:
	.word	-559104638
	.text
	.align	2

	.global	optimize_me
	.thumb_func
optimize_me:
	push	{r4, lr}
	movs	r4, #498			@ loop index
	mov	r3, #33
	mov	r5, #165
	ldr	r8, =deacbd82
	adds 	r1, r0, r4, lsl #1		@ r3 = r6 + (r5 << 1)	the first element
	ldrh	r6, [r1]
	ldr	r7, [r8]
	str 	r7, [r1]
	subs	r4, #2

.L7:
	adds 	r1, r0, r4, lsl #1		@ r3 = r6 + (r5 << 1)	the first element
	add	r7, #0x108
	str	r7, [r1]
	subs	r4, #2
	cmp 	r4, #0
	bge 	.L7
	pop	{r4, pc}
