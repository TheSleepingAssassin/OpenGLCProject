	.file	"IndexBuffer.c"
	.text
	.globl	IndexBufferInit
	.def	IndexBufferInit;	.scl	2;	.type	32;	.endef
	.seh_proc	IndexBufferInit
IndexBufferInit:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$8, %ecx
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	IBBind(%rip), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	leaq	IBUnbind(%rip), %rdx
	movq	%rdx, 16(%rax)
	movq	.refptr.glad_glGenBuffers(%rip), %rax
	movq	(%rax), %r8
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	*%r8
	movq	.refptr.glad_glBindBuffer(%rip), %rax
	movq	(%rax), %r8
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	movl	$34963, %ecx
	call	*%r8
	movq	-8(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, 4(%rax)
	movq	.refptr.glad_glBufferData(%rip), %rax
	movq	(%rax), %rax
	movl	16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	movq	%rdx, %rcx
	movq	24(%rbp), %rdx
	movl	$35044, %r9d
	movq	%rdx, %r8
	movq	%rcx, %rdx
	movl	$34963, %ecx
	call	*%rax
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	IBBind
	.def	IBBind;	.scl	2;	.type	32;	.endef
	.seh_proc	IBBind
IBBind:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	.refptr.glad_glBindBuffer(%rip), %rax
	movq	(%rax), %r8
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	movl	$34963, %ecx
	call	*%r8
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	IBUnbind
	.def	IBUnbind;	.scl	2;	.type	32;	.endef
	.seh_proc	IBUnbind
IBUnbind:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	.refptr.glad_glBindBuffer(%rip), %rax
	movq	(%rax), %rax
	movl	$0, %edx
	movl	$34963, %ecx
	call	*%rax
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (tdm64-1) 9.2.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.glad_glBufferData, "dr"
	.globl	.refptr.glad_glBufferData
	.linkonce	discard
.refptr.glad_glBufferData:
	.quad	glad_glBufferData
	.section	.rdata$.refptr.glad_glBindBuffer, "dr"
	.globl	.refptr.glad_glBindBuffer
	.linkonce	discard
.refptr.glad_glBindBuffer:
	.quad	glad_glBindBuffer
	.section	.rdata$.refptr.glad_glGenBuffers, "dr"
	.globl	.refptr.glad_glGenBuffers
	.linkonce	discard
.refptr.glad_glGenBuffers:
	.quad	glad_glGenBuffers
