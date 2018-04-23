	.file	"type_conversions.c"
	.text
	.globl	conv1
	.type	conv1, @function
conv1:
.LFB0:
	.cfi_startproc
	mulss	.LC0(%rip), %xmm0
	ret
	.cfi_endproc
.LFE0:
	.size	conv1, .-conv1
	.globl	conv2
	.type	conv2, @function
conv2:
.LFB1:
	.cfi_startproc
	mulss	.LC0(%rip), %xmm0
	ret
	.cfi_endproc
.LFE1:
	.size	conv2, .-conv2
	.globl	conv3
	.type	conv3, @function
conv3:
.LFB2:
	.cfi_startproc
	mulss	.LC0(%rip), %xmm0
	ret
	.cfi_endproc
.LFE2:
	.size	conv3, .-conv3
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1077936128
	.ident	"GCC: (Ubuntu 7.1.0-10ubuntu1~16.04.york0) 7.1.0"
	.section	.note.GNU-stack,"",@progbits
