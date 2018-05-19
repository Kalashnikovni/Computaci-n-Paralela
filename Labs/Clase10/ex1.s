	.file	"ex1.c"
	.text
	.p2align 4,,15
	.globl	test1
	.type	test1, @function
test1:
.LFB18:
	.cfi_startproc
	leaq	16(%rsi), %rax
	cmpq	%rax, %rdi
	jnb	.L7
	leaq	16(%rdi), %rax
	cmpq	%rax, %rsi
	jb	.L6
.L7:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	movupd	(%rdi,%rax), %xmm0
	movupd	(%rsi,%rax), %xmm1
	addpd	%xmm1, %xmm0
	movups	%xmm0, (%rdi,%rax)
	addq	$16, %rax
	cmpq	$524288, %rax
	jne	.L4
	rep ret
.L6:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L2:
	movsd	(%rdi,%rax), %xmm0
	addsd	(%rsi,%rax), %xmm0
	movsd	%xmm0, (%rdi,%rax)
	addq	$8, %rax
	cmpq	$524288, %rax
	jne	.L2
	rep ret
	.cfi_endproc
.LFE18:
	.size	test1, .-test1
	.p2align 4,,15
	.globl	test2
	.type	test2, @function
test2:
.LFB19:
	.cfi_startproc
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L12:
	movupd	(%rdi,%rax), %xmm1
	movupd	(%rsi,%rax), %xmm0
	addpd	%xmm1, %xmm0
	movups	%xmm0, (%rdi,%rax)
	addq	$16, %rax
	cmpq	$524288, %rax
	jne	.L12
	rep ret
	.cfi_endproc
.LFE19:
	.size	test2, .-test2
	.p2align 4,,15
	.globl	test3
	.type	test3, @function
test3:
.LFB23:
	.cfi_startproc
	jmp	test2
	.cfi_endproc
.LFE23:
	.size	test3, .-test3
	.p2align 4,,15
	.globl	test4
	.type	test4, @function
test4:
.LFB21:
	.cfi_startproc
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L16:
	movapd	(%rdi,%rax), %xmm0
	addpd	(%rsi,%rax), %xmm0
	movaps	%xmm0, (%rdi,%rax)
	addq	$16, %rax
	cmpq	$524288, %rax
	jne	.L16
	rep ret
	.cfi_endproc
.LFE21:
	.size	test4, .-test4
	.ident	"GCC: (Ubuntu 7.1.0-10ubuntu1~16.04.york0) 7.1.0"
	.section	.note.GNU-stack,"",@progbits
