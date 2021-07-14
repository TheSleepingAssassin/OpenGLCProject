	.file	"Shader.c"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "ERROR::SHADER::VERTEX::COMPILATION::FAILED\0"
	.text
	.globl	CompileShader
	.def	CompileShader;	.scl	2;	.type	32;	.endef
	.seh_proc	CompileShader
CompileShader:
	pushq	%rbp
	.seh_pushreg	%rbp
	subq	$560, %rsp
	.seh_stackalloc	560
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%ecx, 448(%rbp)
	movq	%rdx, 456(%rbp)
	movq	.refptr.glad_glCreateShader(%rip), %rax
	movq	(%rax), %rax
	movl	448(%rbp), %ecx
	call	*%rax
	movl	%eax, 428(%rbp)
	movq	.refptr.glad_glShaderSource(%rip), %rax
	movq	(%rax), %r10
	leaq	456(%rbp), %rdx
	movl	428(%rbp), %eax
	movl	$0, %r9d
	movq	%rdx, %r8
	movl	$1, %edx
	movl	%eax, %ecx
	call	*%r10
	movq	.refptr.glad_glCompileShader(%rip), %rax
	movq	(%rax), %rdx
	movl	428(%rbp), %eax
	movl	%eax, %ecx
	call	*%rdx
	movq	.refptr.glad_glGetShaderiv(%rip), %rax
	movq	(%rax), %r9
	leaq	424(%rbp), %rdx
	movl	428(%rbp), %eax
	movq	%rdx, %r8
	movl	$35713, %edx
	movl	%eax, %ecx
	call	*%r9
	movl	424(%rbp), %eax
	testl	%eax, %eax
	jne	.L2
	movq	.refptr.glad_glGetShaderInfoLog(%rip), %rax
	movq	(%rax), %r10
	leaq	-96(%rbp), %rdx
	movl	428(%rbp), %eax
	movq	%rdx, %r9
	movl	$0, %r8d
	movl	$512, %edx
	movl	%eax, %ecx
	call	*%r10
	leaq	.LC0(%rip), %rcx
	call	printf
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
	jmp	.L4
.L2:
	movl	428(%rbp), %eax
.L4:
	addq	$560, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "ERROR::SHADER::PROGRAM::LINKING::FAILED\0"
	.text
	.globl	CreateShader
	.def	CreateShader;	.scl	2;	.type	32;	.endef
	.seh_proc	CreateShader
CreateShader:
	pushq	%rbp
	.seh_pushreg	%rbp
	subq	$560, %rsp
	.seh_stackalloc	560
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, 448(%rbp)
	movq	%rdx, 456(%rbp)
	movq	.refptr.glad_glCreateProgram(%rip), %rax
	movq	(%rax), %rax
	call	*%rax
	movl	%eax, 428(%rbp)
	movq	448(%rbp), %rdx
	movl	$35633, %ecx
	call	CompileShader
	movl	%eax, 424(%rbp)
	movq	456(%rbp), %rax
	movq	%rax, %rdx
	movl	$35632, %ecx
	call	CompileShader
	movl	%eax, 420(%rbp)
	movq	.refptr.glad_glAttachShader(%rip), %rax
	movq	(%rax), %r8
	movl	424(%rbp), %edx
	movl	428(%rbp), %eax
	movl	%eax, %ecx
	call	*%r8
	movq	.refptr.glad_glAttachShader(%rip), %rax
	movq	(%rax), %r8
	movl	420(%rbp), %edx
	movl	428(%rbp), %eax
	movl	%eax, %ecx
	call	*%r8
	movq	.refptr.glad_glLinkProgram(%rip), %rax
	movq	(%rax), %rdx
	movl	428(%rbp), %eax
	movl	%eax, %ecx
	call	*%rdx
	movq	.refptr.glad_glGetProgramiv(%rip), %rax
	movq	(%rax), %r9
	leaq	416(%rbp), %rdx
	movl	428(%rbp), %eax
	movq	%rdx, %r8
	movl	$35714, %edx
	movl	%eax, %ecx
	call	*%r9
	movl	416(%rbp), %eax
	testl	%eax, %eax
	jne	.L6
	movq	.refptr.glad_glGetProgramInfoLog(%rip), %rax
	movq	(%rax), %r10
	leaq	-96(%rbp), %rdx
	movl	428(%rbp), %eax
	movq	%rdx, %r9
	movl	$0, %r8d
	movl	$512, %edx
	movl	%eax, %ecx
	call	*%r10
	leaq	.LC1(%rip), %rcx
	call	printf
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	printf
.L6:
	movq	.refptr.glad_glDeleteShader(%rip), %rax
	movq	(%rax), %rdx
	movl	424(%rbp), %eax
	movl	%eax, %ecx
	call	*%rdx
	movq	.refptr.glad_glDeleteShader(%rip), %rax
	movq	(%rax), %rdx
	movl	420(%rbp), %eax
	movl	%eax, %ecx
	call	*%rdx
	movl	428(%rbp), %eax
	addq	$560, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	ShaderInit
	.def	ShaderInit;	.scl	2;	.type	32;	.endef
	.seh_proc	ShaderInit
ShaderInit:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$32, %ecx
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	pUse(%rip), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	leaq	pDisuse(%rip), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	leaq	pSetMat4(%rip), %rdx
	movq	%rdx, 24(%rax)
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	CreateShader
	movq	-8(%rbp), %rdx
	movl	%eax, (%rdx)
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	pUse
	.def	pUse;	.scl	2;	.type	32;	.endef
	.seh_proc	pUse
pUse:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	.refptr.glad_glUseProgram(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %ecx
	call	*%rdx
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	pDisuse
	.def	pDisuse;	.scl	2;	.type	32;	.endef
	.seh_proc	pDisuse
pDisuse:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	.refptr.glad_glUseProgram(%rip), %rax
	movq	(%rax), %rax
	movl	$0, %ecx
	call	*%rax
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	pSetMat4
	.def	pSetMat4;	.scl	2;	.type	32;	.endef
	.seh_proc	pSetMat4
pSetMat4:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	.refptr.glad_glGetUniformLocation(%rip), %rax
	movq	(%rax), %r8
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	movq	32(%rbp), %rdx
	movl	%eax, %ecx
	call	*%r8
	movl	%eax, -4(%rbp)
	movq	.refptr.glad_glUniformMatrix4fv(%rip), %rax
	movq	(%rax), %r10
	movq	24(%rbp), %rdx
	movl	-4(%rbp), %eax
	movq	%rdx, %r9
	movl	$0, %r8d
	movl	$1, %edx
	movl	%eax, %ecx
	call	*%r10
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (tdm64-1) 9.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.glad_glUniformMatrix4fv, "dr"
	.globl	.refptr.glad_glUniformMatrix4fv
	.linkonce	discard
.refptr.glad_glUniformMatrix4fv:
	.quad	glad_glUniformMatrix4fv
	.section	.rdata$.refptr.glad_glGetUniformLocation, "dr"
	.globl	.refptr.glad_glGetUniformLocation
	.linkonce	discard
.refptr.glad_glGetUniformLocation:
	.quad	glad_glGetUniformLocation
	.section	.rdata$.refptr.glad_glUseProgram, "dr"
	.globl	.refptr.glad_glUseProgram
	.linkonce	discard
.refptr.glad_glUseProgram:
	.quad	glad_glUseProgram
	.section	.rdata$.refptr.glad_glDeleteShader, "dr"
	.globl	.refptr.glad_glDeleteShader
	.linkonce	discard
.refptr.glad_glDeleteShader:
	.quad	glad_glDeleteShader
	.section	.rdata$.refptr.glad_glGetProgramInfoLog, "dr"
	.globl	.refptr.glad_glGetProgramInfoLog
	.linkonce	discard
.refptr.glad_glGetProgramInfoLog:
	.quad	glad_glGetProgramInfoLog
	.section	.rdata$.refptr.glad_glGetProgramiv, "dr"
	.globl	.refptr.glad_glGetProgramiv
	.linkonce	discard
.refptr.glad_glGetProgramiv:
	.quad	glad_glGetProgramiv
	.section	.rdata$.refptr.glad_glLinkProgram, "dr"
	.globl	.refptr.glad_glLinkProgram
	.linkonce	discard
.refptr.glad_glLinkProgram:
	.quad	glad_glLinkProgram
	.section	.rdata$.refptr.glad_glAttachShader, "dr"
	.globl	.refptr.glad_glAttachShader
	.linkonce	discard
.refptr.glad_glAttachShader:
	.quad	glad_glAttachShader
	.section	.rdata$.refptr.glad_glCreateProgram, "dr"
	.globl	.refptr.glad_glCreateProgram
	.linkonce	discard
.refptr.glad_glCreateProgram:
	.quad	glad_glCreateProgram
	.section	.rdata$.refptr.glad_glGetShaderInfoLog, "dr"
	.globl	.refptr.glad_glGetShaderInfoLog
	.linkonce	discard
.refptr.glad_glGetShaderInfoLog:
	.quad	glad_glGetShaderInfoLog
	.section	.rdata$.refptr.glad_glGetShaderiv, "dr"
	.globl	.refptr.glad_glGetShaderiv
	.linkonce	discard
.refptr.glad_glGetShaderiv:
	.quad	glad_glGetShaderiv
	.section	.rdata$.refptr.glad_glCompileShader, "dr"
	.globl	.refptr.glad_glCompileShader
	.linkonce	discard
.refptr.glad_glCompileShader:
	.quad	glad_glCompileShader
	.section	.rdata$.refptr.glad_glShaderSource, "dr"
	.globl	.refptr.glad_glShaderSource
	.linkonce	discard
.refptr.glad_glShaderSource:
	.quad	glad_glShaderSource
	.section	.rdata$.refptr.glad_glCreateShader, "dr"
	.globl	.refptr.glad_glCreateShader
	.linkonce	discard
.refptr.glad_glCreateShader:
	.quad	glad_glCreateShader
