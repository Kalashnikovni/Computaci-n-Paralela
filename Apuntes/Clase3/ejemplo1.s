	.file	"ejemplo1.c"
	.text
	.p2align 4,,15
	.globl	max_dist
	.type	max_dist, @function
max_dist:
.LFB3:
	.cfi_startproc
	testl	%esi, %esi
	je	.L7
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leal	-1(%rsi), %eax
	movq	%rdi, %rbp
	xorpd	%xmm3, %xmm3
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	salq	$4, %rax
	leaq	16(%rdi,%rax), %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.p2align 4,,10
	.p2align 3
.L6:
	movsd	0(%rbp), %xmm1
	movsd	8(%rbp), %xmm2
	mulsd	%xmm1, %xmm1
	mulsd	%xmm2, %xmm2
	addsd	%xmm2, %xmm1
	sqrtsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm0
	jp	.L12
.L3:
	maxsd	%xmm3, %xmm0
	addq	$16, %rbp
	cmpq	%rbx, %rbp
	movapd	%xmm0, %xmm3
	jne	.L6
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	ret
.L7:
	xorpd	%xmm3, %xmm3
	movapd	%xmm3, %xmm0
	ret
.L12:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	movapd	%xmm1, %xmm0
	movsd	%xmm3, 8(%rsp)
	call	sqrt
	movsd	8(%rsp), %xmm3
	jmp	.L3
	.cfi_endproc
.LFE3:
	.size	max_dist, .-max_dist
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
