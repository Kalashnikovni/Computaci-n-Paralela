	.file	"HPC_p58.c"
	.text
	.p2align 4,,15
	.globl	compute
	.type	compute, @function
compute:
.LFB0:
	.cfi_startproc
	addl	%esi, %edi
	movl	%edx, %eax
	movl	%edi, %esi
	imull	%edi, %eax
	shrl	$31, %esi
	addl	%edi, %esi
	sarl	%esi
	subl	%esi, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	compute, .-compute
	.ident	"GCC: (Ubuntu 7.1.0-10ubuntu1~16.04.york0) 7.1.0"
	.section	.note.GNU-stack,"",@progbits
