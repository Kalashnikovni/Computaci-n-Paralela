	.file	"renaming.c"
	.text
	.p2align 4,,15
	.globl	reuso
	.type	reuso, @function
reuso:
.LFB0:
	.cfi_startproc
	movaps	%xmm0, %xmm3
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm3
	mulss	%xmm2, %xmm1
	addss	%xmm2, %xmm3
	movss	%xmm3, (%rdi)
	movss	%xmm1, (%rsi)
	movss	%xmm0, (%rdx)
	ret
	.cfi_endproc
.LFE0:
	.size	reuso, .-reuso
	.ident	"GCC: (Ubuntu 6.0.1-0ubuntu1) 6.0.0 20160414 (experimental) [trunk revision 234994]"
	.section	.note.GNU-stack,"",@progbits
