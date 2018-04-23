	.file	"inlining.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	movl	$0, %edx
	movl	$0, %eax
.L2:
	movl	%edx, %ecx
	imull	%edx, %ecx
	addl	%ecx, %eax
	addl	$1, %edx
	cmpl	$131072, %edx
	jne	.L2
	rep ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.1.0-10ubuntu1~16.04.york0) 7.1.0"
	.section	.note.GNU-stack,"",@progbits
