	.file	"clear.c"
	.comm	a,536870912,32
	.text
	.globl	clear1
	.type	clear1, @function
clear1:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, (%rax)
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L3
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	clear1, .-clear1
	.globl	clear2
	.type	clear2, @function
clear2:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L5
.L6:
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
	addq	$4, -8(%rbp)
.L5:
	movl	-28(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	cmpq	-8(%rbp), %rax
	ja	.L6
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	clear2, .-clear2
	.globl	clear3
	.type	clear3, @function
clear3:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	clear3, .-clear3
	.section	.rodata
.LC0:
	.string	"clear1: %lf\n"
.LC1:
	.string	"clear2: %lf\n"
.LC2:
	.string	"clear3: %lf\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	call	omp_get_wtime
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	movl	$134217728, %esi
	movl	$a, %edi
	call	clear1
	call	omp_get_wtime
	subsd	-8(%rbp), %xmm0
	movl	$.LC0, %edi
	movl	$1, %eax
	call	printf
	call	omp_get_wtime
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	movl	$134217728, %esi
	movl	$a, %edi
	call	clear2
	call	omp_get_wtime
	subsd	-8(%rbp), %xmm0
	movl	$.LC1, %edi
	movl	$1, %eax
	call	printf
	call	omp_get_wtime
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	movl	$134217728, %esi
	movl	$a, %edi
	call	clear3
	call	omp_get_wtime
	subsd	-8(%rbp), %xmm0
	movl	$.LC2, %edi
	movl	$1, %eax
	call	printf
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
