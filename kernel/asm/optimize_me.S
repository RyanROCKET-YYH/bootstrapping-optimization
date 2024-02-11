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
	movs	r4, #0				@ loop index
	mov	r3, #3
	mov	r5, #5
	ldr     r2, =deadbeef       @ Load address of deadbeef
	
.L7:
	adds 	r1, r0, r4, lsl #1		@ r3 = r6 + (r5 << 1)	the first element
	ldrh	r6, [r1]
	smulbb	r6, r6, r3			@ *3
	mov 	r7, #11
	mul 	r6, r7				@ * 11
	adds	r4, #1				@ increase index
	ldrh	r7, [r1, #2]
	smulbb	r7, r7, r5
	mov 	r8, #33
	mul 	r7, r8				@ * 33
	subs 	r6, r7
	ldr	r7, [r2]
	add 	r7, r6
	str 	r7, [r1]
	adds	r4, #1
	cmp 	r4, #500
	blt 	.L7
	pop	{r4, pc}
