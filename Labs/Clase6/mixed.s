	.file	"mixed.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	movl	$a, %edx
	movl	$a+512, %eax
	movl	$a+256, %edi
.L2:
	movl	(%rdx), %ecx
	leal	0(,%rcx,4), %esi
	movl	%esi, (%rdx)
	leal	(%rcx,%rcx,2), %ecx
	addl	%ecx, %ecx
	movl	%ecx, (%rax)
	addq	$4, %rdx
	subq	$4, %rax
	cmpq	%rdi, %rax
	jne	.L2
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.comm	a,512,32
	.ident	"GCC: (Ubuntu 7.1.0-10ubuntu1~16.04.york0) 7.1.0"
	.section	.note.GNU-stack,"",@progbits
