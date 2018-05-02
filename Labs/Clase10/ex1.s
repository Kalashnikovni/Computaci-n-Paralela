	.file	"ex1.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	test1
	.type	test1, @function
test1:
.LFB18:
	.cfi_startproc
	leaq	16(%rsi), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	cmpq	%rax, %rdi
	jnb	.L10
	leaq	16(%rdi), %rax
	cmpq	%rax, %rsi
	jb	.L2
.L10:
	testb	$8, %dil
	je	.L9
	movsd	(%rdi), %xmm0
	movl	$65534, %r11d
	movl	$32767, %r9d
	movl	$65535, %ebx
	movl	$1, %eax
	movl	$1, %r10d
	addsd	(%rsi), %xmm0
	movsd	%xmm0, (%rdi)
.L4:
	salq	$3, %rax
	xorl	%edx, %edx
	leaq	(%rdi,%rax), %rcx
	leaq	(%rsi,%rax), %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L5:
	movupd	(%r8,%rax), %xmm0
	addl	$1, %edx
	addpd	(%rcx,%rax), %xmm0
	movaps	%xmm0, (%rcx,%rax)
	addq	$16, %rax
	cmpl	%r9d, %edx
	jb	.L5
	cmpl	%ebx, %r11d
	leal	(%r11,%r10), %eax
	je	.L1
	cltq
	leaq	(%rdi,%rax,8), %rdx
	movsd	(%rdx), %xmm0
	addsd	(%rsi,%rax,8), %xmm0
	movsd	%xmm0, (%rdx)
.L1:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L2:
	.cfi_restore_state
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L7:
	movsd	(%rdi,%rax), %xmm0
	addsd	(%rsi,%rax), %xmm0
	movsd	%xmm0, (%rdi,%rax)
	addq	$8, %rax
	cmpq	$524288, %rax
	jne	.L7
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore_state
	movl	$65536, %r11d
	movl	$32768, %r9d
	movl	$65536, %ebx
	xorl	%eax, %eax
	xorl	%r10d, %r10d
	jmp	.L4
	.cfi_endproc
.LFE18:
	.size	test1, .-test1
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.globl	test2
	.type	test2, @function
test2:
.LFB24:
	.cfi_startproc
	testb	$8, %dil
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	je	.L19
	movsd	(%rdi), %xmm0
	movl	$65534, %r11d
	movl	$32767, %r9d
	movl	$65535, %ebx
	movl	$1, %eax
	movl	$1, %r10d
	addsd	(%rsi), %xmm0
	movsd	%xmm0, (%rdi)
.L16:
	salq	$3, %rax
	xorl	%edx, %edx
	leaq	(%rdi,%rax), %rcx
	leaq	(%rsi,%rax), %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L17:
	movupd	(%r8,%rax), %xmm0
	addl	$1, %edx
	addpd	(%rcx,%rax), %xmm0
	movaps	%xmm0, (%rcx,%rax)
	addq	$16, %rax
	cmpl	%r9d, %edx
	jb	.L17
	cmpl	%ebx, %r11d
	leal	(%r11,%r10), %eax
	je	.L15
	cltq
	leaq	(%rdi,%rax,8), %rdx
	movsd	(%rdx), %xmm0
	addsd	(%rsi,%rax,8), %xmm0
	movsd	%xmm0, (%rdx)
.L15:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L19:
	.cfi_restore_state
	movl	$65536, %r11d
	movl	$32768, %r9d
	movl	$65536, %ebx
	xorl	%eax, %eax
	xorl	%r10d, %r10d
	jmp	.L16
	.cfi_endproc
.LFE24:
	.size	test2, .-test2
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.globl	test3
	.type	test3, @function
test3:
.LFB20:
	.cfi_startproc
	testb	$8, %dil
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	je	.L26
	movsd	(%rdi), %xmm0
	movl	$65534, %r11d
	movl	$32767, %r9d
	movl	$65535, %ebx
	movl	$1, %eax
	movl	$1, %r10d
	addsd	(%rsi), %xmm0
	movsd	%xmm0, (%rdi)
.L23:
	salq	$3, %rax
	xorl	%edx, %edx
	leaq	(%rdi,%rax), %rcx
	leaq	(%rsi,%rax), %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L24:
	movupd	(%r8,%rax), %xmm0
	addl	$1, %edx
	addpd	(%rcx,%rax), %xmm0
	movaps	%xmm0, (%rcx,%rax)
	addq	$16, %rax
	cmpl	%r9d, %edx
	jb	.L24
	cmpl	%ebx, %r11d
	leal	(%r11,%r10), %eax
	je	.L22
	cltq
	leaq	(%rdi,%rax,8), %rdx
	movsd	(%rdx), %xmm0
	addsd	(%rsi,%rax,8), %xmm0
	movsd	%xmm0, (%rdx)
.L22:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	.cfi_restore_state
	movl	$65536, %r11d
	movl	$32768, %r9d
	movl	$65536, %ebx
	xorl	%eax, %eax
	xorl	%r10d, %r10d
	jmp	.L23
	.cfi_endproc
.LFE20:
	.size	test3, .-test3
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.text.unlikely
.LCOLDB3:
	.text
.LHOTB3:
	.p2align 4,,15
	.globl	test4
	.type	test4, @function
test4:
.LFB21:
	.cfi_startproc
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L30:
	movapd	(%rdi,%rax), %xmm0
	addpd	(%rsi,%rax), %xmm0
	movaps	%xmm0, (%rdi,%rax)
	addq	$16, %rax
	cmpq	$524288, %rax
	jne	.L30
	rep ret
	.cfi_endproc
.LFE21:
	.size	test4, .-test4
	.section	.text.unlikely
.LCOLDE3:
	.text
.LHOTE3:
	.section	.text.unlikely
.LCOLDB4:
	.section	.text.startup,"ax",@progbits
.LHOTB4:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB22:
	.cfi_startproc
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE4:
	.section	.text.startup
.LHOTE4:
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
