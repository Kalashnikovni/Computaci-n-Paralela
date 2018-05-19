	.file	"thrash.c"
	.text
	.p2align 4,,15
	.globl	integral_image
	.type	integral_image, @function
integral_image:
.LFB42:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%eax, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L2:
	movzbl	(%r15,%rax), %edi
	addl	%edi, %edx
	movb	%dl, (%rsi,%rax)
	addq	$1, %rax
	cmpq	$1000, %rax
	jne	.L2
	leaq	1000(%rsi), %r14
	leaq	1001(%rsi), %r12
	leaq	2(%rsi), %rbx
	leaq	1002(%rsi), %rdi
	leaq	3(%rsi), %r10
	leaq	1003(%rsi), %r9
	leaq	1000(%r15), %r8
	leaq	1001(%r15), %r13
	leaq	1002(%r15), %rbp
	leaq	1003(%r15), %r11
	movq	%rsi, %rcx
	addq	$2000000, %r15
	.p2align 4,,10
	.p2align 3
.L3:
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L4:
	movzbl	(%r8,%rax), %esi
	addl	%esi, %edx
	movzbl	(%rcx,%rax), %esi
	addl	%edx, %esi
	movb	%sil, (%r14,%rax)
	movzbl	0(%r13,%rax), %esi
	addl	%esi, %edx
	movzbl	(%rcx,%rax), %esi
	addl	%edx, %esi
	movb	%sil, (%r12,%rax)
	movzbl	0(%rbp,%rax), %esi
	addl	%edx, %esi
	movzbl	(%rbx,%rax), %edx
	addl	%esi, %edx
	movb	%dl, (%rdi,%rax)
	movzbl	(%r11,%rax), %edx
	addl	%esi, %edx
	movzbl	(%r10,%rax), %esi
	addl	%edx, %esi
	movb	%sil, (%r9,%rax)
	addq	$4, %rax
	cmpq	$1000, %rax
	jne	.L4
	addq	$1000, %r8
	addq	$1000, %rcx
	addq	$1000, %r14
	addq	$1000, %r13
	addq	$1000, %r12
	addq	$1000, %rbp
	addq	$1000, %rbx
	addq	$1000, %rdi
	addq	$1000, %r11
	addq	$1000, %r10
	addq	$1000, %r9
	cmpq	%r8, %r15
	jne	.L3
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE42:
	.size	integral_image, .-integral_image
	.p2align 4,,15
	.globl	integral_image5
	.type	integral_image5, @function
integral_image5:
.LFB43:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	xorl	%eax, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L12:
	movzbl	(%rdi,%rax), %ecx
	addl	%ecx, %edx
	movb	%dl, (%rsi,%rax)
	addq	$1, %rax
	cmpq	$1000, %rax
	jne	.L12
	movl	$1000, %r8d
	movl	$274877907, %r9d
	.p2align 4,,10
	.p2align 3
.L13:
	movl	%r8d, %eax
	mull	%r9d
	shrl	$6, %edx
	imull	$1000, %edx, %ecx
	movl	%r8d, %edx
	addl	$4, %r8d
	leal	-1000(%rcx), %r11d
	subl	%ecx, %edx
	leal	(%rdx,%rcx), %r10d
	leal	1(%rdx), %r12d
	leal	(%rdx,%r11), %ebx
	movzbl	(%rdi,%r10), %r13d
	movzbl	(%rsi,%rbx), %ebp
	leal	(%r12,%rcx), %ebx
	addl	%r11d, %r12d
	movl	%r13d, %eax
	addl	%r13d, %ebp
	movb	%bpl, (%rsi,%r10)
	movzbl	(%rdi,%rbx), %r10d
	movl	%r10d, %ebp
	addl	%r13d, %r10d
	addl	%ebp, %eax
	addb	(%rsi,%r12), %al
	leal	2(%rdx), %ebp
	addl	$3, %edx
	movb	%al, (%rsi,%rbx)
	leal	0(%rbp,%rcx), %ebx
	addl	%edx, %ecx
	addl	%r11d, %edx
	movzbl	(%rdi,%rbx), %eax
	addl	%eax, %r10d
	leal	0(%rbp,%r11), %eax
	movzbl	(%rsi,%rax), %ebp
	movzbl	(%rdi,%rcx), %eax
	addl	%r10d, %ebp
	addl	%r10d, %eax
	movb	%bpl, (%rsi,%rbx)
	addb	(%rsi,%rdx), %al
	cmpl	$2000000, %r8d
	movb	%al, (%rsi,%rcx)
	jne	.L13
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE43:
	.size	integral_image5, .-integral_image5
	.ident	"GCC: (Ubuntu 7.1.0-10ubuntu1~16.04.york0) 7.1.0"
	.section	.note.GNU-stack,"",@progbits
