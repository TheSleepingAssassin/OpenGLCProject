	.file	"main.c"
	.text
	.def	glmm_fmadd;	.scl	3;	.type	32;	.endef
	.seh_proc	glmm_fmadd
glmm_fmadd:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$120, %rsp
	.seh_stackalloc	120
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, %rbx
	movaps	(%rbx), %xmm0
	movaps	%xmm0, -96(%rbp)
	movq	%rdx, %rbx
	movaps	(%rbx), %xmm0
	movaps	%xmm0, -112(%rbp)
	movq	%r8, %rbx
	movaps	(%rbx), %xmm0
	movaps	%xmm0, -128(%rbp)
	movaps	-96(%rbp), %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	-112(%rbp), %xmm0
	movaps	%xmm0, -80(%rbp)
	movaps	-64(%rbp), %xmm0
	mulps	-80(%rbp), %xmm0
	movaps	-128(%rbp), %xmm1
	movaps	%xmm1, -32(%rbp)
	movaps	%xmm0, -48(%rbp)
	movaps	-32(%rbp), %xmm0
	addps	-48(%rbp), %xmm0
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	wWidth
	.data
	.align 4
wWidth:
	.long	700
	.globl	wHeight
	.align 4
wHeight:
	.long	700
	.globl	deltaTime
	.bss
	.align 4
deltaTime:
	.space 4
	.globl	lastFrame
	.align 4
lastFrame:
	.space 4
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Window\0"
	.align 8
.LC1:
	.ascii "#version 330 core\12\12layout (location = 0) in vec3 aPos;\12\12uniform mat4 proj;\12uniform mat4 view;\12uniform mat4 model;\12\12void main()\12{\12\11gl_Position = proj * view * model * vec4(aPos, 1.0);\12};\12\0\0"
	.align 8
.LC2:
	.ascii "#version 330 core\12\12layout (location = 0) out vec4 color;\12\12void main()\12{\12\11color = vec4(1.0, 0.0, 0.0, 1.0);\12};\12\0\0"
.LC13:
	.ascii "proj\0"
.LC15:
	.ascii "view\0"
.LC19:
	.ascii "model\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	subq	$2544, %rsp
	.seh_stackalloc	2544
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%ecx, 2432(%rbp)
	movq	%rdx, 2440(%rbp)
	call	__main
	call	glfwInit
	testl	%eax, %eax
	jne	.L6
	movl	$-1, %eax
	jmp	.L56
.L6:
	movl	wHeight(%rip), %edx
	movl	wWidth(%rip), %eax
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	glfwCreateWindow
	movq	%rax, 2408(%rbp)
	cmpq	$0, 2408(%rbp)
	jne	.L8
	movl	$-1, %eax
	jmp	.L56
.L8:
	movq	2408(%rbp), %rax
	movq	%rax, %rcx
	call	glfwMakeContextCurrent
	movq	.refptr.glfwGetProcAddress(%rip), %rcx
	call	gladLoadGLLoader
	testl	%eax, %eax
	jne	.L9
	movl	$-1, %eax
	jmp	.L56
.L9:
	leaq	.LC1(%rip), %rax
	movq	%rax, 2400(%rbp)
	leaq	.LC2(%rip), %rax
	movq	%rax, 2392(%rbp)
	movq	2392(%rbp), %rdx
	movq	2400(%rbp), %rax
	movq	%rax, %rcx
	call	ShaderInit
	movq	%rax, 2384(%rbp)
	movq	2384(%rbp), %rax
	movq	8(%rax), %rdx
	movq	2384(%rbp), %rax
	movq	%rax, %rcx
	call	*%rdx
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, 464(%rbp)
	movss	.LC4(%rip), %xmm0
	movss	%xmm0, 468(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, 472(%rbp)
	movss	.LC4(%rip), %xmm0
	movss	%xmm0, 476(%rbp)
	movss	.LC4(%rip), %xmm0
	movss	%xmm0, 480(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, 484(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, 488(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, 492(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, 496(%rbp)
	movss	.LC4(%rip), %xmm0
	movss	%xmm0, 500(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, 504(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, 508(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, 512(%rbp)
	movss	.LC4(%rip), %xmm0
	movss	%xmm0, 516(%rbp)
	movss	.LC4(%rip), %xmm0
	movss	%xmm0, 520(%rbp)
	movss	.LC4(%rip), %xmm0
	movss	%xmm0, 524(%rbp)
	movss	.LC4(%rip), %xmm0
	movss	%xmm0, 528(%rbp)
	movss	.LC4(%rip), %xmm0
	movss	%xmm0, 532(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, 536(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, 540(%rbp)
	movss	.LC4(%rip), %xmm0
	movss	%xmm0, 544(%rbp)
	movss	.LC4(%rip), %xmm0
	movss	%xmm0, 548(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, 552(%rbp)
	movss	.LC4(%rip), %xmm0
	movss	%xmm0, 556(%rbp)
	movl	$0, 320(%rbp)
	movl	$1, 324(%rbp)
	movl	$2, 328(%rbp)
	movl	$1, 332(%rbp)
	movl	$2, 336(%rbp)
	movl	$3, 340(%rbp)
	movl	$0, 344(%rbp)
	movl	$4, 348(%rbp)
	movl	$6, 352(%rbp)
	movl	$0, 356(%rbp)
	movl	$6, 360(%rbp)
	movl	$2, 364(%rbp)
	movl	$1, 368(%rbp)
	movl	$5, 372(%rbp)
	movl	$7, 376(%rbp)
	movl	$1, 380(%rbp)
	movl	$7, 384(%rbp)
	movl	$3, 388(%rbp)
	movl	$0, 392(%rbp)
	movl	$1, 396(%rbp)
	movl	$4, 400(%rbp)
	movl	$1, 404(%rbp)
	movl	$4, 408(%rbp)
	movl	$5, 412(%rbp)
	movl	$2, 416(%rbp)
	movl	$3, 420(%rbp)
	movl	$6, 424(%rbp)
	movl	$3, 428(%rbp)
	movl	$6, 432(%rbp)
	movl	$7, 436(%rbp)
	movl	$4, 440(%rbp)
	movl	$5, 444(%rbp)
	movl	$6, 448(%rbp)
	movl	$5, 452(%rbp)
	movl	$6, 456(%rbp)
	movl	$7, 460(%rbp)
	movq	.refptr.glad_glGenVertexArrays(%rip), %rax
	movq	(%rax), %r8
	leaq	316(%rbp), %rax
	movq	%rax, %rdx
	movl	$1, %ecx
	call	*%r8
	movq	.refptr.glad_glBindVertexArray(%rip), %rax
	movq	(%rax), %rdx
	movl	316(%rbp), %eax
	movl	%eax, %ecx
	call	*%rdx
	leaq	464(%rbp), %rax
	movq	%rax, %rdx
	movl	$96, %ecx
	call	VertexBufferInit
	movq	%rax, 2376(%rbp)
	movq	.refptr.glad_glVertexAttribPointer(%rip), %rax
	movq	(%rax), %rax
	movq	$0, 40(%rsp)
	movl	$12, 32(%rsp)
	movl	$0, %r9d
	movl	$5126, %r8d
	movl	$3, %edx
	movl	$0, %ecx
	call	*%rax
	movq	.refptr.glad_glEnableVertexAttribArray(%rip), %rax
	movq	(%rax), %rax
	movl	$0, %ecx
	call	*%rax
	leaq	320(%rbp), %rax
	movq	%rax, %rdx
	movl	$36, %ecx
	call	IndexBufferInit
	movq	%rax, 2368(%rbp)
	movq	.refptr.glad_glBindVertexArray(%rip), %rax
	movq	(%rax), %rax
	movl	$0, %ecx
	call	*%rax
	leaq	240(%rbp), %rax
	movq	%rax, 2136(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, 96(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 100(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 104(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 108(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 112(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, 116(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 120(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 124(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 128(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 132(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, 136(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 140(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 144(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 148(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 152(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, 156(%rbp)
	leaq	96(%rbp), %rax
	movq	%rax, 2128(%rbp)
	movq	2136(%rbp), %rax
	movq	%rax, 2120(%rbp)
	movq	2128(%rbp), %rax
	movq	%rax, 2112(%rbp)
	movq	2112(%rbp), %rax
	movups	(%rax), %xmm0
	movq	2120(%rbp), %rax
	movq	%rax, 2104(%rbp)
	movaps	%xmm0, 2080(%rbp)
	movaps	2080(%rbp), %xmm0
	movq	2104(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	movq	2128(%rbp), %rax
	addq	$16, %rax
	movq	%rax, 2072(%rbp)
	movq	2072(%rbp), %rax
	movups	(%rax), %xmm0
	movq	2120(%rbp), %rax
	addq	$16, %rax
	movq	%rax, 2064(%rbp)
	movaps	%xmm0, 2048(%rbp)
	movaps	2048(%rbp), %xmm0
	movq	2064(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	movq	2128(%rbp), %rax
	addq	$32, %rax
	movq	%rax, 2040(%rbp)
	movq	2040(%rbp), %rax
	movups	(%rax), %xmm0
	movq	2120(%rbp), %rax
	addq	$32, %rax
	movq	%rax, 2032(%rbp)
	movaps	%xmm0, 2016(%rbp)
	movaps	2016(%rbp), %xmm0
	movq	2032(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	movq	2128(%rbp), %rax
	addq	$48, %rax
	movq	%rax, 2008(%rbp)
	movq	2008(%rbp), %rax
	movups	(%rax), %xmm0
	movq	2120(%rbp), %rax
	addq	$48, %rax
	movq	%rax, 2000(%rbp)
	movaps	%xmm0, 1984(%rbp)
	movaps	1984(%rbp), %xmm0
	movq	2000(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	nop
	nop
	movl	wWidth(%rip), %eax
	cvtsi2ssl	%eax, %xmm0
	movl	wHeight(%rip), %eax
	cvtsi2ssl	%eax, %xmm1
	divss	%xmm1, %xmm0
	movss	.LC7(%rip), %xmm1
	movss	%xmm1, 2148(%rbp)
	movss	2148(%rbp), %xmm2
	movss	.LC8(%rip), %xmm1
	mulss	%xmm2, %xmm1
	movss	.LC9(%rip), %xmm2
	divss	%xmm2, %xmm1
	movss	%xmm1, 2364(%rbp)
	movss	%xmm0, 2360(%rbp)
	movss	.LC10(%rip), %xmm0
	movss	%xmm0, 2356(%rbp)
	movss	.LC11(%rip), %xmm0
	movss	%xmm0, 2352(%rbp)
	leaq	240(%rbp), %rax
	movq	%rax, 2344(%rbp)
	movss	2364(%rbp), %xmm0
	movss	%xmm0, 2340(%rbp)
	movss	2360(%rbp), %xmm0
	movss	%xmm0, 2336(%rbp)
	movss	2356(%rbp), %xmm0
	movss	%xmm0, 2332(%rbp)
	movss	2352(%rbp), %xmm0
	movss	%xmm0, 2328(%rbp)
	movq	2344(%rbp), %rax
	movq	%rax, 2320(%rbp)
	movq	2320(%rbp), %rax
	movq	%rax, 2312(%rbp)
	pxor	%xmm0, %xmm0
	movaps	%xmm0, 2288(%rbp)
	movq	2312(%rbp), %rax
	movq	%rax, 2280(%rbp)
	movaps	2288(%rbp), %xmm0
	movaps	%xmm0, 2256(%rbp)
	movaps	2256(%rbp), %xmm0
	movq	2280(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	movq	2312(%rbp), %rax
	addq	$16, %rax
	movq	%rax, 2248(%rbp)
	movaps	2288(%rbp), %xmm0
	movaps	%xmm0, 2224(%rbp)
	movaps	2224(%rbp), %xmm0
	movq	2248(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	movq	2312(%rbp), %rax
	addq	$32, %rax
	movq	%rax, 2216(%rbp)
	movaps	2288(%rbp), %xmm0
	movaps	%xmm0, 2192(%rbp)
	movaps	2192(%rbp), %xmm0
	movq	2216(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	movq	2312(%rbp), %rax
	addq	$48, %rax
	movq	%rax, 2184(%rbp)
	movaps	2288(%rbp), %xmm0
	movaps	%xmm0, 2160(%rbp)
	movaps	2160(%rbp), %xmm0
	movq	2184(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	nop
	movss	2340(%rbp), %xmm1
	movss	.LC4(%rip), %xmm0
	mulss	%xmm1, %xmm0
	call	tanf
	movss	.LC5(%rip), %xmm1
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, 2156(%rbp)
	movss	2332(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	subss	2328(%rbp), %xmm1
	movss	.LC5(%rip), %xmm0
	divss	%xmm1, %xmm0
	movss	%xmm0, 2152(%rbp)
	movss	2156(%rbp), %xmm0
	divss	2336(%rbp), %xmm0
	movq	2320(%rbp), %rax
	movss	%xmm0, (%rax)
	movq	2320(%rbp), %rax
	addq	$16, %rax
	movss	2156(%rbp), %xmm0
	movss	%xmm0, 4(%rax)
	movss	2332(%rbp), %xmm0
	addss	2328(%rbp), %xmm0
	movq	2320(%rbp), %rax
	addq	$32, %rax
	mulss	2152(%rbp), %xmm0
	movss	%xmm0, 8(%rax)
	movq	2320(%rbp), %rax
	addq	$32, %rax
	movss	.LC12(%rip), %xmm0
	movss	%xmm0, 12(%rax)
	movss	2332(%rbp), %xmm0
	addss	%xmm0, %xmm0
	mulss	2328(%rbp), %xmm0
	movq	2320(%rbp), %rax
	addq	$48, %rax
	mulss	2152(%rbp), %xmm0
	movss	%xmm0, 8(%rax)
	nop
	nop
	movq	2384(%rbp), %rax
	movq	24(%rax), %r9
	leaq	240(%rbp), %rdx
	movq	2384(%rbp), %rax
	leaq	.LC13(%rip), %r8
	movq	%rax, %rcx
	call	*%r9
	jmp	.L16
.L55:
	call	HandleDeltaTime
	movq	.refptr.glad_glClear(%rip), %rax
	movq	(%rax), %rax
	movl	$16384, %ecx
	call	*%rax
	leaq	-32(%rbp), %rax
	movq	%rax, 712(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, 96(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 100(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 104(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 108(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 112(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, 116(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 120(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 124(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 128(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 132(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, 136(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 140(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 144(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 148(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 152(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, 156(%rbp)
	leaq	96(%rbp), %rax
	movq	%rax, 704(%rbp)
	movq	712(%rbp), %rax
	movq	%rax, 696(%rbp)
	movq	704(%rbp), %rax
	movq	%rax, 688(%rbp)
	movq	688(%rbp), %rax
	movups	(%rax), %xmm0
	movq	696(%rbp), %rax
	movq	%rax, 680(%rbp)
	movaps	%xmm0, 656(%rbp)
	movaps	656(%rbp), %xmm0
	movq	680(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	movq	704(%rbp), %rax
	addq	$16, %rax
	movq	%rax, 648(%rbp)
	movq	648(%rbp), %rax
	movups	(%rax), %xmm0
	movq	696(%rbp), %rax
	addq	$16, %rax
	movq	%rax, 640(%rbp)
	movaps	%xmm0, 624(%rbp)
	movaps	624(%rbp), %xmm0
	movq	640(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	movq	704(%rbp), %rax
	addq	$32, %rax
	movq	%rax, 616(%rbp)
	movq	616(%rbp), %rax
	movups	(%rax), %xmm0
	movq	696(%rbp), %rax
	addq	$32, %rax
	movq	%rax, 608(%rbp)
	movaps	%xmm0, 592(%rbp)
	movaps	592(%rbp), %xmm0
	movq	608(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	movq	704(%rbp), %rax
	addq	$48, %rax
	movq	%rax, 584(%rbp)
	movq	584(%rbp), %rax
	movups	(%rax), %xmm0
	movq	696(%rbp), %rax
	addq	$48, %rax
	movq	%rax, 576(%rbp)
	movaps	%xmm0, 560(%rbp)
	movaps	560(%rbp), %xmm0
	movq	576(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	nop
	nop
	pxor	%xmm0, %xmm0
	movss	%xmm0, 228(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 232(%rbp)
	movss	.LC14(%rip), %xmm0
	movss	%xmm0, 236(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, 904(%rbp)
	leaq	228(%rbp), %rax
	movq	%rax, 896(%rbp)
	movq	904(%rbp), %rax
	movq	%rax, 888(%rbp)
	movq	888(%rbp), %rax
	movups	(%rax), %xmm0
	movaps	%xmm0, 864(%rbp)
	movq	904(%rbp), %rax
	addq	$16, %rax
	movq	%rax, 856(%rbp)
	movq	856(%rbp), %rax
	movups	(%rax), %xmm0
	movaps	%xmm0, 832(%rbp)
	movq	904(%rbp), %rax
	addq	$32, %rax
	movq	%rax, 824(%rbp)
	movq	824(%rbp), %rax
	movups	(%rax), %xmm0
	movaps	%xmm0, 800(%rbp)
	movq	904(%rbp), %rax
	addq	$48, %rax
	movq	%rax, 792(%rbp)
	movq	792(%rbp), %rax
	movups	(%rax), %xmm0
	movaps	%xmm0, 768(%rbp)
	movq	896(%rbp), %rax
	addq	$8, %rax
	movss	(%rax), %xmm0
	movss	%xmm0, 764(%rbp)
	movss	764(%rbp), %xmm0
	shufps	$0, %xmm0, %xmm0
	movaps	%xmm0, %xmm1
	movaps	800(%rbp), %xmm0
	movaps	%xmm0, -48(%rbp)
	movaps	%xmm1, -64(%rbp)
	movaps	768(%rbp), %xmm0
	movaps	%xmm0, -80(%rbp)
	leaq	-80(%rbp), %rcx
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	glmm_fmadd
	movq	896(%rbp), %rax
	addq	$4, %rax
	movss	(%rax), %xmm1
	movss	%xmm1, 760(%rbp)
	movss	760(%rbp), %xmm1
	shufps	$0, %xmm1, %xmm1
	movaps	%xmm1, %xmm2
	movaps	832(%rbp), %xmm1
	movaps	%xmm1, -48(%rbp)
	movaps	%xmm2, -64(%rbp)
	movaps	%xmm0, -80(%rbp)
	leaq	-80(%rbp), %rcx
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	glmm_fmadd
	movq	896(%rbp), %rax
	movss	(%rax), %xmm1
	movss	%xmm1, 756(%rbp)
	movss	756(%rbp), %xmm1
	shufps	$0, %xmm1, %xmm1
	movaps	%xmm1, %xmm2
	movaps	864(%rbp), %xmm1
	movaps	%xmm1, -48(%rbp)
	movaps	%xmm2, -64(%rbp)
	movaps	%xmm0, -80(%rbp)
	leaq	-80(%rbp), %rcx
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	glmm_fmadd
	movq	904(%rbp), %rax
	addq	$48, %rax
	movq	%rax, 744(%rbp)
	movaps	%xmm0, 720(%rbp)
	movaps	720(%rbp), %xmm0
	movq	744(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	nop
	movq	2384(%rbp), %rax
	movq	24(%rax), %r9
	leaq	-32(%rbp), %rdx
	movq	2384(%rbp), %rax
	leaq	.LC15(%rip), %r8
	movq	%rax, %rcx
	call	*%r9
	leaq	32(%rbp), %rax
	movq	%rax, 1064(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, 96(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 100(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 104(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 108(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 112(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, 116(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 120(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 124(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 128(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 132(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, 136(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 140(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 144(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 148(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 152(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, 156(%rbp)
	leaq	96(%rbp), %rax
	movq	%rax, 1056(%rbp)
	movq	1064(%rbp), %rax
	movq	%rax, 1048(%rbp)
	movq	1056(%rbp), %rax
	movq	%rax, 1040(%rbp)
	movq	1040(%rbp), %rax
	movups	(%rax), %xmm0
	movq	1048(%rbp), %rax
	movq	%rax, 1032(%rbp)
	movaps	%xmm0, 1008(%rbp)
	movaps	1008(%rbp), %xmm0
	movq	1032(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	movq	1056(%rbp), %rax
	addq	$16, %rax
	movq	%rax, 1000(%rbp)
	movq	1000(%rbp), %rax
	movups	(%rax), %xmm0
	movq	1048(%rbp), %rax
	addq	$16, %rax
	movq	%rax, 992(%rbp)
	movaps	%xmm0, 976(%rbp)
	movaps	976(%rbp), %xmm0
	movq	992(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	movq	1056(%rbp), %rax
	addq	$32, %rax
	movq	%rax, 968(%rbp)
	movq	968(%rbp), %rax
	movups	(%rax), %xmm0
	movq	1048(%rbp), %rax
	addq	$32, %rax
	movq	%rax, 960(%rbp)
	movaps	%xmm0, 944(%rbp)
	movaps	944(%rbp), %xmm0
	movq	960(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	movq	1056(%rbp), %rax
	addq	$48, %rax
	movq	%rax, 936(%rbp)
	movq	936(%rbp), %rax
	movups	(%rax), %xmm0
	movq	1048(%rbp), %rax
	addq	$48, %rax
	movq	%rax, 928(%rbp)
	movaps	%xmm0, 912(%rbp)
	movaps	912(%rbp), %xmm0
	movq	928(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	nop
	nop
	pxor	%xmm0, %xmm0
	movss	%xmm0, 216(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 220(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, 224(%rbp)
	leaq	32(%rbp), %rax
	movq	%rax, 1256(%rbp)
	leaq	216(%rbp), %rax
	movq	%rax, 1248(%rbp)
	movq	1256(%rbp), %rax
	movq	%rax, 1240(%rbp)
	movq	1240(%rbp), %rax
	movups	(%rax), %xmm0
	movaps	%xmm0, 1216(%rbp)
	movq	1256(%rbp), %rax
	addq	$16, %rax
	movq	%rax, 1208(%rbp)
	movq	1208(%rbp), %rax
	movups	(%rax), %xmm0
	movaps	%xmm0, 1184(%rbp)
	movq	1256(%rbp), %rax
	addq	$32, %rax
	movq	%rax, 1176(%rbp)
	movq	1176(%rbp), %rax
	movups	(%rax), %xmm0
	movaps	%xmm0, 1152(%rbp)
	movq	1256(%rbp), %rax
	addq	$48, %rax
	movq	%rax, 1144(%rbp)
	movq	1144(%rbp), %rax
	movups	(%rax), %xmm0
	movaps	%xmm0, 1120(%rbp)
	movq	1248(%rbp), %rax
	addq	$8, %rax
	movss	(%rax), %xmm0
	movss	%xmm0, 1116(%rbp)
	movss	1116(%rbp), %xmm0
	shufps	$0, %xmm0, %xmm0
	movaps	%xmm0, %xmm1
	movaps	1152(%rbp), %xmm0
	movaps	%xmm0, -48(%rbp)
	movaps	%xmm1, -64(%rbp)
	movaps	1120(%rbp), %xmm0
	movaps	%xmm0, -80(%rbp)
	leaq	-80(%rbp), %rcx
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	glmm_fmadd
	movq	1248(%rbp), %rax
	addq	$4, %rax
	movss	(%rax), %xmm1
	movss	%xmm1, 1112(%rbp)
	movss	1112(%rbp), %xmm1
	shufps	$0, %xmm1, %xmm1
	movaps	%xmm1, %xmm2
	movaps	1184(%rbp), %xmm1
	movaps	%xmm1, -48(%rbp)
	movaps	%xmm2, -64(%rbp)
	movaps	%xmm0, -80(%rbp)
	leaq	-80(%rbp), %rcx
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	glmm_fmadd
	movq	1248(%rbp), %rax
	movss	(%rax), %xmm1
	movss	%xmm1, 1108(%rbp)
	movss	1108(%rbp), %xmm1
	shufps	$0, %xmm1, %xmm1
	movaps	%xmm1, %xmm2
	movaps	1216(%rbp), %xmm1
	movaps	%xmm1, -48(%rbp)
	movaps	%xmm2, -64(%rbp)
	movaps	%xmm0, -80(%rbp)
	leaq	-80(%rbp), %rcx
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	glmm_fmadd
	movq	1256(%rbp), %rax
	addq	$48, %rax
	movq	%rax, 1096(%rbp)
	movaps	%xmm0, 1072(%rbp)
	movaps	1072(%rbp), %xmm0
	movq	1096(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	nop
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, 204(%rbp)
	movss	.LC16(%rip), %xmm0
	movss	%xmm0, 208(%rbp)
	movss	.LC17(%rip), %xmm0
	movss	%xmm0, 212(%rbp)
	call	glfwGetTime
	movsd	.LC18(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	leaq	32(%rbp), %rax
	movq	%rax, 1976(%rbp)
	movss	%xmm0, 1972(%rbp)
	leaq	204(%rbp), %rax
	movq	%rax, 1960(%rbp)
	leaq	96(%rbp), %rax
	movq	%rax, 1952(%rbp)
	movss	1972(%rbp), %xmm0
	movss	%xmm0, 1948(%rbp)
	movq	1960(%rbp), %rax
	movq	%rax, 1936(%rbp)
	movl	1948(%rbp), %eax
	movd	%eax, %xmm0
	call	cosf
	movd	%xmm0, %eax
	movl	%eax, 1932(%rbp)
	movq	1936(%rbp), %rax
	movq	%rax, 1920(%rbp)
	leaq	192(%rbp), %rax
	movq	%rax, 1912(%rbp)
	movq	1920(%rbp), %rax
	movq	%rax, 1904(%rbp)
	movq	1904(%rbp), %rax
	movq	%rax, 1896(%rbp)
	movq	1896(%rbp), %rax
	movq	%rax, 1888(%rbp)
	movq	1896(%rbp), %rax
	movq	%rax, 1880(%rbp)
	movq	1888(%rbp), %rax
	movss	(%rax), %xmm1
	movq	1880(%rbp), %rax
	movss	(%rax), %xmm0
	mulss	%xmm0, %xmm1
	movq	1888(%rbp), %rax
	addq	$4, %rax
	movss	(%rax), %xmm2
	movq	1880(%rbp), %rax
	addq	$4, %rax
	movss	(%rax), %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm0, %xmm1
	movq	1888(%rbp), %rax
	addq	$8, %rax
	movss	(%rax), %xmm2
	movq	1880(%rbp), %rax
	addq	$8, %rax
	movss	(%rax), %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	nop
	call	sqrtf
	movd	%xmm0, %eax
	movl	%eax, 1876(%rbp)
	pxor	%xmm0, %xmm0
	ucomiss	1876(%rbp), %xmm0
	jp	.L42
	pxor	%xmm0, %xmm0
	ucomiss	1876(%rbp), %xmm0
	jne	.L42
	movq	1912(%rbp), %rax
	movq	%rax, 1864(%rbp)
	movq	1864(%rbp), %rax
	leaq	8(%rax), %rdx
	pxor	%xmm0, %xmm0
	movss	%xmm0, (%rdx)
	movq	1864(%rbp), %rax
	addq	$4, %rax
	movss	(%rdx), %xmm0
	movss	%xmm0, (%rax)
	movss	(%rax), %xmm0
	movq	1864(%rbp), %rax
	movss	%xmm0, (%rax)
	nop
	jmp	.L44
.L42:
	movss	.LC5(%rip), %xmm0
	divss	1876(%rbp), %xmm0
	movq	1920(%rbp), %rax
	movq	%rax, 1856(%rbp)
	movss	%xmm0, 1852(%rbp)
	movq	1912(%rbp), %rax
	movq	%rax, 1840(%rbp)
	movq	1856(%rbp), %rax
	movss	(%rax), %xmm0
	mulss	1852(%rbp), %xmm0
	movq	1840(%rbp), %rax
	movss	%xmm0, (%rax)
	movq	1856(%rbp), %rax
	addq	$4, %rax
	movss	(%rax), %xmm0
	movq	1840(%rbp), %rax
	addq	$4, %rax
	mulss	1852(%rbp), %xmm0
	movss	%xmm0, (%rax)
	movq	1856(%rbp), %rax
	addq	$8, %rax
	movss	(%rax), %xmm0
	movq	1840(%rbp), %rax
	addq	$8, %rax
	mulss	1852(%rbp), %xmm0
	movss	%xmm0, (%rax)
	nop
.L44:
	movss	.LC5(%rip), %xmm0
	subss	1932(%rbp), %xmm0
	leaq	192(%rbp), %rax
	movq	%rax, 1832(%rbp)
	movss	%xmm0, 1828(%rbp)
	leaq	176(%rbp), %rax
	movq	%rax, 1816(%rbp)
	movq	1832(%rbp), %rax
	movss	(%rax), %xmm0
	mulss	1828(%rbp), %xmm0
	movq	1816(%rbp), %rax
	movss	%xmm0, (%rax)
	movq	1832(%rbp), %rax
	addq	$4, %rax
	movss	(%rax), %xmm0
	movq	1816(%rbp), %rax
	addq	$4, %rax
	mulss	1828(%rbp), %xmm0
	movss	%xmm0, (%rax)
	movq	1832(%rbp), %rax
	addq	$8, %rax
	movss	(%rax), %xmm0
	movq	1816(%rbp), %rax
	addq	$8, %rax
	mulss	1828(%rbp), %xmm0
	movss	%xmm0, (%rax)
	nop
	movl	1948(%rbp), %eax
	movd	%eax, %xmm0
	call	sinf
	movd	%xmm0, %eax
	leaq	192(%rbp), %rdx
	movq	%rdx, 1808(%rbp)
	movl	%eax, 1804(%rbp)
	leaq	160(%rbp), %rax
	movq	%rax, 1792(%rbp)
	movq	1808(%rbp), %rax
	movss	(%rax), %xmm0
	mulss	1804(%rbp), %xmm0
	movq	1792(%rbp), %rax
	movss	%xmm0, (%rax)
	movq	1808(%rbp), %rax
	addq	$4, %rax
	movss	(%rax), %xmm0
	movq	1792(%rbp), %rax
	addq	$4, %rax
	mulss	1804(%rbp), %xmm0
	movss	%xmm0, (%rax)
	movq	1808(%rbp), %rax
	addq	$8, %rax
	movss	(%rax), %xmm0
	movq	1792(%rbp), %rax
	addq	$8, %rax
	mulss	1804(%rbp), %xmm0
	movss	%xmm0, (%rax)
	nop
	movss	176(%rbp), %xmm0
	leaq	192(%rbp), %rax
	movq	%rax, 1784(%rbp)
	movss	%xmm0, 1780(%rbp)
	movq	1952(%rbp), %rax
	movq	%rax, 1768(%rbp)
	movq	1784(%rbp), %rax
	movss	(%rax), %xmm0
	mulss	1780(%rbp), %xmm0
	movq	1768(%rbp), %rax
	movss	%xmm0, (%rax)
	movq	1784(%rbp), %rax
	addq	$4, %rax
	movss	(%rax), %xmm0
	movq	1768(%rbp), %rax
	addq	$4, %rax
	mulss	1780(%rbp), %xmm0
	movss	%xmm0, (%rax)
	movq	1784(%rbp), %rax
	addq	$8, %rax
	movss	(%rax), %xmm0
	movq	1768(%rbp), %rax
	addq	$8, %rax
	mulss	1780(%rbp), %xmm0
	movss	%xmm0, (%rax)
	nop
	movq	1952(%rbp), %rax
	leaq	16(%rax), %rdx
	movss	180(%rbp), %xmm0
	leaq	192(%rbp), %rax
	movq	%rax, 1760(%rbp)
	movss	%xmm0, 1756(%rbp)
	movq	%rdx, 1744(%rbp)
	movq	1760(%rbp), %rax
	movss	(%rax), %xmm0
	mulss	1756(%rbp), %xmm0
	movq	1744(%rbp), %rax
	movss	%xmm0, (%rax)
	movq	1760(%rbp), %rax
	addq	$4, %rax
	movss	(%rax), %xmm0
	movq	1744(%rbp), %rax
	addq	$4, %rax
	mulss	1756(%rbp), %xmm0
	movss	%xmm0, (%rax)
	movq	1760(%rbp), %rax
	addq	$8, %rax
	movss	(%rax), %xmm0
	movq	1744(%rbp), %rax
	addq	$8, %rax
	mulss	1756(%rbp), %xmm0
	movss	%xmm0, (%rax)
	nop
	movq	1952(%rbp), %rax
	leaq	32(%rax), %rdx
	movss	184(%rbp), %xmm0
	leaq	192(%rbp), %rax
	movq	%rax, 1736(%rbp)
	movss	%xmm0, 1732(%rbp)
	movq	%rdx, 1720(%rbp)
	movq	1736(%rbp), %rax
	movss	(%rax), %xmm0
	mulss	1732(%rbp), %xmm0
	movq	1720(%rbp), %rax
	movss	%xmm0, (%rax)
	movq	1736(%rbp), %rax
	addq	$4, %rax
	movss	(%rax), %xmm0
	movq	1720(%rbp), %rax
	addq	$4, %rax
	mulss	1732(%rbp), %xmm0
	movss	%xmm0, (%rax)
	movq	1736(%rbp), %rax
	addq	$8, %rax
	movss	(%rax), %xmm0
	movq	1720(%rbp), %rax
	addq	$8, %rax
	mulss	1732(%rbp), %xmm0
	movss	%xmm0, (%rax)
	nop
	movq	1952(%rbp), %rax
	movss	(%rax), %xmm0
	addss	1932(%rbp), %xmm0
	movq	1952(%rbp), %rax
	movss	%xmm0, (%rax)
	movq	1952(%rbp), %rax
	addq	$16, %rax
	movss	(%rax), %xmm0
	movss	168(%rbp), %xmm1
	movq	1952(%rbp), %rax
	addq	$16, %rax
	subss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	movq	1952(%rbp), %rax
	addq	$32, %rax
	movss	(%rax), %xmm1
	movss	164(%rbp), %xmm0
	movq	1952(%rbp), %rax
	addq	$32, %rax
	addss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	movq	1952(%rbp), %rax
	movss	4(%rax), %xmm1
	movss	168(%rbp), %xmm0
	addss	%xmm1, %xmm0
	movq	1952(%rbp), %rax
	movss	%xmm0, 4(%rax)
	movq	1952(%rbp), %rax
	addq	$16, %rax
	movss	4(%rax), %xmm0
	movq	1952(%rbp), %rax
	addq	$16, %rax
	addss	1932(%rbp), %xmm0
	movss	%xmm0, 4(%rax)
	movq	1952(%rbp), %rax
	addq	$32, %rax
	movss	4(%rax), %xmm0
	movss	160(%rbp), %xmm1
	movq	1952(%rbp), %rax
	addq	$32, %rax
	subss	%xmm1, %xmm0
	movss	%xmm0, 4(%rax)
	movq	1952(%rbp), %rax
	movss	8(%rax), %xmm0
	movss	164(%rbp), %xmm1
	subss	%xmm1, %xmm0
	movq	1952(%rbp), %rax
	movss	%xmm0, 8(%rax)
	movq	1952(%rbp), %rax
	addq	$16, %rax
	movss	8(%rax), %xmm1
	movss	160(%rbp), %xmm0
	movq	1952(%rbp), %rax
	addq	$16, %rax
	addss	%xmm1, %xmm0
	movss	%xmm0, 8(%rax)
	movq	1952(%rbp), %rax
	addq	$32, %rax
	movss	8(%rax), %xmm0
	movq	1952(%rbp), %rax
	addq	$32, %rax
	addss	1932(%rbp), %xmm0
	movss	%xmm0, 8(%rax)
	movq	1952(%rbp), %rax
	addq	$48, %rax
	pxor	%xmm0, %xmm0
	movss	%xmm0, 8(%rax)
	movq	1952(%rbp), %rdx
	addq	$48, %rdx
	movss	8(%rax), %xmm0
	movss	%xmm0, 4(%rdx)
	movq	1952(%rbp), %rax
	addq	$48, %rax
	movss	4(%rdx), %xmm0
	movss	%xmm0, (%rax)
	movq	1952(%rbp), %rdx
	addq	$32, %rdx
	movss	(%rax), %xmm0
	movss	%xmm0, 12(%rdx)
	movq	1952(%rbp), %rax
	addq	$16, %rax
	movss	12(%rdx), %xmm0
	movss	%xmm0, 12(%rax)
	movss	12(%rax), %xmm0
	movq	1952(%rbp), %rax
	movss	%xmm0, 12(%rax)
	movq	1952(%rbp), %rax
	addq	$48, %rax
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, 12(%rax)
	nop
	movq	1976(%rbp), %rax
	movq	%rax, 1712(%rbp)
	leaq	96(%rbp), %rax
	movq	%rax, 1704(%rbp)
	movq	1976(%rbp), %rax
	movq	%rax, 1696(%rbp)
	movq	1712(%rbp), %rax
	movq	%rax, 1688(%rbp)
	movq	1704(%rbp), %rax
	movq	%rax, 1680(%rbp)
	movq	1696(%rbp), %rax
	movq	%rax, 1672(%rbp)
	movq	1688(%rbp), %rax
	movq	%rax, 1664(%rbp)
	movq	1664(%rbp), %rax
	movups	(%rax), %xmm0
	movaps	%xmm0, 1648(%rbp)
	movq	1680(%rbp), %rax
	movq	%rax, 1640(%rbp)
	movq	1640(%rbp), %rax
	movups	(%rax), %xmm0
	movaps	%xmm0, 1616(%rbp)
	movq	1680(%rbp), %rax
	addq	$16, %rax
	movq	%rax, 1608(%rbp)
	movq	1608(%rbp), %rax
	movups	(%rax), %xmm0
	movaps	%xmm0, 1584(%rbp)
	movq	1680(%rbp), %rax
	addq	$32, %rax
	movq	%rax, 1576(%rbp)
	movq	1576(%rbp), %rax
	movups	(%rax), %xmm0
	movaps	%xmm0, 1552(%rbp)
	movaps	1616(%rbp), %xmm0
	movaps	1616(%rbp), %xmm1
	shufps	$0, %xmm1, %xmm0
	movaps	%xmm0, 1536(%rbp)
	movaps	1648(%rbp), %xmm0
	movaps	%xmm0, 1520(%rbp)
	movaps	1536(%rbp), %xmm0
	mulps	1520(%rbp), %xmm0
	movaps	%xmm0, 1504(%rbp)
	movaps	1584(%rbp), %xmm0
	movaps	1584(%rbp), %xmm1
	shufps	$0, %xmm1, %xmm0
	movaps	%xmm0, 1488(%rbp)
	movaps	1648(%rbp), %xmm0
	movaps	%xmm0, 1472(%rbp)
	movaps	1488(%rbp), %xmm0
	mulps	1472(%rbp), %xmm0
	movaps	%xmm0, 1456(%rbp)
	movaps	1552(%rbp), %xmm0
	movaps	1552(%rbp), %xmm1
	shufps	$0, %xmm1, %xmm0
	movaps	%xmm0, 1440(%rbp)
	movaps	1648(%rbp), %xmm0
	movaps	%xmm0, 1424(%rbp)
	movaps	1440(%rbp), %xmm0
	mulps	1424(%rbp), %xmm0
	movaps	%xmm0, 1408(%rbp)
	movq	1688(%rbp), %rax
	addq	$16, %rax
	movq	%rax, 1400(%rbp)
	movq	1400(%rbp), %rax
	movups	(%rax), %xmm0
	movaps	%xmm0, 1648(%rbp)
	movaps	1616(%rbp), %xmm0
	movaps	1616(%rbp), %xmm1
	shufps	$85, %xmm1, %xmm0
	movaps	%xmm0, -48(%rbp)
	movaps	1648(%rbp), %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	1504(%rbp), %xmm0
	movaps	%xmm0, -80(%rbp)
	leaq	-80(%rbp), %rcx
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	glmm_fmadd
	movaps	%xmm0, 1504(%rbp)
	movaps	1584(%rbp), %xmm0
	movaps	1584(%rbp), %xmm1
	shufps	$85, %xmm1, %xmm0
	movaps	%xmm0, -48(%rbp)
	movaps	1648(%rbp), %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	1456(%rbp), %xmm0
	movaps	%xmm0, -80(%rbp)
	leaq	-80(%rbp), %rcx
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	glmm_fmadd
	movaps	%xmm0, 1456(%rbp)
	movaps	1552(%rbp), %xmm0
	movaps	1552(%rbp), %xmm1
	shufps	$85, %xmm1, %xmm0
	movaps	%xmm0, -48(%rbp)
	movaps	1648(%rbp), %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	1408(%rbp), %xmm0
	movaps	%xmm0, -80(%rbp)
	leaq	-80(%rbp), %rcx
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	glmm_fmadd
	movaps	%xmm0, 1408(%rbp)
	movq	1688(%rbp), %rax
	addq	$32, %rax
	movq	%rax, 1392(%rbp)
	movq	1392(%rbp), %rax
	movups	(%rax), %xmm0
	movaps	%xmm0, 1648(%rbp)
	movaps	1616(%rbp), %xmm0
	movaps	1616(%rbp), %xmm1
	shufps	$170, %xmm1, %xmm0
	movaps	%xmm0, -48(%rbp)
	movaps	1648(%rbp), %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	1504(%rbp), %xmm0
	movaps	%xmm0, -80(%rbp)
	leaq	-80(%rbp), %rcx
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	glmm_fmadd
	movaps	%xmm0, 1504(%rbp)
	movaps	1584(%rbp), %xmm0
	movaps	1584(%rbp), %xmm1
	shufps	$170, %xmm1, %xmm0
	movaps	%xmm0, -48(%rbp)
	movaps	1648(%rbp), %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	1456(%rbp), %xmm0
	movaps	%xmm0, -80(%rbp)
	leaq	-80(%rbp), %rcx
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	glmm_fmadd
	movaps	%xmm0, 1456(%rbp)
	movaps	1552(%rbp), %xmm0
	movaps	1552(%rbp), %xmm1
	shufps	$170, %xmm1, %xmm0
	movaps	%xmm0, -48(%rbp)
	movaps	1648(%rbp), %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	1408(%rbp), %xmm0
	movaps	%xmm0, -80(%rbp)
	leaq	-80(%rbp), %rcx
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	glmm_fmadd
	movaps	%xmm0, 1408(%rbp)
	movq	1672(%rbp), %rax
	movq	%rax, 1384(%rbp)
	movaps	1504(%rbp), %xmm0
	movaps	%xmm0, 1360(%rbp)
	movaps	1360(%rbp), %xmm0
	movq	1384(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	movq	1672(%rbp), %rax
	addq	$16, %rax
	movq	%rax, 1352(%rbp)
	movaps	1456(%rbp), %xmm0
	movaps	%xmm0, 1328(%rbp)
	movaps	1328(%rbp), %xmm0
	movq	1352(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	movq	1672(%rbp), %rax
	addq	$32, %rax
	movq	%rax, 1320(%rbp)
	movaps	1408(%rbp), %xmm0
	movaps	%xmm0, 1296(%rbp)
	movaps	1296(%rbp), %xmm0
	movq	1320(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	movq	1688(%rbp), %rax
	addq	$48, %rax
	movq	%rax, 1288(%rbp)
	movq	1288(%rbp), %rax
	movups	(%rax), %xmm0
	movq	1672(%rbp), %rax
	addq	$48, %rax
	movq	%rax, 1280(%rbp)
	movaps	%xmm0, 1264(%rbp)
	movaps	1264(%rbp), %xmm0
	movq	1280(%rbp), %rax
	movups	%xmm0, (%rax)
	nop
	nop
	nop
	nop
	movq	2384(%rbp), %rax
	movq	24(%rax), %r9
	leaq	32(%rbp), %rdx
	movq	2384(%rbp), %rax
	leaq	.LC19(%rip), %r8
	movq	%rax, %rcx
	call	*%r9
	movq	2384(%rbp), %rax
	movq	8(%rax), %rdx
	movq	2384(%rbp), %rax
	movq	%rax, %rcx
	call	*%rdx
	movq	.refptr.glad_glBindVertexArray(%rip), %rax
	movq	(%rax), %rdx
	movl	316(%rbp), %eax
	movl	%eax, %ecx
	call	*%rdx
	movq	.refptr.glad_glDrawElements(%rip), %rax
	movq	(%rax), %rax
	movl	$0, %r9d
	movl	$5125, %r8d
	movl	$36, %edx
	movl	$4, %ecx
	call	*%rax
	movq	2408(%rbp), %rax
	movq	%rax, %rcx
	call	glfwSwapBuffers
	call	glfwPollEvents
.L16:
	movq	2408(%rbp), %rax
	movq	%rax, %rcx
	call	glfwWindowShouldClose
	testl	%eax, %eax
	je	.L55
	call	glfwTerminate
	movl	$0, %eax
.L56:
	addq	$2544, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	HandleDeltaTime
	.def	HandleDeltaTime;	.scl	2;	.type	32;	.endef
	.seh_proc	HandleDeltaTime
HandleDeltaTime:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	call	glfwGetTime
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -4(%rbp)
	movss	lastFrame(%rip), %xmm1
	movss	-4(%rbp), %xmm0
	subss	%xmm1, %xmm0
	movss	%xmm0, deltaTime(%rip)
	movss	-4(%rbp), %xmm0
	movss	%xmm0, lastFrame(%rip)
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 4
.LC3:
	.long	-1090519040
	.align 4
.LC4:
	.long	1056964608
	.align 4
.LC5:
	.long	1065353216
	.align 4
.LC7:
	.long	1119092736
	.align 4
.LC8:
	.long	1078530011
	.align 4
.LC9:
	.long	1127481344
	.align 4
.LC10:
	.long	1036831949
	.align 4
.LC11:
	.long	1148846080
	.align 4
.LC12:
	.long	-1082130432
	.align 4
.LC14:
	.long	-1054867456
	.align 4
.LC16:
	.long	1061997773
	.align 4
.LC17:
	.long	1045220557
	.align 8
.LC18:
	.long	0
	.long	1075052544
	.ident	"GCC: (tdm64-1) 9.2.0"
	.def	glfwInit;	.scl	2;	.type	32;	.endef
	.def	glfwCreateWindow;	.scl	2;	.type	32;	.endef
	.def	glfwMakeContextCurrent;	.scl	2;	.type	32;	.endef
	.def	gladLoadGLLoader;	.scl	2;	.type	32;	.endef
	.def	ShaderInit;	.scl	2;	.type	32;	.endef
	.def	VertexBufferInit;	.scl	2;	.type	32;	.endef
	.def	IndexBufferInit;	.scl	2;	.type	32;	.endef
	.def	tanf;	.scl	2;	.type	32;	.endef
	.def	glfwGetTime;	.scl	2;	.type	32;	.endef
	.def	cosf;	.scl	2;	.type	32;	.endef
	.def	sqrtf;	.scl	2;	.type	32;	.endef
	.def	sinf;	.scl	2;	.type	32;	.endef
	.def	glfwSwapBuffers;	.scl	2;	.type	32;	.endef
	.def	glfwPollEvents;	.scl	2;	.type	32;	.endef
	.def	glfwWindowShouldClose;	.scl	2;	.type	32;	.endef
	.def	glfwTerminate;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.glad_glDrawElements, "dr"
	.globl	.refptr.glad_glDrawElements
	.linkonce	discard
.refptr.glad_glDrawElements:
	.quad	glad_glDrawElements
	.section	.rdata$.refptr.glad_glClear, "dr"
	.globl	.refptr.glad_glClear
	.linkonce	discard
.refptr.glad_glClear:
	.quad	glad_glClear
	.section	.rdata$.refptr.glad_glEnableVertexAttribArray, "dr"
	.globl	.refptr.glad_glEnableVertexAttribArray
	.linkonce	discard
.refptr.glad_glEnableVertexAttribArray:
	.quad	glad_glEnableVertexAttribArray
	.section	.rdata$.refptr.glad_glVertexAttribPointer, "dr"
	.globl	.refptr.glad_glVertexAttribPointer
	.linkonce	discard
.refptr.glad_glVertexAttribPointer:
	.quad	glad_glVertexAttribPointer
	.section	.rdata$.refptr.glad_glBindVertexArray, "dr"
	.globl	.refptr.glad_glBindVertexArray
	.linkonce	discard
.refptr.glad_glBindVertexArray:
	.quad	glad_glBindVertexArray
	.section	.rdata$.refptr.glad_glGenVertexArrays, "dr"
	.globl	.refptr.glad_glGenVertexArrays
	.linkonce	discard
.refptr.glad_glGenVertexArrays:
	.quad	glad_glGenVertexArrays
	.section	.rdata$.refptr.glfwGetProcAddress, "dr"
	.globl	.refptr.glfwGetProcAddress
	.linkonce	discard
.refptr.glfwGetProcAddress:
	.quad	glfwGetProcAddress
