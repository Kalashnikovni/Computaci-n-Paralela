	.file	"HPC_p59.c"
	.text
	.p2align 4,,15
	.globl	compute
	.type	compute, @function
compute:
.LFB0:
	.cfi_startproc
	cmpl	$1, %r8d
	jle	.L2
	mulss	%xmm1, %xmm0
	leal	-2(%r8), %eax
	leaq	8(,%rax,4), %rdx
	movl	$4, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	movss	(%rsi,%rax), %xmm2
	addss	%xmm0, %xmm2
	movss	%xmm2, (%rdi,%rax)
	addq	$4, %rax
	cmpq	%rax, %rdx
	jne	.L3
.L2:
	rep ret
	.cfi_endproc
.LFE0:
	.size	compute, .-compute
	.ident	"GCC: (Ubuntu 7.1.0-10ubuntu1~16.04.york0) 7.1.0"
	.section	.note.GNU-stack,"",@progbits
