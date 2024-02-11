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
	movs	r4, #498			@ loop index
	mov	r3, #33
	mov	r5, #165
	ldr     r2, =deadbeef       		@ Load address of deadbeef
	
.L7:
	adds 	r1, r0, r4, lsl #1		@ r3 = r6 + (r5 << 1)	the first element
	ldrh	r6, [r1]
	smulbb	r6, r6, r3			@ *3

	ldrh	r7, [r1, #2]
	smulbb	r7, r7, r5

	subs 	r6, r7
	ldr	r7, [r2]
	add 	r7, r6
	str 	r7, [r1]
	
	subs	r4, #2
	cmp 	r4, #0
	bge 	.L7
	pop	{r4, pc}
