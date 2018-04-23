	.file	"strength_reduction.c"
	.text
	.globl	divido_32
	.type	divido_32, @function
divido_32:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	shrl	$5, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	divido_32, .-divido_32
	.ident	"GCC: (Ubuntu 6.0.1-0ubuntu1) 6.0.0 20160414 (experimental) [trunk revision 234994]"
	.section	.note.GNU-stack,"",@progbits
