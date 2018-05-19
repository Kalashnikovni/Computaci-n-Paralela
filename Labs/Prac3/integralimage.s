	.file	"integralimage.c"
	.text
	.p2align 4,,15
	.type	stbiw__encode_png_line, @function
stbiw__encode_png_line:
.LFB743:
	.cfi_startproc
	testl	%r8d, %r8d
	movl	$firstmap.8529, %r10d
	movl	$mapping.8528, %eax
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	cmove	%r10, %rax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movslq	56(%rsp), %r10
	movq	64(%rsp), %r14
	movl	(%rax,%r10,4), %r10d
	movl	stbi__flip_vertically_on_write(%rip), %eax
	testl	%eax, %eax
	je	.L3
	leal	-1(%rcx), %eax
	subl	%r8d, %eax
	imull	%esi, %eax
	negl	%esi
	cltq
	addq	%rax, %rdi
.L27:
	testl	%r9d, %r9d
	jle	.L4
	leal	-1(%r9), %ecx
	xorl	%eax, %eax
	movl	%r10d, %r8d
	addq	$1, %rcx
	.p2align 4,,10
	.p2align 3
.L14:
	cmpl	$6, %r10d
	ja	.L5
	jmp	*.L7(,%r8,8)
	.section	.rodata
	.align 8
	.align 4
.L7:
	.quad	.L13
	.quad	.L13
	.quad	.L11
	.quad	.L10
	.quad	.L11
	.quad	.L13
	.quad	.L13
	.text
	.p2align 4,,10
	.p2align 3
.L13:
	movzbl	(%rdi,%rax), %r11d
	movb	%r11b, (%r14,%rax)
.L5:
	addq	$1, %rax
	cmpq	%rcx, %rax
	jne	.L14
.L4:
	imull	%r9d, %edx
	cmpl	%edx, %r9d
	jge	.L1
	subl	%r9d, %edx
	movslq	%r9d, %rax
	leal	(%rsi,%r9), %ebx
	leal	-1(%rdx), %ecx
	leaq	1(%rax), %rdx
	movl	%r10d, %r15d
	movl	%ebx, -8(%rsp)
	leaq	(%rcx,%rdx), %rbp
	.p2align 4,,10
	.p2align 3
.L26:
	cmpl	$6, %r10d
	ja	.L16
	jmp	*.L18(,%r15,8)
	.section	.rodata
	.align 8
	.align 4
.L18:
	.quad	.L17
	.quad	.L24
	.quad	.L20
	.quad	.L21
	.quad	.L22
	.quad	.L23
	.quad	.L24
	.text
	.p2align 4,,10
	.p2align 3
.L11:
	movl	%eax, %ebx
	movzbl	(%rdi,%rax), %r11d
	subl	%esi, %ebx
	movslq	%ebx, %rbx
	subb	(%rdi,%rbx), %r11b
	movb	%r11b, (%r14,%rax)
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L24:
	movl	%eax, %r8d
	movzbl	(%rdi,%rax), %ecx
	subl	%r9d, %r8d
	movslq	%r8d, %r8
	subb	(%rdi,%r8), %cl
	movb	%cl, (%r14,%rax)
.L16:
	cmpq	%rbp, %rdx
	movq	%rdx, %rax
	je	.L1
.L35:
	addq	$1, %rdx
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L22:
	movl	%eax, %ecx
	subl	-8(%rsp), %ecx
	movzbl	(%rdi,%rax), %ebx
	movslq	%ecx, %rcx
	movb	%bl, -3(%rsp)
	movzbl	(%rdi,%rcx), %r8d
	movl	%eax, %ecx
	subl	%esi, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rdi,%rcx), %r11d
	movl	%eax, %ecx
	subl	%r9d, %ecx
	movb	%r8b, -2(%rsp)
	movslq	%ecx, %rcx
	movzbl	(%rdi,%rcx), %r12d
	movb	%r11b, -1(%rsp)
	leal	(%r11,%r12), %ecx
	movl	%r12d, %ebx
	subl	%r8d, %ecx
	movl	%ecx, %r13d
	subl	%r11d, %r13d
	movl	%r13d, %r11d
	sarl	$31, %r13d
	xorl	%r13d, %r11d
	subl	%r13d, %r11d
	movl	%ecx, %r13d
	subl	%r12d, %ecx
	subl	%r8d, %r13d
	movl	%ecx, %r12d
	movl	%r13d, %r8d
	sarl	$31, %r13d
	sarl	$31, %r12d
	xorl	%r13d, %r8d
	xorl	%r12d, %ecx
	subl	%r13d, %r8d
	subl	%r12d, %ecx
	cmpl	%r8d, %r11d
	movl	%r8d, %r12d
	cmovle	%r11d, %r12d
	cmpl	%r12d, %ecx
	jg	.L34
	movzbl	-3(%rsp), %ecx
	subl	%ebx, %ecx
	movb	%cl, (%r14,%rax)
.L36:
	cmpq	%rbp, %rdx
	movq	%rdx, %rax
	jne	.L35
.L1:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L21:
	.cfi_restore_state
	movl	%eax, %ecx
	movl	%eax, %r8d
	movzbl	(%rdi,%rax), %ebx
	subl	%r9d, %ecx
	subl	%esi, %r8d
	movslq	%ecx, %rcx
	movslq	%r8d, %r8
	movzbl	(%rdi,%rcx), %ecx
	movzbl	(%rdi,%r8), %r8d
	addl	%r8d, %ecx
	sarl	%ecx
	subl	%ecx, %ebx
	movb	%bl, (%r14,%rax)
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L23:
	movl	%eax, %ecx
	movzbl	(%rdi,%rax), %ebx
	subl	%r9d, %ecx
	movslq	%ecx, %rcx
	movzbl	(%rdi,%rcx), %ecx
	shrb	%cl
	subl	%ecx, %ebx
	movb	%bl, (%r14,%rax)
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L17:
	movzbl	(%rdi,%rax), %ecx
	movb	%cl, (%r14,%rax)
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L20:
	movl	%eax, %r8d
	movzbl	(%rdi,%rax), %ecx
	subl	%esi, %r8d
	movslq	%r8d, %r8
	subb	(%rdi,%r8), %cl
	movb	%cl, (%r14,%rax)
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L10:
	movl	%eax, %r11d
	movzbl	(%rdi,%rax), %ebx
	subl	%esi, %r11d
	movslq	%r11d, %r11
	movzbl	(%rdi,%r11), %r11d
	shrb	%r11b
	subl	%r11d, %ebx
	movb	%bl, (%r14,%rax)
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L3:
	imull	%esi, %r8d
	movslq	%r8d, %r8
	addq	%r8, %rdi
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L34:
	movzbl	-1(%rsp), %ecx
	movzbl	-2(%rsp), %ebx
	cmpl	%r8d, %r11d
	cmovle	%ecx, %ebx
	movzbl	-3(%rsp), %ecx
	subl	%ebx, %ecx
	movb	%cl, (%r14,%rax)
	jmp	.L36
	.cfi_endproc
.LFE743:
	.size	stbiw__encode_png_line, .-stbiw__encode_png_line
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"stb_image_write.h"
.LC1:
	.string	"0"
	.text
	.p2align 4,,15
	.type	stbiw__writefv, @function
stbiw__writefv:
.LFB714:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdx, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L38:
	movzbl	(%rbx), %eax
	testb	%al, %al
	je	.L57
.L51:
	addq	$1, %rbx
	cmpb	$49, %al
	je	.L40
	jle	.L58
	cmpb	$50, %al
	jne	.L59
	movl	(%r12), %edx
	cmpl	$47, %edx
	ja	.L47
	movl	%edx, %eax
	addq	16(%r12), %rax
	addl	$8, %edx
	movl	%edx, (%r12)
.L48:
	movl	(%rax), %eax
	movq	8(%rbp), %rdi
	movl	$2, %edx
	leaq	4(%rsp), %rsi
	movb	%al, 4(%rsp)
	movb	%ah, 5(%rsp)
	call	*0(%rbp)
	movzbl	(%rbx), %eax
	testb	%al, %al
	jne	.L51
.L57:
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L60
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L58:
	.cfi_restore_state
	cmpb	$32, %al
	je	.L38
.L39:
	movl	$__PRETTY_FUNCTION__.8137, %ecx
	movl	$324, %edx
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	call	__assert_fail
	.p2align 4,,10
	.p2align 3
.L59:
	cmpb	$52, %al
	jne	.L39
	movl	(%r12), %edx
	cmpl	$47, %edx
	ja	.L49
	movl	%edx, %eax
	addq	16(%r12), %rax
	addl	$8, %edx
	movl	%edx, (%r12)
.L50:
	movl	(%rax), %eax
	movq	8(%rbp), %rdi
	leaq	4(%rsp), %rsi
	movl	%eax, %edx
	movb	%al, 4(%rsp)
	movb	%ah, 5(%rsp)
	shrl	$16, %edx
	shrl	$24, %eax
	movb	%dl, 6(%rsp)
	movb	%al, 7(%rsp)
	movl	$4, %edx
	call	*0(%rbp)
	jmp	.L38
.L47:
	movq	8(%r12), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, 8(%r12)
	jmp	.L48
.L40:
	movl	(%r12), %edx
	cmpl	$47, %edx
	ja	.L45
	movl	%edx, %eax
	addq	16(%r12), %rax
	addl	$8, %edx
	movl	%edx, (%r12)
.L46:
	movl	(%rax), %eax
	movq	8(%rbp), %rdi
	movl	$1, %edx
	leaq	3(%rsp), %rsi
	movb	%al, 3(%rsp)
	call	*0(%rbp)
	jmp	.L38
.L60:
	call	__stack_chk_fail
.L45:
	movq	8(%r12), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, 8(%r12)
	jmp	.L46
.L49:
	movq	8(%r12), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, 8(%r12)
	jmp	.L50
	.cfi_endproc
.LFE714:
	.size	stbiw__writefv, .-stbiw__writefv
	.p2align 4,,15
	.type	stbi__stdio_write, @function
stbi__stdio_write:
.LFB711:
	.cfi_startproc
	movq	%rdi, %rcx
	movslq	%edx, %rdx
	movq	%rsi, %rdi
	movl	$1, %esi
	jmp	fwrite
	.cfi_endproc
.LFE711:
	.size	stbi__stdio_write, .-stbi__stdio_write
	.section	.rodata.str1.1
.LC2:
	.string	"p"
	.section	.text.unlikely,"ax",@progbits
	.type	stbiw__sbgrowf.part.2, @function
stbiw__sbgrowf.part.2:
.LFB761:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$__PRETTY_FUNCTION__.8403, %ecx
	movl	$747, %edx
	movl	$.LC0, %esi
	movl	$.LC2, %edi
	call	__assert_fail
	.cfi_endproc
.LFE761:
	.size	stbiw__sbgrowf.part.2, .-stbiw__sbgrowf.part.2
	.section	.rodata.str1.1
.LC3:
	.string	"length+128 <= 255"
	.section	.text.unlikely
	.type	stbiw__write_run_data.part.4, @function
stbiw__write_run_data.part.4:
.LFB763:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$__PRETTY_FUNCTION__.8307, %ecx
	movl	$575, %edx
	movl	$.LC0, %esi
	movl	$.LC3, %edi
	call	__assert_fail
	.cfi_endproc
.LFE763:
	.size	stbiw__write_run_data.part.4, .-stbiw__write_run_data.part.4
	.section	.rodata.str1.1
.LC4:
	.string	"length <= 128"
	.section	.text.unlikely
	.type	stbiw__write_dump_data.part.5, @function
stbiw__write_dump_data.part.5:
.LFB764:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$__PRETTY_FUNCTION__.8314, %ecx
	movl	$583, %edx
	movl	$.LC0, %esi
	movl	$.LC4, %edi
	call	__assert_fail
	.cfi_endproc
.LFE764:
	.size	stbiw__write_dump_data.part.5, .-stbiw__write_dump_data.part.5
	.text
	.p2align 4,,15
	.type	stbiw__outfile.constprop.13, @function
stbiw__outfile.constprop.13:
.LFB772:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%ecx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %r13
	movl	%r9d, %ebp
	subq	$280, %rsp
	.cfi_def_cfa_offset 336
	testb	%al, %al
	movq	344(%rsp), %rcx
	movl	%r8d, 24(%rsp)
	movq	368(%rsp), %rsi
	movq	%rcx, 32(%rsp)
	je	.L69
	movaps	%xmm0, 144(%rsp)
	movaps	%xmm1, 160(%rsp)
	movaps	%xmm2, 176(%rsp)
	movaps	%xmm3, 192(%rsp)
	movaps	%xmm4, 208(%rsp)
	movaps	%xmm5, 224(%rsp)
	movaps	%xmm6, 240(%rsp)
	movaps	%xmm7, 256(%rsp)
.L69:
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movl	24(%rsp), %ebx
	testl	%ebx, %ebx
	js	.L85
	testl	%r12d, %r12d
	js	.L85
	leaq	376(%rsp), %rax
	leaq	56(%rsp), %rdx
	movq	%r13, %rdi
	movl	$48, 56(%rsp)
	movl	$48, 60(%rsp)
	movq	%rax, 64(%rsp)
	leaq	96(%rsp), %rax
	movq	%rax, 72(%rsp)
	call	stbiw__writefv
	testl	%ebx, %ebx
	movl	$0, 52(%rsp)
	je	.L71
	movl	stbi__flip_vertically_on_write(%rip), %ecx
	testl	%ecx, %ecx
	jne	.L86
	movl	$-1, %eax
	subl	$1, %ebx
	movl	%ebx, 20(%rsp)
	movl	%eax, 24(%rsp)
	movl	%eax, %ebx
	movl	%eax, 40(%rsp)
.L72:
	movl	%ebp, %eax
	movq	%r13, %r14
	imull	%r12d, %eax
	imull	%eax, %ebx
	imull	20(%rsp), %eax
	movl	%ebx, 44(%rsp)
	movl	%eax, 28(%rsp)
	movslq	%ebp, %rax
	leaq	-1(%rax), %r15
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L81:
	testl	%r12d, %r12d
	je	.L98
	movslq	28(%rsp), %rax
	movq	32(%rsp), %rbx
	movq	(%r14), %rcx
	movq	8(%r14), %rdi
	leaq	(%rbx,%rax), %r13
	xorl	%ebx, %ebx
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L75:
	cmpl	$4, %ebp
	jne	.L73
	movl	352(%rsp), %eax
	movzbl	0(%r13), %r9d
	movzbl	1(%r13), %edx
	movzbl	2(%r13), %esi
	testl	%eax, %eax
	jne	.L74
	movzbl	3(%r13), %r10d
	subl	$255, %esi
	movl	$2155905153, %eax
	imull	%r10d, %edx
	imull	%r10d, %esi
	imulq	%rax, %rdx
	movslq	%esi, %r11
	imulq	$-2139062143, %r11, %r11
	shrq	$39, %rdx
	movb	%dl, 86(%rsp)
	movzbl	%r9b, %edx
	shrq	$32, %r11
	subl	$255, %edx
	addl	%esi, %r11d
	sarl	$31, %esi
	imull	%r10d, %edx
	sarl	$7, %r11d
	subl	%esi, %r11d
	subl	$1, %r11d
	movslq	%edx, %rsi
	movb	%r11b, 85(%rsp)
	imulq	$-2139062143, %rsi, %rsi
	shrq	$32, %rsi
	addl	%edx, %esi
	sarl	$31, %edx
	sarl	$7, %esi
	subl	%edx, %esi
	movl	%esi, %edx
	leaq	85(%rsp), %rsi
	subl	$1, %edx
	movb	%dl, 87(%rsp)
	movl	$3, %edx
	call	*%rcx
	movq	(%r14), %rcx
	movq	8(%r14), %rdi
.L79:
	addl	$1, %ebx
	addq	8(%rsp), %r13
	cmpl	%ebx, %r12d
	je	.L83
	.p2align 4,,10
	.p2align 3
.L80:
	cmpl	$3, %ebp
	je	.L99
	jg	.L75
	cmpl	$1, %ebp
	jl	.L73
	movl	336(%rsp), %edx
	testl	%edx, %edx
	je	.L78
	movzbl	0(%r13), %edx
	movb	%dl, 85(%rsp)
	movb	%dl, 86(%rsp)
	movb	%dl, 87(%rsp)
.L97:
	movl	$3, %edx
	leaq	85(%rsp), %rsi
	call	*%rcx
	movq	(%r14), %rcx
	movq	8(%r14), %rdi
.L73:
	cmpl	$1, 352(%rsp)
	jne	.L79
	addl	$1, %ebx
	leaq	(%r15,%r13), %rsi
	movl	$1, %edx
	call	*%rcx
	addq	8(%rsp), %r13
	cmpl	%ebx, %r12d
	movq	(%r14), %rcx
	movq	8(%r14), %rdi
	jne	.L80
.L83:
	movl	360(%rsp), %edx
	leaq	52(%rsp), %rsi
	call	*%rcx
	movl	40(%rsp), %ebx
	addl	%ebx, 20(%rsp)
	movl	20(%rsp), %eax
	movl	44(%rsp), %ecx
	addl	%ecx, 28(%rsp)
	cmpl	%eax, 24(%rsp)
	jne	.L81
.L71:
	movl	$1, %eax
	jmp	.L68
	.p2align 4,,10
	.p2align 3
.L85:
	xorl	%eax, %eax
.L68:
	movq	88(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L100
	addq	$280, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L86:
	.cfi_restore_state
	movl	$1, 40(%rsp)
	movl	$0, 20(%rsp)
	movl	40(%rsp), %ebx
	jmp	.L72
	.p2align 4,,10
	.p2align 3
.L99:
	movzbl	0(%r13), %r9d
	movzbl	1(%r13), %edx
	movzbl	2(%r13), %esi
.L74:
	movb	%sil, 85(%rsp)
	movb	%dl, 86(%rsp)
	movb	%r9b, 87(%rsp)
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L78:
	movl	$1, %edx
	movq	%r13, %rsi
	call	*%rcx
	movq	(%r14), %rcx
	movq	8(%r14), %rdi
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L98:
	movq	(%r14), %rcx
	movq	8(%r14), %rdi
	jmp	.L83
.L100:
	call	__stack_chk_fail
	.cfi_endproc
.LFE772:
	.size	stbiw__outfile.constprop.13, .-stbiw__outfile.constprop.13
	.section	.rodata.str1.1
.LC5:
	.string	"111 221 2222 11"
	.text
	.p2align 4,,15
	.type	stbiw__writef.constprop.17, @function
stbiw__writef.constprop.17:
.LFB768:
	.cfi_startproc
	subq	$216, %rsp
	.cfi_def_cfa_offset 224
	testb	%al, %al
	movq	%rdx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%r8, 64(%rsp)
	movq	%r9, 72(%rsp)
	je	.L102
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm1, 96(%rsp)
	movaps	%xmm2, 112(%rsp)
	movaps	%xmm3, 128(%rsp)
	movaps	%xmm4, 144(%rsp)
	movaps	%xmm5, 160(%rsp)
	movaps	%xmm6, 176(%rsp)
	movaps	%xmm7, 192(%rsp)
.L102:
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	224(%rsp), %rax
	movq	%rsp, %rdx
	movl	$.LC5, %esi
	movq	%rax, 8(%rsp)
	leaq	32(%rsp), %rax
	movl	$16, (%rsp)
	movl	$48, 4(%rsp)
	movq	%rax, 16(%rsp)
	call	stbiw__writefv
	movq	24(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L105
	addq	$216, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L105:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE768:
	.size	stbiw__writef.constprop.17, .-stbiw__writef.constprop.17
	.p2align 4,,15
	.type	stbi_write_tga_core, @function
stbi_write_tga_core:
.LFB724:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edx, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%ecx, %ebp
	movq	%r8, %rbx
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	leal	-2(%rcx), %eax
	movl	%edx, 52(%rsp)
	movl	%ebp, %edx
	movl	%esi, 40(%rsp)
	andl	$-3, %eax
	cmpl	$1, %eax
	movl	%eax, %ecx
	movl	%eax, 20(%rsp)
	sbbl	$0, %edx
	cmpl	$1, %edx
	setle	%al
	movzbl	%al, %r8d
	movzbl	%al, %eax
	addl	$10, %r8d
	addl	$2, %eax
	testl	%edi, %edi
	js	.L145
	testl	%esi, %esi
	movl	%esi, %r10d
	js	.L145
	testl	%ecx, %ecx
	movl	stbi_write_tga_with_rle(%rip), %r12d
	sete	%cl
	movzbl	%cl, %ecx
	addl	%ecx, %edx
	leal	0(,%rcx,8), %esi
	sall	$3, %edx
	testl	%r12d, %r12d
	je	.L175
	pushq	%rsi
	.cfi_def_cfa_offset 168
	pushq	%rdx
	.cfi_def_cfa_offset 176
	xorl	%r9d, %r9d
	movl	68(%rsp), %r15d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$.LC5, %esi
	movq	%r14, %rdi
	pushq	%r15
	.cfi_def_cfa_offset 184
	movl	64(%rsp), %eax
	pushq	%rax
	.cfi_def_cfa_offset 192
	pushq	$0
	.cfi_def_cfa_offset 200
	xorl	%eax, %eax
	pushq	$0
	.cfi_def_cfa_offset 208
	pushq	$0
	.cfi_def_cfa_offset 216
	pushq	$0
	.cfi_def_cfa_offset 224
	call	stbiw__writef.constprop.17
	movl	stbi__flip_vertically_on_write(%rip), %r11d
	addq	$64, %rsp
	.cfi_def_cfa_offset 160
	testl	%r11d, %r11d
	jne	.L146
	movl	$-1, %eax
	subl	$1, %r15d
	movl	%r15d, 48(%rsp)
	movl	%eax, 52(%rsp)
	movl	%eax, %ecx
	movl	%eax, 68(%rsp)
.L111:
	cmpl	%ecx, 48(%rsp)
	je	.L112
	movl	40(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L112
	movl	68(%rsp), %eax
	movslq	%ebp, %r13
	movq	%r14, %r15
	imull	%ecx, %eax
	imull	%ebp, %eax
	cltq
	movq	%rax, 72(%rsp)
	movl	48(%rsp), %eax
	imull	%ecx, %eax
	imull	%ebp, %eax
	cltq
	addq	%rbx, %rax
	movq	%rax, 32(%rsp)
	leal	-1(%rcx), %eax
	movl	%eax, 44(%rsp)
	leaq	-1(%r13), %rax
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L138:
	xorl	%ebx, %ebx
	movl	%ebx, %ecx
	movq	%r15, %rbx
	.p2align 4,,10
	.p2align 3
.L137:
	movl	%ebp, %eax
	xorl	%edx, %edx
	leal	1(%rcx), %edi
	imull	%ecx, %eax
	movl	$1, %r14d
	movl	%edi, 24(%rsp)
	movslq	%eax, %r12
	addq	32(%rsp), %r12
	cmpl	44(%rsp), %ecx
	jl	.L176
.L113:
	movq	%r12, %r15
	movb	%dl, 84(%rsp)
	movq	8(%rbx), %rdi
	movl	$1, %edx
	leaq	84(%rsp), %rsi
	xorl	%r12d, %r12d
	call	*(%rbx)
	movq	%rbx, %rax
	movq	%r15, %rbx
	movq	%rax, %r15
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L178:
	cmpl	$1, %ebp
	jl	.L122
	movq	8(%r15), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	*(%r15)
.L127:
	movl	20(%rsp), %r9d
	testl	%r9d, %r9d
	jne	.L122
.L129:
	movq	8(%rsp), %rax
	movq	8(%r15), %rdi
	movl	$1, %edx
	leaq	(%rax,%rbx), %rsi
	call	*(%r15)
.L122:
	addl	$1, %r12d
	addq	%r13, %rbx
	cmpl	%r12d, %r14d
	je	.L177
.L130:
	cmpl	$3, %ebp
	je	.L123
	jle	.L178
	cmpl	$4, %ebp
	jne	.L122
	movl	20(%rsp), %r10d
	movq	(%r15), %r8
	movq	8(%r15), %rdi
	movzbl	1(%rbx), %edx
	movzbl	(%rbx), %r9d
	movzbl	2(%rbx), %esi
	testl	%r10d, %r10d
	je	.L128
	movzbl	3(%rbx), %r10d
	subl	$255, %esi
	movl	$2155905153, %eax
	imull	%r10d, %edx
	imull	%r10d, %esi
	imulq	%rax, %rdx
	movslq	%esi, %r11
	imulq	$-2139062143, %r11, %r11
	shrq	$39, %rdx
	movb	%dl, 86(%rsp)
	movzbl	%r9b, %edx
	shrq	$32, %r11
	subl	$255, %edx
	addl	%esi, %r11d
	sarl	$31, %esi
	imull	%r10d, %edx
	sarl	$7, %r11d
	subl	%esi, %r11d
	subl	$1, %r11d
	movslq	%edx, %rsi
	movb	%r11b, 85(%rsp)
	imulq	$-2139062143, %rsi, %rsi
	shrq	$32, %rsi
	addl	%edx, %esi
	sarl	$31, %edx
	sarl	$7, %esi
	subl	%edx, %esi
	movl	%esi, %edx
	leaq	85(%rsp), %rsi
	subl	$1, %edx
	movb	%dl, 87(%rsp)
	movl	$3, %edx
	call	*%r8
	jmp	.L129
.L175:
	subq	$8, %rsp
	.cfi_def_cfa_offset 168
	movl	%edi, %r8d
	movl	%ebp, %r9d
	pushq	%rsi
	.cfi_def_cfa_offset 176
	pushq	%rdx
	.cfi_def_cfa_offset 184
	movl	$-1, %edx
	pushq	%rdi
	.cfi_def_cfa_offset 192
	pushq	%r10
	.cfi_def_cfa_offset 200
	movl	%edx, %esi
	pushq	$0
	.cfi_def_cfa_offset 208
	pushq	$0
	.cfi_def_cfa_offset 216
	movq	%r14, %rdi
	pushq	$0
	.cfi_def_cfa_offset 224
	pushq	$0
	.cfi_def_cfa_offset 232
	pushq	$0
	.cfi_def_cfa_offset 240
	pushq	%rax
	.cfi_def_cfa_offset 248
	xorl	%eax, %eax
	pushq	$0
	.cfi_def_cfa_offset 256
	pushq	$0
	.cfi_def_cfa_offset 264
	pushq	$.LC5
	.cfi_def_cfa_offset 272
	pushq	$0
	.cfi_def_cfa_offset 280
	pushq	%rcx
	.cfi_def_cfa_offset 288
	pushq	%rbx
	.cfi_def_cfa_offset 296
	movl	%r10d, %ecx
	pushq	$0
	.cfi_def_cfa_offset 304
	call	stbiw__outfile.constprop.13
	addq	$144, %rsp
	.cfi_def_cfa_offset 160
.L106:
	movq	88(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L179
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L145:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L106
.L146:
	movl	$1, 68(%rsp)
	movl	$0, 48(%rsp)
	movl	52(%rsp), %ecx
	jmp	.L111
	.p2align 4,,10
	.p2align 3
.L123:
	movzbl	1(%rbx), %edx
	movzbl	(%rbx), %r9d
	movzbl	2(%rbx), %esi
	movq	(%r15), %r8
	movq	8(%r15), %rdi
.L128:
	movb	%sil, 85(%rsp)
	movb	%dl, 86(%rsp)
	leaq	85(%rsp), %rsi
	movb	%r9b, 87(%rsp)
	movl	$3, %edx
	call	*%r8
	jmp	.L127
	.p2align 4,,10
	.p2align 3
.L177:
	movl	24(%rsp), %ecx
	movq	%r15, %rbx
.L131:
	cmpl	%ecx, 40(%rsp)
	jg	.L137
	movl	68(%rsp), %ecx
	addl	%ecx, 48(%rsp)
	movq	%rbx, %r15
	movl	48(%rsp), %eax
	movq	72(%rsp), %rbx
	addq	%rbx, 32(%rsp)
	cmpl	52(%rsp), %eax
	jne	.L138
.L112:
	movl	$1, %eax
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L176:
	leal	(%rax,%rbp), %r14d
	movq	%r13, %rdx
	movq	%r12, %rdi
	movl	%ecx, 24(%rsp)
	movslq	%r14d, %rsi
	addq	32(%rsp), %rsi
	call	memcmp
	movl	24(%rsp), %ecx
	testl	%eax, %eax
	leal	2(%rcx), %edx
	movl	%edx, 24(%rsp)
	je	.L114
	movl	40(%rsp), %edi
	cmpl	%edx, %edi
	jle	.L148
	leal	(%r14,%rbp), %r15d
	movq	%r12, %r9
	movq	%r12, 24(%rsp)
	movq	%rbx, 56(%rsp)
	movl	%ebp, 64(%rsp)
	movl	$2, %r14d
	movslq	%r15d, %r15
	addq	32(%rsp), %r15
	movl	%edi, %ebx
	movq	%r9, %rbp
	movq	%r15, %r12
	movl	%ecx, %r15d
	jmp	.L116
	.p2align 4,,10
	.p2align 3
.L180:
	addl	$1, %r14d
	addq	%r13, %rbp
	addq	%r13, %r12
	leal	(%r15,%r14), %eax
	cmpl	%eax, %ebx
	jle	.L150
	cmpl	$127, %r14d
	jg	.L150
.L116:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	memcmp
	testl	%eax, %eax
	jne	.L180
	subl	$1, %r14d
	movq	24(%rsp), %r12
	movq	56(%rsp), %rbx
	leal	(%r14,%r15), %eax
	movl	64(%rsp), %ebp
	leal	-1(%r14), %edx
	movl	%eax, 24(%rsp)
	jmp	.L113
	.p2align 4,,10
	.p2align 3
.L114:
	movl	40(%rsp), %eax
	cmpl	%edx, %eax
	jle	.L149
	addl	%ebp, %r14d
	movl	$2, %r15d
	movq	%rbx, 24(%rsp)
	movslq	%r14d, %r14
	addq	32(%rsp), %r14
	movl	%ebp, 56(%rsp)
	movl	%eax, %ebx
	movl	%r15d, %ebp
	movq	%r14, %r15
	movl	%ecx, %r14d
	jmp	.L120
	.p2align 4,,10
	.p2align 3
.L119:
	addl	$1, %ebp
	addq	%r13, %r15
	leal	(%r14,%rbp), %eax
	cmpl	%eax, %ebx
	jle	.L151
	cmpl	$127, %ebp
	jg	.L151
.L120:
	movq	%r13, %rdx
	movq	%r15, %rsi
	movq	%r12, %rdi
	call	memcmp
	testl	%eax, %eax
	je	.L119
	movl	%ebp, %r15d
	movq	24(%rsp), %rbx
	movl	56(%rsp), %ebp
	movl	%r14d, %ecx
	leal	127(%r15), %edx
	addl	%r15d, %ecx
.L118:
	movl	%ecx, 24(%rsp)
	movb	%dl, 84(%rsp)
	leaq	84(%rsp), %rsi
	movq	8(%rbx), %rdi
	movl	$1, %edx
	call	*(%rbx)
	cmpl	$3, %ebp
	movl	24(%rsp), %ecx
	je	.L140
	jg	.L141
	cmpl	$1, %ebp
	jl	.L133
	movl	%ecx, 24(%rsp)
	movq	8(%rbx), %rdi
	movl	$1, %edx
	movq	%r12, %rsi
	call	*(%rbx)
	movl	24(%rsp), %ecx
.L133:
	movl	20(%rsp), %eax
	testl	%eax, %eax
	jne	.L131
	movq	8(%rsp), %rax
	movl	%ecx, 24(%rsp)
	movl	$1, %edx
	movq	8(%rbx), %rdi
	leaq	(%r12,%rax), %rsi
	call	*(%rbx)
	movl	24(%rsp), %ecx
	jmp	.L131
	.p2align 4,,10
	.p2align 3
.L141:
	cmpl	$4, %ebp
	jne	.L133
	movl	20(%rsp), %r8d
	movq	(%rbx), %r9
	movq	8(%rbx), %rdi
	movzbl	(%r12), %esi
	movzbl	1(%r12), %eax
	movzbl	2(%r12), %edx
	testl	%r8d, %r8d
	je	.L135
	movzbl	3(%r12), %r10d
	subl	$255, %edx
	movl	%ecx, 24(%rsp)
	movl	$2155905153, %ecx
	imull	%r10d, %edx
	imull	%r10d, %eax
	movslq	%edx, %r11
	imulq	%rcx, %rax
	imulq	$-2139062143, %r11, %r11
	shrq	$39, %rax
	shrq	$32, %r11
	movb	%al, 86(%rsp)
	movzbl	%sil, %eax
	addl	%edx, %r11d
	subl	$255, %eax
	sarl	$31, %edx
	sarl	$7, %r11d
	leaq	85(%rsp), %rsi
	imull	%r10d, %eax
	subl	%edx, %r11d
	leal	-1(%r11), %edx
	movb	%dl, 85(%rsp)
	movslq	%eax, %rdx
	imulq	$-2139062143, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$31, %eax
	sarl	$7, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	$3, %edx
	subl	$1, %eax
	movb	%al, 87(%rsp)
	call	*%r9
	movl	24(%rsp), %ecx
	jmp	.L131
	.p2align 4,,10
	.p2align 3
.L140:
	movzbl	(%r12), %esi
	movzbl	1(%r12), %eax
	movzbl	2(%r12), %edx
	movq	(%rbx), %r9
	movq	8(%rbx), %rdi
.L135:
	movl	%ecx, 24(%rsp)
	movb	%dl, 85(%rsp)
	movl	$3, %edx
	movb	%sil, 87(%rsp)
	movb	%al, 86(%rsp)
	leaq	85(%rsp), %rsi
	call	*%r9
	movl	24(%rsp), %ecx
	jmp	.L133
	.p2align 4,,10
	.p2align 3
.L150:
	movq	24(%rsp), %r12
	movq	56(%rsp), %rbx
	leal	-1(%r14), %edx
	movl	64(%rsp), %ebp
	movl	%eax, 24(%rsp)
	jmp	.L113
	.p2align 4,,10
	.p2align 3
.L151:
	movl	%ebp, %r15d
	movq	24(%rsp), %rbx
	movl	56(%rsp), %ebp
	leal	127(%r15), %edx
	movl	%eax, %ecx
	jmp	.L118
.L148:
	movl	$1, %edx
	movl	$2, %r14d
	jmp	.L113
.L149:
	movl	%edx, %ecx
	movl	$-127, %edx
	jmp	.L118
.L179:
	call	__stack_chk_fail
	.cfi_endproc
.LFE724:
	.size	stbi_write_tga_core, .-stbi_write_tga_core
	.p2align 4,,15
	.type	stbiw__zlib_flushf, @function
stbiw__zlib_flushf:
.LFB735:
	.cfi_startproc
	cmpl	$7, (%rdx)
	jle	.L196
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rsi, %rbx
	jmp	.L186
	.p2align 4,,10
	.p2align 3
.L200:
	movslq	-4(%rdi), %rax
	movl	-8(%rdi), %edx
	leal	1(%rax), %ecx
	cmpl	%edx, %ecx
	jl	.L184
	leal	1(%rdx,%rdx), %r12d
	subq	$8, %rdi
	movslq	%r12d, %rsi
	addq	$8, %rsi
	call	realloc
	testq	%rax, %rax
	je	.L187
.L185:
	leaq	8(%rax), %rdi
	movl	%r12d, (%rax)
	movslq	4(%rax), %rax
	leal	1(%rax), %ecx
.L184:
	movl	(%rbx), %edx
	movl	%ecx, -4(%rdi)
	movb	%dl, (%rdi,%rax)
	shrl	$8, (%rbx)
	movl	0(%rbp), %eax
	subl	$8, %eax
	cmpl	$7, %eax
	movl	%eax, 0(%rbp)
	jle	.L199
.L186:
	testq	%rdi, %rdi
	jne	.L200
	xorl	%edi, %edi
	movl	$10, %esi
	call	realloc
	testq	%rax, %rax
	je	.L187
	movl	$0, 4(%rax)
	movl	$2, %r12d
	jmp	.L185
	.p2align 4,,10
	.p2align 3
.L199:
	popq	%rbx
	.cfi_def_cfa_offset 24
	movq	%rdi, %rax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L196:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	movq	%rdi, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L187:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
	call	stbiw__sbgrowf.part.2
	.cfi_endproc
.LFE735:
	.size	stbiw__zlib_flushf, .-stbiw__zlib_flushf
	.p2align 4,,15
	.type	stbiw__jpg_processDU.constprop.8, @function
stbiw__jpg_processDU.constprop.8:
.LFB777:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$408, %rsp
	.cfi_def_cfa_offset 464
	movaps	(%rcx), %xmm5
	movq	%rdx, 24(%rsp)
	movq	%rsi, 16(%rsp)
	xorl	%edx, %edx
	movaps	16(%rcx), %xmm2
	movaps	%xmm5, %xmm4
	movaps	32(%rcx), %xmm1
	shufps	$221, %xmm2, %xmm5
	shufps	$136, %xmm2, %xmm4
	movaps	48(%rcx), %xmm6
	movaps	%xmm1, %xmm2
	movq	%fs:40, %rax
	movq	%rax, 392(%rsp)
	xorl	%eax, %eax
	movaps	64(%rcx), %xmm3
	shufps	$136, %xmm6, %xmm2
	movaps	%xmm4, %xmm9
	movaps	80(%rcx), %xmm7
	shufps	$221, %xmm6, %xmm1
	movaps	%xmm3, %xmm6
	movaps	96(%rcx), %xmm0
	shufps	$136, %xmm7, %xmm6
	movaps	112(%rcx), %xmm8
	shufps	$221, %xmm7, %xmm3
	movaps	%xmm0, %xmm7
	shufps	$136, %xmm2, %xmm9
	movaps	.LC7(%rip), %xmm11
	shufps	$136, %xmm8, %xmm7
	shufps	$221, %xmm2, %xmm4
	movaps	%xmm6, %xmm2
	shufps	$221, %xmm8, %xmm0
	shufps	$136, %xmm7, %xmm2
	shufps	$221, %xmm7, %xmm6
	movaps	%xmm5, %xmm7
	shufps	$221, %xmm1, %xmm5
	shufps	$136, %xmm1, %xmm7
	movaps	%xmm3, %xmm1
	shufps	$221, %xmm0, %xmm3
	shufps	$136, %xmm0, %xmm1
	movaps	%xmm9, %xmm0
	shufps	$221, %xmm2, %xmm9
	shufps	$136, %xmm2, %xmm0
	movaps	%xmm7, %xmm2
	movaps	%xmm4, %xmm8
	shufps	$136, %xmm1, %xmm2
	shufps	$221, %xmm1, %xmm7
	movaps	%xmm5, %xmm1
	shufps	$221, %xmm6, %xmm4
	shufps	$221, %xmm3, %xmm5
	shufps	$136, %xmm6, %xmm8
	movaps	%xmm2, %xmm6
	shufps	$136, %xmm3, %xmm1
	movaps	%xmm0, %xmm3
	addps	%xmm4, %xmm6
	subps	%xmm5, %xmm0
	addps	%xmm5, %xmm3
	movaps	%xmm9, %xmm5
	subps	%xmm4, %xmm2
	movaps	%xmm7, %xmm4
	movaps	%xmm0, %xmm12
	addps	%xmm8, %xmm4
	addps	%xmm1, %xmm5
	subps	%xmm7, %xmm8
	movaps	%xmm3, %xmm7
	subps	%xmm9, %xmm1
	subps	%xmm5, %xmm3
	addps	%xmm5, %xmm7
	movaps	%xmm6, %xmm5
	subps	%xmm4, %xmm6
	addps	%xmm4, %xmm5
	movaps	.LC6(%rip), %xmm4
	addps	%xmm8, %xmm1
	addps	%xmm3, %xmm6
	movaps	%xmm5, %xmm10
	addps	%xmm2, %xmm12
	addps	%xmm7, %xmm10
	mulps	%xmm4, %xmm6
	subps	%xmm5, %xmm7
	movaps	%xmm3, %xmm5
	addps	%xmm8, %xmm2
	subps	%xmm6, %xmm3
	addps	%xmm6, %xmm5
	movaps	%xmm1, %xmm6
	mulps	.LC8(%rip), %xmm1
	subps	%xmm12, %xmm6
	mulps	%xmm4, %xmm2
	mulps	%xmm11, %xmm6
	addps	%xmm6, %xmm1
	movaps	%xmm6, %xmm9
	movaps	.LC9(%rip), %xmm6
	mulps	%xmm12, %xmm6
	addps	%xmm9, %xmm6
	movaps	%xmm0, %xmm9
	subps	%xmm2, %xmm0
	addps	%xmm2, %xmm9
	movaps	%xmm6, %xmm8
	movaps	%xmm1, %xmm2
	addps	%xmm0, %xmm2
	addps	%xmm9, %xmm8
	subps	%xmm1, %xmm0
	movaps	%xmm10, %xmm1
	subps	%xmm6, %xmm9
	movaps	%xmm10, %xmm6
	movaps	%xmm5, %xmm10
	unpcklps	%xmm7, %xmm6
	unpcklps	%xmm3, %xmm10
	unpckhps	%xmm7, %xmm1
	movaps	%xmm8, %xmm7
	unpckhps	%xmm3, %xmm5
	movaps	%xmm0, %xmm3
	unpcklps	%xmm2, %xmm7
	unpckhps	%xmm9, %xmm0
	unpcklps	%xmm9, %xmm3
	movaps	%xmm6, %xmm9
	unpckhps	%xmm2, %xmm8
	unpcklps	%xmm10, %xmm9
	movaps	%xmm5, %xmm2
	unpckhps	%xmm10, %xmm6
	movaps	%xmm7, %xmm10
	unpckhps	%xmm3, %xmm7
	movaps	%xmm1, %xmm5
	unpckhps	%xmm2, %xmm1
	movaps	%xmm6, %xmm14
	unpcklps	%xmm3, %xmm10
	movaps	%xmm7, %xmm3
	movaps	%xmm8, %xmm7
	unpckhps	%xmm0, %xmm8
	unpcklps	%xmm3, %xmm14
	unpckhps	%xmm3, %xmm6
	movaps	%xmm1, %xmm3
	unpcklps	%xmm2, %xmm5
	unpcklps	%xmm8, %xmm3
	movaps	%xmm9, %xmm2
	unpcklps	%xmm0, %xmm7
	movaps	%xmm5, %xmm15
	movaps	176(%rcx), %xmm0
	unpckhps	%xmm10, %xmm9
	movaps	%xmm3, (%rsp)
	unpckhps	%xmm7, %xmm5
	unpckhps	%xmm8, %xmm1
	unpcklps	%xmm7, %xmm15
	movaps	160(%rcx), %xmm3
	unpcklps	%xmm10, %xmm2
	movaps	%xmm3, %xmm12
	movaps	128(%rcx), %xmm7
	shufps	$221, %xmm0, %xmm3
	shufps	$136, %xmm0, %xmm12
	movaps	%xmm9, 32(%rsp)
	movaps	%xmm7, %xmm8
	movaps	%xmm6, 48(%rsp)
	movaps	%xmm5, 64(%rsp)
	movaps	%xmm1, 80(%rsp)
	movaps	144(%rcx), %xmm9
	movaps	192(%rcx), %xmm6
	shufps	$136, %xmm9, %xmm8
	movaps	208(%rcx), %xmm1
	shufps	$221, %xmm9, %xmm7
	movaps	%xmm6, %xmm0
	movaps	224(%rcx), %xmm5
	movaps	%xmm12, %xmm9
	shufps	$136, %xmm1, %xmm0
	movaps	240(%rcx), %xmm10
	movaps	%xmm5, %xmm12
	shufps	$221, %xmm1, %xmm6
	shufps	$136, %xmm10, %xmm12
	shufps	$221, %xmm10, %xmm5
	movaps	%xmm8, %xmm10
	shufps	$221, %xmm9, %xmm8
	movaps	%xmm12, %xmm1
	movaps	%xmm0, %xmm12
	shufps	$136, %xmm9, %xmm10
	shufps	$136, %xmm1, %xmm12
	shufps	$221, %xmm1, %xmm0
	movaps	%xmm12, %xmm9
	movaps	%xmm7, %xmm12
	shufps	$221, %xmm3, %xmm7
	shufps	$136, %xmm3, %xmm12
	movaps	%xmm6, %xmm3
	shufps	$221, %xmm5, %xmm6
	shufps	$136, %xmm5, %xmm3
	movaps	%xmm12, %xmm1
	movaps	%xmm10, %xmm5
	shufps	$221, %xmm9, %xmm10
	shufps	$221, %xmm3, %xmm1
	shufps	$136, %xmm3, %xmm12
	movaps	%xmm8, %xmm3
	shufps	$221, %xmm0, %xmm8
	shufps	$136, %xmm0, %xmm3
	movaps	%xmm7, %xmm0
	shufps	$221, %xmm6, %xmm7
	shufps	$136, %xmm9, %xmm5
	movaps	%xmm12, %xmm9
	shufps	$136, %xmm6, %xmm0
	movaps	%xmm7, %xmm12
	addps	%xmm5, %xmm12
	subps	%xmm7, %xmm5
	movaps	%xmm8, %xmm7
	movaps	%xmm12, %xmm6
	movaps	%xmm3, %xmm12
	addps	%xmm9, %xmm7
	addps	%xmm1, %xmm12
	subps	%xmm8, %xmm9
	movaps	%xmm0, %xmm8
	subps	%xmm1, %xmm3
	movaps	%xmm12, %xmm13
	addps	%xmm10, %xmm8
	addps	%xmm7, %xmm13
	subps	%xmm12, %xmm7
	movaps	%xmm8, %xmm1
	addps	%xmm6, %xmm8
	subps	%xmm1, %xmm6
	movaps	%xmm7, %xmm12
	subps	%xmm10, %xmm0
	movaps	%xmm13, %xmm1
	addps	%xmm8, %xmm1
	addps	%xmm6, %xmm12
	subps	%xmm13, %xmm8
	movaps	%xmm9, %xmm13
	addps	%xmm3, %xmm0
	mulps	%xmm4, %xmm12
	addps	%xmm5, %xmm13
	addps	%xmm9, %xmm3
	movaps	%xmm12, %xmm7
	addps	%xmm6, %xmm7
	mulps	%xmm4, %xmm3
	subps	%xmm12, %xmm6
	movaps	%xmm0, %xmm12
	mulps	.LC8(%rip), %xmm0
	subps	%xmm13, %xmm12
	movaps	%xmm12, %xmm10
	movaps	.LC9(%rip), %xmm12
	mulps	%xmm11, %xmm10
	mulps	%xmm13, %xmm12
	movaps	%xmm2, %xmm13
	addps	%xmm10, %xmm0
	addps	%xmm10, %xmm12
	movaps	%xmm3, %xmm10
	addps	%xmm5, %xmm10
	subps	%xmm3, %xmm5
	movaps	%xmm10, %xmm9
	movaps	%xmm5, %xmm10
	movaps	%xmm9, %xmm3
	subps	%xmm0, %xmm5
	addps	%xmm12, %xmm3
	addps	%xmm0, %xmm10
	movaps	%xmm5, %xmm0
	subps	%xmm12, %xmm9
	movaps	%xmm1, %xmm5
	movaps	%xmm0, %xmm12
	unpcklps	%xmm8, %xmm5
	unpckhps	%xmm8, %xmm1
	movaps	%xmm3, %xmm8
	unpckhps	%xmm10, %xmm3
	unpcklps	%xmm10, %xmm8
	movaps	%xmm7, %xmm10
	unpcklps	%xmm9, %xmm12
	unpcklps	%xmm6, %xmm10
	unpckhps	%xmm6, %xmm7
	movaps	%xmm12, %xmm6
	movaps	%xmm5, %xmm12
	unpckhps	%xmm10, %xmm5
	unpcklps	%xmm10, %xmm12
	movaps	%xmm1, %xmm10
	unpckhps	%xmm7, %xmm1
	unpcklps	%xmm7, %xmm10
	movaps	%xmm8, %xmm7
	unpckhps	%xmm6, %xmm8
	unpckhps	%xmm9, %xmm0
	movaps	%xmm12, %xmm9
	unpcklps	%xmm6, %xmm7
	movaps	%xmm8, %xmm6
	movaps	%xmm3, %xmm8
	unpckhps	%xmm0, %xmm3
	unpcklps	%xmm0, %xmm8
	movaps	%xmm12, %xmm0
	unpckhps	%xmm7, %xmm9
	unpcklps	%xmm7, %xmm0
	movaps	%xmm10, %xmm7
	unpckhps	%xmm8, %xmm10
	unpcklps	%xmm8, %xmm7
	movaps	%xmm1, %xmm8
	movaps	%xmm5, %xmm12
	unpcklps	%xmm3, %xmm8
	unpcklps	%xmm6, %xmm12
	unpckhps	%xmm6, %xmm5
	addps	%xmm8, %xmm13
	unpckhps	%xmm3, %xmm1
	movaps	%xmm14, %xmm3
	subps	%xmm8, %xmm2
	movaps	%xmm14, %xmm8
	addps	%xmm7, %xmm3
	movaps	%xmm13, %xmm6
	movaps	(%rsp), %xmm13
	subps	%xmm7, %xmm8
	movaps	%xmm15, %xmm7
	addps	%xmm0, %xmm13
	movaps	%xmm3, %xmm14
	addps	%xmm12, %xmm7
	subps	%xmm12, %xmm15
	movaps	%xmm6, %xmm12
	subps	%xmm13, %xmm6
	addps	%xmm13, %xmm12
	movaps	(%rsp), %xmm13
	addps	%xmm7, %xmm14
	subps	%xmm0, %xmm13
	subps	%xmm7, %xmm3
	movaps	%xmm2, %xmm7
	movaps	%xmm13, %xmm0
	addps	%xmm8, %xmm7
	addps	%xmm15, %xmm0
	addps	%xmm15, %xmm8
	addps	%xmm6, %xmm3
	movaps	%xmm0, %xmm13
	mulps	.LC8(%rip), %xmm0
	subps	%xmm7, %xmm13
	mulps	.LC9(%rip), %xmm7
	mulps	%xmm4, %xmm8
	mulps	%xmm11, %xmm13
	mulps	%xmm4, %xmm3
	addps	%xmm13, %xmm0
	addps	%xmm13, %xmm7
	movaps	%xmm2, %xmm13
	subps	%xmm8, %xmm2
	addps	%xmm8, %xmm13
	movaps	%xmm0, %xmm8
	addps	%xmm2, %xmm8
	subps	%xmm0, %xmm2
	movaps	%xmm7, %xmm0
	addps	%xmm13, %xmm0
	movaps	%xmm8, 160(%rcx)
	subps	%xmm7, %xmm13
	movaps	%xmm2, 96(%rcx)
	movaps	%xmm0, 32(%rcx)
	movaps	%xmm12, %xmm0
	subps	%xmm14, %xmm12
	movaps	%xmm13, 224(%rcx)
	addps	%xmm14, %xmm0
	movaps	48(%rsp), %xmm7
	movaps	%xmm0, (%rcx)
	movaps	%xmm6, %xmm0
	subps	%xmm3, %xmm6
	movaps	%xmm12, 128(%rcx)
	addps	%xmm3, %xmm0
	movaps	%xmm6, 192(%rcx)
	movaps	%xmm0, 64(%rcx)
	movaps	%xmm7, %xmm0
	subps	%xmm10, %xmm7
	movaps	32(%rsp), %xmm6
	addps	%xmm10, %xmm0
	movaps	%xmm6, %xmm2
	movaps	80(%rsp), %xmm14
	subps	%xmm1, %xmm6
	movaps	%xmm14, %xmm8
	addps	%xmm1, %xmm2
	movaps	64(%rsp), %xmm1
	addps	%xmm9, %xmm8
	movaps	%xmm6, %xmm3
	movaps	%xmm7, %xmm6
	movaps	%xmm1, %xmm7
	subps	%xmm5, %xmm1
	addps	%xmm5, %xmm7
	movaps	%xmm8, %xmm5
	addps	%xmm2, %xmm5
	subps	%xmm8, %xmm2
	movaps	%xmm7, %xmm8
	addps	%xmm0, %xmm8
	subps	%xmm7, %xmm0
	movaps	%xmm0, %xmm7
	movaps	%xmm14, %xmm0
	addps	%xmm2, %xmm7
	subps	%xmm9, %xmm0
	movaps	%xmm6, %xmm9
	addps	%xmm3, %xmm9
	mulps	%xmm4, %xmm7
	addps	%xmm1, %xmm0
	addps	%xmm6, %xmm1
	movaps	%xmm0, %xmm10
	mulps	.LC8(%rip), %xmm0
	subps	%xmm9, %xmm10
	mulps	%xmm1, %xmm4
	mulps	.LC9(%rip), %xmm9
	mulps	%xmm10, %xmm11
	movaps	%xmm4, %xmm1
	addps	%xmm3, %xmm1
	subps	%xmm4, %xmm3
	addps	%xmm11, %xmm0
	addps	%xmm9, %xmm11
	movaps	%xmm3, %xmm4
	subps	%xmm0, %xmm3
	addps	%xmm0, %xmm4
	movaps	%xmm1, %xmm0
	subps	%xmm11, %xmm1
	movaps	%xmm3, 112(%rcx)
	addps	%xmm11, %xmm0
	movaps	%xmm4, 176(%rcx)
	movaps	%xmm1, 240(%rcx)
	movaps	%xmm0, 48(%rcx)
	movaps	%xmm8, %xmm0
	addps	%xmm5, %xmm0
	movss	.LC11(%rip), %xmm1
	subps	%xmm8, %xmm5
	movaps	%xmm0, 16(%rcx)
	movaps	%xmm7, %xmm0
	movaps	%xmm5, 144(%rcx)
	addps	%xmm2, %xmm0
	subps	%xmm7, %xmm2
	movaps	%xmm0, 80(%rcx)
	movaps	%xmm2, 208(%rcx)
	pxor	%xmm2, %xmm2
	jmp	.L202
	.p2align 4,,10
	.p2align 3
.L280:
	addss	%xmm1, %xmm0
.L284:
	cvttss2si	%xmm0, %eax
	addq	$1, %rdx
	cmpq	$64, %rdx
	movl	%eax, 128(%rsp,%rsi,4)
	je	.L286
.L202:
	movss	(%rcx,%rdx,4), %xmm0
	movzbl	stbiw__jpg_ZigZag(%rdx), %esi
	mulss	(%r8,%rdx,4), %xmm0
	ucomiss	%xmm0, %xmm2
	jbe	.L280
	subss	%xmm1, %xmm0
	jmp	.L284
	.p2align 4,,10
	.p2align 3
.L286:
	movq	16(%rsp), %rcx
	movl	128(%rsp), %eax
	movl	(%rcx), %r13d
	movq	24(%rsp), %rcx
	movl	%eax, 108(%rsp)
	subl	%r9d, %eax
	movl	%eax, %edi
	movl	(%rcx), %esi
	je	.L287
	movl	%eax, %edx
	sarl	$31, %edx
	movl	%edx, %eax
	xorl	%edi, %eax
	subl	%edx, %eax
	cmpl	$-2147483648, %edi
	adcl	$-1, %edi
	sarl	%eax
	je	.L258
	movl	$2, %edx
	jmp	.L214
	.p2align 4,,10
	.p2align 3
.L259:
	movl	%ecx, %edx
.L214:
	sarl	%eax
	leal	1(%rdx), %ecx
	jne	.L259
	movzwl	%dx, %r15d
	movl	$1, %r12d
	movzwl	%dx, %eax
	movl	%r15d, %ecx
	salq	$2, %rax
	sall	%cl, %r12d
	subl	$1, %r12d
.L213:
	movzwl	UVDC_HT.8732+2(%rax), %ebx
	movzwl	UVDC_HT.8732(%rax), %ebp
	movl	$24, %ecx
	andl	%edi, %r12d
	movw	%r12w, (%rsp)
	addl	%esi, %ebx
	subl	%ebx, %ecx
	sall	%cl, %ebp
	orl	%r13d, %ebp
	cmpl	$7, %ebx
	jle	.L215
	leal	-8(%rbx), %eax
	movl	%eax, %r13d
	movl	%eax, 32(%rsp)
	andl	$7, %r13d
	.p2align 4,,10
	.p2align 3
.L217:
	movl	%ebp, %r12d
	movq	8(%r14), %rdi
	movl	$1, %edx
	sarl	$16, %r12d
	leaq	117(%rsp), %rsi
	movb	%r12b, 117(%rsp)
	call	*(%r14)
	cmpb	$-1, %r12b
	jne	.L216
	movb	$0, 116(%rsp)
	movq	8(%r14), %rdi
	movl	$1, %edx
	leaq	116(%rsp), %rsi
	call	*(%r14)
.L216:
	subl	$8, %ebx
	sall	$8, %ebp
	cmpl	%r13d, %ebx
	jne	.L217
	movl	32(%rsp), %ebx
	andl	$7, %ebx
.L215:
	movq	16(%rsp), %rax
	movq	24(%rsp), %rcx
	addl	%ebx, %r15d
	movzwl	(%rsp), %r12d
	movl	%ebp, (%rax)
	movl	%ebx, (%rcx)
	movl	$24, %ecx
	subl	%r15d, %ecx
	sall	%cl, %r12d
	orl	(%rax), %r12d
	cmpl	$7, %r15d
	jle	.L218
	leal	-8(%r15), %r13d
	movl	%r13d, %ebx
	andl	$7, %ebx
	.p2align 4,,10
	.p2align 3
.L220:
	movl	%r12d, %ebp
	movq	8(%r14), %rdi
	movl	$1, %edx
	sarl	$16, %ebp
	leaq	115(%rsp), %rsi
	movb	%bpl, 115(%rsp)
	call	*(%r14)
	cmpb	$-1, %bpl
	jne	.L219
	movb	$0, 114(%rsp)
	movq	8(%r14), %rdi
	movl	$1, %edx
	leaq	114(%rsp), %rsi
	call	*(%r14)
.L219:
	subl	$8, %r15d
	sall	$8, %r12d
	cmpl	%ebx, %r15d
	jne	.L220
	movq	16(%rsp), %rax
	movl	%r13d, %r15d
	andl	$7, %r15d
.L218:
	movl	%r12d, (%rax)
	movq	24(%rsp), %rax
	movl	%r15d, (%rax)
.L211:
	movl	$63, %eax
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L223:
	subq	$1, %rax
	je	.L222
.L221:
	movl	128(%rsp,%rax,4), %ecx
	testl	%ecx, %ecx
	je	.L223
	movl	%r15d, %ebp
	movl	%eax, 32(%rsp)
	movl	$1, %edx
	movq	%r14, %r15
.L224:
	movslq	%edx, %rcx
	movl	128(%rsp,%rcx,4), %ebx
	testl	%ebx, %ebx
	jne	.L288
	cmpl	%edx, 32(%rsp)
	jl	.L289
	leal	1(%rdx), %ecx
	movl	%edx, %eax
	movl	32(%rsp), %esi
	movslq	%ecx, %rcx
	leaq	128(%rsp,%rcx,4), %rcx
	jmp	.L229
	.p2align 4,,10
	.p2align 3
.L291:
	addq	$4, %rcx
	cmpl	%esi, %eax
	jg	.L290
.L229:
	movl	(%rcx), %ebx
	addl	$1, %eax
	testl	%ebx, %ebx
	je	.L291
	movl	%eax, 48(%rsp)
	subl	%edx, %eax
	movl	%ebx, %edx
	sarl	$31, %edx
	movl	%eax, 80(%rsp)
	movl	%edx, %r14d
	xorl	%ebx, %r14d
	subl	%edx, %r14d
	sarl	%r14d
	cmpl	$15, %eax
	jg	.L231
	movl	%eax, %ecx
	sall	$4, %ecx
.L232:
	leal	-1(%rbx), %edx
	testl	%ebx, %ebx
	cmovs	%edx, %ebx
	testl	%r14d, %r14d
	je	.L239
	movl	$2, %r13d
	jmp	.L240
	.p2align 4,,10
	.p2align 3
.L261:
	movl	%eax, %r13d
.L240:
	sarl	%r14d
	leal	1(%r13), %eax
	jne	.L261
	movzwl	%r13w, %eax
	movl	$1, %edx
	leal	(%rax,%rcx), %esi
	movl	%eax, %ecx
	movl	%eax, (%rsp)
	sall	%cl, %edx
	subl	$1, %edx
	movslq	%esi, %rsi
	andl	%edx, %ebx
	salq	$2, %rsi
	movzwl	%bx, %ebx
.L241:
	movzwl	UVAC_HT.8734+2(%rsi), %edx
	movzwl	UVAC_HT.8734(%rsi), %r12d
	movl	$24, %ecx
	movq	16(%rsp), %rax
	addl	%edx, %ebp
	subl	%ebp, %ecx
	sall	%cl, %r12d
	orl	(%rax), %r12d
	cmpl	$7, %ebp
	jle	.L242
	leal	-8(%rbp), %eax
	movl	%eax, %r14d
	movl	%eax, 64(%rsp)
	andl	$7, %r14d
	.p2align 4,,10
	.p2align 3
.L244:
	movl	%r12d, %r13d
	movq	8(%r15), %rdi
	movl	$1, %edx
	sarl	$16, %r13d
	leaq	125(%rsp), %rsi
	movb	%r13b, 125(%rsp)
	call	*(%r15)
	cmpb	$-1, %r13b
	jne	.L243
	movb	$0, 124(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	leaq	124(%rsp), %rsi
	call	*(%r15)
.L243:
	subl	$8, %ebp
	sall	$8, %r12d
	cmpl	%ebp, %r14d
	jne	.L244
	movl	64(%rsp), %ebp
	movq	16(%rsp), %rax
	andl	$7, %ebp
.L242:
	movq	24(%rsp), %rcx
	movl	%r12d, (%rax)
	movl	%ebp, (%rcx)
	addl	(%rsp), %ebp
	movl	$24, %ecx
	subl	%ebp, %ecx
	sall	%cl, %ebx
	orl	(%rax), %ebx
	cmpl	$7, %ebp
	jle	.L245
	leal	-8(%rbp), %r13d
	movl	%r13d, %r12d
	andl	$7, %r12d
	.p2align 4,,10
	.p2align 3
.L247:
	movl	%ebx, %r14d
	movq	8(%r15), %rdi
	movl	$1, %edx
	sarl	$16, %r14d
	leaq	123(%rsp), %rsi
	movb	%r14b, 123(%rsp)
	call	*(%r15)
	cmpb	$-1, %r14b
	jne	.L246
	movb	$0, 122(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	leaq	122(%rsp), %rsi
	call	*(%r15)
.L246:
	subl	$8, %ebp
	sall	$8, %ebx
	cmpl	%ebp, %r12d
	jne	.L247
	movq	16(%rsp), %rax
	movl	%r13d, %ebp
	andl	$7, %ebp
.L245:
	movl	48(%rsp), %edx
	movl	%ebx, (%rax)
	movq	24(%rsp), %rax
	addl	$1, %edx
	cmpl	32(%rsp), %edx
	movl	%ebp, (%rax)
	jle	.L224
	cmpl	$63, 32(%rsp)
	movq	%r15, %r14
	movl	%ebp, %r15d
	jne	.L292
.L201:
	movq	392(%rsp), %rcx
	xorq	%fs:40, %rcx
	movl	108(%rsp), %eax
	jne	.L293
	addq	$408, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L290:
	.cfi_restore_state
	movl	%eax, 48(%rsp)
	subl	%edx, %eax
	cmpl	$15, %eax
	movl	%eax, 80(%rsp)
	jg	.L262
	sall	$4, %eax
	xorl	%ebx, %ebx
	movl	%eax, %ecx
.L239:
	leal	1(%rcx), %esi
	andl	$1, %ebx
	movl	$1, (%rsp)
	movslq	%esi, %rsi
	salq	$2, %rsi
	jmp	.L241
.L262:
	xorl	%r14d, %r14d
.L231:
	movl	80(%rsp), %edx
	movl	$1, (%rsp)
	movl	%r14d, 100(%rsp)
	movl	%ebx, 104(%rsp)
	sarl	$4, %edx
	leal	1(%rdx), %eax
	movl	%eax, 64(%rsp)
	.p2align 4,,10
	.p2align 3
.L236:
	leal	10(%rbp), %r12d
	movq	16(%rsp), %rax
	movl	$24, %ecx
	movl	$1018, %ebx
	subl	%r12d, %ecx
	sall	%cl, %ebx
	orl	(%rax), %ebx
	cmpl	$7, %r12d
	jle	.L260
	addl	$2, %ebp
	movl	%ebp, %r13d
	andl	$7, %r13d
	.p2align 4,,10
	.p2align 3
.L235:
	movl	%ebx, %r14d
	movq	8(%r15), %rdi
	movl	$1, %edx
	sarl	$16, %r14d
	leaq	121(%rsp), %rsi
	movb	%r14b, 121(%rsp)
	call	*(%r15)
	cmpb	$-1, %r14b
	jne	.L234
	movb	$0, 120(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	leaq	120(%rsp), %rsi
	call	*(%r15)
.L234:
	subl	$8, %r12d
	sall	$8, %ebx
	cmpl	%r13d, %r12d
	jne	.L235
	movq	16(%rsp), %rax
	andl	$7, %ebp
.L233:
	movl	%ebx, (%rax)
	movq	24(%rsp), %rax
	addl	$1, (%rsp)
	movl	%ebp, (%rax)
	movl	(%rsp), %eax
	cmpl	64(%rsp), %eax
	jne	.L236
	movl	80(%rsp), %ecx
	movl	100(%rsp), %r14d
	movl	104(%rsp), %ebx
	sall	$4, %ecx
	movzbl	%cl, %ecx
	jmp	.L232
	.p2align 4,,10
	.p2align 3
.L260:
	movl	%r12d, %ebp
	jmp	.L233
.L292:
	movq	16(%rsp), %rax
	leal	2(%rbp), %ebx
	cmpl	$7, %ebx
	movl	(%rax), %r12d
	jle	.L252
	subl	$6, %r15d
	movl	%r15d, %r13d
	andl	$7, %r13d
	.p2align 4,,10
	.p2align 3
.L254:
	movl	%r12d, %ebp
	movq	8(%r14), %rdi
	movl	$1, %edx
	sarl	$16, %ebp
	leaq	127(%rsp), %rsi
	movb	%bpl, 127(%rsp)
	call	*(%r14)
	cmpb	$-1, %bpl
	jne	.L253
	movb	$0, 126(%rsp)
	movq	8(%r14), %rdi
	movl	$1, %edx
	leaq	126(%rsp), %rsi
	call	*(%r14)
.L253:
	subl	$8, %ebx
	sall	$8, %r12d
	cmpl	%r13d, %ebx
	jne	.L254
.L285:
	movq	16(%rsp), %rax
	movl	%r15d, %ebx
	andl	$7, %ebx
.L252:
	movl	%r12d, (%rax)
	movq	24(%rsp), %rax
	movl	%ebx, (%rax)
	jmp	.L201
.L287:
	leal	2(%rsi), %r15d
	cmpl	$7, %r15d
	jle	.L208
	leal	-6(%rsi), %ebx
	movl	%ebx, %r12d
	andl	$7, %r12d
	.p2align 4,,10
	.p2align 3
.L210:
	movl	%r13d, %ebp
	movq	8(%r14), %rdi
	movl	$1, %edx
	sarl	$16, %ebp
	leaq	113(%rsp), %rsi
	movb	%bpl, 113(%rsp)
	call	*(%r14)
	cmpb	$-1, %bpl
	jne	.L209
	movb	$0, 112(%rsp)
	movq	8(%r14), %rdi
	movl	$1, %edx
	leaq	112(%rsp), %rsi
	call	*(%r14)
.L209:
	subl	$8, %r15d
	sall	$8, %r13d
	cmpl	%r12d, %r15d
	jne	.L210
	andl	$7, %ebx
	movl	%ebx, %r15d
.L208:
	movq	16(%rsp), %rax
	movl	%r13d, (%rax)
	movq	24(%rsp), %rax
	movl	%r15d, (%rax)
	jmp	.L211
.L288:
	movl	%ebx, %ecx
	movl	%edx, 48(%rsp)
	sarl	$31, %ecx
	movl	%ecx, %r14d
	xorl	%ebx, %r14d
	subl	%ecx, %r14d
	xorl	%ecx, %ecx
	sarl	%r14d
	jmp	.L232
.L222:
	movq	16(%rsp), %rax
	leal	2(%r15), %ebx
	cmpl	$7, %ebx
	movl	(%rax), %r12d
	jle	.L252
	subl	$6, %r15d
	movl	%r15d, %r13d
	andl	$7, %r13d
	.p2align 4,,10
	.p2align 3
.L226:
	movl	%r12d, %ebp
	movq	8(%r14), %rdi
	movl	$1, %edx
	sarl	$16, %ebp
	leaq	119(%rsp), %rsi
	movb	%bpl, 119(%rsp)
	call	*(%r14)
	cmpb	$-1, %bpl
	jne	.L225
	movb	$0, 118(%rsp)
	movq	8(%r14), %rdi
	movl	$1, %edx
	leaq	118(%rsp), %rsi
	call	*(%r14)
.L225:
	subl	$8, %ebx
	sall	$8, %r12d
	cmpl	%r13d, %ebx
	jne	.L226
	jmp	.L285
.L289:
	movl	%edx, 48(%rsp)
	movl	$4, %esi
	movl	$1, (%rsp)
	jmp	.L241
.L258:
	movl	$4, %eax
	movl	$1, %r12d
	movl	$1, %r15d
	jmp	.L213
.L293:
	call	__stack_chk_fail
	.cfi_endproc
.LFE777:
	.size	stbiw__jpg_processDU.constprop.8, .-stbiw__jpg_processDU.constprop.8
	.p2align 4,,15
	.type	stbi_write_jpg_core.part.0, @function
stbi_write_jpg_core.part.0:
.LFB759:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$1960, %rsp
	.cfi_def_cfa_offset 2016
	movq	%fs:40, %rax
	movq	%rax, 1944(%rsp)
	xorl	%eax, %eax
	cmpl	$0, %r9d
	movl	%esi, 64(%rsp)
	movl	%edx, 84(%rsp)
	movl	%ecx, 184(%rsp)
	movq	%r8, 16(%rsp)
	movl	$20, %esi
	je	.L298
	movl	$5000, %esi
	jle	.L298
	movl	$100, %eax
	cmpl	$100, %r9d
	movl	%eax, %ecx
	cmovle	%r9d, %ecx
	cmpl	$49, %r9d
	jg	.L438
	movl	%esi, %eax
	cltd
	idivl	%ecx
	movl	%eax, %esi
.L298:
	xorl	%ecx, %ecx
	movl	$1374389535, %edi
	movl	$-1, %r8d
	.p2align 4,,10
	.p2align 3
.L301:
	movl	YQT.8735(,%rcx,4), %r9d
	imull	%esi, %r9d
	addl	$50, %r9d
	movl	%r9d, %eax
	sarl	$31, %r9d
	imull	%edi
	movl	$1, %eax
	sarl	$5, %edx
	subl	%r9d, %edx
	testl	%edx, %edx
	jle	.L299
	cmpl	$255, %edx
	movl	%edx, %eax
	cmovg	%r8d, %eax
.L299:
	movl	UVQT.8736(,%rcx,4), %r9d
	movzbl	stbiw__jpg_ZigZag(%rcx), %r10d
	imull	%esi, %r9d
	movb	%al, 1808(%rsp,%r10)
	addl	$50, %r9d
	movl	%r9d, %eax
	sarl	$31, %r9d
	imull	%edi
	movl	$1, %eax
	sarl	$5, %edx
	subl	%r9d, %edx
	testl	%edx, %edx
	jle	.L300
	cmpl	$255, %edx
	movl	%edx, %eax
	cmovg	%r8d, %eax
.L300:
	addq	$1, %rcx
	movb	%al, 1872(%rsp,%r10)
	cmpq	$64, %rcx
	jne	.L301
	leaq	256(%rsp), %r12
	leaq	512(%rsp), %r13
	movl	$stbiw__jpg_ZigZag, %eax
	movl	$aasf.8737, %ebp
	xorl	%ecx, %ecx
	movss	.LC12(%rip), %xmm7
	movss	.LC13(%rip), %xmm1
	movss	.LC14(%rip), %xmm11
.L302:
	movzbl	(%rax), %r10d
	pxor	%xmm2, %xmm2
	movss	0(%rbp), %xmm0
	movzbl	1(%rax), %r9d
	movaps	%xmm1, %xmm4
	movzbl	2(%rax), %r8d
	movaps	%xmm1, %xmm9
	movzbl	3(%rax), %edi
	movzbl	1872(%rsp,%r10), %edx
	movaps	%xmm1, %xmm6
	movzbl	4(%rax), %ebx
	movaps	%xmm1, %xmm10
	movzbl	5(%rax), %r11d
	movaps	%xmm1, %xmm3
	movzbl	6(%rax), %esi
	movaps	%xmm1, %xmm12
	cvtsi2ss	%edx, %xmm2
	movzbl	1872(%rsp,%r9), %edx
	addq	$8, %rax
	addq	$4, %rbp
	movaps	%xmm1, %xmm8
	movaps	%xmm1, %xmm5
	movaps	%xmm1, %xmm14
	movaps	%xmm1, %xmm13
	movaps	%xmm1, %xmm15
	mulss	%xmm0, %xmm2
	mulss	%xmm7, %xmm2
	divss	%xmm2, %xmm4
	pxor	%xmm2, %xmm2
	cvtsi2ss	%edx, %xmm2
	movzbl	1872(%rsp,%r8), %edx
	mulss	%xmm0, %xmm2
	mulss	%xmm11, %xmm2
	divss	%xmm2, %xmm9
	pxor	%xmm2, %xmm2
	cvtsi2ss	%edx, %xmm2
	movzbl	1872(%rsp,%rdi), %edx
	unpcklps	%xmm9, %xmm4
	mulss	%xmm0, %xmm2
	mulss	.LC15(%rip), %xmm2
	divss	%xmm2, %xmm6
	pxor	%xmm2, %xmm2
	cvtsi2ss	%edx, %xmm2
	movzbl	1872(%rsp,%rbx), %edx
	mulss	%xmm0, %xmm2
	mulss	.LC16(%rip), %xmm2
	divss	%xmm2, %xmm10
	pxor	%xmm2, %xmm2
	cvtsi2ss	%edx, %xmm2
	movzbl	1872(%rsp,%r11), %edx
	unpcklps	%xmm10, %xmm6
	movlhps	%xmm6, %xmm4
	mulss	%xmm0, %xmm2
	mulss	%xmm7, %xmm2
	divss	%xmm2, %xmm3
	pxor	%xmm2, %xmm2
	cvtsi2ss	%edx, %xmm2
	movzbl	1872(%rsp,%rsi), %edx
	mulss	%xmm0, %xmm2
	mulss	.LC17(%rip), %xmm2
	divss	%xmm2, %xmm12
	pxor	%xmm2, %xmm2
	cvtsi2ss	%edx, %xmm2
	movzbl	1808(%rsp,%rbx), %edx
	unpcklps	%xmm12, %xmm3
	mulss	%xmm0, %xmm2
	mulss	.LC18(%rip), %xmm2
	divss	%xmm2, %xmm8
	pxor	%xmm2, %xmm2
	cvtsi2ss	%edx, %xmm2
	movzbl	1808(%rsp,%r11), %edx
	mulss	%xmm0, %xmm2
	mulss	%xmm7, %xmm2
	divss	%xmm2, %xmm5
	pxor	%xmm2, %xmm2
	cvtsi2ss	%edx, %xmm2
	movzbl	1808(%rsp,%rsi), %edx
	movzbl	-1(%rax), %esi
	mulss	%xmm0, %xmm2
	mulss	.LC17(%rip), %xmm2
	divss	%xmm2, %xmm14
	pxor	%xmm2, %xmm2
	cvtsi2ss	%edx, %xmm2
	movzbl	1808(%rsp,%rsi), %edx
	unpcklps	%xmm14, %xmm5
	movaps	%xmm1, %xmm14
	mulss	%xmm0, %xmm2
	mulss	.LC18(%rip), %xmm2
	divss	%xmm2, %xmm13
	pxor	%xmm2, %xmm2
	cvtsi2ss	%edx, %xmm2
	movzbl	1808(%rsp,%r10), %edx
	mulss	%xmm0, %xmm2
	mulss	.LC19(%rip), %xmm2
	divss	%xmm2, %xmm15
	movaps	%xmm5, %xmm2
	movaps	%xmm1, %xmm5
	unpcklps	%xmm15, %xmm13
	movaps	%xmm1, %xmm15
	movlhps	%xmm13, %xmm2
	movaps	%xmm1, %xmm13
	movaps	%xmm2, (%rsp)
	pxor	%xmm2, %xmm2
	cvtsi2ss	%edx, %xmm2
	movzbl	1808(%rsp,%r9), %edx
	mulss	%xmm0, %xmm2
	mulss	%xmm7, %xmm2
	divss	%xmm2, %xmm13
	pxor	%xmm2, %xmm2
	cvtsi2ss	%edx, %xmm2
	movzbl	1808(%rsp,%r8), %edx
	mulss	%xmm0, %xmm2
	mulss	%xmm11, %xmm2
	divss	%xmm2, %xmm15
	pxor	%xmm2, %xmm2
	cvtsi2ss	%edx, %xmm2
	unpcklps	%xmm15, %xmm13
	mulss	%xmm0, %xmm2
	mulss	.LC15(%rip), %xmm2
	movzbl	1808(%rsp,%rdi), %edx
	movaps	%xmm4, 496(%rsp,%rcx)
	divss	%xmm2, %xmm14
	pxor	%xmm2, %xmm2
	cvtsi2ss	%edx, %xmm2
	movzbl	1872(%rsp,%rsi), %edx
	mulss	%xmm0, %xmm2
	mulss	.LC16(%rip), %xmm2
	divss	%xmm2, %xmm5
	pxor	%xmm2, %xmm2
	cvtsi2ss	%edx, %xmm2
	unpcklps	%xmm5, %xmm14
	movaps	(%rsp), %xmm5
	movlhps	%xmm14, %xmm13
	movaps	%xmm13, 240(%rsp,%rcx)
	movaps	%xmm5, (%r12,%rcx)
	movaps	%xmm1, %xmm5
	mulss	%xmm2, %xmm0
	mulss	.LC19(%rip), %xmm0
	divss	%xmm0, %xmm5
	unpcklps	%xmm5, %xmm8
	movlhps	%xmm8, %xmm3
	movaps	%xmm3, 0(%r13,%rcx)
	addq	$32, %rcx
	cmpq	$stbiw__jpg_ZigZag+64, %rax
	jne	.L302
	movl	$25, %edx
	movl	$head0.8757, %esi
	movl	84(%rsp), %eax
	movl	64(%rsp), %ebx
	movq	8(%r14), %rdi
	movl	$285262079, 1776(%rsp)
	movb	$8, 1780(%rsp)
	movl	$-989921007, 1793(%rsp)
	movb	%ah, 1781(%rsp)
	movl	%eax, %r15d
	movb	%al, 1782(%rsp)
	movb	%bh, 1783(%rsp)
	movabsq	$216472957379215619, %rax
	movb	%bl, 1784(%rsp)
	movl	$-24063, %ebx
	movq	%rax, 1785(%rsp)
	movb	$0, 1799(%rsp)
	movw	%bx, 1797(%rsp)
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$64, %edx
	leaq	1808(%rsp), %rsi
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$1, %edx
	leaq	210(%rsp), %rsi
	movb	$1, 210(%rsp)
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$64, %edx
	leaq	1872(%rsp), %rsi
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$24, %edx
	leaq	1776(%rsp), %rsi
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$16, %edx
	movl	$std_dc_luminance_nrcodes.8723+1, %esi
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$12, %edx
	movl	$std_dc_luminance_values.8724, %esi
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$1, %edx
	leaq	211(%rsp), %rsi
	movb	$16, 211(%rsp)
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$16, %edx
	movl	$std_ac_luminance_nrcodes.8725+1, %esi
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$162, %edx
	movl	$std_ac_luminance_values.8726, %esi
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$1, %edx
	leaq	212(%rsp), %rsi
	movb	$1, 212(%rsp)
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$16, %edx
	movl	$std_dc_chrominance_nrcodes.8727+1, %esi
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$12, %edx
	movl	$std_dc_chrominance_values.8728, %esi
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$1, %edx
	leaq	213(%rsp), %rsi
	movb	$17, 213(%rsp)
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$16, %edx
	movl	$std_ac_chrominance_nrcodes.8729+1, %esi
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$162, %edx
	movl	$std_ac_chrominance_values.8730, %esi
	call	*(%r14)
	movq	8(%r14), %rdi
	movl	$14, %edx
	movl	$head2.8758, %esi
	call	*(%r14)
	cmpl	$2, 184(%rsp)
	movl	$0, 232(%rsp)
	movl	$0, 236(%rsp)
	setg	159(%rsp)
	movzbl	159(%rsp), %ebx
	testl	%r15d, %r15d
	leal	(%rbx,%rbx), %eax
	movl	%ebx, 188(%rsp)
	movl	%eax, 192(%rsp)
	jle	.L439
	movl	64(%rsp), %edi
	movl	184(%rsp), %ebx
	xorl	%r13d, %r13d
	movl	84(%rsp), %edx
	movl	%r13d, %r15d
	movq	16(%rsp), %r13
	movl	$0, 112(%rsp)
	movl	$0, 136(%rsp)
	imull	%edi, %ebx
	movl	$0, 132(%rsp)
	movl	$0, 124(%rsp)
	leal	-1(%rdx), %ecx
	movl	$0, 152(%rsp)
	leal	0(,%rbx,8), %eax
	movl	%ebx, 92(%rsp)
	movl	%ecx, 160(%rsp)
	movl	%eax, 200(%rsp)
	movl	$1, %eax
	subl	%edx, %eax
	imull	%ebx, %eax
	movl	%eax, 164(%rsp)
	movl	%ecx, %eax
	andl	$-8, %eax
	addl	$8, %eax
	movl	%eax, 204(%rsp)
	leaq	232(%rsp), %rax
	movq	%rax, 168(%rsp)
	leaq	236(%rsp), %rax
	movq	%rax, 176(%rsp)
	leal	-1(%rdi), %eax
	andl	$-8, %eax
	addl	$8, %eax
	movl	%eax, 196(%rsp)
.L305:
	movl	64(%rsp), %eax
	testl	%eax, %eax
	jle	.L371
	movl	152(%rsp), %eax
	movl	$7, 128(%rsp)
	movl	$6, 116(%rsp)
	movl	$5, 108(%rsp)
	movl	$4, 104(%rsp)
	movl	$3, 100(%rsp)
	addl	$7, %eax
	movl	$2, 80(%rsp)
	movl	$1, 68(%rsp)
	movl	%eax, 88(%rsp)
	movq	%r13, %rax
	movl	$8, 120(%rsp)
	movq	%r14, %r13
	movl	$0, (%rsp)
	movl	%r15d, %r14d
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L372:
	movl	stbi__flip_vertically_on_write(%rip), %eax
	movl	120(%rsp), %ebp
	movl	$1, %ecx
	movslq	192(%rsp), %rdx
	movl	160(%rsp), %r10d
	movl	%r14d, 140(%rsp)
	movl	164(%rsp), %ebx
	movl	%eax, 32(%rsp)
	movl	64(%rsp), %eax
	movl	%r10d, 16(%rsp)
	movl	152(%rsp), %r12d
	movq	%rdx, 72(%rsp)
	movl	%edx, %r14d
	movl	188(%rsp), %r10d
	cmpl	%ebp, %eax
	movl	128(%rsp), %r9d
	movq	%r13, 144(%rsp)
	cmovle	%eax, %ebp
	movzbl	159(%rsp), %eax
	xorl	%edi, %edi
	movl	184(%rsp), %r8d
	movq	%rax, 48(%rsp)
	jmp	.L369
	.p2align 4,,10
	.p2align 3
.L440:
	cmpl	%r11d, %esi
	jle	.L308
	leal	(%rdx,%r11), %esi
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	imull	%r8d, %esi
	pxor	%xmm3, %xmm3
	movss	.LC21(%rip), %xmm2
	movss	.LC20(%rip), %xmm4
	subl	%ebx, %esi
	movslq	%esi, %rax
	movzbl	(%r15,%rax), %eax
	cvtsi2ss	%eax, %xmm0
	leal	(%r10,%rsi), %eax
	addl	%r14d, %esi
	movslq	%esi, %rsi
	cltq
	movzbl	(%r15,%rax), %eax
	cvtsi2ss	%eax, %xmm1
	movzbl	(%r15,%rsi), %eax
	movl	68(%rsp), %esi
	cmpl	%esi, %ebp
	cvtsi2ss	%eax, %xmm3
	movl	%ecx, %eax
	mulss	%xmm0, %xmm2
	mulss	%xmm1, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC22(%rip), %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC25(%rip), %xmm4
	mulss	%xmm1, %xmm4
	mulss	.LC26(%rip), %xmm1
	subss	.LC23(%rip), %xmm2
	movss	%xmm2, 752(%rsp,%rdi)
	movss	.LC24(%rip), %xmm2
	mulss	%xmm0, %xmm2
	mulss	.LC11(%rip), %xmm0
	subss	%xmm4, %xmm2
	movss	.LC11(%rip), %xmm4
	mulss	%xmm3, %xmm4
	mulss	.LC27(%rip), %xmm3
	subss	%xmm1, %xmm0
	addss	%xmm4, %xmm2
	subss	%xmm3, %xmm0
	movss	%xmm2, 1008(%rsp,%rdi)
	movss	%xmm0, 1264(%rsp,%rdi)
	jle	.L392
	addl	%edx, %esi
	pxor	%xmm0, %xmm0
	imull	%r8d, %esi
	pxor	%xmm1, %xmm1
	pxor	%xmm3, %xmm3
	movss	.LC21(%rip), %xmm2
	subl	%ebx, %esi
	movss	.LC20(%rip), %xmm4
	movslq	%esi, %rax
	movzbl	(%r15,%rax), %eax
	cvtsi2ss	%eax, %xmm0
	leal	(%r10,%rsi), %eax
	addl	%r14d, %esi
	movslq	%esi, %rsi
	cltq
	movzbl	(%r15,%rax), %eax
	cvtsi2ss	%eax, %xmm1
	movzbl	(%r15,%rsi), %eax
	movl	80(%rsp), %esi
	cmpl	%esi, %ebp
	cvtsi2ss	%eax, %xmm3
	movslq	%ecx, %rax
	mulss	%xmm0, %xmm2
	mulss	%xmm1, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC22(%rip), %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC25(%rip), %xmm4
	mulss	%xmm1, %xmm4
	mulss	.LC26(%rip), %xmm1
	subss	.LC23(%rip), %xmm2
	movss	%xmm2, 752(%rsp,%rax,4)
	movss	.LC24(%rip), %xmm2
	mulss	%xmm0, %xmm2
	mulss	.LC11(%rip), %xmm0
	subss	%xmm4, %xmm2
	movss	.LC11(%rip), %xmm4
	mulss	%xmm3, %xmm4
	mulss	.LC27(%rip), %xmm3
	subss	%xmm1, %xmm0
	addss	%xmm4, %xmm2
	subss	%xmm3, %xmm0
	movss	%xmm2, 1008(%rsp,%rax,4)
	movss	%xmm0, 1264(%rsp,%rax,4)
	leal	1(%rcx), %eax
	jle	.L392
	leal	(%rdx,%rsi), %r11d
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cltq
	imull	%r8d, %r11d
	pxor	%xmm3, %xmm3
	movss	.LC21(%rip), %xmm2
	movss	.LC20(%rip), %xmm4
	subl	%ebx, %r11d
	movslq	%r11d, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm0
	leal	(%r10,%r11), %esi
	addl	%r14d, %r11d
	movslq	%r11d, %r11
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm1
	movzbl	(%r15,%r11), %esi
	cvtsi2ss	%esi, %xmm3
	movl	100(%rsp), %esi
	mulss	%xmm0, %xmm2
	cmpl	%esi, %ebp
	mulss	%xmm1, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC22(%rip), %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC25(%rip), %xmm4
	mulss	%xmm1, %xmm4
	mulss	.LC26(%rip), %xmm1
	subss	.LC23(%rip), %xmm2
	movss	%xmm2, 752(%rsp,%rax,4)
	movss	.LC24(%rip), %xmm2
	mulss	%xmm0, %xmm2
	mulss	.LC11(%rip), %xmm0
	subss	%xmm4, %xmm2
	movss	.LC11(%rip), %xmm4
	mulss	%xmm3, %xmm4
	mulss	.LC27(%rip), %xmm3
	subss	%xmm1, %xmm0
	addss	%xmm4, %xmm2
	subss	%xmm3, %xmm0
	movss	%xmm2, 1008(%rsp,%rax,4)
	movss	%xmm0, 1264(%rsp,%rax,4)
	leal	2(%rcx), %eax
	jle	.L392
	leal	(%rdx,%rsi), %r11d
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cltq
	imull	%r8d, %r11d
	pxor	%xmm3, %xmm3
	movss	.LC21(%rip), %xmm2
	movss	.LC20(%rip), %xmm4
	subl	%ebx, %r11d
	movslq	%r11d, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm0
	leal	(%r10,%r11), %esi
	addl	%r14d, %r11d
	movslq	%r11d, %r11
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm1
	movzbl	(%r15,%r11), %esi
	cvtsi2ss	%esi, %xmm3
	movl	104(%rsp), %esi
	mulss	%xmm0, %xmm2
	cmpl	%esi, %ebp
	mulss	%xmm1, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC22(%rip), %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC25(%rip), %xmm4
	mulss	%xmm1, %xmm4
	mulss	.LC26(%rip), %xmm1
	subss	.LC23(%rip), %xmm2
	movss	%xmm2, 752(%rsp,%rax,4)
	movss	.LC24(%rip), %xmm2
	mulss	%xmm0, %xmm2
	mulss	.LC11(%rip), %xmm0
	subss	%xmm4, %xmm2
	movss	.LC11(%rip), %xmm4
	mulss	%xmm3, %xmm4
	mulss	.LC27(%rip), %xmm3
	subss	%xmm1, %xmm0
	addss	%xmm4, %xmm2
	subss	%xmm3, %xmm0
	movss	%xmm2, 1008(%rsp,%rax,4)
	movss	%xmm0, 1264(%rsp,%rax,4)
	leal	3(%rcx), %eax
	jle	.L392
	leal	(%rdx,%rsi), %r11d
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cltq
	imull	%r8d, %r11d
	pxor	%xmm3, %xmm3
	movss	.LC21(%rip), %xmm2
	movss	.LC20(%rip), %xmm4
	subl	%ebx, %r11d
	movslq	%r11d, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm0
	leal	(%r10,%r11), %esi
	addl	%r14d, %r11d
	movslq	%r11d, %r11
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm1
	movzbl	(%r15,%r11), %esi
	cvtsi2ss	%esi, %xmm3
	movl	108(%rsp), %esi
	mulss	%xmm0, %xmm2
	cmpl	%esi, %ebp
	mulss	%xmm1, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC22(%rip), %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC25(%rip), %xmm4
	mulss	%xmm1, %xmm4
	mulss	.LC26(%rip), %xmm1
	subss	.LC23(%rip), %xmm2
	movss	%xmm2, 752(%rsp,%rax,4)
	movss	.LC24(%rip), %xmm2
	mulss	%xmm0, %xmm2
	mulss	.LC11(%rip), %xmm0
	subss	%xmm4, %xmm2
	movss	.LC11(%rip), %xmm4
	mulss	%xmm3, %xmm4
	mulss	.LC27(%rip), %xmm3
	subss	%xmm1, %xmm0
	addss	%xmm4, %xmm2
	subss	%xmm3, %xmm0
	movss	%xmm2, 1008(%rsp,%rax,4)
	movss	%xmm0, 1264(%rsp,%rax,4)
	leal	4(%rcx), %eax
	jle	.L392
	leal	(%rdx,%rsi), %r11d
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cltq
	imull	%r8d, %r11d
	pxor	%xmm3, %xmm3
	movss	.LC21(%rip), %xmm2
	movss	.LC20(%rip), %xmm4
	subl	%ebx, %r11d
	movslq	%r11d, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm0
	leal	(%r10,%r11), %esi
	addl	%r14d, %r11d
	movslq	%r11d, %r11
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm1
	movzbl	(%r15,%r11), %esi
	cvtsi2ss	%esi, %xmm3
	movl	116(%rsp), %esi
	mulss	%xmm0, %xmm2
	cmpl	%esi, %ebp
	mulss	%xmm1, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC22(%rip), %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC25(%rip), %xmm4
	mulss	%xmm1, %xmm4
	mulss	.LC26(%rip), %xmm1
	subss	.LC23(%rip), %xmm2
	movss	%xmm2, 752(%rsp,%rax,4)
	movss	.LC24(%rip), %xmm2
	mulss	%xmm0, %xmm2
	mulss	.LC11(%rip), %xmm0
	subss	%xmm4, %xmm2
	movss	.LC11(%rip), %xmm4
	mulss	%xmm3, %xmm4
	mulss	.LC27(%rip), %xmm3
	subss	%xmm1, %xmm0
	addss	%xmm4, %xmm2
	subss	%xmm3, %xmm0
	movss	%xmm2, 1008(%rsp,%rax,4)
	movss	%xmm0, 1264(%rsp,%rax,4)
	leal	5(%rcx), %eax
	jle	.L392
	leal	(%rdx,%rsi), %r11d
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cltq
	imull	%r8d, %r11d
	pxor	%xmm3, %xmm3
	movss	.LC21(%rip), %xmm2
	movss	.LC20(%rip), %xmm4
	subl	%ebx, %r11d
	movslq	%r11d, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm0
	leal	(%r10,%r11), %esi
	addl	%r14d, %r11d
	cmpl	%r9d, %ebp
	movslq	%r11d, %r11
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm1
	movzbl	(%r15,%r11), %esi
	cvtsi2ss	%esi, %xmm3
	mulss	%xmm0, %xmm2
	mulss	%xmm1, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC22(%rip), %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC25(%rip), %xmm4
	mulss	%xmm1, %xmm4
	mulss	.LC26(%rip), %xmm1
	subss	.LC23(%rip), %xmm2
	movss	%xmm2, 752(%rsp,%rax,4)
	movss	.LC24(%rip), %xmm2
	mulss	%xmm0, %xmm2
	mulss	.LC11(%rip), %xmm0
	subss	%xmm4, %xmm2
	movss	.LC11(%rip), %xmm4
	mulss	%xmm3, %xmm4
	mulss	.LC27(%rip), %xmm3
	subss	%xmm1, %xmm0
	addss	%xmm4, %xmm2
	subss	%xmm3, %xmm0
	movss	%xmm2, 1008(%rsp,%rax,4)
	movss	%xmm0, 1264(%rsp,%rax,4)
	leal	6(%rcx), %eax
	jle	.L393
	leal	(%rdx,%r9), %r11d
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cltq
	imull	%r8d, %r11d
	pxor	%xmm3, %xmm3
	movss	.LC21(%rip), %xmm2
	movss	.LC20(%rip), %xmm4
	subl	%ebx, %r11d
	movslq	%r11d, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm0
	leal	(%r10,%r11), %esi
	addl	%r14d, %r11d
	movslq	%r11d, %r11
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm1
	movzbl	(%r15,%r11), %esi
	movl	120(%rsp), %r11d
	cvtsi2ss	%esi, %xmm3
	mulss	%xmm0, %xmm2
	mulss	%xmm1, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC22(%rip), %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC25(%rip), %xmm4
	mulss	%xmm1, %xmm4
	mulss	.LC26(%rip), %xmm1
	subss	.LC23(%rip), %xmm2
	movss	%xmm2, 752(%rsp,%rax,4)
	movss	.LC24(%rip), %xmm2
	mulss	%xmm0, %xmm2
	mulss	.LC11(%rip), %xmm0
	subss	%xmm4, %xmm2
	movss	.LC11(%rip), %xmm4
	mulss	%xmm3, %xmm4
	mulss	.LC27(%rip), %xmm3
	subss	%xmm1, %xmm0
	addss	%xmm4, %xmm2
	subss	%xmm3, %xmm0
	movss	%xmm2, 1008(%rsp,%rax,4)
	movss	%xmm0, 1264(%rsp,%rax,4)
	leal	7(%rcx), %eax
.L307:
	cmpl	%r9d, %r11d
	jg	.L314
.L308:
	addl	%r11d, %edx
	movslq	%ebx, %rsi
	imull	%r8d, %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm3, %xmm3
	pxor	%xmm4, %xmm4
	movss	.LC20(%rip), %xmm1
	movslq	%edx, %rdx
	movss	.LC21(%rip), %xmm2
	subq	%rsi, %rdx
	leal	1(%r11), %esi
	movss	.LC25(%rip), %xmm5
	movl	%esi, %r13d
	subl	64(%rsp), %r13d
	movl	%esi, 96(%rsp)
	movq	%rdx, %rsi
	imull	%r8d, %r13d
	movslq	%r13d, %r13
	subq	%r13, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm0
	movq	48(%rsp), %rsi
	addq	%rdx, %rsi
	addq	72(%rsp), %rdx
	subq	%r13, %rsi
	movzbl	(%r15,%rsi), %esi
	subq	%r13, %rdx
	cmpl	%r9d, 96(%rsp)
	movzbl	(%r15,%rdx), %edx
	cvtsi2ss	%esi, %xmm3
	cvtsi2ss	%edx, %xmm4
	movslq	%eax, %rdx
	mulss	%xmm0, %xmm2
	mulss	%xmm3, %xmm1
	mulss	%xmm3, %xmm5
	mulss	.LC26(%rip), %xmm3
	addss	%xmm2, %xmm1
	movss	.LC22(%rip), %xmm2
	mulss	%xmm4, %xmm2
	addss	%xmm2, %xmm1
	movss	.LC24(%rip), %xmm2
	mulss	%xmm0, %xmm2
	mulss	.LC11(%rip), %xmm0
	subss	.LC23(%rip), %xmm1
	subss	%xmm5, %xmm2
	movss	.LC11(%rip), %xmm5
	mulss	%xmm4, %xmm5
	mulss	.LC27(%rip), %xmm4
	subss	%xmm3, %xmm0
	addss	%xmm5, %xmm2
	movss	%xmm1, 752(%rsp,%rdx,4)
	subss	%xmm4, %xmm0
	movss	%xmm2, 1008(%rsp,%rdx,4)
	movss	%xmm0, 1264(%rsp,%rdx,4)
	leal	1(%rax), %edx
	jg	.L314
	leal	2(%r11), %esi
	movslq	%edx, %rdx
	movss	%xmm1, 752(%rsp,%rdx,4)
	cmpl	%r9d, %esi
	movss	%xmm2, 1008(%rsp,%rdx,4)
	movss	%xmm0, 1264(%rsp,%rdx,4)
	leal	2(%rax), %edx
	jg	.L314
	leal	3(%r11), %esi
	movslq	%edx, %rdx
	movss	%xmm1, 752(%rsp,%rdx,4)
	cmpl	%r9d, %esi
	movss	%xmm2, 1008(%rsp,%rdx,4)
	movss	%xmm0, 1264(%rsp,%rdx,4)
	leal	3(%rax), %edx
	jg	.L314
	leal	4(%r11), %esi
	movslq	%edx, %rdx
	movss	%xmm1, 752(%rsp,%rdx,4)
	cmpl	%esi, %r9d
	movss	%xmm2, 1008(%rsp,%rdx,4)
	movss	%xmm0, 1264(%rsp,%rdx,4)
	leal	4(%rax), %edx
	jl	.L314
	leal	5(%r11), %esi
	movslq	%edx, %rdx
	movss	%xmm1, 752(%rsp,%rdx,4)
	cmpl	%esi, %r9d
	movss	%xmm2, 1008(%rsp,%rdx,4)
	movss	%xmm0, 1264(%rsp,%rdx,4)
	leal	5(%rax), %edx
	jl	.L314
	leal	6(%r11), %esi
	movslq	%edx, %rdx
	movss	%xmm1, 752(%rsp,%rdx,4)
	cmpl	%esi, %r9d
	movss	%xmm2, 1008(%rsp,%rdx,4)
	movss	%xmm0, 1264(%rsp,%rdx,4)
	leal	6(%rax), %edx
	jl	.L314
	addl	$7, %r11d
	movslq	%edx, %rdx
	addl	$7, %eax
	cmpl	%r11d, %r9d
	movss	%xmm1, 752(%rsp,%rdx,4)
	movss	%xmm2, 1008(%rsp,%rdx,4)
	movss	%xmm0, 1264(%rsp,%rdx,4)
	jl	.L314
.L435:
	cltq
	movss	%xmm1, 752(%rsp,%rax,4)
	movss	%xmm2, 1008(%rsp,%rax,4)
	movss	%xmm0, 1264(%rsp,%rax,4)
.L314:
	addl	$1, %r12d
	subl	$1, 16(%rsp)
	addl	$8, %ecx
	addl	92(%rsp), %ebx
	addq	$32, %rdi
	cmpl	88(%rsp), %r12d
	jg	.L309
.L369:
	movl	32(%rsp), %r11d
	movl	16(%rsp), %edx
	leal	-1(%rcx), %eax
	movl	64(%rsp), %esi
	testl	%r11d, %r11d
	movl	(%rsp), %r11d
	cmove	%r12d, %edx
	imull	%esi, %edx
	cmpl	%r12d, 84(%rsp)
	jle	.L440
	cmpl	%r11d, 64(%rsp)
	jg	.L441
	movl	%r11d, %esi
.L312:
	leal	1(%rsi), %r11d
	addl	%esi, %edx
	pxor	%xmm0, %xmm0
	movss	.LC20(%rip), %xmm1
	movl	%r11d, %r13d
	subl	64(%rsp), %r13d
	pxor	%xmm3, %xmm3
	movss	.LC21(%rip), %xmm2
	pxor	%xmm4, %xmm4
	movss	.LC25(%rip), %xmm5
	subl	%r13d, %edx
	imull	%r8d, %edx
	movslq	%edx, %rdx
	movzbl	(%r15,%rdx), %r13d
	addq	%r15, %rdx
	cmpl	%r9d, %r11d
	cvtsi2ss	%r13d, %xmm0
	movq	48(%rsp), %r13
	movzbl	(%rdx,%r13), %r13d
	cvtsi2ss	%r13d, %xmm3
	movq	72(%rsp), %r13
	movzbl	(%rdx,%r13), %edx
	mulss	%xmm0, %xmm2
	cvtsi2ss	%edx, %xmm4
	movslq	%eax, %rdx
	mulss	%xmm3, %xmm1
	mulss	%xmm3, %xmm5
	mulss	.LC26(%rip), %xmm3
	addss	%xmm2, %xmm1
	movss	.LC22(%rip), %xmm2
	mulss	%xmm4, %xmm2
	addss	%xmm2, %xmm1
	movss	.LC24(%rip), %xmm2
	mulss	%xmm0, %xmm2
	mulss	.LC11(%rip), %xmm0
	subss	.LC23(%rip), %xmm1
	subss	%xmm5, %xmm2
	movss	.LC11(%rip), %xmm5
	mulss	%xmm4, %xmm5
	mulss	.LC27(%rip), %xmm4
	subss	%xmm3, %xmm0
	addss	%xmm5, %xmm2
	movss	%xmm1, 752(%rsp,%rdx,4)
	subss	%xmm4, %xmm0
	movss	%xmm2, 1008(%rsp,%rdx,4)
	movss	%xmm0, 1264(%rsp,%rdx,4)
	leal	1(%rax), %edx
	jg	.L314
	leal	2(%rsi), %r11d
	movslq	%edx, %rdx
	movss	%xmm1, 752(%rsp,%rdx,4)
	cmpl	%r9d, %r11d
	movss	%xmm2, 1008(%rsp,%rdx,4)
	movss	%xmm0, 1264(%rsp,%rdx,4)
	leal	2(%rax), %edx
	jg	.L314
	leal	3(%rsi), %r11d
	movslq	%edx, %rdx
	movss	%xmm1, 752(%rsp,%rdx,4)
	cmpl	%r9d, %r11d
	movss	%xmm2, 1008(%rsp,%rdx,4)
	movss	%xmm0, 1264(%rsp,%rdx,4)
	leal	3(%rax), %edx
	jg	.L314
	leal	4(%rsi), %r11d
	movslq	%edx, %rdx
	movss	%xmm1, 752(%rsp,%rdx,4)
	cmpl	%r9d, %r11d
	movss	%xmm2, 1008(%rsp,%rdx,4)
	movss	%xmm0, 1264(%rsp,%rdx,4)
	leal	4(%rax), %edx
	jg	.L314
	leal	5(%rsi), %r11d
	movslq	%edx, %rdx
	movss	%xmm1, 752(%rsp,%rdx,4)
	cmpl	%r9d, %r11d
	movss	%xmm2, 1008(%rsp,%rdx,4)
	movss	%xmm0, 1264(%rsp,%rdx,4)
	leal	5(%rax), %edx
	jg	.L314
	leal	6(%rsi), %r11d
	movslq	%edx, %rdx
	movss	%xmm1, 752(%rsp,%rdx,4)
	cmpl	%r9d, %r11d
	movss	%xmm2, 1008(%rsp,%rdx,4)
	movss	%xmm0, 1264(%rsp,%rdx,4)
	leal	6(%rax), %edx
	jg	.L314
	addl	$7, %esi
	movslq	%edx, %rdx
	addl	$7, %eax
	cmpl	%r9d, %esi
	movss	%xmm1, 752(%rsp,%rdx,4)
	movss	%xmm2, 1008(%rsp,%rdx,4)
	movss	%xmm0, 1264(%rsp,%rdx,4)
	jle	.L435
	jmp	.L314
.L441:
	leal	(%rdx,%r11), %esi
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	imull	%r8d, %esi
	pxor	%xmm3, %xmm3
	movss	.LC20(%rip), %xmm2
	movss	.LC21(%rip), %xmm4
	movslq	%esi, %rax
	movzbl	(%r15,%rax), %eax
	cvtsi2ss	%eax, %xmm0
	leal	(%r10,%rsi), %eax
	addl	%r14d, %esi
	movslq	%esi, %rsi
	cltq
	movzbl	(%r15,%rax), %eax
	cvtsi2ss	%eax, %xmm1
	movzbl	(%r15,%rsi), %eax
	movl	68(%rsp), %esi
	cmpl	%esi, %ebp
	cvtsi2ss	%eax, %xmm3
	movl	%ecx, %eax
	mulss	%xmm0, %xmm4
	mulss	%xmm1, %xmm2
	addss	%xmm4, %xmm2
	movss	.LC22(%rip), %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC25(%rip), %xmm4
	mulss	%xmm1, %xmm4
	mulss	.LC26(%rip), %xmm1
	subss	.LC23(%rip), %xmm2
	movss	%xmm2, 752(%rsp,%rdi)
	movss	.LC24(%rip), %xmm2
	mulss	%xmm0, %xmm2
	mulss	.LC11(%rip), %xmm0
	subss	%xmm4, %xmm2
	movss	.LC11(%rip), %xmm4
	mulss	%xmm3, %xmm4
	mulss	.LC27(%rip), %xmm3
	subss	%xmm1, %xmm0
	addss	%xmm4, %xmm2
	subss	%xmm3, %xmm0
	movss	%xmm2, 1008(%rsp,%rdi)
	movss	%xmm0, 1264(%rsp,%rdi)
	jle	.L313
	addl	%edx, %esi
	pxor	%xmm0, %xmm0
	imull	%r8d, %esi
	pxor	%xmm1, %xmm1
	pxor	%xmm3, %xmm3
	movss	.LC20(%rip), %xmm2
	movslq	%esi, %rax
	movss	.LC21(%rip), %xmm4
	movzbl	(%r15,%rax), %eax
	cvtsi2ss	%eax, %xmm0
	leal	(%r10,%rsi), %eax
	addl	%r14d, %esi
	movslq	%esi, %rsi
	cltq
	movzbl	(%r15,%rax), %eax
	cvtsi2ss	%eax, %xmm1
	movzbl	(%r15,%rsi), %eax
	movl	80(%rsp), %esi
	cmpl	%esi, %ebp
	cvtsi2ss	%eax, %xmm3
	movslq	%ecx, %rax
	mulss	%xmm0, %xmm4
	mulss	%xmm1, %xmm2
	addss	%xmm4, %xmm2
	movss	.LC22(%rip), %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC25(%rip), %xmm4
	mulss	%xmm1, %xmm4
	mulss	.LC26(%rip), %xmm1
	subss	.LC23(%rip), %xmm2
	movss	%xmm2, 752(%rsp,%rax,4)
	movss	.LC24(%rip), %xmm2
	mulss	%xmm0, %xmm2
	mulss	.LC11(%rip), %xmm0
	subss	%xmm4, %xmm2
	movss	.LC11(%rip), %xmm4
	mulss	%xmm3, %xmm4
	mulss	.LC27(%rip), %xmm3
	subss	%xmm1, %xmm0
	addss	%xmm4, %xmm2
	subss	%xmm3, %xmm0
	movss	%xmm2, 1008(%rsp,%rax,4)
	movss	%xmm0, 1264(%rsp,%rax,4)
	leal	1(%rcx), %eax
	jle	.L313
	leal	(%rdx,%rsi), %r11d
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cltq
	imull	%r8d, %r11d
	pxor	%xmm3, %xmm3
	movss	.LC20(%rip), %xmm2
	movss	.LC21(%rip), %xmm4
	movslq	%r11d, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm0
	leal	(%r10,%r11), %esi
	addl	%r14d, %r11d
	movslq	%r11d, %r11
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm1
	movzbl	(%r15,%r11), %esi
	cvtsi2ss	%esi, %xmm3
	movl	100(%rsp), %esi
	mulss	%xmm0, %xmm4
	cmpl	%esi, %ebp
	mulss	%xmm1, %xmm2
	addss	%xmm4, %xmm2
	movss	.LC22(%rip), %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC25(%rip), %xmm4
	mulss	%xmm1, %xmm4
	mulss	.LC26(%rip), %xmm1
	subss	.LC23(%rip), %xmm2
	movss	%xmm2, 752(%rsp,%rax,4)
	movss	.LC24(%rip), %xmm2
	mulss	%xmm0, %xmm2
	mulss	.LC11(%rip), %xmm0
	subss	%xmm4, %xmm2
	movss	.LC11(%rip), %xmm4
	mulss	%xmm3, %xmm4
	mulss	.LC27(%rip), %xmm3
	subss	%xmm1, %xmm0
	addss	%xmm4, %xmm2
	subss	%xmm3, %xmm0
	movss	%xmm2, 1008(%rsp,%rax,4)
	movss	%xmm0, 1264(%rsp,%rax,4)
	leal	2(%rcx), %eax
	jle	.L313
	leal	(%rdx,%rsi), %r11d
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cltq
	imull	%r8d, %r11d
	pxor	%xmm3, %xmm3
	movss	.LC20(%rip), %xmm2
	movss	.LC21(%rip), %xmm4
	movslq	%r11d, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm0
	leal	(%r10,%r11), %esi
	addl	%r14d, %r11d
	movslq	%r11d, %r11
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm1
	movzbl	(%r15,%r11), %esi
	cvtsi2ss	%esi, %xmm3
	movl	104(%rsp), %esi
	mulss	%xmm0, %xmm4
	cmpl	%esi, %ebp
	mulss	%xmm1, %xmm2
	addss	%xmm4, %xmm2
	movss	.LC22(%rip), %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC25(%rip), %xmm4
	mulss	%xmm1, %xmm4
	mulss	.LC26(%rip), %xmm1
	subss	.LC23(%rip), %xmm2
	movss	%xmm2, 752(%rsp,%rax,4)
	movss	.LC24(%rip), %xmm2
	mulss	%xmm0, %xmm2
	mulss	.LC11(%rip), %xmm0
	subss	%xmm4, %xmm2
	movss	.LC11(%rip), %xmm4
	mulss	%xmm3, %xmm4
	mulss	.LC27(%rip), %xmm3
	subss	%xmm1, %xmm0
	addss	%xmm4, %xmm2
	subss	%xmm3, %xmm0
	movss	%xmm2, 1008(%rsp,%rax,4)
	movss	%xmm0, 1264(%rsp,%rax,4)
	leal	3(%rcx), %eax
	jle	.L313
	leal	(%rdx,%rsi), %r11d
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cltq
	imull	%r8d, %r11d
	pxor	%xmm3, %xmm3
	movss	.LC20(%rip), %xmm2
	movss	.LC21(%rip), %xmm4
	movslq	%r11d, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm0
	leal	(%r10,%r11), %esi
	addl	%r14d, %r11d
	movslq	%r11d, %r11
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm1
	movzbl	(%r15,%r11), %esi
	cvtsi2ss	%esi, %xmm3
	movl	108(%rsp), %esi
	mulss	%xmm0, %xmm4
	cmpl	%esi, %ebp
	mulss	%xmm1, %xmm2
	addss	%xmm4, %xmm2
	movss	.LC22(%rip), %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC25(%rip), %xmm4
	mulss	%xmm1, %xmm4
	mulss	.LC26(%rip), %xmm1
	subss	.LC23(%rip), %xmm2
	movss	%xmm2, 752(%rsp,%rax,4)
	movss	.LC24(%rip), %xmm2
	mulss	%xmm0, %xmm2
	mulss	.LC11(%rip), %xmm0
	subss	%xmm4, %xmm2
	movss	.LC11(%rip), %xmm4
	mulss	%xmm3, %xmm4
	mulss	.LC27(%rip), %xmm3
	subss	%xmm1, %xmm0
	addss	%xmm4, %xmm2
	subss	%xmm3, %xmm0
	movss	%xmm2, 1008(%rsp,%rax,4)
	movss	%xmm0, 1264(%rsp,%rax,4)
	leal	4(%rcx), %eax
	jle	.L313
	leal	(%rdx,%rsi), %r11d
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cltq
	imull	%r8d, %r11d
	pxor	%xmm3, %xmm3
	movss	.LC20(%rip), %xmm2
	movss	.LC21(%rip), %xmm4
	movslq	%r11d, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm0
	leal	(%r10,%r11), %esi
	addl	%r14d, %r11d
	movslq	%r11d, %r11
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm1
	movzbl	(%r15,%r11), %esi
	cvtsi2ss	%esi, %xmm3
	movl	116(%rsp), %esi
	mulss	%xmm0, %xmm4
	cmpl	%esi, %ebp
	mulss	%xmm1, %xmm2
	addss	%xmm4, %xmm2
	movss	.LC22(%rip), %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC25(%rip), %xmm4
	mulss	%xmm1, %xmm4
	mulss	.LC26(%rip), %xmm1
	subss	.LC23(%rip), %xmm2
	movss	%xmm2, 752(%rsp,%rax,4)
	movss	.LC24(%rip), %xmm2
	mulss	%xmm0, %xmm2
	mulss	.LC11(%rip), %xmm0
	subss	%xmm4, %xmm2
	movss	.LC11(%rip), %xmm4
	mulss	%xmm3, %xmm4
	mulss	.LC27(%rip), %xmm3
	subss	%xmm1, %xmm0
	addss	%xmm4, %xmm2
	subss	%xmm3, %xmm0
	movss	%xmm2, 1008(%rsp,%rax,4)
	movss	%xmm0, 1264(%rsp,%rax,4)
	leal	5(%rcx), %eax
	jle	.L313
	leal	(%rdx,%rsi), %r11d
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cltq
	imull	%r8d, %r11d
	pxor	%xmm3, %xmm3
	movss	.LC20(%rip), %xmm2
	movss	.LC21(%rip), %xmm4
	movslq	%r11d, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm0
	leal	(%r10,%r11), %esi
	addl	%r14d, %r11d
	cmpl	%r9d, %ebp
	movslq	%r11d, %r11
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm1
	movzbl	(%r15,%r11), %esi
	cvtsi2ss	%esi, %xmm3
	mulss	%xmm0, %xmm4
	mulss	%xmm1, %xmm2
	addss	%xmm4, %xmm2
	movss	.LC22(%rip), %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC25(%rip), %xmm4
	mulss	%xmm1, %xmm4
	mulss	.LC26(%rip), %xmm1
	subss	.LC23(%rip), %xmm2
	movss	%xmm2, 752(%rsp,%rax,4)
	movss	.LC24(%rip), %xmm2
	mulss	%xmm0, %xmm2
	mulss	.LC11(%rip), %xmm0
	subss	%xmm4, %xmm2
	movss	.LC11(%rip), %xmm4
	mulss	%xmm3, %xmm4
	mulss	.LC27(%rip), %xmm3
	subss	%xmm1, %xmm0
	addss	%xmm4, %xmm2
	subss	%xmm3, %xmm0
	movss	%xmm2, 1008(%rsp,%rax,4)
	movss	%xmm0, 1264(%rsp,%rax,4)
	leal	6(%rcx), %eax
	jle	.L401
	leal	(%rdx,%r9), %r11d
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cltq
	imull	%r8d, %r11d
	pxor	%xmm3, %xmm3
	movss	.LC21(%rip), %xmm2
	movss	.LC20(%rip), %xmm4
	movslq	%r11d, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm0
	leal	(%r10,%r11), %esi
	addl	%r14d, %r11d
	movslq	%r11d, %r11
	movslq	%esi, %rsi
	movzbl	(%r15,%rsi), %esi
	cvtsi2ss	%esi, %xmm1
	movzbl	(%r15,%r11), %esi
	cvtsi2ss	%esi, %xmm3
	movl	120(%rsp), %esi
	mulss	%xmm0, %xmm2
	mulss	%xmm1, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC22(%rip), %xmm4
	mulss	%xmm3, %xmm4
	addss	%xmm4, %xmm2
	movss	.LC25(%rip), %xmm4
	mulss	%xmm1, %xmm4
	mulss	.LC26(%rip), %xmm1
	subss	.LC23(%rip), %xmm2
	movss	%xmm2, 752(%rsp,%rax,4)
	movss	.LC24(%rip), %xmm2
	mulss	%xmm0, %xmm2
	mulss	.LC11(%rip), %xmm0
	subss	%xmm4, %xmm2
	movss	.LC11(%rip), %xmm4
	mulss	%xmm3, %xmm4
	mulss	.LC27(%rip), %xmm3
	subss	%xmm1, %xmm0
	addss	%xmm4, %xmm2
	subss	%xmm3, %xmm0
	movss	%xmm2, 1008(%rsp,%rax,4)
	movss	%xmm0, 1264(%rsp,%rax,4)
	leal	7(%rcx), %eax
.L313:
	cmpl	%esi, %r9d
	jge	.L312
	jmp	.L314
	.p2align 4,,10
	.p2align 3
.L392:
	movl	%esi, %r11d
	jmp	.L307
	.p2align 4,,10
	.p2align 3
.L309:
	movaps	752(%rsp), %xmm2
	xorl	%edx, %edx
	movl	140(%rsp), %r14d
	movq	144(%rsp), %r13
	movaps	768(%rsp), %xmm3
	movaps	%xmm2, %xmm5
	movaps	784(%rsp), %xmm1
	shufps	$136, %xmm3, %xmm5
	movaps	800(%rsp), %xmm7
	shufps	$221, %xmm3, %xmm2
	movaps	%xmm1, %xmm3
	movaps	816(%rsp), %xmm6
	shufps	$221, %xmm7, %xmm1
	shufps	$136, %xmm7, %xmm3
	movaps	832(%rsp), %xmm4
	movaps	%xmm6, %xmm7
	movaps	%xmm5, %xmm10
	movaps	848(%rsp), %xmm0
	shufps	$136, %xmm4, %xmm7
	shufps	$221, %xmm4, %xmm6
	movaps	864(%rsp), %xmm8
	movaps	%xmm0, %xmm4
	shufps	$136, %xmm3, %xmm10
	shufps	$136, %xmm8, %xmm4
	movaps	896(%rsp), %xmm12
	shufps	$221, %xmm8, %xmm0
	movaps	%xmm2, %xmm8
	shufps	$221, %xmm3, %xmm5
	movaps	%xmm7, %xmm3
	shufps	$136, %xmm1, %xmm8
	movaps	992(%rsp), %xmm13
	shufps	$221, %xmm1, %xmm2
	movaps	%xmm6, %xmm1
	shufps	$136, %xmm4, %xmm3
	shufps	$221, %xmm0, %xmm6
	shufps	$136, %xmm0, %xmm1
	movaps	%xmm10, %xmm0
	shufps	$221, %xmm4, %xmm7
	shufps	$221, %xmm3, %xmm10
	movaps	%xmm5, %xmm4
	shufps	$136, %xmm3, %xmm0
	movaps	%xmm8, %xmm3
	shufps	$221, %xmm7, %xmm5
	shufps	$221, %xmm1, %xmm8
	shufps	$136, %xmm1, %xmm3
	movaps	%xmm2, %xmm1
	shufps	$221, %xmm6, %xmm2
	shufps	$136, %xmm7, %xmm4
	movaps	%xmm0, %xmm7
	shufps	$136, %xmm6, %xmm1
	subps	%xmm2, %xmm0
	movaps	%xmm4, %xmm11
	addps	%xmm2, %xmm7
	movaps	%xmm3, %xmm2
	subps	%xmm5, %xmm3
	addps	%xmm8, %xmm11
	addps	%xmm5, %xmm2
	movaps	%xmm3, %xmm9
	movaps	%xmm10, %xmm3
	subps	%xmm8, %xmm4
	addps	%xmm1, %xmm3
	subps	%xmm10, %xmm1
	movaps	%xmm3, %xmm6
	addps	%xmm7, %xmm6
	subps	%xmm3, %xmm7
	movaps	%xmm11, %xmm3
	addps	%xmm4, %xmm1
	addps	%xmm2, %xmm3
	subps	%xmm11, %xmm2
	movaps	%xmm3, %xmm5
	addps	%xmm7, %xmm2
	addps	%xmm6, %xmm5
	subps	%xmm3, %xmm6
	mulps	.LC6(%rip), %xmm2
	movaps	%xmm9, %xmm3
	addps	%xmm0, %xmm3
	movaps	%xmm2, %xmm8
	addps	%xmm7, %xmm8
	subps	%xmm2, %xmm7
	movaps	%xmm1, %xmm2
	mulps	.LC8(%rip), %xmm1
	subps	%xmm3, %xmm2
	mulps	.LC9(%rip), %xmm3
	mulps	.LC7(%rip), %xmm2
	addps	%xmm2, %xmm1
	movaps	%xmm2, %xmm10
	movaps	%xmm3, %xmm2
	movaps	%xmm4, %xmm3
	addps	%xmm9, %xmm3
	movaps	%xmm5, %xmm9
	addps	%xmm10, %xmm2
	unpckhps	%xmm6, %xmm5
	unpcklps	%xmm6, %xmm9
	movaps	%xmm8, %xmm6
	unpckhps	%xmm7, %xmm8
	mulps	.LC6(%rip), %xmm3
	movaps	%xmm5, %xmm11
	unpcklps	%xmm7, %xmm6
	movaps	%xmm5, %xmm7
	unpcklps	%xmm8, %xmm11
	unpckhps	%xmm8, %xmm7
	movaps	%xmm3, %xmm4
	addps	%xmm0, %xmm4
	subps	%xmm3, %xmm0
	movaps	%xmm4, %xmm10
	movaps	%xmm0, %xmm3
	addps	%xmm2, %xmm10
	addps	%xmm1, %xmm3
	subps	%xmm1, %xmm0
	movaps	%xmm4, %xmm1
	movaps	%xmm10, %xmm4
	subps	%xmm2, %xmm1
	movaps	%xmm10, %xmm2
	unpckhps	%xmm3, %xmm4
	unpcklps	%xmm3, %xmm2
	movaps	%xmm0, %xmm10
	movaps	%xmm0, %xmm3
	movaps	%xmm4, %xmm8
	movaps	976(%rsp), %xmm0
	unpcklps	%xmm1, %xmm10
	unpckhps	%xmm1, %xmm3
	movaps	%xmm9, %xmm1
	unpckhps	%xmm6, %xmm9
	unpcklps	%xmm6, %xmm1
	movaps	%xmm2, %xmm6
	unpckhps	%xmm10, %xmm2
	unpcklps	%xmm10, %xmm6
	movaps	%xmm11, %xmm10
	movaps	%xmm1, %xmm5
	unpckhps	%xmm3, %xmm4
	unpcklps	%xmm6, %xmm5
	unpckhps	%xmm6, %xmm1
	movaps	%xmm9, %xmm6
	unpckhps	%xmm2, %xmm9
	unpcklps	%xmm2, %xmm6
	movaps	%xmm7, %xmm2
	unpckhps	%xmm4, %xmm7
	movaps	%xmm9, 48(%rsp)
	unpcklps	%xmm3, %xmm8
	movaps	%xmm7, 16(%rsp)
	unpcklps	%xmm4, %xmm2
	unpcklps	%xmm8, %xmm10
	unpckhps	%xmm8, %xmm11
	movaps	880(%rsp), %xmm9
	movaps	912(%rsp), %xmm7
	movaps	%xmm9, %xmm14
	shufps	$221, %xmm12, %xmm9
	movaps	928(%rsp), %xmm3
	shufps	$136, %xmm12, %xmm14
	movaps	%xmm7, %xmm12
	movaps	944(%rsp), %xmm8
	shufps	$136, %xmm3, %xmm12
	movaps	960(%rsp), %xmm4
	shufps	$221, %xmm3, %xmm7
	movaps	%xmm8, %xmm3
	shufps	$221, %xmm4, %xmm8
	shufps	$136, %xmm4, %xmm3
	movaps	%xmm0, %xmm4
	movaps	%xmm11, 32(%rsp)
	shufps	$136, %xmm13, %xmm4
	shufps	$221, %xmm13, %xmm0
	movaps	%xmm14, %xmm11
	movaps	%xmm14, %xmm13
	shufps	$221, %xmm12, %xmm11
	shufps	$136, %xmm12, %xmm13
	movaps	%xmm3, %xmm12
	shufps	$221, %xmm4, %xmm3
	shufps	$136, %xmm4, %xmm12
	movaps	%xmm9, %xmm4
	shufps	$221, %xmm7, %xmm9
	shufps	$136, %xmm7, %xmm4
	movaps	%xmm8, %xmm7
	shufps	$221, %xmm0, %xmm8
	shufps	$136, %xmm0, %xmm7
	movaps	%xmm13, %xmm0
	shufps	$221, %xmm12, %xmm13
	shufps	$136, %xmm12, %xmm0
	movaps	%xmm4, %xmm12
	shufps	$221, %xmm7, %xmm4
	shufps	$136, %xmm7, %xmm12
	movaps	%xmm11, %xmm7
	shufps	$221, %xmm3, %xmm11
	shufps	$136, %xmm3, %xmm7
	movaps	%xmm9, %xmm3
	shufps	$221, %xmm8, %xmm9
	movaps	%xmm11, %xmm14
	shufps	$136, %xmm8, %xmm3
	addps	%xmm12, %xmm14
	movaps	%xmm9, %xmm8
	subps	%xmm11, %xmm12
	addps	%xmm0, %xmm8
	subps	%xmm9, %xmm0
	movaps	%xmm14, %xmm9
	movaps	%xmm7, %xmm14
	subps	%xmm4, %xmm7
	addps	%xmm4, %xmm14
	movaps	%xmm3, %xmm4
	subps	%xmm13, %xmm3
	addps	%xmm13, %xmm4
	addps	%xmm7, %xmm3
	movaps	%xmm4, %xmm11
	addps	%xmm12, %xmm7
	addps	%xmm8, %xmm11
	movaps	%xmm3, %xmm13
	subps	%xmm4, %xmm8
	movaps	%xmm14, %xmm4
	mulps	.LC6(%rip), %xmm7
	addps	%xmm9, %xmm4
	mulps	.LC8(%rip), %xmm3
	subps	%xmm14, %xmm9
	movaps	%xmm4, %xmm15
	addps	%xmm11, %xmm4
	subps	%xmm15, %xmm11
	movaps	%xmm12, %xmm15
	addps	%xmm8, %xmm9
	addps	%xmm0, %xmm15
	mulps	.LC6(%rip), %xmm9
	subps	%xmm15, %xmm13
	mulps	.LC9(%rip), %xmm15
	mulps	.LC7(%rip), %xmm13
	movaps	%xmm9, %xmm14
	addps	%xmm8, %xmm14
	subps	%xmm9, %xmm8
	movaps	%xmm15, %xmm9
	addps	%xmm13, %xmm3
	addps	%xmm13, %xmm9
	movaps	%xmm7, %xmm13
	addps	%xmm0, %xmm13
	subps	%xmm7, %xmm0
	movaps	%xmm13, %xmm12
	subps	%xmm9, %xmm13
	movaps	%xmm0, %xmm7
	subps	%xmm3, %xmm0
	addps	%xmm3, %xmm7
	movaps	%xmm4, %xmm3
	addps	%xmm9, %xmm12
	unpckhps	%xmm11, %xmm4
	unpcklps	%xmm11, %xmm3
	movaps	%xmm14, %xmm11
	unpckhps	%xmm8, %xmm14
	unpcklps	%xmm8, %xmm11
	movaps	%xmm0, %xmm8
	movaps	%xmm12, %xmm9
	unpckhps	%xmm13, %xmm0
	unpcklps	%xmm13, %xmm8
	movaps	%xmm4, %xmm13
	unpcklps	%xmm7, %xmm9
	unpcklps	%xmm14, %xmm13
	unpckhps	%xmm7, %xmm12
	movaps	%xmm3, %xmm7
	unpckhps	%xmm11, %xmm3
	unpcklps	%xmm11, %xmm7
	movaps	%xmm13, %xmm11
	movaps	%xmm9, %xmm13
	unpckhps	%xmm8, %xmm9
	unpcklps	%xmm8, %xmm13
	movaps	%xmm12, %xmm8
	unpckhps	%xmm0, %xmm12
	unpcklps	%xmm0, %xmm8
	movaps	%xmm11, %xmm0
	unpckhps	%xmm14, %xmm4
	movaps	%xmm7, %xmm14
	unpckhps	%xmm13, %xmm7
	unpcklps	%xmm8, %xmm0
	unpcklps	%xmm13, %xmm14
	movaps	%xmm3, %xmm13
	unpckhps	%xmm9, %xmm3
	unpcklps	%xmm9, %xmm13
	movaps	%xmm0, %xmm9
	movaps	%xmm4, %xmm0
	unpckhps	%xmm8, %xmm11
	movaps	%xmm5, %xmm8
	unpcklps	%xmm12, %xmm0
	unpckhps	%xmm12, %xmm4
	movaps	%xmm10, %xmm12
	subps	%xmm13, %xmm10
	subps	%xmm0, %xmm5
	addps	%xmm0, %xmm8
	movaps	%xmm6, %xmm0
	addps	%xmm13, %xmm12
	movaps	%xmm2, %xmm13
	subps	%xmm9, %xmm6
	subps	%xmm14, %xmm2
	addps	%xmm14, %xmm13
	movaps	%xmm5, %xmm14
	addps	%xmm9, %xmm0
	movaps	%xmm12, %xmm9
	movaps	%xmm8, %xmm12
	addps	%xmm10, %xmm2
	addps	%xmm6, %xmm14
	subps	%xmm13, %xmm8
	addps	%xmm13, %xmm12
	movaps	%xmm0, %xmm13
	subps	%xmm9, %xmm0
	addps	%xmm9, %xmm13
	movaps	%xmm14, %xmm9
	movaps	%xmm2, %xmm14
	addps	%xmm8, %xmm0
	subps	%xmm9, %xmm14
	addps	%xmm10, %xmm6
	mulps	.LC6(%rip), %xmm0
	mulps	.LC7(%rip), %xmm14
	movaps	16(%rsp), %xmm15
	mulps	.LC8(%rip), %xmm2
	mulps	.LC6(%rip), %xmm6
	mulps	.LC9(%rip), %xmm9
	addps	%xmm14, %xmm2
	addps	%xmm14, %xmm9
	movaps	%xmm5, %xmm14
	subps	%xmm6, %xmm5
	movaps	%xmm2, %xmm10
	addps	%xmm6, %xmm14
	movaps	48(%rsp), %xmm6
	addps	%xmm5, %xmm10
	subps	%xmm2, %xmm5
	movaps	%xmm9, %xmm2
	addps	%xmm14, %xmm2
	movaps	%xmm10, 912(%rsp)
	subps	%xmm9, %xmm14
	movaps	%xmm5, 848(%rsp)
	movaps	%xmm1, %xmm5
	movaps	%xmm2, 784(%rsp)
	movaps	%xmm12, %xmm2
	subps	%xmm4, %xmm1
	movaps	%xmm14, 976(%rsp)
	addps	%xmm13, %xmm2
	addps	%xmm4, %xmm5
	movaps	%xmm15, %xmm4
	subps	%xmm13, %xmm12
	movaps	%xmm2, 752(%rsp)
	movaps	%xmm8, %xmm2
	subps	%xmm0, %xmm8
	addps	%xmm0, %xmm2
	movaps	%xmm12, 880(%rsp)
	addps	%xmm7, %xmm4
	movaps	%xmm8, 944(%rsp)
	movaps	%xmm2, 816(%rsp)
	movaps	%xmm6, %xmm2
	subps	%xmm11, %xmm6
	addps	%xmm11, %xmm2
	movaps	%xmm6, %xmm9
	movaps	32(%rsp), %xmm6
	movaps	%xmm6, %xmm0
	subps	%xmm3, %xmm6
	addps	%xmm3, %xmm0
	movaps	%xmm6, %xmm10
	movaps	%xmm4, %xmm6
	movaps	%xmm0, %xmm8
	addps	%xmm5, %xmm6
	addps	%xmm2, %xmm8
	subps	%xmm0, %xmm2
	movaps	%xmm15, %xmm0
	subps	%xmm4, %xmm5
	subps	%xmm7, %xmm0
	movaps	.LC7(%rip), %xmm7
	movaps	%xmm5, %xmm3
	addps	%xmm5, %xmm2
	movaps	%xmm9, %xmm5
	addps	%xmm10, %xmm0
	addps	%xmm1, %xmm5
	mulps	.LC6(%rip), %xmm2
	addps	%xmm10, %xmm9
	movaps	%xmm0, %xmm4
	mulps	.LC8(%rip), %xmm0
	subps	%xmm5, %xmm4
	mulps	.LC9(%rip), %xmm5
	mulps	.LC6(%rip), %xmm9
	mulps	%xmm4, %xmm7
	movaps	%xmm5, %xmm4
	movaps	%xmm9, %xmm5
	addps	%xmm7, %xmm0
	addps	%xmm1, %xmm5
	subps	%xmm9, %xmm1
	addps	%xmm7, %xmm4
	movaps	%xmm1, %xmm7
	subps	%xmm0, %xmm1
	addps	%xmm0, %xmm7
	movaps	%xmm5, %xmm0
	subps	%xmm4, %xmm5
	movaps	%xmm1, 864(%rsp)
	addps	%xmm4, %xmm0
	movaps	%xmm7, 928(%rsp)
	movaps	%xmm5, 992(%rsp)
	movaps	%xmm0, 800(%rsp)
	movaps	%xmm8, %xmm0
	addps	%xmm6, %xmm0
	subps	%xmm8, %xmm6
	movaps	%xmm0, 768(%rsp)
	movaps	%xmm2, %xmm0
	movaps	%xmm6, 896(%rsp)
	addps	%xmm3, %xmm0
	pxor	%xmm6, %xmm6
	subps	%xmm2, %xmm3
	movaps	%xmm0, 832(%rsp)
	movaps	%xmm3, 960(%rsp)
	jmp	.L316
	.p2align 4,,10
	.p2align 3
.L429:
	addss	.LC11(%rip), %xmm0
.L436:
	cvttss2si	%xmm0, %eax
	addq	$1, %rdx
	cmpq	$64, %rdx
	movl	%eax, 1520(%rsp,%rcx,4)
	je	.L442
.L316:
	movss	752(%rsp,%rdx,4), %xmm0
	movzbl	stbiw__jpg_ZigZag(%rdx), %ecx
	mulss	240(%rsp,%rdx,4), %xmm0
	ucomiss	%xmm0, %xmm6
	jbe	.L429
	subss	.LC11(%rip), %xmm0
	jmp	.L436
	.p2align 4,,10
	.p2align 3
.L442:
	movl	1520(%rsp), %edi
	movl	%edi, 140(%rsp)
	subl	124(%rsp), %edi
	je	.L443
	movl	%edi, %edx
	sarl	$31, %edx
	movl	%edx, %eax
	xorl	%edi, %eax
	subl	%edx, %eax
	cmpl	$-2147483648, %edi
	adcl	$-1, %edi
	sarl	%eax
	je	.L402
	movl	$2, %esi
	jmp	.L328
	.p2align 4,,10
	.p2align 3
.L403:
	movl	%edx, %esi
.L328:
	sarl	%eax
	leal	1(%rsi), %edx
	jne	.L403
	movzwl	%si, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	movl	%eax, 32(%rsp)
	movzwl	%si, %eax
	sall	%cl, %edx
	salq	$2, %rax
	subl	$1, %edx
.L327:
	movzwl	YDC_HT.8731+2(%rax), %ebx
	movzwl	YDC_HT.8731(%rax), %r12d
	movl	$24, %ecx
	addl	112(%rsp), %ebx
	andl	%edi, %edx
	movw	%dx, 16(%rsp)
	subl	%ebx, %ecx
	sall	%cl, %r12d
	orl	%r12d, %r14d
	cmpl	$7, %ebx
	jle	.L329
	leal	-8(%rbx), %eax
	movl	%eax, %ebp
	movl	%eax, 48(%rsp)
	andl	$7, %ebp
	.p2align 4,,10
	.p2align 3
.L331:
	movl	%r14d, %r12d
	movq	8(%r13), %rdi
	movl	$1, %edx
	sarl	$16, %r12d
	leaq	219(%rsp), %rsi
	movb	%r12b, 219(%rsp)
	call	*0(%r13)
	cmpb	$-1, %r12b
	jne	.L330
	movb	$0, 218(%rsp)
	movq	8(%r13), %rdi
	movl	$1, %edx
	leaq	218(%rsp), %rsi
	call	*0(%r13)
.L330:
	subl	$8, %ebx
	sall	$8, %r14d
	cmpl	%ebp, %ebx
	jne	.L331
	movl	48(%rsp), %ebx
	andl	$7, %ebx
.L329:
	movl	32(%rsp), %eax
	movzwl	16(%rsp), %edx
	movl	$24, %ecx
	movl	%r14d, 232(%rsp)
	movl	%ebx, 236(%rsp)
	addl	%ebx, %eax
	subl	%eax, %ecx
	sall	%cl, %edx
	orl	%edx, %r14d
	cmpl	$7, %eax
	jle	.L332
	leal	-8(%rax), %ebx
	movl	%ebx, %ebp
	movl	%ebx, 16(%rsp)
	movl	%eax, %ebx
	andl	$7, %ebp
	.p2align 4,,10
	.p2align 3
.L334:
	movl	%r14d, %r12d
	movq	8(%r13), %rdi
	movl	$1, %edx
	sarl	$16, %r12d
	leaq	217(%rsp), %rsi
	movb	%r12b, 217(%rsp)
	call	*0(%r13)
	cmpb	$-1, %r12b
	jne	.L333
	movb	$0, 216(%rsp)
	movq	8(%r13), %rdi
	movl	$1, %edx
	leaq	216(%rsp), %rsi
	call	*0(%r13)
.L333:
	subl	$8, %ebx
	sall	$8, %r14d
	cmpl	%ebp, %ebx
	jne	.L334
	movl	16(%rsp), %eax
	andl	$7, %eax
.L332:
	movl	%r14d, 232(%rsp)
	movl	%eax, 236(%rsp)
	movl	$63, %edx
	jmp	.L335
	.p2align 4,,10
	.p2align 3
.L337:
	subq	$1, %rdx
	je	.L444
.L335:
	movl	1520(%rsp,%rdx,4), %esi
	testl	%esi, %esi
	je	.L337
	movq	%r15, 144(%rsp)
	movl	%edx, 32(%rsp)
	movl	$1, %ecx
	movl	%eax, %ebp
	movq	%r13, %r15
.L338:
	movslq	%ecx, %rax
	movl	1520(%rsp,%rax,4), %r12d
	testl	%r12d, %r12d
	jne	.L445
	cmpl	%ecx, 32(%rsp)
	jl	.L446
	leal	1(%rcx), %eax
	movl	32(%rsp), %esi
	cltq
	leaq	1520(%rsp,%rax,4), %rdx
	movl	%ecx, %eax
	jmp	.L343
	.p2align 4,,10
	.p2align 3
.L448:
	addq	$4, %rdx
	cmpl	%esi, %eax
	jg	.L447
.L343:
	movl	(%rdx), %r12d
	addl	$1, %eax
	testl	%r12d, %r12d
	je	.L448
	movl	%eax, 48(%rsp)
	subl	%ecx, %eax
	movl	%eax, %ebx
	movl	%eax, 112(%rsp)
	movl	%r12d, %eax
	sarl	$31, %eax
	movl	%eax, %edx
	xorl	%r12d, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	sarl	%eax
	cmpl	$15, %ebx
	movl	%eax, 96(%rsp)
	jg	.L345
	movl	%ebx, %edx
	sall	$4, %edx
.L346:
	movl	96(%rsp), %ecx
	leal	-1(%r12), %eax
	testl	%r12d, %r12d
	movl	$2, %r13d
	cmovs	%eax, %r12d
	movl	96(%rsp), %eax
	testl	%ecx, %ecx
	jne	.L353
	jmp	.L378
	.p2align 4,,10
	.p2align 3
.L406:
	movl	%ecx, %r13d
.L353:
	sarl	%eax
	leal	1(%r13), %ecx
	jne	.L406
	movzwl	%r13w, %ebx
	leal	(%rbx,%rdx), %eax
	movl	%ebx, %ecx
	movl	$1, %edx
	sall	%cl, %edx
	movl	%ebx, 16(%rsp)
	subl	$1, %edx
	cltq
	andl	%edx, %r12d
	salq	$2, %rax
	movzwl	%r12w, %r12d
.L354:
	movzwl	YAC_HT.8733+2(%rax), %edx
	movzwl	YAC_HT.8733(%rax), %eax
	movl	$24, %ecx
	addl	%edx, %ebp
	subl	%ebp, %ecx
	sall	%cl, %eax
	orl	%eax, %r14d
	cmpl	$7, %ebp
	jle	.L355
	leal	-8(%rbp), %eax
	movl	%eax, %ebx
	movl	%eax, 72(%rsp)
	andl	$7, %ebx
	.p2align 4,,10
	.p2align 3
.L357:
	movl	%r14d, %r13d
	movq	8(%r15), %rdi
	movl	$1, %edx
	sarl	$16, %r13d
	leaq	227(%rsp), %rsi
	movb	%r13b, 227(%rsp)
	call	*(%r15)
	cmpb	$-1, %r13b
	jne	.L356
	movb	$0, 226(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	leaq	226(%rsp), %rsi
	call	*(%r15)
.L356:
	subl	$8, %ebp
	sall	$8, %r14d
	cmpl	%ebp, %ebx
	jne	.L357
	movl	72(%rsp), %ebp
	andl	$7, %ebp
.L355:
	movl	%ebp, 236(%rsp)
	addl	16(%rsp), %ebp
	movl	$24, %ecx
	movl	%r14d, 232(%rsp)
	subl	%ebp, %ecx
	sall	%cl, %r12d
	orl	%r12d, %r14d
	cmpl	$7, %ebp
	jle	.L358
	leal	-8(%rbp), %r12d
	movl	%r12d, %ebx
	andl	$7, %ebx
	.p2align 4,,10
	.p2align 3
.L360:
	movl	%r14d, %r13d
	movq	8(%r15), %rdi
	movl	$1, %edx
	sarl	$16, %r13d
	leaq	225(%rsp), %rsi
	movb	%r13b, 225(%rsp)
	call	*(%r15)
	cmpb	$-1, %r13b
	jne	.L359
	movb	$0, 224(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	leaq	224(%rsp), %rsi
	call	*(%r15)
.L359:
	subl	$8, %ebp
	sall	$8, %r14d
	cmpl	%ebp, %ebx
	jne	.L360
	movl	%r12d, %ebp
	andl	$7, %ebp
.L358:
	movl	48(%rsp), %ecx
	movl	%r14d, 232(%rsp)
	movl	%ebp, 236(%rsp)
	addl	$1, %ecx
	cmpl	32(%rsp), %ecx
	jle	.L338
	cmpl	$63, 32(%rsp)
	movq	%r15, %r13
	movl	%ebp, %eax
	movq	144(%rsp), %r15
	je	.L341
	leal	4(%rbp), %ebp
	movl	$24, %ecx
	movl	$10, %r12d
	subl	%ebp, %ecx
	sall	%cl, %r12d
	orl	%r14d, %r12d
	cmpl	$7, %ebp
	jle	.L365
	subl	$4, %eax
	movl	%eax, %ebx
	movl	%eax, 16(%rsp)
	andl	$7, %ebx
	.p2align 4,,10
	.p2align 3
.L367:
	movl	%r12d, %r14d
	movq	8(%r13), %rdi
	movl	$1, %edx
	sarl	$16, %r14d
	leaq	229(%rsp), %rsi
	movb	%r14b, 229(%rsp)
	call	*0(%r13)
	cmpb	$-1, %r14b
	jne	.L366
	movb	$0, 228(%rsp)
	movq	8(%r13), %rdi
	movl	$1, %edx
	leaq	228(%rsp), %rsi
	call	*0(%r13)
.L366:
	subl	$8, %ebp
	sall	$8, %r12d
	cmpl	%ebx, %ebp
	jne	.L367
.L437:
	movl	16(%rsp), %ebp
	andl	$7, %ebp
.L365:
	movl	%r12d, 232(%rsp)
	movl	%ebp, 236(%rsp)
.L341:
	movq	176(%rsp), %r14
	movq	168(%rsp), %rbx
	leaq	496(%rsp), %r8
	movl	132(%rsp), %r9d
	leaq	1008(%rsp), %rcx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	stbiw__jpg_processDU.constprop.8
	movl	136(%rsp), %r9d
	leaq	496(%rsp), %r8
	leaq	1264(%rsp), %rcx
	movq	%r14, %rdx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	movl	%eax, 132(%rsp)
	call	stbiw__jpg_processDU.constprop.8
	addl	$8, (%rsp)
	movl	%eax, 136(%rsp)
	addl	$8, 120(%rsp)
	movl	(%rsp), %eax
	addl	$8, 68(%rsp)
	addl	$8, 80(%rsp)
	addl	$8, 100(%rsp)
	addl	$8, 104(%rsp)
	addl	$8, 108(%rsp)
	addl	$8, 116(%rsp)
	addl	$8, 128(%rsp)
	cmpl	196(%rsp), %eax
	je	.L368
	movl	236(%rsp), %eax
	movl	232(%rsp), %r14d
	movl	%eax, 112(%rsp)
	movl	140(%rsp), %eax
	movl	%eax, 124(%rsp)
	jmp	.L372
	.p2align 4,,10
	.p2align 3
.L447:
	movl	%eax, 48(%rsp)
	subl	%ecx, %eax
	cmpl	$15, %eax
	movl	%eax, 112(%rsp)
	jg	.L407
	sall	$4, %eax
	xorl	%r12d, %r12d
	movl	%eax, %edx
.L378:
	leal	1(%rdx), %eax
	andl	$1, %r12d
	movl	$1, 16(%rsp)
	cltq
	salq	$2, %rax
	jmp	.L354
.L407:
	movl	$0, 96(%rsp)
.L345:
	movl	112(%rsp), %eax
	movl	$1, 16(%rsp)
	movl	%r12d, 124(%rsp)
	sarl	$4, %eax
	addl	$1, %eax
	movl	%eax, 72(%rsp)
	.p2align 4,,10
	.p2align 3
.L350:
	leal	11(%rbp), %ebx
	movl	$24, %ecx
	movl	$2041, %edx
	subl	%ebx, %ecx
	sall	%cl, %edx
	orl	%edx, %r14d
	cmpl	$7, %ebx
	jle	.L404
	addl	$3, %ebp
	movl	%ebp, %r13d
	andl	$7, %r13d
	.p2align 4,,10
	.p2align 3
.L349:
	movl	%r14d, %r12d
	movq	8(%r15), %rdi
	movl	$1, %edx
	sarl	$16, %r12d
	leaq	223(%rsp), %rsi
	movb	%r12b, 223(%rsp)
	call	*(%r15)
	cmpb	$-1, %r12b
	jne	.L348
	movb	$0, 222(%rsp)
	movq	8(%r15), %rdi
	movl	$1, %edx
	leaq	222(%rsp), %rsi
	call	*(%r15)
.L348:
	subl	$8, %ebx
	sall	$8, %r14d
	cmpl	%r13d, %ebx
	jne	.L349
	andl	$7, %ebp
.L347:
	addl	$1, 16(%rsp)
	movl	%r14d, 232(%rsp)
	movl	16(%rsp), %eax
	cmpl	72(%rsp), %eax
	movl	%ebp, 236(%rsp)
	jne	.L350
	movl	112(%rsp), %edx
	movl	124(%rsp), %r12d
	sall	$4, %edx
	movzbl	%dl, %edx
	jmp	.L346
	.p2align 4,,10
	.p2align 3
.L404:
	movl	%ebx, %ebp
	jmp	.L347
.L443:
	movl	112(%rsp), %ebx
	leal	2(%rbx), %eax
	cmpl	$7, %eax
	jle	.L332
	subl	$6, %ebx
	movl	%ebx, %r12d
	movl	%ebx, %ebp
	movl	%eax, %ebx
	andl	$7, %ebp
	movl	%r12d, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L324:
	movl	%r14d, %r12d
	movq	8(%r13), %rdi
	movl	$1, %edx
	sarl	$16, %r12d
	leaq	215(%rsp), %rsi
	movb	%r12b, 215(%rsp)
	call	*0(%r13)
	cmpb	$-1, %r12b
	jne	.L323
	movb	$0, 214(%rsp)
	movq	8(%r13), %rdi
	movl	$1, %edx
	leaq	214(%rsp), %rsi
	call	*0(%r13)
.L323:
	subl	$8, %ebx
	sall	$8, %r14d
	cmpl	%ebx, %ebp
	jne	.L324
	movl	16(%rsp), %r12d
	movl	%r12d, %eax
	andl	$7, %eax
	jmp	.L332
.L445:
	movl	%r12d, %eax
	movl	%ecx, 48(%rsp)
	sarl	$31, %eax
	movl	%eax, %edx
	xorl	%r12d, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	xorl	%edx, %edx
	sarl	%eax
	movl	%eax, 96(%rsp)
	jmp	.L346
.L444:
	leal	4(%rax), %ebp
	movl	$24, %ecx
	movl	$10, %r12d
	subl	%ebp, %ecx
	sall	%cl, %r12d
	orl	%r14d, %r12d
	cmpl	$7, %ebp
	jle	.L365
	subl	$4, %eax
	movl	%eax, %ebx
	movl	%eax, 16(%rsp)
	andl	$7, %ebx
	.p2align 4,,10
	.p2align 3
.L340:
	movl	%r12d, %r14d
	movq	8(%r13), %rdi
	movl	$1, %edx
	sarl	$16, %r14d
	leaq	221(%rsp), %rsi
	movb	%r14b, 221(%rsp)
	call	*0(%r13)
	cmpb	$-1, %r14b
	jne	.L339
	movb	$0, 220(%rsp)
	movq	8(%r13), %rdi
	movl	$1, %edx
	leaq	220(%rsp), %rsi
	call	*0(%r13)
.L339:
	subl	$8, %ebp
	sall	$8, %r12d
	cmpl	%ebx, %ebp
	jne	.L340
	jmp	.L437
.L446:
	movl	%ecx, 48(%rsp)
	movl	$4, %eax
	movl	$1, 16(%rsp)
	jmp	.L354
.L401:
	movl	%r9d, %esi
	jmp	.L312
.L393:
	movl	%r9d, %r11d
	jmp	.L308
.L368:
	movl	236(%rsp), %eax
	movq	%r13, %r14
	movq	%r15, %r13
	movl	232(%rsp), %r15d
	movl	%eax, 112(%rsp)
	movl	140(%rsp), %eax
	movl	%eax, 124(%rsp)
.L371:
	addl	$8, 152(%rsp)
	subl	$8, 160(%rsp)
	movl	152(%rsp), %eax
	movl	200(%rsp), %ecx
	addl	%ecx, 164(%rsp)
	cmpl	204(%rsp), %eax
	jne	.L305
	movl	112(%rsp), %ebx
	movl	$24, %ecx
	movl	$127, %eax
	leal	7(%rbx), %ebp
	subl	%ebp, %ecx
	sall	%cl, %eax
	orl	%r15d, %eax
	cmpl	$7, %ebp
	movl	%eax, %r12d
	jle	.L373
	subl	$1, %ebx
	andl	$7, %ebx
.L375:
	movl	%r12d, %r13d
	movq	8(%r14), %rdi
	movl	$1, %edx
	sarl	$16, %r13d
	leaq	231(%rsp), %rsi
	movb	%r13b, 231(%rsp)
	call	*(%r14)
	cmpb	$-1, %r13b
	jne	.L374
	movb	$0, 230(%rsp)
	movq	8(%r14), %rdi
	movl	$1, %edx
	leaq	230(%rsp), %rsi
	call	*(%r14)
.L374:
	subl	$8, %ebp
	sall	$8, %r12d
	cmpl	%ebx, %ebp
	jne	.L375
.L373:
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	168(%rsp), %rsi
	movb	$-1, 232(%rsp)
	call	*(%r14)
	movb	$-39, 236(%rsp)
	movq	8(%r14), %rdi
	movl	$1, %edx
	movq	176(%rsp), %rsi
	call	*(%r14)
	movq	1944(%rsp), %rbx
	xorq	%fs:40, %rbx
	movl	$1, %eax
	jne	.L449
	addq	$1960, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L402:
	.cfi_restore_state
	movl	$4, %eax
	movl	$1, %edx
	movl	$1, 32(%rsp)
	jmp	.L327
.L439:
	leaq	232(%rsp), %rax
	movq	%rax, 168(%rsp)
	leaq	236(%rsp), %rax
	movq	%rax, 176(%rsp)
	jmp	.L373
.L449:
	call	__stack_chk_fail
.L438:
	subl	%ecx, %eax
	leal	(%rax,%rax), %esi
	jmp	.L298
	.cfi_endproc
.LFE759:
	.size	stbi_write_jpg_core.part.0, .-stbi_write_jpg_core.part.0
	.p2align 4,,15
	.globl	stbi_flip_vertically_on_write
	.type	stbi_flip_vertically_on_write, @function
stbi_flip_vertically_on_write:
.LFB709:
	.cfi_startproc
	movl	%edi, stbi__flip_vertically_on_write(%rip)
	ret
	.cfi_endproc
.LFE709:
	.size	stbi_flip_vertically_on_write, .-stbi_flip_vertically_on_write
	.section	.rodata.str1.1
.LC28:
	.string	"11 4 22 44 44 22 444444"
	.text
	.p2align 4,,15
	.globl	stbi_write_bmp_to_func
	.type	stbi_write_bmp_to_func, @function
stbi_write_bmp_to_func:
.LFB722:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movq	%rsi, 8(%rsp)
	leal	(%rdx,%rdx,2), %eax
	movl	%edx, %esi
	andl	$3, %esi
	movq	%rdi, (%rsp)
	pushq	$0
	.cfi_def_cfa_offset 56
	addl	%esi, %eax
	pushq	$0
	.cfi_def_cfa_offset 64
	pushq	$0
	.cfi_def_cfa_offset 72
	imull	%ecx, %eax
	pushq	$0
	.cfi_def_cfa_offset 80
	pushq	$0
	.cfi_def_cfa_offset 88
	pushq	$0
	.cfi_def_cfa_offset 96
	pushq	$24
	.cfi_def_cfa_offset 104
	pushq	$1
	.cfi_def_cfa_offset 112
	pushq	%rcx
	.cfi_def_cfa_offset 120
	addl	$54, %eax
	pushq	%rdx
	.cfi_def_cfa_offset 128
	pushq	$40
	.cfi_def_cfa_offset 136
	pushq	$54
	.cfi_def_cfa_offset 144
	pushq	$0
	.cfi_def_cfa_offset 152
	pushq	$0
	.cfi_def_cfa_offset 160
	pushq	%rax
	.cfi_def_cfa_offset 168
	xorl	%eax, %eax
	pushq	$77
	.cfi_def_cfa_offset 176
	pushq	$66
	.cfi_def_cfa_offset 184
	pushq	$.LC28
	.cfi_def_cfa_offset 192
	pushq	%rsi
	.cfi_def_cfa_offset 200
	pushq	$0
	.cfi_def_cfa_offset 208
	pushq	%r9
	.cfi_def_cfa_offset 216
	movl	%r8d, %r9d
	pushq	$1
	.cfi_def_cfa_offset 224
	movl	%ecx, %r8d
	movl	%edx, %ecx
	movl	$-1, %edx
	leaq	176(%rsp), %rdi
	movl	%edx, %esi
	call	stbiw__outfile.constprop.13
	addq	$176, %rsp
	.cfi_def_cfa_offset 48
	movq	24(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L454
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L454:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE722:
	.size	stbi_write_bmp_to_func, .-stbi_write_bmp_to_func
	.section	.rodata.str1.1
.LC29:
	.string	"wb"
	.text
	.p2align 4,,15
	.globl	stbi_write_bmp
	.type	stbi_write_bmp, @function
stbi_write_bmp:
.LFB723:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	xorl	%r14d, %r14d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%edx, %r13d
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%esi, %ebx
	movl	$.LC29, %esi
	movl	%ecx, %r12d
	movq	%r8, %rbp
	subq	$32, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	call	fopen
	testq	%rax, %rax
	movq	$stbi__stdio_write, (%rsp)
	movq	%rax, 8(%rsp)
	je	.L455
	movl	%ebx, %edx
	leal	(%rbx,%rbx,2), %eax
	pushq	$0
	.cfi_def_cfa_offset 88
	andl	$3, %edx
	pushq	$0
	.cfi_def_cfa_offset 96
	pushq	$0
	.cfi_def_cfa_offset 104
	addl	%edx, %eax
	pushq	$0
	.cfi_def_cfa_offset 112
	pushq	$0
	.cfi_def_cfa_offset 120
	imull	%r13d, %eax
	pushq	$0
	.cfi_def_cfa_offset 128
	pushq	$24
	.cfi_def_cfa_offset 136
	pushq	$1
	.cfi_def_cfa_offset 144
	pushq	%r13
	.cfi_def_cfa_offset 152
	movl	%r12d, %r9d
	pushq	%rbx
	.cfi_def_cfa_offset 160
	pushq	$40
	.cfi_def_cfa_offset 168
	movl	%r13d, %r8d
	addl	$54, %eax
	pushq	$54
	.cfi_def_cfa_offset 176
	pushq	$0
	.cfi_def_cfa_offset 184
	pushq	$0
	.cfi_def_cfa_offset 192
	pushq	%rax
	.cfi_def_cfa_offset 200
	movl	%ebx, %ecx
	pushq	$77
	.cfi_def_cfa_offset 208
	pushq	$66
	.cfi_def_cfa_offset 216
	xorl	%eax, %eax
	pushq	$.LC28
	.cfi_def_cfa_offset 224
	pushq	%rdx
	.cfi_def_cfa_offset 232
	movl	$-1, %edx
	pushq	$0
	.cfi_def_cfa_offset 240
	pushq	%rbp
	.cfi_def_cfa_offset 248
	movl	%edx, %esi
	pushq	$1
	.cfi_def_cfa_offset 256
	leaq	176(%rsp), %rdi
	call	stbiw__outfile.constprop.13
	addq	$176, %rsp
	.cfi_def_cfa_offset 80
	movq	8(%rsp), %rdi
	movl	%eax, %r14d
	call	fclose
.L455:
	movq	24(%rsp), %rcx
	xorq	%fs:40, %rcx
	movl	%r14d, %eax
	jne	.L462
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L462:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE723:
	.size	stbi_write_bmp, .-stbi_write_bmp
	.p2align 4,,15
	.globl	stbi_write_tga_to_func
	.type	stbi_write_tga_to_func, @function
stbi_write_tga_to_func:
.LFB725:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movl	%edx, %eax
	movl	%ecx, %edx
	movq	%rdi, (%rsp)
	movl	%r8d, %ecx
	movq	%rsi, 8(%rsp)
	movq	%r9, %r8
	movl	%eax, %esi
	movq	%rsp, %rdi
	movq	%fs:40, %r10
	movq	%r10, 24(%rsp)
	xorl	%r10d, %r10d
	call	stbi_write_tga_core
	movq	24(%rsp), %rdx
	xorq	%fs:40, %rdx
	jne	.L466
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L466:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE725:
	.size	stbi_write_tga_to_func, .-stbi_write_tga_to_func
	.p2align 4,,15
	.globl	stbi_write_tga
	.type	stbi_write_tga, @function
stbi_write_tga:
.LFB726:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%r8, %r14
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	$.LC29, %esi
	movl	%edx, %r12d
	movl	%ecx, %r13d
	xorl	%ebx, %ebx
	subq	$32, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	call	fopen
	testq	%rax, %rax
	movq	$stbi__stdio_write, (%rsp)
	movq	%rax, 8(%rsp)
	je	.L467
	movq	%rsp, %rdi
	movq	%r14, %r8
	movl	%r13d, %ecx
	movl	%r12d, %edx
	movl	%ebp, %esi
	call	stbi_write_tga_core
	movq	8(%rsp), %rdi
	movl	%eax, %ebx
	call	fclose
.L467:
	movq	24(%rsp), %rdx
	xorq	%fs:40, %rdx
	movl	%ebx, %eax
	jne	.L474
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L474:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE726:
	.size	stbi_write_tga, .-stbi_write_tga
	.p2align 4,,15
	.globl	stbiw__linear_to_rgbe
	.type	stbiw__linear_to_rgbe, @function
stbiw__linear_to_rgbe:
.LFB727:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movss	4(%rsi), %xmm1
	maxss	8(%rsi), %xmm1
	movss	(%rsi), %xmm2
	movaps	%xmm2, %xmm3
	movss	.LC30(%rip), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	maxss	%xmm1, %xmm3
	ucomiss	%xmm3, %xmm0
	jbe	.L484
	movl	$0, (%rdi)
.L475:
	movq	24(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L486
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L484:
	.cfi_restore_state
	pxor	%xmm0, %xmm0
	leaq	20(%rsp), %rdi
	movq	%rsi, 8(%rsp)
	movss	%xmm2, 4(%rsp)
	movss	%xmm3, (%rsp)
	cvtss2sd	%xmm3, %xmm0
	call	frexp
	cvtsd2ss	%xmm0, %xmm0
	mulss	.LC31(%rip), %xmm0
	movss	(%rsp), %xmm1
	movss	4(%rsp), %xmm2
	movq	8(%rsp), %rsi
	divss	%xmm1, %xmm0
	mulss	%xmm0, %xmm2
	movaps	%xmm0, %xmm1
	cvttss2si	%xmm2, %eax
	movb	%al, (%rbx)
	mulss	4(%rsi), %xmm1
	cvttss2si	%xmm1, %eax
	movb	%al, 1(%rbx)
	mulss	8(%rsi), %xmm0
	cvttss2si	%xmm0, %eax
	movb	%al, 2(%rbx)
	movzbl	20(%rsp), %eax
	addl	$-128, %eax
	movb	%al, 3(%rbx)
	jmp	.L475
.L486:
	call	__stack_chk_fail
	.cfi_endproc
.LFE727:
	.size	stbiw__linear_to_rgbe, .-stbiw__linear_to_rgbe
	.p2align 4,,15
	.globl	stbiw__write_run_data
	.type	stbiw__write_run_data, @function
stbiw__write_run_data:
.LFB728:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leal	-128(%rsi), %eax
	cmpl	$127, %esi
	movb	%dl, 12(%rsp)
	movb	%al, 23(%rsp)
	jg	.L491
	movq	%rdi, %rbx
	movl	$1, %edx
	movq	8(%rdi), %rdi
	leaq	23(%rsp), %rsi
	call	*(%rbx)
	movq	8(%rbx), %rdi
	movl	$1, %edx
	leaq	12(%rsp), %rsi
	call	*(%rbx)
	movq	24(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L492
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L491:
	.cfi_restore_state
	call	stbiw__write_run_data.part.4
.L492:
	call	__stack_chk_fail
	.cfi_endproc
.LFE728:
	.size	stbiw__write_run_data, .-stbiw__write_run_data
	.p2align 4,,15
	.globl	stbiw__write_dump_data
	.type	stbiw__write_dump_data, @function
stbiw__write_dump_data:
.LFB729:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	cmpl	$128, %esi
	movb	%sil, 7(%rsp)
	jg	.L497
	movq	%rdi, %rbx
	movl	%esi, %ebp
	movq	%rdx, %r12
	movq	8(%rdi), %rdi
	movl	$1, %edx
	leaq	7(%rsp), %rsi
	call	*(%rbx)
	movq	8(%rbx), %rdi
	movl	%ebp, %edx
	movq	%r12, %rsi
	call	*(%rbx)
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L498
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L497:
	.cfi_restore_state
	call	stbiw__write_dump_data.part.5
.L498:
	call	__stack_chk_fail
	.cfi_endproc
.LFE729:
	.size	stbiw__write_dump_data, .-stbiw__write_dump_data
	.p2align 4,,15
	.globl	stbiw__write_hdr_scanline
	.type	stbiw__write_hdr_scanline, @function
stbiw__write_hdr_scanline:
.LFB730:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%esi, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %r15
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movq	%fs:40, %rcx
	movq	%rcx, 104(%rsp)
	xorl	%ecx, %ecx
	movl	$514, %ecx
	movl	%esi, 16(%rsp)
	movb	%ah, 98(%rsp)
	movw	%cx, 96(%rsp)
	leal	-8(%rsi), %ecx
	movb	%sil, 99(%rsp)
	cmpl	$32759, %ecx
	jbe	.L500
	testl	%esi, %esi
	jle	.L499
	movss	.LC30(%rip), %xmm5
	movslq	%edx, %rbp
	leal	-3(%rdx), %r12d
	movss	%xmm5, 8(%rsp)
	salq	$2, %rbp
	movq	%r8, %rbx
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L502:
	cmpl	$1, %r12d
	movss	(%rbx), %xmm2
	ja	.L536
	movss	4(%rbx), %xmm4
	movaps	%xmm4, %xmm3
	movss	8(%rbx), %xmm1
	maxss	%xmm1, %xmm3
.L503:
	movaps	%xmm2, %xmm5
	movss	8(%rsp), %xmm7
	maxss	%xmm3, %xmm5
	ucomiss	%xmm5, %xmm7
	jbe	.L553
	movl	$0, 100(%rsp)
	movq	8(%r15), %rdi
	movl	$4, %edx
	leaq	100(%rsp), %rsi
	addl	$1, %r14d
	addq	%rbp, %rbx
	call	*(%r15)
	cmpl	16(%rsp), %r14d
	jne	.L502
.L499:
	movq	104(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L561
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L500:
	.cfi_restore_state
	movslq	%edx, %rax
	leal	(%rsi,%rsi), %r9d
	leal	-3(%rdx), %r12d
	leaq	0(,%rax,4), %r13
	movl	%esi, %eax
	leal	-1(%rsi), %esi
	movq	%r8, %rbx
	leal	(%r9,%rax), %r8d
	movslq	%eax, %rdi
	leaq	1(%r14,%rsi), %r10
	movss	.LC30(%rip), %xmm6
	movq	%r14, %rbp
	movq	%r15, 64(%rsp)
	movq	%r14, 72(%rsp)
	movl	%r12d, %r11d
	movl	%esi, 44(%rsp)
	movss	%xmm6, 8(%rsp)
	movq	%rdi, 32(%rsp)
	movq	%rdi, %r14
	movq	%r8, %r15
	movq	%r10, %r12
	jmp	.L517
.L563:
	movss	4(%rbx), %xmm4
	movaps	%xmm4, %xmm3
	movss	8(%rbx), %xmm1
	maxss	%xmm1, %xmm3
.L510:
	movaps	%xmm2, %xmm6
	movss	8(%rsp), %xmm7
	maxss	%xmm3, %xmm6
	ucomiss	%xmm6, %xmm7
	jbe	.L554
	movl	$0, 100(%rsp)
	xorl	%eax, %eax
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%esi, %esi
.L516:
	movb	%sil, 0(%rbp)
	movb	%cl, 0(%rbp,%r14)
	addq	$1, %rbp
	movb	%dl, -1(%rbp,%r9)
	movb	%al, -1(%rbp,%r15)
	addq	%r13, %rbx
	cmpq	%r12, %rbp
	je	.L562
.L517:
	cmpl	$1, %r11d
	movss	(%rbx), %xmm2
	jbe	.L563
	movaps	%xmm2, %xmm4
	movaps	%xmm2, %xmm1
	movaps	%xmm2, %xmm3
	jmp	.L510
.L554:
	pxor	%xmm0, %xmm0
	leaq	92(%rsp), %rdi
	movq	%r9, 56(%rsp)
	movl	%r11d, 52(%rsp)
	movss	%xmm2, 48(%rsp)
	movss	%xmm4, 40(%rsp)
	cvtss2sd	%xmm6, %xmm0
	movss	%xmm1, 24(%rsp)
	movss	%xmm6, 20(%rsp)
	call	frexp
	cvtsd2ss	%xmm0, %xmm0
	mulss	.LC31(%rip), %xmm0
	movss	20(%rsp), %xmm3
	movq	56(%rsp), %r9
	movss	48(%rsp), %xmm2
	movl	52(%rsp), %r11d
	movss	40(%rsp), %xmm4
	movss	24(%rsp), %xmm1
	divss	%xmm3, %xmm0
	mulss	%xmm0, %xmm2
	mulss	%xmm0, %xmm4
	mulss	%xmm0, %xmm1
	cvttss2si	%xmm2, %eax
	movl	%eax, %esi
	movb	%al, 100(%rsp)
	cvttss2si	%xmm4, %eax
	movl	%eax, %ecx
	movb	%al, 101(%rsp)
	cvttss2si	%xmm1, %eax
	movl	%eax, %edx
	movb	%al, 102(%rsp)
	movzbl	92(%rsp), %eax
	addl	$-128, %eax
	movb	%al, 103(%rsp)
	jmp	.L516
.L562:
	movq	64(%rsp), %r15
	movq	72(%rsp), %r14
	movl	$4, %edx
	leaq	96(%rsp), %rsi
	movq	8(%r15), %rdi
	call	*(%r15)
	leaq	-1(%r14), %rax
	movl	$4, 40(%rsp)
	movq	%rax, 24(%rsp)
	movl	16(%rsp), %eax
	leal	-2(%rax), %ebp
.L534:
	movq	24(%rsp), %rax
	xorl	%r14d, %r14d
	movq	%r15, %r13
	movl	%r14d, %r15d
	addq	$1, %rax
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L532:
	leal	2(%r15), %edx
	movslq	%r15d, %rax
	addq	8(%rsp), %rax
	cmpl	%edx, 16(%rsp)
	movl	%r15d, %ebx
	jg	.L521
	jmp	.L560
	.p2align 4,,10
	.p2align 3
.L519:
	addl	$1, %ebx
	addq	$1, %rax
	cmpl	%ebp, %ebx
	je	.L560
.L521:
	movzbl	(%rax), %edx
	cmpb	1(%rax), %dl
	jne	.L519
	cmpb	2(%rax), %dl
	jne	.L519
.L520:
	leal	2(%rbx), %eax
	cmpl	%r15d, %ebx
	movl	%eax, 20(%rsp)
	jle	.L524
.L523:
	movl	%ebx, %r12d
	movq	8(%rsp), %rax
	movslq	%r15d, %rsi
	subl	%r15d, %r12d
	cmpl	$128, %r12d
	leaq	(%rax,%rsi), %r14
	jle	.L522
	subl	$-128, %r15d
	movq	8(%r13), %rdi
	movl	$1, %edx
	leaq	92(%rsp), %rsi
	movb	$-128, 92(%rsp)
	call	*0(%r13)
	movq	8(%r13), %rdi
	movl	$128, %edx
	movq	%r14, %rsi
	call	*0(%r13)
	cmpl	%r15d, %ebx
	jg	.L523
.L524:
	movl	20(%rsp), %ecx
	cmpl	%ecx, 16(%rsp)
	jg	.L564
	.p2align 4,,10
	.p2align 3
.L525:
	cmpl	16(%rsp), %r15d
	jl	.L532
.L531:
	movq	32(%rsp), %rcx
	addq	%rcx, 24(%rsp)
	movq	%r13, %r15
	subl	$1, 40(%rsp)
	jne	.L534
	jmp	.L499
	.p2align 4,,10
	.p2align 3
.L522:
	movq	8(%r13), %rdi
	movl	$1, %edx
	leaq	92(%rsp), %rsi
	movb	%r12b, 92(%rsp)
	movl	%ebx, %r15d
	call	*0(%r13)
	movq	8(%r13), %rdi
	movl	%r12d, %edx
	movq	%r14, %rsi
	call	*0(%r13)
	movl	20(%rsp), %ecx
	cmpl	%ecx, 16(%rsp)
	jle	.L525
.L564:
	cmpl	%ebx, 16(%rsp)
	jle	.L526
	movq	8(%rsp), %rcx
	movslq	%r15d, %rax
	movzbl	(%rcx,%rax), %esi
	movslq	%ebx, %rax
	cmpb	(%rcx,%rax), %sil
	jne	.L526
	movl	44(%rsp), %edx
	leal	1(%rbx), %eax
	movq	24(%rsp), %rcx
	cltq
	subl	%ebx, %edx
	addq	%rax, %rdx
	jmp	.L527
	.p2align 4,,10
	.p2align 3
.L565:
	addq	$1, %rax
	cmpb	%sil, (%rcx,%rax)
	jne	.L526
.L527:
	cmpq	%rax, %rdx
	movl	%eax, %ebx
	jne	.L565
.L526:
	cmpl	%ebx, %r15d
	jge	.L540
	movq	8(%rsp), %r12
	movl	$-1, %r14d
.L530:
	movl	%ebx, %eax
	movslq	%r15d, %rdx
	subl	%r15d, %eax
	movzbl	(%r12,%rdx), %edx
	cmpl	$127, %eax
	jle	.L529
	addl	$127, %r15d
	movb	%dl, 91(%rsp)
	movq	8(%r13), %rdi
	movl	$1, %edx
	leaq	92(%rsp), %rsi
	movb	%r14b, 92(%rsp)
	call	*0(%r13)
	movq	8(%r13), %rdi
	movl	$1, %edx
	leaq	91(%rsp), %rsi
	call	*0(%r13)
	cmpl	%r15d, %ebx
	jg	.L530
.L540:
	movl	%r15d, %ebx
	.p2align 4,,10
	.p2align 3
.L528:
	cmpl	%ebx, 16(%rsp)
	jle	.L531
	movl	%ebx, %r15d
	jmp	.L532
	.p2align 4,,10
	.p2align 3
.L560:
	movl	16(%rsp), %ebx
	jmp	.L520
	.p2align 4,,10
	.p2align 3
.L529:
	addl	$-128, %eax
	movb	%dl, 91(%rsp)
	movq	8(%r13), %rdi
	leaq	92(%rsp), %rsi
	movb	%al, 92(%rsp)
	movl	$1, %edx
	call	*0(%r13)
	movq	8(%r13), %rdi
	movl	$1, %edx
	leaq	91(%rsp), %rsi
	call	*0(%r13)
	jmp	.L528
.L536:
	movaps	%xmm2, %xmm1
	movaps	%xmm2, %xmm4
	movaps	%xmm2, %xmm3
	jmp	.L503
.L553:
	pxor	%xmm0, %xmm0
	leaq	92(%rsp), %rdi
	movss	%xmm2, 32(%rsp)
	addl	$1, %r14d
	addq	%rbp, %rbx
	movss	%xmm4, 40(%rsp)
	cvtss2sd	%xmm5, %xmm0
	movss	%xmm1, 24(%rsp)
	movss	%xmm5, 20(%rsp)
	call	frexp
	cvtsd2ss	%xmm0, %xmm0
	mulss	.LC31(%rip), %xmm0
	movl	$4, %edx
	leaq	100(%rsp), %rsi
	movss	20(%rsp), %xmm3
	movq	8(%r15), %rdi
	movss	32(%rsp), %xmm2
	movss	40(%rsp), %xmm4
	movss	24(%rsp), %xmm1
	divss	%xmm3, %xmm0
	mulss	%xmm0, %xmm2
	mulss	%xmm0, %xmm4
	mulss	%xmm0, %xmm1
	cvttss2si	%xmm2, %eax
	movb	%al, 100(%rsp)
	cvttss2si	%xmm4, %eax
	movb	%al, 101(%rsp)
	cvttss2si	%xmm1, %eax
	movb	%al, 102(%rsp)
	movzbl	92(%rsp), %eax
	addl	$-128, %eax
	movb	%al, 103(%rsp)
	call	*(%r15)
	cmpl	%r14d, 16(%rsp)
	jne	.L502
	jmp	.L499
.L561:
	call	__stack_chk_fail
	.cfi_endproc
.LFE730:
	.size	stbiw__write_hdr_scanline, .-stbiw__write_hdr_scanline
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC32:
	.string	"EXPOSURE=          1.0000000000000\n\n-Y %d +X %d\n"
	.text
	.p2align 4,,15
	.type	stbi_write_hdr_core.part.6, @function
stbi_write_hdr_core.part.6:
.LFB765:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%r8, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%ecx, %r14d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leal	0(,%rsi,4), %edi
	movl	%edx, %r12d
	movl	%esi, %ebx
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movslq	%edi, %rdi
	movl	%ecx, 4(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	call	malloc
	movdqa	.LC33(%rip), %xmm0
	movl	$10, %edx
	movq	%rax, %r13
	movw	%dx, 80(%rsp)
	movq	8(%rbp), %rdi
	movaps	%xmm0, 16(%rsp)
	movl	$65, %edx
	leaq	16(%rsp), %rsi
	movdqa	.LC34(%rip), %xmm0
	movaps	%xmm0, 32(%rsp)
	movdqa	.LC35(%rip), %xmm0
	movaps	%xmm0, 48(%rsp)
	movdqa	.LC36(%rip), %xmm0
	movaps	%xmm0, 64(%rsp)
	call	*0(%rbp)
	leaq	96(%rsp), %rdi
	movl	%ebx, %r9d
	movl	%r12d, %r8d
	movl	$.LC32, %ecx
	movl	$128, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__sprintf_chk
	movq	8(%rbp), %rdi
	movl	%eax, %edx
	leaq	96(%rsp), %rsi
	call	*0(%rbp)
	testl	%r12d, %r12d
	jle	.L567
	imull	%ebx, %r14d
	leal	-1(%r12), %eax
	movl	%eax, 12(%rsp)
	movl	%r14d, 8(%rsp)
	xorl	%r14d, %r14d
	jmp	.L568
	.p2align 4,,10
	.p2align 3
.L574:
	movl	12(%rsp), %edx
	subl	%r14d, %edx
	imull	8(%rsp), %edx
.L573:
	imull	%ebx, %edx
	movq	%r13, %rcx
	movl	%ebx, %esi
	movq	%rbp, %rdi
	addl	$1, %r14d
	movslq	%edx, %rdx
	leaq	(%r15,%rdx,4), %r8
	movl	4(%rsp), %edx
	call	stbiw__write_hdr_scanline
	cmpl	%r14d, %r12d
	je	.L567
.L568:
	movl	stbi__flip_vertically_on_write(%rip), %eax
	testl	%eax, %eax
	jne	.L574
	movl	8(%rsp), %edx
	imull	%r14d, %edx
	jmp	.L573
	.p2align 4,,10
	.p2align 3
.L567:
	movq	%r13, %rdi
	call	free
	movq	232(%rsp), %rcx
	xorq	%fs:40, %rcx
	movl	$1, %eax
	jne	.L575
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L575:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE765:
	.size	stbi_write_hdr_core.part.6, .-stbi_write_hdr_core.part.6
	.p2align 4,,15
	.globl	stbi_write_hdr_to_func
	.type	stbi_write_hdr_to_func, @function
stbi_write_hdr_to_func:
.LFB732:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movl	%edx, %r10d
	movl	%ecx, %edx
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	testl	%ecx, %ecx
	movq	%rdi, (%rsp)
	movq	%rsi, 8(%rsp)
	setle	%dil
	testq	%r9, %r9
	sete	%al
	orb	%al, %dil
	jne	.L579
	testl	%r10d, %r10d
	jg	.L581
.L579:
	xorl	%eax, %eax
.L576:
	movq	24(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L582
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L581:
	.cfi_restore_state
	movl	%r8d, %ecx
	movl	%r10d, %esi
	movq	%r9, %r8
	movq	%rsp, %rdi
	call	stbi_write_hdr_core.part.6
	jmp	.L576
.L582:
	call	__stack_chk_fail
	.cfi_endproc
.LFE732:
	.size	stbi_write_hdr_to_func, .-stbi_write_hdr_to_func
	.p2align 4,,15
	.globl	stbi_write_hdr
	.type	stbi_write_hdr, @function
stbi_write_hdr:
.LFB733:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%esi, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	$.LC29, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%edx, %ebp
	movl	%ecx, %r14d
	movq	%r8, %r12
	xorl	%ebx, %ebx
	subq	$32, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	call	fopen
	testq	%rax, %rax
	movq	$stbi__stdio_write, (%rsp)
	movq	%rax, 8(%rsp)
	je	.L583
	testl	%ebp, %ebp
	setle	%cl
	testq	%r12, %r12
	sete	%dl
	orb	%dl, %cl
	jne	.L588
	testl	%r13d, %r13d
	jg	.L592
.L588:
	xorl	%ebx, %ebx
.L585:
	movq	%rax, %rdi
	call	fclose
.L583:
	movq	24(%rsp), %rsi
	xorq	%fs:40, %rsi
	movl	%ebx, %eax
	jne	.L593
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L592:
	.cfi_restore_state
	movq	%r12, %r8
	movl	%r14d, %ecx
	movl	%ebp, %edx
	movl	%r13d, %esi
	movq	%rsp, %rdi
	call	stbi_write_hdr_core.part.6
	movl	%eax, %ebx
	movq	8(%rsp), %rax
	jmp	.L585
.L593:
	call	__stack_chk_fail
	.cfi_endproc
.LFE733:
	.size	stbi_write_hdr, .-stbi_write_hdr
	.section	.rodata.str1.1
.LC37:
	.string	"d <= 32767 && best <= 258"
	.text
	.p2align 4,,15
	.globl	stbi_zlib_compress
	.type	stbi_zlib_compress, @function
stbi_zlib_compress:
.LFB739:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$131072, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%ecx, %ebx
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movl	%esi, 40(%rsp)
	movq	%rdx, 72(%rsp)
	movl	$0, 80(%rsp)
	movl	$0, 84(%rsp)
	call	malloc
	testq	%rax, %rax
	movq	%rax, 16(%rsp)
	je	.L660
	cmpl	$5, %ebx
	movl	$5, %eax
	movl	$10, %esi
	cmovge	%ebx, %eax
	xorl	%edi, %edi
	movl	%eax, 60(%rsp)
	call	realloc
	testq	%rax, %rax
	je	.L608
	movabsq	$4294967298, %rbx
	movb	$120, 8(%rax)
	movl	$13, %esi
	movq	%rbx, (%rax)
	movq	%rax, %rdi
	call	realloc
	testq	%rax, %rax
	je	.L608
	movslq	4(%rax), %rdx
	movl	$1, %ebx
	leaq	8(%rax), %rdi
	movl	$5, (%rax)
	leaq	80(%rsp), %rsi
	leal	1(%rdx), %ecx
	movl	%ecx, 4(%rax)
	movl	84(%rsp), %ecx
	movb	$94, 8(%rax,%rdx)
	movl	%ebx, %eax
	leaq	84(%rsp), %rdx
	sall	%cl, %eax
	addl	$1, %ecx
	orl	%eax, 80(%rsp)
	movl	%ecx, 84(%rsp)
	call	stbiw__zlib_flushf
	movl	84(%rsp), %ecx
	leaq	84(%rsp), %rdx
	leaq	80(%rsp), %rsi
	movq	%rax, %rdi
	sall	%cl, %ebx
	addl	$2, %ecx
	orl	%ebx, 80(%rsp)
	movl	%ecx, 84(%rsp)
	call	stbiw__zlib_flushf
	movq	16(%rsp), %rdi
	movl	$131072, %edx
	xorl	%esi, %esi
	movq	%rax, 8(%rsp)
	call	memset
	movslq	60(%rsp), %rax
	movl	$0, 4(%rsp)
	leal	(%rax,%rax), %ebx
	salq	$3, %rax
	movq	%rax, 64(%rsp)
	movl	40(%rsp), %eax
	movl	%ebx, 52(%rsp)
	leal	-3(%rax), %ebx
	subl	$1, %eax
	movl	%eax, 56(%rsp)
	movl	%ebx, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L597:
	movl	4(%rsp), %ebx
	cmpl	%ebx, 48(%rsp)
	jle	.L727
.L625:
	movslq	%ebx, %rax
	leaq	(%r14,%rax), %rbx
	movq	%rax, %rsi
	movq	%rax, 32(%rsp)
	movzbl	1(%rbx), %eax
	movzbl	(%rbx), %ecx
	sall	$8, %eax
	movl	%ecx, %r12d
	movl	%ecx, 44(%rsp)
	leal	(%rax,%rcx), %edx
	movzbl	2(%rbx), %eax
	movq	16(%rsp), %rcx
	sall	$16, %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$5, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	sall	$4, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	sall	$25, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$6, %edx
	addl	%edx, %eax
	andl	$16383, %eax
	leaq	(%rcx,%rax,8), %rax
	movq	(%rax), %r9
	movq	%rax, 24(%rsp)
	testq	%r9, %r9
	je	.L598
	movslq	-4(%r9), %r10
	testl	%r10d, %r10d
	jle	.L661
	movl	40(%rsp), %edi
	leal	-32768(%rsi), %r11d
	leal	-1(%r10), %eax
	movq	%r9, %rcx
	xorl	%r13d, %r13d
	movl	$3, %ebp
	movslq	%r11d, %r11
	leaq	8(%r9,%rax,8), %r15
	subl	%esi, %edi
	jmp	.L605
	.p2align 4,,10
	.p2align 3
.L600:
	addq	$8, %rcx
	cmpq	%rcx, %r15
	je	.L599
.L605:
	movq	(%rcx), %rdx
	movq	%rdx, %rax
	subq	%r14, %rax
	cmpq	%r11, %rax
	jle	.L600
	testl	%edi, %edi
	jle	.L600
	cmpb	(%rdx), %r12b
	jne	.L600
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L601:
	cmpl	%eax, %edi
	movl	%eax, %r8d
	jle	.L602
	cmpl	$257, %eax
	jg	.L602
	movzbl	(%rdx,%rax), %esi
	addq	$1, %rax
	cmpb	-1(%rbx,%rax), %sil
	je	.L601
.L602:
	cmpl	%ebp, %r8d
	jl	.L600
	addq	$8, %rcx
	movq	%rdx, %r13
	movl	%r8d, %ebp
	cmpq	%rcx, %r15
	jne	.L605
	.p2align 4,,10
	.p2align 3
.L599:
	cmpl	%r10d, 52(%rsp)
	je	.L728
.L606:
	movl	-8(%r9), %edx
	leal	1(%r10), %eax
	cmpl	%edx, %eax
	jl	.L647
	leal	1(%rdx,%rdx), %r15d
	leaq	-8(%r9), %rdi
	leal	0(,%r15,8), %esi
	movslq	%esi, %rsi
	addq	$8, %rsi
	call	realloc
	testq	%rax, %rax
	je	.L608
.L607:
	movslq	4(%rax), %r10
	movq	24(%rsp), %rsi
	leaq	8(%rax), %r9
	movl	%r15d, (%rax)
	movq	%r9, (%rsi)
	leal	1(%r10), %eax
.L647:
	testq	%r13, %r13
	movl	%eax, -4(%r9)
	movq	%rbx, (%r9,%r10,8)
	je	.L609
	movq	32(%rsp), %rax
	movq	16(%rsp), %rsi
	leaq	1(%r14,%rax), %rcx
	movzbl	1(%rcx), %eax
	movzbl	(%rcx), %edx
	sall	$8, %eax
	movl	%edx, %r11d
	addl	%eax, %edx
	movzbl	2(%rcx), %eax
	sall	$16, %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$5, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	sall	$4, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	sall	$25, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$6, %edx
	addl	%edx, %eax
	andl	$16383, %eax
	movq	(%rsi,%rax,8), %rdx
	testq	%rdx, %rdx
	je	.L610
	movl	-4(%rdx), %eax
	testl	%eax, %eax
	jle	.L610
	movl	4(%rsp), %esi
	movl	56(%rsp), %edi
	subl	$1, %eax
	leaq	8(%rdx,%rax,8), %r10
	leal	-32767(%rsi), %r9d
	subl	%esi, %edi
	movslq	%r9d, %r9
	jmp	.L616
	.p2align 4,,10
	.p2align 3
.L611:
	addq	$8, %rdx
	cmpq	%rdx, %r10
	je	.L610
.L616:
	movq	(%rdx), %rcx
	movq	%rcx, %rax
	subq	%r14, %rax
	cmpq	%r9, %rax
	jle	.L611
	testl	%edi, %edi
	jle	.L611
	cmpb	%r11b, (%rcx)
	jne	.L611
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L612:
	cmpl	%eax, %edi
	movl	%eax, %r8d
	jle	.L613
	cmpl	$257, %eax
	jg	.L613
	movzbl	(%rcx,%rax), %esi
	addq	$1, %rax
	cmpb	(%rbx,%rax), %sil
	je	.L612
.L613:
	cmpl	%r8d, %ebp
	jge	.L611
.L609:
	cmpb	$-113, %r12b
	movl	84(%rsp), %ecx
	movl	80(%rsp), %esi
	ja	.L729
	movl	44(%rsp), %eax
	addl	$48, %eax
	leal	(%rax,%rax), %edx
	movl	%eax, %edi
	sarl	%edi
	andl	$1, %edi
	andl	$2, %edx
	orl	%edi, %edx
	leal	(%rdx,%rdx), %edi
	movl	%eax, %edx
	sarl	$2, %edx
	andl	$1, %edx
	orl	%edi, %edx
	movl	%eax, %edi
	sarl	$3, %edi
	addl	%edx, %edx
	andl	$1, %edi
	orl	%edx, %edi
	leal	(%rdi,%rdi), %edx
	movl	%eax, %edi
	sarl	$4, %edi
	andl	$1, %edi
	orl	%edx, %edi
	movl	%eax, %edx
	sarl	$5, %edx
	addl	%edi, %edi
	andl	$1, %edx
	orl	%edi, %edx
	leal	(%rdx,%rdx), %edi
	movl	%eax, %edx
	sarl	$7, %eax
	sarl	$6, %edx
	andl	$1, %edx
	orl	%edi, %edx
	addl	%edx, %edx
	orl	%edx, %eax
	sall	%cl, %eax
	addl	$8, %ecx
	orl	%esi, %eax
	movl	%eax, 80(%rsp)
.L725:
	movq	8(%rsp), %rdi
	leaq	84(%rsp), %rdx
	leaq	80(%rsp), %rsi
	movl	%ecx, 84(%rsp)
	call	stbiw__zlib_flushf
	addl	$1, 4(%rsp)
	movq	%rax, 8(%rsp)
	movl	4(%rsp), %ebx
	cmpl	%ebx, 48(%rsp)
	jg	.L625
.L727:
	movl	40(%rsp), %ecx
	movl	%ebx, %esi
	cmpl	%ecx, %ebx
	jge	.L626
	movslq	%ebx, %rax
	leaq	1(%r14,%rax), %rbx
	leaq	(%r14,%rax), %rbp
	leal	-1(%rcx), %eax
	subl	%esi, %eax
	addq	%rax, %rbx
	movq	8(%rsp), %rax
.L629:
	movzbl	0(%rbp), %edx
	movl	84(%rsp), %ecx
	movl	80(%rsp), %edi
	cmpb	$-113, %dl
	ja	.L627
	addl	$48, %edx
	leal	(%rdx,%rdx), %esi
	movl	%edx, %r8d
	sarl	%r8d
	andl	$1, %r8d
	andl	$2, %esi
	orl	%r8d, %esi
	leal	(%rsi,%rsi), %r8d
	movl	%edx, %esi
	sarl	$2, %esi
	andl	$1, %esi
	orl	%r8d, %esi
	leal	(%rsi,%rsi), %r8d
	movl	%edx, %esi
	sarl	$3, %esi
	andl	$1, %esi
	orl	%r8d, %esi
	leal	(%rsi,%rsi), %r8d
	movl	%edx, %esi
	sarl	$4, %esi
	andl	$1, %esi
	orl	%r8d, %esi
	leal	(%rsi,%rsi), %r8d
	movl	%edx, %esi
	sarl	$5, %esi
	andl	$1, %esi
	orl	%r8d, %esi
	leal	(%rsi,%rsi), %r8d
	movl	%edx, %esi
	sarl	$7, %edx
	sarl	$6, %esi
	andl	$1, %esi
	orl	%r8d, %esi
	addl	%esi, %esi
	orl	%esi, %edx
	sall	%cl, %edx
	addl	$8, %ecx
	orl	%edi, %edx
	movl	%edx, 80(%rsp)
.L726:
	leaq	84(%rsp), %rdx
	leaq	80(%rsp), %rsi
	movq	%rax, %rdi
	addq	$1, %rbp
	movl	%ecx, 84(%rsp)
	call	stbiw__zlib_flushf
	cmpq	%rbx, %rbp
	jne	.L629
	movq	%rax, 8(%rsp)
.L626:
	movq	8(%rsp), %rdi
	leaq	84(%rsp), %rdx
	leaq	80(%rsp), %rsi
	addl	$7, 84(%rsp)
	call	stbiw__zlib_flushf
	movq	%rax, %rbp
	movl	84(%rsp), %eax
	testl	%eax, %eax
	je	.L630
	movl	%eax, %edx
	movq	%rbp, %rax
	.p2align 4,,10
	.p2align 3
.L631:
	addl	$1, %edx
	leaq	80(%rsp), %rsi
	movq	%rax, %rdi
	movl	%edx, 84(%rsp)
	leaq	84(%rsp), %rdx
	call	stbiw__zlib_flushf
	movl	84(%rsp), %edx
	testl	%edx, %edx
	jne	.L631
	movq	%rax, %rbp
.L630:
	movq	16(%rsp), %rax
	leaq	131072(%rax), %rbx
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L633:
	movq	(%r12), %rdi
	testq	%rdi, %rdi
	je	.L632
	subq	$8, %rdi
	call	free
.L632:
	addq	$8, %r12
	cmpq	%rbx, %r12
	jne	.L633
	movq	16(%rsp), %rdi
	xorl	%r12d, %r12d
	call	free
	movl	40(%rsp), %eax
	movl	$1584310703, %edx
	movl	40(%rsp), %ebx
	imull	%edx
	movl	%ebx, %eax
	sarl	$31, %eax
	sarl	$11, %edx
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ebx, %eax
	imull	$5552, %ecx, %ecx
	subl	%ecx, %ebx
	testl	%eax, %eax
	movl	%ebx, %ecx
	movl	$1, %ebx
	jle	.L635
	testl	%ecx, %ecx
	jle	.L730
	xorl	%edi, %edi
	xorl	%r12d, %r12d
	movl	$1, %ebx
	.p2align 4,,10
	.p2align 3
.L637:
	movslq	%edi, %rsi
	xorl	%eax, %eax
	addq	%r14, %rsi
	.p2align 4,,10
	.p2align 3
.L636:
	movzbl	(%rsi,%rax), %edx
	addq	$1, %rax
	addl	%edx, %ebx
	addl	%ebx, %r12d
	cmpl	%eax, %ecx
	jg	.L636
	movl	%ebx, %eax
	movl	$-2146992015, %esi
	mull	%esi
	movl	%r12d, %eax
	shrl	$15, %edx
	imull	$65521, %edx, %edx
	subl	%edx, %ebx
	mull	%esi
	shrl	$15, %edx
	imull	$65521, %edx, %edx
	subl	%edx, %r12d
.L638:
	addl	%ecx, %edi
	cmpl	%edi, 40(%rsp)
	movl	$5552, %ecx
	jg	.L637
.L635:
	testq	%rbp, %rbp
	je	.L639
	movslq	-4(%rbp), %rax
	movl	-8(%rbp), %esi
	leaq	-8(%rbp), %rcx
	leal	1(%rax), %edx
	cmpl	%esi, %edx
	jl	.L640
	leal	1(%rsi,%rsi), %r13d
	movq	%rcx, %rdi
	movslq	%r13d, %rsi
	addq	$8, %rsi
	call	realloc
	testq	%rax, %rax
	movq	%rax, %rcx
	je	.L608
.L642:
	movslq	4(%rcx), %rax
	leaq	8(%rcx), %rbp
	movl	%r13d, (%rcx)
	leal	1(%rax), %edx
.L640:
	movl	%edx, -4(%rbp)
	movl	%r12d, %edx
	movb	%dh, 0(%rbp,%rax)
	movslq	-4(%rbp), %rax
	movl	-8(%rbp), %esi
	leal	1(%rax), %edx
	cmpl	%esi, %edx
	jl	.L643
	leal	1(%rsi,%rsi), %r13d
	movq	%rcx, %rdi
	movslq	%r13d, %rsi
	addq	$8, %rsi
	call	realloc
	testq	%rax, %rax
	movq	%rax, %rcx
	je	.L608
	leaq	8(%rax), %rbp
	movl	%r13d, (%rax)
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
.L643:
	movl	%edx, -4(%rbp)
	movb	%r12b, 0(%rbp,%rax)
	movslq	-4(%rbp), %rax
	movl	-8(%rbp), %esi
	leal	1(%rax), %edx
	cmpl	%esi, %edx
	jl	.L644
	leal	1(%rsi,%rsi), %r12d
	movq	%rcx, %rdi
	movslq	%r12d, %rsi
	addq	$8, %rsi
	call	realloc
	testq	%rax, %rax
	movq	%rax, %rcx
	je	.L608
	leaq	8(%rax), %rbp
	movl	%r12d, (%rax)
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
.L644:
	movl	%edx, -4(%rbp)
	movb	%bh, 0(%rbp,%rax)
	movslq	-4(%rbp), %rax
	movl	-8(%rbp), %esi
	leal	1(%rax), %edx
	cmpl	%esi, %edx
	jge	.L655
.L656:
	movl	%edx, -4(%rbp)
	movb	%bl, 0(%rbp,%rax)
	movq	%rcx, %rdi
	movslq	-4(%rbp), %rdx
	movq	72(%rsp), %rbx
	movq	%rbp, %rsi
	movl	%edx, (%rbx)
	call	memmove
	movq	%rax, %rcx
.L594:
	movq	88(%rsp), %rbx
	xorq	%fs:40, %rbx
	movq	%rcx, %rax
	jne	.L731
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L610:
	.cfi_restore_state
	subq	%r13, %rbx
	cmpl	$32767, %ebx
	movl	%ebx, %r12d
	jg	.L650
	cmpl	$258, %ebp
	jg	.L650
	movl	$lengthc.8439+2, %eax
	xorl	%r13d, %r13d
	jmp	.L617
	.p2align 4,,10
	.p2align 3
.L663:
	movslq	%edx, %r13
.L617:
	movzwl	(%rax), %ecx
	addq	$2, %rax
	leal	1(%r13), %edx
	cmpl	%ebp, %ecx
	jle	.L663
	cmpl	$22, %r13d
	movl	84(%rsp), %ecx
	movl	80(%rsp), %esi
	jg	.L618
	leal	(%rdx,%rdx), %edi
	movl	%edx, %eax
	sarl	%eax
	andl	$1, %eax
	andl	$2, %edi
	orl	%eax, %edi
	movl	%edx, %eax
	sarl	$2, %eax
	addl	%edi, %edi
	andl	$1, %eax
	orl	%edi, %eax
	leal	(%rax,%rax), %edi
	movl	%edx, %eax
	sarl	$4, %edx
	sarl	$3, %eax
	andl	$1, %eax
	orl	%edi, %eax
	addl	%eax, %eax
	orl	%eax, %edx
	leal	0(,%rdx,4), %eax
	sall	%cl, %eax
	addl	$7, %ecx
	orl	%esi, %eax
	movl	%eax, 80(%rsp)
.L724:
	movq	8(%rsp), %rdi
	leaq	84(%rsp), %rdx
	leaq	80(%rsp), %rsi
	movl	%ecx, 84(%rsp)
	call	stbiw__zlib_flushf
	movzbl	lengtheb.8440(%r13), %edx
	movq	%rax, %rdi
	movl	84(%rsp), %ecx
	movl	80(%rsp), %r8d
	testb	%dl, %dl
	jne	.L732
.L620:
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L621:
	movzwl	distc.8441+2(%rdx,%rdx), %eax
	movslq	%edx, %r13
	addq	$1, %rdx
	cmpl	%r12d, %eax
	jle	.L621
	leal	(%r13,%r13), %edx
	movl	%r13d, %eax
	leaq	80(%rsp), %rsi
	sarl	%eax
	andl	$1, %eax
	andl	$2, %edx
	orl	%eax, %edx
	leal	(%rdx,%rdx), %eax
	movl	%r13d, %edx
	sarl	$2, %edx
	andl	$1, %edx
	orl	%eax, %edx
	movl	%r13d, %eax
	sarl	$3, %eax
	addl	%edx, %edx
	andl	$1, %eax
	orl	%edx, %eax
	leal	(%rax,%rax), %edx
	movl	%r13d, %eax
	sarl	$4, %eax
	orl	%edx, %eax
	leaq	84(%rsp), %rdx
	sall	%cl, %eax
	addl	$5, %ecx
	orl	%r8d, %eax
	movl	%ecx, 84(%rsp)
	movl	%eax, 80(%rsp)
	call	stbiw__zlib_flushf
	movq	%rax, 8(%rsp)
	movzbl	disteb.8442(%r13), %eax
	testb	%al, %al
	jne	.L733
.L622:
	addl	%ebp, 4(%rsp)
	jmp	.L597
	.p2align 4,,10
	.p2align 3
.L732:
	movzwl	lengthc.8439(%r13,%r13), %eax
	movl	%ebp, %esi
	subl	%eax, %esi
	movl	%esi, %eax
	leaq	80(%rsp), %rsi
	sall	%cl, %eax
	addl	%edx, %ecx
	leaq	84(%rsp), %rdx
	orl	%r8d, %eax
	movl	%ecx, 84(%rsp)
	movl	%eax, 80(%rsp)
	call	stbiw__zlib_flushf
	movl	84(%rsp), %ecx
	movq	%rax, %rdi
	movl	80(%rsp), %r8d
	jmp	.L620
	.p2align 4,,10
	.p2align 3
.L598:
	xorl	%edi, %edi
	movl	$24, %esi
	call	realloc
	testq	%rax, %rax
	je	.L608
	movl	$0, 4(%rax)
	xorl	%r13d, %r13d
	movl	$3, %ebp
	movl	$2, %r15d
	jmp	.L607
	.p2align 4,,10
	.p2align 3
.L618:
	leal	169(%r13), %eax
	leal	(%rax,%rax), %edx
	movl	%eax, %edi
	sarl	$2, %eax
	sarl	%edi
	andl	$1, %eax
	andl	$2, %edx
	andl	$1, %edi
	orl	%edi, %edx
	addl	%edx, %edx
	orl	%edx, %eax
	sall	$5, %eax
	orl	$3, %eax
	sall	%cl, %eax
	addl	$8, %ecx
	orl	%esi, %eax
	movl	%eax, 80(%rsp)
	jmp	.L724
	.p2align 4,,10
	.p2align 3
.L729:
	movl	44(%rsp), %eax
	addl	$256, %eax
	leal	(%rax,%rax), %edx
	movl	%eax, %edi
	sarl	%edi
	andl	$1, %edi
	andl	$2, %edx
	orl	%edi, %edx
	movl	%eax, %edi
	sarl	$2, %edi
	addl	%edx, %edx
	andl	$1, %edi
	orl	%edx, %edi
	leal	(%rdi,%rdi), %edx
	movl	%eax, %edi
	sarl	$3, %edi
	andl	$1, %edi
	orl	%edx, %edi
	movl	%eax, %edx
	sarl	$4, %edx
	addl	%edi, %edi
	andl	$1, %edx
	orl	%edi, %edx
	leal	(%rdx,%rdx), %edi
	movl	%eax, %edx
	sarl	$6, %eax
	sarl	$5, %edx
	andl	$1, %eax
	andl	$1, %edx
	orl	%edi, %edx
	addl	%edx, %edx
	orl	%eax, %edx
	leal	3(,%rdx,4), %eax
	sall	%cl, %eax
	addl	$9, %ecx
	orl	%esi, %eax
	movl	%eax, 80(%rsp)
	jmp	.L725
	.p2align 4,,10
	.p2align 3
.L733:
	movzwl	distc.8441(%r13,%r13), %edx
	movl	84(%rsp), %ecx
	leaq	80(%rsp), %rsi
	movq	8(%rsp), %rdi
	addl	%ecx, %eax
	subl	%edx, %ebx
	leaq	84(%rsp), %rdx
	movl	%eax, 84(%rsp)
	sall	%cl, %ebx
	orl	%ebx, 80(%rsp)
	call	stbiw__zlib_flushf
	movq	%rax, 8(%rsp)
	jmp	.L622
	.p2align 4,,10
	.p2align 3
.L728:
	movq	64(%rsp), %rdx
	movq	%r9, %rdi
	leaq	(%r9,%rdx), %rsi
	call	memmove
	movq	%rax, %r9
	movl	60(%rsp), %eax
	movl	%eax, -4(%r9)
	movslq	%eax, %r10
	jmp	.L606
	.p2align 4,,10
	.p2align 3
.L627:
	addl	$256, %edx
	leal	(%rdx,%rdx), %esi
	movl	%edx, %r8d
	sarl	%r8d
	andl	$1, %r8d
	andl	$2, %esi
	orl	%r8d, %esi
	leal	(%rsi,%rsi), %r8d
	movl	%edx, %esi
	sarl	$2, %esi
	andl	$1, %esi
	orl	%r8d, %esi
	leal	(%rsi,%rsi), %r8d
	movl	%edx, %esi
	sarl	$3, %esi
	andl	$1, %esi
	orl	%r8d, %esi
	leal	(%rsi,%rsi), %r8d
	movl	%edx, %esi
	sarl	$4, %esi
	andl	$1, %esi
	orl	%r8d, %esi
	leal	(%rsi,%rsi), %r8d
	movl	%edx, %esi
	sarl	$5, %esi
	andl	$1, %esi
	orl	%r8d, %esi
	leal	(%rsi,%rsi), %r8d
	movl	%edx, %esi
	sarl	$6, %esi
	andl	$1, %esi
	orl	%r8d, %esi
	leal	3(,%rsi,4), %esi
	sall	%cl, %esi
	addl	$9, %ecx
	orl	%edi, %esi
	movl	%esi, 80(%rsp)
	jmp	.L726
.L655:
	leal	1(%rsi,%rsi), %r12d
	movq	%rcx, %rdi
	movslq	%r12d, %rsi
	addq	$8, %rsi
	call	realloc
	testq	%rax, %rax
	movq	%rax, %rcx
	je	.L608
	leaq	8(%rax), %rbp
	movl	%r12d, (%rax)
	movslq	4(%rax), %rax
	leal	1(%rax), %edx
	jmp	.L656
.L661:
	xorl	%r13d, %r13d
	movl	$3, %ebp
	jmp	.L599
.L730:
	xorl	%r12d, %r12d
	movl	$1, %ebx
	xorl	%edi, %edi
	jmp	.L638
.L639:
	xorl	%edi, %edi
	movl	$10, %esi
	call	realloc
	testq	%rax, %rax
	movq	%rax, %rcx
	je	.L608
	movl	$0, 4(%rcx)
	movl	$2, %r13d
	jmp	.L642
.L660:
	xorl	%ecx, %ecx
	jmp	.L594
.L608:
	call	stbiw__sbgrowf.part.2
.L650:
	movl	$__PRETTY_FUNCTION__.8466, %ecx
	movl	$876, %edx
	movl	$.LC0, %esi
	movl	$.LC37, %edi
	call	__assert_fail
.L731:
	call	__stack_chk_fail
	.cfi_endproc
.LFE739:
	.size	stbi_zlib_compress, .-stbi_zlib_compress
	.section	.rodata.str1.1
.LC39:
	.string	"o == out + *out_len"
	.text
	.p2align 4,,15
	.globl	stbi_write_png_to_mem
	.type	stbi_write_png_to_mem, @function
stbi_write_png_to_mem:
.LFB744:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%ecx, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	movl	%edx, 12(%rsp)
	movl	stbi_write_force_png_filter(%rip), %eax
	imull	%r8d, %edx
	testl	%esi, %esi
	movq	%rdi, 16(%rsp)
	movdqa	.LC38(%rip), %xmm0
	movl	%eax, %edi
	movl	%r8d, 24(%rsp)
	movq	%r9, 80(%rsp)
	cmove	%edx, %esi
	leal	1(%rdx), %ebp
	cmpl	$5, %eax
	movl	$-1, %eax
	movl	$6, 128(%rsp)
	movl	%edx, %r14d
	cmovl	%edi, %eax
	movl	%esi, 28(%rsp)
	movl	%eax, 88(%rsp)
	movl	%ebp, %eax
	imull	%ecx, %eax
	movaps	%xmm0, 112(%rsp)
	movslq	%eax, %rdi
	movl	%eax, 92(%rsp)
	call	malloc
	testq	%rax, %rax
	movq	%rax, 72(%rsp)
	je	.L737
	movslq	%r14d, %rax
	movq	%rax, %rdi
	movq	%rax, 56(%rsp)
	call	malloc
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L738
	testl	%r13d, %r13d
	jle	.L740
	movslq	%ebp, %rax
	movq	%rbx, %r11
	movl	%r13d, (%rsp)
	movq	%rax, 64(%rsp)
	movq	72(%rsp), %rax
	negq	%r11
	movl	%r11d, %r15d
	movl	%r14d, %r13d
	andl	$15, %r15d
	addq	$1, %rax
	leal	15(%r15), %edi
	movq	%rax, 32(%rsp)
	leal	-1(%r14), %eax
	cmpl	$17, %edi
	movl	%eax, 44(%rsp)
	movl	$17, %eax
	cmovnb	%edi, %eax
	xorl	%r12d, %r12d
	movl	%eax, 40(%rsp)
	movl	%r14d, %eax
	movl	%r15d, %r14d
	subl	%r15d, %eax
	movl	%eax, %ebp
	movl	%eax, 52(%rsp)
	andl	$-16, %eax
	shrl	$4, %ebp
	movl	%eax, 48(%rsp)
	jmp	.L752
	.p2align 4,,10
	.p2align 3
.L796:
	pushq	%rbx
	.cfi_def_cfa_offset 216
	pushq	%r15
	.cfi_def_cfa_offset 224
	movl	%r12d, %r8d
	movl	40(%rsp), %r9d
	movl	16(%rsp), %ecx
	movl	28(%rsp), %edx
	movl	44(%rsp), %esi
	movq	32(%rsp), %rdi
	call	stbiw__encode_png_line
	popq	%r8
	.cfi_def_cfa_offset 216
	popq	%r9
	.cfi_def_cfa_offset 208
	movl	%r15d, 4(%rsp)
.L743:
	movzbl	4(%rsp), %edi
	movq	32(%rsp), %r15
	movq	%rbx, %rsi
	movq	56(%rsp), %rdx
	addl	$1, %r12d
	movb	%dil, -1(%r15)
	movq	%r15, %rdi
	call	memcpy
	movq	64(%rsp), %rdi
	addq	%rdi, %rax
	cmpl	%r12d, (%rsp)
	movq	%rax, 32(%rsp)
	je	.L795
.L752:
	movl	88(%rsp), %r15d
	testl	%r15d, %r15d
	jns	.L796
	xorl	%r15d, %r15d
	movl	%r14d, %eax
	movl	$2147483647, 8(%rsp)
	movl	%r15d, %r14d
	movl	$0, 4(%rsp)
	movl	%ebp, %r15d
	movl	%eax, %ebp
.L742:
	pushq	%rbx
	.cfi_def_cfa_offset 216
	pushq	%r14
	.cfi_def_cfa_offset 224
	movl	%r12d, %r8d
	movl	40(%rsp), %r9d
	movl	16(%rsp), %ecx
	movl	28(%rsp), %edx
	movl	44(%rsp), %esi
	movq	32(%rsp), %rdi
	call	stbiw__encode_png_line
	testl	%r13d, %r13d
	popq	%rsi
	.cfi_def_cfa_offset 216
	popq	%rdi
	.cfi_def_cfa_offset 208
	jle	.L758
	movl	44(%rsp), %edi
	cmpl	%edi, 40(%rsp)
	ja	.L759
	testl	%ebp, %ebp
	je	.L760
	movsbl	(%rbx), %esi
	movl	%esi, %edx
	sarl	$31, %edx
	xorl	%edx, %esi
	subl	%edx, %esi
	cmpl	$1, %ebp
	je	.L761
	movsbl	1(%rbx), %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %edx
	subl	%ecx, %edx
	addl	%edx, %esi
	cmpl	$2, %ebp
	je	.L762
	movsbl	2(%rbx), %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %edx
	subl	%ecx, %edx
	addl	%edx, %esi
	cmpl	$3, %ebp
	je	.L763
	movsbl	3(%rbx), %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %edx
	subl	%ecx, %edx
	addl	%edx, %esi
	cmpl	$4, %ebp
	je	.L764
	movsbl	4(%rbx), %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %edx
	subl	%ecx, %edx
	addl	%edx, %esi
	cmpl	$5, %ebp
	je	.L765
	movsbl	5(%rbx), %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %edx
	subl	%ecx, %edx
	addl	%edx, %esi
	cmpl	$6, %ebp
	je	.L766
	movsbl	6(%rbx), %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %edx
	subl	%ecx, %edx
	addl	%edx, %esi
	cmpl	$7, %ebp
	je	.L767
	movsbl	7(%rbx), %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %edx
	subl	%ecx, %edx
	addl	%edx, %esi
	cmpl	$8, %ebp
	je	.L768
	movsbl	8(%rbx), %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %edx
	subl	%ecx, %edx
	addl	%edx, %esi
	cmpl	$9, %ebp
	je	.L769
	movsbl	9(%rbx), %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %edx
	subl	%ecx, %edx
	addl	%edx, %esi
	cmpl	$10, %ebp
	je	.L770
	movsbl	10(%rbx), %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %edx
	subl	%ecx, %edx
	addl	%edx, %esi
	cmpl	$11, %ebp
	je	.L771
	movsbl	11(%rbx), %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %edx
	subl	%ecx, %edx
	addl	%edx, %esi
	cmpl	$12, %ebp
	je	.L772
	movsbl	12(%rbx), %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %edx
	subl	%ecx, %edx
	addl	%edx, %esi
	cmpl	$13, %ebp
	je	.L773
	movsbl	13(%rbx), %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %edx
	subl	%ecx, %edx
	addl	%edx, %esi
	cmpl	$15, %ebp
	jne	.L774
	movsbl	14(%rbx), %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	xorl	%ecx, %edx
	subl	%ecx, %edx
	movl	$15, %ecx
	addl	%edx, %esi
	.p2align 4,,10
	.p2align 3
.L746:
	pxor	%xmm2, %xmm2
	movl	%ebp, %edx
	xorl	%edi, %edi
	addq	%rbx, %rdx
	.p2align 4,,10
	.p2align 3
.L748:
	movdqa	(%rdx), %xmm0
	addl	$1, %edi
	addq	$16, %rdx
	cmpl	%edi, %r15d
	pmovsxbw	%xmm0, %xmm1
	psrldq	$8, %xmm0
	pmovsxbw	%xmm0, %xmm0
	pmovsxwd	%xmm1, %xmm3
	psrldq	$8, %xmm1
	pmovsxwd	%xmm1, %xmm1
	pabsd	%xmm3, %xmm3
	pabsd	%xmm1, %xmm1
	paddd	%xmm3, %xmm2
	paddd	%xmm1, %xmm2
	pmovsxwd	%xmm0, %xmm1
	psrldq	$8, %xmm0
	pmovsxwd	%xmm0, %xmm0
	pabsd	%xmm1, %xmm1
	pabsd	%xmm0, %xmm0
	paddd	%xmm1, %xmm2
	paddd	%xmm0, %xmm2
	ja	.L748
	movdqa	%xmm2, %xmm0
	movl	48(%rsp), %eax
	psrldq	$8, %xmm0
	paddd	%xmm0, %xmm2
	movdqa	%xmm2, %xmm0
	addl	%eax, %ecx
	psrldq	$4, %xmm0
	paddd	%xmm0, %xmm2
	movd	%xmm2, %edx
	addl	%edx, %esi
	cmpl	52(%rsp), %eax
	je	.L744
.L745:
	movslq	%ecx, %rcx
	.p2align 4,,10
	.p2align 3
.L750:
	movsbl	(%rbx,%rcx), %eax
	addq	$1, %rcx
	cltd
	xorl	%edx, %eax
	subl	%edx, %eax
	addl	%eax, %esi
	cmpl	%ecx, %r13d
	jg	.L750
.L744:
	cmpl	%esi, 8(%rsp)
	jle	.L751
	movl	%esi, 8(%rsp)
	movl	%r14d, 4(%rsp)
.L751:
	addl	$1, %r14d
	cmpl	$5, %r14d
	jne	.L742
	movl	4(%rsp), %eax
	movl	%ebp, %r14d
	movl	%r15d, %ebp
	cmpl	$5, %eax
	je	.L743
	pushq	%rbx
	.cfi_def_cfa_offset 216
	pushq	%rax
	.cfi_def_cfa_offset 224
	movl	%r12d, %r8d
	movl	40(%rsp), %r9d
	movl	16(%rsp), %ecx
	movl	28(%rsp), %edx
	movl	44(%rsp), %esi
	movq	32(%rsp), %rdi
	call	stbiw__encode_png_line
	popq	%rdx
	.cfi_def_cfa_offset 216
	popq	%rcx
	.cfi_def_cfa_offset 208
	jmp	.L743
	.p2align 4,,10
	.p2align 3
.L758:
	xorl	%esi, %esi
	jmp	.L744
	.p2align 4,,10
	.p2align 3
.L761:
	movl	$1, %ecx
	jmp	.L746
	.p2align 4,,10
	.p2align 3
.L795:
	movl	(%rsp), %r13d
.L740:
	movq	%rbx, %rdi
	call	free
	movq	72(%rsp), %r14
	movl	stbi_write_png_compression_level(%rip), %ecx
	leaq	108(%rsp), %rdx
	movl	92(%rsp), %esi
	movq	%r14, %rdi
	call	stbi_zlib_compress
	movq	%r14, %rdi
	movq	%rax, %rbx
	call	free
	testq	%rbx, %rbx
	je	.L737
	movl	108(%rsp), %eax
	leal	57(%rax), %edi
	movslq	%edi, %rdi
	call	malloc
	testq	%rax, %rax
	movq	%rax, %rbp
	je	.L737
	movl	108(%rsp), %edx
	movq	80(%rsp), %rdi
	movl	%r13d, %r9d
	movl	crc_table.8498+728(%rip), %r11d
	movl	12(%rsp), %r14d
	sarl	$24, %r9d
	movl	%r13d, %esi
	movl	%r13d, %r8d
	movb	%r13b, 23(%rbp)
	leal	57(%rdx), %eax
	sarl	$16, %esi
	sarl	$8, %r8d
	xorl	$16777215, %r11d
	movl	%r14d, %r12d
	movl	%r14d, %ecx
	movl	%eax, (%rdi)
	movabsq	$727905341920923785, %rax
	sarl	$24, %r12d
	movq	%rax, 0(%rbp)
	movabsq	$5927942488114331648, %rax
	movb	%r12b, 16(%rbp)
	movq	%rax, 8(%rbp)
	movslq	24(%rsp), %rax
	sarl	$16, %ecx
	movb	%cl, 17(%rbp)
	movl	%r14d, %r10d
	movb	%sil, 21(%rbp)
	sarl	$8, %r10d
	movb	%r9b, 20(%rbp)
	movb	%r8b, 22(%rbp)
	movb	%r10b, 18(%rbp)
	movb	%r14b, 19(%rbp)
	movl	112(%rsp,%rax,4), %edi
	xorl	%eax, %eax
	movb	$8, 24(%rbp)
	movw	%ax, 26(%rbp)
	movl	%r11d, %eax
	movzbl	%r11b, %r11d
	xorq	$72, %r11
	shrl	$8, %eax
	movb	$0, 28(%rbp)
	xorl	crc_table.8498(,%r11,4), %eax
	movb	%dil, 25(%rbp)
	movl	%eax, %r11d
	movzbl	%al, %eax
	xorq	$68, %rax
	shrl	$8, %r11d
	xorl	crc_table.8498(,%rax,4), %r11d
	movl	%r11d, %eax
	movzbl	%r11b, %r11d
	xorq	$82, %r11
	shrl	$8, %eax
	xorl	crc_table.8498(,%r11,4), %eax
	xorl	%eax, %r12d
	movl	%eax, %r11d
	movzbl	%r12b, %eax
	shrl	$8, %r11d
	movslq	%edx, %r12
	xorl	crc_table.8498(,%rax,4), %r11d
	xorl	%r11d, %ecx
	movl	%r11d, %eax
	movzbl	%cl, %ecx
	shrl	$8, %eax
	xorl	crc_table.8498(,%rcx,4), %eax
	movl	%eax, %ecx
	xorl	%r10d, %eax
	movzbl	%al, %eax
	shrl	$8, %ecx
	xorl	crc_table.8498(,%rax,4), %ecx
	movl	%ecx, %eax
	xorl	%r14d, %ecx
	movzbl	%cl, %ecx
	shrl	$8, %eax
	xorl	crc_table.8498(,%rcx,4), %eax
	movl	%eax, %ecx
	xorl	%r9d, %eax
	movzbl	%al, %eax
	shrl	$8, %ecx
	xorl	crc_table.8498(,%rax,4), %ecx
	movl	%ecx, %eax
	shrl	$8, %eax
	xorl	%esi, %ecx
	movzbl	%cl, %ecx
	xorl	crc_table.8498(,%rcx,4), %eax
	movl	%eax, %esi
	xorl	%r8d, %eax
	movzbl	%al, %eax
	shrl	$8, %esi
	xorl	crc_table.8498(,%rax,4), %esi
	xorl	%esi, %r13d
	movl	%esi, %ecx
	movzbl	%r13b, %esi
	shrl	$8, %ecx
	xorl	crc_table.8498(,%rsi,4), %ecx
	movq	%rbx, %rsi
	movl	%ecx, %eax
	movzbl	%cl, %ecx
	xorq	$8, %rcx
	shrl	$8, %eax
	xorl	crc_table.8498(,%rcx,4), %eax
	movb	%dh, 35(%rbp)
	movb	%dl, 36(%rbp)
	movl	$1413563465, 37(%rbp)
	movl	%eax, %ecx
	xorl	%edi, %eax
	movzbl	%al, %eax
	shrl	$8, %ecx
	xorl	crc_table.8498(,%rax,4), %ecx
	movl	%ecx, %eax
	movzbl	%cl, %ecx
	shrl	$8, %eax
	xorl	crc_table.8498(,%rcx,4), %eax
	movl	%eax, %ecx
	movzbl	%al, %eax
	shrl	$8, %ecx
	xorl	crc_table.8498(,%rax,4), %ecx
	movl	%ecx, %eax
	movzbl	%cl, %ecx
	shrl	$8, %eax
	xorl	crc_table.8498(,%rcx,4), %eax
	notl	%eax
	movl	%eax, %ecx
	movb	%ah, 31(%rbp)
	movb	%al, 32(%rbp)
	shrl	$24, %ecx
	movb	%cl, 29(%rbp)
	movl	%eax, %ecx
	movl	%edx, %eax
	shrl	$16, %ecx
	sarl	$24, %eax
	movb	%cl, 30(%rbp)
	movb	%al, 33(%rbp)
	leaq	41(%rbp), %rcx
	movl	%edx, %eax
	movq	%r12, %rdx
	sarl	$16, %eax
	movq	%rcx, %rdi
	movb	%al, 34(%rbp)
	call	memmove
	movq	%rbx, %rdi
	addq	%rax, %r12
	call	free
	movslq	108(%rsp), %rcx
	movq	$-4, %rdx
	subq	%rcx, %rdx
	cmpl	$-3, %ecx
	movq	%rcx, %rax
	jl	.L776
	movq	%r12, %rbx
	addl	$3, %eax
	addq	%r12, %rdx
	subq	%rcx, %rbx
	leaq	-3(%rbx,%rax), %rsi
	movl	$-1, %eax
	.p2align 4,,10
	.p2align 3
.L754:
	movl	%eax, %ecx
	xorb	(%rdx), %al
	addq	$1, %rdx
	shrl	$8, %ecx
	movzbl	%al, %eax
	xorl	crc_table.8498(,%rax,4), %ecx
	cmpq	%rsi, %rdx
	movl	%ecx, %eax
	jne	.L754
	notl	%eax
	movl	%eax, %ebx
	movl	%eax, %edx
	movzbl	%ah, %ecx
	shrl	$24, %ebx
	shrl	$16, %edx
	movl	%ebx, %esi
.L753:
	movb	%dl, 1(%r12)
	movl	crc_table.8498+728(%rip), %edx
	addq	$16, %r12
	movb	%al, -13(%r12)
	movabsq	$4921947622597459968, %rax
	movb	%sil, -16(%r12)
	movq	%rax, -12(%r12)
	movb	%cl, -14(%r12)
	xorl	$16777215, %edx
	movl	%edx, %eax
	movzbl	%dl, %edx
	xorq	$69, %rdx
	shrl	$8, %eax
	xorl	crc_table.8498(,%rdx,4), %eax
	movl	%eax, %edx
	movzbl	%al, %eax
	xorq	$78, %rax
	shrl	$8, %edx
	xorl	crc_table.8498(,%rax,4), %edx
	movl	%edx, %eax
	movzbl	%dl, %edx
	xorq	$68, %rdx
	shrl	$8, %eax
	xorl	crc_table.8498(,%rdx,4), %eax
	notl	%eax
	movl	%eax, %edx
	movb	%al, -1(%r12)
	movzbl	%ah, %ebx
	shrl	$24, %edx
	movb	%bl, -2(%r12)
	movb	%dl, -4(%r12)
	movl	%eax, %edx
	movq	80(%rsp), %rax
	shrl	$16, %edx
	movb	%dl, -3(%r12)
	movslq	(%rax), %rax
	addq	%rbp, %rax
	cmpq	%r12, %rax
	jne	.L797
.L734:
	movq	136(%rsp), %rbx
	xorq	%fs:40, %rbx
	movq	%rbp, %rax
	jne	.L798
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L762:
	.cfi_restore_state
	movl	$2, %ecx
	jmp	.L746
	.p2align 4,,10
	.p2align 3
.L759:
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	jmp	.L745
	.p2align 4,,10
	.p2align 3
.L763:
	movl	$3, %ecx
	jmp	.L746
	.p2align 4,,10
	.p2align 3
.L764:
	movl	$4, %ecx
	jmp	.L746
	.p2align 4,,10
	.p2align 3
.L765:
	movl	$5, %ecx
	jmp	.L746
.L760:
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	jmp	.L746
.L766:
	movl	$6, %ecx
	jmp	.L746
.L767:
	movl	$7, %ecx
	jmp	.L746
.L768:
	movl	$8, %ecx
	jmp	.L746
.L769:
	movl	$9, %ecx
	jmp	.L746
.L770:
	movl	$10, %ecx
	jmp	.L746
.L737:
	xorl	%ebp, %ebp
	jmp	.L734
.L771:
	movl	$11, %ecx
	jmp	.L746
.L772:
	movl	$12, %ecx
	jmp	.L746
.L773:
	movl	$13, %ecx
	jmp	.L746
.L774:
	movl	$14, %ecx
	jmp	.L746
.L776:
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	jmp	.L753
.L738:
	movq	72(%rsp), %rdi
	xorl	%ebp, %ebp
	call	free
	jmp	.L734
.L798:
	call	__stack_chk_fail
.L797:
	movl	$__PRETTY_FUNCTION__.8589, %ecx
	movl	$1102, %edx
	movl	$.LC0, %esi
	movl	$.LC39, %edi
	call	__assert_fail
	.cfi_endproc
.LFE744:
	.size	stbi_write_png_to_mem, .-stbi_write_png_to_mem
	.p2align 4,,15
	.globl	stbi_write_png
	.type	stbi_write_png, @function
stbi_write_png:
.LFB745:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	%esi, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%r9d, %esi
	movq	%rdi, %r12
	movq	%r8, %rdi
	movl	%ecx, %r8d
	movl	%edx, %ecx
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movl	%eax, %edx
	xorl	%ebp, %ebp
	leaq	4(%rsp), %r9
	movq	%fs:40, %rbx
	movq	%rbx, 8(%rsp)
	xorl	%ebx, %ebx
	call	stbi_write_png_to_mem
	testq	%rax, %rax
	je	.L799
	movq	%r12, %rdi
	movl	$.LC29, %esi
	movq	%rax, %rbx
	call	fopen
	testq	%rax, %rax
	movq	%rax, %r12
	je	.L806
	movslq	4(%rsp), %rdx
	movq	%rax, %rcx
	movl	$1, %esi
	movq	%rbx, %rdi
	movl	$1, %ebp
	call	fwrite
	movq	%r12, %rdi
	call	fclose
	movq	%rbx, %rdi
	call	free
.L799:
	movq	8(%rsp), %rbx
	xorq	%fs:40, %rbx
	movl	%ebp, %eax
	jne	.L807
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L806:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	free
	jmp	.L799
.L807:
	call	__stack_chk_fail
	.cfi_endproc
.LFE745:
	.size	stbi_write_png, .-stbi_write_png
	.p2align 4,,15
	.globl	stbi_write_png_to_func
	.type	stbi_write_png_to_func, @function
stbi_write_png_to_func:
.LFB746:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbp
	movq	%r9, %rdi
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movl	48(%rsp), %esi
	leaq	4(%rsp), %r9
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	stbi_write_png_to_mem
	testq	%rax, %rax
	je	.L811
	movq	%rax, %rbx
	movq	%rax, %rsi
	movl	4(%rsp), %edx
	movq	%r12, %rdi
	call	*%rbp
	movq	%rbx, %rdi
	call	free
	movl	$1, %eax
.L808:
	movq	8(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L813
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L811:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L808
.L813:
	call	__stack_chk_fail
	.cfi_endproc
.LFE746:
	.size	stbi_write_png_to_func, .-stbi_write_png_to_func
	.p2align 4,,15
	.globl	stbi_write_jpg_to_func
	.type	stbi_write_jpg_to_func, @function
stbi_write_jpg_to_func:
.LFB752:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %r10
	movq	%r10, 24(%rsp)
	xorl	%r10d, %r10d
	testq	%r9, %r9
	movq	%rdi, (%rsp)
	movq	%rsi, 8(%rsp)
	je	.L818
	testl	%edx, %edx
	movl	%edx, %eax
	je	.L818
	leal	-1(%r8), %esi
	movl	%ecx, %edx
	movl	%r8d, %ecx
	cmpl	$3, %esi
	ja	.L818
	testl	%edx, %edx
	je	.L818
	movq	%r9, %r8
	movl	48(%rsp), %r9d
	movl	%eax, %esi
	movq	%rsp, %rdi
	call	stbi_write_jpg_core.part.0
	jmp	.L814
	.p2align 4,,10
	.p2align 3
.L818:
	xorl	%eax, %eax
.L814:
	movq	24(%rsp), %rdx
	xorq	%fs:40, %rdx
	jne	.L820
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L820:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE752:
	.size	stbi_write_jpg_to_func, .-stbi_write_jpg_to_func
	.p2align 4,,15
	.globl	stbi_write_jpg
	.type	stbi_write_jpg, @function
stbi_write_jpg:
.LFB753:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r9d, %r15d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	$.LC29, %esi
	movl	%edx, %r14d
	movl	%ecx, %r13d
	movq	%r8, %rbp
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	xorl	%ebx, %ebx
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	call	fopen
	testq	%rax, %rax
	movq	$stbi__stdio_write, (%rsp)
	movq	%rax, 8(%rsp)
	je	.L821
	testq	%rbp, %rbp
	je	.L827
	testl	%r12d, %r12d
	je	.L827
	leal	-1(%r13), %edx
	cmpl	$3, %edx
	ja	.L827
	testl	%r14d, %r14d
	je	.L827
	movq	%rsp, %rdi
	movl	%r15d, %r9d
	movq	%rbp, %r8
	movl	%r13d, %ecx
	movl	%r14d, %edx
	movl	%r12d, %esi
	call	stbi_write_jpg_core.part.0
	movl	%eax, %ebx
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	fclose
	.p2align 4,,10
	.p2align 3
.L821:
	movq	24(%rsp), %rcx
	xorq	%fs:40, %rcx
	movl	%ebx, %eax
	jne	.L831
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L827:
	.cfi_restore_state
	movq	%rax, %rdi
	xorl	%ebx, %ebx
	call	fclose
	jmp	.L821
.L831:
	call	__stack_chk_fail
	.cfi_endproc
.LFE753:
	.size	stbi_write_jpg, .-stbi_write_jpg
	.p2align 4,,15
	.globl	integral_image3
	.type	integral_image3, @function
integral_image3:
.LFB757:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L833:
	movzbl	(%rdi,%rax), %ecx
	addl	%ecx, %edx
	movl	%edx, (%rsi,%rax,4)
	addq	$1, %rax
	cmpq	$1920, %rax
	jne	.L833
	movl	$1, %ecx
	movl	$-2004318071, %r8d
	.p2align 4,,10
	.p2align 3
.L834:
	movl	%ecx, %eax
	movl	%ecx, %ebx
	addl	$1, %ecx
	mull	%r8d
	movl	%edx, %eax
	shrl	$10, %edx
	shrl	$10, %eax
	addl	$1, %edx
	imull	$1920, %edx, %edx
	imull	$1920, %eax, %eax
	leal	-1920(%rdx), %r10d
	subl	%eax, %ebx
	leal	(%rbx,%rdx), %r9d
	leal	(%rbx,%r10), %r11d
	movl	%ebx, %eax
	movzbl	(%rdi,%r9), %ebp
	movl	(%rsi,%r11,4), %ebx
	addl	%ebp, %ebx
	movl	%ebx, (%rsi,%r9,4)
	leal	1(%rax), %ebx
	leal	(%rbx,%rdx), %r11d
	addl	%r10d, %ebx
	movzbl	(%rdi,%r11), %r9d
	addl	%ebp, %r9d
	movl	(%rsi,%rbx,4), %ebp
	leal	2(%rax), %ebx
	addl	$3, %eax
	addl	%r9d, %ebp
	movl	%ebp, (%rsi,%r11,4)
	leal	(%rbx,%rdx), %r11d
	addl	%r10d, %ebx
	addl	%eax, %edx
	addl	%eax, %r10d
	movzbl	(%rdi,%r11), %ebp
	movzbl	(%rdi,%rdx), %eax
	addl	%ebp, %r9d
	movl	(%rsi,%rbx,4), %ebp
	addl	%r9d, %ebp
	movl	%ebp, (%rsi,%r11,4)
	addl	(%rsi,%r10,4), %eax
	addl	%r9d, %eax
	cmpl	$2073600, %ecx
	movl	%eax, (%rsi,%rdx,4)
	jne	.L834
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE757:
	.size	integral_image3, .-integral_image3
	.section	.rodata.str1.1
.LC43:
	.string	"\nTiempo transcurrido: %lf\n\n"
.LC45:
	.string	"debug.png"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB758:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$2073600, %edi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	$3000, %ebp
	subq	$216, %rsp
	.cfi_def_cfa_offset 272
	movq	%fs:40, %rax
	movq	%rax, 200(%rsp)
	xorl	%eax, %eax
	call	malloc
	movl	$1, %esi
	movq	%rax, %rbx
	movl	$8294400, %edi
	call	calloc
	leaq	1920(%rbx), %r14
	movq	%rax, %r12
	leaq	96(%rsp), %r13
	call	omp_get_wtime
	movdqa	.LC41(%rip), %xmm5
	movsd	%xmm0, 8(%rsp)
	movdqa	.LC42(%rip), %xmm4
.L843:
	xorl	%edi, %edi
	leaq	64(%rsp), %r15
	movaps	%xmm4, 32(%rsp)
	movaps	%xmm5, 16(%rsp)
	call	time
	movl	%eax, %edi
	call	srand
	movdqa	32(%rsp), %xmm4
	movdqa	16(%rsp), %xmm5
.L839:
	addq	$4, %r15
	movaps	%xmm4, 32(%rsp)
	movaps	%xmm5, 16(%rsp)
	call	rand
	movl	%eax, -4(%r15)
	cmpq	%r15, %r13
	movdqa	16(%rsp), %xmm5
	movdqa	32(%rsp), %xmm4
	jne	.L839
	movzwl	66(%rsp), %edx
	movzwl	80(%rsp), %ecx
	movl	$3, %r9d
	movzwl	72(%rsp), %eax
	movd	64(%rsp), %xmm2
	movl	$2, %r8d
	movdqa	.LC40(%rip), %xmm7
	movl	$1, %edi
	xorl	%esi, %esi
	sall	$16, %edx
	movdqa	.LC40(%rip), %xmm6
	orl	%edx, %ecx
	orl	%edx, %eax
	movl	%ecx, 16(%rsp)
	movzwl	88(%rsp), %ecx
	movd	16(%rsp), %xmm0
	pinsrd	$1, %eax, %xmm2
	movzwl	68(%rsp), %eax
	movaps	%xmm7, 128(%rsp)
	orl	%edx, %ecx
	pinsrd	$1, %ecx, %xmm0
	orl	%edx, %eax
	movzwl	84(%rsp), %ecx
	movl	%eax, 16(%rsp)
	movzwl	76(%rsp), %eax
	punpcklqdq	%xmm0, %xmm2
	movd	16(%rsp), %xmm3
	movaps	%xmm5, 144(%rsp)
	orl	%edx, %ecx
	orl	%edx, %eax
	pinsrd	$1, %eax, %xmm3
	movl	%ecx, 32(%rsp)
	movzwl	92(%rsp), %ecx
	movd	32(%rsp), %xmm0
	movaps	%xmm4, 160(%rsp)
	orl	%ecx, %edx
	pinsrd	$1, %edx, %xmm0
	movaps	%xmm2, 96(%rsp)
	punpcklqdq	%xmm0, %xmm3
	movaps	%xmm3, 112(%rsp)
	.p2align 4,,10
	.p2align 3
.L840:
	leaq	(%rbx,%rsi), %rdx
	leaq	(%r14,%rsi), %r10
	.p2align 4,,10
	.p2align 3
.L841:
	movdqa	%xmm3, %xmm0
	pand	%xmm6, %xmm3
	movdqa	%xmm2, %xmm1
	movq	%rdx, %rcx
	pand	%xmm6, %xmm2
	psrld	$16, %xmm0
	subq	%rsi, %rcx
	pmulld	%xmm4, %xmm3
	paddd	%xmm3, %xmm0
	movdqa	%xmm0, %xmm3
	pand	%xmm6, %xmm0
	psrld	$16, %xmm1
	addq	$4, %rdx
	pmulld	%xmm5, %xmm2
	paddd	%xmm2, %xmm1
	movdqa	%xmm1, %xmm2
	pslld	$16, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %eax
	movb	%al, -4(%rdx)
	pextrd	$1, %xmm0, %eax
	cmpq	%r10, %rdx
	movb	%al, (%rcx,%rdi)
	pextrd	$2, %xmm0, %eax
	movb	%al, (%rcx,%r8)
	pextrd	$3, %xmm0, %eax
	movb	%al, (%rcx,%r9)
	jne	.L841
	addq	$1920, %rsi
	addq	$1920, %rdi
	addq	$1920, %r8
	addq	$1920, %r9
	cmpq	$2073600, %rsi
	jne	.L840
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movaps	%xmm4, 32(%rsp)
	movaps	%xmm5, 16(%rsp)
	call	integral_image3
	subl	$1, %ebp
	movdqa	16(%rsp), %xmm5
	movdqa	32(%rsp), %xmm4
	jne	.L843
	call	omp_get_wtime
	subsd	8(%rsp), %xmm0
	movl	$.LC43, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movl	$6220800, %edi
	call	malloc
	movq	%rax, %r13
	movl	8294396(%r12), %eax
	pxor	%xmm4, %xmm4
	movss	.LC44(%rip), %xmm3
	cvtsi2ssq	%rax, %xmm4
	movaps	%xmm4, %xmm7
	divss	%xmm3, %xmm7
	movss	%xmm7, 8(%rsp)
.L848:
	movl	%ebp, %eax
	pxor	%xmm0, %xmm0
	leal	(%rax,%rax,2), %r14d
	movl	(%r12,%rax,4), %eax
	movss	%xmm3, 32(%rsp)
	movaps	%xmm4, %xmm1
	movss	%xmm4, 16(%rsp)
	cvtsi2ssq	%rax, %xmm0
	call	fminf
	pxor	%xmm1, %xmm1
	call	fmaxf
	divss	8(%rsp), %xmm0
	leaq	60(%rsp), %rdi
	call	modff
	cvttss2siq	60(%rsp), %rax
	cqto
	movss	.LC13(%rip), %xmm5
	xorq	%rdx, %rax
	subss	%xmm0, %xmm5
	subq	%rdx, %rax
	movl	$254, %edx
	cmpq	$254, %rax
	movss	32(%rsp), %xmm3
	cmovle	%rax, %rdx
	addl	$1, %ebp
	leaq	3(%rdx,%rdx,2), %rcx
	cmpl	$2073600, %ebp
	movss	16(%rsp), %xmm4
	leaq	colormap__inferno(,%rcx,4), %rdx
	movss	colormap__inferno(,%rcx,4), %xmm2
	leaq	(%rax,%rax,2), %rcx
	mulss	%xmm0, %xmm2
	movss	colormap__inferno(,%rcx,4), %xmm1
	leaq	colormap__inferno(,%rcx,4), %rax
	mulss	%xmm5, %xmm1
	movss	4(%rax), %xmm6
	mulss	%xmm5, %xmm6
	mulss	8(%rax), %xmm5
	addss	%xmm1, %xmm2
	movss	4(%rdx), %xmm1
	mulss	%xmm0, %xmm1
	mulss	8(%rdx), %xmm0
	movl	%r14d, %edx
	mulss	%xmm3, %xmm2
	addss	%xmm6, %xmm1
	roundss	$4, %xmm2, %xmm2
	cvttss2si	%xmm2, %eax
	addss	%xmm5, %xmm0
	mulss	%xmm3, %xmm1
	mulss	%xmm3, %xmm0
	roundss	$4, %xmm1, %xmm1
	roundss	$4, %xmm0, %xmm0
	movb	%al, 0(%r13,%rdx)
	cvttss2si	%xmm1, %eax
	leal	1(%r14), %edx
	movb	%al, 0(%r13,%rdx)
	cvttss2si	%xmm0, %eax
	leal	2(%r14), %edx
	movb	%al, 0(%r13,%rdx)
	jne	.L848
	movl	$5760, %r9d
	movq	%r13, %r8
	movl	$3, %ecx
	movl	$1080, %edx
	movl	$1920, %esi
	movl	$.LC45, %edi
	call	stbi_write_png
	movq	%r13, %rdi
	call	free
	movq	%rbx, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	xorl	%eax, %eax
	movq	200(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L855
	addq	$216, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L855:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE758:
	.size	main, .-main
	.section	.rodata
	.align 32
	.type	UVAC_HT.8734, @object
	.size	UVAC_HT.8734, 1024
UVAC_HT.8734:
	.value	0
	.value	2
	.value	1
	.value	2
	.value	4
	.value	3
	.value	10
	.value	4
	.value	24
	.value	5
	.value	25
	.value	5
	.value	56
	.value	6
	.value	120
	.value	7
	.value	500
	.value	9
	.value	1014
	.value	10
	.value	4084
	.value	12
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	11
	.value	4
	.value	57
	.value	6
	.value	246
	.value	8
	.value	501
	.value	9
	.value	2038
	.value	11
	.value	4085
	.value	12
	.value	-120
	.value	16
	.value	-119
	.value	16
	.value	-118
	.value	16
	.value	-117
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	26
	.value	5
	.value	247
	.value	8
	.value	1015
	.value	10
	.value	4086
	.value	12
	.value	32706
	.value	15
	.value	-116
	.value	16
	.value	-115
	.value	16
	.value	-114
	.value	16
	.value	-113
	.value	16
	.value	-112
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	27
	.value	5
	.value	248
	.value	8
	.value	1016
	.value	10
	.value	4087
	.value	12
	.value	-111
	.value	16
	.value	-110
	.value	16
	.value	-109
	.value	16
	.value	-108
	.value	16
	.value	-107
	.value	16
	.value	-106
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	58
	.value	6
	.value	502
	.value	9
	.value	-105
	.value	16
	.value	-104
	.value	16
	.value	-103
	.value	16
	.value	-102
	.value	16
	.value	-101
	.value	16
	.value	-100
	.value	16
	.value	-99
	.value	16
	.value	-98
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	59
	.value	6
	.value	1017
	.value	10
	.value	-97
	.value	16
	.value	-96
	.value	16
	.value	-95
	.value	16
	.value	-94
	.value	16
	.value	-93
	.value	16
	.value	-92
	.value	16
	.value	-91
	.value	16
	.value	-90
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	121
	.value	7
	.value	2039
	.value	11
	.value	-89
	.value	16
	.value	-88
	.value	16
	.value	-87
	.value	16
	.value	-86
	.value	16
	.value	-85
	.value	16
	.value	-84
	.value	16
	.value	-83
	.value	16
	.value	-82
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	122
	.value	7
	.value	2040
	.value	11
	.value	-81
	.value	16
	.value	-80
	.value	16
	.value	-79
	.value	16
	.value	-78
	.value	16
	.value	-77
	.value	16
	.value	-76
	.value	16
	.value	-75
	.value	16
	.value	-74
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	249
	.value	8
	.value	-73
	.value	16
	.value	-72
	.value	16
	.value	-71
	.value	16
	.value	-70
	.value	16
	.value	-69
	.value	16
	.value	-68
	.value	16
	.value	-67
	.value	16
	.value	-66
	.value	16
	.value	-65
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	503
	.value	9
	.value	-64
	.value	16
	.value	-63
	.value	16
	.value	-62
	.value	16
	.value	-61
	.value	16
	.value	-60
	.value	16
	.value	-59
	.value	16
	.value	-58
	.value	16
	.value	-57
	.value	16
	.value	-56
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	504
	.value	9
	.value	-55
	.value	16
	.value	-54
	.value	16
	.value	-53
	.value	16
	.value	-52
	.value	16
	.value	-51
	.value	16
	.value	-50
	.value	16
	.value	-49
	.value	16
	.value	-48
	.value	16
	.value	-47
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	505
	.value	9
	.value	-46
	.value	16
	.value	-45
	.value	16
	.value	-44
	.value	16
	.value	-43
	.value	16
	.value	-42
	.value	16
	.value	-41
	.value	16
	.value	-40
	.value	16
	.value	-39
	.value	16
	.value	-38
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	506
	.value	9
	.value	-37
	.value	16
	.value	-36
	.value	16
	.value	-35
	.value	16
	.value	-34
	.value	16
	.value	-33
	.value	16
	.value	-32
	.value	16
	.value	-31
	.value	16
	.value	-30
	.value	16
	.value	-29
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	2041
	.value	11
	.value	-28
	.value	16
	.value	-27
	.value	16
	.value	-26
	.value	16
	.value	-25
	.value	16
	.value	-24
	.value	16
	.value	-23
	.value	16
	.value	-22
	.value	16
	.value	-21
	.value	16
	.value	-20
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	16352
	.value	14
	.value	-19
	.value	16
	.value	-18
	.value	16
	.value	-17
	.value	16
	.value	-16
	.value	16
	.value	-15
	.value	16
	.value	-14
	.value	16
	.value	-13
	.value	16
	.value	-12
	.value	16
	.value	-11
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	1018
	.value	10
	.value	32707
	.value	15
	.value	-10
	.value	16
	.value	-9
	.value	16
	.value	-8
	.value	16
	.value	-7
	.value	16
	.value	-6
	.value	16
	.value	-5
	.value	16
	.value	-4
	.value	16
	.value	-3
	.value	16
	.value	-2
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.align 32
	.type	UVDC_HT.8732, @object
	.size	UVDC_HT.8732, 1024
UVDC_HT.8732:
	.value	0
	.value	2
	.value	1
	.value	2
	.value	2
	.value	2
	.value	6
	.value	3
	.value	14
	.value	4
	.value	30
	.value	5
	.value	62
	.value	6
	.value	126
	.value	7
	.value	254
	.value	8
	.value	510
	.value	9
	.value	1022
	.value	10
	.value	2046
	.value	11
	.zero	976
	.align 32
	.type	YAC_HT.8733, @object
	.size	YAC_HT.8733, 1024
YAC_HT.8733:
	.value	10
	.value	4
	.value	0
	.value	2
	.value	1
	.value	2
	.value	4
	.value	3
	.value	11
	.value	4
	.value	26
	.value	5
	.value	120
	.value	7
	.value	248
	.value	8
	.value	1014
	.value	10
	.value	-126
	.value	16
	.value	-125
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	12
	.value	4
	.value	27
	.value	5
	.value	121
	.value	7
	.value	502
	.value	9
	.value	2038
	.value	11
	.value	-124
	.value	16
	.value	-123
	.value	16
	.value	-122
	.value	16
	.value	-121
	.value	16
	.value	-120
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	28
	.value	5
	.value	249
	.value	8
	.value	1015
	.value	10
	.value	4084
	.value	12
	.value	-119
	.value	16
	.value	-118
	.value	16
	.value	-117
	.value	16
	.value	-116
	.value	16
	.value	-115
	.value	16
	.value	-114
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	58
	.value	6
	.value	503
	.value	9
	.value	4085
	.value	12
	.value	-113
	.value	16
	.value	-112
	.value	16
	.value	-111
	.value	16
	.value	-110
	.value	16
	.value	-109
	.value	16
	.value	-108
	.value	16
	.value	-107
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	59
	.value	6
	.value	1016
	.value	10
	.value	-106
	.value	16
	.value	-105
	.value	16
	.value	-104
	.value	16
	.value	-103
	.value	16
	.value	-102
	.value	16
	.value	-101
	.value	16
	.value	-100
	.value	16
	.value	-99
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	122
	.value	7
	.value	2039
	.value	11
	.value	-98
	.value	16
	.value	-97
	.value	16
	.value	-96
	.value	16
	.value	-95
	.value	16
	.value	-94
	.value	16
	.value	-93
	.value	16
	.value	-92
	.value	16
	.value	-91
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	123
	.value	7
	.value	4086
	.value	12
	.value	-90
	.value	16
	.value	-89
	.value	16
	.value	-88
	.value	16
	.value	-87
	.value	16
	.value	-86
	.value	16
	.value	-85
	.value	16
	.value	-84
	.value	16
	.value	-83
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	250
	.value	8
	.value	4087
	.value	12
	.value	-82
	.value	16
	.value	-81
	.value	16
	.value	-80
	.value	16
	.value	-79
	.value	16
	.value	-78
	.value	16
	.value	-77
	.value	16
	.value	-76
	.value	16
	.value	-75
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	504
	.value	9
	.value	32704
	.value	15
	.value	-74
	.value	16
	.value	-73
	.value	16
	.value	-72
	.value	16
	.value	-71
	.value	16
	.value	-70
	.value	16
	.value	-69
	.value	16
	.value	-68
	.value	16
	.value	-67
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	505
	.value	9
	.value	-66
	.value	16
	.value	-65
	.value	16
	.value	-64
	.value	16
	.value	-63
	.value	16
	.value	-62
	.value	16
	.value	-61
	.value	16
	.value	-60
	.value	16
	.value	-59
	.value	16
	.value	-58
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	506
	.value	9
	.value	-57
	.value	16
	.value	-56
	.value	16
	.value	-55
	.value	16
	.value	-54
	.value	16
	.value	-53
	.value	16
	.value	-52
	.value	16
	.value	-51
	.value	16
	.value	-50
	.value	16
	.value	-49
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	1017
	.value	10
	.value	-48
	.value	16
	.value	-47
	.value	16
	.value	-46
	.value	16
	.value	-45
	.value	16
	.value	-44
	.value	16
	.value	-43
	.value	16
	.value	-42
	.value	16
	.value	-41
	.value	16
	.value	-40
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	1018
	.value	10
	.value	-39
	.value	16
	.value	-38
	.value	16
	.value	-37
	.value	16
	.value	-36
	.value	16
	.value	-35
	.value	16
	.value	-34
	.value	16
	.value	-33
	.value	16
	.value	-32
	.value	16
	.value	-31
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	2040
	.value	11
	.value	-30
	.value	16
	.value	-29
	.value	16
	.value	-28
	.value	16
	.value	-27
	.value	16
	.value	-26
	.value	16
	.value	-25
	.value	16
	.value	-24
	.value	16
	.value	-23
	.value	16
	.value	-22
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	-21
	.value	16
	.value	-20
	.value	16
	.value	-19
	.value	16
	.value	-18
	.value	16
	.value	-17
	.value	16
	.value	-16
	.value	16
	.value	-15
	.value	16
	.value	-14
	.value	16
	.value	-13
	.value	16
	.value	-12
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	2041
	.value	11
	.value	-11
	.value	16
	.value	-10
	.value	16
	.value	-9
	.value	16
	.value	-8
	.value	16
	.value	-7
	.value	16
	.value	-6
	.value	16
	.value	-5
	.value	16
	.value	-4
	.value	16
	.value	-3
	.value	16
	.value	-2
	.value	16
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.align 32
	.type	YDC_HT.8731, @object
	.size	YDC_HT.8731, 1024
YDC_HT.8731:
	.value	0
	.value	2
	.value	2
	.value	3
	.value	3
	.value	3
	.value	4
	.value	3
	.value	5
	.value	3
	.value	6
	.value	3
	.value	14
	.value	4
	.value	30
	.value	5
	.value	62
	.value	6
	.value	126
	.value	7
	.value	254
	.value	8
	.value	510
	.value	9
	.zero	976
	.align 8
	.type	head2.8758, @object
	.size	head2.8758, 14
head2.8758:
	.byte	-1
	.byte	-38
	.byte	0
	.byte	12
	.byte	3
	.byte	1
	.byte	0
	.byte	2
	.byte	17
	.byte	3
	.byte	17
	.byte	0
	.byte	63
	.byte	0
	.align 32
	.type	std_ac_chrominance_values.8730, @object
	.size	std_ac_chrominance_values.8730, 162
std_ac_chrominance_values.8730:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	17
	.byte	4
	.byte	5
	.byte	33
	.byte	49
	.byte	6
	.byte	18
	.byte	65
	.byte	81
	.byte	7
	.byte	97
	.byte	113
	.byte	19
	.byte	34
	.byte	50
	.byte	-127
	.byte	8
	.byte	20
	.byte	66
	.byte	-111
	.byte	-95
	.byte	-79
	.byte	-63
	.byte	9
	.byte	35
	.byte	51
	.byte	82
	.byte	-16
	.byte	21
	.byte	98
	.byte	114
	.byte	-47
	.byte	10
	.byte	22
	.byte	36
	.byte	52
	.byte	-31
	.byte	37
	.byte	-15
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	38
	.byte	39
	.byte	40
	.byte	41
	.byte	42
	.byte	53
	.byte	54
	.byte	55
	.byte	56
	.byte	57
	.byte	58
	.byte	67
	.byte	68
	.byte	69
	.byte	70
	.byte	71
	.byte	72
	.byte	73
	.byte	74
	.byte	83
	.byte	84
	.byte	85
	.byte	86
	.byte	87
	.byte	88
	.byte	89
	.byte	90
	.byte	99
	.byte	100
	.byte	101
	.byte	102
	.byte	103
	.byte	104
	.byte	105
	.byte	106
	.byte	115
	.byte	116
	.byte	117
	.byte	118
	.byte	119
	.byte	120
	.byte	121
	.byte	122
	.byte	-126
	.byte	-125
	.byte	-124
	.byte	-123
	.byte	-122
	.byte	-121
	.byte	-120
	.byte	-119
	.byte	-118
	.byte	-110
	.byte	-109
	.byte	-108
	.byte	-107
	.byte	-106
	.byte	-105
	.byte	-104
	.byte	-103
	.byte	-102
	.byte	-94
	.byte	-93
	.byte	-92
	.byte	-91
	.byte	-90
	.byte	-89
	.byte	-88
	.byte	-87
	.byte	-86
	.byte	-78
	.byte	-77
	.byte	-76
	.byte	-75
	.byte	-74
	.byte	-73
	.byte	-72
	.byte	-71
	.byte	-70
	.byte	-62
	.byte	-61
	.byte	-60
	.byte	-59
	.byte	-58
	.byte	-57
	.byte	-56
	.byte	-55
	.byte	-54
	.byte	-46
	.byte	-45
	.byte	-44
	.byte	-43
	.byte	-42
	.byte	-41
	.byte	-40
	.byte	-39
	.byte	-38
	.byte	-30
	.byte	-29
	.byte	-28
	.byte	-27
	.byte	-26
	.byte	-25
	.byte	-24
	.byte	-23
	.byte	-22
	.byte	-14
	.byte	-13
	.byte	-12
	.byte	-11
	.byte	-10
	.byte	-9
	.byte	-8
	.byte	-7
	.byte	-6
	.align 16
	.type	std_ac_chrominance_nrcodes.8729, @object
	.size	std_ac_chrominance_nrcodes.8729, 17
std_ac_chrominance_nrcodes.8729:
	.byte	0
	.byte	0
	.byte	2
	.byte	1
	.byte	2
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	7
	.byte	5
	.byte	4
	.byte	4
	.byte	0
	.byte	1
	.byte	2
	.byte	119
	.align 8
	.type	std_dc_chrominance_values.8728, @object
	.size	std_dc_chrominance_values.8728, 12
std_dc_chrominance_values.8728:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.align 16
	.type	std_dc_chrominance_nrcodes.8727, @object
	.size	std_dc_chrominance_nrcodes.8727, 17
std_dc_chrominance_nrcodes.8727:
	.byte	0
	.byte	0
	.byte	3
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.align 32
	.type	std_ac_luminance_values.8726, @object
	.size	std_ac_luminance_values.8726, 162
std_ac_luminance_values.8726:
	.byte	1
	.byte	2
	.byte	3
	.byte	0
	.byte	4
	.byte	17
	.byte	5
	.byte	18
	.byte	33
	.byte	49
	.byte	65
	.byte	6
	.byte	19
	.byte	81
	.byte	97
	.byte	7
	.byte	34
	.byte	113
	.byte	20
	.byte	50
	.byte	-127
	.byte	-111
	.byte	-95
	.byte	8
	.byte	35
	.byte	66
	.byte	-79
	.byte	-63
	.byte	21
	.byte	82
	.byte	-47
	.byte	-16
	.byte	36
	.byte	51
	.byte	98
	.byte	114
	.byte	-126
	.byte	9
	.byte	10
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	37
	.byte	38
	.byte	39
	.byte	40
	.byte	41
	.byte	42
	.byte	52
	.byte	53
	.byte	54
	.byte	55
	.byte	56
	.byte	57
	.byte	58
	.byte	67
	.byte	68
	.byte	69
	.byte	70
	.byte	71
	.byte	72
	.byte	73
	.byte	74
	.byte	83
	.byte	84
	.byte	85
	.byte	86
	.byte	87
	.byte	88
	.byte	89
	.byte	90
	.byte	99
	.byte	100
	.byte	101
	.byte	102
	.byte	103
	.byte	104
	.byte	105
	.byte	106
	.byte	115
	.byte	116
	.byte	117
	.byte	118
	.byte	119
	.byte	120
	.byte	121
	.byte	122
	.byte	-125
	.byte	-124
	.byte	-123
	.byte	-122
	.byte	-121
	.byte	-120
	.byte	-119
	.byte	-118
	.byte	-110
	.byte	-109
	.byte	-108
	.byte	-107
	.byte	-106
	.byte	-105
	.byte	-104
	.byte	-103
	.byte	-102
	.byte	-94
	.byte	-93
	.byte	-92
	.byte	-91
	.byte	-90
	.byte	-89
	.byte	-88
	.byte	-87
	.byte	-86
	.byte	-78
	.byte	-77
	.byte	-76
	.byte	-75
	.byte	-74
	.byte	-73
	.byte	-72
	.byte	-71
	.byte	-70
	.byte	-62
	.byte	-61
	.byte	-60
	.byte	-59
	.byte	-58
	.byte	-57
	.byte	-56
	.byte	-55
	.byte	-54
	.byte	-46
	.byte	-45
	.byte	-44
	.byte	-43
	.byte	-42
	.byte	-41
	.byte	-40
	.byte	-39
	.byte	-38
	.byte	-31
	.byte	-30
	.byte	-29
	.byte	-28
	.byte	-27
	.byte	-26
	.byte	-25
	.byte	-24
	.byte	-23
	.byte	-22
	.byte	-15
	.byte	-14
	.byte	-13
	.byte	-12
	.byte	-11
	.byte	-10
	.byte	-9
	.byte	-8
	.byte	-7
	.byte	-6
	.align 16
	.type	std_ac_luminance_nrcodes.8725, @object
	.size	std_ac_luminance_nrcodes.8725, 17
std_ac_luminance_nrcodes.8725:
	.byte	0
	.byte	0
	.byte	2
	.byte	1
	.byte	3
	.byte	3
	.byte	2
	.byte	4
	.byte	3
	.byte	5
	.byte	5
	.byte	4
	.byte	4
	.byte	0
	.byte	0
	.byte	1
	.byte	125
	.align 8
	.type	std_dc_luminance_values.8724, @object
	.size	std_dc_luminance_values.8724, 12
std_dc_luminance_values.8724:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.align 16
	.type	std_dc_luminance_nrcodes.8723, @object
	.size	std_dc_luminance_nrcodes.8723, 17
std_dc_luminance_nrcodes.8723:
	.byte	0
	.byte	0
	.byte	1
	.byte	5
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.align 16
	.type	head0.8757, @object
	.size	head0.8757, 25
head0.8757:
	.byte	-1
	.byte	-40
	.byte	-1
	.byte	-32
	.byte	0
	.byte	16
	.byte	74
	.byte	70
	.byte	73
	.byte	70
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	-1
	.byte	-37
	.byte	0
	.byte	-124
	.byte	0
	.align 32
	.type	aasf.8737, @object
	.size	aasf.8737, 32
aasf.8737:
	.long	1077216499
	.long	1081808063
	.long	1080853343
	.long	1079302960
	.long	1077216499
	.long	1074674138
	.long	1069805333
	.long	1061668290
	.align 32
	.type	UVQT.8736, @object
	.size	UVQT.8736, 256
UVQT.8736:
	.long	17
	.long	18
	.long	24
	.long	47
	.long	99
	.long	99
	.long	99
	.long	99
	.long	18
	.long	21
	.long	26
	.long	66
	.long	99
	.long	99
	.long	99
	.long	99
	.long	24
	.long	26
	.long	56
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	47
	.long	66
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.long	99
	.align 32
	.type	YQT.8735, @object
	.size	YQT.8735, 256
YQT.8735:
	.long	16
	.long	11
	.long	10
	.long	16
	.long	24
	.long	40
	.long	51
	.long	61
	.long	12
	.long	12
	.long	14
	.long	19
	.long	26
	.long	58
	.long	60
	.long	55
	.long	14
	.long	13
	.long	16
	.long	24
	.long	40
	.long	57
	.long	69
	.long	56
	.long	14
	.long	17
	.long	22
	.long	29
	.long	51
	.long	87
	.long	80
	.long	62
	.long	18
	.long	22
	.long	37
	.long	56
	.long	68
	.long	109
	.long	103
	.long	77
	.long	24
	.long	35
	.long	55
	.long	64
	.long	81
	.long	104
	.long	113
	.long	92
	.long	49
	.long	64
	.long	78
	.long	87
	.long	103
	.long	121
	.long	120
	.long	101
	.long	72
	.long	92
	.long	95
	.long	98
	.long	112
	.long	100
	.long	103
	.long	99
	.align 32
	.type	crc_table.8498, @object
	.size	crc_table.8498, 1024
crc_table.8498:
	.long	0
	.long	1996959894
	.long	-301047508
	.long	-1727442502
	.long	124634137
	.long	1886057615
	.long	-379345611
	.long	-1637575261
	.long	249268274
	.long	2044508324
	.long	-522852066
	.long	-1747789432
	.long	162941995
	.long	2125561021
	.long	-407360249
	.long	-1866523247
	.long	498536548
	.long	1789927666
	.long	-205950648
	.long	-2067906082
	.long	450548861
	.long	1843258603
	.long	-187386543
	.long	-2083289657
	.long	325883990
	.long	1684777152
	.long	-43845254
	.long	-1973040660
	.long	335633487
	.long	1661365465
	.long	-99664541
	.long	-1928851979
	.long	997073096
	.long	1281953886
	.long	-715111964
	.long	-1570279054
	.long	1006888145
	.long	1258607687
	.long	-770865667
	.long	-1526024853
	.long	901097722
	.long	1119000684
	.long	-608450090
	.long	-1396901568
	.long	853044451
	.long	1172266101
	.long	-589951537
	.long	-1412350631
	.long	651767980
	.long	1373503546
	.long	-925412992
	.long	-1076862698
	.long	565507253
	.long	1454621731
	.long	-809855591
	.long	-1195530993
	.long	671266974
	.long	1594198024
	.long	-972236366
	.long	-1324619484
	.long	795835527
	.long	1483230225
	.long	-1050600021
	.long	-1234817731
	.long	1994146192
	.long	31158534
	.long	-1731059524
	.long	-271249366
	.long	1907459465
	.long	112637215
	.long	-1614814043
	.long	-390540237
	.long	2013776290
	.long	251722036
	.long	-1777751922
	.long	-519137256
	.long	2137656763
	.long	141376813
	.long	-1855689577
	.long	-429695999
	.long	1802195444
	.long	476864866
	.long	-2056965928
	.long	-228458418
	.long	1812370925
	.long	453092731
	.long	-2113342271
	.long	-183516073
	.long	1706088902
	.long	314042704
	.long	-1950435094
	.long	-54949764
	.long	1658658271
	.long	366619977
	.long	-1932296973
	.long	-69972891
	.long	1303535960
	.long	984961486
	.long	-1547960204
	.long	-725929758
	.long	1256170817
	.long	1037604311
	.long	-1529756563
	.long	-740887301
	.long	1131014506
	.long	879679996
	.long	-1385723834
	.long	-631195440
	.long	1141124467
	.long	855842277
	.long	-1442165665
	.long	-586318647
	.long	1342533948
	.long	654459306
	.long	-1106571248
	.long	-921952122
	.long	1466479909
	.long	544179635
	.long	-1184443383
	.long	-832445281
	.long	1591671054
	.long	702138776
	.long	-1328506846
	.long	-942167884
	.long	1504918807
	.long	783551873
	.long	-1212326853
	.long	-1061524307
	.long	-306674912
	.long	-1698712650
	.long	62317068
	.long	1957810842
	.long	-355121351
	.long	-1647151185
	.long	81470997
	.long	1943803523
	.long	-480048366
	.long	-1805370492
	.long	225274430
	.long	2053790376
	.long	-468791541
	.long	-1828061283
	.long	167816743
	.long	2097651377
	.long	-267414716
	.long	-2029476910
	.long	503444072
	.long	1762050814
	.long	-144550051
	.long	-2140837941
	.long	426522225
	.long	1852507879
	.long	-19653770
	.long	-1982649376
	.long	282753626
	.long	1742555852
	.long	-105259153
	.long	-1900089351
	.long	397917763
	.long	1622183637
	.long	-690576408
	.long	-1580100738
	.long	953729732
	.long	1340076626
	.long	-776247311
	.long	-1497606297
	.long	1068828381
	.long	1219638859
	.long	-670225446
	.long	-1358292148
	.long	906185462
	.long	1090812512
	.long	-547295293
	.long	-1469587627
	.long	829329135
	.long	1181335161
	.long	-882789492
	.long	-1134132454
	.long	628085408
	.long	1382605366
	.long	-871598187
	.long	-1156888829
	.long	570562233
	.long	1426400815
	.long	-977650754
	.long	-1296233688
	.long	733239954
	.long	1555261956
	.long	-1026031705
	.long	-1244606671
	.long	752459403
	.long	1541320221
	.long	-1687895376
	.long	-328994266
	.long	1969922972
	.long	40735498
	.long	-1677130071
	.long	-351390145
	.long	1913087877
	.long	83908371
	.long	-1782625662
	.long	-491226604
	.long	2075208622
	.long	213261112
	.long	-1831694693
	.long	-438977011
	.long	2094854071
	.long	198958881
	.long	-2032938284
	.long	-237706686
	.long	1759359992
	.long	534414190
	.long	-2118248755
	.long	-155638181
	.long	1873836001
	.long	414664567
	.long	-2012718362
	.long	-15766928
	.long	1711684554
	.long	285281116
	.long	-1889165569
	.long	-127750551
	.long	1634467795
	.long	376229701
	.long	-1609899400
	.long	-686959890
	.long	1308918612
	.long	956543938
	.long	-1486412191
	.long	-799009033
	.long	1231636301
	.long	1047427035
	.long	-1362007478
	.long	-640263460
	.long	1088359270
	.long	936918000
	.long	-1447252397
	.long	-558129467
	.long	1202900863
	.long	817233897
	.long	-1111625188
	.long	-893730166
	.long	1404277552
	.long	615818150
	.long	-1160759803
	.long	-841546093
	.long	1423857449
	.long	601450431
	.long	-1285129682
	.long	-1000256840
	.long	1567103746
	.long	711928724
	.long	-1274298825
	.long	-1022587231
	.long	1510334235
	.long	755167117
	.data
	.align 16
	.type	firstmap.8529, @object
	.size	firstmap.8529, 20
firstmap.8529:
	.long	0
	.long	1
	.long	0
	.long	5
	.long	6
	.align 16
	.type	mapping.8528, @object
	.size	mapping.8528, 20
mapping.8528:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.section	.rodata
	.align 16
	.type	__PRETTY_FUNCTION__.8589, @object
	.size	__PRETTY_FUNCTION__.8589, 22
__PRETTY_FUNCTION__.8589:
	.string	"stbi_write_png_to_mem"
	.align 8
	.type	__PRETTY_FUNCTION__.8403, @object
	.size	__PRETTY_FUNCTION__.8403, 15
__PRETTY_FUNCTION__.8403:
	.string	"stbiw__sbgrowf"
	.align 16
	.type	disteb.8442, @object
	.size	disteb.8442, 30
disteb.8442:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	6
	.byte	7
	.byte	7
	.byte	8
	.byte	8
	.byte	9
	.byte	9
	.byte	10
	.byte	10
	.byte	11
	.byte	11
	.byte	12
	.byte	12
	.byte	13
	.byte	13
	.align 32
	.type	distc.8441, @object
	.size	distc.8441, 62
distc.8441:
	.value	1
	.value	2
	.value	3
	.value	4
	.value	5
	.value	7
	.value	9
	.value	13
	.value	17
	.value	25
	.value	33
	.value	49
	.value	65
	.value	97
	.value	129
	.value	193
	.value	257
	.value	385
	.value	513
	.value	769
	.value	1025
	.value	1537
	.value	2049
	.value	3073
	.value	4097
	.value	6145
	.value	8193
	.value	12289
	.value	16385
	.value	24577
	.value	-32768
	.align 16
	.type	lengtheb.8440, @object
	.size	lengtheb.8440, 29
lengtheb.8440:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	0
	.align 32
	.type	lengthc.8439, @object
	.size	lengthc.8439, 60
lengthc.8439:
	.value	3
	.value	4
	.value	5
	.value	6
	.value	7
	.value	8
	.value	9
	.value	10
	.value	11
	.value	13
	.value	15
	.value	17
	.value	19
	.value	23
	.value	27
	.value	31
	.value	35
	.value	43
	.value	51
	.value	59
	.value	67
	.value	83
	.value	99
	.value	115
	.value	131
	.value	163
	.value	195
	.value	227
	.value	258
	.value	259
	.align 16
	.type	__PRETTY_FUNCTION__.8466, @object
	.size	__PRETTY_FUNCTION__.8466, 19
__PRETTY_FUNCTION__.8466:
	.string	"stbi_zlib_compress"
	.align 16
	.type	__PRETTY_FUNCTION__.8314, @object
	.size	__PRETTY_FUNCTION__.8314, 23
__PRETTY_FUNCTION__.8314:
	.string	"stbiw__write_dump_data"
	.align 16
	.type	__PRETTY_FUNCTION__.8307, @object
	.size	__PRETTY_FUNCTION__.8307, 22
__PRETTY_FUNCTION__.8307:
	.string	"stbiw__write_run_data"
	.align 8
	.type	__PRETTY_FUNCTION__.8137, @object
	.size	__PRETTY_FUNCTION__.8137, 15
__PRETTY_FUNCTION__.8137:
	.string	"stbiw__writefv"
	.align 32
	.type	stbiw__jpg_ZigZag, @object
	.size	stbiw__jpg_ZigZag, 64
stbiw__jpg_ZigZag:
	.byte	0
	.byte	1
	.byte	5
	.byte	6
	.byte	14
	.byte	15
	.byte	27
	.byte	28
	.byte	2
	.byte	4
	.byte	7
	.byte	13
	.byte	16
	.byte	26
	.byte	29
	.byte	42
	.byte	3
	.byte	8
	.byte	12
	.byte	17
	.byte	25
	.byte	30
	.byte	41
	.byte	43
	.byte	9
	.byte	11
	.byte	18
	.byte	24
	.byte	31
	.byte	40
	.byte	44
	.byte	53
	.byte	10
	.byte	19
	.byte	23
	.byte	32
	.byte	39
	.byte	45
	.byte	52
	.byte	54
	.byte	20
	.byte	22
	.byte	33
	.byte	38
	.byte	46
	.byte	51
	.byte	55
	.byte	60
	.byte	21
	.byte	34
	.byte	37
	.byte	47
	.byte	50
	.byte	56
	.byte	59
	.byte	61
	.byte	35
	.byte	36
	.byte	48
	.byte	49
	.byte	57
	.byte	58
	.byte	62
	.byte	63
	.globl	stbi_write_force_png_filter
	.data
	.align 4
	.type	stbi_write_force_png_filter, @object
	.size	stbi_write_force_png_filter, 4
stbi_write_force_png_filter:
	.long	-1
	.globl	stbi_write_tga_with_rle
	.align 4
	.type	stbi_write_tga_with_rle, @object
	.size	stbi_write_tga_with_rle, 4
stbi_write_tga_with_rle:
	.long	1
	.globl	stbi__flip_vertically_on_write
	.bss
	.align 4
	.type	stbi__flip_vertically_on_write, @object
	.size	stbi__flip_vertically_on_write, 4
stbi__flip_vertically_on_write:
	.zero	4
	.globl	stbi_write_png_compression_level
	.data
	.align 4
	.type	stbi_write_png_compression_level, @object
	.size	stbi_write_png_compression_level, 4
stbi_write_png_compression_level:
	.long	8
	.section	.rodata
	.align 32
	.type	colormap__inferno, @object
	.size	colormap__inferno, 3072
colormap__inferno:
	.long	985637012
	.long	972312950
	.long	1013132856
	.long	991203827
	.long	983987745
	.long	1016602653
	.long	995636233
	.long	991126517
	.long	1019646174
	.long	999620352
	.long	996035665
	.long	1023227103
	.long	1002753531
	.long	999931737
	.long	1025371902
	.long	1006339828
	.long	1003032704
	.long	1027594011
	.long	1008510398
	.long	1006419285
	.long	1029823904
	.long	1010767403
	.long	1008355779
	.long	1031927633
	.long	1013271369
	.long	1010297104
	.long	1033055330
	.long	1015524079
	.long	1012349025
	.long	1034185444
	.long	1017033760
	.long	1014493287
	.long	1035324281
	.long	1018684101
	.long	1015866603
	.long	1036473185
	.long	1020480471
	.long	1017011212
	.long	1037627860
	.long	1022434145
	.long	1018177295
	.long	1038794346
	.long	1023983286
	.long	1019357874
	.long	1039972241
	.long	1025132995
	.long	1020549191
	.long	1040672723
	.long	1026363771
	.long	1021739971
	.long	1041270596
	.long	1027615217
	.long	1022913034
	.long	1041876119
	.long	1028884649
	.long	1023738741
	.long	1042486139
	.long	1030174481
	.long	1024301113
	.long	1043100856
	.long	1031487399
	.long	1024843621
	.long	1043720137
	.long	1032312972
	.long	1025357407
	.long	1044345591
	.long	1032997214
	.long	1025837906
	.long	1044975878
	.long	1033696220
	.long	1026270356
	.long	1045609721
	.long	1034410929
	.long	1026652339
	.long	1046246584
	.long	1035142282
	.long	1026981978
	.long	1046885729
	.long	1035891083
	.long	1027257661
	.long	1047526283
	.long	1036657734
	.long	1027477510
	.long	1048166904
	.long	1037442774
	.long	1027640182
	.long	1048691092
	.long	1038246067
	.long	1027745140
	.long	1049009255
	.long	1039067479
	.long	1027792116
	.long	1049324968
	.long	1039906609
	.long	1027781916
	.long	1049637125
	.long	1040474953
	.long	1027716686
	.long	1049944618
	.long	1040910691
	.long	1027599380
	.long	1050246205
	.long	1041353610
	.long	1027434560
	.long	1050540713
	.long	1041802904
	.long	1027226791
	.long	1050826999
	.long	1042257700
	.long	1026982783
	.long	1051103924
	.long	1042716658
	.long	1026713006
	.long	1051370312
	.long	1043178770
	.long	1026427122
	.long	1051625225
	.long	1043643029
	.long	1026135333
	.long	1051868059
	.long	1044108496
	.long	1025847302
	.long	1052098242
	.long	1044574097
	.long	1025573497
	.long	1052315541
	.long	1045039162
	.long	1025329490
	.long	1052519820
	.long	1045503018
	.long	1025123331
	.long	1052711181
	.long	1045965130
	.long	1024961733
	.long	1052889858
	.long	1046425094
	.long	1024850332
	.long	1053056255
	.long	1046882374
	.long	1024793961
	.long	1053210840
	.long	1047337036
	.long	1024793961
	.long	1053354151
	.long	1047789014
	.long	1024851943
	.long	1053486792
	.long	1048238241
	.long	1024968444
	.long	1053609400
	.long	1048630358
	.long	1025142927
	.long	1053722512
	.long	1048852287
	.long	1025375392
	.long	1053826765
	.long	1049072941
	.long	1025664229
	.long	1053922731
	.long	1049292286
	.long	1026006484
	.long	1054011013
	.long	1049510491
	.long	1026390615
	.long	1054092080
	.long	1049727622
	.long	1026814743
	.long	1054166437
	.long	1049943779
	.long	1027274036
	.long	1054234519
	.long	1050159031
	.long	1027764199
	.long	1054296729
	.long	1050373444
	.long	1028281206
	.long	1054353469
	.long	1050587085
	.long	1028821029
	.long	1054405109
	.long	1050800055
	.long	1029380181
	.long	1054451918
	.long	1051012387
	.long	1029955706
	.long	1054494230
	.long	1051224149
	.long	1030544385
	.long	1054532281
	.long	1051435408
	.long	1031143801
	.long	1054566271
	.long	1051646231
	.long	1031751808
	.long	1054596504
	.long	1051856650
	.long	1032082789
	.long	1054623079
	.long	1052066735
	.long	1032392697
	.long	1054646198
	.long	1052276517
	.long	1032704351
	.long	1054666029
	.long	1052486064
	.long	1033017347
	.long	1054682705
	.long	1052695411
	.long	1033330879
	.long	1054696328
	.long	1052904555
	.long	1033644680
	.long	1054707032
	.long	1053113499
	.long	1033958481
	.long	1054714951
	.long	1053322375
	.long	1034272014
	.long	1054720118
	.long	1053531117
	.long	1034584741
	.long	1054722602
	.long	1053739826
	.long	1034896529
	.long	1054722467
	.long	1053948501
	.long	1035207377
	.long	1054719749
	.long	1054157142
	.long	1035517018
	.long	1054714548
	.long	1054365784
	.long	1035825450
	.long	1054706864
	.long	1054574459
	.long	1036132674
	.long	1054696731
	.long	1054783134
	.long	1036438557
	.long	1054684215
	.long	1054991842
	.long	1036743097
	.long	1054669284
	.long	1055200584
	.long	1037046295
	.long	1054652037
	.long	1055409394
	.long	1037348419
	.long	1054632508
	.long	1055618236
	.long	1037649201
	.long	1054610630
	.long	1055827113
	.long	1037948909
	.long	1054586438
	.long	1056036090
	.long	1038247543
	.long	1054559896
	.long	1056245134
	.long	1038545104
	.long	1054531073
	.long	1056454212
	.long	1038841725
	.long	1054499968
	.long	1056663356
	.long	1039137675
	.long	1054466548
	.long	1056872568
	.long	1039432954
	.long	1054430846
	.long	1057023211
	.long	1039727696
	.long	1054392862
	.long	1057127850
	.long	1040022170
	.long	1054352597
	.long	1057232490
	.long	1040251817
	.long	1054310016
	.long	1057337163
	.long	1040398785
	.long	1054265120
	.long	1057441819
	.long	1040545820
	.long	1054217909
	.long	1057546492
	.long	1040692990
	.long	1054168417
	.long	1057651132
	.long	1040840294
	.long	1054116608
	.long	1057755771
	.long	1040987934
	.long	1054062519
	.long	1057860377
	.long	1041135909
	.long	1054006080
	.long	1057964933
	.long	1041284353
	.long	1053947326
	.long	1058069455
	.long	1041433402
	.long	1053886257
	.long	1058173927
	.long	1041583055
	.long	1053822873
	.long	1058278331
	.long	1041733513
	.long	1053757173
	.long	1058382635
	.long	1041884844
	.long	1053689192
	.long	1058486872
	.long	1042037114
	.long	1053618896
	.long	1058590991
	.long	1042190457
	.long	1053546250
	.long	1058694993
	.long	1042345009
	.long	1053471290
	.long	1058798861
	.long	1042500903
	.long	1053394047
	.long	1058902595
	.long	1042658139
	.long	1053314523
	.long	1059006144
	.long	1042816986
	.long	1053232718
	.long	1059109525
	.long	1042977443
	.long	1053148664
	.long	1059212721
	.long	1043139645
	.long	1053062362
	.long	1059315683
	.long	1043303793
	.long	1052973812
	.long	1059418444
	.long	1043469955
	.long	1052883013
	.long	1059520936
	.long	1043638197
	.long	1052789967
	.long	1059623176
	.long	1043808721
	.long	1052694739
	.long	1059725131
	.long	1043981660
	.long	1052597364
	.long	1059826784
	.long	1044157083
	.long	1052497808
	.long	1059928102
	.long	1044335190
	.long	1052396139
	.long	1060029067
	.long	1044515981
	.long	1052292388
	.long	1060129680
	.long	1044699725
	.long	1052186558
	.long	1060229907
	.long	1044886422
	.long	1052078680
	.long	1060329715
	.long	1045076340
	.long	1051968789
	.long	1060429103
	.long	1045269412
	.long	1051856852
	.long	1060528022
	.long	1045465907
	.long	1051742968
	.long	1060626470
	.long	1045665891
	.long	1051627138
	.long	1060724432
	.long	1045869500
	.long	1051509463
	.long	1060821841
	.long	1046076799
	.long	1051389908
	.long	1060918713
	.long	1046287990
	.long	1051268575
	.long	1061015014
	.long	1046503141
	.long	1051145464
	.long	1061110711
	.long	1046722319
	.long	1051020642
	.long	1061205788
	.long	1046945657
	.long	1050894108
	.long	1061300210
	.long	1047173223
	.long	1050765964
	.long	1061393961
	.long	1047405219
	.long	1050636209
	.long	1061487007
	.long	1047641643
	.long	1050504877
	.long	1061579332
	.long	1047882564
	.long	1050372035
	.long	1061670902
	.long	1048128183
	.long	1050237716
	.long	1061761701
	.long	1048378432
	.long	1050101955
	.long	1061851694
	.long	1048604723
	.long	1049964818
	.long	1061940848
	.long	1048734645
	.long	1049826372
	.long	1062029163
	.long	1048867051
	.long	1049686618
	.long	1062116589
	.long	1049001873
	.long	1049545656
	.long	1062203109
	.long	1049139245
	.long	1049403486
	.long	1062288707
	.long	1049279100
	.long	1049260175
	.long	1062373348
	.long	1049421471
	.long	1049115723
	.long	1062456999
	.long	1049566426
	.long	1048970265
	.long	1062539660
	.long	1049713931
	.long	1048823732
	.long	1062621298
	.long	1049863987
	.long	1048676261
	.long	1062701896
	.long	1050016592
	.long	1048479632
	.long	1062781420
	.long	1050171815
	.long	1048180930
	.long	1062859853
	.long	1050329555
	.long	1047880484
	.long	1062937163
	.long	1050489878
	.long	1047578293
	.long	1063013348
	.long	1050652751
	.long	1047274491
	.long	1063088393
	.long	1050818174
	.long	1046969078
	.long	1063162263
	.long	1050986114
	.long	1046662189
	.long	1063234941
	.long	1051156537
	.long	1046353757
	.long	1063306412
	.long	1051329477
	.long	1046043848
	.long	1063376659
	.long	1051504866
	.long	1045732463
	.long	1063445680
	.long	1051682671
	.long	1045419736
	.long	1063513443
	.long	1051862891
	.long	1045105532
	.long	1063579948
	.long	1052045495
	.long	1044789986
	.long	1063645161
	.long	1052230447
	.long	1044472964
	.long	1063709099
	.long	1052417714
	.long	1044154600
	.long	1063771712
	.long	1052607229
	.long	1043834759
	.long	1063833032
	.long	1052799027
	.long	1043513509
	.long	1063893028
	.long	1052992971
	.long	1043190849
	.long	1063951681
	.long	1053189097
	.long	1042866646
	.long	1064009009
	.long	1053387336
	.long	1042540900
	.long	1064064977
	.long	1053587656
	.long	1042213610
	.long	1064119587
	.long	1053789990
	.long	1041884709
	.long	1064172838
	.long	1053994336
	.long	1041554198
	.long	1064224730
	.long	1054200629
	.long	1041222009
	.long	1064275230
	.long	1054408800
	.long	1040888009
	.long	1064324353
	.long	1054618851
	.long	1040552330
	.long	1064372101
	.long	1054830714
	.long	1040214840
	.long	1064418473
	.long	1055044355
	.long	1039563816
	.long	1064463436
	.long	1055259741
	.long	1038881722
	.long	1064507007
	.long	1055476804
	.long	1038196138
	.long	1064549168
	.long	1055695512
	.long	1037507198
	.long	1064589953
	.long	1055915831
	.long	1036815037
	.long	1064629313
	.long	1056137693
	.long	1036119924
	.long	1064667263
	.long	1056361098
	.long	1035422528
	.long	1064703820
	.long	1056585980
	.long	1034723254
	.long	1064738952
	.long	1056812338
	.long	1034023174
	.long	1064772674
	.long	1057002340
	.long	1033323363
	.long	1064804970
	.long	1057116912
	.long	1032625431
	.long	1064835857
	.long	1057232137
	.long	1031931391
	.long	1064865318
	.long	1057348018
	.long	1030689340
	.long	1064893353
	.long	1057464535
	.long	1029335620
	.long	1064919961
	.long	1057581674
	.long	1028011697
	.long	1064945144
	.long	1057699417
	.long	1026730186
	.long	1064968884
	.long	1057817729
	.long	1025503973
	.long	1064991197
	.long	1057936630
	.long	1024398287
	.long	1065012068
	.long	1058056083
	.long	1023452857
	.long	1065031496
	.long	1058176074
	.long	1021938076
	.long	1065049465
	.long	1058296585
	.long	1020725821
	.long	1065066007
	.long	1058417616
	.long	1019872734
	.long	1065081073
	.long	1058539133
	.long	1019394382
	.long	1065094696
	.long	1058661154
	.long	1019306335
	.long	1065106843
	.long	1058783627
	.long	1019626310
	.long	1065117530
	.long	1058906571
	.long	1020372560
	.long	1065126757
	.long	1059029967
	.long	1021565488
	.long	1065134508
	.long	1059153783
	.long	1023226566
	.long	1065140766
	.long	1059278018
	.long	1024394260
	.long	1065145548
	.long	1059402673
	.long	1025728385
	.long	1065148853
	.long	1059527714
	.long	1027257125
	.long	1065150648
	.long	1059653157
	.long	1028913103
	.long	1065150967
	.long	1059778952
	.long	1030679140
	.long	1065149775
	.long	1059905100
	.long	1032168822
	.long	1065147091
	.long	1060031601
	.long	1033139485
	.long	1065142897
	.long	1060158420
	.long	1034146252
	.long	1065137193
	.long	1060285557
	.long	1035185231
	.long	1065129978
	.long	1060412997
	.long	1036254007
	.long	1065121271
	.long	1060540722
	.long	1037350432
	.long	1065111054
	.long	1060668715
	.long	1038473297
	.long	1065099293
	.long	1060796977
	.long	1039621664
	.long	1065086039
	.long	1060925491
	.long	1040491194
	.long	1065071292
	.long	1061054189
	.long	1041090208
	.long	1065055051
	.long	1061183105
	.long	1041701704
	.long	1065037351
	.long	1061312172
	.long	1042325682
	.long	1065018209
	.long	1061441390
	.long	1042962545
	.long	1064997640
	.long	1061570709
	.long	1043612427
	.long	1064975678
	.long	1061700111
	.long	1044275865
	.long	1064952375
	.long	1061829564
	.long	1044953329
	.long	1064927712
	.long	1061959051
	.long	1045645490
	.long	1064901708
	.long	1062088521
	.long	1046353153
	.long	1064874528
	.long	1062217923
	.long	1047076654
	.long	1064846259
	.long	1062347158
	.long	1047816730
	.long	1064817033
	.long	1062476175
	.long	1048574121
	.long	1064786868
	.long	1062604957
	.long	1048963017
	.long	1064755846
	.long	1062733420
	.long	1049360872
	.long	1064724356
	.long	1062861397
	.long	1049768726
	.long	1064692630
	.long	1062988786
	.long	1050186948
	.long	1064660653
	.long	1063115538
	.long	1050616781
	.long	1064629011
	.long	1063241451
	.long	1051058156
	.long	1064598191
	.long	1063366274
	.long	1051511174
	.long	1064568294
	.long	1063489972
	.long	1051977379
	.long	1064540293
	.long	1063612177
	.long	1052455798
	.long	1064514657
	.long	1063732688
	.long	1052947169
	.long	1064492260
	.long	1063851202
	.long	1053451090
	.long	1064473989
	.long	1063967401
	.long	1053967023
	.long	1064460819
	.long	1064080966
	.long	1054494096
	.long	1064453823
	.long	1064191578
	.long	1055030765
	.long	1064454008
	.long	1064298919
	.long	1055575186
	.long	1064462396
	.long	1064402753
	.long	1056124741
	.long	1064479744
	.long	1064502913
	.long	1056676912
	.long	1064506722
	.long	1064599298
	.long	1057096477
	.long	1064543548
	.long	1064691976
	.long	1057370667
	.long	1064590339
	.long	1064781046
	.long	1057641753
	.long	1064646828
	.long	1064866727
	.long	1057908746
	.long	1064712528
	.long	1064949288
	.long	1058171309
	.long	1064786968
	.long	1065029047
	.long	1058427682
	.long	1064869395
	.long	1065106289
	.long	1058678468
	.long	1064959136
	.long	1065181300
	.long	1058923516
	.long	1065055538
	.long	1065254381
	.long	1059162709
	.long	1065157963
	.long	1065325768
	.long	1059396029
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC6:
	.long	1060439283
	.long	1060439283
	.long	1060439283
	.long	1060439283
	.align 16
.LC7:
	.long	1053028117
	.long	1053028117
	.long	1053028117
	.long	1053028117
	.align 16
.LC8:
	.long	1057655764
	.long	1057655764
	.long	1057655764
	.long	1057655764
	.align 16
.LC9:
	.long	1067924853
	.long	1067924853
	.long	1067924853
	.long	1067924853
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC11:
	.long	1056964608
	.align 4
.LC12:
	.long	1077216499
	.align 4
.LC13:
	.long	1065353216
	.align 4
.LC14:
	.long	1081808063
	.align 4
.LC15:
	.long	1080853343
	.align 4
.LC16:
	.long	1079302960
	.align 4
.LC17:
	.long	1074674138
	.align 4
.LC18:
	.long	1069805333
	.align 4
.LC19:
	.long	1061668290
	.align 4
.LC20:
	.long	1058424226
	.align 4
.LC21:
	.long	1050220167
	.align 4
.LC22:
	.long	1038710997
	.align 4
.LC23:
	.long	1124073472
	.align 4
.LC24:
	.long	3190606382
	.align 4
.LC25:
	.long	1051302633
	.align 4
.LC26:
	.long	1054236297
	.align 4
.LC27:
	.long	1034323419
	.align 4
.LC30:
	.long	172994847
	.align 4
.LC31:
	.long	1132462080
	.section	.rodata.cst16
	.align 16
.LC33:
	.quad	5638868765947084579
	.quad	7598231316865893699
	.align 16
.LC34:
	.quad	2340009372826301556
	.quad	7449355557986792563
	.align 16
.LC35:
	.quad	3343206294633275237
	.quad	6071218788584786536
	.align 16
.LC36:
	.quad	6878238401287566141
	.quad	7305515286472780914
	.align 16
.LC38:
	.long	-1
	.long	0
	.long	4
	.long	2
	.align 16
.LC40:
	.long	65535
	.long	65535
	.long	65535
	.long	65535
	.align 16
.LC41:
	.long	18000
	.long	18000
	.long	18000
	.long	18000
	.align 16
.LC42:
	.long	30903
	.long	30903
	.long	30903
	.long	30903
	.section	.rodata.cst4
	.align 4
.LC44:
	.long	1132396544
	.ident	"GCC: (Ubuntu 7.1.0-10ubuntu1~16.04.york0) 7.1.0"
	.section	.note.GNU-stack,"",@progbits
