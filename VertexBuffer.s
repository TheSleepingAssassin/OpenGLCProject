	.file	"VertexBuffer.c"
	.text
	.globl	VertexBufferInit
	.def	VertexBufferInit;	.scl	2;	.type	32;	.endef
	.seh_proc	VertexBufferInit
VertexBufferInit:
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
	leaq	VBBind(%rip), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	leaq	VBUnbind(%rip), %rdx
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
	movl	$34962, %ecx
	call	*%r8
	movq	.refptr.glad_glBufferData(%rip), %rax
	movq	(%rax), %r10
	movl	16(%rbp), %eax
	movq	24(%rbp), %rdx
	movl	$35044, %r9d
	movq	%rdx, %r8
	movq	%rax, %rdx
	movl	$34962, %ecx
	call	*%r10
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	VBBind
	.def	VBBind;	.scl	2;	.type	32;	.endef
	.seh_proc	VBBind
VBBind:
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
	movl	$34962, %ecx
	call	*%r8
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	VBUnbind
	.def	VBUnbind;	.scl	2;	.type	32;	.endef
	.seh_proc	VBUnbind
VBUnbind:
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
	movl	$34962, %ecx
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
