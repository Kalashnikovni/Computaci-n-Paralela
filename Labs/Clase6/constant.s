	.file	"constant.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$65536, -12(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
.L2:
	movl	-12(%rbp), %eax
	cmpl	%eax, -8(%rbp)
	jb	.L3
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 6.0.1-0ubuntu1) 6.0.0 20160414 (experimental) [trunk revision 234994]"
	.section	.note.GNU-stack,"",@progbits
