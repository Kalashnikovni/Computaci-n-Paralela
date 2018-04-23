	.file	"HPC_p60.c"
	.text
	.p2align 4,,15
	.globl	fill
	.type	fill, @function
fill:
.LFB0:
	.cfi_startproc
	cmpl	$1, %esi
	jle	.L2
	leal	4(%rsi), %eax
	leal	(%rsi,%rsi,4), %edx
	addq	$4, %rdi
	.p2align 4,,10
	.p2align 3
.L3:
	pxor	%xmm0, %xmm0
	addq	$4, %rdi
	cvtsi2ss	%eax, %xmm0
	addl	$4, %eax
	movss	%xmm0, -4(%rdi)
	cmpl	%edx, %eax
	jne	.L3
.L2:
	rep ret
	.cfi_endproc
.LFE0:
	.size	fill, .-fill
	.ident	"GCC: (Ubuntu 7.1.0-10ubuntu1~16.04.york0) 7.1.0"
	.section	.note.GNU-stack,"",@progbits
