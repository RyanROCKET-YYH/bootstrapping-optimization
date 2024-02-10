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


.L7:
	mov		r2, #3
	adds 	r3, r6, r5, lsl #1		
	ldrh	r1, [r3]
	smulbb	r2, r1, r2
	strh	r2, [r3]
	adds	r5, r5, #1

	mov		r2, #5
	adds 	r3, r6, r5, lsl #1		
	ldrh	r1, [r3]
	smulbb	r2, r1, r2
	strh	r2, [r3]
	adds	r5, r5, #1

	cmp 	r5, #500
	blt 	.L7
	movs	r5, #0
	ldr     r8, =deadbeef       @ Load address of deadbeef

.L9:
	lsls	r3, r5, #2			@calculate the base offset
	add		r4, r6, r3
	ldrh	r0, [r4]	
	adds	r3, r3, #2
	ldrh	r1, [r6, r3]
	mov 	r3, #11
	mul 	r0, r3, r0
	mov 	r3, #33
	mul		r3, r3, r1
	subs	r0, r0, r3
	ldr     r3, [r8]            @ Load current value of deadbeef
	add     r3, r3, r0   
	str		r3, [r4]
	adds	r5, r5, #1
	cmp		r5, #250
	blt		.L9
	pop		{r4, pc}

