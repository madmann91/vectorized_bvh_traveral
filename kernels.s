	.text
	.file	"tools/bench_traversal/bench_traversal.ll"
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI0_0:
	.long	1065353216              # float 1
.LCPI0_1:
	.long	2147483648              # float -0
.LCPI0_2:
	.long	841731191               # float 9.99999993E-9
.LCPI0_3:
	.long	2139095039              # float 3.40282347E+38
.LCPI0_5:
	.long	2147483647              # 0x7fffffff
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI0_4:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5
.LCPI0_6:
	.zero	32,255
.LCPI0_7:
	.zero	32
	.text
	.globl	cpu_intersect_bvh8_tri4_packet8_avx2
	.p2align	4, 0x90
	.type	cpu_intersect_bvh8_tri4_packet8_avx2,@function
cpu_intersect_bvh8_tri4_packet8_avx2:   # @cpu_intersect_bvh8_tri4_packet8_avx2
# BB#0:                                 # %cpu_intersect_bvh8_tri4_packet8_avx2_start
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$3264, %rsp             # imm = 0xCC0
                                        # kill: %ECX<def> %ECX<kill> %RCX<def>
	movq	%rdx, 88(%rsp)          # 8-byte Spill
	movq	%rsi, 80(%rsp)          # 8-byte Spill
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	cmpl	$8, %ecx
	jl	.LBB0_64
# BB#1:                                 # %head.preheader.lr.ph
	movq	(%rdi), %r13
	movq	8(%rdi), %r10
	movq	24(%rsp), %rax          # 8-byte Reload
	shrl	$3, %eax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	leaq	192(%r10), %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	xorl	%esi, %esi
	vbroadcastss	.LCPI0_0(%rip), %ymm0
	vmovaps	%ymm0, 352(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI0_1(%rip), %ymm0
	vmovaps	%ymm0, 896(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI0_2(%rip), %ymm0
	vmovaps	%ymm0, 864(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI0_1(%rip), %ymm0
	vmovaps	%ymm0, 416(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI0_2(%rip), %ymm0
	vmovaps	%ymm0, 832(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI0_3(%rip), %ymm6
                                        # implicit-def: %YMM0
	vmovaps	%ymm0, 192(%rsp)        # 32-byte Spill
                                        # implicit-def: %YMM0
	vmovaps	%ymm0, 160(%rsp)        # 32-byte Spill
	.p2align	4, 0x90
.LBB0_2:                                # %body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
                                        #       Child Loop BB0_6 Depth 3
                                        #       Child Loop BB0_9 Depth 3
                                        #       Child Loop BB0_56 Depth 3
                                        #         Child Loop BB0_57 Depth 4
	movq	%rsi, %rax
	shlq	$8, %rax
	movq	80(%rsp), %rcx          # 8-byte Reload
	vmovups	(%rcx,%rax), %ymm0
	vmovaps	%ymm0, 448(%rsp)        # 32-byte Spill
	vmovups	32(%rcx,%rax), %ymm13
	vmovups	96(%rcx,%rax), %ymm11
	vrcpps	%ymm11, %ymm0
	vmovups	64(%rcx,%rax), %ymm14
	vmovaps	%ymm0, %ymm1
	vmovaps	352(%rsp), %ymm9        # 32-byte Reload
	vfnmadd213ps	%ymm9, %ymm11, %ymm1
	vfmadd132ps	%ymm0, %ymm0, %ymm1
	vmovaps	896(%rsp), %ymm8        # 32-byte Reload
	vxorps	%ymm8, %ymm11, %ymm0
	vmovups	128(%rcx,%rax), %ymm15
	vrcpps	%ymm15, %ymm2
	vxorps	%ymm3, %ymm3, %ymm3
	vcmpltps	%ymm11, %ymm3, %ymm3
	vmovaps	%ymm2, %ymm4
	vfnmadd213ps	%ymm9, %ymm15, %ymm4
	vfmadd132ps	%ymm2, %ymm2, %ymm4
	vblendvps	%ymm3, %ymm11, %ymm0, %ymm0
	vmovups	160(%rcx,%rax), %ymm3
	vrcpps	%ymm3, %ymm2
	vmovaps	%ymm2, %ymm5
	vfnmadd213ps	%ymm9, %ymm3, %ymm5
	vfmadd132ps	%ymm2, %ymm2, %ymm5
	vmovups	192(%rcx,%rax), %ymm9
	vmovdqu	224(%rcx,%rax), %ymm12
	vmovaps	864(%rsp), %ymm7        # 32-byte Reload
	vcmpnlt_uqps	%ymm7, %ymm0, %ymm0
	vmovaps	416(%rsp), %ymm10       # 32-byte Reload
	vmovaps	%ymm11, 512(%rsp)       # 32-byte Spill
	vandps	%ymm10, %ymm11, %ymm2
	vmovaps	832(%rsp), %ymm11       # 32-byte Reload
	vorps	%ymm11, %ymm2, %ymm2
	vblendvps	%ymm0, %ymm1, %ymm2, %ymm0
	vxorps	%ymm8, %ymm15, %ymm1
	vxorps	%ymm2, %ymm2, %ymm2
	vcmpltps	%ymm15, %ymm2, %ymm2
	vblendvps	%ymm2, %ymm15, %ymm1, %ymm1
	vcmpnlt_uqps	%ymm7, %ymm1, %ymm1
	vmovaps	%ymm15, 480(%rsp)       # 32-byte Spill
	vandps	%ymm10, %ymm15, %ymm2
	vorps	%ymm11, %ymm2, %ymm2
	vblendvps	%ymm1, %ymm4, %ymm2, %ymm1
	vxorps	%ymm2, %ymm2, %ymm2
	vcmpltps	%ymm3, %ymm2, %ymm2
	vxorps	%ymm8, %ymm3, %ymm4
	vblendvps	%ymm2, %ymm3, %ymm4, %ymm2
	vcmpnlt_uqps	%ymm7, %ymm2, %ymm2
	vmovaps	%ymm3, 1056(%rsp)       # 32-byte Spill
	vandps	%ymm10, %ymm3, %ymm4
	vorps	%ymm11, %ymm4, %ymm4
	vblendvps	%ymm2, %ymm5, %ymm4, %ymm3
	vmovaps	%ymm13, 1120(%rsp)      # 32-byte Spill
	vmulps	%ymm1, %ymm13, %ymm5
	vmovaps	%ymm14, 1088(%rsp)      # 32-byte Spill
	vmulps	%ymm3, %ymm14, %ymm8
	vmulps	448(%rsp), %ymm0, %ymm2 # 32-byte Folded Reload
	vmovdqa	%ymm12, 224(%rsp)       # 32-byte Spill
	vmovdqa	%ymm12, 32(%rsp)
	movl	$0, 544(%rsp)
	vmovaps	%ymm6, 1184(%rsp)
	movl	$1, %r11d
	movl	$0, %r14d
	vmovaps	%ymm9, %ymm10
	vpcmpeqd	%ymm4, %ymm4, %ymm4
	vmovdqa	%ymm4, 320(%rsp)        # 32-byte Spill
	vpcmpeqd	%ymm4, %ymm4, %ymm4
	vmovdqa	%ymm4, 384(%rsp)        # 32-byte Spill
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_4:                                # %while_body.rv.i
                                        #   in Loop: Header=BB0_3 Depth=2
	vmovaps	32(%rsp), %ymm4
	vcmpltps	%ymm4, %ymm10, %ymm11
	vmovmskps	%ymm11, %eax
	testl	%eax, %eax
	je	.LBB0_5
.LBB0_8:                                # %while_head16.rv.i.preheader
                                        #   in Loop: Header=BB0_3 Depth=2
	movl	%r11d, %edi
	.p2align	4, 0x90
.LBB0_9:                                # %while_head16.rv.i
                                        #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	testl	%edi, %edi
	jle	.LBB0_10
# BB#11:                                # %while_body20.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movslq	%r14d, %rbx
	movl	544(%rsp,%rbx,4), %r11d
	movq	%rbx, %rax
	shlq	$5, %rax
	vmovaps	1184(%rsp,%rax), %ymm10
	leal	-1(%rbx), %r8d
	movslq	%edi, %rdi
	addq	$-1, %rdi
	shlq	$8, %rdi
	movslq	192(%r13,%rdi), %r12
	testq	%r12, %r12
	je	.LBB0_12
# BB#13:                                # %if_else23.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	vbroadcastss	(%r13,%rdi), %ymm4
	vfmsub213ps	%ymm2, %ymm0, %ymm4
	vbroadcastss	64(%r13,%rdi), %ymm11
	vfmsub213ps	%ymm5, %ymm1, %ymm11
	vbroadcastss	128(%r13,%rdi), %ymm12
	vfmsub213ps	%ymm8, %ymm3, %ymm12
	vbroadcastss	32(%r13,%rdi), %ymm13
	vfmsub213ps	%ymm2, %ymm0, %ymm13
	vbroadcastss	96(%r13,%rdi), %ymm14
	vfmsub213ps	%ymm5, %ymm1, %ymm14
	vbroadcastss	160(%r13,%rdi), %ymm15
	vpminsd	%ymm13, %ymm4, %ymm7
	vpmaxsd	%ymm4, %ymm13, %ymm4
	vfmsub213ps	%ymm8, %ymm3, %ymm15
	vpminsd	%ymm14, %ymm11, %ymm13
	vpmaxsd	%ymm11, %ymm14, %ymm11
	vpminsd	%ymm15, %ymm12, %ymm14
	vpmaxsd	%ymm12, %ymm15, %ymm12
	vpmaxsd	%ymm7, %ymm13, %ymm7
	vpminsd	%ymm11, %ymm4, %ymm11
	vpmaxsd	%ymm14, %ymm9, %ymm4
	vpminsd	32(%rsp), %ymm12, %ymm12
	vpmaxsd	%ymm7, %ymm4, %ymm4
	vpminsd	%ymm12, %ymm11, %ymm7
	vpcmpgtd	%ymm7, %ymm4, %ymm11
	vmovmskps	%ymm11, %r9d
	xorl	%r15d, %r15d
	cmpl	$255, %r9d
	jne	.LBB0_15
# BB#14:                                #   in Loop: Header=BB0_9 Depth=3
	movl	%r8d, %r14d
	jmp	.LBB0_18
	.p2align	4, 0x90
.LBB0_15:                               # %if_then26.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	vxorps	.LCPI0_6, %ymm11, %ymm7
	vblendvps	%ymm7, %ymm4, %ymm6, %ymm4
	vcmpltps	%ymm10, %ymm4, %ymm7
	vptest	%ymm7, %ymm7
	jne	.LBB0_17
# BB#16:                                # %if_else27.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	leaq	1184(%rsp,%rax), %rax
	movl	%r12d, 544(%rsp,%rbx,4)
	vmovaps	%ymm4, (%rax)
	movl	$1, %r15d
	jmp	.LBB0_18
.LBB0_17:                               # %if_then_crit.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movl	%r12d, %eax
	notl	%eax
	movq	%r12, %rbx
	shlq	$8, %rbx
	cltq
	imulq	$208, %rax, %rax
	addq	%r10, %rax
	testl	%r12d, %r12d
	leaq	-256(%r13,%rbx), %rbx
	cmovsq	%rax, %rbx
	prefetcht0	(%rbx)
	prefetcht0	64(%rbx)
	prefetcht0	128(%rbx)
	prefetcht0	192(%rbx)
	movl	$1, %r15d
	movl	%r12d, %r11d
	vmovaps	%ymm4, %ymm10
	.p2align	4, 0x90
.LBB0_18:                               # %next32.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movslq	196(%r13,%rdi), %rbx
	testq	%rbx, %rbx
	je	.LBB0_53
# BB#19:                                # %if_else35.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	vbroadcastss	4(%r13,%rdi), %ymm4
	vfmsub213ps	%ymm2, %ymm0, %ymm4
	vbroadcastss	68(%r13,%rdi), %ymm7
	vfmsub213ps	%ymm5, %ymm1, %ymm7
	vbroadcastss	132(%r13,%rdi), %ymm11
	vfmsub213ps	%ymm8, %ymm3, %ymm11
	vbroadcastss	36(%r13,%rdi), %ymm12
	vfmsub213ps	%ymm2, %ymm0, %ymm12
	vbroadcastss	100(%r13,%rdi), %ymm13
	vfmsub213ps	%ymm5, %ymm1, %ymm13
	vbroadcastss	164(%r13,%rdi), %ymm14
	vpminsd	%ymm12, %ymm4, %ymm15
	vpmaxsd	%ymm4, %ymm12, %ymm4
	vfmsub213ps	%ymm8, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm7, %ymm12
	vpmaxsd	%ymm7, %ymm13, %ymm7
	vpminsd	%ymm14, %ymm11, %ymm13
	vpmaxsd	%ymm11, %ymm14, %ymm11
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm7, %ymm4, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm4
	vpminsd	32(%rsp), %ymm11, %ymm11
	vpmaxsd	%ymm12, %ymm4, %ymm4
	vpminsd	%ymm11, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm4, %ymm11
	vmovmskps	%ymm11, %eax
	cmpl	$255, %eax
	je	.LBB0_23
# BB#20:                                # %if_then39.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	vxorps	.LCPI0_6, %ymm11, %ymm7
	vblendvps	%ymm7, %ymm4, %ymm6, %ymm4
	addl	$1, %r15d
	vcmpltps	%ymm10, %ymm4, %ymm7
	vptest	%ymm7, %ymm7
	jne	.LBB0_22
# BB#21:                                # %if_else42.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movslq	%r14d, %rax
	addl	$1, %r14d
	movl	%ebx, 548(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm4, 1184(%rsp,%rax)
	jmp	.LBB0_23
.LBB0_22:                               # %if_then_crit43.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movq	%rbx, %rax
	shlq	$8, %rax
	movl	%ebx, %ecx
	notl	%ecx
	movslq	%r14d, %rdx
	addl	$1, %r14d
	movslq	%ecx, %rcx
	imulq	$208, %rcx, %rcx
	addq	%r10, %rcx
	testl	%ebx, %ebx
	leaq	-256(%r13,%rax), %rax
	cmovsq	%rcx, %rax
	movl	%r11d, 548(%rsp,%rdx,4)
	leaq	1(%rdx), %rcx
	shlq	$5, %rcx
	vmovaps	%ymm10, 1184(%rsp,%rcx)
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	movl	%ebx, %r11d
	vmovaps	%ymm4, %ymm10
	.p2align	4, 0x90
.LBB0_23:                               # %next49.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movslq	200(%r13,%rdi), %rbx
	testq	%rbx, %rbx
	je	.LBB0_53
# BB#24:                                # %if_else52.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	vbroadcastss	8(%r13,%rdi), %ymm4
	vfmsub213ps	%ymm2, %ymm0, %ymm4
	vbroadcastss	72(%r13,%rdi), %ymm7
	vfmsub213ps	%ymm5, %ymm1, %ymm7
	vbroadcastss	136(%r13,%rdi), %ymm11
	vfmsub213ps	%ymm8, %ymm3, %ymm11
	vbroadcastss	40(%r13,%rdi), %ymm12
	vfmsub213ps	%ymm2, %ymm0, %ymm12
	vbroadcastss	104(%r13,%rdi), %ymm13
	vfmsub213ps	%ymm5, %ymm1, %ymm13
	vbroadcastss	168(%r13,%rdi), %ymm14
	vpminsd	%ymm12, %ymm4, %ymm15
	vpmaxsd	%ymm4, %ymm12, %ymm4
	vfmsub213ps	%ymm8, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm7, %ymm12
	vpmaxsd	%ymm7, %ymm13, %ymm7
	vpminsd	%ymm14, %ymm11, %ymm13
	vpmaxsd	%ymm11, %ymm14, %ymm11
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm7, %ymm4, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm4
	vpminsd	32(%rsp), %ymm11, %ymm11
	vpmaxsd	%ymm12, %ymm4, %ymm4
	vpminsd	%ymm11, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm4, %ymm11
	vmovmskps	%ymm11, %eax
	cmpl	$255, %eax
	je	.LBB0_28
# BB#25:                                # %if_then56.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	vxorps	.LCPI0_6, %ymm11, %ymm7
	vblendvps	%ymm7, %ymm4, %ymm6, %ymm4
	addl	$1, %r15d
	vcmpltps	%ymm10, %ymm4, %ymm7
	vptest	%ymm7, %ymm7
	jne	.LBB0_27
# BB#26:                                # %if_else59.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movslq	%r14d, %rax
	addl	$1, %r14d
	movl	%ebx, 548(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm4, 1184(%rsp,%rax)
	jmp	.LBB0_28
.LBB0_27:                               # %if_then_crit60.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movq	%rbx, %rax
	shlq	$8, %rax
	movl	%ebx, %ecx
	notl	%ecx
	movslq	%r14d, %rdx
	addl	$1, %r14d
	movslq	%ecx, %rcx
	imulq	$208, %rcx, %rcx
	addq	%r10, %rcx
	testl	%ebx, %ebx
	leaq	-256(%r13,%rax), %rax
	cmovsq	%rcx, %rax
	movl	%r11d, 548(%rsp,%rdx,4)
	leaq	1(%rdx), %rcx
	shlq	$5, %rcx
	vmovaps	%ymm10, 1184(%rsp,%rcx)
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	movl	%ebx, %r11d
	vmovaps	%ymm4, %ymm10
	.p2align	4, 0x90
.LBB0_28:                               # %next66.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movslq	204(%r13,%rdi), %rbx
	testq	%rbx, %rbx
	je	.LBB0_53
# BB#29:                                # %if_else69.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	vbroadcastss	12(%r13,%rdi), %ymm4
	vfmsub213ps	%ymm2, %ymm0, %ymm4
	vbroadcastss	76(%r13,%rdi), %ymm7
	vfmsub213ps	%ymm5, %ymm1, %ymm7
	vbroadcastss	140(%r13,%rdi), %ymm11
	vfmsub213ps	%ymm8, %ymm3, %ymm11
	vbroadcastss	44(%r13,%rdi), %ymm12
	vfmsub213ps	%ymm2, %ymm0, %ymm12
	vbroadcastss	108(%r13,%rdi), %ymm13
	vfmsub213ps	%ymm5, %ymm1, %ymm13
	vbroadcastss	172(%r13,%rdi), %ymm14
	vpminsd	%ymm12, %ymm4, %ymm15
	vpmaxsd	%ymm4, %ymm12, %ymm4
	vfmsub213ps	%ymm8, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm7, %ymm12
	vpmaxsd	%ymm7, %ymm13, %ymm7
	vpminsd	%ymm14, %ymm11, %ymm13
	vpmaxsd	%ymm11, %ymm14, %ymm11
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm7, %ymm4, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm4
	vpminsd	32(%rsp), %ymm11, %ymm11
	vpmaxsd	%ymm12, %ymm4, %ymm4
	vpminsd	%ymm11, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm4, %ymm11
	vmovmskps	%ymm11, %eax
	cmpl	$255, %eax
	je	.LBB0_33
# BB#30:                                # %if_then73.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	vxorps	.LCPI0_6, %ymm11, %ymm7
	vblendvps	%ymm7, %ymm4, %ymm6, %ymm4
	addl	$1, %r15d
	vcmpltps	%ymm10, %ymm4, %ymm7
	vptest	%ymm7, %ymm7
	jne	.LBB0_32
# BB#31:                                # %if_else76.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movslq	%r14d, %rax
	addl	$1, %r14d
	movl	%ebx, 548(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm4, 1184(%rsp,%rax)
	jmp	.LBB0_33
.LBB0_32:                               # %if_then_crit77.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movl	%ebx, %eax
	notl	%eax
	movq	%rbx, %rcx
	shlq	$8, %rcx
	cltq
	imulq	$208, %rax, %rax
	addq	%r10, %rax
	testl	%ebx, %ebx
	leaq	-256(%r13,%rcx), %rcx
	cmovsq	%rax, %rcx
	movslq	%r14d, %rax
	addl	$1, %r14d
	movl	%r11d, 548(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm10, 1184(%rsp,%rax)
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	prefetcht0	128(%rcx)
	prefetcht0	192(%rcx)
	movl	%ebx, %r11d
	vmovaps	%ymm4, %ymm10
	.p2align	4, 0x90
.LBB0_33:                               # %next83.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movslq	208(%r13,%rdi), %rbx
	testq	%rbx, %rbx
	je	.LBB0_53
# BB#34:                                # %if_else86.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	vbroadcastss	16(%r13,%rdi), %ymm4
	vfmsub213ps	%ymm2, %ymm0, %ymm4
	vbroadcastss	80(%r13,%rdi), %ymm7
	vfmsub213ps	%ymm5, %ymm1, %ymm7
	vbroadcastss	144(%r13,%rdi), %ymm11
	vfmsub213ps	%ymm8, %ymm3, %ymm11
	vbroadcastss	48(%r13,%rdi), %ymm12
	vfmsub213ps	%ymm2, %ymm0, %ymm12
	vbroadcastss	112(%r13,%rdi), %ymm13
	vfmsub213ps	%ymm5, %ymm1, %ymm13
	vbroadcastss	176(%r13,%rdi), %ymm14
	vpminsd	%ymm12, %ymm4, %ymm15
	vpmaxsd	%ymm4, %ymm12, %ymm4
	vfmsub213ps	%ymm8, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm7, %ymm12
	vpmaxsd	%ymm7, %ymm13, %ymm7
	vpminsd	%ymm14, %ymm11, %ymm13
	vpmaxsd	%ymm11, %ymm14, %ymm11
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm7, %ymm4, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm4
	vpminsd	32(%rsp), %ymm11, %ymm11
	vpmaxsd	%ymm12, %ymm4, %ymm4
	vpminsd	%ymm11, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm4, %ymm11
	vmovmskps	%ymm11, %eax
	cmpl	$255, %eax
	je	.LBB0_38
# BB#35:                                # %if_then90.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	vxorps	.LCPI0_6, %ymm11, %ymm7
	vblendvps	%ymm7, %ymm4, %ymm6, %ymm4
	addl	$1, %r15d
	vcmpltps	%ymm10, %ymm4, %ymm7
	vptest	%ymm7, %ymm7
	jne	.LBB0_37
# BB#36:                                # %if_else93.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movslq	%r14d, %rax
	addl	$1, %r14d
	movl	%ebx, 548(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm4, 1184(%rsp,%rax)
	jmp	.LBB0_38
.LBB0_37:                               # %if_then_crit94.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movq	%rbx, %rax
	shlq	$8, %rax
	movl	%ebx, %ecx
	notl	%ecx
	movslq	%ecx, %rcx
	imulq	$208, %rcx, %rcx
	addq	%r10, %rcx
	testl	%ebx, %ebx
	leaq	-256(%r13,%rax), %rax
	cmovsq	%rcx, %rax
	movslq	%r14d, %rcx
	addl	$1, %r14d
	movl	%r11d, 548(%rsp,%rcx,4)
	addq	$1, %rcx
	shlq	$5, %rcx
	vmovaps	%ymm10, 1184(%rsp,%rcx)
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	movl	%ebx, %r11d
	vmovaps	%ymm4, %ymm10
	.p2align	4, 0x90
.LBB0_38:                               # %next100.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movslq	212(%r13,%rdi), %rbx
	testq	%rbx, %rbx
	je	.LBB0_53
# BB#39:                                # %if_else103.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	vbroadcastss	20(%r13,%rdi), %ymm4
	vfmsub213ps	%ymm2, %ymm0, %ymm4
	vbroadcastss	84(%r13,%rdi), %ymm7
	vfmsub213ps	%ymm5, %ymm1, %ymm7
	vbroadcastss	148(%r13,%rdi), %ymm11
	vfmsub213ps	%ymm8, %ymm3, %ymm11
	vbroadcastss	52(%r13,%rdi), %ymm12
	vfmsub213ps	%ymm2, %ymm0, %ymm12
	vbroadcastss	116(%r13,%rdi), %ymm13
	vfmsub213ps	%ymm5, %ymm1, %ymm13
	vbroadcastss	180(%r13,%rdi), %ymm14
	vpminsd	%ymm12, %ymm4, %ymm15
	vpmaxsd	%ymm4, %ymm12, %ymm4
	vfmsub213ps	%ymm8, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm7, %ymm12
	vpmaxsd	%ymm7, %ymm13, %ymm7
	vpminsd	%ymm14, %ymm11, %ymm13
	vpmaxsd	%ymm11, %ymm14, %ymm11
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm7, %ymm4, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm4
	vpminsd	32(%rsp), %ymm11, %ymm11
	vpmaxsd	%ymm12, %ymm4, %ymm4
	vpminsd	%ymm11, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm4, %ymm11
	vmovmskps	%ymm11, %eax
	cmpl	$255, %eax
	je	.LBB0_43
# BB#40:                                # %if_then107.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	vxorps	.LCPI0_6, %ymm11, %ymm7
	vblendvps	%ymm7, %ymm4, %ymm6, %ymm4
	addl	$1, %r15d
	vcmpltps	%ymm10, %ymm4, %ymm7
	vptest	%ymm7, %ymm7
	jne	.LBB0_42
# BB#41:                                # %if_else110.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movslq	%r14d, %rax
	addl	$1, %r14d
	movl	%ebx, 548(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm4, 1184(%rsp,%rax)
	jmp	.LBB0_43
.LBB0_42:                               # %if_then_crit111.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movl	%ebx, %eax
	notl	%eax
	movq	%rbx, %rcx
	shlq	$8, %rcx
	movslq	%r14d, %rdx
	addl	$1, %r14d
	cltq
	imulq	$208, %rax, %rax
	addq	%r10, %rax
	testl	%ebx, %ebx
	leaq	-256(%r13,%rcx), %rcx
	cmovsq	%rax, %rcx
	movl	%r11d, 548(%rsp,%rdx,4)
	leaq	1(%rdx), %rax
	shlq	$5, %rax
	vmovaps	%ymm10, 1184(%rsp,%rax)
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	prefetcht0	128(%rcx)
	prefetcht0	192(%rcx)
	movl	%ebx, %r11d
	vmovaps	%ymm4, %ymm10
	.p2align	4, 0x90
.LBB0_43:                               # %next117.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movslq	216(%r13,%rdi), %rbx
	testq	%rbx, %rbx
	je	.LBB0_53
# BB#44:                                # %if_else120.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	vbroadcastss	24(%r13,%rdi), %ymm4
	vfmsub213ps	%ymm2, %ymm0, %ymm4
	vbroadcastss	88(%r13,%rdi), %ymm7
	vfmsub213ps	%ymm5, %ymm1, %ymm7
	vbroadcastss	152(%r13,%rdi), %ymm11
	vfmsub213ps	%ymm8, %ymm3, %ymm11
	vbroadcastss	56(%r13,%rdi), %ymm12
	vfmsub213ps	%ymm2, %ymm0, %ymm12
	vbroadcastss	120(%r13,%rdi), %ymm13
	vfmsub213ps	%ymm5, %ymm1, %ymm13
	vbroadcastss	184(%r13,%rdi), %ymm14
	vpminsd	%ymm12, %ymm4, %ymm15
	vpmaxsd	%ymm4, %ymm12, %ymm4
	vfmsub213ps	%ymm8, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm7, %ymm12
	vpmaxsd	%ymm7, %ymm13, %ymm7
	vpminsd	%ymm14, %ymm11, %ymm13
	vpmaxsd	%ymm11, %ymm14, %ymm11
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm7, %ymm4, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm4
	vpminsd	32(%rsp), %ymm11, %ymm11
	vpmaxsd	%ymm12, %ymm4, %ymm4
	vpminsd	%ymm11, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm4, %ymm11
	vmovmskps	%ymm11, %eax
	cmpl	$255, %eax
	je	.LBB0_48
# BB#45:                                # %if_then124.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	vxorps	.LCPI0_6, %ymm11, %ymm7
	vblendvps	%ymm7, %ymm4, %ymm6, %ymm4
	addl	$1, %r15d
	vcmpltps	%ymm10, %ymm4, %ymm7
	vptest	%ymm7, %ymm7
	jne	.LBB0_47
# BB#46:                                # %if_else127.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movslq	%r14d, %rax
	addl	$1, %r14d
	movl	%ebx, 548(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm4, 1184(%rsp,%rax)
	jmp	.LBB0_48
.LBB0_47:                               # %if_then_crit128.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movq	%rbx, %rax
	shlq	$8, %rax
	movl	%ebx, %ecx
	notl	%ecx
	movslq	%r14d, %rdx
	addl	$1, %r14d
	movslq	%ecx, %rcx
	imulq	$208, %rcx, %rcx
	addq	%r10, %rcx
	testl	%ebx, %ebx
	leaq	-256(%r13,%rax), %rax
	cmovsq	%rcx, %rax
	movl	%r11d, 548(%rsp,%rdx,4)
	leaq	1(%rdx), %rcx
	shlq	$5, %rcx
	vmovaps	%ymm10, 1184(%rsp,%rcx)
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	movl	%ebx, %r11d
	vmovaps	%ymm4, %ymm10
	.p2align	4, 0x90
.LBB0_48:                               # %next134.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movslq	220(%r13,%rdi), %rbx
	testq	%rbx, %rbx
	je	.LBB0_53
# BB#49:                                # %if_else137.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	vbroadcastss	28(%r13,%rdi), %ymm4
	vbroadcastss	92(%r13,%rdi), %ymm7
	vfmsub213ps	%ymm2, %ymm0, %ymm4
	vfmsub213ps	%ymm5, %ymm1, %ymm7
	vbroadcastss	156(%r13,%rdi), %ymm11
	vfmsub213ps	%ymm8, %ymm3, %ymm11
	vbroadcastss	60(%r13,%rdi), %ymm12
	vfmsub213ps	%ymm2, %ymm0, %ymm12
	vbroadcastss	124(%r13,%rdi), %ymm13
	vfmsub213ps	%ymm5, %ymm1, %ymm13
	vbroadcastss	188(%r13,%rdi), %ymm14
	vpminsd	%ymm12, %ymm4, %ymm15
	vpmaxsd	%ymm4, %ymm12, %ymm4
	vfmsub213ps	%ymm8, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm7, %ymm12
	vpmaxsd	%ymm7, %ymm13, %ymm7
	vpminsd	%ymm14, %ymm11, %ymm13
	vpmaxsd	%ymm11, %ymm14, %ymm11
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm7, %ymm4, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm4
	vpminsd	32(%rsp), %ymm11, %ymm11
	vpmaxsd	%ymm12, %ymm4, %ymm4
	vpminsd	%ymm11, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm4, %ymm11
	vmovmskps	%ymm11, %eax
	cmpl	$255, %eax
	je	.LBB0_53
# BB#50:                                # %if_then141.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	vxorps	.LCPI0_6, %ymm11, %ymm7
	vblendvps	%ymm7, %ymm4, %ymm6, %ymm4
	addl	$1, %r15d
	vcmpltps	%ymm10, %ymm4, %ymm7
	vptest	%ymm7, %ymm7
	jne	.LBB0_52
# BB#51:                                # %if_else144.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movslq	%r14d, %rax
	addl	$1, %r14d
	movl	%ebx, 548(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm4, 1184(%rsp,%rax)
	jmp	.LBB0_53
.LBB0_52:                               # %if_then_crit145.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movl	%ebx, %eax
	notl	%eax
	movq	%rbx, %rcx
	shlq	$8, %rcx
	movslq	%r14d, %rdx
	addl	$1, %r14d
	cltq
	imulq	$208, %rax, %rax
	addq	%r10, %rax
	testl	%ebx, %ebx
	leaq	-256(%r13,%rcx), %rcx
	cmovsq	%rax, %rcx
	movl	%r11d, 548(%rsp,%rdx,4)
	leaq	1(%rdx), %rax
	shlq	$5, %rax
	vmovaps	%ymm10, 1184(%rsp,%rax)
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	prefetcht0	128(%rcx)
	prefetcht0	192(%rcx)
	movl	%ebx, %r11d
	vmovaps	%ymm4, %ymm10
	.p2align	4, 0x90
.LBB0_53:                               # %unlikely_cont_cascading_cascading.rv.i
                                        #   in Loop: Header=BB0_9 Depth=3
	movl	%r11d, %edi
	testl	%r15d, %r15d
	jne	.LBB0_9
	jmp	.LBB0_54
	.p2align	4, 0x90
.LBB0_10:                               #   in Loop: Header=BB0_3 Depth=2
	movl	%edi, %r11d
	testl	%r11d, %r11d
	jns	.LBB0_3
	jmp	.LBB0_55
	.p2align	4, 0x90
.LBB0_12:                               #   in Loop: Header=BB0_3 Depth=2
	movl	%r8d, %r14d
.LBB0_54:                               # %break166.rv.i
                                        #   in Loop: Header=BB0_3 Depth=2
	testl	%r11d, %r11d
	jns	.LBB0_3
.LBB0_55:                               # %if_then170.rv.i
                                        #   in Loop: Header=BB0_3 Depth=2
	notl	%r11d
	movslq	%r14d, %r14
	movslq	%r11d, %r15
	movl	544(%rsp,%r14,4), %r11d
	movq	%r14, %rax
	shlq	$5, %rax
	vmovaps	1184(%rsp,%rax), %ymm10
	addl	$-1, %r14d
	imulq	$208, %r15, %r12
	addq	72(%rsp), %r12          # 8-byte Folded Reload
.LBB0_56:                               # %while_head171.rv.i
                                        #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_3 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_57 Depth 4
	movq	%r12, %rbx
	xorl	%edi, %edi
	jmp	.LBB0_57
.LBB0_59:                               # %if_else_crit.rv.i
                                        #   in Loop: Header=BB0_57 Depth=4
	vmovaps	%ymm14, 800(%rsp)       # 32-byte Spill
	vandps	%ymm4, %ymm15, %ymm4
	vmovaps	%ymm4, 96(%rsp)         # 32-byte Spill
	vmovaps	128(%rsp), %ymm4        # 32-byte Reload
	vmulps	960(%rsp), %ymm4, %ymm4 # 32-byte Folded Reload
	vmovaps	%ymm12, %ymm15
	vmulps	32(%rsp), %ymm15, %ymm7
	vmulps	%ymm15, %ymm9, %ymm14
	vmovaps	%ymm14, 128(%rsp)       # 32-byte Spill
	vcmpneq_usps	.LCPI0_7, %ymm15, %ymm15
	vmovaps	256(%rsp), %ymm14       # 32-byte Reload
	vfmadd132ps	1024(%rsp), %ymm4, %ymm14 # 32-byte Folded Reload
	vmovaps	288(%rsp), %ymm4        # 32-byte Reload
	vfmadd132ps	992(%rsp), %ymm14, %ymm4 # 32-byte Folded Reload
	vmovdqa	96(%rsp), %ymm14        # 32-byte Reload
	vxorps	%ymm4, %ymm11, %ymm11
	vcmpleps	%ymm7, %ymm11, %ymm4
	vmovaps	128(%rsp), %ymm7        # 32-byte Reload
	vcmpleps	%ymm11, %ymm7, %ymm7
	vandps	%ymm15, %ymm4, %ymm4
	vandps	%ymm7, %ymm4, %ymm7
	vptest	%ymm7, %ymm14
	je	.LBB0_61
# BB#60:                                # %if_else_crit185.rv.i
                                        #   in Loop: Header=BB0_57 Depth=4
	vmovaps	%ymm12, %ymm15
	vrcpps	%ymm15, %ymm4
	vpand	%ymm14, %ymm7, %ymm7
	vmovaps	352(%rsp), %ymm12       # 32-byte Reload
	vfnmadd213ps	%ymm12, %ymm4, %ymm15
	vfmadd132ps	%ymm4, %ymm4, %ymm15
	vblendvps	%ymm7, %ymm15, %ymm12, %ymm4
	vmulps	%ymm4, %ymm11, %ymm11
	vpcmpeqd	.LCPI0_7, %ymm7, %ymm12
	vpxor	.LCPI0_6, %ymm12, %ymm12
	vmaskmovps	%ymm11, %ymm12, 32(%rsp)
	vmulps	%ymm4, %ymm13, %ymm12
	vmulps	800(%rsp), %ymm4, %ymm4 # 32-byte Folded Reload
	vbroadcastss	.LCPI0_5(%rip), %ymm13
	vandps	928(%rsp), %ymm13, %ymm13 # 32-byte Folded Reload
	vmovaps	224(%rsp), %ymm14       # 32-byte Reload
	vblendvps	%ymm7, %ymm11, %ymm14, %ymm14
	vmovaps	%ymm14, 224(%rsp)       # 32-byte Spill
	vmovaps	192(%rsp), %ymm11       # 32-byte Reload
	vblendvps	%ymm7, %ymm4, %ymm11, %ymm11
	vmovaps	%ymm11, 192(%rsp)       # 32-byte Spill
	vmovaps	160(%rsp), %ymm4        # 32-byte Reload
	vblendvps	%ymm7, %ymm12, %ymm4, %ymm4
	vmovaps	%ymm4, 160(%rsp)        # 32-byte Spill
	vmovaps	320(%rsp), %ymm4        # 32-byte Reload
	vblendvps	%ymm7, %ymm13, %ymm4, %ymm4
	vmovaps	%ymm4, 320(%rsp)        # 32-byte Spill
	vmovaps	%ymm4, 384(%rsp)        # 32-byte Spill
	jmp	.LBB0_61
	.p2align	4, 0x90
.LBB0_57:                               # %if_then177.rv.i
                                        #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_3 Depth=2
                                        #       Parent Loop BB0_56 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	(%rbx), %eax
	vmovd	%eax, %xmm4
	vpbroadcastd	%xmm4, %ymm4
	cmpl	$-1, %eax
	je	.LBB0_3
# BB#58:                                # %if_else178.rv.i
                                        #   in Loop: Header=BB0_57 Depth=4
	vmovdqa	%ymm4, 928(%rsp)        # 32-byte Spill
	vbroadcastss	-48(%rbx), %ymm4
	vbroadcastss	-32(%rbx), %ymm7
	vmovaps	480(%rsp), %ymm11       # 32-byte Reload
	vmovaps	%ymm7, 960(%rsp)        # 32-byte Spill
	vmulps	%ymm7, %ymm11, %ymm13
	vmovaps	%ymm11, %ymm12
	vmovaps	%ymm4, 1024(%rsp)       # 32-byte Spill
	vfmadd231ps	512(%rsp), %ymm4, %ymm13 # 32-byte Folded Reload
	vbroadcastss	-16(%rbx), %ymm4
	vmovaps	1056(%rsp), %ymm11      # 32-byte Reload
	vmovaps	%ymm4, 992(%rsp)        # 32-byte Spill
	vfmadd231ps	%ymm4, %ymm11, %ymm13
	vbroadcastsd	.LCPI0_4(%rip), %ymm4
	vandps	%ymm4, %ymm13, %ymm4
	vmovaps	%ymm4, 1152(%rsp)       # 32-byte Spill
	vbroadcastss	-128(%rbx), %ymm4
	vmovaps	%ymm4, 96(%rsp)         # 32-byte Spill
	vbroadcastss	-96(%rbx), %ymm4
	vmovaps	%ymm4, 288(%rsp)        # 32-byte Spill
	vbroadcastss	-144(%rbx), %ymm4
	vmovaps	%ymm4, 256(%rsp)        # 32-byte Spill
	vbroadcastss	-192(%rbx), %ymm7
	vbroadcastss	-160(%rbx), %ymm15
	vbroadcastss	-176(%rbx), %ymm14
	vsubps	1120(%rsp), %ymm14, %ymm4 # 32-byte Folded Reload
	vmovaps	%ymm4, 128(%rsp)        # 32-byte Spill
	vmulps	%ymm4, %ymm11, %ymm14
	vsubps	1088(%rsp), %ymm15, %ymm15 # 32-byte Folded Reload
	vsubps	448(%rsp), %ymm7, %ymm4 # 32-byte Folded Reload
	vfmsub231ps	%ymm15, %ymm12, %ymm14
	vmulps	256(%rsp), %ymm14, %ymm12 # 32-byte Folded Reload
	vmulps	288(%rsp), %ymm14, %ymm14 # 32-byte Folded Reload
	vmovaps	%ymm15, 288(%rsp)       # 32-byte Spill
	vmovaps	512(%rsp), %ymm7        # 32-byte Reload
	vmulps	%ymm15, %ymm7, %ymm15
	vfmsub231ps	%ymm4, %ymm11, %ymm15
	vmovaps	96(%rsp), %ymm11        # 32-byte Reload
	vfmadd213ps	%ymm12, %ymm15, %ymm11
	vmovaps	%ymm11, 96(%rsp)        # 32-byte Spill
	vbroadcastss	-80(%rbx), %ymm11
	vfmadd231ps	%ymm15, %ymm11, %ymm14
	vbroadcastss	-112(%rbx), %ymm15
	vmovaps	%ymm4, 256(%rsp)        # 32-byte Spill
	vmulps	480(%rsp), %ymm4, %ymm12 # 32-byte Folded Reload
	vfmsub231ps	128(%rsp), %ymm7, %ymm12 # 32-byte Folded Reload
	vfmadd213ps	96(%rsp), %ymm12, %ymm15 # 32-byte Folded Reload
	vbroadcastss	-64(%rbx), %ymm4
	vandps	416(%rsp), %ymm13, %ymm11 # 32-byte Folded Reload
	vfmadd231ps	%ymm12, %ymm4, %ymm14
	vxorps	%ymm15, %ymm11, %ymm13
	vxorps	%ymm14, %ymm11, %ymm14
	vxorps	%ymm12, %ymm12, %ymm12
	vcmpleps	%ymm13, %ymm12, %ymm4
	vcmpleps	%ymm14, %ymm12, %ymm12
	vandps	%ymm4, %ymm12, %ymm15
	vaddps	%ymm13, %ymm14, %ymm4
	vmovaps	1152(%rsp), %ymm7       # 32-byte Reload
	vmovaps	%ymm7, %ymm12
	vcmpleps	%ymm7, %ymm4, %ymm4
	vptest	%ymm4, %ymm15
	jne	.LBB0_59
.LBB0_61:                               # %next190.rv.i
                                        #   in Loop: Header=BB0_57 Depth=4
	addq	$1, %rdi
	addq	$4, %rbx
	cmpq	$4, %rdi
	jl	.LBB0_57
# BB#62:                                # %if_else174.rv.i
                                        #   in Loop: Header=BB0_56 Depth=3
	imulq	$208, %r15, %rax
	addq	$1, %r15
	addq	$208, %r12
	cmpl	$0, 204(%r10,%rax)
	jns	.LBB0_56
	jmp	.LBB0_3
.LBB0_5:                                # %if_else12.rv.i.preheader
                                        #   in Loop: Header=BB0_3 Depth=2
	movslq	%r14d, %rdi
	leaq	544(%rsp,%rdi,4), %rax
	shlq	$5, %rdi
	leaq	1184(%rsp,%rdi), %rdi
.LBB0_6:                                # %if_else12.rv.i
                                        #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	(%rax), %r11d
	testl	%r11d, %r11d
	je	.LBB0_63
# BB#7:                                 # %if_else13.rv.i
                                        #   in Loop: Header=BB0_6 Depth=3
	vmovaps	(%rdi), %ymm10
	vcmpltps	%ymm4, %ymm10, %ymm11
	vmovmskps	%ymm11, %ebx
	addq	$-32, %rdi
	addl	$-1, %r14d
	addq	$-4, %rax
	testl	%ebx, %ebx
	jne	.LBB0_8
	jmp	.LBB0_6
	.p2align	4, 0x90
.LBB0_3:                                # %while_head.rv.i
                                        #   Parent Loop BB0_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_6 Depth 3
                                        #       Child Loop BB0_9 Depth 3
                                        #       Child Loop BB0_56 Depth 3
                                        #         Child Loop BB0_57 Depth 4
	testl	%r11d, %r11d
	jne	.LBB0_4
.LBB0_63:                               # %exit
                                        #   in Loop: Header=BB0_2 Depth=1
	movq	%rsi, %rax
	shlq	$7, %rax
	movq	88(%rsp), %rcx          # 8-byte Reload
	vmovaps	384(%rsp), %ymm0        # 32-byte Reload
	vmovups	%ymm0, (%rcx,%rax)
	vmovaps	224(%rsp), %ymm0        # 32-byte Reload
	vmovups	%ymm0, 32(%rcx,%rax)
	vmovaps	192(%rsp), %ymm0        # 32-byte Reload
	vmovups	%ymm0, 64(%rcx,%rax)
	vmovaps	160(%rsp), %ymm0        # 32-byte Reload
	vmovups	%ymm0, 96(%rcx,%rax)
	addq	$1, %rsi
	cmpq	24(%rsp), %rsi          # 8-byte Folded Reload
	jl	.LBB0_2
.LBB0_64:                               # %if_else
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.Lfunc_end0:
	.size	cpu_intersect_bvh8_tri4_packet8_avx2, .Lfunc_end0-cpu_intersect_bvh8_tri4_packet8_avx2

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI1_0:
	.long	2147483647              # float NaN
.LCPI1_1:
	.long	841731191               # float 9.99999993E-9
.LCPI1_2:
	.long	1065353216              # float 1
.LCPI1_3:
	.long	2147483648              # float -0
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI1_4:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
.LCPI1_5:
	.zero	16
	.text
	.globl	cpu_occluded_bvh8_tri4_single_avx2
	.p2align	4, 0x90
	.type	cpu_occluded_bvh8_tri4_single_avx2,@function
cpu_occluded_bvh8_tri4_single_avx2:     # @cpu_occluded_bvh8_tri4_single_avx2
# BB#0:                                 # %cpu_occluded_bvh8_tri4_single_avx2_start
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$840, %rsp              # imm = 0x348
	movq	%rdx, 40(%rsp)          # 8-byte Spill
	movq	%rsi, 32(%rsp)          # 8-byte Spill
	testl	%ecx, %ecx
	jle	.LBB1_39
# BB#1:                                 # %if_then.lr.ph
	movq	(%rdi), %rbx
	movq	8(%rdi), %rax
	movq	%rax, -40(%rsp)         # 8-byte Spill
	movl	%ecx, %eax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	xorl	%edx, %edx
	vbroadcastss	.LCPI1_0(%rip), %xmm3
	vmovss	.LCPI1_1(%rip), %xmm5   # xmm5 = mem[0],zero,zero,zero
	vbroadcastss	.LCPI1_3(%rip), %xmm0
	vmovaps	%xmm0, 112(%rsp)        # 16-byte Spill
                                        # implicit-def: %EAX
	movl	%eax, -120(%rsp)        # 4-byte Spill
                                        # implicit-def: %EAX
	movl	%eax, -124(%rsp)        # 4-byte Spill
	vmovaps	%xmm3, 128(%rsp)        # 16-byte Spill
	movq	%rbx, -80(%rsp)         # 8-byte Spill
	jmp	.LBB1_3
.LBB1_2:                                # %lambda_2678206_vectorize.exit.thread
                                        #   in Loop: Header=BB1_3 Depth=1
	tzcntl	%edi, %eax
	vrcpps	%xmm3, %xmm1
	vbroadcastss	.LCPI1_2(%rip), %xmm2
	vfnmadd213ps	%xmm2, %xmm1, %xmm3
	vfmadd132ps	%xmm1, %xmm1, %xmm3
	vmulps	%xmm0, %xmm3, %xmm0
	movl	192(%rdx,%rax,4), %ecx
                                        # kill: %EAX<def> %EAX<kill> %RAX<kill> %RAX<def>
	andl	$3, %eax
	vmulps	176(%rsp), %xmm3, %xmm1 # 16-byte Folded Reload
	vmulps	%xmm6, %xmm3, %xmm2
	movl	$2147483647, %edx       # imm = 0x7FFFFFFF
	andl	%edx, %ecx
	vmovaps	%xmm0, 272(%rsp)
	movl	272(%rsp,%rax,4), %edi
	vmovaps	%xmm1, 288(%rsp)
	movl	288(%rsp,%rax,4), %edx
	movl	%edx, -120(%rsp)        # 4-byte Spill
	vmovaps	%xmm2, 304(%rsp)
	movl	304(%rsp,%rax,4), %eax
	movl	%eax, -124(%rsp)        # 4-byte Spill
	movq	-72(%rsp), %rsi         # 8-byte Reload
	jmp	.LBB1_38
	.p2align	4, 0x90
.LBB1_3:                                # %if_then
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_13 Depth 2
                                        #       Child Loop BB1_16 Depth 3
                                        #         Child Loop BB1_25 Depth 4
                                        #           Child Loop BB1_19 Depth 5
                                        #       Child Loop BB1_32 Depth 3
	movq	%rdx, %rcx
	shlq	$5, %rcx
	movq	32(%rsp), %rax          # 8-byte Reload
	vmovss	(%rax,%rcx), %xmm8      # xmm8 = mem[0],zero,zero,zero
	vmovss	4(%rax,%rcx), %xmm6     # xmm6 = mem[0],zero,zero,zero
	vmovss	8(%rax,%rcx), %xmm7     # xmm7 = mem[0],zero,zero,zero
	vmovss	16(%rax,%rcx), %xmm1    # xmm1 = mem[0],zero,zero,zero
	vmovss	20(%rax,%rcx), %xmm2    # xmm2 = mem[0],zero,zero,zero
	vmovss	24(%rax,%rcx), %xmm4    # xmm4 = mem[0],zero,zero,zero
	movl	12(%rax,%rcx), %ebp
	movl	28(%rax,%rcx), %eax
	vandps	%xmm3, %xmm1, %xmm0
	vucomiss	%xmm5, %xmm0
	jae	.LBB1_5
# BB#4:                                 # %if_then.i
                                        #   in Loop: Header=BB1_3 Depth=1
	vmovmskps	%xmm1, %ecx
	shll	$31, %ecx
	orl	$841731191, %ecx        # imm = 0x322BCC77
	vmovd	%ecx, %xmm9
	jmp	.LBB1_6
	.p2align	4, 0x90
.LBB1_5:                                # %if_else.i
                                        #   in Loop: Header=BB1_3 Depth=1
	vmovss	.LCPI1_2(%rip), %xmm0   # xmm0 = mem[0],zero,zero,zero
	vdivss	%xmm1, %xmm0, %xmm9
.LBB1_6:                                # %safe_rcp_cont
                                        #   in Loop: Header=BB1_3 Depth=1
	vandps	%xmm3, %xmm2, %xmm0
	vucomiss	%xmm5, %xmm0
	jae	.LBB1_8
# BB#7:                                 # %if_then.i39
                                        #   in Loop: Header=BB1_3 Depth=1
	vmovmskps	%xmm2, %ecx
	shll	$31, %ecx
	orl	$841731191, %ecx        # imm = 0x322BCC77
	vmovd	%ecx, %xmm10
	jmp	.LBB1_9
	.p2align	4, 0x90
.LBB1_8:                                # %if_else.i38
                                        #   in Loop: Header=BB1_3 Depth=1
	vmovss	.LCPI1_2(%rip), %xmm0   # xmm0 = mem[0],zero,zero,zero
	vdivss	%xmm2, %xmm0, %xmm10
.LBB1_9:                                # %safe_rcp_cont1
                                        #   in Loop: Header=BB1_3 Depth=1
	vandps	%xmm3, %xmm4, %xmm0
	vucomiss	%xmm5, %xmm0
	movq	%rdx, -72(%rsp)         # 8-byte Spill
	jae	.LBB1_11
# BB#10:                                # %if_then.i36
                                        #   in Loop: Header=BB1_3 Depth=1
	vmovmskps	%xmm4, %ecx
	shll	$31, %ecx
	orl	$841731191, %ecx        # imm = 0x322BCC77
	vmovd	%ecx, %xmm0
	jmp	.LBB1_12
	.p2align	4, 0x90
.LBB1_11:                               # %if_else.i35
                                        #   in Loop: Header=BB1_3 Depth=1
	vmovss	.LCPI1_2(%rip), %xmm0   # xmm0 = mem[0],zero,zero,zero
	vdivss	%xmm4, %xmm0, %xmm0
.LBB1_12:                               # %body
                                        #   in Loop: Header=BB1_3 Depth=1
	xorl	%edx, %edx
	vxorps	%xmm3, %xmm3, %xmm3
	vucomiss	%xmm3, %xmm4
	seta	%dl
	xorl	%ecx, %ecx
	vucomiss	%xmm3, %xmm2
	seta	%cl
	xorl	%r8d, %r8d
	vucomiss	%xmm3, %xmm1
	seta	%r8b
	vmulss	%xmm10, %xmm6, %xmm5
	vmulss	%xmm0, %xmm7, %xmm3
	vmovaps	%xmm7, -112(%rsp)       # 16-byte Spill
	vmovaps	112(%rsp), %xmm7        # 16-byte Reload
	vxorps	%xmm7, %xmm3, %xmm11
	vxorps	%xmm7, %xmm5, %xmm13
	vmulss	%xmm9, %xmm8, %xmm5
	vxorps	%xmm7, %xmm5, %xmm12
	movl	$0, 584(%rsp)
	movl	$2139095039, 328(%rsp)  # imm = 0x7F7FFFFF
	shll	$5, %ecx
	shll	$5, %edx
	shlq	$5, %r8
	movl	%r8d, %r11d
	xorl	$32, %r11d
	leal	64(%rcx), %r14d
	xorl	$96, %ecx
	leal	128(%rdx), %r15d
	xorl	$160, %edx
	movl	%eax, -116(%rsp)        # 4-byte Spill
	vmovd	%eax, %xmm7
	vmovd	%ebp, %xmm3
	vmovaps	%xmm8, %xmm5
	vbroadcastss	%xmm0, %ymm8
	vbroadcastss	%xmm9, %ymm9
	vbroadcastss	%xmm10, %ymm10
	vbroadcastss	%xmm11, %ymm11
	vbroadcastss	%xmm12, %ymm12
	vbroadcastss	%xmm13, %ymm13
	vpbroadcastd	%xmm7, %ymm14
	vpbroadcastd	%xmm3, %ymm15
	vbroadcastss	%xmm1, %xmm0
	vmovaps	%xmm0, 80(%rsp)         # 16-byte Spill
	vbroadcastss	%xmm2, %xmm0
	vmovaps	%xmm0, 64(%rsp)         # 16-byte Spill
	vbroadcastss	%xmm4, %xmm0
	vmovaps	%xmm0, 48(%rsp)         # 16-byte Spill
	vbroadcastss	%xmm6, %xmm0
	vmovaps	%xmm0, 256(%rsp)        # 16-byte Spill
	vbroadcastss	-112(%rsp), %xmm0 # 16-byte Folded Reload
	vmovaps	%xmm0, 240(%rsp)        # 16-byte Spill
	vbroadcastss	%xmm5, %xmm0
	vmovaps	%xmm0, 224(%rsp)        # 16-byte Spill
	vpbroadcastd	%xmm3, %xmm0
	vmovdqa	%xmm0, 160(%rsp)        # 16-byte Spill
	xorl	%r10d, %r10d
	movl	$1, %esi
	vpbroadcastd	%xmm7, %xmm0
	vmovdqa	%xmm0, 144(%rsp)        # 16-byte Spill
	movq	%rdx, -88(%rsp)         # 8-byte Spill
.LBB1_13:                               # %while_head1.rv.i.preheader.preheader
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_16 Depth 3
                                        #         Child Loop BB1_25 Depth 4
                                        #           Child Loop BB1_19 Depth 5
                                        #       Child Loop BB1_32 Depth 3
	movl	%esi, %r13d
	movl	%r10d, %r12d
	jmp	.LBB1_16
.LBB1_14:                               # %if_then37.rv.i
                                        #   in Loop: Header=BB1_16 Depth=3
	vmovd	%ebp, %xmm0
	movslq	%r12d, %r10
	movl	584(%rsp,%r10,4), %esi
	movl	328(%rsp,%r10,4), %ebp
	addl	$-1, %r10d
	vucomiss	%xmm0, %xmm7
	ja	.LBB1_31
	jmp	.LBB1_30
.LBB1_15:                               # %break.rv.i.break33.rv.i_crit_edge
                                        #   in Loop: Header=BB1_16 Depth=3
	leal	-1(%r12,%rbx), %r10d
	movl	%esi, %r13d
	movq	-80(%rsp), %rbx         # 8-byte Reload
	movq	-88(%rsp), %rdx         # 8-byte Reload
	jmp	.LBB1_29
	.p2align	4, 0x90
.LBB1_16:                               # %while_head1.rv.i.preheader
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_13 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_25 Depth 4
                                        #           Child Loop BB1_19 Depth 5
	testl	%r13d, %r13d
	jg	.LBB1_25
	jmp	.LBB1_14
.LBB1_18:                               # %if_then.rv.i.preheader
                                        #   in Loop: Header=BB1_25 Depth=4
	movslq	%r10d, %rdx
	leaq	332(%rsp), %rax
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, -16(%rsp)         # 8-byte Spill
	leaq	588(%rsp), %rax
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, -32(%rsp)         # 8-byte Spill
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_19:                               # %if_then.rv.i
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_13 Depth=2
                                        #       Parent Loop BB1_16 Depth=3
                                        #         Parent Loop BB1_25 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	tzcntl	%edi, %eax
	movslq	192(%r9,%rax,4), %r13
	testq	%r13, %r13
	je	.LBB1_23
# BB#20:                                # %if_else24.rv.i
                                        #   in Loop: Header=BB1_19 Depth=5
	movq	%r13, %rdx
	movq	%rdx, -112(%rsp)        # 8-byte Spill
	shlq	$8, -112(%rsp)          # 8-byte Folded Spill
	movq	%rax, -64(%rsp)         # 8-byte Spill
	movl	%r13d, %eax
	notl	%eax
	cltq
	imulq	$208, %rax, %rax
	addq	-40(%rsp), %rax         # 8-byte Folded Reload
	testl	%r13d, %r13d
	movq	%rbx, (%rsp)            # 8-byte Spill
	movq	-80(%rsp), %rbx         # 8-byte Reload
	movq	-112(%rsp), %rdx        # 8-byte Reload
	leaq	-256(%rbx,%rdx), %rbx
	cmovsq	%rax, %rbx
	prefetcht0	(%rbx)
	prefetcht0	64(%rbx)
	prefetcht0	128(%rbx)
	prefetcht0	192(%rbx)
	movq	(%rsp), %rbx            # 8-byte Reload
	leal	-1(%rdi), %eax
	movl	%eax, -112(%rsp)        # 4-byte Spill
	movq	-32(%rsp), %rax         # 8-byte Reload
	movl	%esi, (%rax,%rbx,4)
	movq	-16(%rsp), %rsi         # 8-byte Reload
	movl	%ebp, (%rsi,%rbx,4)
	leaq	1(%rbx), %rbx
	vmovd	-64(%rsp), %xmm0        # 4-byte Folded Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vpermd	%ymm5, %ymm0, %ymm0
	vmovd	%xmm0, %ebp
	movl	-112(%rsp), %eax        # 4-byte Reload
	andl	%edi, %eax
	movl	%eax, %edi
	movl	%r13d, %esi
	jne	.LBB1_19
# BB#21:                                # %while_head1.rv.i.backedge.loopexit
                                        #   in Loop: Header=BB1_25 Depth=4
	addl	%ebx, %r10d
.LBB1_22:                               # %while_head1.rv.i.backedge
                                        #   in Loop: Header=BB1_25 Depth=4
	movq	-80(%rsp), %rbx         # 8-byte Reload
	movq	-88(%rsp), %rdx         # 8-byte Reload
	jmp	.LBB1_28
.LBB1_23:                               # %break.rv.i
                                        #   in Loop: Header=BB1_25 Depth=4
	testl	%ebx, %ebx
	je	.LBB1_15
# BB#24:                                # %break.rv.i.while_head1.rv.i.backedge_crit_edge
                                        #   in Loop: Header=BB1_25 Depth=4
	movl	%r10d, %r10d
	addq	%rbx, %r10
	movl	%esi, %r13d
	jmp	.LBB1_22
	.p2align	4, 0x90
.LBB1_25:                               # %while_body5.rv.i
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_13 Depth=2
                                        #       Parent Loop BB1_16 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB1_19 Depth 5
	vmovd	%ebp, %xmm0
	movslq	%r12d, %r10
	movl	584(%rsp,%r10,4), %esi
	movl	328(%rsp,%r10,4), %ebp
	addl	$-1, %r10d
	vucomiss	%xmm0, %xmm7
	jbe	.LBB1_27
# BB#26:                                # %if_else.rv.i
                                        #   in Loop: Header=BB1_25 Depth=4
	movslq	%r13d, %r9
	addq	$-1, %r9
	shlq	$8, %r9
	addq	%rbx, %r9
	vmovaps	(%r15,%r9), %ymm0
	vfmadd213ps	%ymm11, %ymm8, %ymm0
	vmovaps	(%r11,%r9), %ymm1
	vfmadd213ps	%ymm12, %ymm9, %ymm1
	vmovaps	(%r8,%r9), %ymm2
	vfmadd213ps	%ymm12, %ymm9, %ymm2
	vmovaps	(%rcx,%r9), %ymm3
	vfmadd213ps	%ymm13, %ymm10, %ymm3
	vmovaps	(%r14,%r9), %ymm4
	vfmadd213ps	%ymm13, %ymm10, %ymm4
	vmovaps	(%rdx,%r9), %ymm5
	vfmadd213ps	%ymm11, %ymm8, %ymm5
	vpmaxsd	%ymm1, %ymm3, %ymm1
	vpminsd	%ymm4, %ymm2, %ymm2
	vpminsd	%ymm14, %ymm0, %ymm0
	vpmaxsd	%ymm5, %ymm15, %ymm3
	vpmaxsd	%ymm1, %ymm3, %ymm5
	vpminsd	%ymm0, %ymm2, %ymm0
	vpcmpgtd	%ymm0, %ymm5, %ymm0
	vmovmskps	%ymm0, %edi
	xorl	$255, %edi
	jne	.LBB1_18
.LBB1_27:                               #   in Loop: Header=BB1_25 Depth=4
	movl	%esi, %r13d
.LBB1_28:                               # %while_head1.rv.i.backedge
                                        #   in Loop: Header=BB1_25 Depth=4
	movl	%r10d, %r12d
	testl	%r13d, %r13d
	jg	.LBB1_25
.LBB1_29:                               # %break33.rv.i
                                        #   in Loop: Header=BB1_16 Depth=3
	movl	%r10d, %r12d
	movl	%r13d, %esi
	testl	%r13d, %r13d
	js	.LBB1_14
.LBB1_30:                               # %while_head.rv.i.backedge
                                        #   in Loop: Header=BB1_16 Depth=3
	movl	%esi, %r13d
	movl	%r10d, %r12d
	testl	%esi, %esi
	jne	.LBB1_16
	jmp	.LBB1_37
	.p2align	4, 0x90
.LBB1_31:                               # %head.rv.i.preheader
                                        #   in Loop: Header=BB1_13 Depth=2
	notl	%r13d
	movslq	%r13d, %rax
	imulq	$208, %rax, %rdx
	addq	-40(%rsp), %rdx         # 8-byte Folded Reload
	.p2align	4, 0x90
.LBB1_32:                               # %while_head.rv.i7
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_13 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovaps	144(%rdx), %xmm2
	vmovaps	160(%rdx), %xmm0
	vmovaps	176(%rdx), %xmm1
	vmovaps	%xmm0, -32(%rsp)        # 16-byte Spill
	vmulps	64(%rsp), %xmm0, %xmm0  # 16-byte Folded Reload
	vmovaps	80(%rsp), %xmm6         # 16-byte Reload
	vmovaps	%xmm2, 208(%rsp)        # 16-byte Spill
	vfmadd231ps	%xmm2, %xmm6, %xmm0
	vmovaps	48(%rsp), %xmm2         # 16-byte Reload
	vmovaps	%xmm1, -16(%rsp)        # 16-byte Spill
	vfmadd231ps	%xmm1, %xmm2, %xmm0
	vandps	.LCPI1_4(%rip), %xmm0, %xmm1
	vmovaps	%xmm1, (%rsp)           # 16-byte Spill
	vmovaps	(%rdx), %xmm1
	vmovaps	%xmm1, -64(%rsp)        # 16-byte Spill
	vmovaps	16(%rdx), %xmm4
	vmovaps	32(%rdx), %xmm1
	vsubps	256(%rsp), %xmm4, %xmm3 # 16-byte Folded Reload
	vmulps	%xmm3, %xmm2, %xmm4
	vbroadcastss	.LCPI1_3(%rip), %xmm5
	vandps	%xmm5, %xmm0, %xmm0
	vmovaps	%xmm0, -112(%rsp)       # 16-byte Spill
	vsubps	240(%rsp), %xmm1, %xmm5 # 16-byte Folded Reload
	vmovaps	-64(%rsp), %xmm0        # 16-byte Reload
	vsubps	224(%rsp), %xmm0, %xmm2 # 16-byte Folded Reload
	vmulps	%xmm5, %xmm6, %xmm1
	vmovaps	64(%rsp), %xmm0         # 16-byte Reload
	vmulps	%xmm2, %xmm0, %xmm6
	vmovaps	%xmm5, 192(%rsp)        # 16-byte Spill
	vfmsub231ps	%xmm5, %xmm0, %xmm4
	vmovaps	%xmm2, %xmm5
	vmovaps	(%rsp), %xmm0           # 16-byte Reload
	vfmsub231ps	48(%rsp), %xmm5, %xmm1 # 16-byte Folded Reload
	vmulps	112(%rdx), %xmm1, %xmm2
	vmovaps	%xmm3, -64(%rsp)        # 16-byte Spill
	vfmsub231ps	80(%rsp), %xmm3, %xmm6 # 16-byte Folded Reload
	vmulps	64(%rdx), %xmm1, %xmm1
	vfmadd231ps	96(%rdx), %xmm4, %xmm2
	vfmadd231ps	48(%rdx), %xmm4, %xmm1
	vfmadd231ps	128(%rdx), %xmm6, %xmm2
	vfmadd231ps	80(%rdx), %xmm6, %xmm1
	vmovaps	-112(%rsp), %xmm3       # 16-byte Reload
	vxorps	%xmm2, %xmm3, %xmm4
	vxorps	%xmm1, %xmm3, %xmm6
	vxorps	%xmm2, %xmm2, %xmm2
	vcmpleps	%xmm4, %xmm2, %xmm1
	vcmpleps	%xmm6, %xmm2, %xmm2
	vandps	%xmm1, %xmm2, %xmm1
	vmovaps	%xmm4, 176(%rsp)        # 16-byte Spill
	vaddps	%xmm6, %xmm4, %xmm2
	vcmpleps	%xmm0, %xmm2, %xmm4
	vptest	%xmm4, %xmm1
	jne	.LBB1_34
.LBB1_33:                               # %next.rv.i33
                                        #   in Loop: Header=BB1_32 Depth=3
	cmpl	$0, 204(%rdx)
	leaq	208(%rdx), %rdx
	jns	.LBB1_32
	jmp	.LBB1_36
.LBB1_34:                               # %if_else_crit.rv.i26
                                        #   in Loop: Header=BB1_32 Depth=3
	vandps	%xmm4, %xmm1, %xmm1
	vmovaps	%xmm1, 96(%rsp)         # 16-byte Spill
	vcmpneq_usps	.LCPI1_5, %xmm0, %xmm1
	vmulps	144(%rsp), %xmm0, %xmm2 # 16-byte Folded Reload
	vmovaps	%xmm0, %xmm4
	vmulps	208(%rsp), %xmm5, %xmm3 # 16-byte Folded Reload
	vmovaps	-64(%rsp), %xmm5        # 16-byte Reload
	vfmadd132ps	-32(%rsp), %xmm3, %xmm5 # 16-byte Folded Reload
	vmovaps	192(%rsp), %xmm0        # 16-byte Reload
	vfmadd132ps	-16(%rsp), %xmm5, %xmm0 # 16-byte Folded Reload
	vmulps	160(%rsp), %xmm4, %xmm3 # 16-byte Folded Reload
	vxorps	-112(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
	vcmpleps	%xmm2, %xmm0, %xmm2
	vcmpleps	%xmm0, %xmm3, %xmm3
	vandps	%xmm1, %xmm2, %xmm1
	vmovdqa	96(%rsp), %xmm2         # 16-byte Reload
	vandps	%xmm3, %xmm1, %xmm1
	vmovaps	%xmm4, %xmm3
	vptest	%xmm1, %xmm2
	je	.LBB1_33
# BB#35:                                # %if_else_crit5.rv.i
                                        #   in Loop: Header=BB1_32 Depth=3
	vpand	%xmm2, %xmm1, %xmm1
	vmovmskps	%xmm1, %edi
	testl	%edi, %edi
	je	.LBB1_33
	jmp	.LBB1_2
	.p2align	4, 0x90
.LBB1_36:                               # %while_head.rv.i.outer.loopexit
                                        #   in Loop: Header=BB1_13 Depth=2
	testl	%esi, %esi
	movq	-88(%rsp), %rdx         # 8-byte Reload
	jne	.LBB1_13
	.p2align	4, 0x90
.LBB1_37:                               #   in Loop: Header=BB1_3 Depth=1
	movl	$-1, %ecx
	movq	-72(%rsp), %rsi         # 8-byte Reload
	movl	-116(%rsp), %edi        # 4-byte Reload
.LBB1_38:                               # %exit
                                        #   in Loop: Header=BB1_3 Depth=1
	leaq	1(%rsi), %rax
	shlq	$4, %rsi
	movq	40(%rsp), %rdx          # 8-byte Reload
	movl	%ecx, (%rdx,%rsi)
	movl	%edi, 4(%rdx,%rsi)
	movl	-120(%rsp), %ecx        # 4-byte Reload
	movl	%ecx, 8(%rdx,%rsi)
	movl	-124(%rsp), %ecx        # 4-byte Reload
	movl	%ecx, 12(%rdx,%rsi)
	movq	%rax, %rdx
	cmpq	24(%rsp), %rax          # 8-byte Folded Reload
	vmovaps	128(%rsp), %xmm3        # 16-byte Reload
	vmovss	.LCPI1_1(%rip), %xmm5   # xmm5 = mem[0],zero,zero,zero
	jne	.LBB1_3
.LBB1_39:                               # %if_else
	addq	$840, %rsp              # imm = 0x348
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.Lfunc_end1:
	.size	cpu_occluded_bvh8_tri4_single_avx2, .Lfunc_end1-cpu_occluded_bvh8_tri4_single_avx2

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI2_0:
	.long	1065353216              # float 1
.LCPI2_1:
	.long	2147483648              # float -0
.LCPI2_2:
	.long	841731191               # float 9.99999993E-9
.LCPI2_3:
	.long	2                       # float 2.80259693E-45
.LCPI2_4:
	.long	1                       # 0x1
.LCPI2_5:
	.long	4                       # float 5.60519386E-45
.LCPI2_6:
	.long	32                      # 0x20
.LCPI2_7:
	.long	128                     # 0x80
.LCPI2_8:
	.long	64                      # 0x40
.LCPI2_9:
	.long	2139095039              # float 3.40282347E+38
.LCPI2_11:
	.long	2147483647              # 0x7fffffff
.LCPI2_12:
	.long	4286578687              # float -3.40282347E+38
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI2_10:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI2_13:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
.LCPI2_15:
	.zero	16
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5
.LCPI2_14:
	.zero	32
	.text
	.globl	cpu_occluded_bvh8_tri4_hybrid8_avx2
	.p2align	4, 0x90
	.type	cpu_occluded_bvh8_tri4_hybrid8_avx2,@function
cpu_occluded_bvh8_tri4_hybrid8_avx2:    # @cpu_occluded_bvh8_tri4_hybrid8_avx2
# BB#0:                                 # %cpu_occluded_bvh8_tri4_hybrid8_avx2_start
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$5152, %rsp             # imm = 0x1420
                                        # kill: %ECX<def> %ECX<kill> %RCX<def>
	movq	%rdx, 272(%rsp)         # 8-byte Spill
	movq	%rsi, 264(%rsp)         # 8-byte Spill
	movq	%rcx, 40(%rsp)          # 8-byte Spill
	cmpl	$8, %ecx
	jl	.LBB2_81
# BB#1:                                 # %head.preheader.lr.ph
	movq	(%rdi), %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	8(%rdi), %r10
	movq	40(%rsp), %rax          # 8-byte Reload
	shrl	$3, %eax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	leaq	192(%r10), %r11
	xorl	%r14d, %r14d
	vbroadcastss	.LCPI2_0(%rip), %ymm0
	vmovaps	%ymm0, 1024(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI2_1(%rip), %ymm0
	vmovaps	%ymm0, 1568(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI2_2(%rip), %ymm0
	vmovaps	%ymm0, 1536(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI2_1(%rip), %ymm0
	vmovaps	%ymm0, 1056(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI2_2(%rip), %ymm0
	vmovaps	%ymm0, 1504(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI2_3(%rip), %ymm0
	vmovaps	%ymm0, 1472(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI2_4(%rip), %ymm0
	vmovaps	%ymm0, 1440(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI2_5(%rip), %ymm0
	vmovaps	%ymm0, 1408(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI2_6(%rip), %ymm0
	vmovaps	%ymm0, 1376(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI2_7(%rip), %ymm0
	vmovaps	%ymm0, 1344(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI2_8(%rip), %ymm0
	vmovaps	%ymm0, 1312(%rsp)       # 32-byte Spill
	vpcmpeqd	%ymm13, %ymm13, %ymm13
	vbroadcastss	.LCPI2_9(%rip), %ymm14
	vmovaps	%ymm14, 544(%rsp)       # 32-byte Spill
	movq	%r10, 48(%rsp)          # 8-byte Spill
	movq	%r11, 256(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB2_2:                                # %body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
                                        #       Child Loop BB2_9 Depth 3
                                        #         Child Loop BB2_13 Depth 4
                                        #           Child Loop BB2_14 Depth 5
                                        #             Child Loop BB2_17 Depth 6
                                        #               Child Loop BB2_25 Depth 7
                                        #                 Child Loop BB2_20 Depth 8
                                        #             Child Loop BB2_32 Depth 6
                                        #       Child Loop BB2_40 Depth 3
                                        #       Child Loop BB2_69 Depth 3
                                        #         Child Loop BB2_70 Depth 4
	movq	%rsp, %r15
	movq	%r14, %rax
	shlq	$8, %rax
	movq	264(%rsp), %rcx         # 8-byte Reload
	vmovups	(%rcx,%rax), %ymm0
	vmovaps	%ymm0, 1152(%rsp)       # 32-byte Spill
	vmovups	32(%rcx,%rax), %ymm0
	vmovaps	%ymm0, 1120(%rsp)       # 32-byte Spill
	vmovups	64(%rcx,%rax), %ymm0
	vmovaps	%ymm0, 1088(%rsp)       # 32-byte Spill
	vmovups	96(%rcx,%rax), %ymm12
	vrcpps	%ymm12, %ymm0
	vmovaps	%ymm0, %ymm1
	vmovaps	1024(%rsp), %ymm6       # 32-byte Reload
	vfnmadd213ps	%ymm6, %ymm12, %ymm1
	vfmadd132ps	%ymm0, %ymm0, %ymm1
	vmovaps	1568(%rsp), %ymm15      # 32-byte Reload
	vxorps	%ymm15, %ymm12, %ymm0
	vxorps	%ymm8, %ymm8, %ymm8
	vcmpltps	%ymm12, %ymm8, %ymm2
	vmovups	128(%rcx,%rax), %ymm11
	vrcpps	%ymm11, %ymm3
	vmovaps	%ymm3, %ymm4
	vfnmadd213ps	%ymm6, %ymm11, %ymm4
	vmovups	160(%rcx,%rax), %ymm7
	vrcpps	%ymm7, %ymm5
	vfmadd132ps	%ymm3, %ymm3, %ymm4
	vblendvps	%ymm2, %ymm12, %ymm0, %ymm0
	vmovaps	%ymm5, %ymm3
	vfnmadd213ps	%ymm6, %ymm7, %ymm3
	vfmadd132ps	%ymm5, %ymm5, %ymm3
	vmovups	192(%rcx,%rax), %ymm5
	vmovaps	%ymm5, 352(%rsp)        # 32-byte Spill
	vmovaps	1536(%rsp), %ymm6       # 32-byte Reload
	vcmpnlt_uqps	%ymm6, %ymm0, %ymm0
	vmovaps	1056(%rsp), %ymm9       # 32-byte Reload
	vandps	%ymm9, %ymm12, %ymm5
	vmovaps	1504(%rsp), %ymm10      # 32-byte Reload
	vorps	%ymm10, %ymm5, %ymm5
	vblendvps	%ymm0, %ymm1, %ymm5, %ymm0
	vmovaps	%ymm0, 512(%rsp)        # 32-byte Spill
	vcmpltps	%ymm11, %ymm8, %ymm5
	vxorps	%ymm15, %ymm11, %ymm0
	vblendvps	%ymm5, %ymm11, %ymm0, %ymm0
	vcmpnlt_uqps	%ymm6, %ymm0, %ymm0
	vandps	%ymm9, %ymm11, %ymm1
	vorps	%ymm10, %ymm1, %ymm1
	vblendvps	%ymm0, %ymm4, %ymm1, %ymm0
	vmovaps	%ymm0, 480(%rsp)        # 32-byte Spill
	vxorps	%ymm15, %ymm7, %ymm0
	vcmpltps	%ymm7, %ymm8, %ymm4
	vblendvps	%ymm4, %ymm7, %ymm0, %ymm0
	vcmpnlt_uqps	%ymm6, %ymm0, %ymm0
	vandps	%ymm9, %ymm7, %ymm1
	vorps	%ymm10, %ymm1, %ymm1
	vblendvps	%ymm0, %ymm3, %ymm1, %ymm9
	vmovups	224(%rcx,%rax), %ymm0
	vmovaps	%ymm0, 96(%rsp)         # 32-byte Spill
	vblendvps	%ymm5, 1472(%rsp), %ymm8, %ymm3 # 32-byte Folded Reload
	vpcmpeqd	%ymm8, %ymm2, %ymm2
	vmovdqa	1440(%rsp), %ymm1       # 32-byte Reload
	vpandn	%ymm1, %ymm2, %ymm5
	vblendvps	%ymm4, 1408(%rsp), %ymm8, %ymm4 # 32-byte Folded Reload
	vorps	%ymm5, %ymm3, %ymm3
	vorps	%ymm4, %ymm3, %ymm3
	vpsrld	$2, %ymm3, %ymm4
	vpsrld	$1, %ymm3, %ymm3
	vmovdqa	1376(%rsp), %ymm8       # 32-byte Reload
	vpandn	%ymm8, %ymm2, %ymm5
	vpand	%ymm1, %ymm4, %ymm2
	vpand	%ymm1, %ymm3, %ymm3
	vpxor	%ymm8, %ymm5, %ymm4
	vpslld	$5, %ymm2, %ymm2
	vpslld	$5, %ymm3, %ymm3
	vpor	1344(%rsp), %ymm2, %ymm6 # 32-byte Folded Reload
	vpor	1312(%rsp), %ymm3, %ymm3 # 32-byte Folded Reload
	vmovdqa	%ymm4, 2208(%rsp)
	vpxor	%ymm8, %ymm3, %ymm2
	vmovdqa	%ymm2, 2272(%rsp)
	vpxor	%ymm8, %ymm6, %ymm2
	vmovdqa	%ymm2, 2240(%rsp)
	vmovaps	1152(%rsp), %ymm8       # 32-byte Reload
	vmovaps	512(%rsp), %ymm0        # 32-byte Reload
	vmulps	%ymm0, %ymm8, %ymm1
	vmovdqa	%ymm5, 1696(%rsp)
	vxorps	%ymm15, %ymm1, %ymm5
	vmovdqa	%ymm3, 2144(%rsp)
	vmovaps	1088(%rsp), %ymm10      # 32-byte Reload
	vmulps	%ymm9, %ymm10, %ymm2
	vmovdqa	%ymm6, 2176(%rsp)
	vmovaps	1120(%rsp), %ymm6       # 32-byte Reload
	vmovaps	480(%rsp), %ymm4        # 32-byte Reload
	vmulps	%ymm4, %ymm6, %ymm3
	vmovaps	%ymm5, 1824(%rsp)
	vmovaps	%ymm3, 160(%rsp)        # 32-byte Spill
	vxorps	%ymm15, %ymm3, %ymm3
	vmovaps	%ymm3, 1792(%rsp)
	vmovaps	%ymm2, 192(%rsp)        # 32-byte Spill
	vxorps	%ymm15, %ymm2, %ymm3
	vmovaps	%ymm1, %ymm15
	vmovaps	%ymm0, %ymm2
	vmovaps	352(%rsp), %ymm1        # 32-byte Reload
	vmovaps	%ymm3, 1760(%rsp)
	vmovaps	%ymm8, %ymm3
	vmovaps	%ymm3, 2112(%rsp)
	vmovaps	%ymm6, %ymm3
	vmovaps	%ymm3, 2080(%rsp)
	vmovaps	%ymm10, %ymm3
	vmovaps	%ymm3, 2048(%rsp)
	vmovaps	%ymm12, 1664(%rsp)      # 32-byte Spill
	vmovaps	%ymm12, 2016(%rsp)
	vmovaps	%ymm11, 1632(%rsp)      # 32-byte Spill
	vmovaps	%ymm11, 1984(%rsp)
	vmovaps	%ymm7, 1600(%rsp)       # 32-byte Spill
	vmovaps	%ymm7, 1952(%rsp)
	vmovaps	%ymm2, 1920(%rsp)
	vmovaps	%ymm4, 1888(%rsp)
	vmovaps	%ymm9, 1856(%rsp)
	vmovaps	%ymm1, 1728(%rsp)
	vmovaps	96(%rsp), %ymm0         # 32-byte Reload
	vmovaps	%ymm0, 64(%rsp)
	vmovaps	%ymm0, 768(%rsp)
	vmovdqa	%ymm13, 736(%rsp)
	vmovdqa	%ymm13, 1216(%rsp)
	movl	$0, 2304(%rsp)
	vmovaps	%ymm14, 3072(%rsp)
	movl	$255, %r12d
	movl	$1, %edi
	xorl	%ecx, %ecx
	vmovaps	%ymm1, %ymm8
	vmovaps	%ymm9, 672(%rsp)        # 32-byte Spill
	vmovaps	%ymm15, 576(%rsp)       # 32-byte Spill
	testl	%edi, %edi
	jne	.LBB2_5
	jmp	.LBB2_80
.LBB2_3:                                #   in Loop: Header=BB2_5 Depth=2
	vmovaps	352(%rsp), %ymm1        # 32-byte Reload
	vmovaps	512(%rsp), %ymm2        # 32-byte Reload
	vmovaps	480(%rsp), %ymm4        # 32-byte Reload
	vmovaps	672(%rsp), %ymm9        # 32-byte Reload
	vmovaps	320(%rsp), %ymm8        # 32-byte Reload
	.p2align	4, 0x90
.LBB2_4:                                # %while_head.rv.i
                                        #   in Loop: Header=BB2_5 Depth=2
	testl	%edi, %edi
	je	.LBB2_80
.LBB2_5:                                # %while_head9.rv.i.preheader
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_9 Depth 3
                                        #         Child Loop BB2_13 Depth 4
                                        #           Child Loop BB2_14 Depth 5
                                        #             Child Loop BB2_17 Depth 6
                                        #               Child Loop BB2_25 Depth 7
                                        #                 Child Loop BB2_20 Depth 8
                                        #             Child Loop BB2_32 Depth 6
                                        #       Child Loop BB2_40 Depth 3
                                        #       Child Loop BB2_69 Depth 3
                                        #         Child Loop BB2_70 Depth 4
	movslq	%ecx, %rsi
	jmp	.LBB2_9
.LBB2_6:                                # %if_else176.rv.i
                                        #   in Loop: Header=BB2_9 Depth=3
	testl	%r12d, %r12d
	movq	48(%rsp), %r10          # 8-byte Reload
	movq	256(%rsp), %r11         # 8-byte Reload
	movq	296(%rsp), %r14         # 8-byte Reload
	vpcmpeqd	%ymm13, %ymm13, %ymm13
	vmovaps	544(%rsp), %ymm14       # 32-byte Reload
	movq	288(%rsp), %r15         # 8-byte Reload
	vmovaps	352(%rsp), %ymm1        # 32-byte Reload
	vmovaps	512(%rsp), %ymm2        # 32-byte Reload
	vmovaps	480(%rsp), %ymm4        # 32-byte Reload
	vmovaps	672(%rsp), %ymm9        # 32-byte Reload
	vmovaps	576(%rsp), %ymm15       # 32-byte Reload
	movq	280(%rsp), %rsi         # 8-byte Reload
	je	.LBB2_80
.LBB2_7:                                # %next180.rv.i
                                        #   in Loop: Header=BB2_9 Depth=3
	movl	2304(%rsp,%rsi,4), %edi
	testl	%edi, %edi
	je	.LBB2_80
# BB#8:                                 # %if_else183.rv.i
                                        #   in Loop: Header=BB2_9 Depth=3
	leaq	-1(%rsi), %rax
	shlq	$5, %rsi
	vmovaps	3072(%rsp,%rsi), %ymm8
	movq	%rax, %rsi
	.p2align	4, 0x90
.LBB2_9:                                # %while_head9.rv.i
                                        #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB2_13 Depth 4
                                        #           Child Loop BB2_14 Depth 5
                                        #             Child Loop BB2_17 Depth 6
                                        #               Child Loop BB2_25 Depth 7
                                        #                 Child Loop BB2_20 Depth 8
                                        #             Child Loop BB2_32 Depth 6
	vcmpltps	64(%rsp), %ymm8, %ymm0
	vmovmskps	%ymm0, %ecx
	testl	%ecx, %ecx
	je	.LBB2_7
# BB#10:                                # %if_then13.rv.i
                                        #   in Loop: Header=BB2_9 Depth=3
	popcntl	%ecx, %eax
	cmpl	$6, %eax
	ja	.LBB2_39
# BB#11:                                #   in Loop: Header=BB2_9 Depth=3
	movq	%rsi, 280(%rsp)         # 8-byte Spill
	movq	%r15, 288(%rsp)         # 8-byte Spill
	movq	%r14, 296(%rsp)         # 8-byte Spill
	movq	24(%rsp), %r13          # 8-byte Reload
	movl	%edi, 60(%rsp)          # 4-byte Spill
	jmp	.LBB2_13
.LBB2_12:                               # %exit233.rv.i
                                        #   in Loop: Header=BB2_13 Depth=4
	movq	304(%rsp), %rbx         # 8-byte Reload
	movl	%ebx, %eax
	andl	$7, %eax
	tzcntl	%edi, %ecx
	vrcpps	%xmm7, %xmm0
	vbroadcastss	.LCPI2_0(%rip), %xmm1
	vfnmadd213ps	%xmm1, %xmm0, %xmm7
	vfmadd132ps	%xmm0, %xmm0, %xmm7
	movl	192(%r9,%rcx,4), %edx
                                        # kill: %ECX<def> %ECX<kill> %RCX<kill> %RCX<def>
	andl	$3, %ecx
	vmulps	%xmm14, %xmm7, %xmm0
	vmulps	%xmm2, %xmm7, %xmm1
	vmovaps	%xmm0, 976(%rsp)
	movl	976(%rsp,%rcx,4), %esi
	vmovaps	%xmm1, 992(%rsp)
	movl	992(%rsp,%rcx,4), %edi
	andl	$2147483647, %edx       # imm = 0x7FFFFFFF
	vmulps	%xmm9, %xmm7, %xmm0
	vmovaps	%xmm0, 1008(%rsp)
	movl	1008(%rsp,%rcx,4), %ecx
	movl	%ecx, 768(%rsp,%rbx,4)
	movl	%esi, 1280(%rsp,%rbx,4)
	movl	%edi, 1248(%rsp,%rbx,4)
	movl	%edx, 736(%rsp,%rbx,4)
	movl	$-1, 1216(%rsp,%rbx,4)
	vmovaps	64(%rsp), %ymm0
	vmovaps	%ymm0, 1184(%rsp)
	movl	$-2, %edx
	movl	%ebx, %ecx
	roll	%cl, %edx
	vmovss	.LCPI2_12(%rip), %xmm0  # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 1184(%rsp,%rax,4)
	vmovaps	1184(%rsp), %ymm0
	vmovaps	%ymm0, 64(%rsp)
	movl	36(%rsp), %r12d         # 4-byte Reload
	andl	%edx, %r12d
	movq	24(%rsp), %r13          # 8-byte Reload
	jmp	.LBB2_38
	.p2align	4, 0x90
.LBB2_13:                               # %body.rv.i
                                        #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_5 Depth=2
                                        #       Parent Loop BB2_9 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB2_14 Depth 5
                                        #             Child Loop BB2_17 Depth 6
                                        #               Child Loop BB2_25 Depth 7
                                        #                 Child Loop BB2_20 Depth 8
                                        #             Child Loop BB2_32 Depth 6
	movl	%r12d, 36(%rsp)         # 4-byte Spill
	movq	%rcx, 312(%rsp)         # 8-byte Spill
	tzcntl	%ecx, %eax
	movl	1728(%rsp,%rax,4), %ebx
	vmovd	64(%rsp,%rax,4), %xmm3  # xmm3 = mem[0],zero,zero,zero
	vbroadcastss	1856(%rsp,%rax,4), %ymm8
	vbroadcastss	1760(%rsp,%rax,4), %ymm11
	vbroadcastss	1920(%rsp,%rax,4), %ymm15
	vbroadcastss	1888(%rsp,%rax,4), %ymm10
	vbroadcastss	1824(%rsp,%rax,4), %ymm6
	vbroadcastss	1792(%rsp,%rax,4), %ymm0
	vbroadcastss	2016(%rsp,%rax,4), %xmm1
	vmovaps	%xmm1, 240(%rsp)        # 16-byte Spill
	vbroadcastss	1984(%rsp,%rax,4), %xmm1
	vmovaps	%xmm1, 464(%rsp)        # 16-byte Spill
	vbroadcastss	1952(%rsp,%rax,4), %xmm1
	vmovaps	%xmm1, 448(%rsp)        # 16-byte Spill
	vbroadcastss	2048(%rsp,%rax,4), %xmm1
	vmovaps	%xmm1, 960(%rsp)        # 16-byte Spill
	vbroadcastss	2080(%rsp,%rax,4), %xmm1
	vmovaps	%xmm1, 944(%rsp)        # 16-byte Spill
	vbroadcastss	2112(%rsp,%rax,4), %xmm1
	vmovaps	%xmm1, 928(%rsp)        # 16-byte Spill
	movslq	2240(%rsp,%rax,4), %r15
	movslq	2144(%rsp,%rax,4), %r14
	movslq	2272(%rsp,%rax,4), %rsi
	movslq	2176(%rsp,%rax,4), %rdx
	movslq	1696(%rsp,%rax,4), %r12
	movq	%rax, 304(%rsp)         # 8-byte Spill
	movslq	2208(%rsp,%rax,4), %r8
	movl	$0, 2560(%rsp)
	movl	$2139095039, 2816(%rsp) # imm = 0x7F7FFFFF
	vmovd	%ebx, %xmm5
	vpbroadcastd	%xmm3, %ymm12
	vpbroadcastd	%xmm5, %ymm13
	vpbroadcastd	%xmm5, %xmm1
	vmovdqa	%xmm1, 864(%rsp)        # 16-byte Spill
	xorl	%r10d, %r10d
	movl	%edi, %ecx
	vpbroadcastd	%xmm3, %xmm1
	vmovdqa	%xmm1, 848(%rsp)        # 16-byte Spill
	movq	%r15, 704(%rsp)         # 8-byte Spill
	movq	%rsi, 640(%rsp)         # 8-byte Spill
	movq	%rdx, 608(%rsp)         # 8-byte Spill
.LBB2_14:                               # %while_head1.rv.i.preheader.preheader
                                        #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_5 Depth=2
                                        #       Parent Loop BB2_9 Depth=3
                                        #         Parent Loop BB2_13 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB2_17 Depth 6
                                        #               Child Loop BB2_25 Depth 7
                                        #                 Child Loop BB2_20 Depth 8
                                        #             Child Loop BB2_32 Depth 6
	movl	%r10d, %r9d
	movl	%ecx, %r11d
	jmp	.LBB2_17
.LBB2_15:                               # %if_then37.rv.i
                                        #   in Loop: Header=BB2_17 Depth=6
	vmovd	%ebx, %xmm1
	movslq	%r9d, %r10
	movl	2560(%rsp,%r10,4), %ecx
	movl	2816(%rsp,%r10,4), %ebx
	addl	$-1, %r10d
	vucomiss	%xmm1, %xmm3
	ja	.LBB2_31
	jmp	.LBB2_30
.LBB2_16:                               # %break.rv.i15.break33.rv.i_crit_edge
                                        #   in Loop: Header=BB2_17 Depth=6
	leal	-1(%r9,%rax), %r10d
	movl	%ecx, %r11d
	jmp	.LBB2_29
	.p2align	4, 0x90
.LBB2_17:                               # %while_head1.rv.i.preheader
                                        #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_5 Depth=2
                                        #       Parent Loop BB2_9 Depth=3
                                        #         Parent Loop BB2_13 Depth=4
                                        #           Parent Loop BB2_14 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB2_25 Depth 7
                                        #                 Child Loop BB2_20 Depth 8
	testl	%r11d, %r11d
	jg	.LBB2_25
	jmp	.LBB2_15
.LBB2_19:                               # %if_then.rv.i.preheader
                                        #   in Loop: Header=BB2_25 Depth=7
	movslq	%r10d, %r13
	leaq	2820(%rsp), %rdx
	leaq	(%rdx,%r13,4), %rdx
	movq	%rdx, 384(%rsp)         # 8-byte Spill
	leaq	2564(%rsp), %rdx
	leaq	(%rdx,%r13,4), %rdx
	movq	%rdx, 320(%rsp)         # 8-byte Spill
	xorl	%edx, %edx
	movq	%rdx, 128(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB2_20:                               # %if_then.rv.i
                                        #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_5 Depth=2
                                        #       Parent Loop BB2_9 Depth=3
                                        #         Parent Loop BB2_13 Depth=4
                                        #           Parent Loop BB2_14 Depth=5
                                        #             Parent Loop BB2_17 Depth=6
                                        #               Parent Loop BB2_25 Depth=7
                                        # =>              This Inner Loop Header: Depth=8
	tzcntl	%eax, %edx
	movslq	192(%rdi,%rdx,4), %r11
	testq	%r11, %r11
	je	.LBB2_23
# BB#21:                                # %if_else24.rv.i
                                        #   in Loop: Header=BB2_20 Depth=8
	movq	%rdx, 416(%rsp)         # 8-byte Spill
	movl	%r11d, %edx
	notl	%edx
	movq	%r11, %r13
	movq	%r13, 96(%rsp)          # 8-byte Spill
	shlq	$8, 96(%rsp)            # 8-byte Folded Spill
	movslq	%edx, %rdx
	imulq	$208, %rdx, %r13
	addq	48(%rsp), %r13          # 8-byte Folded Reload
	testl	%r11d, %r11d
	movq	24(%rsp), %rdx          # 8-byte Reload
	movq	96(%rsp), %rsi          # 8-byte Reload
	leaq	-256(%rdx,%rsi), %rdx
	cmovsq	%r13, %rdx
	prefetcht0	(%rdx)
	prefetcht0	64(%rdx)
	prefetcht0	128(%rdx)
	prefetcht0	192(%rdx)
	leal	-1(%rax), %edx
	movl	%edx, 96(%rsp)          # 4-byte Spill
	movq	128(%rsp), %rdx         # 8-byte Reload
	movq	%r14, %rsi
	movq	320(%rsp), %r14         # 8-byte Reload
	movl	%ecx, (%r14,%rdx,4)
	movq	%rsi, %r14
	movq	704(%rsp), %r15         # 8-byte Reload
	movq	384(%rsp), %rcx         # 8-byte Reload
	movl	%ebx, (%rcx,%rdx,4)
	leaq	1(%rdx), %rdx
	movq	%rdx, 128(%rsp)         # 8-byte Spill
	vmovd	416(%rsp), %xmm1        # 4-byte Folded Reload
                                        # xmm1 = mem[0],zero,zero,zero
	vpermd	%ymm5, %ymm1, %ymm1
	vmovd	%xmm1, %ebx
	movl	96(%rsp), %ecx          # 4-byte Reload
	andl	%eax, %ecx
	movl	%ecx, %eax
	movl	%r11d, %ecx
	jne	.LBB2_20
# BB#22:                                # %while_head1.rv.i.backedge.loopexit
                                        #   in Loop: Header=BB2_25 Depth=7
	addl	128(%rsp), %r10d        # 4-byte Folded Reload
	movq	24(%rsp), %r13          # 8-byte Reload
	movq	640(%rsp), %rsi         # 8-byte Reload
	movq	608(%rsp), %rdx         # 8-byte Reload
	jmp	.LBB2_28
.LBB2_23:                               # %break.rv.i15
                                        #   in Loop: Header=BB2_25 Depth=7
	movq	128(%rsp), %rax         # 8-byte Reload
	testl	%eax, %eax
	movq	24(%rsp), %r13          # 8-byte Reload
	movq	640(%rsp), %rsi         # 8-byte Reload
	movq	608(%rsp), %rdx         # 8-byte Reload
	je	.LBB2_16
# BB#24:                                # %break.rv.i15.while_head1.rv.i.backedge_crit_edge
                                        #   in Loop: Header=BB2_25 Depth=7
	movl	%r10d, %r10d
	addq	%rax, %r10
	jmp	.LBB2_27
	.p2align	4, 0x90
.LBB2_25:                               # %while_body5.rv.i
                                        #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_5 Depth=2
                                        #       Parent Loop BB2_9 Depth=3
                                        #         Parent Loop BB2_13 Depth=4
                                        #           Parent Loop BB2_14 Depth=5
                                        #             Parent Loop BB2_17 Depth=6
                                        # =>            This Loop Header: Depth=7
                                        #                 Child Loop BB2_20 Depth 8
	vmovd	%ebx, %xmm5
	movslq	%r9d, %r10
	movl	2560(%rsp,%r10,4), %ecx
	movl	2816(%rsp,%r10,4), %ebx
	addl	$-1, %r10d
	vucomiss	%xmm5, %xmm3
	jbe	.LBB2_27
# BB#26:                                # %if_else.rv.i
                                        #   in Loop: Header=BB2_25 Depth=7
	movslq	%r11d, %rdi
	addq	$-1, %rdi
	shlq	$8, %rdi
	addq	%r13, %rdi
	vmovaps	(%rdx,%rdi), %ymm5
	vfmadd213ps	%ymm11, %ymm8, %ymm5
	vmovaps	(%r8,%rdi), %ymm7
	vfmadd213ps	%ymm6, %ymm15, %ymm7
	vmovaps	(%r12,%rdi), %ymm9
	vfmadd213ps	%ymm6, %ymm15, %ymm9
	vmovaps	(%rsi,%rdi), %ymm1
	vfmadd213ps	%ymm0, %ymm10, %ymm1
	vmovaps	(%r14,%rdi), %ymm2
	vfmadd213ps	%ymm0, %ymm10, %ymm2
	vmovaps	(%r15,%rdi), %ymm4
	vfmadd213ps	%ymm11, %ymm8, %ymm4
	vpminsd	%ymm12, %ymm5, %ymm14
	vpmaxsd	%ymm7, %ymm1, %ymm1
	vpminsd	%ymm2, %ymm9, %ymm2
	vpmaxsd	%ymm4, %ymm13, %ymm4
	vpmaxsd	%ymm1, %ymm4, %ymm5
	vpminsd	%ymm14, %ymm2, %ymm1
	vpcmpgtd	%ymm1, %ymm5, %ymm1
	vmovmskps	%ymm1, %eax
	xorl	$255, %eax
	jne	.LBB2_19
.LBB2_27:                               #   in Loop: Header=BB2_25 Depth=7
	movl	%ecx, %r11d
.LBB2_28:                               # %while_head1.rv.i.backedge
                                        #   in Loop: Header=BB2_25 Depth=7
	movl	%r10d, %r9d
	testl	%r11d, %r11d
	jg	.LBB2_25
.LBB2_29:                               # %break33.rv.i
                                        #   in Loop: Header=BB2_17 Depth=6
	movl	%r10d, %r9d
	movl	%r11d, %ecx
	testl	%r11d, %r11d
	js	.LBB2_15
.LBB2_30:                               # %while_head.rv.i1.backedge
                                        #   in Loop: Header=BB2_17 Depth=6
	movl	%r10d, %r9d
	movl	%ecx, %r11d
	testl	%ecx, %ecx
	jne	.LBB2_17
	jmp	.LBB2_37
	.p2align	4, 0x90
.LBB2_31:                               # %head.rv.i23.preheader
                                        #   in Loop: Header=BB2_14 Depth=5
	notl	%r11d
	movslq	%r11d, %rax
	imulq	$208, %rax, %r9
	addq	48(%rsp), %r9           # 8-byte Folded Reload
	.p2align	4, 0x90
.LBB2_32:                               # %while_head.rv.i.i
                                        #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_5 Depth=2
                                        #       Parent Loop BB2_9 Depth=3
                                        #         Parent Loop BB2_13 Depth=4
                                        #           Parent Loop BB2_14 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	vmovaps	144(%r9), %xmm4
	vmovaps	160(%r9), %xmm1
	vmovaps	176(%r9), %xmm2
	vmovaps	%xmm1, 384(%rsp)        # 16-byte Spill
	vmulps	464(%rsp), %xmm1, %xmm1 # 16-byte Folded Reload
	vmovaps	%xmm4, 320(%rsp)        # 16-byte Spill
	vfmadd231ps	240(%rsp), %xmm4, %xmm1 # 16-byte Folded Reload
	vmovaps	448(%rsp), %xmm4        # 16-byte Reload
	vmovaps	%xmm2, 416(%rsp)        # 16-byte Spill
	vfmadd231ps	%xmm2, %xmm4, %xmm1
	vmovaps	%xmm4, %xmm5
	vandps	.LCPI2_13(%rip), %xmm1, %xmm2
	vmovaps	%xmm2, 96(%rsp)         # 16-byte Spill
	vmovaps	(%r9), %xmm14
	vmovaps	16(%r9), %xmm9
	vmovaps	32(%r9), %xmm2
	vbroadcastss	.LCPI2_1(%rip), %xmm7
	vandps	%xmm7, %xmm1, %xmm1
	vmovaps	%xmm1, 128(%rsp)        # 16-byte Spill
	vsubps	960(%rsp), %xmm2, %xmm4 # 16-byte Folded Reload
	vsubps	944(%rsp), %xmm9, %xmm9 # 16-byte Folded Reload
	vsubps	928(%rsp), %xmm14, %xmm14 # 16-byte Folded Reload
	vmulps	240(%rsp), %xmm4, %xmm1 # 16-byte Folded Reload
	vmulps	%xmm9, %xmm5, %xmm2
	vmovaps	464(%rsp), %xmm5        # 16-byte Reload
	vmulps	%xmm14, %xmm5, %xmm7
	vmovaps	%xmm4, 912(%rsp)        # 16-byte Spill
	vfmsub231ps	%xmm4, %xmm5, %xmm2
	vmovaps	%xmm14, 880(%rsp)       # 16-byte Spill
	vfmsub231ps	448(%rsp), %xmm14, %xmm1 # 16-byte Folded Reload
	vmulps	112(%r9), %xmm1, %xmm5
	vmovaps	%xmm9, 896(%rsp)        # 16-byte Spill
	vfmsub231ps	240(%rsp), %xmm9, %xmm7 # 16-byte Folded Reload
	vmulps	64(%r9), %xmm1, %xmm1
	vfmadd231ps	96(%r9), %xmm2, %xmm5
	vfmadd231ps	48(%r9), %xmm2, %xmm1
	vfmadd231ps	128(%r9), %xmm7, %xmm5
	vfmadd231ps	80(%r9), %xmm7, %xmm1
	vmovaps	128(%rsp), %xmm2        # 16-byte Reload
	vxorps	%xmm5, %xmm2, %xmm14
	vmovaps	%xmm2, %xmm9
	vxorps	%xmm1, %xmm2, %xmm5
	vxorps	%xmm2, %xmm2, %xmm2
	vcmpleps	%xmm14, %xmm2, %xmm1
	vcmpleps	%xmm5, %xmm2, %xmm2
	vandps	%xmm1, %xmm2, %xmm4
	vmovaps	%xmm5, %xmm2
	vaddps	%xmm2, %xmm14, %xmm1
	vmovaps	96(%rsp), %xmm5         # 16-byte Reload
	vmovaps	%xmm5, %xmm7
	vcmpleps	%xmm5, %xmm1, %xmm5
	vptest	%xmm5, %xmm4
	jne	.LBB2_34
.LBB2_33:                               # %next.rv.i.i
                                        #   in Loop: Header=BB2_32 Depth=6
	cmpl	$0, 204(%r9)
	leaq	208(%r9), %r9
	jns	.LBB2_32
	jmp	.LBB2_36
.LBB2_34:                               # %if_else_crit.rv.i.i
                                        #   in Loop: Header=BB2_32 Depth=6
	vpand	%xmm5, %xmm4, %xmm4
	vmovaps	%xmm7, %xmm5
	vcmpneq_usps	.LCPI2_15, %xmm5, %xmm1
	vmovaps	%xmm1, 816(%rsp)        # 16-byte Spill
	vmovaps	%xmm2, 832(%rsp)        # 16-byte Spill
	vmovaps	880(%rsp), %xmm1        # 16-byte Reload
	vmulps	320(%rsp), %xmm1, %xmm2 # 16-byte Folded Reload
	vmovaps	896(%rsp), %xmm1        # 16-byte Reload
	vfmadd132ps	384(%rsp), %xmm2, %xmm1 # 16-byte Folded Reload
	vmovaps	912(%rsp), %xmm2        # 16-byte Reload
	vfmadd132ps	416(%rsp), %xmm1, %xmm2 # 16-byte Folded Reload
	vmulps	848(%rsp), %xmm5, %xmm1 # 16-byte Folded Reload
	vmulps	864(%rsp), %xmm5, %xmm5 # 16-byte Folded Reload
	vxorps	%xmm2, %xmm9, %xmm9
	vcmpleps	%xmm1, %xmm9, %xmm2
	vcmpleps	%xmm9, %xmm5, %xmm5
	vandps	816(%rsp), %xmm2, %xmm1 # 16-byte Folded Reload
	vmovaps	832(%rsp), %xmm2        # 16-byte Reload
	vandps	%xmm5, %xmm1, %xmm5
	vptest	%xmm5, %xmm4
	je	.LBB2_33
# BB#35:                                # %if_else_crit5.rv.i.i
                                        #   in Loop: Header=BB2_32 Depth=6
	vpand	%xmm4, %xmm5, %xmm1
	vmovmskps	%xmm1, %edi
	testl	%edi, %edi
	je	.LBB2_33
	jmp	.LBB2_12
	.p2align	4, 0x90
.LBB2_36:                               # %while_head.rv.i1.outer.loopexit
                                        #   in Loop: Header=BB2_14 Depth=5
	testl	%ecx, %ecx
	jne	.LBB2_14
	.p2align	4, 0x90
.LBB2_37:                               # %exit233.rv.i.thread
                                        #   in Loop: Header=BB2_13 Depth=4
	movl	36(%rsp), %r12d         # 4-byte Reload
.LBB2_38:                               # %next232.rv.i
                                        #   in Loop: Header=BB2_13 Depth=4
	movq	312(%rsp), %rcx         # 8-byte Reload
	leal	-1(%rcx), %eax
	andl	%ecx, %eax
	movl	%eax, %ecx
	movl	60(%rsp), %edi          # 4-byte Reload
	jne	.LBB2_13
	jmp	.LBB2_6
	.p2align	4, 0x90
.LBB2_39:                               # %while_head14.rv.i.preheader
                                        #   in Loop: Header=BB2_5 Depth=2
	testl	%edi, %edi
	movq	24(%rsp), %rdx          # 8-byte Reload
	jle	.LBB2_67
	.p2align	4, 0x90
.LBB2_40:                               # %while_body18.rv.i
                                        #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	%esi, %rcx
	movl	2304(%rsp,%rcx,4), %ebx
	movq	%rcx, %rax
	shlq	$5, %rax
	vmovaps	3072(%rsp,%rax), %ymm8
	addl	$-1, %ecx
	movslq	%edi, %r8
	addq	$-1, %r8
	shlq	$8, %r8
	movq	%rdx, %rdi
	movslq	192(%rdi,%r8), %rdx
	testq	%rdx, %rdx
	je	.LBB2_66
# BB#41:                                # %if_else21.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	vbroadcastss	(%rdi,%r8), %ymm0
	vfmsub213ps	%ymm15, %ymm2, %ymm0
	vbroadcastss	64(%rdi,%r8), %ymm3
	vmovaps	160(%rsp), %ymm11       # 32-byte Reload
	vfmsub213ps	%ymm11, %ymm4, %ymm3
	vbroadcastss	128(%rdi,%r8), %ymm5
	vmovaps	192(%rsp), %ymm7        # 32-byte Reload
	vfmsub213ps	%ymm7, %ymm9, %ymm5
	vbroadcastss	32(%rdi,%r8), %ymm6
	vfmsub213ps	%ymm15, %ymm2, %ymm6
	vbroadcastss	96(%rdi,%r8), %ymm10
	vfmsub213ps	%ymm11, %ymm4, %ymm10
	vbroadcastss	160(%rdi,%r8), %ymm11
	vpminsd	%ymm6, %ymm0, %ymm12
	vpmaxsd	%ymm0, %ymm6, %ymm0
	vfmsub213ps	%ymm7, %ymm9, %ymm11
	vpminsd	%ymm10, %ymm3, %ymm6
	vpmaxsd	%ymm3, %ymm10, %ymm3
	vpminsd	%ymm11, %ymm5, %ymm10
	vpmaxsd	%ymm5, %ymm11, %ymm5
	vpmaxsd	%ymm12, %ymm6, %ymm6
	vpminsd	%ymm3, %ymm0, %ymm3
	vpmaxsd	%ymm10, %ymm1, %ymm0
	vpminsd	64(%rsp), %ymm5, %ymm5
	vpmaxsd	%ymm6, %ymm0, %ymm0
	vpminsd	%ymm5, %ymm3, %ymm3
	vpcmpgtd	%ymm3, %ymm0, %ymm3
	vmovmskps	%ymm3, %eax
	xorl	%r9d, %r9d
	cmpl	$255, %eax
	je	.LBB2_43
# BB#42:                                # %if_then24.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	vpxor	%ymm13, %ymm3, %ymm3
	movl	%edx, %eax
	notl	%eax
	movq	%rdx, %rcx
	shlq	$8, %rcx
	cltq
	imulq	$208, %rax, %rax
	addq	%r10, %rax
	testl	%edx, %edx
	vblendvps	%ymm3, %ymm0, %ymm14, %ymm8
	leaq	-256(%rdi,%rcx), %rcx
	cmovsq	%rax, %rcx
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	prefetcht0	128(%rcx)
	prefetcht0	192(%rcx)
	movl	$1, %r9d
	movl	%edx, %ebx
	movl	%esi, %ecx
.LBB2_43:                               # %next28.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	movslq	196(%rdi,%r8), %rdx
	testq	%rdx, %rdx
	je	.LBB2_63
# BB#44:                                # %if_else31.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	vbroadcastss	4(%rdi,%r8), %ymm0
	vfmsub213ps	%ymm15, %ymm2, %ymm0
	vbroadcastss	68(%rdi,%r8), %ymm3
	vmovaps	160(%rsp), %ymm11       # 32-byte Reload
	vfmsub213ps	%ymm11, %ymm4, %ymm3
	vbroadcastss	132(%rdi,%r8), %ymm5
	vmovaps	192(%rsp), %ymm7        # 32-byte Reload
	vfmsub213ps	%ymm7, %ymm9, %ymm5
	vbroadcastss	36(%rdi,%r8), %ymm6
	vfmsub213ps	%ymm15, %ymm2, %ymm6
	vbroadcastss	100(%rdi,%r8), %ymm10
	vfmsub213ps	%ymm11, %ymm4, %ymm10
	vbroadcastss	164(%rdi,%r8), %ymm11
	vpminsd	%ymm6, %ymm0, %ymm12
	vpmaxsd	%ymm0, %ymm6, %ymm0
	vfmsub213ps	%ymm7, %ymm9, %ymm11
	vpminsd	%ymm10, %ymm3, %ymm6
	vpmaxsd	%ymm3, %ymm10, %ymm3
	vpminsd	%ymm11, %ymm5, %ymm10
	vpmaxsd	%ymm5, %ymm11, %ymm5
	vpmaxsd	%ymm12, %ymm6, %ymm6
	vpminsd	%ymm3, %ymm0, %ymm3
	vpmaxsd	%ymm10, %ymm1, %ymm0
	vpminsd	64(%rsp), %ymm5, %ymm5
	vpmaxsd	%ymm6, %ymm0, %ymm0
	vpminsd	%ymm5, %ymm3, %ymm3
	vpcmpgtd	%ymm3, %ymm0, %ymm3
	vmovmskps	%ymm3, %eax
	cmpl	$255, %eax
	je	.LBB2_46
# BB#45:                                # %if_then35.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	vpxor	%ymm13, %ymm3, %ymm3
	movq	%rdx, %rax
	shlq	$8, %rax
	movl	%edx, %esi
	notl	%esi
	movslq	%esi, %rsi
	imulq	$208, %rsi, %rsi
	addl	$1, %r9d
	addq	%r10, %rsi
	testl	%edx, %edx
	leaq	-256(%rdi,%rax), %rax
	cmovsq	%rsi, %rax
	movslq	%ecx, %rsi
	movl	%ebx, 2308(%rsp,%rsi,4)
	addq	$1, %rsi
	shlq	$5, %rsi
	vmovaps	%ymm8, 3072(%rsp,%rsi)
	vblendvps	%ymm3, %ymm0, %ymm14, %ymm8
	addl	$1, %ecx
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	movl	%edx, %ebx
.LBB2_46:                               # %next40.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	movslq	200(%rdi,%r8), %rdx
	testq	%rdx, %rdx
	je	.LBB2_63
# BB#47:                                # %if_else43.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	vbroadcastss	8(%rdi,%r8), %ymm0
	vfmsub213ps	%ymm15, %ymm2, %ymm0
	vbroadcastss	72(%rdi,%r8), %ymm3
	vmovaps	160(%rsp), %ymm11       # 32-byte Reload
	vfmsub213ps	%ymm11, %ymm4, %ymm3
	vbroadcastss	136(%rdi,%r8), %ymm5
	vmovaps	192(%rsp), %ymm7        # 32-byte Reload
	vfmsub213ps	%ymm7, %ymm9, %ymm5
	vbroadcastss	40(%rdi,%r8), %ymm6
	vfmsub213ps	%ymm15, %ymm2, %ymm6
	vbroadcastss	104(%rdi,%r8), %ymm10
	vfmsub213ps	%ymm11, %ymm4, %ymm10
	vbroadcastss	168(%rdi,%r8), %ymm11
	vpminsd	%ymm6, %ymm0, %ymm12
	vpmaxsd	%ymm0, %ymm6, %ymm0
	vfmsub213ps	%ymm7, %ymm9, %ymm11
	vpminsd	%ymm10, %ymm3, %ymm6
	vpmaxsd	%ymm3, %ymm10, %ymm3
	vpminsd	%ymm11, %ymm5, %ymm10
	vpmaxsd	%ymm5, %ymm11, %ymm5
	vpmaxsd	%ymm12, %ymm6, %ymm6
	vpminsd	%ymm3, %ymm0, %ymm3
	vpmaxsd	%ymm10, %ymm1, %ymm0
	vpminsd	64(%rsp), %ymm5, %ymm5
	vpmaxsd	%ymm6, %ymm0, %ymm0
	vpminsd	%ymm5, %ymm3, %ymm3
	vpcmpgtd	%ymm3, %ymm0, %ymm3
	vmovmskps	%ymm3, %eax
	cmpl	$255, %eax
	je	.LBB2_49
# BB#48:                                # %if_then47.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	vpxor	%ymm13, %ymm3, %ymm3
	movq	%rdx, %rax
	shlq	$8, %rax
	movl	%edx, %esi
	notl	%esi
	movslq	%esi, %rsi
	imulq	$208, %rsi, %rsi
	addl	$1, %r9d
	addq	%r10, %rsi
	testl	%edx, %edx
	leaq	-256(%rdi,%rax), %rax
	cmovsq	%rsi, %rax
	movslq	%ecx, %rsi
	movl	%ebx, 2308(%rsp,%rsi,4)
	addq	$1, %rsi
	shlq	$5, %rsi
	vmovaps	%ymm8, 3072(%rsp,%rsi)
	vblendvps	%ymm3, %ymm0, %ymm14, %ymm8
	addl	$1, %ecx
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	movl	%edx, %ebx
.LBB2_49:                               # %next52.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	movslq	204(%rdi,%r8), %rdx
	testq	%rdx, %rdx
	je	.LBB2_63
# BB#50:                                # %if_else55.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	vbroadcastss	12(%rdi,%r8), %ymm0
	vfmsub213ps	%ymm15, %ymm2, %ymm0
	vbroadcastss	76(%rdi,%r8), %ymm3
	vmovaps	160(%rsp), %ymm11       # 32-byte Reload
	vfmsub213ps	%ymm11, %ymm4, %ymm3
	vbroadcastss	140(%rdi,%r8), %ymm5
	vmovaps	192(%rsp), %ymm7        # 32-byte Reload
	vfmsub213ps	%ymm7, %ymm9, %ymm5
	vbroadcastss	44(%rdi,%r8), %ymm6
	vfmsub213ps	%ymm15, %ymm2, %ymm6
	vbroadcastss	108(%rdi,%r8), %ymm10
	vfmsub213ps	%ymm11, %ymm4, %ymm10
	vbroadcastss	172(%rdi,%r8), %ymm11
	vpminsd	%ymm6, %ymm0, %ymm12
	vpmaxsd	%ymm0, %ymm6, %ymm0
	vfmsub213ps	%ymm7, %ymm9, %ymm11
	vpminsd	%ymm10, %ymm3, %ymm6
	vpmaxsd	%ymm3, %ymm10, %ymm3
	vpminsd	%ymm11, %ymm5, %ymm10
	vpmaxsd	%ymm5, %ymm11, %ymm5
	vpmaxsd	%ymm12, %ymm6, %ymm6
	vpminsd	%ymm3, %ymm0, %ymm3
	vpmaxsd	%ymm10, %ymm1, %ymm0
	vpminsd	64(%rsp), %ymm5, %ymm5
	vpmaxsd	%ymm6, %ymm0, %ymm0
	vpminsd	%ymm5, %ymm3, %ymm3
	vpcmpgtd	%ymm3, %ymm0, %ymm3
	vmovmskps	%ymm3, %eax
	cmpl	$255, %eax
	je	.LBB2_52
# BB#51:                                # %if_then59.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	vpxor	%ymm13, %ymm3, %ymm3
	movl	%edx, %eax
	notl	%eax
	movq	%rdx, %rsi
	shlq	$8, %rsi
	cltq
	imulq	$208, %rax, %rax
	addl	$1, %r9d
	addq	%r10, %rax
	testl	%edx, %edx
	leaq	-256(%rdi,%rsi), %rsi
	cmovsq	%rax, %rsi
	movslq	%ecx, %rax
	movl	%ebx, 2308(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm8, 3072(%rsp,%rax)
	vblendvps	%ymm3, %ymm0, %ymm14, %ymm8
	addl	$1, %ecx
	prefetcht0	(%rsi)
	prefetcht0	64(%rsi)
	prefetcht0	128(%rsi)
	prefetcht0	192(%rsi)
	movl	%edx, %ebx
.LBB2_52:                               # %next64.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	movslq	208(%rdi,%r8), %rdx
	testq	%rdx, %rdx
	je	.LBB2_63
# BB#53:                                # %if_else67.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	vbroadcastss	16(%rdi,%r8), %ymm0
	vfmsub213ps	%ymm15, %ymm2, %ymm0
	vbroadcastss	80(%rdi,%r8), %ymm3
	vmovaps	160(%rsp), %ymm11       # 32-byte Reload
	vfmsub213ps	%ymm11, %ymm4, %ymm3
	vbroadcastss	144(%rdi,%r8), %ymm5
	vmovaps	192(%rsp), %ymm7        # 32-byte Reload
	vfmsub213ps	%ymm7, %ymm9, %ymm5
	vbroadcastss	48(%rdi,%r8), %ymm6
	vfmsub213ps	%ymm15, %ymm2, %ymm6
	vbroadcastss	112(%rdi,%r8), %ymm10
	vfmsub213ps	%ymm11, %ymm4, %ymm10
	vbroadcastss	176(%rdi,%r8), %ymm11
	vpminsd	%ymm6, %ymm0, %ymm12
	vpmaxsd	%ymm0, %ymm6, %ymm0
	vfmsub213ps	%ymm7, %ymm9, %ymm11
	vpminsd	%ymm10, %ymm3, %ymm6
	vpmaxsd	%ymm3, %ymm10, %ymm3
	vpminsd	%ymm11, %ymm5, %ymm10
	vpmaxsd	%ymm5, %ymm11, %ymm5
	vpmaxsd	%ymm12, %ymm6, %ymm6
	vpminsd	%ymm3, %ymm0, %ymm3
	vpmaxsd	%ymm10, %ymm1, %ymm0
	vpminsd	64(%rsp), %ymm5, %ymm5
	vpmaxsd	%ymm6, %ymm0, %ymm0
	vpminsd	%ymm5, %ymm3, %ymm3
	vpcmpgtd	%ymm3, %ymm0, %ymm3
	vmovmskps	%ymm3, %eax
	cmpl	$255, %eax
	je	.LBB2_55
# BB#54:                                # %if_then71.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	vpxor	%ymm13, %ymm3, %ymm3
	movq	%rdx, %rax
	shlq	$8, %rax
	movl	%edx, %esi
	notl	%esi
	movslq	%esi, %rsi
	imulq	$208, %rsi, %rsi
	addl	$1, %r9d
	addq	%r10, %rsi
	testl	%edx, %edx
	leaq	-256(%rdi,%rax), %rax
	cmovsq	%rsi, %rax
	movslq	%ecx, %rsi
	movl	%ebx, 2308(%rsp,%rsi,4)
	addq	$1, %rsi
	shlq	$5, %rsi
	vmovaps	%ymm8, 3072(%rsp,%rsi)
	vblendvps	%ymm3, %ymm0, %ymm14, %ymm8
	addl	$1, %ecx
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	movl	%edx, %ebx
.LBB2_55:                               # %next76.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	movslq	212(%rdi,%r8), %rdx
	testq	%rdx, %rdx
	je	.LBB2_63
# BB#56:                                # %if_else79.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	vbroadcastss	20(%rdi,%r8), %ymm0
	vfmsub213ps	%ymm15, %ymm2, %ymm0
	vbroadcastss	84(%rdi,%r8), %ymm3
	vmovaps	160(%rsp), %ymm11       # 32-byte Reload
	vfmsub213ps	%ymm11, %ymm4, %ymm3
	vbroadcastss	148(%rdi,%r8), %ymm5
	vmovaps	192(%rsp), %ymm7        # 32-byte Reload
	vfmsub213ps	%ymm7, %ymm9, %ymm5
	vbroadcastss	52(%rdi,%r8), %ymm6
	vfmsub213ps	%ymm15, %ymm2, %ymm6
	vbroadcastss	116(%rdi,%r8), %ymm10
	vfmsub213ps	%ymm11, %ymm4, %ymm10
	vbroadcastss	180(%rdi,%r8), %ymm11
	vpminsd	%ymm6, %ymm0, %ymm12
	vpmaxsd	%ymm0, %ymm6, %ymm0
	vfmsub213ps	%ymm7, %ymm9, %ymm11
	vpminsd	%ymm10, %ymm3, %ymm6
	vpmaxsd	%ymm3, %ymm10, %ymm3
	vpminsd	%ymm11, %ymm5, %ymm10
	vpmaxsd	%ymm5, %ymm11, %ymm5
	vpmaxsd	%ymm12, %ymm6, %ymm6
	vpminsd	%ymm3, %ymm0, %ymm3
	vpmaxsd	%ymm10, %ymm1, %ymm0
	vpminsd	64(%rsp), %ymm5, %ymm5
	vpmaxsd	%ymm6, %ymm0, %ymm0
	vpminsd	%ymm5, %ymm3, %ymm3
	vpcmpgtd	%ymm3, %ymm0, %ymm3
	vmovmskps	%ymm3, %eax
	cmpl	$255, %eax
	je	.LBB2_58
# BB#57:                                # %if_then83.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	vpxor	%ymm13, %ymm3, %ymm3
	movq	%rdx, %rax
	shlq	$8, %rax
	movl	%edx, %esi
	notl	%esi
	movslq	%esi, %rsi
	imulq	$208, %rsi, %rsi
	addl	$1, %r9d
	addq	%r10, %rsi
	testl	%edx, %edx
	leaq	-256(%rdi,%rax), %rax
	cmovsq	%rsi, %rax
	movslq	%ecx, %rsi
	movl	%ebx, 2308(%rsp,%rsi,4)
	addq	$1, %rsi
	shlq	$5, %rsi
	vmovaps	%ymm8, 3072(%rsp,%rsi)
	vblendvps	%ymm3, %ymm0, %ymm14, %ymm8
	addl	$1, %ecx
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	movl	%edx, %ebx
.LBB2_58:                               # %next88.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	movslq	216(%rdi,%r8), %rdx
	testq	%rdx, %rdx
	je	.LBB2_63
# BB#59:                                # %if_else91.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	vbroadcastss	24(%rdi,%r8), %ymm0
	vfmsub213ps	%ymm15, %ymm2, %ymm0
	vbroadcastss	88(%rdi,%r8), %ymm3
	vmovaps	160(%rsp), %ymm11       # 32-byte Reload
	vfmsub213ps	%ymm11, %ymm4, %ymm3
	vbroadcastss	152(%rdi,%r8), %ymm5
	vmovaps	192(%rsp), %ymm7        # 32-byte Reload
	vfmsub213ps	%ymm7, %ymm9, %ymm5
	vbroadcastss	56(%rdi,%r8), %ymm6
	vfmsub213ps	%ymm15, %ymm2, %ymm6
	vbroadcastss	120(%rdi,%r8), %ymm10
	vfmsub213ps	%ymm11, %ymm4, %ymm10
	vbroadcastss	184(%rdi,%r8), %ymm11
	vpminsd	%ymm6, %ymm0, %ymm12
	vpmaxsd	%ymm0, %ymm6, %ymm0
	vfmsub213ps	%ymm7, %ymm9, %ymm11
	vpminsd	%ymm10, %ymm3, %ymm6
	vpmaxsd	%ymm3, %ymm10, %ymm3
	vpminsd	%ymm11, %ymm5, %ymm10
	vpmaxsd	%ymm5, %ymm11, %ymm5
	vpmaxsd	%ymm12, %ymm6, %ymm6
	vpminsd	%ymm3, %ymm0, %ymm3
	vpmaxsd	%ymm10, %ymm1, %ymm0
	vpminsd	64(%rsp), %ymm5, %ymm5
	vpmaxsd	%ymm6, %ymm0, %ymm0
	vpminsd	%ymm5, %ymm3, %ymm3
	vpcmpgtd	%ymm3, %ymm0, %ymm3
	vmovmskps	%ymm3, %eax
	cmpl	$255, %eax
	je	.LBB2_61
# BB#60:                                # %if_then95.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	vpxor	%ymm13, %ymm3, %ymm3
	movq	%rdx, %rax
	shlq	$8, %rax
	movl	%edx, %esi
	notl	%esi
	movslq	%esi, %rsi
	imulq	$208, %rsi, %rsi
	addq	%r10, %rsi
	testl	%edx, %edx
	leaq	-256(%rdi,%rax), %rax
	cmovsq	%rsi, %rax
	movslq	%ecx, %rsi
	movl	%ebx, 2308(%rsp,%rsi,4)
	addq	$1, %rsi
	shlq	$5, %rsi
	vmovaps	%ymm8, 3072(%rsp,%rsi)
	vblendvps	%ymm3, %ymm0, %ymm14, %ymm8
	addl	$1, %r9d
	addl	$1, %ecx
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	movl	%edx, %ebx
.LBB2_61:                               # %next100.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	movslq	220(%rdi,%r8), %rdx
	testq	%rdx, %rdx
	je	.LBB2_63
# BB#62:                                # %if_else103.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	vbroadcastss	28(%rdi,%r8), %ymm0
	vfmsub213ps	%ymm15, %ymm2, %ymm0
	vbroadcastss	92(%rdi,%r8), %ymm3
	vmovaps	160(%rsp), %ymm11       # 32-byte Reload
	vfmsub213ps	%ymm11, %ymm4, %ymm3
	vbroadcastss	156(%rdi,%r8), %ymm5
	vmovaps	192(%rsp), %ymm7        # 32-byte Reload
	vfmsub213ps	%ymm7, %ymm9, %ymm5
	vbroadcastss	60(%rdi,%r8), %ymm6
	vfmsub213ps	%ymm15, %ymm2, %ymm6
	vbroadcastss	124(%rdi,%r8), %ymm10
	vfmsub213ps	%ymm11, %ymm4, %ymm10
	vbroadcastss	188(%rdi,%r8), %ymm11
	vpminsd	%ymm6, %ymm0, %ymm12
	vpmaxsd	%ymm0, %ymm6, %ymm0
	vfmsub213ps	%ymm7, %ymm9, %ymm11
	vpminsd	%ymm10, %ymm3, %ymm6
	vpmaxsd	%ymm3, %ymm10, %ymm3
	vpminsd	%ymm11, %ymm5, %ymm10
	vpmaxsd	%ymm5, %ymm11, %ymm5
	vpmaxsd	%ymm12, %ymm6, %ymm6
	vpminsd	%ymm3, %ymm0, %ymm3
	vpmaxsd	%ymm10, %ymm1, %ymm0
	vpminsd	64(%rsp), %ymm5, %ymm5
	vpmaxsd	%ymm6, %ymm0, %ymm0
	vpminsd	%ymm5, %ymm3, %ymm3
	vpcmpgtd	%ymm3, %ymm0, %ymm3
	vmovmskps	%ymm3, %eax
	cmpl	$255, %eax
	jne	.LBB2_64
.LBB2_63:                               # %unlikely_cont_cascading_cascading.rv.i
                                        #   in Loop: Header=BB2_40 Depth=3
	testl	%r9d, %r9d
	movq	24(%rsp), %rdx          # 8-byte Reload
	jne	.LBB2_65
	jmp	.LBB2_66
	.p2align	4, 0x90
.LBB2_64:                               # %unlikely_cont_cascading_cascading.rv.i.thread1
                                        #   in Loop: Header=BB2_40 Depth=3
	vpxor	%ymm13, %ymm3, %ymm3
	movq	%rdx, %rax
	movl	%edx, %esi
	notl	%esi
	movslq	%esi, %rsi
	imulq	$208, %rsi, %rsi
	shlq	$8, %rax
	addq	%r10, %rsi
	testl	%edx, %edx
	leaq	-256(%rdi,%rax), %rax
	cmovsq	%rsi, %rax
	movslq	%ecx, %rsi
	movl	%ebx, 2308(%rsp,%rsi,4)
	addq	$1, %rsi
	shlq	$5, %rsi
	vmovaps	%ymm8, 3072(%rsp,%rsi)
	vblendvps	%ymm3, %ymm0, %ymm14, %ymm8
	addl	$1, %ecx
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	movl	%edx, %ebx
	movq	%rdi, %rdx
.LBB2_65:                               # %while_head14.rv.i.backedge
                                        #   in Loop: Header=BB2_40 Depth=3
	movl	%ecx, %esi
	movl	%ebx, %edi
	testl	%ebx, %ebx
	jg	.LBB2_40
.LBB2_66:                               # %break127.rv.i
                                        #   in Loop: Header=BB2_5 Depth=2
	movl	%ebx, %edi
	testl	%ebx, %ebx
	jns	.LBB2_4
	jmp	.LBB2_68
.LBB2_67:                               #   in Loop: Header=BB2_5 Depth=2
	movl	%esi, %ecx
	movl	%edi, %ebx
.LBB2_68:                               # %if_then131.rv.i
                                        #   in Loop: Header=BB2_5 Depth=2
	notl	%ebx
	movslq	%ecx, %rcx
	movl	2304(%rsp,%rcx,4), %edi
	movq	%rcx, %rax
	shlq	$5, %rax
	vmovaps	3072(%rsp,%rax), %ymm0
	vmovaps	%ymm0, 320(%rsp)        # 32-byte Spill
	addl	$-1, %ecx
	movslq	%ebx, %r8
	imulq	$208, %r8, %rbx
	addq	%r11, %rbx
.LBB2_69:                               # %while_head132.rv.i
                                        #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB2_70 Depth 4
	movq	%rbx, %rsi
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB2_70:                               # %if_then138.rv.i
                                        #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_5 Depth=2
                                        #       Parent Loop BB2_69 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	(%rsi), %eax
	vmovd	%eax, %xmm0
	vpbroadcastd	%xmm0, %ymm0
	cmpl	$-1, %eax
	je	.LBB2_3
# BB#71:                                # %if_else139.rv.i
                                        #   in Loop: Header=BB2_70 Depth=4
	vmovdqa	%ymm0, 128(%rsp)        # 32-byte Spill
	vmovaps	64(%rsp), %ymm5
	vbroadcastss	-48(%rsi), %ymm3
	vbroadcastss	-32(%rsi), %ymm0
	vmovaps	1632(%rsp), %ymm2       # 32-byte Reload
	vmovaps	%ymm0, 384(%rsp)        # 32-byte Spill
	vmulps	%ymm0, %ymm2, %ymm0
	vmovaps	1664(%rsp), %ymm1       # 32-byte Reload
	vmovaps	%ymm3, 96(%rsp)         # 32-byte Spill
	vfmadd231ps	%ymm3, %ymm1, %ymm0
	vbroadcastss	-16(%rsi), %ymm7
	vmovaps	1600(%rsp), %ymm4       # 32-byte Reload
	vfmadd231ps	%ymm7, %ymm4, %ymm0
	vbroadcastss	-64(%rsi), %ymm3
	vbroadcastss	-80(%rsi), %ymm13
	vbroadcastss	-96(%rsi), %ymm15
	vbroadcastss	-192(%rsi), %ymm6
	vbroadcastss	-176(%rsi), %ymm10
	vbroadcastss	-160(%rsi), %ymm11
	vmovaps	%ymm5, 416(%rsp)        # 32-byte Spill
	vcmpltps	%ymm5, %ymm8, %ymm5
	vandps	1056(%rsp), %ymm0, %ymm9 # 32-byte Folded Reload
	vsubps	1088(%rsp), %ymm11, %ymm14 # 32-byte Folded Reload
	vsubps	1120(%rsp), %ymm10, %ymm10 # 32-byte Folded Reload
	vsubps	1152(%rsp), %ymm6, %ymm6 # 32-byte Folded Reload
	vmulps	%ymm14, %ymm1, %ymm12
	vmulps	%ymm10, %ymm4, %ymm11
	vfmsub231ps	%ymm14, %ymm2, %ymm11
	vfmsub231ps	%ymm6, %ymm4, %ymm12
	vmulps	%ymm12, %ymm13, %ymm13
	vfmadd213ps	%ymm13, %ymm11, %ymm15
	vmulps	%ymm6, %ymm2, %ymm13
	vfmsub231ps	%ymm10, %ymm1, %ymm13
	vfmadd213ps	%ymm15, %ymm13, %ymm3
	vxorps	%ymm3, %ymm9, %ymm2
	vxorps	%ymm1, %ymm1, %ymm1
	vcmpleps	%ymm2, %ymm1, %ymm3
	xorl	%eax, %eax
	vptest	%ymm3, %ymm5
	jne	.LBB2_75
.LBB2_72:                               #   in Loop: Header=BB2_70 Depth=4
	vpcmpeqd	%ymm13, %ymm13, %ymm13
	vmovaps	544(%rsp), %ymm14       # 32-byte Reload
	vmovaps	576(%rsp), %ymm15       # 32-byte Reload
.LBB2_73:                               # %rv_ballot_cont_cascading_cascading.rv.i
                                        #   in Loop: Header=BB2_70 Depth=4
	andnl	%r12d, %eax, %r12d
	je	.LBB2_80
.LBB2_74:                               # %range_step.rv.i
                                        #   in Loop: Header=BB2_70 Depth=4
	addq	$1, %rdx
	addq	$4, %rsi
	cmpq	$4, %rdx
	jl	.LBB2_70
	jmp	.LBB2_79
.LBB2_75:                               # %if_else_crit142.rv.i
                                        #   in Loop: Header=BB2_70 Depth=4
	vmovaps	96(%rsp), %ymm4         # 32-byte Reload
	vmovaps	%ymm14, 640(%rsp)       # 32-byte Spill
	vmovaps	%ymm7, 704(%rsp)        # 32-byte Spill
	vpand	%ymm5, %ymm3, %ymm14
	vbroadcastss	-112(%rsi), %ymm3
	vbroadcastss	-144(%rsi), %ymm15
	vbroadcastss	-128(%rsi), %ymm5
	vmulps	%ymm5, %ymm12, %ymm5
	vfmadd231ps	%ymm15, %ymm11, %ymm5
	vfmadd231ps	%ymm3, %ymm13, %ymm5
	vxorps	%ymm5, %ymm9, %ymm13
	vxorps	%ymm1, %ymm1, %ymm1
	vcmpleps	%ymm13, %ymm1, %ymm11
	vptest	%ymm11, %ymm14
	je	.LBB2_72
# BB#76:                                # %if_else_crit147.rv.i
                                        #   in Loop: Header=BB2_70 Depth=4
	vmovaps	%ymm2, %ymm12
	vmovaps	%ymm4, %ymm2
	vbroadcastsd	.LCPI2_10(%rip), %ymm3
	vandps	%ymm3, %ymm0, %ymm0
	vpand	%ymm14, %ymm11, %ymm5
	vaddps	%ymm13, %ymm12, %ymm3
	vcmpleps	%ymm0, %ymm3, %ymm3
	vptest	%ymm3, %ymm5
	vmovaps	%ymm13, %ymm4
	vpcmpeqd	%ymm13, %ymm13, %ymm13
	vmovaps	544(%rsp), %ymm14       # 32-byte Reload
	vmovaps	352(%rsp), %ymm1        # 32-byte Reload
	vmovaps	576(%rsp), %ymm15       # 32-byte Reload
	je	.LBB2_73
# BB#77:                                # %if_else_crit152.rv.i
                                        #   in Loop: Header=BB2_70 Depth=4
	vmovaps	%ymm12, 608(%rsp)       # 32-byte Spill
	vpand	%ymm5, %ymm3, %ymm5
	vmulps	%ymm0, %ymm1, %ymm3
	vmulps	384(%rsp), %ymm10, %ymm10 # 32-byte Folded Reload
	vcmpneq_usps	.LCPI2_14, %ymm0, %ymm11
	vmulps	416(%rsp), %ymm0, %ymm12 # 32-byte Folded Reload
	vfmadd213ps	%ymm10, %ymm2, %ymm6
	vmovaps	640(%rsp), %ymm1        # 32-byte Reload
	vfmadd132ps	704(%rsp), %ymm6, %ymm1 # 32-byte Folded Reload
	vxorps	%ymm1, %ymm9, %ymm6
	vcmpleps	%ymm12, %ymm6, %ymm10
	vcmpleps	%ymm6, %ymm3, %ymm3
	vandps	%ymm11, %ymm10, %ymm10
	vandps	%ymm3, %ymm10, %ymm10
	vptest	%ymm10, %ymm5
	je	.LBB2_73
# BB#78:                                # %if_else_crit157.rv.i
                                        #   in Loop: Header=BB2_70 Depth=4
	vpand	%ymm5, %ymm10, %ymm3
	vpbroadcastd	.LCPI2_11(%rip), %ymm5
	vpand	128(%rsp), %ymm5, %ymm5 # 32-byte Folded Reload
	vrcpps	%ymm0, %ymm10
	vmovaps	1024(%rsp), %ymm1       # 32-byte Reload
	vfnmadd213ps	%ymm1, %ymm10, %ymm0
	vfmadd132ps	%ymm10, %ymm10, %ymm0
	vblendvps	%ymm3, %ymm0, %ymm1, %ymm0
	vmulps	%ymm0, %ymm6, %ymm6
	vmulps	608(%rsp), %ymm0, %ymm10 # 32-byte Folded Reload
	vmulps	%ymm0, %ymm4, %ymm0
	vpcmpeqd	.LCPI2_14, %ymm3, %ymm11
	vpxor	%ymm13, %ymm11, %ymm11
	vmaskmovps	%ymm6, %ymm11, 768(%rsp)
	vmaskmovps	%ymm10, %ymm11, 1280(%rsp)
	vmaskmovps	%ymm0, %ymm11, 1248(%rsp)
	vpmaskmovd	%ymm5, %ymm11, 736(%rsp)
	vpmaskmovd	%ymm0, %ymm11, 1216(%rsp)
	vbroadcastss	.LCPI2_12(%rip), %ymm0
	vmaskmovps	%ymm0, %ymm11, 64(%rsp)
	vmovmskps	%ymm3, %eax
	andnl	%r12d, %eax, %r12d
	jne	.LBB2_74
	jmp	.LBB2_80
	.p2align	4, 0x90
.LBB2_79:                               # %if_else135.rv.i
                                        #   in Loop: Header=BB2_69 Depth=3
	imulq	$208, %r8, %rax
	addq	$1, %r8
	addq	$208, %rbx
	cmpl	$0, 204(%r10,%rax)
	jns	.LBB2_69
	jmp	.LBB2_3
	.p2align	4, 0x90
.LBB2_80:                               # %exit
                                        #   in Loop: Header=BB2_2 Depth=1
	vmovaps	768(%rsp), %ymm0
	vmovaps	1280(%rsp), %ymm1
	vmovaps	1248(%rsp), %ymm2
	vmovaps	736(%rsp), %ymm3
	movq	%r14, %rax
	shlq	$7, %rax
	movq	272(%rsp), %rcx         # 8-byte Reload
	vmovups	%ymm3, (%rcx,%rax)
	vmovups	%ymm0, 32(%rcx,%rax)
	vmovups	%ymm1, 64(%rcx,%rax)
	vmovups	%ymm2, 96(%rcx,%rax)
	movq	%r15, %rsp
	addq	$1, %r14
	cmpq	40(%rsp), %r14          # 8-byte Folded Reload
	jl	.LBB2_2
.LBB2_81:                               # %if_else
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.Lfunc_end2:
	.size	cpu_occluded_bvh8_tri4_hybrid8_avx2, .Lfunc_end2-cpu_occluded_bvh8_tri4_hybrid8_avx2

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI3_0:
	.long	1065353216              # float 1
.LCPI3_1:
	.long	2147483648              # float -0
.LCPI3_2:
	.long	841731191               # float 9.99999993E-9
.LCPI3_3:
	.long	2139095039              # float 3.40282347E+38
.LCPI3_5:
	.long	4286578687              # float -3.40282347E+38
.LCPI3_6:
	.long	2147483647              # 0x7fffffff
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI3_4:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5
.LCPI3_7:
	.zero	32
.LCPI3_8:
	.zero	32,255
	.text
	.globl	cpu_occluded_bvh8_tri4_packet8_avx2
	.p2align	4, 0x90
	.type	cpu_occluded_bvh8_tri4_packet8_avx2,@function
cpu_occluded_bvh8_tri4_packet8_avx2:    # @cpu_occluded_bvh8_tri4_packet8_avx2
# BB#0:                                 # %cpu_occluded_bvh8_tri4_packet8_avx2_start
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$3424, %rsp             # imm = 0xD60
                                        # kill: %ECX<def> %ECX<kill> %RCX<def>
	movq	%rdx, 80(%rsp)          # 8-byte Spill
	movq	%rsi, %rdx
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	cmpl	$8, %ecx
	jl	.LBB3_51
# BB#1:                                 # %head.preheader.lr.ph
	movq	(%rdi), %r9
	movq	8(%rdi), %r11
	movq	24(%rsp), %rax          # 8-byte Reload
	shrl	$3, %eax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	leaq	192(%r11), %rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	xorl	%esi, %esi
	vbroadcastss	.LCPI3_0(%rip), %ymm0
	vmovaps	%ymm0, 416(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI3_1(%rip), %ymm0
	vmovaps	%ymm0, 736(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI3_2(%rip), %ymm0
	vmovaps	%ymm0, 704(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI3_1(%rip), %ymm0
	vmovaps	%ymm0, 512(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI3_2(%rip), %ymm0
	vmovaps	%ymm0, 672(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI3_3(%rip), %ymm6
                                        # implicit-def: %YMM0
	vmovaps	%ymm0, 192(%rsp)        # 32-byte Spill
                                        # implicit-def: %YMM0
	vmovaps	%ymm0, 160(%rsp)        # 32-byte Spill
	.p2align	4, 0x90
.LBB3_2:                                # %body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_4 Depth 2
                                        #       Child Loop BB3_6 Depth 3
                                        #       Child Loop BB3_10 Depth 3
                                        #       Child Loop BB3_38 Depth 3
                                        #         Child Loop BB3_39 Depth 4
	movq	%rsi, %rcx
	shlq	$8, %rcx
	vmovups	(%rdx,%rcx), %ymm0
	vmovaps	%ymm0, 576(%rsp)        # 32-byte Spill
	vmovups	32(%rdx,%rcx), %ymm0
	vmovaps	%ymm0, 544(%rsp)        # 32-byte Spill
	vmovups	64(%rdx,%rcx), %ymm15
	vmovups	96(%rdx,%rcx), %ymm11
	vrcpps	%ymm11, %ymm0
	vmovaps	%ymm0, %ymm1
	vmovaps	416(%rsp), %ymm10       # 32-byte Reload
	vfnmadd213ps	%ymm10, %ymm11, %ymm1
	vfmadd132ps	%ymm0, %ymm0, %ymm1
	vmovaps	736(%rsp), %ymm12       # 32-byte Reload
	vxorps	%ymm12, %ymm11, %ymm0
	vxorps	%ymm2, %ymm2, %ymm2
	vcmpltps	%ymm11, %ymm2, %ymm2
	vmovups	128(%rdx,%rcx), %ymm3
	vrcpps	%ymm3, %ymm9
	vmovaps	%ymm9, %ymm4
	vfnmadd213ps	%ymm10, %ymm3, %ymm4
	vfmadd132ps	%ymm9, %ymm9, %ymm4
	vblendvps	%ymm2, %ymm11, %ymm0, %ymm0
	vmovups	160(%rdx,%rcx), %ymm5
	vrcpps	%ymm5, %ymm2
	vmovaps	%ymm2, %ymm7
	vfnmadd213ps	%ymm10, %ymm5, %ymm7
	vfmadd132ps	%ymm2, %ymm2, %ymm7
	vmovups	192(%rdx,%rcx), %ymm9
	vmovdqu	224(%rdx,%rcx), %ymm13
	vmovaps	704(%rsp), %ymm8        # 32-byte Reload
	vcmpnlt_uqps	%ymm8, %ymm0, %ymm0
	vmovaps	512(%rsp), %ymm10       # 32-byte Reload
	vmovaps	%ymm11, 352(%rsp)       # 32-byte Spill
	vandps	%ymm10, %ymm11, %ymm2
	vmovaps	672(%rsp), %ymm11       # 32-byte Reload
	vorps	%ymm11, %ymm2, %ymm2
	vblendvps	%ymm0, %ymm1, %ymm2, %ymm0
	vxorps	%ymm14, %ymm14, %ymm14
	vcmpltps	%ymm3, %ymm14, %ymm1
	vxorps	%ymm12, %ymm3, %ymm2
	vblendvps	%ymm1, %ymm3, %ymm2, %ymm1
	vcmpnlt_uqps	%ymm8, %ymm1, %ymm1
	vmovaps	%ymm3, 320(%rsp)        # 32-byte Spill
	vandps	%ymm10, %ymm3, %ymm2
	vorps	%ymm11, %ymm2, %ymm2
	vblendvps	%ymm1, %ymm4, %ymm2, %ymm1
	vcmpltps	%ymm5, %ymm14, %ymm2
	vxorps	%ymm12, %ymm5, %ymm4
	vblendvps	%ymm2, %ymm5, %ymm4, %ymm2
	vcmpnlt_uqps	%ymm8, %ymm2, %ymm2
	vmovaps	%ymm5, 1024(%rsp)       # 32-byte Spill
	vandps	%ymm10, %ymm5, %ymm4
	vorps	%ymm11, %ymm4, %ymm4
	vblendvps	%ymm2, %ymm7, %ymm4, %ymm3
	vmulps	576(%rsp), %ymm0, %ymm5 # 32-byte Folded Reload
	vmulps	544(%rsp), %ymm1, %ymm11 # 32-byte Folded Reload
	vmovaps	%ymm15, 1056(%rsp)      # 32-byte Spill
	vmulps	%ymm3, %ymm15, %ymm2
	vmovdqa	%ymm13, 224(%rsp)       # 32-byte Spill
	vmovdqa	%ymm13, 32(%rsp)
	movl	$0, 1088(%rsp)
	vmovaps	%ymm6, 1344(%rsp)
	movl	$1, %ebx
	movl	$255, %r10d
	vpcmpeqd	%ymm4, %ymm4, %ymm4
	vmovdqa	%ymm4, 384(%rsp)        # 32-byte Spill
	vpcmpeqd	%ymm4, %ymm4, %ymm4
	vmovdqa	%ymm4, 448(%rsp)        # 32-byte Spill
	xorl	%r12d, %r12d
	vmovaps	%ymm9, %ymm4
	testl	%ebx, %ebx
	jne	.LBB3_4
	jmp	.LBB3_50
.LBB3_43:                               #   in Loop: Header=BB3_4 Depth=2
	vmovaps	480(%rsp), %ymm4        # 32-byte Reload
	testl	%ebx, %ebx
	jne	.LBB3_4
	jmp	.LBB3_50
.LBB3_40:                               #   in Loop: Header=BB3_4 Depth=2
	vmovaps	480(%rsp), %ymm4        # 32-byte Reload
	.p2align	4, 0x90
.LBB3_3:                                # %while_head.rv.i
                                        #   in Loop: Header=BB3_4 Depth=2
	testl	%ebx, %ebx
	je	.LBB3_50
.LBB3_4:                                # %while_body.rv.i
                                        #   Parent Loop BB3_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_6 Depth 3
                                        #       Child Loop BB3_10 Depth 3
                                        #       Child Loop BB3_38 Depth 3
                                        #         Child Loop BB3_39 Depth 4
	vmovaps	32(%rsp), %ymm8
	vcmpltps	%ymm8, %ymm4, %ymm10
	vmovmskps	%ymm10, %ecx
	testl	%ecx, %ecx
	je	.LBB3_5
.LBB3_8:                                # %while_head16.rv.i.preheader
                                        #   in Loop: Header=BB3_4 Depth=2
	testl	%ebx, %ebx
	jle	.LBB3_9
	.p2align	4, 0x90
.LBB3_10:                               # %while_body20.rv.i
                                        #   Parent Loop BB3_2 Depth=1
                                        #     Parent Loop BB3_4 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	%r12d, %r8
	movl	1088(%rsp,%r8,4), %r15d
	movq	%r8, %rcx
	shlq	$5, %rcx
	vmovaps	1344(%rsp,%rcx), %ymm4
	addl	$-1, %r8d
	movslq	%ebx, %rbx
	addq	$-1, %rbx
	shlq	$8, %rbx
	movslq	192(%r9,%rbx), %rcx
	testq	%rcx, %rcx
	je	.LBB3_36
# BB#11:                                # %if_else23.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	vbroadcastss	(%r9,%rbx), %ymm8
	vfmsub213ps	%ymm5, %ymm0, %ymm8
	vbroadcastss	64(%r9,%rbx), %ymm10
	vfmsub213ps	%ymm11, %ymm1, %ymm10
	vbroadcastss	128(%r9,%rbx), %ymm12
	vfmsub213ps	%ymm2, %ymm3, %ymm12
	vbroadcastss	32(%r9,%rbx), %ymm13
	vfmsub213ps	%ymm5, %ymm0, %ymm13
	vbroadcastss	96(%r9,%rbx), %ymm14
	vfmsub213ps	%ymm11, %ymm1, %ymm14
	vbroadcastss	160(%r9,%rbx), %ymm15
	vpminsd	%ymm13, %ymm8, %ymm7
	vpmaxsd	%ymm8, %ymm13, %ymm8
	vfmsub213ps	%ymm2, %ymm3, %ymm15
	vpminsd	%ymm14, %ymm10, %ymm13
	vpmaxsd	%ymm10, %ymm14, %ymm10
	vpminsd	%ymm15, %ymm12, %ymm14
	vpmaxsd	%ymm12, %ymm15, %ymm12
	vpmaxsd	%ymm7, %ymm13, %ymm7
	vpminsd	%ymm10, %ymm8, %ymm10
	vpmaxsd	%ymm14, %ymm9, %ymm8
	vpminsd	32(%rsp), %ymm12, %ymm12
	vpmaxsd	%ymm7, %ymm8, %ymm8
	vpminsd	%ymm12, %ymm10, %ymm7
	vpcmpgtd	%ymm7, %ymm8, %ymm10
	vmovmskps	%ymm10, %edi
	xorl	%r14d, %r14d
	cmpl	$255, %edi
	je	.LBB3_13
# BB#12:                                # %if_then26.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	vxorps	.LCPI3_8, %ymm10, %ymm4
	vblendvps	%ymm4, %ymm8, %ymm6, %ymm4
	movq	%rcx, %rdi
	shlq	$8, %rdi
	movl	%ecx, %eax
	notl	%eax
	cltq
	imulq	$208, %rax, %rax
	addq	%r11, %rax
	testl	%ecx, %ecx
	leaq	-256(%r9,%rdi), %rdi
	cmovsq	%rax, %rdi
	prefetcht0	(%rdi)
	prefetcht0	64(%rdi)
	prefetcht0	128(%rdi)
	prefetcht0	192(%rdi)
	movl	$1, %r14d
	movl	%ecx, %r15d
	movl	%r12d, %r8d
.LBB3_13:                               # %next30.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	movslq	196(%r9,%rbx), %rcx
	testq	%rcx, %rcx
	je	.LBB3_34
# BB#14:                                # %if_else33.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	vbroadcastss	4(%r9,%rbx), %ymm7
	vfmsub213ps	%ymm5, %ymm0, %ymm7
	vbroadcastss	68(%r9,%rbx), %ymm8
	vfmsub213ps	%ymm11, %ymm1, %ymm8
	vbroadcastss	132(%r9,%rbx), %ymm10
	vfmsub213ps	%ymm2, %ymm3, %ymm10
	vbroadcastss	36(%r9,%rbx), %ymm12
	vfmsub213ps	%ymm5, %ymm0, %ymm12
	vbroadcastss	100(%r9,%rbx), %ymm13
	vfmsub213ps	%ymm11, %ymm1, %ymm13
	vbroadcastss	164(%r9,%rbx), %ymm14
	vpminsd	%ymm12, %ymm7, %ymm15
	vpmaxsd	%ymm7, %ymm12, %ymm7
	vfmsub213ps	%ymm2, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm8, %ymm12
	vpmaxsd	%ymm8, %ymm13, %ymm8
	vpminsd	%ymm14, %ymm10, %ymm13
	vpmaxsd	%ymm10, %ymm14, %ymm10
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm8, %ymm7, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm8
	vpminsd	32(%rsp), %ymm10, %ymm10
	vpmaxsd	%ymm12, %ymm8, %ymm8
	vpminsd	%ymm10, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm8, %ymm10
	vmovmskps	%ymm10, %eax
	cmpl	$255, %eax
	je	.LBB3_16
# BB#15:                                # %if_then37.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	vxorps	.LCPI3_8, %ymm10, %ymm7
	movl	%ecx, %eax
	notl	%eax
	movq	%rcx, %rdi
	shlq	$8, %rdi
	cltq
	imulq	$208, %rax, %rax
	addl	$1, %r14d
	addq	%r11, %rax
	testl	%ecx, %ecx
	leaq	-256(%r9,%rdi), %rdi
	cmovsq	%rax, %rdi
	movslq	%r8d, %rax
	movl	%r15d, 1092(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm4, 1344(%rsp,%rax)
	vblendvps	%ymm7, %ymm8, %ymm6, %ymm4
	addl	$1, %r8d
	prefetcht0	(%rdi)
	prefetcht0	64(%rdi)
	prefetcht0	128(%rdi)
	prefetcht0	192(%rdi)
	movl	%ecx, %r15d
.LBB3_16:                               # %next42.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	movslq	200(%r9,%rbx), %rcx
	testq	%rcx, %rcx
	je	.LBB3_34
# BB#17:                                # %if_else45.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	vbroadcastss	8(%r9,%rbx), %ymm7
	vbroadcastss	72(%r9,%rbx), %ymm8
	vfmsub213ps	%ymm5, %ymm0, %ymm7
	vfmsub213ps	%ymm11, %ymm1, %ymm8
	vbroadcastss	136(%r9,%rbx), %ymm10
	vfmsub213ps	%ymm2, %ymm3, %ymm10
	vbroadcastss	40(%r9,%rbx), %ymm12
	vfmsub213ps	%ymm5, %ymm0, %ymm12
	vbroadcastss	104(%r9,%rbx), %ymm13
	vfmsub213ps	%ymm11, %ymm1, %ymm13
	vbroadcastss	168(%r9,%rbx), %ymm14
	vpminsd	%ymm12, %ymm7, %ymm15
	vpmaxsd	%ymm7, %ymm12, %ymm7
	vfmsub213ps	%ymm2, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm8, %ymm12
	vpmaxsd	%ymm8, %ymm13, %ymm8
	vpminsd	%ymm14, %ymm10, %ymm13
	vpmaxsd	%ymm10, %ymm14, %ymm10
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm8, %ymm7, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm8
	vpminsd	32(%rsp), %ymm10, %ymm10
	vpmaxsd	%ymm12, %ymm8, %ymm8
	vpminsd	%ymm10, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm8, %ymm10
	vmovmskps	%ymm10, %eax
	cmpl	$255, %eax
	je	.LBB3_19
# BB#18:                                # %if_then49.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	vxorps	.LCPI3_8, %ymm10, %ymm7
	movq	%rcx, %rax
	shlq	$8, %rax
	movl	%ecx, %edi
	notl	%edi
	movslq	%edi, %rdi
	imulq	$208, %rdi, %rdi
	addq	%r11, %rdi
	testl	%ecx, %ecx
	leaq	-256(%r9,%rax), %rax
	cmovsq	%rdi, %rax
	movslq	%r8d, %rdi
	movl	%r15d, 1092(%rsp,%rdi,4)
	addq	$1, %rdi
	shlq	$5, %rdi
	vmovaps	%ymm4, 1344(%rsp,%rdi)
	vblendvps	%ymm7, %ymm8, %ymm6, %ymm4
	addl	$1, %r14d
	addl	$1, %r8d
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	movl	%ecx, %r15d
.LBB3_19:                               # %next54.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	movslq	204(%r9,%rbx), %rcx
	testq	%rcx, %rcx
	je	.LBB3_34
# BB#20:                                # %if_else57.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	vbroadcastss	12(%r9,%rbx), %ymm7
	vfmsub213ps	%ymm5, %ymm0, %ymm7
	vbroadcastss	76(%r9,%rbx), %ymm8
	vfmsub213ps	%ymm11, %ymm1, %ymm8
	vbroadcastss	140(%r9,%rbx), %ymm10
	vfmsub213ps	%ymm2, %ymm3, %ymm10
	vbroadcastss	44(%r9,%rbx), %ymm12
	vfmsub213ps	%ymm5, %ymm0, %ymm12
	vbroadcastss	108(%r9,%rbx), %ymm13
	vfmsub213ps	%ymm11, %ymm1, %ymm13
	vbroadcastss	172(%r9,%rbx), %ymm14
	vpminsd	%ymm12, %ymm7, %ymm15
	vpmaxsd	%ymm7, %ymm12, %ymm7
	vfmsub213ps	%ymm2, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm8, %ymm12
	vpmaxsd	%ymm8, %ymm13, %ymm8
	vpminsd	%ymm14, %ymm10, %ymm13
	vpmaxsd	%ymm10, %ymm14, %ymm10
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm8, %ymm7, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm8
	vpminsd	32(%rsp), %ymm10, %ymm10
	vpmaxsd	%ymm12, %ymm8, %ymm8
	vpminsd	%ymm10, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm8, %ymm10
	vmovmskps	%ymm10, %eax
	cmpl	$255, %eax
	je	.LBB3_22
# BB#21:                                # %if_then61.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	vxorps	.LCPI3_8, %ymm10, %ymm7
	movl	%ecx, %eax
	notl	%eax
	movq	%rcx, %rdi
	shlq	$8, %rdi
	cltq
	imulq	$208, %rax, %rax
	addq	%r11, %rax
	testl	%ecx, %ecx
	leaq	-256(%r9,%rdi), %rdi
	cmovsq	%rax, %rdi
	movslq	%r8d, %rax
	movl	%r15d, 1092(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm4, 1344(%rsp,%rax)
	vblendvps	%ymm7, %ymm8, %ymm6, %ymm4
	addl	$1, %r14d
	addl	$1, %r8d
	prefetcht0	(%rdi)
	prefetcht0	64(%rdi)
	prefetcht0	128(%rdi)
	prefetcht0	192(%rdi)
	movl	%ecx, %r15d
.LBB3_22:                               # %next66.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	movslq	208(%r9,%rbx), %rcx
	testq	%rcx, %rcx
	je	.LBB3_34
# BB#23:                                # %if_else69.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	vbroadcastss	16(%r9,%rbx), %ymm7
	vfmsub213ps	%ymm5, %ymm0, %ymm7
	vbroadcastss	80(%r9,%rbx), %ymm8
	vfmsub213ps	%ymm11, %ymm1, %ymm8
	vbroadcastss	144(%r9,%rbx), %ymm10
	vfmsub213ps	%ymm2, %ymm3, %ymm10
	vbroadcastss	48(%r9,%rbx), %ymm12
	vfmsub213ps	%ymm5, %ymm0, %ymm12
	vbroadcastss	112(%r9,%rbx), %ymm13
	vfmsub213ps	%ymm11, %ymm1, %ymm13
	vbroadcastss	176(%r9,%rbx), %ymm14
	vpminsd	%ymm12, %ymm7, %ymm15
	vpmaxsd	%ymm7, %ymm12, %ymm7
	vfmsub213ps	%ymm2, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm8, %ymm12
	vpmaxsd	%ymm8, %ymm13, %ymm8
	vpminsd	%ymm14, %ymm10, %ymm13
	vpmaxsd	%ymm10, %ymm14, %ymm10
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm8, %ymm7, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm8
	vpminsd	32(%rsp), %ymm10, %ymm10
	vpmaxsd	%ymm12, %ymm8, %ymm8
	vpminsd	%ymm10, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm8, %ymm10
	vmovmskps	%ymm10, %eax
	cmpl	$255, %eax
	je	.LBB3_25
# BB#24:                                # %if_then73.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	vxorps	.LCPI3_8, %ymm10, %ymm7
	movq	%rcx, %rax
	shlq	$8, %rax
	movl	%ecx, %edi
	notl	%edi
	movslq	%edi, %rdi
	imulq	$208, %rdi, %rdi
	addq	%r11, %rdi
	testl	%ecx, %ecx
	leaq	-256(%r9,%rax), %rax
	cmovsq	%rdi, %rax
	movslq	%r8d, %rdi
	movl	%r15d, 1092(%rsp,%rdi,4)
	addq	$1, %rdi
	shlq	$5, %rdi
	vmovaps	%ymm4, 1344(%rsp,%rdi)
	vblendvps	%ymm7, %ymm8, %ymm6, %ymm4
	addl	$1, %r14d
	addl	$1, %r8d
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	movl	%ecx, %r15d
.LBB3_25:                               # %next78.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	movslq	212(%r9,%rbx), %rcx
	testq	%rcx, %rcx
	je	.LBB3_34
# BB#26:                                # %if_else81.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	vbroadcastss	20(%r9,%rbx), %ymm7
	vfmsub213ps	%ymm5, %ymm0, %ymm7
	vbroadcastss	84(%r9,%rbx), %ymm8
	vfmsub213ps	%ymm11, %ymm1, %ymm8
	vbroadcastss	148(%r9,%rbx), %ymm10
	vfmsub213ps	%ymm2, %ymm3, %ymm10
	vbroadcastss	52(%r9,%rbx), %ymm12
	vfmsub213ps	%ymm5, %ymm0, %ymm12
	vbroadcastss	116(%r9,%rbx), %ymm13
	vfmsub213ps	%ymm11, %ymm1, %ymm13
	vbroadcastss	180(%r9,%rbx), %ymm14
	vpminsd	%ymm12, %ymm7, %ymm15
	vpmaxsd	%ymm7, %ymm12, %ymm7
	vfmsub213ps	%ymm2, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm8, %ymm12
	vpmaxsd	%ymm8, %ymm13, %ymm8
	vpminsd	%ymm14, %ymm10, %ymm13
	vpmaxsd	%ymm10, %ymm14, %ymm10
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm8, %ymm7, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm8
	vpminsd	32(%rsp), %ymm10, %ymm10
	vpmaxsd	%ymm12, %ymm8, %ymm8
	vpminsd	%ymm10, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm8, %ymm10
	vmovmskps	%ymm10, %eax
	cmpl	$255, %eax
	je	.LBB3_28
# BB#27:                                # %if_then85.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	vxorps	.LCPI3_8, %ymm10, %ymm7
	movq	%rcx, %rax
	shlq	$8, %rax
	movl	%ecx, %edi
	notl	%edi
	movslq	%edi, %rdi
	imulq	$208, %rdi, %rdi
	addq	%r11, %rdi
	testl	%ecx, %ecx
	leaq	-256(%r9,%rax), %rax
	cmovsq	%rdi, %rax
	movslq	%r8d, %rdi
	movl	%r15d, 1092(%rsp,%rdi,4)
	addq	$1, %rdi
	shlq	$5, %rdi
	vmovaps	%ymm4, 1344(%rsp,%rdi)
	vblendvps	%ymm7, %ymm8, %ymm6, %ymm4
	addl	$1, %r14d
	addl	$1, %r8d
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	movl	%ecx, %r15d
.LBB3_28:                               # %next90.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	movslq	216(%r9,%rbx), %rcx
	testq	%rcx, %rcx
	je	.LBB3_34
# BB#29:                                # %if_else93.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	vbroadcastss	24(%r9,%rbx), %ymm7
	vfmsub213ps	%ymm5, %ymm0, %ymm7
	vbroadcastss	88(%r9,%rbx), %ymm8
	vfmsub213ps	%ymm11, %ymm1, %ymm8
	vbroadcastss	152(%r9,%rbx), %ymm10
	vfmsub213ps	%ymm2, %ymm3, %ymm10
	vbroadcastss	56(%r9,%rbx), %ymm12
	vfmsub213ps	%ymm5, %ymm0, %ymm12
	vbroadcastss	120(%r9,%rbx), %ymm13
	vfmsub213ps	%ymm11, %ymm1, %ymm13
	vbroadcastss	184(%r9,%rbx), %ymm14
	vpminsd	%ymm12, %ymm7, %ymm15
	vpmaxsd	%ymm7, %ymm12, %ymm7
	vfmsub213ps	%ymm2, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm8, %ymm12
	vpmaxsd	%ymm8, %ymm13, %ymm8
	vpminsd	%ymm14, %ymm10, %ymm13
	vpmaxsd	%ymm10, %ymm14, %ymm10
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm8, %ymm7, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm8
	vpminsd	32(%rsp), %ymm10, %ymm10
	vpmaxsd	%ymm12, %ymm8, %ymm8
	vpminsd	%ymm10, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm8, %ymm10
	vmovmskps	%ymm10, %eax
	cmpl	$255, %eax
	je	.LBB3_31
# BB#30:                                # %if_then97.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	vxorps	.LCPI3_8, %ymm10, %ymm7
	movq	%rcx, %rax
	shlq	$8, %rax
	movl	%ecx, %edi
	notl	%edi
	movslq	%edi, %rdi
	imulq	$208, %rdi, %rdi
	addl	$1, %r14d
	addq	%r11, %rdi
	testl	%ecx, %ecx
	leaq	-256(%r9,%rax), %rax
	cmovsq	%rdi, %rax
	movslq	%r8d, %rdi
	movl	%r15d, 1092(%rsp,%rdi,4)
	addq	$1, %rdi
	shlq	$5, %rdi
	vmovaps	%ymm4, 1344(%rsp,%rdi)
	vblendvps	%ymm7, %ymm8, %ymm6, %ymm4
	addl	$1, %r8d
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	movl	%ecx, %r15d
.LBB3_31:                               # %next102.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	movslq	220(%r9,%rbx), %rcx
	testq	%rcx, %rcx
	je	.LBB3_34
# BB#32:                                # %if_else105.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	vbroadcastss	28(%r9,%rbx), %ymm7
	vfmsub213ps	%ymm5, %ymm0, %ymm7
	vbroadcastss	92(%r9,%rbx), %ymm8
	vfmsub213ps	%ymm11, %ymm1, %ymm8
	vbroadcastss	156(%r9,%rbx), %ymm10
	vfmsub213ps	%ymm2, %ymm3, %ymm10
	vbroadcastss	60(%r9,%rbx), %ymm12
	vfmsub213ps	%ymm5, %ymm0, %ymm12
	vbroadcastss	124(%r9,%rbx), %ymm13
	vfmsub213ps	%ymm11, %ymm1, %ymm13
	vbroadcastss	188(%r9,%rbx), %ymm14
	vpminsd	%ymm12, %ymm7, %ymm15
	vpmaxsd	%ymm7, %ymm12, %ymm7
	vfmsub213ps	%ymm2, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm8, %ymm12
	vpmaxsd	%ymm8, %ymm13, %ymm8
	vpminsd	%ymm14, %ymm10, %ymm13
	vpmaxsd	%ymm10, %ymm14, %ymm10
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm8, %ymm7, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm8
	vpminsd	32(%rsp), %ymm10, %ymm10
	vpmaxsd	%ymm12, %ymm8, %ymm8
	vpminsd	%ymm10, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm8, %ymm10
	vmovmskps	%ymm10, %eax
	cmpl	$255, %eax
	jne	.LBB3_33
.LBB3_34:                               # %unlikely_cont_cascading_cascading.rv.i
                                        #   in Loop: Header=BB3_10 Depth=3
	testl	%r14d, %r14d
	jne	.LBB3_35
	jmp	.LBB3_36
	.p2align	4, 0x90
.LBB3_33:                               # %unlikely_cont_cascading_cascading.rv.i.thread1
                                        #   in Loop: Header=BB3_10 Depth=3
	vxorps	.LCPI3_8, %ymm10, %ymm7
	movl	%ecx, %eax
	notl	%eax
	movq	%rcx, %rdi
	cltq
	imulq	$208, %rax, %rax
	shlq	$8, %rdi
	addq	%r11, %rax
	testl	%ecx, %ecx
	leaq	-256(%r9,%rdi), %rdi
	cmovsq	%rax, %rdi
	movslq	%r8d, %rax
	movl	%r15d, 1092(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm4, 1344(%rsp,%rax)
	vblendvps	%ymm7, %ymm8, %ymm6, %ymm4
	addl	$1, %r8d
	prefetcht0	(%rdi)
	prefetcht0	64(%rdi)
	prefetcht0	128(%rdi)
	prefetcht0	192(%rdi)
	movl	%ecx, %r15d
.LBB3_35:                               # %while_head16.rv.i.backedge
                                        #   in Loop: Header=BB3_10 Depth=3
	movl	%r8d, %r12d
	movl	%r15d, %ebx
	testl	%r15d, %r15d
	jg	.LBB3_10
.LBB3_36:                               # %break129.rv.i
                                        #   in Loop: Header=BB3_4 Depth=2
	movl	%r15d, %ebx
	movl	%r8d, %r12d
	testl	%r15d, %r15d
	jns	.LBB3_3
	jmp	.LBB3_37
.LBB3_5:                                # %if_else12.rv.i.preheader
                                        #   in Loop: Header=BB3_4 Depth=2
	movslq	%r12d, %rdi
	leaq	1088(%rsp,%rdi,4), %rcx
	shlq	$5, %rdi
	leaq	1344(%rsp,%rdi), %rdi
.LBB3_6:                                # %if_else12.rv.i
                                        #   Parent Loop BB3_2 Depth=1
                                        #     Parent Loop BB3_4 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	(%rcx), %ebx
	testl	%ebx, %ebx
	je	.LBB3_50
# BB#7:                                 # %if_else13.rv.i
                                        #   in Loop: Header=BB3_6 Depth=3
	vmovaps	(%rdi), %ymm4
	vcmpltps	%ymm8, %ymm4, %ymm10
	vmovmskps	%ymm10, %r8d
	addq	$-32, %rdi
	addl	$-1, %r12d
	addq	$-4, %rcx
	testl	%r8d, %r8d
	jne	.LBB3_8
	jmp	.LBB3_6
.LBB3_9:                                #   in Loop: Header=BB3_4 Depth=2
	movl	%r12d, %r8d
	movl	%ebx, %r15d
.LBB3_37:                               # %if_then133.rv.i
                                        #   in Loop: Header=BB3_4 Depth=2
	notl	%r15d
	movslq	%r8d, %r12
	movl	1088(%rsp,%r12,4), %ebx
	movq	%r12, %rax
	shlq	$5, %rax
	vmovdqa	1344(%rsp,%rax), %ymm7
	vmovdqa	%ymm7, 480(%rsp)        # 32-byte Spill
	addl	$-1, %r12d
	movslq	%r15d, %r14
	imulq	$208, %r14, %r15
	addq	88(%rsp), %r15          # 8-byte Folded Reload
.LBB3_38:                               # %while_head134.rv.i
                                        #   Parent Loop BB3_2 Depth=1
                                        #     Parent Loop BB3_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_39 Depth 4
	movq	%r15, %rdi
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB3_39:                               # %if_then140.rv.i
                                        #   Parent Loop BB3_2 Depth=1
                                        #     Parent Loop BB3_4 Depth=2
                                        #       Parent Loop BB3_38 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	(%rdi), %eax
	vmovd	%eax, %xmm7
	vpbroadcastd	%xmm7, %ymm7
	cmpl	$-1, %eax
	je	.LBB3_40
# BB#44:                                # %if_else141.rv.i
                                        #   in Loop: Header=BB3_39 Depth=4
	vmovdqa	%ymm7, 960(%rsp)        # 32-byte Spill
	vmovaps	32(%rsp), %ymm10
	vbroadcastss	-48(%rdi), %ymm7
	vbroadcastss	-32(%rdi), %ymm8
	vmovaps	320(%rsp), %ymm12       # 32-byte Reload
	vmovaps	%ymm8, 768(%rsp)        # 32-byte Spill
	vmulps	%ymm8, %ymm12, %ymm14
	vmovaps	%ymm7, 928(%rsp)        # 32-byte Spill
	vfmadd231ps	352(%rsp), %ymm7, %ymm14 # 32-byte Folded Reload
	vbroadcastss	-16(%rdi), %ymm7
	vmovaps	1024(%rsp), %ymm15      # 32-byte Reload
	vmovaps	%ymm7, 896(%rsp)        # 32-byte Spill
	vfmadd231ps	%ymm7, %ymm15, %ymm14
	vbroadcastss	-80(%rdi), %ymm7
	vmovaps	%ymm7, 288(%rsp)        # 32-byte Spill
	vbroadcastss	-96(%rdi), %ymm7
	vmovaps	%ymm7, 96(%rsp)         # 32-byte Spill
	vbroadcastss	-64(%rdi), %ymm7
	vmovaps	%ymm7, 128(%rsp)        # 32-byte Spill
	vbroadcastss	-160(%rdi), %ymm8
	vbroadcastss	-192(%rdi), %ymm12
	vbroadcastss	-176(%rdi), %ymm13
	vmovaps	%ymm10, 864(%rsp)       # 32-byte Spill
	vcmpltps	%ymm10, %ymm4, %ymm7
	vmovaps	%ymm7, 256(%rsp)        # 32-byte Spill
	vsubps	544(%rsp), %ymm13, %ymm13 # 32-byte Folded Reload
	vsubps	576(%rsp), %ymm12, %ymm12 # 32-byte Folded Reload
	vandps	512(%rsp), %ymm14, %ymm7 # 32-byte Folded Reload
	vmovaps	%ymm7, 608(%rsp)        # 32-byte Spill
	vsubps	1056(%rsp), %ymm8, %ymm10 # 32-byte Folded Reload
	vmulps	%ymm13, %ymm15, %ymm8
	vmulps	352(%rsp), %ymm10, %ymm7 # 32-byte Folded Reload
	vmovaps	%ymm10, 832(%rsp)       # 32-byte Spill
	vfmsub231ps	320(%rsp), %ymm10, %ymm8 # 32-byte Folded Reload
	vfmsub231ps	%ymm12, %ymm15, %ymm7
	vmovaps	%ymm8, 992(%rsp)        # 32-byte Spill
	vmulps	96(%rsp), %ymm8, %ymm10 # 32-byte Folded Reload
	vmovaps	%ymm7, 96(%rsp)         # 32-byte Spill
	vmovaps	288(%rsp), %ymm15       # 32-byte Reload
	vfmadd213ps	%ymm10, %ymm7, %ymm15
	vmovaps	%ymm12, 288(%rsp)       # 32-byte Spill
	vmulps	320(%rsp), %ymm12, %ymm12 # 32-byte Folded Reload
	vmovaps	%ymm13, 800(%rsp)       # 32-byte Spill
	vfmsub231ps	352(%rsp), %ymm13, %ymm12 # 32-byte Folded Reload
	vmovaps	128(%rsp), %ymm7        # 32-byte Reload
	vfmadd213ps	%ymm15, %ymm12, %ymm7
	vxorps	608(%rsp), %ymm7, %ymm8 # 32-byte Folded Reload
	vxorps	%ymm7, %ymm7, %ymm7
	vcmpleps	%ymm8, %ymm7, %ymm10
	vmovdqa	256(%rsp), %ymm7        # 32-byte Reload
	xorl	%r8d, %r8d
	vptest	%ymm10, %ymm7
	jne	.LBB3_45
.LBB3_49:                               # %rv_ballot_cont_cascading_cascading.rv.i
                                        #   in Loop: Header=BB3_39 Depth=4
	andnl	%r10d, %r8d, %r10d
	je	.LBB3_50
.LBB3_41:                               # %range_step.rv.i
                                        #   in Loop: Header=BB3_39 Depth=4
	addq	$1, %r13
	addq	$4, %rdi
	cmpq	$4, %r13
	jl	.LBB3_39
	jmp	.LBB3_42
.LBB3_45:                               # %if_else_crit.rv.i
                                        #   in Loop: Header=BB3_39 Depth=4
	vmovaps	%ymm14, 640(%rsp)       # 32-byte Spill
	vmovaps	%ymm8, 128(%rsp)        # 32-byte Spill
	vpand	%ymm7, %ymm10, %ymm15
	vbroadcastss	-128(%rdi), %ymm7
	vbroadcastss	-144(%rdi), %ymm8
	vbroadcastss	-112(%rdi), %ymm10
	vmulps	992(%rsp), %ymm8, %ymm8 # 32-byte Folded Reload
	vfmadd231ps	96(%rsp), %ymm7, %ymm8 # 32-byte Folded Reload
	vfmadd231ps	%ymm10, %ymm12, %ymm8
	vmovaps	608(%rsp), %ymm10       # 32-byte Reload
	vxorps	%ymm8, %ymm10, %ymm13
	vxorps	%ymm7, %ymm7, %ymm7
	vcmpleps	%ymm13, %ymm7, %ymm12
	vmovdqa	%ymm15, %ymm14
	vptest	%ymm12, %ymm15
	vmovaps	%ymm10, %ymm8
	je	.LBB3_49
# BB#46:                                # %if_else_crit148.rv.i
                                        #   in Loop: Header=BB3_39 Depth=4
	vbroadcastsd	.LCPI3_4(%rip), %ymm7
	vandps	640(%rsp), %ymm7, %ymm15 # 32-byte Folded Reload
	vpand	%ymm14, %ymm12, %ymm10
	vaddps	128(%rsp), %ymm13, %ymm7 # 32-byte Folded Reload
	vcmpleps	%ymm15, %ymm7, %ymm12
	vptest	%ymm12, %ymm10
	je	.LBB3_49
# BB#47:                                # %if_else_crit153.rv.i
                                        #   in Loop: Header=BB3_39 Depth=4
	vmovaps	%ymm13, 96(%rsp)        # 32-byte Spill
	vpand	%ymm10, %ymm12, %ymm7
	vmovaps	768(%rsp), %ymm10       # 32-byte Reload
	vmulps	800(%rsp), %ymm10, %ymm10 # 32-byte Folded Reload
	vcmpneq_usps	.LCPI3_7, %ymm15, %ymm12
	vmovaps	%ymm12, 256(%rsp)       # 32-byte Spill
	vmulps	864(%rsp), %ymm15, %ymm13 # 32-byte Folded Reload
	vmovaps	%ymm15, %ymm12
	vmovaps	%ymm8, %ymm15
	vmovaps	288(%rsp), %ymm8        # 32-byte Reload
	vfmadd132ps	928(%rsp), %ymm10, %ymm8 # 32-byte Folded Reload
	vmovaps	%ymm12, %ymm14
	vmulps	%ymm12, %ymm9, %ymm12
	vmovaps	832(%rsp), %ymm10       # 32-byte Reload
	vfmadd132ps	896(%rsp), %ymm8, %ymm10 # 32-byte Folded Reload
	vxorps	%ymm10, %ymm15, %ymm8
	vcmpleps	%ymm13, %ymm8, %ymm13
	vcmpleps	%ymm8, %ymm12, %ymm10
	vandps	256(%rsp), %ymm13, %ymm12 # 32-byte Folded Reload
	vandps	%ymm10, %ymm12, %ymm12
	vmovdqa	%ymm7, %ymm10
	vptest	%ymm12, %ymm7
	je	.LBB3_49
# BB#48:                                # %if_else_crit158.rv.i
                                        #   in Loop: Header=BB3_39 Depth=4
	vpand	%ymm10, %ymm12, %ymm7
	vpcmpeqd	.LCPI3_7, %ymm7, %ymm10
	vpxor	.LCPI3_8, %ymm10, %ymm10
	vbroadcastss	.LCPI3_5(%rip), %ymm12
	vmaskmovps	%ymm12, %ymm10, 32(%rsp)
	vrcpps	%ymm14, %ymm10
	vmovaps	416(%rsp), %ymm12       # 32-byte Reload
	vfnmadd213ps	%ymm12, %ymm10, %ymm14
	vfmadd132ps	%ymm10, %ymm10, %ymm14
	vblendvps	%ymm7, %ymm14, %ymm12, %ymm10
	vmulps	96(%rsp), %ymm10, %ymm12 # 32-byte Folded Reload
	vmulps	%ymm10, %ymm8, %ymm8
	vmulps	128(%rsp), %ymm10, %ymm10 # 32-byte Folded Reload
	vbroadcastss	.LCPI3_6(%rip), %ymm13
	vandps	960(%rsp), %ymm13, %ymm13 # 32-byte Folded Reload
	vmovaps	224(%rsp), %ymm14       # 32-byte Reload
	vblendvps	%ymm7, %ymm8, %ymm14, %ymm14
	vmovaps	%ymm14, 224(%rsp)       # 32-byte Spill
	vmovaps	160(%rsp), %ymm8        # 32-byte Reload
	vblendvps	%ymm7, %ymm10, %ymm8, %ymm8
	vmovaps	%ymm8, 160(%rsp)        # 32-byte Spill
	vmovaps	192(%rsp), %ymm8        # 32-byte Reload
	vblendvps	%ymm7, %ymm12, %ymm8, %ymm8
	vmovaps	%ymm8, 192(%rsp)        # 32-byte Spill
	vmovaps	384(%rsp), %ymm8        # 32-byte Reload
	vblendvps	%ymm7, %ymm13, %ymm8, %ymm8
	vmovmskps	%ymm7, %r8d
	vmovaps	%ymm8, 384(%rsp)        # 32-byte Spill
	vmovaps	%ymm8, 448(%rsp)        # 32-byte Spill
	andnl	%r10d, %r8d, %r10d
	jne	.LBB3_41
	jmp	.LBB3_50
	.p2align	4, 0x90
.LBB3_42:                               # %if_else137.rv.i
                                        #   in Loop: Header=BB3_38 Depth=3
	imulq	$208, %r14, %rax
	addq	$1, %r14
	addq	$208, %r15
	cmpl	$0, 204(%r11,%rax)
	jns	.LBB3_38
	jmp	.LBB3_43
	.p2align	4, 0x90
.LBB3_50:                               # %exit
                                        #   in Loop: Header=BB3_2 Depth=1
	movq	%rsi, %rax
	shlq	$7, %rax
	movq	80(%rsp), %rcx          # 8-byte Reload
	vmovaps	448(%rsp), %ymm0        # 32-byte Reload
	vmovups	%ymm0, (%rcx,%rax)
	vmovaps	224(%rsp), %ymm0        # 32-byte Reload
	vmovups	%ymm0, 32(%rcx,%rax)
	vmovaps	160(%rsp), %ymm0        # 32-byte Reload
	vmovups	%ymm0, 64(%rcx,%rax)
	vmovaps	192(%rsp), %ymm0        # 32-byte Reload
	vmovups	%ymm0, 96(%rcx,%rax)
	addq	$1, %rsi
	cmpq	24(%rsp), %rsi          # 8-byte Folded Reload
	jl	.LBB3_2
.LBB3_51:                               # %if_else
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.Lfunc_end3:
	.size	cpu_occluded_bvh8_tri4_packet8_avx2, .Lfunc_end3-cpu_occluded_bvh8_tri4_packet8_avx2

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI4_0:
	.long	1065353216              # float 1
.LCPI4_1:
	.long	2147483648              # float -0
.LCPI4_2:
	.long	841731191               # float 9.99999993E-9
.LCPI4_3:
	.long	4                       # float 5.60519386E-45
.LCPI4_4:
	.long	1                       # 0x1
.LCPI4_5:
	.long	2                       # float 2.80259693E-45
.LCPI4_6:
	.long	16                      # 0x10
.LCPI4_7:
	.long	64                      # 0x40
.LCPI4_8:
	.long	32                      # 0x20
.LCPI4_9:
	.long	2139095039              # float 3.40282347E+38
.LCPI4_11:
	.long	2147483647              # 0x7fffffff
.LCPI4_12:
	.long	4286578687              # float -3.40282347E+38
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI4_10:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI4_13:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5
.LCPI4_14:
	.zero	32
	.text
	.globl	cpu_occluded_bvh4_hybrid8_avx2
	.p2align	4, 0x90
	.type	cpu_occluded_bvh4_hybrid8_avx2,@function
cpu_occluded_bvh4_hybrid8_avx2:         # @cpu_occluded_bvh4_hybrid8_avx2
# BB#0:                                 # %cpu_occluded_bvh4_hybrid8_avx2_start
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$5152, %rsp             # imm = 0x1420
                                        # kill: %ECX<def> %ECX<kill> %RCX<def>
	movq	%rdx, 232(%rsp)         # 8-byte Spill
	movq	%rsi, 224(%rsp)         # 8-byte Spill
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	cmpl	$8, %ecx
	jl	.LBB4_71
# BB#1:                                 # %head.preheader.lr.ph
	movq	(%rdi), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	movq	8(%rdi), %r10
	movq	16(%rsp), %rax          # 8-byte Reload
	shrl	$3, %eax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	leaq	192(%r10), %rax
	movq	%rax, 264(%rsp)         # 8-byte Spill
	xorl	%r14d, %r14d
	vbroadcastss	.LCPI4_0(%rip), %ymm0
	vmovaps	%ymm0, 992(%rsp)        # 32-byte Spill
	vxorps	%ymm1, %ymm1, %ymm1
	vbroadcastss	.LCPI4_1(%rip), %ymm0
	vmovaps	%ymm0, 1568(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI4_2(%rip), %ymm0
	vmovaps	%ymm0, 1536(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI4_1(%rip), %ymm0
	vmovaps	%ymm0, 1024(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI4_2(%rip), %ymm0
	vmovaps	%ymm0, 1504(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI4_3(%rip), %ymm0
	vmovaps	%ymm0, 1472(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI4_4(%rip), %ymm0
	vmovaps	%ymm0, 1440(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI4_5(%rip), %ymm0
	vmovaps	%ymm0, 1408(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI4_6(%rip), %ymm0
	vmovaps	%ymm0, 1376(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI4_7(%rip), %ymm0
	vmovaps	%ymm0, 1344(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI4_8(%rip), %ymm0
	vmovaps	%ymm0, 1312(%rsp)       # 32-byte Spill
	vpcmpeqd	%ymm12, %ymm12, %ymm12
	vbroadcastss	.LCPI4_9(%rip), %ymm14
	movq	%r10, 24(%rsp)          # 8-byte Spill
	vmovaps	%ymm14, 1280(%rsp)      # 32-byte Spill
	.p2align	4, 0x90
.LBB4_2:                                # %body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_5 Depth 2
                                        #       Child Loop BB4_9 Depth 3
                                        #         Child Loop BB4_13 Depth 4
                                        #           Child Loop BB4_14 Depth 5
                                        #             Child Loop BB4_17 Depth 6
                                        #               Child Loop BB4_25 Depth 7
                                        #                 Child Loop BB4_20 Depth 8
                                        #             Child Loop BB4_32 Depth 6
                                        #       Child Loop BB4_41 Depth 3
                                        #       Child Loop BB4_58 Depth 3
                                        #         Child Loop BB4_59 Depth 4
	movq	%rsp, %r15
	movq	%r14, %rax
	shlq	$8, %rax
	movq	224(%rsp), %rcx         # 8-byte Reload
	vmovups	(%rcx,%rax), %ymm0
	vmovaps	%ymm0, 1120(%rsp)       # 32-byte Spill
	vmovups	32(%rcx,%rax), %ymm0
	vmovaps	%ymm0, 1088(%rsp)       # 32-byte Spill
	vmovups	64(%rcx,%rax), %ymm0
	vmovaps	%ymm0, 1056(%rsp)       # 32-byte Spill
	vmovups	96(%rcx,%rax), %ymm7
	vrcpps	%ymm7, %ymm0
	vmovaps	%ymm0, %ymm2
	vmovaps	992(%rsp), %ymm6        # 32-byte Reload
	vfnmadd213ps	%ymm6, %ymm7, %ymm2
	vfmadd132ps	%ymm0, %ymm0, %ymm2
	vxorps	%ymm15, %ymm15, %ymm15
	vcmpltps	%ymm7, %ymm15, %ymm13
	vmovaps	1568(%rsp), %ymm10      # 32-byte Reload
	vxorps	%ymm10, %ymm7, %ymm0
	vblendvps	%ymm13, %ymm7, %ymm0, %ymm0
	vmovups	128(%rcx,%rax), %ymm11
	vrcpps	%ymm11, %ymm3
	vmovaps	%ymm3, %ymm4
	vmovups	160(%rcx,%rax), %ymm9
	vrcpps	%ymm9, %ymm5
	vfnmadd213ps	%ymm6, %ymm11, %ymm4
	vfmadd132ps	%ymm3, %ymm3, %ymm4
	vmovaps	%ymm5, %ymm3
	vfnmadd213ps	%ymm6, %ymm9, %ymm3
	vfmadd132ps	%ymm5, %ymm5, %ymm3
	vmovups	192(%rcx,%rax), %ymm1
	vmovaps	%ymm1, 288(%rsp)        # 32-byte Spill
	vmovaps	1536(%rsp), %ymm6       # 32-byte Reload
	vcmpnlt_uqps	%ymm6, %ymm0, %ymm0
	vmovaps	1024(%rsp), %ymm1       # 32-byte Reload
	vandps	%ymm1, %ymm7, %ymm5
	vmovaps	1504(%rsp), %ymm8       # 32-byte Reload
	vorps	%ymm8, %ymm5, %ymm5
	vblendvps	%ymm0, %ymm2, %ymm5, %ymm0
	vmovaps	%ymm0, 480(%rsp)        # 32-byte Spill
	vxorps	%ymm10, %ymm11, %ymm0
	vcmpltps	%ymm11, %ymm15, %ymm2
	vblendvps	%ymm2, %ymm11, %ymm0, %ymm0
	vcmpnlt_uqps	%ymm6, %ymm0, %ymm0
	vandps	%ymm1, %ymm11, %ymm5
	vorps	%ymm8, %ymm5, %ymm5
	vblendvps	%ymm0, %ymm4, %ymm5, %ymm0
	vmovaps	%ymm0, 448(%rsp)        # 32-byte Spill
	vcmpltps	%ymm9, %ymm15, %ymm4
	vxorps	%ymm10, %ymm9, %ymm0
	vblendvps	%ymm4, %ymm9, %ymm0, %ymm0
	vcmpnlt_uqps	%ymm6, %ymm0, %ymm0
	vandps	%ymm1, %ymm9, %ymm5
	vorps	%ymm8, %ymm5, %ymm5
	vblendvps	%ymm0, %ymm3, %ymm5, %ymm8
	vmovups	224(%rcx,%rax), %ymm0
	vmovaps	%ymm0, 32(%rsp)         # 32-byte Spill
	vblendvps	%ymm4, 1472(%rsp), %ymm15, %ymm3 # 32-byte Folded Reload
	vpcmpeqd	%ymm15, %ymm13, %ymm1
	vmovdqa	1440(%rsp), %ymm5       # 32-byte Reload
	vpandn	%ymm5, %ymm1, %ymm4
	vblendvps	%ymm2, 1408(%rsp), %ymm15, %ymm2 # 32-byte Folded Reload
	vorps	%ymm4, %ymm3, %ymm3
	vorps	%ymm2, %ymm3, %ymm2
	vpsrld	$2, %ymm2, %ymm3
	vpsrld	$1, %ymm2, %ymm2
	vmovdqa	1376(%rsp), %ymm6       # 32-byte Reload
	vpandn	%ymm6, %ymm1, %ymm1
	vpand	%ymm5, %ymm3, %ymm3
	vpand	%ymm5, %ymm2, %ymm2
	vpxor	%ymm6, %ymm1, %ymm4
	vpslld	$4, %ymm3, %ymm3
	vpslld	$4, %ymm2, %ymm2
	vpor	1344(%rsp), %ymm3, %ymm3 # 32-byte Folded Reload
	vpor	1312(%rsp), %ymm2, %ymm2 # 32-byte Folded Reload
	vmovdqa	%ymm4, 1728(%rsp)
	vpxor	%ymm6, %ymm2, %ymm4
	vmovdqa	%ymm4, 1760(%rsp)
	vpxor	%ymm6, %ymm3, %ymm4
	vmovdqa	%ymm4, 2272(%rsp)
	vmovaps	1088(%rsp), %ymm6       # 32-byte Reload
	vmovaps	448(%rsp), %ymm13       # 32-byte Reload
	vmulps	%ymm13, %ymm6, %ymm4
	vmovdqa	%ymm1, 2240(%rsp)
	vmovaps	1056(%rsp), %ymm15      # 32-byte Reload
	vmulps	%ymm8, %ymm15, %ymm5
	vmovdqa	%ymm2, 1696(%rsp)
	vmovaps	1120(%rsp), %ymm2       # 32-byte Reload
	vmovaps	480(%rsp), %ymm0        # 32-byte Reload
	vmulps	%ymm0, %ymm2, %ymm1
	vmovdqa	%ymm3, 1792(%rsp)
	vmovaps	%ymm1, 608(%rsp)        # 32-byte Spill
	vxorps	%ymm10, %ymm1, %ymm1
	vmovaps	%ymm1, 1920(%rsp)
	vxorps	%ymm10, %ymm4, %ymm1
	vmovaps	%ymm1, 1888(%rsp)
	vmovaps	%ymm5, 640(%rsp)        # 32-byte Spill
	vxorps	%ymm10, %ymm5, %ymm1
	vmovaps	%ymm13, %ymm10
	vmovaps	%ymm4, %ymm13
	vmovaps	%ymm1, 1856(%rsp)
	vmovaps	%ymm2, %ymm1
	vmovaps	%ymm1, 2208(%rsp)
	vmovaps	%ymm6, %ymm1
	vmovaps	%ymm1, 2176(%rsp)
	vmovaps	%ymm15, %ymm1
	vmovaps	%ymm1, 2144(%rsp)
	vmovaps	%ymm7, 1664(%rsp)       # 32-byte Spill
	vmovaps	%ymm7, 2112(%rsp)
	vmovaps	%ymm11, 1632(%rsp)      # 32-byte Spill
	vmovaps	%ymm11, 2080(%rsp)
	vmovaps	%ymm8, %ymm11
	vmovaps	%ymm9, 1600(%rsp)       # 32-byte Spill
	vmovaps	%ymm9, 2048(%rsp)
	vmovaps	%ymm0, %ymm9
	vmovaps	288(%rsp), %ymm4        # 32-byte Reload
	vmovaps	%ymm9, 2016(%rsp)
	vmovaps	%ymm10, 1984(%rsp)
	vmovaps	%ymm11, 1952(%rsp)
	vmovaps	%ymm4, 1824(%rsp)
	vmovaps	32(%rsp), %ymm0         # 32-byte Reload
	vmovaps	%ymm0, 96(%rsp)
	vmovaps	%ymm0, 768(%rsp)
	vmovdqa	%ymm12, 736(%rsp)
	vmovdqa	%ymm12, 1184(%rsp)
	movl	$0, 2304(%rsp)
	vmovaps	%ymm14, 3072(%rsp)
	movl	$1, %r13d
	movl	$255, %r12d
	xorl	%r11d, %r11d
	vmovaps	%ymm4, %ymm8
	vmovaps	%ymm11, 672(%rsp)       # 32-byte Spill
	vmovaps	%ymm13, 512(%rsp)       # 32-byte Spill
	testl	%r13d, %r13d
	jne	.LBB4_5
	jmp	.LBB4_70
.LBB4_3:                                #   in Loop: Header=BB4_5 Depth=2
	vmovaps	288(%rsp), %ymm4        # 32-byte Reload
	vmovaps	480(%rsp), %ymm9        # 32-byte Reload
	vmovaps	448(%rsp), %ymm10       # 32-byte Reload
	vmovaps	672(%rsp), %ymm11       # 32-byte Reload
	vmovaps	576(%rsp), %ymm8        # 32-byte Reload
	.p2align	4, 0x90
.LBB4_4:                                # %while_head.rv.i
                                        #   in Loop: Header=BB4_5 Depth=2
	testl	%r13d, %r13d
	je	.LBB4_70
.LBB4_5:                                # %while_head9.rv.i.preheader
                                        #   Parent Loop BB4_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_9 Depth 3
                                        #         Child Loop BB4_13 Depth 4
                                        #           Child Loop BB4_14 Depth 5
                                        #             Child Loop BB4_17 Depth 6
                                        #               Child Loop BB4_25 Depth 7
                                        #                 Child Loop BB4_20 Depth 8
                                        #             Child Loop BB4_32 Depth 6
                                        #       Child Loop BB4_41 Depth 3
                                        #       Child Loop BB4_58 Depth 3
                                        #         Child Loop BB4_59 Depth 4
	movslq	%r11d, %rcx
	jmp	.LBB4_9
.LBB4_6:                                # %if_else116.rv.i
                                        #   in Loop: Header=BB4_9 Depth=3
	testl	%r12d, %r12d
	movq	24(%rsp), %r10          # 8-byte Reload
	movq	256(%rsp), %r14         # 8-byte Reload
	vpcmpeqd	%ymm12, %ymm12, %ymm12
	vmovaps	1280(%rsp), %ymm14      # 32-byte Reload
	movq	248(%rsp), %r15         # 8-byte Reload
	vmovaps	288(%rsp), %ymm4        # 32-byte Reload
	vmovaps	480(%rsp), %ymm9        # 32-byte Reload
	vmovaps	448(%rsp), %ymm10       # 32-byte Reload
	vmovaps	672(%rsp), %ymm11       # 32-byte Reload
	vmovaps	512(%rsp), %ymm13       # 32-byte Reload
	movq	240(%rsp), %rcx         # 8-byte Reload
	je	.LBB4_70
.LBB4_7:                                # %next120.rv.i
                                        #   in Loop: Header=BB4_9 Depth=3
	movl	2304(%rsp,%rcx,4), %r13d
	testl	%r13d, %r13d
	je	.LBB4_70
# BB#8:                                 # %if_else123.rv.i
                                        #   in Loop: Header=BB4_9 Depth=3
	leaq	-1(%rcx), %rax
	shlq	$5, %rcx
	vmovaps	3072(%rsp,%rcx), %ymm8
	movq	%rax, %rcx
	.p2align	4, 0x90
.LBB4_9:                                # %while_head9.rv.i
                                        #   Parent Loop BB4_2 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB4_13 Depth 4
                                        #           Child Loop BB4_14 Depth 5
                                        #             Child Loop BB4_17 Depth 6
                                        #               Child Loop BB4_25 Depth 7
                                        #                 Child Loop BB4_20 Depth 8
                                        #             Child Loop BB4_32 Depth 6
	vcmpltps	96(%rsp), %ymm8, %ymm0
	vmovmskps	%ymm0, %edx
	testl	%edx, %edx
	je	.LBB4_7
# BB#10:                                # %if_then13.rv.i
                                        #   in Loop: Header=BB4_9 Depth=3
	popcntl	%edx, %eax
	cmpl	$4, %eax
	ja	.LBB4_39
# BB#11:                                #   in Loop: Header=BB4_9 Depth=3
	movq	%rcx, 240(%rsp)         # 8-byte Spill
	movq	%r15, 248(%rsp)         # 8-byte Spill
	movq	%r14, 256(%rsp)         # 8-byte Spill
	movq	(%rsp), %rdi            # 8-byte Reload
	movl	%r13d, 8(%rsp)          # 4-byte Spill
	jmp	.LBB4_13
.LBB4_12:                               # %exit173.rv.i
                                        #   in Loop: Header=BB4_13 Depth=4
	movq	272(%rsp), %rbx         # 8-byte Reload
	movl	%ebx, %eax
	andl	$7, %eax
	tzcntl	%edi, %ecx
	vrcpps	%xmm5, %xmm0
	vbroadcastss	.LCPI4_0(%rip), %xmm1
	vfnmadd213ps	%xmm1, %xmm0, %xmm5
	vfmadd132ps	%xmm0, %xmm0, %xmm5
	movl	192(%r9,%rcx,4), %edx
                                        # kill: %ECX<def> %ECX<kill> %RCX<kill> %RCX<def>
	andl	$3, %ecx
	vmulps	%xmm6, %xmm5, %xmm0
	vmulps	%xmm7, %xmm5, %xmm1
	vmovaps	%xmm0, 928(%rsp)
	movl	928(%rsp,%rcx,4), %esi
	vmovaps	%xmm1, 944(%rsp)
	movl	944(%rsp,%rcx,4), %edi
	andl	$2147483647, %edx       # imm = 0x7FFFFFFF
	vmulps	32(%rsp), %xmm5, %xmm0  # 16-byte Folded Reload
	vmovaps	%xmm0, 960(%rsp)
	movl	960(%rsp,%rcx,4), %ecx
	movl	%ecx, 768(%rsp,%rbx,4)
	movl	%esi, 1248(%rsp,%rbx,4)
	movl	%edi, 1216(%rsp,%rbx,4)
	movl	%edx, 736(%rsp,%rbx,4)
	movl	$-1, 1184(%rsp,%rbx,4)
	vmovaps	96(%rsp), %ymm0
	vmovaps	%ymm0, 1152(%rsp)
	movl	$-2, %edx
	movl	%ebx, %ecx
	roll	%cl, %edx
	vmovss	.LCPI4_12(%rip), %xmm0  # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 1152(%rsp,%rax,4)
	vmovaps	1152(%rsp), %ymm0
	vmovaps	%ymm0, 96(%rsp)
	movl	12(%rsp), %r12d         # 4-byte Reload
	andl	%edx, %r12d
	movq	(%rsp), %rdi            # 8-byte Reload
	jmp	.LBB4_38
	.p2align	4, 0x90
.LBB4_13:                               # %body.rv.i
                                        #   Parent Loop BB4_2 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_9 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB4_14 Depth 5
                                        #             Child Loop BB4_17 Depth 6
                                        #               Child Loop BB4_25 Depth 7
                                        #                 Child Loop BB4_20 Depth 8
                                        #             Child Loop BB4_32 Depth 6
	movl	%r12d, 12(%rsp)         # 4-byte Spill
	movq	%rdx, 280(%rsp)         # 8-byte Spill
	tzcntl	%edx, %eax
	movl	1824(%rsp,%rax,4), %ebx
	vmovd	96(%rsp,%rax,4), %xmm9  # xmm9 = mem[0],zero,zero,zero
	vbroadcastss	1952(%rsp,%rax,4), %xmm15
	vbroadcastss	1856(%rsp,%rax,4), %xmm12
	vbroadcastss	2016(%rsp,%rax,4), %xmm11
	vbroadcastss	1984(%rsp,%rax,4), %xmm14
	vbroadcastss	1920(%rsp,%rax,4), %xmm2
	vbroadcastss	1888(%rsp,%rax,4), %xmm1
	vbroadcastss	2112(%rsp,%rax,4), %xmm0
	vmovaps	%xmm0, 432(%rsp)        # 16-byte Spill
	vbroadcastss	2080(%rsp,%rax,4), %xmm0
	vmovaps	%xmm0, 208(%rsp)        # 16-byte Spill
	vbroadcastss	2048(%rsp,%rax,4), %xmm0
	vmovaps	%xmm0, 416(%rsp)        # 16-byte Spill
	vbroadcastss	2208(%rsp,%rax,4), %xmm0
	vmovaps	%xmm0, 912(%rsp)        # 16-byte Spill
	vbroadcastss	2144(%rsp,%rax,4), %xmm0
	vmovaps	%xmm0, 896(%rsp)        # 16-byte Spill
	vbroadcastss	2176(%rsp,%rax,4), %xmm0
	vmovaps	%xmm0, 880(%rsp)        # 16-byte Spill
	movslq	1696(%rsp,%rax,4), %r12
	movslq	1792(%rsp,%rax,4), %r8
	movslq	2240(%rsp,%rax,4), %r14
	movslq	1760(%rsp,%rax,4), %rdx
	movslq	1728(%rsp,%rax,4), %rsi
	movq	%rax, 272(%rsp)         # 8-byte Spill
	movslq	2272(%rsp,%rax,4), %rax
	movl	$0, 2560(%rsp)
	movl	$2139095039, 2816(%rsp) # imm = 0x7F7FFFFF
	vmovd	%ebx, %xmm10
	vpbroadcastd	%xmm9, %xmm8
	vpbroadcastd	%xmm10, %xmm13
	xorl	%r10d, %r10d
	movl	%r13d, %ecx
	movq	%rax, %r13
	movq	%r12, 704(%rsp)         # 8-byte Spill
	movq	%r8, 576(%rsp)          # 8-byte Spill
	movq	%rdx, 320(%rsp)         # 8-byte Spill
	movq	%rsi, 544(%rsp)         # 8-byte Spill
	movq	%r13, 88(%rsp)          # 8-byte Spill
.LBB4_14:                               # %while_head1.rv.i.preheader.preheader
                                        #   Parent Loop BB4_2 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_9 Depth=3
                                        #         Parent Loop BB4_13 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB4_17 Depth 6
                                        #               Child Loop BB4_25 Depth 7
                                        #                 Child Loop BB4_20 Depth 8
                                        #             Child Loop BB4_32 Depth 6
	movl	%ecx, %r15d
	movl	%r10d, %r9d
	jmp	.LBB4_17
.LBB4_15:                               # %if_then35.rv.i
                                        #   in Loop: Header=BB4_17 Depth=6
	vmovd	%ebx, %xmm0
	movslq	%r9d, %r10
	movl	2560(%rsp,%r10,4), %ecx
	movl	2816(%rsp,%r10,4), %ebx
	addl	$-1, %r10d
	vucomiss	%xmm0, %xmm9
	ja	.LBB4_31
	jmp	.LBB4_30
.LBB4_16:                               # %break.rv.i14.break31.rv.i_crit_edge
                                        #   in Loop: Header=BB4_17 Depth=6
	leal	-1(%r9,%rax), %r10d
	movl	%ecx, %r15d
	jmp	.LBB4_29
	.p2align	4, 0x90
.LBB4_17:                               # %while_head1.rv.i.preheader
                                        #   Parent Loop BB4_2 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_9 Depth=3
                                        #         Parent Loop BB4_13 Depth=4
                                        #           Parent Loop BB4_14 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB4_25 Depth 7
                                        #                 Child Loop BB4_20 Depth 8
	testl	%r15d, %r15d
	jg	.LBB4_25
	jmp	.LBB4_15
.LBB4_19:                               # %if_then.rv.i.preheader
                                        #   in Loop: Header=BB4_25 Depth=7
	movslq	%r10d, %r13
	leaq	2820(%rsp), %rdi
	leaq	(%rdi,%r13,4), %rdi
	movq	%rdi, 384(%rsp)         # 8-byte Spill
	leaq	2564(%rsp), %rdi
	leaq	(%rdi,%r13,4), %rdi
	movq	%rdi, 352(%rsp)         # 8-byte Spill
	xorl	%edi, %edi
	movq	%rdi, 128(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB4_20:                               # %if_then.rv.i
                                        #   Parent Loop BB4_2 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_9 Depth=3
                                        #         Parent Loop BB4_13 Depth=4
                                        #           Parent Loop BB4_14 Depth=5
                                        #             Parent Loop BB4_17 Depth=6
                                        #               Parent Loop BB4_25 Depth=7
                                        # =>              This Inner Loop Header: Depth=8
	tzcntl	%eax, %edi
	movslq	96(%r11,%rdi,4), %r15
	testq	%r15, %r15
	je	.LBB4_23
# BB#21:                                # %if_else24.rv.i
                                        #   in Loop: Header=BB4_20 Depth=8
	movq	%rdi, 32(%rsp)          # 8-byte Spill
	movl	%r15d, %edi
	notl	%edi
	movq	%r15, %r13
	movq	%r13, 160(%rsp)         # 8-byte Spill
	shlq	$7, 160(%rsp)           # 8-byte Folded Spill
	movslq	%edi, %rdi
	imulq	$208, %rdi, %rsi
	addq	24(%rsp), %rsi          # 8-byte Folded Reload
	testl	%r15d, %r15d
	movq	(%rsp), %rdi            # 8-byte Reload
	movq	160(%rsp), %rdx         # 8-byte Reload
	leaq	-128(%rdi,%rdx), %rdi
	cmovsq	%rsi, %rdi
	prefetcht0	(%rdi)
	prefetcht0	64(%rdi)
	leal	-1(%rax), %edi
	movl	%edi, 160(%rsp)         # 4-byte Spill
	movq	32(%rsp), %rdi          # 8-byte Reload
	andl	$3, %edi
	movq	%rdi, 32(%rsp)          # 8-byte Spill
	movq	%r14, %rsi
	movq	128(%rsp), %r14         # 8-byte Reload
	movq	352(%rsp), %rdx         # 8-byte Reload
	movl	%ecx, (%rdx,%r14,4)
	movq	384(%rsp), %rcx         # 8-byte Reload
	movl	%ebx, (%rcx,%r14,4)
	leaq	1(%r14), %r14
	movq	%r14, 128(%rsp)         # 8-byte Spill
	movq	%rsi, %r14
	movq	576(%rsp), %r8          # 8-byte Reload
	movq	704(%rsp), %r12         # 8-byte Reload
	vmovdqa	%xmm10, 976(%rsp)
	movq	32(%rsp), %rcx          # 8-byte Reload
	movl	976(%rsp,%rcx,4), %ebx
	movl	160(%rsp), %ecx         # 4-byte Reload
	andl	%eax, %ecx
	movl	%ecx, %eax
	movl	%r15d, %ecx
	jne	.LBB4_20
# BB#22:                                # %while_head1.rv.i.backedge.loopexit
                                        #   in Loop: Header=BB4_25 Depth=7
	addl	128(%rsp), %r10d        # 4-byte Folded Reload
	movq	(%rsp), %rdi            # 8-byte Reload
	movq	320(%rsp), %rdx         # 8-byte Reload
	movq	544(%rsp), %rsi         # 8-byte Reload
	movq	88(%rsp), %r13          # 8-byte Reload
	jmp	.LBB4_28
.LBB4_23:                               # %break.rv.i14
                                        #   in Loop: Header=BB4_25 Depth=7
	movq	128(%rsp), %rax         # 8-byte Reload
	testl	%eax, %eax
	movq	(%rsp), %rdi            # 8-byte Reload
	movq	320(%rsp), %rdx         # 8-byte Reload
	movq	544(%rsp), %rsi         # 8-byte Reload
	movq	88(%rsp), %r13          # 8-byte Reload
	je	.LBB4_16
# BB#24:                                # %break.rv.i14.while_head1.rv.i.backedge_crit_edge
                                        #   in Loop: Header=BB4_25 Depth=7
	movl	%r10d, %r10d
	addq	%rax, %r10
	jmp	.LBB4_27
	.p2align	4, 0x90
.LBB4_25:                               # %while_body5.rv.i
                                        #   Parent Loop BB4_2 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_9 Depth=3
                                        #         Parent Loop BB4_13 Depth=4
                                        #           Parent Loop BB4_14 Depth=5
                                        #             Parent Loop BB4_17 Depth=6
                                        # =>            This Loop Header: Depth=7
                                        #                 Child Loop BB4_20 Depth 8
	vmovd	%ebx, %xmm4
	movslq	%r9d, %r10
	movl	2560(%rsp,%r10,4), %ecx
	movl	2816(%rsp,%r10,4), %ebx
	addl	$-1, %r10d
	vucomiss	%xmm4, %xmm9
	jbe	.LBB4_27
# BB#26:                                # %if_else.rv.i
                                        #   in Loop: Header=BB4_25 Depth=7
	movslq	%r15d, %r11
	addq	$-1, %r11
	shlq	$7, %r11
	addq	%rdi, %r11
	vmovaps	(%r8,%r11), %xmm4
	vfmadd213ps	%xmm12, %xmm15, %xmm4
	vmovaps	(%rsi,%r11), %xmm3
	vfmadd213ps	%xmm2, %xmm11, %xmm3
	vmovaps	(%r14,%r11), %xmm6
	vfmadd213ps	%xmm2, %xmm11, %xmm6
	vmovaps	(%rdx,%r11), %xmm0
	vfmadd213ps	%xmm1, %xmm14, %xmm0
	vmovaps	(%r12,%r11), %xmm5
	vfmadd213ps	%xmm1, %xmm14, %xmm5
	vmovaps	(%r13,%r11), %xmm7
	vfmadd213ps	%xmm12, %xmm15, %xmm7
	vpminsd	%xmm8, %xmm4, %xmm4
	vpmaxsd	%xmm3, %xmm0, %xmm0
	vpminsd	%xmm5, %xmm6, %xmm3
	vpmaxsd	%xmm7, %xmm13, %xmm5
	vpmaxsd	%xmm0, %xmm5, %xmm10
	vpminsd	%xmm4, %xmm3, %xmm0
	vpcmpgtd	%xmm0, %xmm10, %xmm0
	vmovmskps	%xmm0, %eax
	xorl	$15, %eax
	jne	.LBB4_19
.LBB4_27:                               #   in Loop: Header=BB4_25 Depth=7
	movl	%ecx, %r15d
.LBB4_28:                               # %while_head1.rv.i.backedge
                                        #   in Loop: Header=BB4_25 Depth=7
	movl	%r10d, %r9d
	testl	%r15d, %r15d
	jg	.LBB4_25
.LBB4_29:                               # %break31.rv.i
                                        #   in Loop: Header=BB4_17 Depth=6
	movl	%r10d, %r9d
	movl	%r15d, %ecx
	testl	%r15d, %r15d
	js	.LBB4_15
.LBB4_30:                               # %while_head.rv.i1.backedge
                                        #   in Loop: Header=BB4_17 Depth=6
	movl	%ecx, %r15d
	movl	%r10d, %r9d
	testl	%ecx, %ecx
	jne	.LBB4_17
	jmp	.LBB4_37
	.p2align	4, 0x90
.LBB4_31:                               # %head.rv.i22.preheader
                                        #   in Loop: Header=BB4_14 Depth=5
	notl	%r15d
	movslq	%r15d, %rax
	imulq	$208, %rax, %r9
	addq	24(%rsp), %r9           # 8-byte Folded Reload
	.p2align	4, 0x90
.LBB4_32:                               # %while_head.rv.i.i
                                        #   Parent Loop BB4_2 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_9 Depth=3
                                        #         Parent Loop BB4_13 Depth=4
                                        #           Parent Loop BB4_14 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	vmovaps	144(%r9), %xmm4
	vmovaps	160(%r9), %xmm0
	vmovaps	176(%r9), %xmm3
	vmovaps	%xmm0, 384(%rsp)        # 16-byte Spill
	vmulps	208(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
	vmovaps	432(%rsp), %xmm5        # 16-byte Reload
	vmovaps	%xmm4, 352(%rsp)        # 16-byte Spill
	vfmadd231ps	%xmm4, %xmm5, %xmm0
	vmovaps	%xmm5, %xmm7
	vmovaps	%xmm3, 128(%rsp)        # 16-byte Spill
	vfmadd231ps	416(%rsp), %xmm3, %xmm0 # 16-byte Folded Reload
	vandps	.LCPI4_13(%rip), %xmm0, %xmm3
	vmovaps	%xmm3, 160(%rsp)        # 16-byte Spill
	vmovaps	(%r9), %xmm3
	vmovaps	16(%r9), %xmm6
	vmovaps	32(%r9), %xmm4
	vsubps	912(%rsp), %xmm3, %xmm5 # 16-byte Folded Reload
	vsubps	896(%rsp), %xmm4, %xmm10 # 16-byte Folded Reload
	vbroadcastss	.LCPI4_1(%rip), %xmm3
	vandps	%xmm3, %xmm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)         # 16-byte Spill
	vsubps	880(%rsp), %xmm6, %xmm0 # 16-byte Folded Reload
	vmulps	208(%rsp), %xmm5, %xmm6 # 16-byte Folded Reload
	vmulps	%xmm10, %xmm7, %xmm3
	vmovaps	416(%rsp), %xmm7        # 16-byte Reload
	vmulps	%xmm0, %xmm7, %xmm4
	vmovaps	%xmm0, 848(%rsp)        # 16-byte Spill
	vfmsub231ps	432(%rsp), %xmm0, %xmm6 # 16-byte Folded Reload
	vmovaps	%xmm5, 832(%rsp)        # 16-byte Spill
	vfmsub231ps	%xmm5, %xmm7, %xmm3
	vmulps	112(%r9), %xmm3, %xmm5
	vmovaps	%xmm10, 864(%rsp)       # 16-byte Spill
	vfmsub231ps	208(%rsp), %xmm10, %xmm4 # 16-byte Folded Reload
	vmulps	64(%r9), %xmm3, %xmm3
	vfmadd231ps	96(%r9), %xmm4, %xmm5
	vfmadd231ps	48(%r9), %xmm4, %xmm3
	vfmadd231ps	128(%r9), %xmm6, %xmm5
	vfmadd231ps	80(%r9), %xmm6, %xmm3
	vmovaps	32(%rsp), %xmm0         # 16-byte Reload
	vxorps	%xmm5, %xmm0, %xmm6
	vmovaps	160(%rsp), %xmm5        # 16-byte Reload
	vxorps	%xmm3, %xmm0, %xmm7
	vxorps	%xmm3, %xmm3, %xmm3
	vcmpleps	%xmm6, %xmm3, %xmm0
	vxorps	%xmm4, %xmm4, %xmm4
	vcmpleps	%xmm7, %xmm3, %xmm3
	vandps	%xmm0, %xmm3, %xmm3
	vaddps	%xmm7, %xmm6, %xmm0
	vcmpleps	%xmm5, %xmm0, %xmm10
	vptest	%xmm10, %xmm3
	jne	.LBB4_34
.LBB4_33:                               # %next.rv.i.i
                                        #   in Loop: Header=BB4_32 Depth=6
	cmpl	$0, 204(%r9)
	leaq	208(%r9), %r9
	movq	(%rsp), %rdi            # 8-byte Reload
	jns	.LBB4_32
	jmp	.LBB4_36
.LBB4_34:                               # %if_else_crit.rv.i.i
                                        #   in Loop: Header=BB4_32 Depth=6
	vandps	%xmm10, %xmm3, %xmm0
	vmovaps	%xmm0, 816(%rsp)        # 16-byte Spill
	vcmpneq_usps	%xmm4, %xmm5, %xmm0
	vmovaps	%xmm0, 800(%rsp)        # 16-byte Spill
	vmulps	%xmm5, %xmm13, %xmm10
	vmovaps	832(%rsp), %xmm0        # 16-byte Reload
	vmulps	352(%rsp), %xmm0, %xmm4 # 16-byte Folded Reload
	vmovaps	848(%rsp), %xmm3        # 16-byte Reload
	vfmadd132ps	384(%rsp), %xmm4, %xmm3 # 16-byte Folded Reload
	vmulps	%xmm5, %xmm8, %xmm4
	vmovaps	864(%rsp), %xmm0        # 16-byte Reload
	vfmadd132ps	128(%rsp), %xmm3, %xmm0 # 16-byte Folded Reload
	vxorps	32(%rsp), %xmm0, %xmm0  # 16-byte Folded Reload
	vcmpleps	%xmm4, %xmm0, %xmm4
	vmovaps	%xmm0, 32(%rsp)         # 16-byte Spill
	vcmpleps	%xmm0, %xmm10, %xmm3
	vandps	800(%rsp), %xmm4, %xmm0 # 16-byte Folded Reload
	vandps	%xmm3, %xmm0, %xmm10
	vmovdqa	816(%rsp), %xmm0        # 16-byte Reload
	vptest	%xmm10, %xmm0
	je	.LBB4_33
# BB#35:                                # %if_else_crit5.rv.i.i
                                        #   in Loop: Header=BB4_32 Depth=6
	vpand	%xmm0, %xmm10, %xmm0
	vmovmskps	%xmm0, %edi
	testl	%edi, %edi
	je	.LBB4_33
	jmp	.LBB4_12
	.p2align	4, 0x90
.LBB4_36:                               # %while_head.rv.i1.outer.loopexit
                                        #   in Loop: Header=BB4_14 Depth=5
	testl	%ecx, %ecx
	jne	.LBB4_14
	.p2align	4, 0x90
.LBB4_37:                               # %exit173.rv.i.thread
                                        #   in Loop: Header=BB4_13 Depth=4
	movl	12(%rsp), %r12d         # 4-byte Reload
.LBB4_38:                               # %next172.rv.i
                                        #   in Loop: Header=BB4_13 Depth=4
	movl	8(%rsp), %r13d          # 4-byte Reload
	movq	280(%rsp), %rcx         # 8-byte Reload
	leal	-1(%rcx), %eax
	andl	%ecx, %eax
	movl	%eax, %edx
	jne	.LBB4_13
	jmp	.LBB4_6
	.p2align	4, 0x90
.LBB4_39:                               # %while_head14.rv.i.preheader
                                        #   in Loop: Header=BB4_5 Depth=2
	testl	%r13d, %r13d
	jle	.LBB4_56
# BB#40:                                # %while_body18.rv.i.preheader
                                        #   in Loop: Header=BB4_5 Depth=2
	movq	(%rsp), %rsi            # 8-byte Reload
	.p2align	4, 0x90
.LBB4_41:                               # %while_body18.rv.i
                                        #   Parent Loop BB4_2 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	%ecx, %r11
	movl	2304(%rsp,%r11,4), %r9d
	movq	%r11, %rax
	shlq	$5, %rax
	vmovaps	3072(%rsp,%rax), %ymm8
	addl	$-1, %r11d
	movslq	%r13d, %rdx
	addq	$-1, %rdx
	shlq	$7, %rdx
	movq	%rsi, %rbx
	movslq	96(%rbx,%rdx), %rdi
	testq	%rdi, %rdi
	je	.LBB4_55
# BB#42:                                # %if_else21.rv.i
                                        #   in Loop: Header=BB4_41 Depth=3
	movq	%rcx, %rsi
	vbroadcastss	(%rbx,%rdx), %ymm0
	vmovaps	608(%rsp), %ymm5        # 32-byte Reload
	vfmsub213ps	%ymm5, %ymm9, %ymm0
	vbroadcastss	32(%rbx,%rdx), %ymm1
	vfmsub213ps	%ymm13, %ymm10, %ymm1
	vbroadcastss	64(%rbx,%rdx), %ymm2
	vmovaps	640(%rsp), %ymm15       # 32-byte Reload
	vfmsub213ps	%ymm15, %ymm11, %ymm2
	vbroadcastss	16(%rbx,%rdx), %ymm3
	vfmsub213ps	%ymm5, %ymm9, %ymm3
	vbroadcastss	48(%rbx,%rdx), %ymm5
	vfmsub213ps	%ymm13, %ymm10, %ymm5
	vbroadcastss	80(%rbx,%rdx), %ymm6
	vpminsd	%ymm3, %ymm0, %ymm7
	vpmaxsd	%ymm0, %ymm3, %ymm0
	vfmsub213ps	%ymm15, %ymm11, %ymm6
	vpminsd	%ymm5, %ymm1, %ymm3
	vpmaxsd	%ymm1, %ymm5, %ymm1
	vpminsd	%ymm6, %ymm2, %ymm5
	vpmaxsd	%ymm2, %ymm6, %ymm2
	vpmaxsd	%ymm7, %ymm3, %ymm3
	vpminsd	%ymm1, %ymm0, %ymm1
	vpmaxsd	%ymm5, %ymm4, %ymm0
	vpminsd	96(%rsp), %ymm2, %ymm2
	vpmaxsd	%ymm3, %ymm0, %ymm0
	vpminsd	%ymm2, %ymm1, %ymm1
	vpcmpgtd	%ymm1, %ymm0, %ymm1
	vmovmskps	%ymm1, %eax
	xorl	%r8d, %r8d
	cmpl	$255, %eax
	je	.LBB4_44
# BB#43:                                # %if_then24.rv.i
                                        #   in Loop: Header=BB4_41 Depth=3
	vpxor	%ymm12, %ymm1, %ymm1
	movl	%edi, %eax
	notl	%eax
	movq	%rdi, %rcx
	shlq	$7, %rcx
	cltq
	imulq	$208, %rax, %rax
	addq	%r10, %rax
	testl	%edi, %edi
	vblendvps	%ymm1, %ymm0, %ymm14, %ymm8
	leaq	-128(%rbx,%rcx), %rcx
	cmovsq	%rax, %rcx
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	movl	$1, %r8d
	movl	%edi, %r9d
	movl	%esi, %r11d
.LBB4_44:                               # %next26.rv.i
                                        #   in Loop: Header=BB4_41 Depth=3
	movslq	100(%rbx,%rdx), %rdi
	testq	%rdi, %rdi
	je	.LBB4_52
# BB#45:                                # %if_else29.rv.i
                                        #   in Loop: Header=BB4_41 Depth=3
	vbroadcastss	4(%rbx,%rdx), %ymm0
	vmovaps	608(%rsp), %ymm5        # 32-byte Reload
	vfmsub213ps	%ymm5, %ymm9, %ymm0
	vbroadcastss	36(%rbx,%rdx), %ymm1
	vfmsub213ps	%ymm13, %ymm10, %ymm1
	vbroadcastss	68(%rbx,%rdx), %ymm2
	vmovaps	640(%rsp), %ymm15       # 32-byte Reload
	vfmsub213ps	%ymm15, %ymm11, %ymm2
	vbroadcastss	20(%rbx,%rdx), %ymm3
	vfmsub213ps	%ymm5, %ymm9, %ymm3
	vbroadcastss	52(%rbx,%rdx), %ymm5
	vfmsub213ps	%ymm13, %ymm10, %ymm5
	vbroadcastss	84(%rbx,%rdx), %ymm6
	vpminsd	%ymm3, %ymm0, %ymm7
	vpmaxsd	%ymm0, %ymm3, %ymm0
	vfmsub213ps	%ymm15, %ymm11, %ymm6
	vpminsd	%ymm5, %ymm1, %ymm3
	vpmaxsd	%ymm1, %ymm5, %ymm1
	vpminsd	%ymm6, %ymm2, %ymm5
	vpmaxsd	%ymm2, %ymm6, %ymm2
	vpmaxsd	%ymm7, %ymm3, %ymm3
	vpminsd	%ymm1, %ymm0, %ymm1
	vpmaxsd	%ymm5, %ymm4, %ymm0
	vpminsd	96(%rsp), %ymm2, %ymm2
	vpmaxsd	%ymm3, %ymm0, %ymm0
	vpminsd	%ymm2, %ymm1, %ymm1
	vpcmpgtd	%ymm1, %ymm0, %ymm1
	vmovmskps	%ymm1, %eax
	cmpl	$255, %eax
	je	.LBB4_47
# BB#46:                                # %if_then33.rv.i
                                        #   in Loop: Header=BB4_41 Depth=3
	vpxor	%ymm12, %ymm1, %ymm1
	movq	%rdi, %rax
	shlq	$7, %rax
	movl	%edi, %esi
	notl	%esi
	addl	$1, %r8d
	movslq	%esi, %rsi
	imulq	$208, %rsi, %rsi
	addq	%r10, %rsi
	testl	%edi, %edi
	leaq	-128(%rbx,%rax), %rax
	cmovsq	%rsi, %rax
	movslq	%r11d, %rsi
	movl	%r9d, 2308(%rsp,%rsi,4)
	addq	$1, %rsi
	shlq	$5, %rsi
	vmovaps	%ymm8, 3072(%rsp,%rsi)
	vblendvps	%ymm1, %ymm0, %ymm14, %ymm8
	addl	$1, %r11d
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	movl	%edi, %r9d
.LBB4_47:                               # %next36.rv.i
                                        #   in Loop: Header=BB4_41 Depth=3
	movslq	104(%rbx,%rdx), %rdi
	testq	%rdi, %rdi
	je	.LBB4_52
# BB#48:                                # %if_else39.rv.i
                                        #   in Loop: Header=BB4_41 Depth=3
	vbroadcastss	8(%rbx,%rdx), %ymm0
	vmovaps	608(%rsp), %ymm5        # 32-byte Reload
	vfmsub213ps	%ymm5, %ymm9, %ymm0
	vbroadcastss	40(%rbx,%rdx), %ymm1
	vfmsub213ps	%ymm13, %ymm10, %ymm1
	vbroadcastss	72(%rbx,%rdx), %ymm2
	vmovaps	640(%rsp), %ymm15       # 32-byte Reload
	vfmsub213ps	%ymm15, %ymm11, %ymm2
	vbroadcastss	24(%rbx,%rdx), %ymm3
	vfmsub213ps	%ymm5, %ymm9, %ymm3
	vbroadcastss	56(%rbx,%rdx), %ymm5
	vfmsub213ps	%ymm13, %ymm10, %ymm5
	vbroadcastss	88(%rbx,%rdx), %ymm6
	vpminsd	%ymm3, %ymm0, %ymm7
	vpmaxsd	%ymm0, %ymm3, %ymm0
	vfmsub213ps	%ymm15, %ymm11, %ymm6
	vpminsd	%ymm5, %ymm1, %ymm3
	vpmaxsd	%ymm1, %ymm5, %ymm1
	vpminsd	%ymm6, %ymm2, %ymm5
	vpmaxsd	%ymm2, %ymm6, %ymm2
	vpmaxsd	%ymm7, %ymm3, %ymm3
	vpminsd	%ymm1, %ymm0, %ymm1
	vpmaxsd	%ymm5, %ymm4, %ymm0
	vpminsd	96(%rsp), %ymm2, %ymm2
	vpmaxsd	%ymm3, %ymm0, %ymm0
	vpminsd	%ymm2, %ymm1, %ymm1
	vpcmpgtd	%ymm1, %ymm0, %ymm1
	vmovmskps	%ymm1, %eax
	cmpl	$255, %eax
	je	.LBB4_50
# BB#49:                                # %if_then43.rv.i
                                        #   in Loop: Header=BB4_41 Depth=3
	vpxor	%ymm12, %ymm1, %ymm1
	movq	%rdi, %rax
	shlq	$7, %rax
	movl	%edi, %esi
	notl	%esi
	addl	$1, %r8d
	movslq	%esi, %rsi
	imulq	$208, %rsi, %rsi
	addq	%r10, %rsi
	testl	%edi, %edi
	leaq	-128(%rbx,%rax), %rax
	cmovsq	%rsi, %rax
	movslq	%r11d, %rsi
	movl	%r9d, 2308(%rsp,%rsi,4)
	addq	$1, %rsi
	shlq	$5, %rsi
	vmovaps	%ymm8, 3072(%rsp,%rsi)
	vblendvps	%ymm1, %ymm0, %ymm14, %ymm8
	addl	$1, %r11d
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	movl	%edi, %r9d
.LBB4_50:                               # %next46.rv.i
                                        #   in Loop: Header=BB4_41 Depth=3
	movslq	108(%rbx,%rdx), %rdi
	testq	%rdi, %rdi
	je	.LBB4_52
# BB#51:                                # %if_else49.rv.i
                                        #   in Loop: Header=BB4_41 Depth=3
	vbroadcastss	12(%rbx,%rdx), %ymm0
	vmovaps	608(%rsp), %ymm5        # 32-byte Reload
	vfmsub213ps	%ymm5, %ymm9, %ymm0
	vbroadcastss	44(%rbx,%rdx), %ymm1
	vfmsub213ps	%ymm13, %ymm10, %ymm1
	vbroadcastss	76(%rbx,%rdx), %ymm2
	vmovaps	640(%rsp), %ymm15       # 32-byte Reload
	vfmsub213ps	%ymm15, %ymm11, %ymm2
	vbroadcastss	28(%rbx,%rdx), %ymm3
	vfmsub213ps	%ymm5, %ymm9, %ymm3
	vbroadcastss	60(%rbx,%rdx), %ymm5
	vfmsub213ps	%ymm13, %ymm10, %ymm5
	vbroadcastss	92(%rbx,%rdx), %ymm6
	vpminsd	%ymm3, %ymm0, %ymm7
	vpmaxsd	%ymm0, %ymm3, %ymm0
	vfmsub213ps	%ymm15, %ymm11, %ymm6
	vpminsd	%ymm5, %ymm1, %ymm3
	vpmaxsd	%ymm1, %ymm5, %ymm1
	vpminsd	%ymm6, %ymm2, %ymm5
	vpmaxsd	%ymm2, %ymm6, %ymm2
	vpmaxsd	%ymm7, %ymm3, %ymm3
	vpminsd	%ymm1, %ymm0, %ymm1
	vpmaxsd	%ymm5, %ymm4, %ymm0
	vpminsd	96(%rsp), %ymm2, %ymm2
	vpmaxsd	%ymm3, %ymm0, %ymm0
	vpminsd	%ymm2, %ymm1, %ymm1
	vpcmpgtd	%ymm1, %ymm0, %ymm1
	vmovmskps	%ymm1, %eax
	cmpl	$255, %eax
	jne	.LBB4_53
.LBB4_52:                               # %unlikely_cont_cascading_cascading.rv.i
                                        #   in Loop: Header=BB4_41 Depth=3
	testl	%r8d, %r8d
	movq	(%rsp), %rsi            # 8-byte Reload
	jne	.LBB4_54
	jmp	.LBB4_55
	.p2align	4, 0x90
.LBB4_53:                               # %unlikely_cont_cascading_cascading.rv.i.thread1
                                        #   in Loop: Header=BB4_41 Depth=3
	vpxor	%ymm12, %ymm1, %ymm1
	movq	%rdi, %rax
	shlq	$7, %rax
	movl	%edi, %edx
	notl	%edx
	movslq	%edx, %rdx
	imulq	$208, %rdx, %rdx
	addq	%r10, %rdx
	testl	%edi, %edi
	leaq	-128(%rbx,%rax), %rax
	cmovsq	%rdx, %rax
	movslq	%r11d, %rdx
	movl	%r9d, 2308(%rsp,%rdx,4)
	addq	$1, %rdx
	shlq	$5, %rdx
	vmovaps	%ymm8, 3072(%rsp,%rdx)
	vblendvps	%ymm1, %ymm0, %ymm14, %ymm8
	addl	$1, %r11d
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	movl	%edi, %r9d
	movq	%rbx, %rsi
.LBB4_54:                               # %while_head14.rv.i.backedge
                                        #   in Loop: Header=BB4_41 Depth=3
	movl	%r11d, %ecx
	movl	%r9d, %r13d
	testl	%r9d, %r9d
	jg	.LBB4_41
.LBB4_55:                               # %break67.rv.i
                                        #   in Loop: Header=BB4_5 Depth=2
	movl	%r9d, %r13d
	testl	%r9d, %r9d
	jns	.LBB4_4
	jmp	.LBB4_57
.LBB4_56:                               #   in Loop: Header=BB4_5 Depth=2
	movl	%ecx, %r11d
	movl	%r13d, %r9d
.LBB4_57:                               # %if_then71.rv.i
                                        #   in Loop: Header=BB4_5 Depth=2
	notl	%r9d
	movslq	%r11d, %r11
	movl	2304(%rsp,%r11,4), %r13d
	movq	%r11, %rax
	shlq	$5, %rax
	vmovaps	3072(%rsp,%rax), %ymm0
	vmovaps	%ymm0, 576(%rsp)        # 32-byte Spill
	addl	$-1, %r11d
	movslq	%r9d, %rdx
	imulq	$208, %rdx, %rsi
	addq	264(%rsp), %rsi         # 8-byte Folded Reload
.LBB4_58:                               # %while_head72.rv.i
                                        #   Parent Loop BB4_2 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB4_59 Depth 4
	movq	%rsi, %rdi
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB4_59:                               # %if_then78.rv.i
                                        #   Parent Loop BB4_2 Depth=1
                                        #     Parent Loop BB4_5 Depth=2
                                        #       Parent Loop BB4_58 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	(%rdi), %eax
	vmovd	%eax, %xmm0
	vpbroadcastd	%xmm0, %ymm15
	cmpl	$-1, %eax
	je	.LBB4_3
# BB#60:                                # %if_else79.rv.i
                                        #   in Loop: Header=BB4_59 Depth=4
	vmovdqa	%ymm15, 384(%rsp)       # 32-byte Spill
	vmovaps	96(%rsp), %ymm6
	vbroadcastss	-48(%rdi), %ymm1
	vbroadcastss	-32(%rdi), %ymm0
	vmovaps	1632(%rsp), %ymm11      # 32-byte Reload
	vmovaps	%ymm0, 128(%rsp)        # 32-byte Spill
	vmulps	%ymm0, %ymm11, %ymm0
	vmovaps	1664(%rsp), %ymm4       # 32-byte Reload
	vmovaps	%ymm1, 704(%rsp)        # 32-byte Spill
	vfmadd231ps	%ymm1, %ymm4, %ymm0
	vbroadcastss	-16(%rdi), %ymm1
	vmovaps	1600(%rsp), %ymm9       # 32-byte Reload
	vmovaps	%ymm1, 352(%rsp)        # 32-byte Spill
	vfmadd231ps	%ymm1, %ymm9, %ymm0
	vbroadcastss	-64(%rdi), %ymm1
	vbroadcastss	-80(%rdi), %ymm10
	vbroadcastss	-96(%rdi), %ymm13
	vbroadcastss	-192(%rdi), %ymm2
	vbroadcastss	-176(%rdi), %ymm3
	vbroadcastss	-160(%rdi), %ymm5
	vmovaps	%ymm6, 160(%rsp)        # 32-byte Spill
	vcmpltps	%ymm6, %ymm8, %ymm6
	vmovaps	%ymm6, 32(%rsp)         # 32-byte Spill
	vandps	1024(%rsp), %ymm0, %ymm6 # 32-byte Folded Reload
	vsubps	1056(%rsp), %ymm5, %ymm15 # 32-byte Folded Reload
	vsubps	1088(%rsp), %ymm3, %ymm3 # 32-byte Folded Reload
	vsubps	1120(%rsp), %ymm2, %ymm2 # 32-byte Folded Reload
	vmulps	%ymm15, %ymm4, %ymm5
	vmulps	%ymm3, %ymm9, %ymm7
	vfmsub231ps	%ymm15, %ymm11, %ymm7
	vfmsub231ps	%ymm2, %ymm9, %ymm5
	vmulps	%ymm5, %ymm10, %ymm10
	vfmadd213ps	%ymm10, %ymm7, %ymm13
	vmulps	%ymm2, %ymm11, %ymm10
	vfmsub231ps	%ymm3, %ymm4, %ymm10
	vfmadd213ps	%ymm13, %ymm10, %ymm1
	vmovaps	%ymm6, %ymm9
	vxorps	%ymm1, %ymm6, %ymm4
	vmovdqa	32(%rsp), %ymm6         # 32-byte Reload
	vxorps	%ymm1, %ymm1, %ymm1
	vcmpleps	%ymm4, %ymm1, %ymm1
	xorl	%eax, %eax
	vptest	%ymm1, %ymm6
	jne	.LBB4_64
# BB#61:                                #   in Loop: Header=BB4_59 Depth=4
	vmovaps	512(%rsp), %ymm13       # 32-byte Reload
.LBB4_62:                               # %rv_ballot_cont_cascading_cascading.rv.i
                                        #   in Loop: Header=BB4_59 Depth=4
	andnl	%r12d, %eax, %r12d
	je	.LBB4_70
.LBB4_63:                               # %range_step.rv.i
                                        #   in Loop: Header=BB4_59 Depth=4
	addq	$1, %rbx
	addq	$4, %rdi
	cmpq	$4, %rbx
	jl	.LBB4_59
	jmp	.LBB4_69
.LBB4_64:                               # %if_else_crit82.rv.i
                                        #   in Loop: Header=BB4_59 Depth=4
	vmovaps	%ymm15, 544(%rsp)       # 32-byte Spill
	vmovaps	%ymm4, 320(%rsp)        # 32-byte Spill
	vmovaps	128(%rsp), %ymm15       # 32-byte Reload
	vmovaps	160(%rsp), %ymm11       # 32-byte Reload
	vpand	%ymm6, %ymm1, %ymm4
	vbroadcastss	-128(%rdi), %ymm1
	vbroadcastss	-144(%rdi), %ymm13
	vbroadcastss	-112(%rdi), %ymm6
	vmulps	%ymm13, %ymm7, %ymm7
	vfmadd231ps	%ymm1, %ymm5, %ymm7
	vfmadd231ps	%ymm6, %ymm10, %ymm7
	vmovdqa	%ymm4, %ymm6
	vxorps	%ymm7, %ymm9, %ymm10
	vxorps	%ymm1, %ymm1, %ymm1
	vcmpleps	%ymm10, %ymm1, %ymm5
	vptest	%ymm5, %ymm6
	vmovaps	288(%rsp), %ymm4        # 32-byte Reload
	jne	.LBB4_66
# BB#65:                                #   in Loop: Header=BB4_59 Depth=4
	vmovaps	512(%rsp), %ymm13       # 32-byte Reload
	andnl	%r12d, %eax, %r12d
	jne	.LBB4_63
	jmp	.LBB4_70
.LBB4_66:                               # %if_else_crit87.rv.i
                                        #   in Loop: Header=BB4_59 Depth=4
	vbroadcastsd	.LCPI4_10(%rip), %ymm1
	vandps	%ymm1, %ymm0, %ymm0
	vpand	%ymm6, %ymm5, %ymm5
	vaddps	320(%rsp), %ymm10, %ymm1 # 32-byte Folded Reload
	vcmpleps	%ymm0, %ymm1, %ymm1
	vptest	%ymm1, %ymm5
	vmovaps	512(%rsp), %ymm13       # 32-byte Reload
	je	.LBB4_62
# BB#67:                                # %if_else_crit92.rv.i
                                        #   in Loop: Header=BB4_59 Depth=4
	vpand	%ymm5, %ymm1, %ymm5
	vmulps	%ymm0, %ymm11, %ymm1
	vcmpneq_usps	.LCPI4_14, %ymm0, %ymm6
	vmulps	%ymm3, %ymm15, %ymm3
	vfmadd132ps	704(%rsp), %ymm3, %ymm2 # 32-byte Folded Reload
	vmulps	%ymm0, %ymm4, %ymm3
	vmovaps	544(%rsp), %ymm4        # 32-byte Reload
	vfmadd132ps	352(%rsp), %ymm2, %ymm4 # 32-byte Folded Reload
	vxorps	%ymm4, %ymm9, %ymm2
	vcmpleps	%ymm1, %ymm2, %ymm1
	vcmpleps	%ymm2, %ymm3, %ymm3
	vandps	%ymm6, %ymm1, %ymm1
	vandps	%ymm3, %ymm1, %ymm3
	vptest	%ymm3, %ymm5
	je	.LBB4_62
# BB#68:                                # %if_else_crit97.rv.i
                                        #   in Loop: Header=BB4_59 Depth=4
	vrcpps	%ymm0, %ymm1
	vpand	%ymm5, %ymm3, %ymm3
	vmovaps	992(%rsp), %ymm4        # 32-byte Reload
	vfnmadd213ps	%ymm4, %ymm1, %ymm0
	vfmadd132ps	%ymm1, %ymm1, %ymm0
	vblendvps	%ymm3, %ymm0, %ymm4, %ymm0
	vpbroadcastd	.LCPI4_11(%rip), %ymm1
	vpand	384(%rsp), %ymm1, %ymm1 # 32-byte Folded Reload
	vmulps	320(%rsp), %ymm0, %ymm5 # 32-byte Folded Reload
	vmulps	%ymm0, %ymm10, %ymm6
	vmulps	%ymm0, %ymm2, %ymm0
	vpcmpeqd	.LCPI4_14, %ymm3, %ymm2
	vpxor	%ymm12, %ymm2, %ymm2
	vmaskmovps	%ymm0, %ymm2, 768(%rsp)
	vmaskmovps	%ymm5, %ymm2, 1248(%rsp)
	vmaskmovps	%ymm6, %ymm2, 1216(%rsp)
	vpmaskmovd	%ymm1, %ymm2, 736(%rsp)
	vpmaskmovd	%ymm0, %ymm2, 1184(%rsp)
	vbroadcastss	.LCPI4_12(%rip), %ymm0
	vmaskmovps	%ymm0, %ymm2, 96(%rsp)
	vmovmskps	%ymm3, %eax
	andnl	%r12d, %eax, %r12d
	jne	.LBB4_63
	jmp	.LBB4_70
	.p2align	4, 0x90
.LBB4_69:                               # %if_else75.rv.i
                                        #   in Loop: Header=BB4_58 Depth=3
	imulq	$208, %rdx, %rax
	addq	$1, %rdx
	addq	$208, %rsi
	cmpl	$0, 204(%r10,%rax)
	jns	.LBB4_58
	jmp	.LBB4_3
	.p2align	4, 0x90
.LBB4_70:                               # %exit
                                        #   in Loop: Header=BB4_2 Depth=1
	vmovaps	768(%rsp), %ymm0
	vmovaps	1248(%rsp), %ymm1
	vmovaps	1216(%rsp), %ymm2
	vmovaps	736(%rsp), %ymm3
	movq	%r14, %rax
	shlq	$7, %rax
	movq	232(%rsp), %rcx         # 8-byte Reload
	vmovups	%ymm3, (%rcx,%rax)
	vmovups	%ymm0, 32(%rcx,%rax)
	vmovups	%ymm1, 64(%rcx,%rax)
	vmovups	%ymm2, 96(%rcx,%rax)
	movq	%r15, %rsp
	addq	$1, %r14
	cmpq	16(%rsp), %r14          # 8-byte Folded Reload
	jl	.LBB4_2
.LBB4_71:                               # %if_else
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.Lfunc_end4:
	.size	cpu_occluded_bvh4_hybrid8_avx2, .Lfunc_end4-cpu_occluded_bvh4_hybrid8_avx2

	.globl	gpu_intersect_nvvm
	.p2align	4, 0x90
	.type	gpu_intersect_nvvm,@function
gpu_intersect_nvvm:                     # @gpu_intersect_nvvm
# BB#0:                                 # %gpu_intersect_nvvm_start
	retq
.Lfunc_end5:
	.size	gpu_intersect_nvvm, .Lfunc_end5-gpu_intersect_nvvm

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI6_0:
	.long	1065353216              # float 1
.LCPI6_1:
	.long	2147483648              # float -0
.LCPI6_2:
	.long	841731191               # float 9.99999993E-9
.LCPI6_3:
	.long	4                       # float 5.60519386E-45
.LCPI6_4:
	.long	1                       # 0x1
.LCPI6_5:
	.long	2                       # float 2.80259693E-45
.LCPI6_6:
	.long	16                      # 0x10
.LCPI6_7:
	.long	64                      # 0x40
.LCPI6_8:
	.long	32                      # 0x20
.LCPI6_9:
	.long	2139095039              # float 3.40282347E+38
.LCPI6_11:
	.long	2147483647              # 0x7fffffff
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI6_10:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI6_12:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
.LCPI6_14:
	.zero	16
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5
.LCPI6_13:
	.zero	32,255
	.text
	.globl	cpu_intersect_bvh4_hybrid8_avx2
	.p2align	4, 0x90
	.type	cpu_intersect_bvh4_hybrid8_avx2,@function
cpu_intersect_bvh4_hybrid8_avx2:        # @cpu_intersect_bvh4_hybrid8_avx2
# BB#0:                                 # %cpu_intersect_bvh4_hybrid8_avx2_start
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$4960, %rsp             # imm = 0x1360
                                        # kill: %ECX<def> %ECX<kill> %RCX<def>
	movq	%rdx, 160(%rsp)         # 8-byte Spill
	movq	%rsi, 152(%rsp)         # 8-byte Spill
	movq	%rcx, 48(%rsp)          # 8-byte Spill
	cmpl	$8, %ecx
	jl	.LBB6_103
# BB#1:                                 # %head.preheader.lr.ph
	movq	(%rdi), %r9
	movq	8(%rdi), %rcx
	movq	48(%rsp), %rax          # 8-byte Reload
	shrl	$3, %eax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	leaq	192(%rcx), %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	xorl	%r10d, %r10d
	vbroadcastss	.LCPI6_0(%rip), %ymm0
	vmovaps	%ymm0, 1312(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI6_1(%rip), %ymm0
	vmovaps	%ymm0, 1856(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI6_2(%rip), %ymm0
	vmovaps	%ymm0, 1824(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI6_1(%rip), %ymm0
	vmovaps	%ymm0, 1344(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI6_2(%rip), %ymm0
	vmovaps	%ymm0, 1792(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI6_3(%rip), %ymm0
	vmovaps	%ymm0, 1760(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI6_4(%rip), %ymm0
	vmovaps	%ymm0, 1728(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI6_5(%rip), %ymm0
	vmovaps	%ymm0, 1696(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI6_6(%rip), %ymm0
	vmovaps	%ymm0, 1664(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI6_7(%rip), %ymm0
	vmovaps	%ymm0, 1632(%rsp)       # 32-byte Spill
	vpbroadcastd	.LCPI6_8(%rip), %ymm0
	vmovdqa	%ymm0, 1600(%rsp)       # 32-byte Spill
	vpcmpeqd	%ymm0, %ymm0, %ymm0
	vbroadcastss	.LCPI6_9(%rip), %ymm1
	vmovaps	%ymm1, 320(%rsp)        # 32-byte Spill
                                        # implicit-def: %EAX
	movl	%eax, 40(%rsp)          # 4-byte Spill
                                        # implicit-def: %EAX
	movl	%eax, 36(%rsp)          # 4-byte Spill
	movq	%r9, 88(%rsp)           # 8-byte Spill
	.p2align	4, 0x90
.LBB6_2:                                # %body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_5 Depth 2
                                        #       Child Loop BB6_9 Depth 3
                                        #         Child Loop BB6_12 Depth 4
                                        #           Child Loop BB6_13 Depth 5
                                        #             Child Loop BB6_14 Depth 6
                                        #               Child Loop BB6_15 Depth 7
                                        #                 Child Loop BB6_18 Depth 8
                                        #             Child Loop BB6_58 Depth 6
                                        #       Child Loop BB6_67 Depth 3
                                        #       Child Loop BB6_94 Depth 3
                                        #         Child Loop BB6_95 Depth 4
	movq	%rsp, 168(%rsp)         # 8-byte Spill
	movq	%r10, %rcx
	shlq	$8, %rcx
	movq	152(%rsp), %rax         # 8-byte Reload
	vmovups	(%rax,%rcx), %ymm0
	vmovaps	%ymm0, 1408(%rsp)       # 32-byte Spill
	vmovups	32(%rax,%rcx), %ymm13
	vmovups	64(%rax,%rcx), %ymm0
	vmovaps	%ymm0, 1376(%rsp)       # 32-byte Spill
	vmovups	96(%rax,%rcx), %ymm15
	vrcpps	%ymm15, %ymm0
	vmovaps	%ymm0, %ymm1
	vmovaps	1312(%rsp), %ymm6       # 32-byte Reload
	vfnmadd213ps	%ymm6, %ymm15, %ymm1
	vfmadd132ps	%ymm0, %ymm0, %ymm1
	vmovaps	1856(%rsp), %ymm12      # 32-byte Reload
	vxorps	%ymm12, %ymm15, %ymm0
	vxorps	%ymm8, %ymm8, %ymm8
	vcmpltps	%ymm15, %ymm8, %ymm2
	vmovups	128(%rax,%rcx), %ymm11
	vrcpps	%ymm11, %ymm3
	vmovaps	%ymm3, %ymm4
	vfnmadd213ps	%ymm6, %ymm11, %ymm4
	vfmadd132ps	%ymm3, %ymm3, %ymm4
	vblendvps	%ymm2, %ymm15, %ymm0, %ymm0
	vmovups	160(%rax,%rcx), %ymm7
	vrcpps	%ymm7, %ymm3
	vmovaps	%ymm3, %ymm5
	vfnmadd213ps	%ymm6, %ymm7, %ymm5
	vfmadd132ps	%ymm3, %ymm3, %ymm5
	vmovups	192(%rax,%rcx), %ymm3
	vmovaps	%ymm3, 288(%rsp)        # 32-byte Spill
	vmovaps	1824(%rsp), %ymm6       # 32-byte Reload
	vcmpnlt_uqps	%ymm6, %ymm0, %ymm0
	vmovaps	1344(%rsp), %ymm9       # 32-byte Reload
	vandps	%ymm9, %ymm15, %ymm3
	vmovaps	1792(%rsp), %ymm10      # 32-byte Reload
	vorps	%ymm10, %ymm3, %ymm3
	vblendvps	%ymm0, %ymm1, %ymm3, %ymm0
	vmovaps	%ymm0, 352(%rsp)        # 32-byte Spill
	vcmpltps	%ymm11, %ymm8, %ymm3
	vxorps	%ymm12, %ymm11, %ymm0
	vblendvps	%ymm3, %ymm11, %ymm0, %ymm0
	vcmpnlt_uqps	%ymm6, %ymm0, %ymm0
	vandps	%ymm9, %ymm11, %ymm1
	vorps	%ymm10, %ymm1, %ymm1
	vblendvps	%ymm0, %ymm4, %ymm1, %ymm14
	vxorps	%ymm12, %ymm7, %ymm0
	vcmpltps	%ymm7, %ymm8, %ymm4
	vblendvps	%ymm4, %ymm7, %ymm0, %ymm0
	vcmpnlt_uqps	%ymm6, %ymm0, %ymm0
	vandps	%ymm9, %ymm7, %ymm1
	vorps	%ymm10, %ymm1, %ymm1
	vblendvps	%ymm0, %ymm5, %ymm1, %ymm9
	vmovdqu	224(%rax,%rcx), %ymm0
	vblendvps	%ymm4, 1760(%rsp), %ymm8, %ymm4 # 32-byte Folded Reload
	vpcmpeqd	%ymm8, %ymm2, %ymm2
	vmovdqa	1728(%rsp), %ymm1       # 32-byte Reload
	vpandn	%ymm1, %ymm2, %ymm5
	vblendvps	%ymm3, 1696(%rsp), %ymm8, %ymm3 # 32-byte Folded Reload
	vorps	%ymm5, %ymm4, %ymm4
	vorps	%ymm3, %ymm4, %ymm3
	vpsrld	$2, %ymm3, %ymm4
	vpsrld	$1, %ymm3, %ymm3
	vmovdqa	1664(%rsp), %ymm8       # 32-byte Reload
	vpandn	%ymm8, %ymm2, %ymm5
	vpand	%ymm1, %ymm4, %ymm2
	vpand	%ymm1, %ymm3, %ymm3
	vpxor	%ymm8, %ymm5, %ymm4
	vpslld	$4, %ymm2, %ymm2
	vpslld	$4, %ymm3, %ymm3
	vpor	1632(%rsp), %ymm2, %ymm6 # 32-byte Folded Reload
	vpor	1600(%rsp), %ymm3, %ymm3 # 32-byte Folded Reload
	vmovdqa	%ymm4, 2048(%rsp)
	vpxor	%ymm8, %ymm3, %ymm2
	vmovdqa	%ymm2, 2176(%rsp)
	vpxor	%ymm8, %ymm6, %ymm2
	vmovdqa	%ymm2, 2112(%rsp)
	vmovaps	1408(%rsp), %ymm8       # 32-byte Reload
	vmovaps	352(%rsp), %ymm10       # 32-byte Reload
	vmulps	%ymm10, %ymm8, %ymm1
	vmovdqa	%ymm5, 2144(%rsp)
	vmovaps	1376(%rsp), %ymm4       # 32-byte Reload
	vmulps	%ymm9, %ymm4, %ymm2
	vmovdqa	%ymm3, 2080(%rsp)
	vxorps	%ymm12, %ymm1, %ymm3
	vmovdqa	%ymm6, 2016(%rsp)
	vmovaps	%ymm14, %ymm5
	vmulps	%ymm5, %ymm13, %ymm14
	vmovaps	%ymm3, 2304(%rsp)
	vxorps	%ymm12, %ymm14, %ymm3
	vmovaps	%ymm3, 2272(%rsp)
	vmovaps	%ymm2, 384(%rsp)        # 32-byte Spill
	vxorps	%ymm12, %ymm2, %ymm3
	vmovaps	%ymm3, 2240(%rsp)
	vmovaps	%ymm8, %ymm2
	vmovaps	%ymm2, 2592(%rsp)
	vmovaps	%ymm13, 1984(%rsp)      # 32-byte Spill
	vmovaps	%ymm13, 2560(%rsp)
	vmovaps	%ymm4, %ymm2
	vmovaps	%ymm2, 2528(%rsp)
	vmovaps	%ymm15, 1952(%rsp)      # 32-byte Spill
	vmovaps	%ymm15, 2496(%rsp)
	vmovaps	%ymm1, %ymm15
	vmovaps	%ymm5, %ymm4
	vmovaps	%ymm10, %ymm2
	vmovaps	288(%rsp), %ymm1        # 32-byte Reload
	vmovaps	%ymm11, 1920(%rsp)      # 32-byte Spill
	vmovaps	%ymm11, 2464(%rsp)
	vmovaps	%ymm7, 1888(%rsp)       # 32-byte Spill
	vmovaps	%ymm7, 2432(%rsp)
	vmovaps	%ymm2, 2400(%rsp)
	vmovaps	%ymm4, 2368(%rsp)
	vmovaps	%ymm9, 2336(%rsp)
	vmovaps	%ymm1, 2208(%rsp)
	vmovdqa	%ymm0, 96(%rsp)
	vmovdqa	%ymm0, 768(%rsp)
	vpcmpeqd	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, 736(%rsp)
	vpcmpeqd	%ymm13, %ymm13, %ymm13
	vmovdqa	%ymm0, 1504(%rsp)
	movl	$0, 2624(%rsp)
	vmovaps	320(%rsp), %ymm0        # 32-byte Reload
	vmovaps	%ymm0, 2880(%rsp)
	movl	$1, %r14d
	xorl	%r11d, %r11d
	vmovaps	%ymm1, %ymm0
	vmovaps	%ymm4, 704(%rsp)        # 32-byte Spill
	vmovaps	%ymm9, 672(%rsp)        # 32-byte Spill
	vmovaps	%ymm15, 1440(%rsp)      # 32-byte Spill
	movq	%r10, 64(%rsp)          # 8-byte Spill
	testl	%r14d, %r14d
	jne	.LBB6_5
	jmp	.LBB6_102
.LBB6_3:                                #   in Loop: Header=BB6_5 Depth=2
	vpcmpeqd	%ymm13, %ymm13, %ymm13
	vmovaps	288(%rsp), %ymm1        # 32-byte Reload
	vmovaps	352(%rsp), %ymm2        # 32-byte Reload
	vmovaps	704(%rsp), %ymm4        # 32-byte Reload
	vmovaps	672(%rsp), %ymm9        # 32-byte Reload
	.p2align	4, 0x90
.LBB6_4:                                # %while_head.rv.i
                                        #   in Loop: Header=BB6_5 Depth=2
	testl	%r14d, %r14d
	je	.LBB6_102
.LBB6_5:                                # %while_head9.rv.i.preheader
                                        #   Parent Loop BB6_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB6_9 Depth 3
                                        #         Child Loop BB6_12 Depth 4
                                        #           Child Loop BB6_13 Depth 5
                                        #             Child Loop BB6_14 Depth 6
                                        #               Child Loop BB6_15 Depth 7
                                        #                 Child Loop BB6_18 Depth 8
                                        #             Child Loop BB6_58 Depth 6
                                        #       Child Loop BB6_67 Depth 3
                                        #       Child Loop BB6_94 Depth 3
                                        #         Child Loop BB6_95 Depth 4
	movslq	%r11d, %r11
	jmp	.LBB6_9
.LBB6_6:                                #   in Loop: Header=BB6_9 Depth=3
	movq	%r11, 72(%rsp)          # 8-byte Spill
.LBB6_7:                                # %next114.rv.i
                                        #   in Loop: Header=BB6_9 Depth=3
	movq	72(%rsp), %rcx          # 8-byte Reload
	movl	2624(%rsp,%rcx,4), %r14d
	testl	%r14d, %r14d
	je	.LBB6_101
# BB#8:                                 # %if_else117.rv.i
                                        #   in Loop: Header=BB6_9 Depth=3
	leaq	-1(%rcx), %rax
	shlq	$5, %rcx
	vmovaps	2880(%rsp,%rcx), %ymm0
	movq	%rax, %r11
	movq	64(%rsp), %r10          # 8-byte Reload
	vpcmpeqd	%ymm13, %ymm13, %ymm13
	vmovaps	288(%rsp), %ymm1        # 32-byte Reload
	vmovaps	352(%rsp), %ymm2        # 32-byte Reload
	vmovaps	704(%rsp), %ymm4        # 32-byte Reload
	vmovaps	672(%rsp), %ymm9        # 32-byte Reload
	vmovaps	1440(%rsp), %ymm15      # 32-byte Reload
	.p2align	4, 0x90
.LBB6_9:                                # %while_head9.rv.i
                                        #   Parent Loop BB6_2 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB6_12 Depth 4
                                        #           Child Loop BB6_13 Depth 5
                                        #             Child Loop BB6_14 Depth 6
                                        #               Child Loop BB6_15 Depth 7
                                        #                 Child Loop BB6_18 Depth 8
                                        #             Child Loop BB6_58 Depth 6
	vcmpltps	96(%rsp), %ymm0, %ymm3
	vmovmskps	%ymm3, %ecx
	testl	%ecx, %ecx
	je	.LBB6_6
# BB#10:                                # %if_then13.rv.i
                                        #   in Loop: Header=BB6_9 Depth=3
	popcntl	%ecx, %eax
	cmpl	$4, %eax
	ja	.LBB6_66
# BB#11:                                #   in Loop: Header=BB6_9 Depth=3
	movl	%r14d, 60(%rsp)         # 4-byte Spill
	movq	%r11, 72(%rsp)          # 8-byte Spill
	.p2align	4, 0x90
.LBB6_12:                               # %body.rv.i
                                        #   Parent Loop BB6_2 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        #       Parent Loop BB6_9 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB6_13 Depth 5
                                        #             Child Loop BB6_14 Depth 6
                                        #               Child Loop BB6_15 Depth 7
                                        #                 Child Loop BB6_18 Depth 8
                                        #             Child Loop BB6_58 Depth 6
	movq	%rcx, 184(%rsp)         # 8-byte Spill
	tzcntl	%ecx, %eax
	movl	2208(%rsp,%rax,4), %edx
	movl	96(%rsp,%rax,4), %ecx
	movl	%ecx, 4(%rsp)           # 4-byte Spill
	vbroadcastss	2368(%rsp,%rax,4), %xmm8
	vbroadcastss	2272(%rsp,%rax,4), %xmm10
	vbroadcastss	2400(%rsp,%rax,4), %xmm11
	vbroadcastss	2336(%rsp,%rax,4), %xmm15
	vbroadcastss	2304(%rsp,%rax,4), %xmm3
	vbroadcastss	2240(%rsp,%rax,4), %xmm6
	vbroadcastss	2496(%rsp,%rax,4), %xmm0
	vmovaps	%xmm0, 976(%rsp)        # 16-byte Spill
	vbroadcastss	2464(%rsp,%rax,4), %xmm0
	vmovaps	%xmm0, 128(%rsp)        # 16-byte Spill
	vbroadcastss	2432(%rsp,%rax,4), %xmm0
	vmovaps	%xmm0, 960(%rsp)        # 16-byte Spill
	vbroadcastss	2560(%rsp,%rax,4), %xmm0
	vmovaps	%xmm0, 944(%rsp)        # 16-byte Spill
	vbroadcastss	2528(%rsp,%rax,4), %xmm0
	vmovaps	%xmm0, 928(%rsp)        # 16-byte Spill
	vbroadcastss	2592(%rsp,%rax,4), %xmm0
	vmovaps	%xmm0, 912(%rsp)        # 16-byte Spill
	movslq	2016(%rsp,%rax,4), %rbx
	movslq	2112(%rsp,%rax,4), %rcx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	movslq	2048(%rsp,%rax,4), %r13
	movslq	2176(%rsp,%rax,4), %r10
	movslq	2080(%rsp,%rax,4), %r11
	movq	%rax, 176(%rsp)         # 8-byte Spill
	movslq	2144(%rsp,%rax,4), %r12
	movl	$0, 416(%rsp)
	movl	$2139095039, 1056(%rsp) # imm = 0x7F7FFFFF
	vmovd	%edx, %xmm0
	vpbroadcastd	%xmm0, %xmm0
	movl	$-1, 44(%rsp)           # 4-byte Folded Spill
	xorl	%r15d, %r15d
	movl	60(%rsp), %r8d          # 4-byte Reload
	movq	%rbx, 24(%rsp)          # 8-byte Spill
.LBB6_13:                               # %while_head1.rv.i.preheader.lr.ph
                                        #   Parent Loop BB6_2 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        #       Parent Loop BB6_9 Depth=3
                                        #         Parent Loop BB6_12 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB6_14 Depth 6
                                        #               Child Loop BB6_15 Depth 7
                                        #                 Child Loop BB6_18 Depth 8
                                        #             Child Loop BB6_58 Depth 6
	vmovd	4(%rsp), %xmm12         # 4-byte Folded Reload
	vpbroadcastd	%xmm12, %xmm13
	movl	%r8d, %edi
	movq	8(%rsp), %rax           # 8-byte Reload
	.p2align	4, 0x90
.LBB6_14:                               # %while_head1.rv.i.preheader
                                        #   Parent Loop BB6_2 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        #       Parent Loop BB6_9 Depth=3
                                        #         Parent Loop BB6_12 Depth=4
                                        #           Parent Loop BB6_13 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB6_15 Depth 7
                                        #                 Child Loop BB6_18 Depth 8
	testl	%edi, %edi
	jg	.LBB6_15
	jmp	.LBB6_56
.LBB6_17:                               # %if_then.rv.i.preheader
                                        #   in Loop: Header=BB6_15 Depth=7
	movslq	%r15d, %rax
	leaq	1060(%rsp), %rcx
	leaq	(%rcx,%rax,4), %rcx
	movq	%rcx, 224(%rsp)         # 8-byte Spill
	leaq	420(%rsp), %rcx
	leaq	(%rcx,%rax,4), %rax
	movq	%rax, 192(%rsp)         # 8-byte Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB6_18:                               # %if_then.rv.i
                                        #   Parent Loop BB6_2 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        #       Parent Loop BB6_9 Depth=3
                                        #         Parent Loop BB6_12 Depth=4
                                        #           Parent Loop BB6_13 Depth=5
                                        #             Parent Loop BB6_14 Depth=6
                                        #               Parent Loop BB6_15 Depth=7
                                        # =>              This Inner Loop Header: Depth=8
	tzcntl	%r14d, %eax
	movslq	96(%rdi,%rax,4), %rbx
	testq	%rbx, %rbx
	je	.LBB6_23
# BB#19:                                # %if_else24.rv.i
                                        #   in Loop: Header=BB6_18 Depth=8
	movq	%rcx, 256(%rsp)         # 8-byte Spill
	movq	%rbx, %r9
	movl	%ebx, %esi
	notl	%esi
	movslq	%esi, %rsi
	imulq	$208, %rsi, %rsi
	shlq	$7, %r9
	addq	16(%rsp), %rsi          # 8-byte Folded Reload
	testl	%ebx, %ebx
	movq	88(%rsp), %rcx          # 8-byte Reload
	leaq	-128(%rcx,%r9), %rcx
	movq	88(%rsp), %r9           # 8-byte Reload
	cmovsq	%rsi, %rcx
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	vmovdqa	%xmm5, 1040(%rsp)
	andl	$3, %eax
	vmovd	1040(%rsp,%rax,4), %xmm7 # xmm7 = mem[0],zero,zero,zero
	vmovd	%edx, %xmm1
	vucomiss	%xmm1, %xmm7
	jae	.LBB6_21
# BB#20:                                # %if_then_crit.rv.i14
                                        #   in Loop: Header=BB6_18 Depth=8
	movq	256(%rsp), %rcx         # 8-byte Reload
	movq	192(%rsp), %rax         # 8-byte Reload
	movl	%r8d, (%rax,%rcx,4)
	movq	224(%rsp), %rax         # 8-byte Reload
	movl	%edx, (%rax,%rcx,4)
	vmovd	%xmm7, %edx
	movl	%ebx, %r8d
	jmp	.LBB6_22
	.p2align	4, 0x90
.LBB6_21:                               # %if_else26.rv.i
                                        #   in Loop: Header=BB6_18 Depth=8
	movq	256(%rsp), %rcx         # 8-byte Reload
	movq	192(%rsp), %rax         # 8-byte Reload
	movl	%ebx, (%rax,%rcx,4)
	movq	224(%rsp), %rax         # 8-byte Reload
	vmovd	%xmm7, (%rax,%rcx,4)
.LBB6_22:                               # %next27.rv.i15
                                        #   in Loop: Header=BB6_18 Depth=8
	leal	-1(%r14), %eax
	addq	$1, %rcx
	andl	%r14d, %eax
	movl	%eax, %r14d
	jne	.LBB6_18
.LBB6_23:                               # %if_then.rv.i.break.rv.i16_crit_edge
                                        #   in Loop: Header=BB6_15 Depth=7
	addl	%ecx, %r15d
	cmpl	$2, %ecx
	movq	8(%rsp), %rax           # 8-byte Reload
	jge	.LBB6_25
# BB#24:                                # %next68.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	testl	%ecx, %ecx
	movq	24(%rsp), %rbx          # 8-byte Reload
	jne	.LBB6_53
	jmp	.LBB6_54
.LBB6_25:                               # %if_then31.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	movq	24(%rsp), %rbx          # 8-byte Reload
	jne	.LBB6_29
# BB#26:                                # %if_then_crit63.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	movslq	%r15d, %rax
	vmovss	1052(%rsp,%rax,4), %xmm5 # xmm5 = mem[0],zero,zero,zero
	vmovss	1056(%rsp,%rax,4), %xmm7 # xmm7 = mem[0],zero,zero,zero
	vucomiss	%xmm7, %xmm5
	jae	.LBB6_52
# BB#27:                                # %if_then65.rv.i22
                                        #   in Loop: Header=BB6_15 Depth=7
	leaq	-1(%rax), %rcx
	movl	416(%rsp,%rcx,4), %esi
	movl	416(%rsp,%rax,4), %edi
	vmovss	%xmm7, 1056(%rsp,%rcx,4)
	vmovss	%xmm5, 1056(%rsp,%rax,4)
	movl	%edi, 416(%rsp,%rcx,4)
	movl	%esi, 416(%rsp,%rax,4)
.LBB6_52:                               # %while_head1.rv.i.backedge
                                        #   in Loop: Header=BB6_15 Depth=7
	movq	8(%rsp), %rax           # 8-byte Reload
	jmp	.LBB6_53
.LBB6_29:                               # %if_then31.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	cmpl	$3, %ecx
	jne	.LBB6_39
# BB#30:                                # %if_then_crit53.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	movslq	%r15d, %rbx
	leaq	-1(%rbx), %rdi
	vmovss	1052(%rsp,%rbx,4), %xmm5 # xmm5 = mem[0],zero,zero,zero
	vmovss	1056(%rsp,%rbx,4), %xmm2 # xmm2 = mem[0],zero,zero,zero
	vucomiss	%xmm2, %xmm5
	jae	.LBB6_32
# BB#31:                                # %if_then55.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	movl	416(%rsp,%rdi,4), %eax
	movl	416(%rsp,%rbx,4), %ecx
	vmovss	%xmm2, 1056(%rsp,%rdi,4)
	vmovss	%xmm5, 1056(%rsp,%rbx,4)
	movl	%ecx, 416(%rsp,%rdi,4)
	movl	%eax, 416(%rsp,%rbx,4)
	vmovaps	%xmm2, %xmm1
	jmp	.LBB6_33
.LBB6_32:                               #   in Loop: Header=BB6_15 Depth=7
	vmovaps	%xmm5, %xmm1
	vmovaps	%xmm2, %xmm5
.LBB6_33:                               # %next56.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	leaq	-2(%rbx), %rax
	vmovss	1048(%rsp,%rbx,4), %xmm7 # xmm7 = mem[0],zero,zero,zero
	vucomiss	%xmm7, %xmm5
	jbe	.LBB6_35
# BB#34:                                # %if_then58.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	movl	416(%rsp,%rax,4), %ecx
	movl	416(%rsp,%rbx,4), %esi
	vmovss	%xmm5, 1056(%rsp,%rax,4)
	vmovss	%xmm7, 1056(%rsp,%rbx,4)
	movl	%esi, 416(%rsp,%rax,4)
	movl	%ecx, 416(%rsp,%rbx,4)
	jmp	.LBB6_36
.LBB6_35:                               #   in Loop: Header=BB6_15 Depth=7
	vmovaps	%xmm7, %xmm5
.LBB6_36:                               # %next59.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	movq	24(%rsp), %rbx          # 8-byte Reload
	vucomiss	%xmm1, %xmm5
	jae	.LBB6_52
# BB#37:                                # %if_then61.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	movl	416(%rsp,%rax,4), %ecx
	movl	416(%rsp,%rdi,4), %esi
	vmovss	%xmm1, 1056(%rsp,%rax,4)
	vmovss	%xmm5, 1056(%rsp,%rdi,4)
	movl	%esi, 416(%rsp,%rax,4)
	movl	%ecx, 416(%rsp,%rdi,4)
	jmp	.LBB6_52
.LBB6_39:                               # %if_else37.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	movq	%r9, %rsi
	movslq	%r15d, %rbx
	leaq	-2(%rbx), %r9
	leaq	-3(%rbx), %r14
	vmovss	1044(%rsp,%rbx,4), %xmm5 # xmm5 = mem[0],zero,zero,zero
	vmovss	1048(%rsp,%rbx,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm5
	jae	.LBB6_41
# BB#40:                                # %if_then39.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	movl	416(%rsp,%r14,4), %eax
	movl	416(%rsp,%r9,4), %ecx
	vmovss	%xmm1, 1056(%rsp,%r14,4)
	vmovss	%xmm5, 1056(%rsp,%r9,4)
	movl	%ecx, 416(%rsp,%r14,4)
	movl	%eax, 416(%rsp,%r9,4)
	vmovaps	%xmm5, %xmm2
	jmp	.LBB6_42
.LBB6_41:                               #   in Loop: Header=BB6_15 Depth=7
	vmovaps	%xmm1, %xmm2
	vmovaps	%xmm5, %xmm1
.LBB6_42:                               # %next40.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	leaq	-1(%rbx), %rdi
	vmovss	1052(%rsp,%rbx,4), %xmm7 # xmm7 = mem[0],zero,zero,zero
	vmovss	1056(%rsp,%rbx,4), %xmm5 # xmm5 = mem[0],zero,zero,zero
	vucomiss	%xmm5, %xmm7
	jae	.LBB6_46
# BB#43:                                # %if_then42.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	movl	416(%rsp,%rdi,4), %eax
	movl	416(%rsp,%rbx,4), %ecx
	vmovss	%xmm5, 1056(%rsp,%rdi,4)
	vmovss	%xmm7, 1056(%rsp,%rbx,4)
	movl	%ecx, 416(%rsp,%rdi,4)
	movl	%eax, 416(%rsp,%rbx,4)
	vmovaps	%xmm7, %xmm4
	vucomiss	%xmm5, %xmm1
	jb	.LBB6_47
	jmp	.LBB6_44
.LBB6_46:                               #   in Loop: Header=BB6_15 Depth=7
	vmovaps	%xmm5, %xmm4
	vmovaps	%xmm7, %xmm5
	vucomiss	%xmm5, %xmm1
	jae	.LBB6_44
.LBB6_47:                               # %if_then45.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	movl	416(%rsp,%r14,4), %eax
	movl	416(%rsp,%rdi,4), %ecx
	vmovss	%xmm5, 1056(%rsp,%r14,4)
	vmovss	%xmm1, 1056(%rsp,%rdi,4)
	movl	%ecx, 416(%rsp,%r14,4)
	movl	%eax, 416(%rsp,%rdi,4)
	vucomiss	%xmm4, %xmm2
	jae	.LBB6_45
	jmp	.LBB6_48
.LBB6_44:                               #   in Loop: Header=BB6_15 Depth=7
	vmovaps	%xmm5, %xmm1
	vucomiss	%xmm4, %xmm2
	jae	.LBB6_45
.LBB6_48:                               # %if_then48.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	movl	416(%rsp,%r9,4), %eax
	movl	416(%rsp,%rbx,4), %ecx
	vmovss	%xmm4, 1056(%rsp,%r9,4)
	vmovss	%xmm2, 1056(%rsp,%rbx,4)
	movl	%ecx, 416(%rsp,%r9,4)
	movl	%eax, 416(%rsp,%rbx,4)
	jmp	.LBB6_49
.LBB6_45:                               #   in Loop: Header=BB6_15 Depth=7
	vmovaps	%xmm2, %xmm4
.LBB6_49:                               # %next49.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	vucomiss	%xmm1, %xmm4
	movq	24(%rsp), %rbx          # 8-byte Reload
	jae	.LBB6_51
# BB#50:                                # %if_then51.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	movl	416(%rsp,%r9,4), %eax
	movl	416(%rsp,%rdi,4), %ecx
	vmovss	%xmm1, 1056(%rsp,%r9,4)
	vmovss	%xmm4, 1056(%rsp,%rdi,4)
	movl	%ecx, 416(%rsp,%r9,4)
	movl	%eax, 416(%rsp,%rdi,4)
.LBB6_51:                               #   in Loop: Header=BB6_15 Depth=7
	movq	%rsi, %r9
	jmp	.LBB6_52
	.p2align	4, 0x90
.LBB6_15:                               # %while_body5.rv.i
                                        #   Parent Loop BB6_2 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        #       Parent Loop BB6_9 Depth=3
                                        #         Parent Loop BB6_12 Depth=4
                                        #           Parent Loop BB6_13 Depth=5
                                        #             Parent Loop BB6_14 Depth=6
                                        # =>            This Loop Header: Depth=7
                                        #                 Child Loop BB6_18 Depth 8
	vmovd	%edx, %xmm5
	movslq	%r15d, %r15
	movl	416(%rsp,%r15,4), %r8d
	movl	1056(%rsp,%r15,4), %edx
	addl	$-1, %r15d
	vucomiss	%xmm5, %xmm12
	jbe	.LBB6_53
# BB#16:                                # %if_else.rv.i
                                        #   in Loop: Header=BB6_15 Depth=7
	movslq	%edi, %rdi
	addq	$-1, %rdi
	shlq	$7, %rdi
	addq	%r9, %rdi
	vmovaps	(%r11,%rdi), %xmm5
	vfmadd213ps	%xmm10, %xmm8, %xmm5
	vmovaps	(%r10,%rdi), %xmm7
	vfmadd213ps	%xmm10, %xmm8, %xmm7
	vmovaps	(%r13,%rdi), %xmm9
	vfmadd213ps	%xmm3, %xmm11, %xmm9
	vmovaps	(%r12,%rdi), %xmm1
	vfmadd213ps	%xmm3, %xmm11, %xmm1
	vmovaps	(%rax,%rdi), %xmm2
	vfmadd213ps	%xmm6, %xmm15, %xmm2
	vmovaps	(%rbx,%rdi), %xmm4
	vfmadd213ps	%xmm6, %xmm15, %xmm4
	vpmaxsd	%xmm9, %xmm7, %xmm7
	vpminsd	%xmm5, %xmm1, %xmm1
	vpmaxsd	%xmm2, %xmm0, %xmm2
	vpminsd	%xmm13, %xmm4, %xmm4
	vpmaxsd	%xmm7, %xmm2, %xmm5
	vpminsd	%xmm4, %xmm1, %xmm1
	vpcmpgtd	%xmm1, %xmm5, %xmm1
	vmovmskps	%xmm1, %r14d
	xorl	$15, %r14d
	jne	.LBB6_17
.LBB6_53:                               # %while_head1.rv.i.backedge
                                        #   in Loop: Header=BB6_15 Depth=7
	movl	%r8d, %edi
	testl	%r8d, %r8d
	jg	.LBB6_15
.LBB6_54:                               # %break73.rv.i
                                        #   in Loop: Header=BB6_14 Depth=6
	movl	%r8d, %edi
	testl	%r8d, %r8d
	js	.LBB6_56
.LBB6_55:                               # %while_head.rv.i1.backedge
                                        #   in Loop: Header=BB6_14 Depth=6
	movl	%r8d, %edi
	testl	%r8d, %r8d
	jne	.LBB6_14
	jmp	.LBB6_63
.LBB6_56:                               # %if_then77.rv.i26
                                        #   in Loop: Header=BB6_14 Depth=6
	vmovd	%edx, %xmm1
	movslq	%r15d, %r15
	movl	416(%rsp,%r15,4), %r8d
	movl	1056(%rsp,%r15,4), %edx
	addl	$-1, %r15d
	vucomiss	%xmm1, %xmm12
	jbe	.LBB6_55
# BB#57:                                # %head.rv.i29.preheader
                                        #   in Loop: Header=BB6_13 Depth=5
	notl	%edi
	movslq	%edi, %rax
	imulq	$208, %rax, %rdi
	addq	80(%rsp), %rdi          # 8-byte Folded Reload
	jmp	.LBB6_58
.LBB6_59:                               # %if_else_crit.rv.i.i
                                        #   in Loop: Header=BB6_58 Depth=6
	vmovaps	%xmm2, 800(%rsp)        # 16-byte Spill
	vandps	%xmm5, %xmm7, %xmm1
	vmovaps	%xmm1, 816(%rsp)        # 16-byte Spill
	vmovd	4(%rsp), %xmm1          # 4-byte Folded Reload
	vcmpneq_usps	.LCPI6_14, %xmm12, %xmm9
	vmovaps	832(%rsp), %xmm2        # 16-byte Reload
	vmulps	880(%rsp), %xmm2, %xmm5 # 16-byte Folded Reload
	vpbroadcastd	%xmm1, %xmm1
	vmulps	%xmm12, %xmm1, %xmm1
	vmovaps	864(%rsp), %xmm2        # 16-byte Reload
	vfmadd132ps	896(%rsp), %xmm5, %xmm2 # 16-byte Folded Reload
	vmulps	%xmm12, %xmm0, %xmm7
	vmovaps	848(%rsp), %xmm5        # 16-byte Reload
	vfmadd132ps	192(%rsp), %xmm2, %xmm5 # 16-byte Folded Reload
	vxorps	%xmm5, %xmm4, %xmm5
	vcmpleps	%xmm1, %xmm5, %xmm1
	vcmpleps	%xmm5, %xmm7, %xmm4
	vandps	%xmm9, %xmm1, %xmm1
	vandps	%xmm4, %xmm1, %xmm7
	vmovdqa	816(%rsp), %xmm1        # 16-byte Reload
	vptest	%xmm7, %xmm1
	je	.LBB6_61
# BB#60:                                # %if_then.rv.i.i
                                        #   in Loop: Header=BB6_58 Depth=6
	vpand	%xmm1, %xmm7, %xmm1
	vrcpps	%xmm12, %xmm2
	vbroadcastss	.LCPI6_0(%rip), %xmm4
	vfnmadd213ps	%xmm4, %xmm2, %xmm12
	vfmadd132ps	%xmm2, %xmm2, %xmm12
	vmulps	%xmm5, %xmm12, %xmm2
	vbroadcastss	.LCPI6_9(%rip), %xmm4
	vblendvps	%xmm1, %xmm2, %xmm4, %xmm1
	vpermilpd	$1, %xmm1, %xmm4 # xmm4 = xmm1[1,0]
	vpminsd	%xmm4, %xmm1, %xmm4
	vpshufd	$57, %xmm4, %xmm5       # xmm5 = xmm4[1,2,3,0]
	vpminsd	%xmm5, %xmm4, %xmm4
	vcmpeqps	%xmm4, %xmm1, %xmm1
	vmovmskps	%xmm1, %eax
	tzcntl	%eax, %eax
	movl	(%rdi,%rax,4), %esi
                                        # kill: %EAX<def> %EAX<kill> %RAX<kill> %RAX<def>
	andl	$3, %eax
	vmulps	%xmm13, %xmm12, %xmm1
	vmulps	800(%rsp), %xmm12, %xmm4 # 16-byte Folded Reload
	movl	$2147483647, %ecx       # imm = 0x7FFFFFFF
	andl	%ecx, %esi
	movl	%esi, 44(%rsp)          # 4-byte Spill
	vmovaps	%xmm2, 992(%rsp)
	movl	992(%rsp,%rax,4), %ecx
	movl	%ecx, 4(%rsp)           # 4-byte Spill
	vmovaps	%xmm1, 1008(%rsp)
	movl	1008(%rsp,%rax,4), %ecx
	movl	%ecx, 40(%rsp)          # 4-byte Spill
	vmovaps	%xmm4, 1024(%rsp)
	movl	1024(%rsp,%rax,4), %eax
	movl	%eax, 36(%rsp)          # 4-byte Spill
	jmp	.LBB6_61
	.p2align	4, 0x90
.LBB6_58:                               # %while_head.rv.i.i
                                        #   Parent Loop BB6_2 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        #       Parent Loop BB6_9 Depth=3
                                        #         Parent Loop BB6_12 Depth=4
                                        #           Parent Loop BB6_13 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	vmovaps	-48(%rdi), %xmm4
	vmovaps	-32(%rdi), %xmm1
	vmovaps	-16(%rdi), %xmm2
	vmovaps	%xmm1, 896(%rsp)        # 16-byte Spill
	vmulps	128(%rsp), %xmm1, %xmm1 # 16-byte Folded Reload
	vmovaps	976(%rsp), %xmm12       # 16-byte Reload
	vmovaps	%xmm4, 880(%rsp)        # 16-byte Spill
	vfmadd231ps	%xmm4, %xmm12, %xmm1
	vmovaps	960(%rsp), %xmm13       # 16-byte Reload
	vmovaps	%xmm2, 192(%rsp)        # 16-byte Spill
	vfmadd231ps	%xmm2, %xmm13, %xmm1
	vandps	.LCPI6_12(%rip), %xmm1, %xmm2
	vmovaps	%xmm2, 224(%rsp)        # 16-byte Spill
	vmovaps	-192(%rdi), %xmm9
	vmovaps	-176(%rdi), %xmm4
	vmovaps	-160(%rdi), %xmm2
	vbroadcastss	.LCPI6_1(%rip), %xmm7
	vandps	%xmm7, %xmm1, %xmm1
	vmovaps	%xmm1, 256(%rsp)        # 16-byte Spill
	vsubps	944(%rsp), %xmm4, %xmm4 # 16-byte Folded Reload
	vsubps	928(%rsp), %xmm2, %xmm7 # 16-byte Folded Reload
	vsubps	912(%rsp), %xmm9, %xmm5 # 16-byte Folded Reload
	vmulps	%xmm4, %xmm13, %xmm1
	vmulps	%xmm7, %xmm12, %xmm2
	vmulps	128(%rsp), %xmm5, %xmm9 # 16-byte Folded Reload
	vmovaps	%xmm4, 864(%rsp)        # 16-byte Spill
	vfmsub231ps	%xmm4, %xmm12, %xmm9
	vmovaps	%xmm5, 832(%rsp)        # 16-byte Spill
	vfmsub231ps	%xmm5, %xmm13, %xmm2
	vmovaps	224(%rsp), %xmm12       # 16-byte Reload
	vmulps	-80(%rdi), %xmm2, %xmm5
	vmovaps	%xmm7, 848(%rsp)        # 16-byte Spill
	vfmsub231ps	128(%rsp), %xmm7, %xmm1 # 16-byte Folded Reload
	vmulps	-128(%rdi), %xmm2, %xmm2
	vfmadd231ps	-96(%rdi), %xmm1, %xmm5
	vfmadd231ps	-144(%rdi), %xmm1, %xmm2
	vfmadd231ps	-64(%rdi), %xmm9, %xmm5
	vfmadd231ps	-112(%rdi), %xmm9, %xmm2
	vmovaps	256(%rsp), %xmm1        # 16-byte Reload
	vxorps	%xmm5, %xmm1, %xmm13
	vmovaps	%xmm1, %xmm4
	vxorps	%xmm2, %xmm1, %xmm5
	vxorps	%xmm2, %xmm2, %xmm2
	vcmpleps	%xmm13, %xmm2, %xmm1
	vcmpleps	%xmm5, %xmm2, %xmm2
	vandps	%xmm1, %xmm2, %xmm7
	vmovaps	%xmm5, %xmm2
	vaddps	%xmm2, %xmm13, %xmm1
	vcmpleps	%xmm12, %xmm1, %xmm5
	vptest	%xmm5, %xmm7
	jne	.LBB6_59
.LBB6_61:                               # %next.rv.i.i
                                        #   in Loop: Header=BB6_58 Depth=6
	cmpl	$0, 12(%rdi)
	leaq	208(%rdi), %rdi
	jns	.LBB6_58
# BB#62:                                # %lambda_2675782_vectorize.exit.i
                                        #   in Loop: Header=BB6_13 Depth=5
	testl	%r8d, %r8d
	jne	.LBB6_13
	.p2align	4, 0x90
.LBB6_63:                               # %exit166.rv.i
                                        #   in Loop: Header=BB6_12 Depth=4
	movl	44(%rsp), %edi          # 4-byte Reload
	testl	%edi, %edi
	js	.LBB6_65
# BB#64:                                # %if_then160.rv.i
                                        #   in Loop: Header=BB6_12 Depth=4
	movq	176(%rsp), %rdx         # 8-byte Reload
	movl	%edx, %eax
	andl	$7, %eax
	movl	4(%rsp), %esi           # 4-byte Reload
	movl	%esi, 768(%rsp,%rdx,4)
	movl	40(%rsp), %ecx          # 4-byte Reload
	movl	%ecx, 1568(%rsp,%rdx,4)
	movl	36(%rsp), %ecx          # 4-byte Reload
	movl	%ecx, 1536(%rsp,%rdx,4)
	movl	%edi, 736(%rsp,%rdx,4)
	movl	$-1, 1504(%rsp,%rdx,4)
	vmovaps	96(%rsp), %ymm0
	vmovaps	%ymm0, 1472(%rsp)
	movl	%esi, 1472(%rsp,%rax,4)
	vmovaps	1472(%rsp), %ymm0
	vmovaps	%ymm0, 96(%rsp)
.LBB6_65:                               # %next165.rv.i
                                        #   in Loop: Header=BB6_12 Depth=4
	movq	184(%rsp), %rcx         # 8-byte Reload
	leal	-1(%rcx), %eax
	andl	%ecx, %eax
	movl	%eax, %ecx
	jne	.LBB6_12
	jmp	.LBB6_7
	.p2align	4, 0x90
.LBB6_66:                               # %while_head14.rv.i.preheader
                                        #   in Loop: Header=BB6_5 Depth=2
	movl	%r14d, %eax
	.p2align	4, 0x90
.LBB6_67:                               # %while_head14.rv.i
                                        #   Parent Loop BB6_2 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	testl	%eax, %eax
	jle	.LBB6_90
# BB#68:                                # %while_body18.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	movslq	%r11d, %rbx
	movl	2624(%rsp,%rbx,4), %r14d
	movq	%rbx, %rdi
	shlq	$5, %rdi
	vmovaps	2880(%rsp,%rdi), %ymm0
	leal	-1(%rbx), %ecx
	movslq	%eax, %rdx
	addq	$-1, %rdx
	shlq	$7, %rdx
	movslq	96(%r9,%rdx), %rsi
	testq	%rsi, %rsi
	je	.LBB6_91
# BB#69:                                # %if_else21.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	vbroadcastss	(%r9,%rdx), %ymm3
	vfmsub213ps	%ymm15, %ymm2, %ymm3
	vbroadcastss	32(%r9,%rdx), %ymm5
	vfmsub213ps	%ymm14, %ymm4, %ymm5
	vbroadcastss	64(%r9,%rdx), %ymm6
	vmovaps	384(%rsp), %ymm12       # 32-byte Reload
	vfmsub213ps	%ymm12, %ymm9, %ymm6
	vbroadcastss	16(%r9,%rdx), %ymm7
	vfmsub213ps	%ymm15, %ymm2, %ymm7
	vbroadcastss	48(%r9,%rdx), %ymm8
	vfmsub213ps	%ymm14, %ymm4, %ymm8
	vbroadcastss	80(%r9,%rdx), %ymm10
	vpminsd	%ymm7, %ymm3, %ymm11
	vpmaxsd	%ymm3, %ymm7, %ymm3
	vfmsub213ps	%ymm12, %ymm9, %ymm10
	vpminsd	%ymm8, %ymm5, %ymm7
	vpmaxsd	%ymm5, %ymm8, %ymm5
	vpminsd	%ymm10, %ymm6, %ymm8
	vpmaxsd	%ymm6, %ymm10, %ymm6
	vpmaxsd	%ymm11, %ymm7, %ymm7
	vpminsd	%ymm5, %ymm3, %ymm5
	vpmaxsd	%ymm8, %ymm1, %ymm3
	vpminsd	96(%rsp), %ymm6, %ymm6
	vpmaxsd	%ymm7, %ymm3, %ymm3
	vpminsd	%ymm6, %ymm5, %ymm5
	vpcmpgtd	%ymm5, %ymm3, %ymm5
	vmovmskps	%ymm5, %eax
	xorl	%r8d, %r8d
	cmpl	$255, %eax
	jne	.LBB6_71
# BB#70:                                #   in Loop: Header=BB6_67 Depth=3
	movl	%ecx, %r11d
	jmp	.LBB6_74
	.p2align	4, 0x90
.LBB6_71:                               # %if_then24.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	vpxor	%ymm13, %ymm5, %ymm5
	vmovaps	320(%rsp), %ymm6        # 32-byte Reload
	vblendvps	%ymm5, %ymm3, %ymm6, %ymm3
	vcmpltps	%ymm0, %ymm3, %ymm5
	vptest	%ymm5, %ymm5
	jne	.LBB6_73
# BB#72:                                # %if_else25.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	leaq	2880(%rsp,%rdi), %rax
	movl	%esi, 2624(%rsp,%rbx,4)
	vmovaps	%ymm3, (%rax)
	movl	$1, %r8d
	jmp	.LBB6_74
.LBB6_73:                               # %if_then_crit.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	movl	%esi, %eax
	notl	%eax
	movq	%rsi, %rcx
	cltq
	imulq	$208, %rax, %rax
	shlq	$7, %rcx
	addq	16(%rsp), %rax          # 8-byte Folded Reload
	testl	%esi, %esi
	leaq	-128(%r9,%rcx), %rcx
	cmovsq	%rax, %rcx
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	movl	$1, %r8d
	movl	%esi, %r14d
	vmovaps	%ymm3, %ymm0
	.p2align	4, 0x90
.LBB6_74:                               # %next28.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	movslq	100(%r9,%rdx), %rsi
	testq	%rsi, %rsi
	je	.LBB6_89
# BB#75:                                # %if_else31.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	vbroadcastss	4(%r9,%rdx), %ymm3
	vfmsub213ps	%ymm15, %ymm2, %ymm3
	vbroadcastss	36(%r9,%rdx), %ymm5
	vfmsub213ps	%ymm14, %ymm4, %ymm5
	vbroadcastss	68(%r9,%rdx), %ymm6
	vmovaps	384(%rsp), %ymm12       # 32-byte Reload
	vfmsub213ps	%ymm12, %ymm9, %ymm6
	vbroadcastss	20(%r9,%rdx), %ymm7
	vfmsub213ps	%ymm15, %ymm2, %ymm7
	vbroadcastss	52(%r9,%rdx), %ymm8
	vfmsub213ps	%ymm14, %ymm4, %ymm8
	vbroadcastss	84(%r9,%rdx), %ymm10
	vpminsd	%ymm7, %ymm3, %ymm11
	vpmaxsd	%ymm3, %ymm7, %ymm3
	vfmsub213ps	%ymm12, %ymm9, %ymm10
	vpminsd	%ymm8, %ymm5, %ymm7
	vpmaxsd	%ymm5, %ymm8, %ymm5
	vpminsd	%ymm10, %ymm6, %ymm8
	vpmaxsd	%ymm6, %ymm10, %ymm6
	vpmaxsd	%ymm11, %ymm7, %ymm7
	vpminsd	%ymm5, %ymm3, %ymm5
	vpmaxsd	%ymm8, %ymm1, %ymm3
	vpminsd	96(%rsp), %ymm6, %ymm6
	vpmaxsd	%ymm7, %ymm3, %ymm3
	vpminsd	%ymm6, %ymm5, %ymm5
	vpcmpgtd	%ymm5, %ymm3, %ymm5
	vmovmskps	%ymm5, %eax
	cmpl	$255, %eax
	je	.LBB6_79
# BB#76:                                # %if_then35.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	vpxor	%ymm13, %ymm5, %ymm5
	vmovaps	320(%rsp), %ymm6        # 32-byte Reload
	vblendvps	%ymm5, %ymm3, %ymm6, %ymm3
	addl	$1, %r8d
	vcmpltps	%ymm0, %ymm3, %ymm5
	vptest	%ymm5, %ymm5
	jne	.LBB6_78
# BB#77:                                # %if_else38.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	movslq	%r11d, %rax
	addl	$1, %r11d
	movl	%esi, 2628(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm3, 2880(%rsp,%rax)
	jmp	.LBB6_79
.LBB6_78:                               # %if_then_crit39.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	movl	%esi, %eax
	notl	%eax
	movq	%rsi, %rcx
	shlq	$7, %rcx
	movslq	%r11d, %rdi
	addl	$1, %r11d
	cltq
	imulq	$208, %rax, %rax
	addq	16(%rsp), %rax          # 8-byte Folded Reload
	testl	%esi, %esi
	leaq	-128(%r9,%rcx), %rcx
	cmovsq	%rax, %rcx
	movl	%r14d, 2628(%rsp,%rdi,4)
	leaq	1(%rdi), %rax
	shlq	$5, %rax
	vmovaps	%ymm0, 2880(%rsp,%rax)
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	movl	%esi, %r14d
	vmovaps	%ymm3, %ymm0
	.p2align	4, 0x90
.LBB6_79:                               # %next43.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	movslq	104(%r9,%rdx), %rsi
	testq	%rsi, %rsi
	je	.LBB6_89
# BB#80:                                # %if_else46.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	vbroadcastss	8(%r9,%rdx), %ymm3
	vfmsub213ps	%ymm15, %ymm2, %ymm3
	vbroadcastss	40(%r9,%rdx), %ymm5
	vfmsub213ps	%ymm14, %ymm4, %ymm5
	vbroadcastss	72(%r9,%rdx), %ymm6
	vmovaps	384(%rsp), %ymm12       # 32-byte Reload
	vfmsub213ps	%ymm12, %ymm9, %ymm6
	vbroadcastss	24(%r9,%rdx), %ymm7
	vfmsub213ps	%ymm15, %ymm2, %ymm7
	vbroadcastss	56(%r9,%rdx), %ymm8
	vfmsub213ps	%ymm14, %ymm4, %ymm8
	vbroadcastss	88(%r9,%rdx), %ymm10
	vpminsd	%ymm7, %ymm3, %ymm11
	vpmaxsd	%ymm3, %ymm7, %ymm3
	vfmsub213ps	%ymm12, %ymm9, %ymm10
	vpminsd	%ymm8, %ymm5, %ymm7
	vpmaxsd	%ymm5, %ymm8, %ymm5
	vpminsd	%ymm10, %ymm6, %ymm8
	vpmaxsd	%ymm6, %ymm10, %ymm6
	vpmaxsd	%ymm11, %ymm7, %ymm7
	vpminsd	%ymm5, %ymm3, %ymm5
	vpmaxsd	%ymm8, %ymm1, %ymm3
	vpminsd	96(%rsp), %ymm6, %ymm6
	vpmaxsd	%ymm7, %ymm3, %ymm3
	vpminsd	%ymm6, %ymm5, %ymm5
	vpcmpgtd	%ymm5, %ymm3, %ymm5
	vmovmskps	%ymm5, %eax
	cmpl	$255, %eax
	je	.LBB6_84
# BB#81:                                # %if_then50.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	vpxor	%ymm13, %ymm5, %ymm5
	vmovaps	320(%rsp), %ymm6        # 32-byte Reload
	vblendvps	%ymm5, %ymm3, %ymm6, %ymm3
	addl	$1, %r8d
	vcmpltps	%ymm0, %ymm3, %ymm5
	vptest	%ymm5, %ymm5
	jne	.LBB6_83
# BB#82:                                # %if_else53.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	movslq	%r11d, %rax
	addl	$1, %r11d
	movl	%esi, 2628(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm3, 2880(%rsp,%rax)
	jmp	.LBB6_84
.LBB6_83:                               # %if_then_crit54.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	movl	%esi, %eax
	notl	%eax
	movq	%rsi, %rcx
	shlq	$7, %rcx
	movslq	%r11d, %rdi
	addl	$1, %r11d
	cltq
	imulq	$208, %rax, %rax
	addq	16(%rsp), %rax          # 8-byte Folded Reload
	testl	%esi, %esi
	leaq	-128(%r9,%rcx), %rcx
	cmovsq	%rax, %rcx
	movl	%r14d, 2628(%rsp,%rdi,4)
	leaq	1(%rdi), %rax
	shlq	$5, %rax
	vmovaps	%ymm0, 2880(%rsp,%rax)
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	movl	%esi, %r14d
	vmovaps	%ymm3, %ymm0
	.p2align	4, 0x90
.LBB6_84:                               # %next58.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	movslq	108(%r9,%rdx), %rsi
	testq	%rsi, %rsi
	je	.LBB6_89
# BB#85:                                # %if_else61.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	vbroadcastss	12(%r9,%rdx), %ymm3
	vfmsub213ps	%ymm15, %ymm2, %ymm3
	vbroadcastss	44(%r9,%rdx), %ymm5
	vfmsub213ps	%ymm14, %ymm4, %ymm5
	vbroadcastss	76(%r9,%rdx), %ymm6
	vmovaps	384(%rsp), %ymm12       # 32-byte Reload
	vfmsub213ps	%ymm12, %ymm9, %ymm6
	vbroadcastss	28(%r9,%rdx), %ymm7
	vfmsub213ps	%ymm15, %ymm2, %ymm7
	vbroadcastss	60(%r9,%rdx), %ymm8
	vfmsub213ps	%ymm14, %ymm4, %ymm8
	vbroadcastss	92(%r9,%rdx), %ymm10
	vpminsd	%ymm7, %ymm3, %ymm11
	vpmaxsd	%ymm3, %ymm7, %ymm3
	vfmsub213ps	%ymm12, %ymm9, %ymm10
	vpminsd	%ymm8, %ymm5, %ymm7
	vpmaxsd	%ymm5, %ymm8, %ymm5
	vpminsd	%ymm10, %ymm6, %ymm8
	vpmaxsd	%ymm6, %ymm10, %ymm6
	vpmaxsd	%ymm11, %ymm7, %ymm7
	vpminsd	%ymm5, %ymm3, %ymm5
	vpmaxsd	%ymm8, %ymm1, %ymm3
	vpminsd	96(%rsp), %ymm6, %ymm6
	vpmaxsd	%ymm7, %ymm3, %ymm3
	vpminsd	%ymm6, %ymm5, %ymm5
	vpcmpgtd	%ymm5, %ymm3, %ymm5
	vmovmskps	%ymm5, %eax
	cmpl	$255, %eax
	je	.LBB6_89
# BB#86:                                # %if_then65.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	vpxor	%ymm13, %ymm5, %ymm5
	vmovaps	320(%rsp), %ymm6        # 32-byte Reload
	vblendvps	%ymm5, %ymm3, %ymm6, %ymm3
	addl	$1, %r8d
	vcmpltps	%ymm0, %ymm3, %ymm5
	vptest	%ymm5, %ymm5
	jne	.LBB6_88
# BB#87:                                # %if_else68.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	movslq	%r11d, %rax
	addl	$1, %r11d
	movl	%esi, 2628(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm3, 2880(%rsp,%rax)
	jmp	.LBB6_89
.LBB6_88:                               # %if_then_crit69.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	movq	%rsi, %rax
	shlq	$7, %rax
	movslq	%r11d, %rcx
	addl	$1, %r11d
	movl	%esi, %edx
	notl	%edx
	movslq	%edx, %rdx
	imulq	$208, %rdx, %rdx
	addq	16(%rsp), %rdx          # 8-byte Folded Reload
	testl	%esi, %esi
	leaq	-128(%r9,%rax), %rax
	cmovsq	%rdx, %rax
	movl	%r14d, 2628(%rsp,%rcx,4)
	leaq	1(%rcx), %rcx
	shlq	$5, %rcx
	vmovaps	%ymm0, 2880(%rsp,%rcx)
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	movl	%esi, %r14d
	vmovaps	%ymm3, %ymm0
	.p2align	4, 0x90
.LBB6_89:                               # %unlikely_cont_cascading_cascading.rv.i
                                        #   in Loop: Header=BB6_67 Depth=3
	movl	%r14d, %eax
	testl	%r8d, %r8d
	jne	.LBB6_67
	jmp	.LBB6_92
	.p2align	4, 0x90
.LBB6_90:                               #   in Loop: Header=BB6_5 Depth=2
	movl	%eax, %r14d
	testl	%r14d, %r14d
	jns	.LBB6_4
	jmp	.LBB6_93
	.p2align	4, 0x90
.LBB6_91:                               #   in Loop: Header=BB6_5 Depth=2
	movl	%ecx, %r11d
.LBB6_92:                               # %break84.rv.i
                                        #   in Loop: Header=BB6_5 Depth=2
	testl	%r14d, %r14d
	jns	.LBB6_4
.LBB6_93:                               # %if_then88.rv.i
                                        #   in Loop: Header=BB6_5 Depth=2
	movl	%r14d, %eax
	notl	%eax
	movslq	%r11d, %r11
	movslq	%eax, %r8
	movl	2624(%rsp,%r11,4), %r14d
	movq	%r11, %rax
	shlq	$5, %rax
	vmovdqa	2880(%rsp,%rax), %ymm0
	addl	$-1, %r11d
	imulq	$208, %r8, %rdx
	addq	80(%rsp), %rdx          # 8-byte Folded Reload
.LBB6_94:                               # %while_head89.rv.i
                                        #   Parent Loop BB6_2 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB6_95 Depth 4
	movq	%rdx, %rsi
	xorl	%ecx, %ecx
	jmp	.LBB6_95
.LBB6_97:                               # %if_else_crit99.rv.i
                                        #   in Loop: Header=BB6_95 Depth=4
	vpand	%ymm8, %ymm7, %ymm1
	vmulps	192(%rsp), %ymm5, %ymm5 # 32-byte Folded Reload
	vfmadd132ps	256(%rsp), %ymm5, %ymm15 # 32-byte Folded Reload
	vcmpneq_usps	%ymm2, %ymm4, %ymm7
	vfmadd132ps	224(%rsp), %ymm15, %ymm11 # 32-byte Folded Reload
	vmulps	288(%rsp), %ymm4, %ymm8 # 32-byte Folded Reload
	vmulps	96(%rsp), %ymm4, %ymm10
	vxorps	%ymm11, %ymm6, %ymm5
	vcmpleps	%ymm10, %ymm5, %ymm6
	vcmpleps	%ymm5, %ymm8, %ymm8
	vandps	%ymm7, %ymm6, %ymm6
	vandps	%ymm8, %ymm6, %ymm6
	vptest	%ymm6, %ymm1
	je	.LBB6_99
# BB#98:                                # %if_else_crit104.rv.i
                                        #   in Loop: Header=BB6_95 Depth=4
	vrcpps	%ymm4, %ymm7
	vpand	%ymm1, %ymm6, %ymm6
	vmovaps	1312(%rsp), %ymm1       # 32-byte Reload
	vfnmadd213ps	%ymm1, %ymm7, %ymm4
	vfmadd132ps	%ymm7, %ymm7, %ymm4
	vblendvps	%ymm6, %ymm4, %ymm1, %ymm7
	vmulps	%ymm7, %ymm13, %ymm8
	vmulps	%ymm7, %ymm5, %ymm5
	vpbroadcastd	.LCPI6_11(%rip), %ymm10
	vpand	%ymm10, %ymm3, %ymm3
	vmulps	%ymm7, %ymm12, %ymm7
	vpcmpeqd	%ymm2, %ymm6, %ymm6
	vpxor	.LCPI6_13, %ymm6, %ymm6
	vmaskmovps	%ymm5, %ymm6, 768(%rsp)
	vmaskmovps	%ymm7, %ymm6, 1568(%rsp)
	vmaskmovps	%ymm8, %ymm6, 1536(%rsp)
	vpmaskmovd	%ymm3, %ymm6, 736(%rsp)
	vpmaskmovd	%ymm0, %ymm6, 1504(%rsp)
	vmaskmovps	%ymm5, %ymm6, 96(%rsp)
	jmp	.LBB6_99
	.p2align	4, 0x90
.LBB6_95:                               # %if_then95.rv.i
                                        #   Parent Loop BB6_2 Depth=1
                                        #     Parent Loop BB6_5 Depth=2
                                        #       Parent Loop BB6_94 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	(%rsi), %eax
	vmovd	%eax, %xmm3
	vpbroadcastd	%xmm3, %ymm3
	cmpl	$-1, %eax
	je	.LBB6_3
# BB#96:                                # %if_else96.rv.i
                                        #   in Loop: Header=BB6_95 Depth=4
	vbroadcastss	-48(%rsi), %ymm4
	vbroadcastss	-32(%rsi), %ymm1
	vmovaps	1920(%rsp), %ymm2       # 32-byte Reload
	vmovaps	%ymm1, 192(%rsp)        # 32-byte Spill
	vmulps	%ymm1, %ymm2, %ymm12
	vmovaps	1952(%rsp), %ymm1       # 32-byte Reload
	vmovaps	%ymm4, 256(%rsp)        # 32-byte Spill
	vfmadd231ps	%ymm4, %ymm1, %ymm12
	vbroadcastss	-16(%rsi), %ymm4
	vmovaps	1888(%rsp), %ymm9       # 32-byte Reload
	vmovaps	%ymm4, 224(%rsp)        # 32-byte Spill
	vfmadd231ps	%ymm4, %ymm9, %ymm12
	vbroadcastsd	.LCPI6_10(%rip), %ymm5
	vandps	%ymm5, %ymm12, %ymm4
	vbroadcastss	-80(%rsi), %ymm6
	vbroadcastss	-128(%rsi), %ymm7
	vbroadcastss	-144(%rsi), %ymm8
	vbroadcastss	-192(%rsi), %ymm13
	vbroadcastss	-176(%rsi), %ymm5
	vbroadcastss	-160(%rsi), %ymm11
	vsubps	1376(%rsp), %ymm11, %ymm11 # 32-byte Folded Reload
	vsubps	1984(%rsp), %ymm5, %ymm5 # 32-byte Folded Reload
	vmulps	%ymm11, %ymm1, %ymm10
	vsubps	1408(%rsp), %ymm13, %ymm15 # 32-byte Folded Reload
	vfmsub231ps	%ymm15, %ymm9, %ymm10
	vmulps	%ymm10, %ymm7, %ymm7
	vmulps	%ymm10, %ymm6, %ymm10
	vmulps	%ymm5, %ymm9, %ymm6
	vfmsub231ps	%ymm11, %ymm2, %ymm6
	vfmadd213ps	%ymm7, %ymm6, %ymm8
	vbroadcastss	-96(%rsi), %ymm7
	vfmadd231ps	%ymm6, %ymm7, %ymm10
	vbroadcastss	-112(%rsi), %ymm7
	vmulps	%ymm15, %ymm2, %ymm13
	vfmsub231ps	%ymm5, %ymm1, %ymm13
	vfmadd213ps	%ymm8, %ymm13, %ymm7
	vbroadcastss	-64(%rsi), %ymm8
	vandps	1344(%rsp), %ymm12, %ymm6 # 32-byte Folded Reload
	vfmadd231ps	%ymm13, %ymm8, %ymm10
	vxorps	%ymm7, %ymm6, %ymm13
	vxorps	%ymm10, %ymm6, %ymm12
	vxorps	%ymm1, %ymm1, %ymm1
	vcmpleps	%ymm13, %ymm1, %ymm7
	vxorps	%ymm2, %ymm2, %ymm2
	vcmpleps	%ymm12, %ymm1, %ymm8
	vandps	%ymm7, %ymm8, %ymm7
	vaddps	%ymm13, %ymm12, %ymm8
	vcmpleps	%ymm4, %ymm8, %ymm8
	vptest	%ymm8, %ymm7
	jne	.LBB6_97
.LBB6_99:                               # %next109.rv.i
                                        #   in Loop: Header=BB6_95 Depth=4
	addq	$1, %rcx
	addq	$4, %rsi
	cmpq	$4, %rcx
	vmovaps	1440(%rsp), %ymm15      # 32-byte Reload
	jl	.LBB6_95
# BB#100:                               # %if_else92.rv.i
                                        #   in Loop: Header=BB6_94 Depth=3
	imulq	$208, %r8, %rax
	addq	$1, %r8
	addq	$208, %rdx
	movq	16(%rsp), %rcx          # 8-byte Reload
	cmpl	$0, 204(%rcx,%rax)
	jns	.LBB6_94
	jmp	.LBB6_3
.LBB6_101:                              #   in Loop: Header=BB6_2 Depth=1
	movq	64(%rsp), %r10          # 8-byte Reload
	vpcmpeqd	%ymm13, %ymm13, %ymm13
	.p2align	4, 0x90
.LBB6_102:                              # %exit
                                        #   in Loop: Header=BB6_2 Depth=1
	vmovdqa	768(%rsp), %ymm0
	vmovaps	1568(%rsp), %ymm1
	vmovaps	1536(%rsp), %ymm2
	vmovaps	736(%rsp), %ymm3
	movq	%r10, %rax
	shlq	$7, %rax
	movq	160(%rsp), %rcx         # 8-byte Reload
	vmovups	%ymm3, (%rcx,%rax)
	vmovdqu	%ymm0, 32(%rcx,%rax)
	vmovups	%ymm1, 64(%rcx,%rax)
	vmovups	%ymm2, 96(%rcx,%rax)
	movq	168(%rsp), %rsp         # 8-byte Reload
	addq	$1, %r10
	cmpq	48(%rsp), %r10          # 8-byte Folded Reload
	jl	.LBB6_2
.LBB6_103:                              # %if_else
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.Lfunc_end6:
	.size	cpu_intersect_bvh4_hybrid8_avx2, .Lfunc_end6-cpu_intersect_bvh4_hybrid8_avx2

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI7_0:
	.long	1065353216              # float 1
.LCPI7_1:
	.long	2147483648              # float -0
.LCPI7_2:
	.long	841731191               # float 9.99999993E-9
.LCPI7_3:
	.long	2139095039              # float 3.40282347E+38
.LCPI7_5:
	.long	2147483647              # 0x7fffffff
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI7_4:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5
.LCPI7_6:
	.zero	32,255
.LCPI7_7:
	.zero	32
	.text
	.globl	cpu_intersect_bvh4_packet8_avx2
	.p2align	4, 0x90
	.type	cpu_intersect_bvh4_packet8_avx2,@function
cpu_intersect_bvh4_packet8_avx2:        # @cpu_intersect_bvh4_packet8_avx2
# BB#0:                                 # %cpu_intersect_bvh4_packet8_avx2_start
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$3264, %rsp             # imm = 0xCC0
                                        # kill: %ECX<def> %ECX<kill> %RCX<def>
	movq	%rdx, 88(%rsp)          # 8-byte Spill
	movq	%rsi, 80(%rsp)          # 8-byte Spill
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	cmpl	$8, %ecx
	jl	.LBB7_44
# BB#1:                                 # %head.preheader.lr.ph
	movq	(%rdi), %r13
	movq	8(%rdi), %r10
	movq	24(%rsp), %rax          # 8-byte Reload
	shrl	$3, %eax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	leaq	192(%r10), %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	xorl	%esi, %esi
	vbroadcastss	.LCPI7_0(%rip), %ymm0
	vmovaps	%ymm0, 352(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI7_1(%rip), %ymm0
	vmovaps	%ymm0, 672(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI7_2(%rip), %ymm0
	vmovaps	%ymm0, 640(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI7_1(%rip), %ymm0
	vmovaps	%ymm0, 416(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI7_2(%rip), %ymm0
	vmovaps	%ymm0, 608(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI7_3(%rip), %ymm6
                                        # implicit-def: %YMM0
	vmovaps	%ymm0, 160(%rsp)        # 32-byte Spill
                                        # implicit-def: %YMM0
	vmovaps	%ymm0, 128(%rsp)        # 32-byte Spill
	.p2align	4, 0x90
.LBB7_2:                                # %body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_3 Depth 2
                                        #       Child Loop BB7_6 Depth 3
                                        #       Child Loop BB7_9 Depth 3
                                        #       Child Loop BB7_36 Depth 3
                                        #         Child Loop BB7_37 Depth 4
	movq	%rsi, %rax
	shlq	$8, %rax
	movq	80(%rsp), %rcx          # 8-byte Reload
	vmovups	(%rcx,%rax), %ymm0
	vmovaps	%ymm0, 480(%rsp)        # 32-byte Spill
	vmovups	32(%rcx,%rax), %ymm0
	vmovaps	%ymm0, 448(%rsp)        # 32-byte Spill
	vmovups	96(%rcx,%rax), %ymm11
	vrcpps	%ymm11, %ymm0
	vmovups	64(%rcx,%rax), %ymm14
	vmovaps	%ymm0, %ymm1
	vmovaps	352(%rsp), %ymm9        # 32-byte Reload
	vfnmadd213ps	%ymm9, %ymm11, %ymm1
	vfmadd132ps	%ymm0, %ymm0, %ymm1
	vxorps	%ymm0, %ymm0, %ymm0
	vcmpltps	%ymm11, %ymm0, %ymm0
	vmovups	128(%rcx,%rax), %ymm15
	vrcpps	%ymm15, %ymm2
	vmovaps	672(%rsp), %ymm8        # 32-byte Reload
	vxorps	%ymm8, %ymm11, %ymm3
	vmovaps	%ymm2, %ymm4
	vfnmadd213ps	%ymm9, %ymm15, %ymm4
	vfmadd132ps	%ymm2, %ymm2, %ymm4
	vblendvps	%ymm0, %ymm11, %ymm3, %ymm0
	vmovups	160(%rcx,%rax), %ymm3
	vrcpps	%ymm3, %ymm2
	vmovaps	%ymm2, %ymm5
	vfnmadd213ps	%ymm9, %ymm3, %ymm5
	vfmadd132ps	%ymm2, %ymm2, %ymm5
	vmovups	192(%rcx,%rax), %ymm9
	vmovdqu	224(%rcx,%rax), %ymm12
	vmovaps	640(%rsp), %ymm7        # 32-byte Reload
	vcmpnlt_uqps	%ymm7, %ymm0, %ymm0
	vmovaps	416(%rsp), %ymm10       # 32-byte Reload
	vmovaps	%ymm11, 544(%rsp)       # 32-byte Spill
	vandps	%ymm10, %ymm11, %ymm2
	vmovaps	608(%rsp), %ymm11       # 32-byte Reload
	vorps	%ymm11, %ymm2, %ymm2
	vblendvps	%ymm0, %ymm1, %ymm2, %ymm0
	vxorps	%ymm13, %ymm13, %ymm13
	vcmpltps	%ymm15, %ymm13, %ymm1
	vxorps	%ymm8, %ymm15, %ymm2
	vblendvps	%ymm1, %ymm15, %ymm2, %ymm1
	vcmpnlt_uqps	%ymm7, %ymm1, %ymm1
	vmovaps	%ymm15, 512(%rsp)       # 32-byte Spill
	vandps	%ymm10, %ymm15, %ymm2
	vorps	%ymm11, %ymm2, %ymm2
	vblendvps	%ymm1, %ymm4, %ymm2, %ymm2
	vxorps	%ymm8, %ymm3, %ymm1
	vcmpltps	%ymm3, %ymm13, %ymm4
	vblendvps	%ymm4, %ymm3, %ymm1, %ymm1
	vcmpnlt_uqps	%ymm7, %ymm1, %ymm1
	vmovaps	%ymm3, 832(%rsp)        # 32-byte Spill
	vandps	%ymm10, %ymm3, %ymm4
	vorps	%ymm11, %ymm4, %ymm4
	vblendvps	%ymm1, %ymm5, %ymm4, %ymm3
	vmovaps	%ymm14, 864(%rsp)       # 32-byte Spill
	vmulps	%ymm3, %ymm14, %ymm5
	vmulps	480(%rsp), %ymm0, %ymm8 # 32-byte Folded Reload
	vmulps	448(%rsp), %ymm2, %ymm1 # 32-byte Folded Reload
	vmovdqa	%ymm12, 192(%rsp)       # 32-byte Spill
	vmovdqa	%ymm12, 32(%rsp)
	movl	$0, 928(%rsp)
	vmovaps	%ymm6, 1184(%rsp)
	movl	$1, %r11d
	vpcmpeqd	%ymm4, %ymm4, %ymm4
	vmovdqa	%ymm4, 320(%rsp)        # 32-byte Spill
	vpcmpeqd	%ymm4, %ymm4, %ymm4
	vmovdqa	%ymm4, 384(%rsp)        # 32-byte Spill
	xorl	%r14d, %r14d
	vmovaps	%ymm9, %ymm4
	jmp	.LBB7_3
	.p2align	4, 0x90
.LBB7_4:                                # %while_body.rv.i
                                        #   in Loop: Header=BB7_3 Depth=2
	vmovaps	32(%rsp), %ymm10
	vcmpltps	%ymm10, %ymm4, %ymm11
	vmovmskps	%ymm11, %eax
	testl	%eax, %eax
	je	.LBB7_5
.LBB7_8:                                # %while_head16.rv.i.preheader
                                        #   in Loop: Header=BB7_3 Depth=2
	movl	%r11d, %edi
	.p2align	4, 0x90
.LBB7_9:                                # %while_head16.rv.i
                                        #   Parent Loop BB7_2 Depth=1
                                        #     Parent Loop BB7_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	testl	%edi, %edi
	jle	.LBB7_10
# BB#11:                                # %while_body20.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	movslq	%r14d, %rbx
	movl	928(%rsp,%rbx,4), %r11d
	movq	%rbx, %rax
	shlq	$5, %rax
	vmovaps	1184(%rsp,%rax), %ymm4
	leal	-1(%rbx), %r8d
	movslq	%edi, %rdi
	addq	$-1, %rdi
	shlq	$7, %rdi
	movslq	96(%r13,%rdi), %r12
	testq	%r12, %r12
	je	.LBB7_12
# BB#13:                                # %if_else23.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	vbroadcastss	(%r13,%rdi), %ymm10
	vfmsub213ps	%ymm8, %ymm0, %ymm10
	vbroadcastss	32(%r13,%rdi), %ymm11
	vfmsub213ps	%ymm1, %ymm2, %ymm11
	vbroadcastss	64(%r13,%rdi), %ymm12
	vfmsub213ps	%ymm5, %ymm3, %ymm12
	vbroadcastss	16(%r13,%rdi), %ymm13
	vfmsub213ps	%ymm8, %ymm0, %ymm13
	vbroadcastss	48(%r13,%rdi), %ymm14
	vfmsub213ps	%ymm1, %ymm2, %ymm14
	vbroadcastss	80(%r13,%rdi), %ymm15
	vpminsd	%ymm13, %ymm10, %ymm7
	vpmaxsd	%ymm10, %ymm13, %ymm10
	vfmsub213ps	%ymm5, %ymm3, %ymm15
	vpminsd	%ymm14, %ymm11, %ymm13
	vpmaxsd	%ymm11, %ymm14, %ymm11
	vpminsd	%ymm15, %ymm12, %ymm14
	vpmaxsd	%ymm12, %ymm15, %ymm12
	vpmaxsd	%ymm7, %ymm13, %ymm7
	vpminsd	%ymm11, %ymm10, %ymm11
	vpmaxsd	%ymm14, %ymm9, %ymm10
	vpminsd	32(%rsp), %ymm12, %ymm12
	vpmaxsd	%ymm7, %ymm10, %ymm10
	vpminsd	%ymm12, %ymm11, %ymm7
	vpcmpgtd	%ymm7, %ymm10, %ymm11
	vmovmskps	%ymm11, %r9d
	xorl	%r15d, %r15d
	cmpl	$255, %r9d
	jne	.LBB7_15
# BB#14:                                #   in Loop: Header=BB7_9 Depth=3
	movl	%r8d, %r14d
	jmp	.LBB7_18
	.p2align	4, 0x90
.LBB7_15:                               # %if_then26.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	vxorps	.LCPI7_6, %ymm11, %ymm7
	vblendvps	%ymm7, %ymm10, %ymm6, %ymm10
	vcmpltps	%ymm4, %ymm10, %ymm7
	vptest	%ymm7, %ymm7
	jne	.LBB7_17
# BB#16:                                # %if_else27.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	leaq	1184(%rsp,%rax), %rax
	movl	%r12d, 928(%rsp,%rbx,4)
	vmovaps	%ymm10, (%rax)
	movl	$1, %r15d
	jmp	.LBB7_18
.LBB7_17:                               # %if_then_crit.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	movl	%r12d, %eax
	notl	%eax
	movq	%r12, %rbx
	cltq
	imulq	$208, %rax, %rax
	shlq	$7, %rbx
	addq	%r10, %rax
	testl	%r12d, %r12d
	leaq	-128(%r13,%rbx), %rbx
	cmovsq	%rax, %rbx
	prefetcht0	(%rbx)
	prefetcht0	64(%rbx)
	movl	$1, %r15d
	vmovaps	%ymm10, %ymm4
	movl	%r12d, %r11d
	.p2align	4, 0x90
.LBB7_18:                               # %next30.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	movslq	100(%r13,%rdi), %rbx
	testq	%rbx, %rbx
	je	.LBB7_33
# BB#19:                                # %if_else33.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	vbroadcastss	4(%r13,%rdi), %ymm7
	vfmsub213ps	%ymm8, %ymm0, %ymm7
	vbroadcastss	36(%r13,%rdi), %ymm10
	vfmsub213ps	%ymm1, %ymm2, %ymm10
	vbroadcastss	68(%r13,%rdi), %ymm11
	vfmsub213ps	%ymm5, %ymm3, %ymm11
	vbroadcastss	20(%r13,%rdi), %ymm12
	vfmsub213ps	%ymm8, %ymm0, %ymm12
	vbroadcastss	52(%r13,%rdi), %ymm13
	vfmsub213ps	%ymm1, %ymm2, %ymm13
	vbroadcastss	84(%r13,%rdi), %ymm14
	vpminsd	%ymm12, %ymm7, %ymm15
	vpmaxsd	%ymm7, %ymm12, %ymm7
	vfmsub213ps	%ymm5, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm10, %ymm12
	vpmaxsd	%ymm10, %ymm13, %ymm10
	vpminsd	%ymm14, %ymm11, %ymm13
	vpmaxsd	%ymm11, %ymm14, %ymm11
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm10, %ymm7, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm10
	vpminsd	32(%rsp), %ymm11, %ymm11
	vpmaxsd	%ymm12, %ymm10, %ymm10
	vpminsd	%ymm11, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm10, %ymm11
	vmovmskps	%ymm11, %eax
	cmpl	$255, %eax
	je	.LBB7_23
# BB#20:                                # %if_then37.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	vxorps	.LCPI7_6, %ymm11, %ymm7
	vblendvps	%ymm7, %ymm10, %ymm6, %ymm10
	addl	$1, %r15d
	vcmpltps	%ymm4, %ymm10, %ymm7
	vptest	%ymm7, %ymm7
	jne	.LBB7_22
# BB#21:                                # %if_else40.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	movslq	%r14d, %rax
	addl	$1, %r14d
	movl	%ebx, 932(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm10, 1184(%rsp,%rax)
	jmp	.LBB7_23
.LBB7_22:                               # %if_then_crit41.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	movq	%rbx, %rax
	shlq	$7, %rax
	movl	%ebx, %ecx
	notl	%ecx
	movslq	%r14d, %rdx
	addl	$1, %r14d
	movslq	%ecx, %rcx
	imulq	$208, %rcx, %rcx
	addq	%r10, %rcx
	testl	%ebx, %ebx
	leaq	-128(%r13,%rax), %rax
	cmovsq	%rcx, %rax
	movl	%r11d, 932(%rsp,%rdx,4)
	leaq	1(%rdx), %rcx
	shlq	$5, %rcx
	vmovaps	%ymm4, 1184(%rsp,%rcx)
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	vmovaps	%ymm10, %ymm4
	movl	%ebx, %r11d
	.p2align	4, 0x90
.LBB7_23:                               # %next45.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	movslq	104(%r13,%rdi), %rbx
	testq	%rbx, %rbx
	je	.LBB7_33
# BB#24:                                # %if_else48.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	vbroadcastss	8(%r13,%rdi), %ymm7
	vfmsub213ps	%ymm8, %ymm0, %ymm7
	vbroadcastss	40(%r13,%rdi), %ymm10
	vfmsub213ps	%ymm1, %ymm2, %ymm10
	vbroadcastss	72(%r13,%rdi), %ymm11
	vfmsub213ps	%ymm5, %ymm3, %ymm11
	vbroadcastss	24(%r13,%rdi), %ymm12
	vfmsub213ps	%ymm8, %ymm0, %ymm12
	vbroadcastss	56(%r13,%rdi), %ymm13
	vfmsub213ps	%ymm1, %ymm2, %ymm13
	vbroadcastss	88(%r13,%rdi), %ymm14
	vpminsd	%ymm12, %ymm7, %ymm15
	vpmaxsd	%ymm7, %ymm12, %ymm7
	vfmsub213ps	%ymm5, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm10, %ymm12
	vpmaxsd	%ymm10, %ymm13, %ymm10
	vpminsd	%ymm14, %ymm11, %ymm13
	vpmaxsd	%ymm11, %ymm14, %ymm11
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm10, %ymm7, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm10
	vpminsd	32(%rsp), %ymm11, %ymm11
	vpmaxsd	%ymm12, %ymm10, %ymm10
	vpminsd	%ymm11, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm10, %ymm11
	vmovmskps	%ymm11, %eax
	cmpl	$255, %eax
	je	.LBB7_28
# BB#25:                                # %if_then52.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	vxorps	.LCPI7_6, %ymm11, %ymm7
	vblendvps	%ymm7, %ymm10, %ymm6, %ymm10
	addl	$1, %r15d
	vcmpltps	%ymm4, %ymm10, %ymm7
	vptest	%ymm7, %ymm7
	jne	.LBB7_27
# BB#26:                                # %if_else55.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	movslq	%r14d, %rax
	addl	$1, %r14d
	movl	%ebx, 932(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm10, 1184(%rsp,%rax)
	jmp	.LBB7_28
.LBB7_27:                               # %if_then_crit56.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	movq	%rbx, %rax
	shlq	$7, %rax
	movl	%ebx, %ecx
	notl	%ecx
	movslq	%r14d, %rdx
	addl	$1, %r14d
	movslq	%ecx, %rcx
	imulq	$208, %rcx, %rcx
	addq	%r10, %rcx
	testl	%ebx, %ebx
	leaq	-128(%r13,%rax), %rax
	cmovsq	%rcx, %rax
	movl	%r11d, 932(%rsp,%rdx,4)
	leaq	1(%rdx), %rcx
	shlq	$5, %rcx
	vmovaps	%ymm4, 1184(%rsp,%rcx)
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	vmovaps	%ymm10, %ymm4
	movl	%ebx, %r11d
	.p2align	4, 0x90
.LBB7_28:                               # %next60.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	movslq	108(%r13,%rdi), %rbx
	testq	%rbx, %rbx
	je	.LBB7_33
# BB#29:                                # %if_else63.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	vbroadcastss	12(%r13,%rdi), %ymm7
	vfmsub213ps	%ymm8, %ymm0, %ymm7
	vbroadcastss	44(%r13,%rdi), %ymm10
	vfmsub213ps	%ymm1, %ymm2, %ymm10
	vbroadcastss	76(%r13,%rdi), %ymm11
	vfmsub213ps	%ymm5, %ymm3, %ymm11
	vbroadcastss	28(%r13,%rdi), %ymm12
	vfmsub213ps	%ymm8, %ymm0, %ymm12
	vbroadcastss	60(%r13,%rdi), %ymm13
	vfmsub213ps	%ymm1, %ymm2, %ymm13
	vbroadcastss	92(%r13,%rdi), %ymm14
	vpminsd	%ymm12, %ymm7, %ymm15
	vpmaxsd	%ymm7, %ymm12, %ymm7
	vfmsub213ps	%ymm5, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm10, %ymm12
	vpmaxsd	%ymm10, %ymm13, %ymm10
	vpminsd	%ymm14, %ymm11, %ymm13
	vpmaxsd	%ymm11, %ymm14, %ymm11
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm10, %ymm7, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm10
	vpminsd	32(%rsp), %ymm11, %ymm11
	vpmaxsd	%ymm12, %ymm10, %ymm10
	vpminsd	%ymm11, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm10, %ymm11
	vmovmskps	%ymm11, %eax
	cmpl	$255, %eax
	je	.LBB7_33
# BB#30:                                # %if_then67.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	vxorps	.LCPI7_6, %ymm11, %ymm7
	vblendvps	%ymm7, %ymm10, %ymm6, %ymm10
	addl	$1, %r15d
	vcmpltps	%ymm4, %ymm10, %ymm7
	vptest	%ymm7, %ymm7
	jne	.LBB7_32
# BB#31:                                # %if_else70.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	movslq	%r14d, %rax
	addl	$1, %r14d
	movl	%ebx, 932(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm10, 1184(%rsp,%rax)
	jmp	.LBB7_33
.LBB7_32:                               # %if_then_crit71.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	movq	%rbx, %rax
	shlq	$7, %rax
	movl	%ebx, %ecx
	notl	%ecx
	movslq	%r14d, %rdx
	addl	$1, %r14d
	movslq	%ecx, %rcx
	imulq	$208, %rcx, %rcx
	addq	%r10, %rcx
	testl	%ebx, %ebx
	leaq	-128(%r13,%rax), %rax
	cmovsq	%rcx, %rax
	movl	%r11d, 932(%rsp,%rdx,4)
	leaq	1(%rdx), %rcx
	shlq	$5, %rcx
	vmovaps	%ymm4, 1184(%rsp,%rcx)
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	vmovaps	%ymm10, %ymm4
	movl	%ebx, %r11d
	.p2align	4, 0x90
.LBB7_33:                               # %unlikely_cont_cascading_cascading.rv.i
                                        #   in Loop: Header=BB7_9 Depth=3
	movl	%r11d, %edi
	testl	%r15d, %r15d
	jne	.LBB7_9
	jmp	.LBB7_34
	.p2align	4, 0x90
.LBB7_10:                               #   in Loop: Header=BB7_3 Depth=2
	movl	%edi, %r11d
	testl	%r11d, %r11d
	jns	.LBB7_3
	jmp	.LBB7_35
	.p2align	4, 0x90
.LBB7_12:                               #   in Loop: Header=BB7_3 Depth=2
	movl	%r8d, %r14d
.LBB7_34:                               # %break86.rv.i
                                        #   in Loop: Header=BB7_3 Depth=2
	testl	%r11d, %r11d
	jns	.LBB7_3
.LBB7_35:                               # %if_then90.rv.i
                                        #   in Loop: Header=BB7_3 Depth=2
	notl	%r11d
	movslq	%r14d, %r14
	movslq	%r11d, %r15
	movl	928(%rsp,%r14,4), %r11d
	movq	%r14, %rax
	shlq	$5, %rax
	vmovaps	1184(%rsp,%rax), %ymm4
	addl	$-1, %r14d
	imulq	$208, %r15, %r12
	addq	72(%rsp), %r12          # 8-byte Folded Reload
.LBB7_36:                               # %while_head91.rv.i
                                        #   Parent Loop BB7_2 Depth=1
                                        #     Parent Loop BB7_3 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB7_37 Depth 4
	movq	%r12, %rbx
	xorl	%edi, %edi
	jmp	.LBB7_37
.LBB7_39:                               # %if_else_crit.rv.i
                                        #   in Loop: Header=BB7_37 Depth=4
	vmovaps	%ymm14, 576(%rsp)       # 32-byte Spill
	vandps	%ymm11, %ymm15, %ymm7
	vmovaps	%ymm7, 224(%rsp)        # 32-byte Spill
	vmovaps	96(%rsp), %ymm7         # 32-byte Reload
	vmulps	736(%rsp), %ymm7, %ymm11 # 32-byte Folded Reload
	vmovaps	%ymm12, %ymm15
	vcmpneq_usps	.LCPI7_7, %ymm15, %ymm7
	vmovaps	%ymm7, 96(%rsp)         # 32-byte Spill
	vmulps	32(%rsp), %ymm15, %ymm14
	vmovaps	288(%rsp), %ymm7        # 32-byte Reload
	vfmadd132ps	800(%rsp), %ymm11, %ymm7 # 32-byte Folded Reload
	vmulps	%ymm15, %ymm9, %ymm11
	vmovaps	256(%rsp), %ymm12       # 32-byte Reload
	vfmadd132ps	768(%rsp), %ymm7, %ymm12 # 32-byte Folded Reload
	vxorps	%ymm12, %ymm10, %ymm10
	vmovdqa	224(%rsp), %ymm12       # 32-byte Reload
	vcmpleps	%ymm14, %ymm10, %ymm14
	vcmpleps	%ymm10, %ymm11, %ymm7
	vandps	96(%rsp), %ymm14, %ymm11 # 32-byte Folded Reload
	vandps	%ymm7, %ymm11, %ymm11
	vptest	%ymm11, %ymm12
	je	.LBB7_41
# BB#40:                                # %if_else_crit105.rv.i
                                        #   in Loop: Header=BB7_37 Depth=4
	vrcpps	%ymm15, %ymm7
	vpand	%ymm12, %ymm11, %ymm11
	vmovaps	352(%rsp), %ymm14       # 32-byte Reload
	vfnmadd213ps	%ymm14, %ymm7, %ymm15
	vfmadd132ps	%ymm7, %ymm7, %ymm15
	vblendvps	%ymm11, %ymm15, %ymm14, %ymm7
	vmulps	%ymm7, %ymm10, %ymm10
	vpcmpeqd	.LCPI7_7, %ymm11, %ymm12
	vpxor	.LCPI7_6, %ymm12, %ymm12
	vmaskmovps	%ymm10, %ymm12, 32(%rsp)
	vmulps	576(%rsp), %ymm7, %ymm12 # 32-byte Folded Reload
	vmulps	%ymm7, %ymm13, %ymm7
	vbroadcastss	.LCPI7_5(%rip), %ymm13
	vandps	704(%rsp), %ymm13, %ymm13 # 32-byte Folded Reload
	vmovaps	192(%rsp), %ymm14       # 32-byte Reload
	vblendvps	%ymm11, %ymm10, %ymm14, %ymm14
	vmovaps	%ymm14, 192(%rsp)       # 32-byte Spill
	vmovaps	160(%rsp), %ymm10       # 32-byte Reload
	vblendvps	%ymm11, %ymm7, %ymm10, %ymm10
	vmovaps	%ymm10, 160(%rsp)       # 32-byte Spill
	vmovaps	128(%rsp), %ymm7        # 32-byte Reload
	vblendvps	%ymm11, %ymm12, %ymm7, %ymm7
	vmovaps	%ymm7, 128(%rsp)        # 32-byte Spill
	vmovaps	320(%rsp), %ymm7        # 32-byte Reload
	vblendvps	%ymm11, %ymm13, %ymm7, %ymm7
	vmovaps	%ymm7, 320(%rsp)        # 32-byte Spill
	vmovaps	%ymm7, 384(%rsp)        # 32-byte Spill
	jmp	.LBB7_41
	.p2align	4, 0x90
.LBB7_37:                               # %if_then97.rv.i
                                        #   Parent Loop BB7_2 Depth=1
                                        #     Parent Loop BB7_3 Depth=2
                                        #       Parent Loop BB7_36 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	(%rbx), %eax
	vmovd	%eax, %xmm7
	vpbroadcastd	%xmm7, %ymm7
	cmpl	$-1, %eax
	je	.LBB7_3
# BB#38:                                # %if_else98.rv.i
                                        #   in Loop: Header=BB7_37 Depth=4
	vmovdqa	%ymm7, 704(%rsp)        # 32-byte Spill
	vbroadcastss	-48(%rbx), %ymm10
	vbroadcastss	-32(%rbx), %ymm7
	vmovaps	%ymm7, 800(%rsp)        # 32-byte Spill
	vmulps	512(%rsp), %ymm7, %ymm11 # 32-byte Folded Reload
	vmovaps	544(%rsp), %ymm13       # 32-byte Reload
	vmovaps	%ymm10, 736(%rsp)       # 32-byte Spill
	vfmadd231ps	%ymm10, %ymm13, %ymm11
	vbroadcastss	-16(%rbx), %ymm7
	vmovaps	832(%rsp), %ymm12       # 32-byte Reload
	vmovaps	%ymm7, 768(%rsp)        # 32-byte Spill
	vfmadd231ps	%ymm7, %ymm12, %ymm11
	vbroadcastsd	.LCPI7_4(%rip), %ymm7
	vandps	%ymm7, %ymm11, %ymm7
	vmovaps	%ymm7, 896(%rsp)        # 32-byte Spill
	vbroadcastss	-144(%rbx), %ymm7
	vmovaps	%ymm7, 288(%rsp)        # 32-byte Spill
	vbroadcastss	-80(%rbx), %ymm7
	vmovaps	%ymm7, 256(%rsp)        # 32-byte Spill
	vbroadcastss	-128(%rbx), %ymm7
	vmovaps	%ymm7, 224(%rsp)        # 32-byte Spill
	vbroadcastss	-176(%rbx), %ymm7
	vbroadcastss	-160(%rbx), %ymm15
	vbroadcastss	-192(%rbx), %ymm14
	vsubps	480(%rsp), %ymm14, %ymm10 # 32-byte Folded Reload
	vmovaps	%ymm10, 96(%rsp)        # 32-byte Spill
	vsubps	864(%rsp), %ymm15, %ymm14 # 32-byte Folded Reload
	vsubps	448(%rsp), %ymm7, %ymm7 # 32-byte Folded Reload
	vmulps	%ymm14, %ymm13, %ymm15
	vfmsub231ps	%ymm10, %ymm12, %ymm15
	vmulps	224(%rsp), %ymm15, %ymm13 # 32-byte Folded Reload
	vmulps	256(%rsp), %ymm15, %ymm15 # 32-byte Folded Reload
	vmulps	%ymm7, %ymm12, %ymm10
	vmovaps	%ymm14, 256(%rsp)       # 32-byte Spill
	vmovaps	512(%rsp), %ymm12       # 32-byte Reload
	vfmsub231ps	%ymm14, %ymm12, %ymm10
	vmovaps	288(%rsp), %ymm14       # 32-byte Reload
	vfmadd213ps	%ymm13, %ymm10, %ymm14
	vbroadcastss	-96(%rbx), %ymm13
	vfmadd231ps	%ymm10, %ymm13, %ymm15
	vbroadcastss	-112(%rbx), %ymm13
	vmulps	96(%rsp), %ymm12, %ymm12 # 32-byte Folded Reload
	vmovaps	%ymm7, 288(%rsp)        # 32-byte Spill
	vfmsub231ps	544(%rsp), %ymm7, %ymm12 # 32-byte Folded Reload
	vfmadd213ps	%ymm14, %ymm12, %ymm13
	vbroadcastss	-64(%rbx), %ymm7
	vandps	416(%rsp), %ymm11, %ymm10 # 32-byte Folded Reload
	vfmadd231ps	%ymm12, %ymm7, %ymm15
	vxorps	%ymm13, %ymm10, %ymm14
	vxorps	%ymm15, %ymm10, %ymm13
	vxorps	%ymm11, %ymm11, %ymm11
	vcmpleps	%ymm14, %ymm11, %ymm7
	vcmpleps	%ymm13, %ymm11, %ymm11
	vandps	%ymm7, %ymm11, %ymm15
	vaddps	%ymm14, %ymm13, %ymm7
	vmovaps	896(%rsp), %ymm11       # 32-byte Reload
	vmovaps	%ymm11, %ymm12
	vcmpleps	%ymm11, %ymm7, %ymm11
	vptest	%ymm11, %ymm15
	jne	.LBB7_39
.LBB7_41:                               # %next110.rv.i
                                        #   in Loop: Header=BB7_37 Depth=4
	addq	$1, %rdi
	addq	$4, %rbx
	cmpq	$4, %rdi
	jl	.LBB7_37
# BB#42:                                # %if_else94.rv.i
                                        #   in Loop: Header=BB7_36 Depth=3
	imulq	$208, %r15, %rax
	addq	$1, %r15
	addq	$208, %r12
	cmpl	$0, 204(%r10,%rax)
	jns	.LBB7_36
	jmp	.LBB7_3
.LBB7_5:                                # %if_else12.rv.i.preheader
                                        #   in Loop: Header=BB7_3 Depth=2
	movslq	%r14d, %rdi
	leaq	928(%rsp,%rdi,4), %rax
	shlq	$5, %rdi
	leaq	1184(%rsp,%rdi), %rdi
.LBB7_6:                                # %if_else12.rv.i
                                        #   Parent Loop BB7_2 Depth=1
                                        #     Parent Loop BB7_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	(%rax), %r11d
	testl	%r11d, %r11d
	je	.LBB7_43
# BB#7:                                 # %if_else13.rv.i
                                        #   in Loop: Header=BB7_6 Depth=3
	vmovaps	(%rdi), %ymm4
	vcmpltps	%ymm10, %ymm4, %ymm11
	vmovmskps	%ymm11, %ebx
	addq	$-32, %rdi
	addl	$-1, %r14d
	addq	$-4, %rax
	testl	%ebx, %ebx
	jne	.LBB7_8
	jmp	.LBB7_6
	.p2align	4, 0x90
.LBB7_3:                                # %while_head.rv.i
                                        #   Parent Loop BB7_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_6 Depth 3
                                        #       Child Loop BB7_9 Depth 3
                                        #       Child Loop BB7_36 Depth 3
                                        #         Child Loop BB7_37 Depth 4
	testl	%r11d, %r11d
	jne	.LBB7_4
.LBB7_43:                               # %exit
                                        #   in Loop: Header=BB7_2 Depth=1
	movq	%rsi, %rax
	shlq	$7, %rax
	movq	88(%rsp), %rcx          # 8-byte Reload
	vmovaps	384(%rsp), %ymm0        # 32-byte Reload
	vmovups	%ymm0, (%rcx,%rax)
	vmovaps	192(%rsp), %ymm0        # 32-byte Reload
	vmovups	%ymm0, 32(%rcx,%rax)
	vmovaps	160(%rsp), %ymm0        # 32-byte Reload
	vmovups	%ymm0, 64(%rcx,%rax)
	vmovaps	128(%rsp), %ymm0        # 32-byte Reload
	vmovups	%ymm0, 96(%rcx,%rax)
	addq	$1, %rsi
	cmpq	24(%rsp), %rsi          # 8-byte Folded Reload
	jl	.LBB7_2
.LBB7_44:                               # %if_else
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.Lfunc_end7:
	.size	cpu_intersect_bvh4_packet8_avx2, .Lfunc_end7-cpu_intersect_bvh4_packet8_avx2

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI8_0:
	.long	2147483647              # float NaN
.LCPI8_1:
	.long	841731191               # float 9.99999993E-9
.LCPI8_2:
	.long	1065353216              # float 1
.LCPI8_3:
	.long	2147483648              # float -0
.LCPI8_5:
	.long	2139095039              # float 3.40282347E+38
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI8_4:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
.LCPI8_6:
	.zero	16
	.text
	.globl	cpu_intersect_bvh8_tri4_single_avx2
	.p2align	4, 0x90
	.type	cpu_intersect_bvh8_tri4_single_avx2,@function
cpu_intersect_bvh8_tri4_single_avx2:    # @cpu_intersect_bvh8_tri4_single_avx2
# BB#0:                                 # %cpu_intersect_bvh8_tri4_single_avx2_start
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$840, %rsp              # imm = 0x348
	movq	%rdx, 608(%rsp)         # 8-byte Spill
	movq	%rsi, 600(%rsp)         # 8-byte Spill
	testl	%ecx, %ecx
	jle	.LBB8_47
# BB#1:                                 # %if_then.lr.ph
	movq	(%rdi), %r14
	movq	8(%rdi), %rax
	movl	%ecx, %ecx
	movq	%rcx, 592(%rsp)         # 8-byte Spill
	movq	%rax, 632(%rsp)         # 8-byte Spill
	leaq	192(%rax), %rax
	movq	%rax, 624(%rsp)         # 8-byte Spill
	xorl	%edx, %edx
	vbroadcastss	.LCPI8_0(%rip), %xmm3
	vmovss	.LCPI8_1(%rip), %xmm6   # xmm6 = mem[0],zero,zero,zero
	vbroadcastss	.LCPI8_3(%rip), %xmm0
	vmovaps	%xmm0, 640(%rsp)        # 16-byte Spill
                                        # implicit-def: %EAX
	movl	%eax, 20(%rsp)          # 4-byte Spill
                                        # implicit-def: %EAX
	movl	%eax, 24(%rsp)          # 4-byte Spill
	vmovaps	%xmm3, 656(%rsp)        # 16-byte Spill
	movq	%r14, -104(%rsp)        # 8-byte Spill
	.p2align	4, 0x90
.LBB8_2:                                # %if_then
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_12 Depth 2
                                        #       Child Loop BB8_13 Depth 3
                                        #         Child Loop BB8_14 Depth 4
                                        #           Child Loop BB8_18 Depth 5
                                        #       Child Loop BB8_41 Depth 3
	movq	%rdx, %rcx
	shlq	$5, %rcx
	movq	600(%rsp), %rax         # 8-byte Reload
	vmovss	(%rax,%rcx), %xmm10     # xmm10 = mem[0],zero,zero,zero
	vmovss	4(%rax,%rcx), %xmm14    # xmm14 = mem[0],zero,zero,zero
	vmovss	8(%rax,%rcx), %xmm11    # xmm11 = mem[0],zero,zero,zero
	vmovss	16(%rax,%rcx), %xmm1    # xmm1 = mem[0],zero,zero,zero
	vmovss	20(%rax,%rcx), %xmm4    # xmm4 = mem[0],zero,zero,zero
	vmovss	24(%rax,%rcx), %xmm0    # xmm0 = mem[0],zero,zero,zero
	movl	12(%rax,%rcx), %ebp
	movl	28(%rax,%rcx), %eax
	movl	%eax, -108(%rsp)        # 4-byte Spill
	vandps	%xmm3, %xmm1, %xmm2
	vucomiss	%xmm6, %xmm2
	jae	.LBB8_3
# BB#4:                                 # %if_then.i
                                        #   in Loop: Header=BB8_2 Depth=1
	vmovmskps	%xmm1, %ecx
	shll	$31, %ecx
	orl	$841731191, %ecx        # imm = 0x322BCC77
	vmovd	%ecx, %xmm8
	jmp	.LBB8_5
	.p2align	4, 0x90
.LBB8_3:                                # %if_else.i
                                        #   in Loop: Header=BB8_2 Depth=1
	vmovss	.LCPI8_2(%rip), %xmm2   # xmm2 = mem[0],zero,zero,zero
	vdivss	%xmm1, %xmm2, %xmm8
.LBB8_5:                                # %safe_rcp_cont
                                        #   in Loop: Header=BB8_2 Depth=1
	vandps	%xmm3, %xmm4, %xmm2
	vucomiss	%xmm6, %xmm2
	jae	.LBB8_6
# BB#7:                                 # %if_then.i32
                                        #   in Loop: Header=BB8_2 Depth=1
	vmovmskps	%xmm4, %ecx
	shll	$31, %ecx
	orl	$841731191, %ecx        # imm = 0x322BCC77
	vmovd	%ecx, %xmm9
	jmp	.LBB8_8
	.p2align	4, 0x90
.LBB8_6:                                # %if_else.i31
                                        #   in Loop: Header=BB8_2 Depth=1
	vmovss	.LCPI8_2(%rip), %xmm2   # xmm2 = mem[0],zero,zero,zero
	vdivss	%xmm4, %xmm2, %xmm9
.LBB8_8:                                # %safe_rcp_cont1
                                        #   in Loop: Header=BB8_2 Depth=1
	vandps	%xmm3, %xmm0, %xmm2
	vucomiss	%xmm6, %xmm2
	movq	%rdx, 616(%rsp)         # 8-byte Spill
	jae	.LBB8_9
# BB#10:                                # %if_then.i29
                                        #   in Loop: Header=BB8_2 Depth=1
	vmovmskps	%xmm0, %ecx
	shll	$31, %ecx
	orl	$841731191, %ecx        # imm = 0x322BCC77
	vmovd	%ecx, %xmm7
	jmp	.LBB8_11
	.p2align	4, 0x90
.LBB8_9:                                # %if_else.i28
                                        #   in Loop: Header=BB8_2 Depth=1
	vmovss	.LCPI8_2(%rip), %xmm2   # xmm2 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm2, %xmm7
.LBB8_11:                               # %body
                                        #   in Loop: Header=BB8_2 Depth=1
	xorl	%edi, %edi
	vxorps	%xmm2, %xmm2, %xmm2
	vucomiss	%xmm2, %xmm0
	seta	%dil
	xorl	%ebx, %ebx
	vucomiss	%xmm2, %xmm4
	seta	%bl
	xorl	%r15d, %r15d
	vucomiss	%xmm2, %xmm1
	seta	%r15b
	vmulss	%xmm9, %xmm14, %xmm2
	vmovaps	640(%rsp), %xmm5        # 16-byte Reload
	vxorps	%xmm5, %xmm2, %xmm2
	vmulss	%xmm7, %xmm11, %xmm3
	vxorps	%xmm5, %xmm3, %xmm3
	vmulss	%xmm8, %xmm10, %xmm6
	vxorps	%xmm5, %xmm6, %xmm6
	movl	$0, 320(%rsp)
	movl	$2139095039, 64(%rsp)   # imm = 0x7F7FFFFF
	shll	$5, %ebx
	shll	$5, %edi
	shlq	$5, %r15
	movl	%r15d, %r8d
	xorl	$32, %r8d
	leal	64(%rbx), %r12d
	xorl	$96, %ebx
	leal	128(%rdi), %r10d
	xorl	$160, %edi
	vmovd	%ebp, %xmm15
	vbroadcastss	%xmm7, %ymm7
	vbroadcastss	%xmm8, %ymm8
	vbroadcastss	%xmm9, %ymm9
	vmovaps	%xmm10, %xmm5
	vbroadcastss	%xmm3, %ymm10
	vmovaps	%xmm11, %xmm3
	vbroadcastss	%xmm6, %ymm11
	vbroadcastss	%xmm2, %ymm12
	vpbroadcastd	%xmm15, %ymm13
	vbroadcastss	%xmm1, %xmm1
	vmovaps	%xmm1, 768(%rsp)        # 16-byte Spill
	vbroadcastss	%xmm4, %xmm1
	vmovaps	%xmm1, 752(%rsp)        # 16-byte Spill
	vbroadcastss	%xmm0, %xmm0
	vmovaps	%xmm0, 736(%rsp)        # 16-byte Spill
	vbroadcastss	%xmm5, %xmm0
	vmovaps	%xmm0, 720(%rsp)        # 16-byte Spill
	vbroadcastss	%xmm3, %xmm0
	vmovaps	%xmm0, 704(%rsp)        # 16-byte Spill
	vbroadcastss	%xmm14, %xmm0
	vmovaps	%xmm0, 688(%rsp)        # 16-byte Spill
	vpbroadcastd	%xmm15, %xmm0
	vmovdqa	%xmm0, 672(%rsp)        # 16-byte Spill
	movl	$-1, 28(%rsp)           # 4-byte Folded Spill
	xorl	%r13d, %r13d
	movl	$1, %edx
	movq	%rdi, -48(%rsp)         # 8-byte Spill
	movq	%rbx, -56(%rsp)         # 8-byte Spill
.LBB8_12:                               # %while_head1.rv.i.preheader.lr.ph
                                        #   Parent Loop BB8_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB8_13 Depth 3
                                        #         Child Loop BB8_14 Depth 4
                                        #           Child Loop BB8_18 Depth 5
                                        #       Child Loop BB8_41 Depth 3
	vmovd	-108(%rsp), %xmm3       # 4-byte Folded Reload
	vpbroadcastd	%xmm3, %ymm4
	movl	%edx, %ecx
	.p2align	4, 0x90
.LBB8_13:                               # %while_head1.rv.i.preheader
                                        #   Parent Loop BB8_2 Depth=1
                                        #     Parent Loop BB8_12 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB8_14 Depth 4
                                        #           Child Loop BB8_18 Depth 5
	testl	%ecx, %ecx
	jg	.LBB8_14
	jmp	.LBB8_38
.LBB8_17:                               # %if_then.rv.i.preheader
                                        #   in Loop: Header=BB8_14 Depth=4
	movslq	%r13d, %rcx
	leaq	68(%rsp), %rax
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, -96(%rsp)         # 8-byte Spill
	leaq	324(%rsp), %rax
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, -128(%rsp)        # 8-byte Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB8_18:                               # %if_then.rv.i
                                        #   Parent Loop BB8_2 Depth=1
                                        #     Parent Loop BB8_12 Depth=2
                                        #       Parent Loop BB8_13 Depth=3
                                        #         Parent Loop BB8_14 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	tzcntl	%r9d, %edi
	movslq	192(%rsi,%rdi,4), %r11
	testq	%r11, %r11
	je	.LBB8_23
# BB#19:                                # %if_else24.rv.i
                                        #   in Loop: Header=BB8_18 Depth=5
	movq	%r11, %rax
	shlq	$8, %rax
	movl	%r11d, %ebx
	notl	%ebx
	movslq	%ebx, %rbx
	imulq	$208, %rbx, %rbx
	addq	632(%rsp), %rbx         # 8-byte Folded Reload
	testl	%r11d, %r11d
	movq	-104(%rsp), %r14        # 8-byte Reload
	leaq	-256(%r14,%rax), %rax
	cmovsq	%rbx, %rax
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	vmovd	%edi, %xmm0
	vpermps	%ymm5, %ymm0, %ymm0
	vmovd	%ebp, %xmm1
	vucomiss	%xmm1, %xmm0
	jae	.LBB8_20
# BB#21:                                # %if_then_crit.rv.i
                                        #   in Loop: Header=BB8_18 Depth=5
	movq	-128(%rsp), %rax        # 8-byte Reload
	movl	%edx, (%rax,%rcx,4)
	movq	-96(%rsp), %rax         # 8-byte Reload
	movl	%ebp, (%rax,%rcx,4)
	vmovd	%xmm0, %ebp
	movl	%r11d, %edx
	jmp	.LBB8_22
	.p2align	4, 0x90
.LBB8_20:                               # %if_else28.rv.i
                                        #   in Loop: Header=BB8_18 Depth=5
	movq	-128(%rsp), %rax        # 8-byte Reload
	movl	%r11d, (%rax,%rcx,4)
	movq	-96(%rsp), %rax         # 8-byte Reload
	vmovss	%xmm0, (%rax,%rcx,4)
.LBB8_22:                               # %next29.rv.i
                                        #   in Loop: Header=BB8_18 Depth=5
	leal	-1(%r9), %eax
	addq	$1, %rcx
	andl	%r9d, %eax
	movl	%eax, %r9d
	jne	.LBB8_18
.LBB8_23:                               # %if_then.rv.i.break.rv.i_crit_edge
                                        #   in Loop: Header=BB8_14 Depth=4
	addl	%ecx, %r13d
	cmpl	$2, %ecx
	jge	.LBB8_24
# BB#36:                                # %next59.rv.i
                                        #   in Loop: Header=BB8_14 Depth=4
	testl	%ecx, %ecx
	movq	-104(%rsp), %r14        # 8-byte Reload
	movq	-48(%rsp), %rdi         # 8-byte Reload
	movq	-56(%rsp), %rbx         # 8-byte Reload
	jne	.LBB8_15
	jmp	.LBB8_37
.LBB8_24:                               # %if_then33.rv.i
                                        #   in Loop: Header=BB8_14 Depth=4
	addl	$-2, %ecx
	cmpl	$5, %ecx
	movq	-104(%rsp), %r14        # 8-byte Reload
	movq	-48(%rsp), %rdi         # 8-byte Reload
	movq	-56(%rsp), %rbx         # 8-byte Reload
	ja	.LBB8_26
# BB#25:                                # %if_then33.rv.i
                                        #   in Loop: Header=BB8_14 Depth=4
	jmpq	*.LJTI8_0(,%rcx,8)
.LBB8_33:                               # %if_then_crit57.rv.i
                                        #   in Loop: Header=BB8_14 Depth=4
	movslq	%r13d, %rax
	leaq	316(%rsp,%rax,4), %rcx
	movq	%rcx, -16(%rsp)         # 8-byte Spill
	movl	316(%rsp,%rax,4), %ecx
	leaq	60(%rsp,%rax,4), %r9
	vmovss	60(%rsp,%rax,4), %xmm0  # xmm0 = mem[0],zero,zero,zero
	leaq	320(%rsp,%rax,4), %rsi
	movq	%rsi, -96(%rsp)         # 8-byte Spill
	movl	320(%rsp,%rax,4), %esi
	leaq	64(%rsp,%rax,4), %r11
	movq	%r11, -128(%rsp)        # 8-byte Spill
	vmovss	64(%rsp,%rax,4), %xmm1  # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	movl	%esi, %eax
	cmovbl	%ecx, %eax
	vminss	%xmm1, %xmm0, %xmm2
	cmovbl	%esi, %ecx
	vmaxss	%xmm0, %xmm1, %xmm0
	vmovd	%xmm0, %r11d
.LBB8_34:                               # %next59.rv.i.thread
                                        #   in Loop: Header=BB8_14 Depth=4
	vmovd	%xmm2, -32(%rsp)        # 4-byte Folded Spill
.LBB8_35:                               # %next59.rv.i.thread
                                        #   in Loop: Header=BB8_14 Depth=4
	movq	-16(%rsp), %rsi         # 8-byte Reload
	movl	%ecx, (%rsi)
	movl	%r11d, (%r9)
	movq	-96(%rsp), %rcx         # 8-byte Reload
	movl	%eax, (%rcx)
	movq	-128(%rsp), %rax        # 8-byte Reload
	movl	-32(%rsp), %ecx         # 4-byte Reload
	movl	%ecx, (%rax)
	jmp	.LBB8_15
.LBB8_32:                               # %if_then_crit56.rv.i
                                        #   in Loop: Header=BB8_14 Depth=4
	movslq	%r13d, %rax
	movl	312(%rsp,%rax,4), %esi
	vmovss	56(%rsp,%rax,4), %xmm0  # xmm0 = mem[0],zero,zero,zero
	leaq	316(%rsp,%rax,4), %rcx
	movq	%rcx, -16(%rsp)         # 8-byte Spill
	movl	316(%rsp,%rax,4), %r9d
	leaq	60(%rsp,%rax,4), %r11
	vmovss	60(%rsp,%rax,4), %xmm1  # xmm1 = mem[0],zero,zero,zero
	leaq	320(%rsp,%rax,4), %rcx
	movq	%rcx, -96(%rsp)         # 8-byte Spill
	movl	320(%rsp,%rax,4), %ecx
	movl	%ecx, -80(%rsp)         # 4-byte Spill
	leaq	64(%rsp,%rax,4), %rcx
	movq	%rcx, -128(%rsp)        # 8-byte Spill
	movl	64(%rsp,%rax,4), %ecx
	movl	%ecx, -32(%rsp)         # 4-byte Spill
	vucomiss	%xmm1, %xmm0
	movl	%r9d, %ecx
	cmovbl	%esi, %ecx
	vminss	%xmm1, %xmm0, %xmm2
	vmaxss	%xmm0, %xmm1, %xmm0
	cmovbl	%r9d, %esi
	movq	%r11, %r9
	movl	%esi, 312(%rsp,%rax,4)
	vmovss	%xmm0, 56(%rsp,%rax,4)
	movl	-80(%rsp), %eax         # 4-byte Reload
	vmovd	%xmm2, %r11d
	jmp	.LBB8_35
.LBB8_31:                               # %if_then_crit55.rv.i
                                        #   in Loop: Header=BB8_14 Depth=4
	movslq	%r13d, %rsi
	movl	308(%rsp,%rsi,4), %eax
	vmovss	52(%rsp,%rsi,4), %xmm0  # xmm0 = mem[0],zero,zero,zero
	movl	312(%rsp,%rsi,4), %r9d
	vmovss	56(%rsp,%rsi,4), %xmm1  # xmm1 = mem[0],zero,zero,zero
	leaq	316(%rsp,%rsi,4), %rcx
	movq	%rcx, -16(%rsp)         # 8-byte Spill
	movl	316(%rsp,%rsi,4), %edi
	leaq	60(%rsp,%rsi,4), %rcx
	movq	%rcx, (%rsp)            # 8-byte Spill
	vmovss	60(%rsp,%rsi,4), %xmm2  # xmm2 = mem[0],zero,zero,zero
	leaq	320(%rsp,%rsi,4), %rcx
	movq	%rcx, -96(%rsp)         # 8-byte Spill
	movl	320(%rsp,%rsi,4), %ebx
	leaq	64(%rsp,%rsi,4), %rcx
	movq	%rcx, -128(%rsp)        # 8-byte Spill
	vmovss	64(%rsp,%rsi,4), %xmm5  # xmm5 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	movl	%r9d, %ecx
	cmovbl	%eax, %ecx
	vminss	%xmm1, %xmm0, %xmm6
	cmovbl	%r9d, %eax
	vmaxss	%xmm0, %xmm1, %xmm0
	vucomiss	%xmm5, %xmm2
	movl	%ebx, %r11d
	cmovbl	%edi, %r11d
	vminss	%xmm5, %xmm2, %xmm1
	cmovbl	%ebx, %edi
	movq	-104(%rsp), %r14        # 8-byte Reload
	vmaxss	%xmm2, %xmm5, %xmm2
	vucomiss	%xmm2, %xmm0
	movl	%edi, %r9d
	cmovbl	%eax, %r9d
	vminss	%xmm2, %xmm0, %xmm5
	vmaxss	%xmm0, %xmm2, %xmm0
	cmovael	%eax, %edi
	vucomiss	%xmm1, %xmm6
	movl	%r11d, %eax
	cmovbl	%ecx, %eax
	vminss	%xmm1, %xmm6, %xmm2
	cmovael	%ecx, %r11d
	vmaxss	%xmm6, %xmm1, %xmm1
	vucomiss	%xmm5, %xmm1
	movl	%r9d, %ecx
	cmovbl	%r11d, %ecx
	vminss	%xmm5, %xmm1, %xmm6
	vmaxss	%xmm1, %xmm5, %xmm1
	cmovbl	%r9d, %r11d
	movq	(%rsp), %r9             # 8-byte Reload
	movl	%edi, 308(%rsp,%rsi,4)
	vmovss	%xmm0, 52(%rsp,%rsi,4)
	movl	%r11d, 312(%rsp,%rsi,4)
	movq	-56(%rsp), %rbx         # 8-byte Reload
	movq	-48(%rsp), %rdi         # 8-byte Reload
	vmovss	%xmm1, 56(%rsp,%rsi,4)
	vmovd	%xmm6, %r11d
	jmp	.LBB8_34
.LBB8_26:                               # %if_else51.rv.i
                                        #   in Loop: Header=BB8_14 Depth=4
	movslq	%r13d, %rax
	movq	%rax, 576(%rsp)         # 8-byte Spill
	movl	292(%rsp,%rax,4), %ecx
	vmovss	36(%rsp,%rax,4), %xmm2  # xmm2 = mem[0],zero,zero,zero
	movl	296(%rsp,%rax,4), %r11d
	vmovss	40(%rsp,%rax,4), %xmm1  # xmm1 = mem[0],zero,zero,zero
	movl	300(%rsp,%rax,4), %r9d
	vmovss	44(%rsp,%rax,4), %xmm6  # xmm6 = mem[0],zero,zero,zero
	movl	304(%rsp,%rax,4), %ebx
	vmovss	48(%rsp,%rax,4), %xmm5  # xmm5 = mem[0],zero,zero,zero
	movl	308(%rsp,%rax,4), %esi
	vmovss	52(%rsp,%rax,4), %xmm0  # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 32(%rsp)         # 4-byte Spill
	movl	312(%rsp,%rax,4), %r14d
	vmovss	56(%rsp,%rax,4), %xmm15 # xmm15 = mem[0],zero,zero,zero
	movl	316(%rsp,%rax,4), %edi
	movl	%edi, -96(%rsp)         # 4-byte Spill
	vmovss	60(%rsp,%rax,4), %xmm0  # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, -128(%rsp)       # 4-byte Spill
	movl	320(%rsp,%rax,4), %edi
	vmovss	64(%rsp,%rax,4), %xmm14 # xmm14 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm2
	movl	%r11d, %eax
	cmovbl	%ecx, %eax
	vminss	%xmm1, %xmm2, %xmm0
	cmovbl	%r11d, %ecx
	vmaxss	%xmm2, %xmm1, %xmm1
	vucomiss	%xmm5, %xmm6
	movl	%ebx, %r11d
	cmovbl	%r9d, %r11d
	vminss	%xmm5, %xmm6, %xmm2
	cmovbl	%ebx, %r9d
	vmaxss	%xmm6, %xmm5, %xmm5
	vucomiss	%xmm5, %xmm1
	movl	%r9d, %ebx
	cmovbl	%ecx, %ebx
	vminss	%xmm5, %xmm1, %xmm6
	cmovael	%ecx, %r9d
	vmaxss	%xmm1, %xmm5, %xmm1
	vmovss	%xmm1, -16(%rsp)        # 4-byte Spill
	vucomiss	%xmm2, %xmm0
	movl	%r11d, %ecx
	cmovbl	%eax, %ecx
	movl	%ecx, (%rsp)            # 4-byte Spill
	vminss	%xmm2, %xmm0, %xmm1
	vmovss	%xmm1, -32(%rsp)        # 4-byte Spill
	cmovael	%eax, %r11d
	vmaxss	%xmm0, %xmm2, %xmm0
	vucomiss	%xmm6, %xmm0
	movl	%ebx, %ecx
	cmovbl	%r11d, %ecx
	vminss	%xmm6, %xmm0, %xmm1
	vmovss	%xmm1, -40(%rsp)        # 4-byte Spill
	cmovbl	%ebx, %r11d
	vmaxss	%xmm0, %xmm6, %xmm0
	vmovss	%xmm0, -80(%rsp)        # 4-byte Spill
	vmovss	32(%rsp), %xmm1         # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm15, %xmm1
	movl	%r14d, %ebx
	cmovbl	%esi, %ebx
	vminss	%xmm15, %xmm1, %xmm0
	cmovbl	%r14d, %esi
	vmaxss	%xmm1, %xmm15, %xmm1
	vmovss	-128(%rsp), %xmm5       # 4-byte Reload
                                        # xmm5 = mem[0],zero,zero,zero
	vucomiss	%xmm14, %xmm5
	movl	%edi, %eax
	movl	-96(%rsp), %r14d        # 4-byte Reload
	cmovbl	%r14d, %edi
	vminss	%xmm14, %xmm5, %xmm2
	cmovbl	%eax, %r14d
	vmaxss	%xmm5, %xmm14, %xmm5
	vucomiss	%xmm5, %xmm1
	movl	%r14d, %eax
	cmovbl	%esi, %eax
	vminss	%xmm5, %xmm1, %xmm6
	cmovael	%esi, %r14d
	vmaxss	%xmm1, %xmm5, %xmm14
	vucomiss	%xmm2, %xmm0
	movl	%edi, %esi
	cmovbl	%ebx, %esi
	vminss	%xmm2, %xmm0, %xmm1
	vmovss	%xmm1, 32(%rsp)         # 4-byte Spill
	cmovael	%ebx, %edi
	vmaxss	%xmm0, %xmm2, %xmm0
	vucomiss	%xmm6, %xmm0
	movl	%eax, %ebx
	cmovbl	%edi, %ebx
	vminss	%xmm6, %xmm0, %xmm1
	cmovbl	%eax, %edi
	movl	%edi, -128(%rsp)        # 4-byte Spill
	vmaxss	%xmm0, %xmm6, %xmm0
	vmovss	-16(%rsp), %xmm2        # 4-byte Reload
                                        # xmm2 = mem[0],zero,zero,zero
	vmovss	%xmm14, -36(%rsp)       # 4-byte Spill
	vucomiss	%xmm14, %xmm2
	movl	%r14d, %edi
	cmovbl	%r9d, %edi
	vminss	%xmm14, %xmm2, %xmm2
	cmovael	%r9d, %r14d
	movl	%r14d, -96(%rsp)        # 4-byte Spill
	vmovss	-40(%rsp), %xmm5        # 4-byte Reload
                                        # xmm5 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm5
	movl	%ebx, %eax
	cmovbl	%ecx, %eax
	movl	%eax, 60(%rsp)          # 4-byte Spill
	vminss	%xmm1, %xmm5, %xmm6
	vmovss	%xmm6, 56(%rsp)         # 4-byte Spill
	cmovael	%ecx, %ebx
	vmaxss	%xmm5, %xmm1, %xmm1
	vucomiss	%xmm2, %xmm1
	movl	%edi, %r14d
	cmovbl	%ebx, %r14d
	vminss	%xmm2, %xmm1, %xmm15
	cmovbl	%edi, %ebx
	vmaxss	%xmm1, %xmm2, %xmm14
	vmovss	-80(%rsp), %xmm1        # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm0, %xmm1
	movl	-128(%rsp), %ecx        # 4-byte Reload
	movl	%ecx, %edi
	cmovbl	%r11d, %edi
	vminss	%xmm0, %xmm1, %xmm2
	cmovael	%r11d, %ecx
	movl	%ecx, %r11d
	vmaxss	%xmm1, %xmm0, %xmm5
	vmovss	-32(%rsp), %xmm0        # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vmovss	32(%rsp), %xmm1         # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	movl	%esi, %eax
	movl	(%rsp), %ecx            # 4-byte Reload
	cmovbl	%ecx, %eax
	movl	%eax, -80(%rsp)         # 4-byte Spill
	cmovael	%ecx, %esi
	vmaxss	%xmm0, %xmm1, %xmm6
	vucomiss	%xmm2, %xmm6
	vminss	%xmm2, %xmm6, %xmm1
	vmaxss	%xmm6, %xmm2, %xmm2
	movl	%edi, %r9d
	cmovbl	%esi, %r9d
	cmovbl	%edi, %esi
	vucomiss	%xmm14, %xmm5
	movl	%ebx, %eax
	movl	%r11d, %ecx
	cmovbl	%ecx, %eax
	movl	%eax, (%rsp)            # 4-byte Spill
	cmovbl	%ebx, %ecx
	movl	%ecx, -128(%rsp)        # 4-byte Spill
	vucomiss	%xmm15, %xmm2
	movl	%r14d, %eax
	cmovbl	%esi, %eax
	movl	%eax, -40(%rsp)         # 4-byte Spill
	cmovbl	%r14d, %esi
	movq	-56(%rsp), %rbx         # 8-byte Reload
	movq	-48(%rsp), %rdi         # 8-byte Reload
	movq	-104(%rsp), %r14        # 8-byte Reload
	vmovss	56(%rsp), %xmm0         # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm0, %xmm1
	movl	60(%rsp), %eax          # 4-byte Reload
	movl	%eax, %ecx
	cmovbl	%r9d, %ecx
	cmovbl	%eax, %r9d
	movq	576(%rsp), %r11         # 8-byte Reload
	movl	-96(%rsp), %eax         # 4-byte Reload
	movl	%eax, 292(%rsp,%r11,4)
	vmovss	-16(%rsp), %xmm6        # 4-byte Reload
                                        # xmm6 = mem[0],zero,zero,zero
	vmaxss	-36(%rsp), %xmm6, %xmm6 # 4-byte Folded Reload
	vmovss	%xmm6, -36(%rsp)        # 4-byte Spill
	movl	-128(%rsp), %eax        # 4-byte Reload
	movl	%eax, 296(%rsp,%r11,4)
	movq	%r11, %rax
	leaq	316(%rsp,%rax,4), %r11
	movq	%r11, -16(%rsp)         # 8-byte Spill
	movq	%rax, %r11
	movl	(%rsp), %eax            # 4-byte Reload
	movl	%eax, 300(%rsp,%r11,4)
	leaq	60(%rsp,%r11,4), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	movl	%esi, 304(%rsp,%r11,4)
	leaq	320(%rsp,%r11,4), %rsi
	movq	%rsi, -96(%rsp)         # 8-byte Spill
	movl	-40(%rsp), %eax         # 4-byte Reload
	movl	%eax, 308(%rsp,%r11,4)
	movl	-80(%rsp), %eax         # 4-byte Reload
	leaq	64(%rsp,%r11,4), %rsi
	movq	%rsi, -128(%rsp)        # 8-byte Spill
	vmovss	-32(%rsp), %xmm6        # 4-byte Reload
                                        # xmm6 = mem[0],zero,zero,zero
	vminss	32(%rsp), %xmm6, %xmm6  # 4-byte Folded Reload
	vmovss	%xmm6, -32(%rsp)        # 4-byte Spill
	vmovaps	%xmm14, %xmm6
	vmovaps	%xmm5, %xmm14
	vminss	%xmm6, %xmm14, %xmm5
	vmovss	%xmm5, 32(%rsp)         # 4-byte Spill
	vmaxss	%xmm14, %xmm6, %xmm14
	vmovaps	%xmm15, %xmm6
	vminss	%xmm6, %xmm2, %xmm15
	vmaxss	%xmm2, %xmm6, %xmm2
	vminss	%xmm0, %xmm1, %xmm6
	vmaxss	%xmm1, %xmm0, %xmm5
	vmovss	-36(%rsp), %xmm0        # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 36(%rsp,%r11,4)
	vmovss	%xmm14, 40(%rsp,%r11,4)
	vmovss	32(%rsp), %xmm0         # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 44(%rsp,%r11,4)
	vmovss	%xmm2, 48(%rsp,%r11,4)
	vmovss	%xmm15, 52(%rsp,%r11,4)
	movl	%r9d, 312(%rsp,%r11,4)
	movq	(%rsp), %r9             # 8-byte Reload
	vmovss	%xmm5, 56(%rsp,%r11,4)
	vmovd	%xmm6, %r11d
	vmovd	-32(%rsp), %xmm0        # 4-byte Folded Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vmovd	%xmm0, -32(%rsp)        # 4-byte Folded Spill
	jmp	.LBB8_35
.LBB8_30:                               # %if_then_crit54.rv.i
                                        #   in Loop: Header=BB8_14 Depth=4
	movslq	%r13d, %rsi
	movl	304(%rsp,%rsi,4), %ecx
	vmovss	48(%rsp,%rsi,4), %xmm0  # xmm0 = mem[0],zero,zero,zero
	movl	308(%rsp,%rsi,4), %r9d
	vmovss	52(%rsp,%rsi,4), %xmm1  # xmm1 = mem[0],zero,zero,zero
	movl	312(%rsp,%rsi,4), %r11d
	vmovss	56(%rsp,%rsi,4), %xmm2  # xmm2 = mem[0],zero,zero,zero
	leaq	316(%rsp,%rsi,4), %rax
	movq	%rax, -16(%rsp)         # 8-byte Spill
	movl	316(%rsp,%rsi,4), %eax
	leaq	60(%rsp,%rsi,4), %rdi
	movq	%rdi, (%rsp)            # 8-byte Spill
	vmovss	60(%rsp,%rsi,4), %xmm5  # xmm5 = mem[0],zero,zero,zero
	leaq	320(%rsp,%rsi,4), %rdi
	movq	%rdi, -96(%rsp)         # 8-byte Spill
	movl	320(%rsp,%rsi,4), %edi
	movl	%edi, -80(%rsp)         # 4-byte Spill
	leaq	64(%rsp,%rsi,4), %rdi
	movq	%rdi, -128(%rsp)        # 8-byte Spill
	movl	64(%rsp,%rsi,4), %edi
	movl	%edi, -32(%rsp)         # 4-byte Spill
	vucomiss	%xmm1, %xmm0
	movl	%r9d, %ebx
	cmovbl	%ecx, %ebx
	vminss	%xmm1, %xmm0, %xmm6
	cmovbl	%r9d, %ecx
	vmaxss	%xmm0, %xmm1, %xmm0
	vucomiss	%xmm5, %xmm2
	movl	%eax, %r9d
	cmovbl	%r11d, %r9d
	vminss	%xmm5, %xmm2, %xmm1
	cmovbl	%eax, %r11d
	vmaxss	%xmm2, %xmm5, %xmm2
	vucomiss	%xmm2, %xmm0
	movl	%r11d, %edi
	cmovbl	%ecx, %edi
	vminss	%xmm2, %xmm0, %xmm5
	vmaxss	%xmm0, %xmm2, %xmm0
	cmovael	%ecx, %r11d
	vucomiss	%xmm1, %xmm6
	movl	%r9d, %ecx
	cmovbl	%ebx, %ecx
	vminss	%xmm1, %xmm6, %xmm2
	cmovael	%ebx, %r9d
	movq	-104(%rsp), %r14        # 8-byte Reload
	vmaxss	%xmm6, %xmm1, %xmm1
	vucomiss	%xmm5, %xmm1
	vminss	%xmm5, %xmm1, %xmm6
	movl	%edi, %eax
	cmovbl	%r9d, %eax
	vmaxss	%xmm1, %xmm5, %xmm1
	cmovbl	%edi, %r9d
	movq	-56(%rsp), %rbx         # 8-byte Reload
	movq	-48(%rsp), %rdi         # 8-byte Reload
	movl	%r11d, 304(%rsp,%rsi,4)
	vmovss	%xmm0, 48(%rsp,%rsi,4)
	movl	%r9d, 308(%rsp,%rsi,4)
	movq	(%rsp), %r9             # 8-byte Reload
	vmovss	%xmm1, 52(%rsp,%rsi,4)
	movl	%eax, 312(%rsp,%rsi,4)
	movl	-80(%rsp), %eax         # 4-byte Reload
	vmovss	%xmm6, 56(%rsp,%rsi,4)
	vmovd	%xmm2, %r11d
	jmp	.LBB8_35
.LBB8_29:                               # %if_then_crit53.rv.i
                                        #   in Loop: Header=BB8_14 Depth=4
	movslq	%r13d, %rsi
	movl	300(%rsp,%rsi,4), %r14d
	vmovss	44(%rsp,%rsi,4), %xmm1  # xmm1 = mem[0],zero,zero,zero
	movl	304(%rsp,%rsi,4), %ebx
	vmovss	48(%rsp,%rsi,4), %xmm2  # xmm2 = mem[0],zero,zero,zero
	movl	308(%rsp,%rsi,4), %edi
	vmovss	52(%rsp,%rsi,4), %xmm5  # xmm5 = mem[0],zero,zero,zero
	movl	312(%rsp,%rsi,4), %r11d
	vmovss	56(%rsp,%rsi,4), %xmm6  # xmm6 = mem[0],zero,zero,zero
	leaq	316(%rsp,%rsi,4), %rax
	movq	%rax, -16(%rsp)         # 8-byte Spill
	movl	316(%rsp,%rsi,4), %ecx
	vucomiss	%xmm2, %xmm1
	movl	%ebx, %r9d
	cmovbl	%r14d, %r9d
	vminss	%xmm2, %xmm1, %xmm0
	cmovbl	%ebx, %r14d
	vmaxss	%xmm1, %xmm2, %xmm1
	vucomiss	%xmm6, %xmm5
	movl	%r11d, %eax
	cmovbl	%edi, %r11d
	vminss	%xmm6, %xmm5, %xmm2
	cmovbl	%eax, %edi
	vmaxss	%xmm5, %xmm6, %xmm5
	vucomiss	%xmm5, %xmm1
	movl	%edi, %ebx
	cmovbl	%r14d, %ebx
	vminss	%xmm5, %xmm1, %xmm6
	vmaxss	%xmm1, %xmm5, %xmm1
	cmovael	%r14d, %edi
	vucomiss	%xmm2, %xmm0
	movl	%r11d, %eax
	cmovbl	%r9d, %eax
	movl	%eax, -128(%rsp)        # 4-byte Spill
	cmovael	%r9d, %r11d
	vmaxss	%xmm0, %xmm2, %xmm5
	vucomiss	%xmm6, %xmm5
	movl	%ebx, %r9d
	cmovbl	%r11d, %r9d
	cmovbl	%ebx, %r11d
	movq	-104(%rsp), %r14        # 8-byte Reload
	movl	320(%rsp,%rsi,4), %eax
	movl	%eax, -80(%rsp)         # 4-byte Spill
	movl	%edi, 300(%rsp,%rsi,4)
	leaq	60(%rsp,%rsi,4), %rax
	movl	%r11d, 304(%rsp,%rsi,4)
	movq	-56(%rsp), %rbx         # 8-byte Reload
	movq	-48(%rsp), %rdi         # 8-byte Reload
	movl	60(%rsp,%rsi,4), %r11d
	movl	%r9d, 308(%rsp,%rsi,4)
	movq	%rax, %r9
	leaq	320(%rsp,%rsi,4), %rax
	movq	%rax, -96(%rsp)         # 8-byte Spill
	movl	-128(%rsp), %eax        # 4-byte Reload
	movl	%eax, 312(%rsp,%rsi,4)
	movl	64(%rsp,%rsi,4), %eax
	movl	%eax, -32(%rsp)         # 4-byte Spill
	vminss	%xmm2, %xmm0, %xmm0
	vminss	%xmm6, %xmm5, %xmm2
	vmaxss	%xmm5, %xmm6, %xmm5
	vmovss	%xmm1, 44(%rsp,%rsi,4)
	vmovss	%xmm5, 48(%rsp,%rsi,4)
	vmovss	%xmm2, 52(%rsp,%rsi,4)
	vmovss	%xmm0, 56(%rsp,%rsi,4)
	jmp	.LBB8_28
.LBB8_27:                               # %if_then_crit52.rv.i
                                        #   in Loop: Header=BB8_14 Depth=4
	movslq	%r13d, %rsi
	movl	296(%rsp,%rsi,4), %r14d
	vmovss	40(%rsp,%rsi,4), %xmm1  # xmm1 = mem[0],zero,zero,zero
	movl	300(%rsp,%rsi,4), %ebx
	vmovss	44(%rsp,%rsi,4), %xmm2  # xmm2 = mem[0],zero,zero,zero
	movl	304(%rsp,%rsi,4), %edi
	vmovss	48(%rsp,%rsi,4), %xmm5  # xmm5 = mem[0],zero,zero,zero
	movl	308(%rsp,%rsi,4), %r11d
	vmovss	52(%rsp,%rsi,4), %xmm6  # xmm6 = mem[0],zero,zero,zero
	leaq	316(%rsp,%rsi,4), %rax
	movq	%rax, -16(%rsp)         # 8-byte Spill
	movl	316(%rsp,%rsi,4), %ecx
	vucomiss	%xmm2, %xmm1
	movl	%ebx, %r9d
	cmovbl	%r14d, %r9d
	vminss	%xmm2, %xmm1, %xmm0
	cmovbl	%ebx, %r14d
	vmaxss	%xmm1, %xmm2, %xmm1
	vucomiss	%xmm6, %xmm5
	movl	%r11d, %eax
	cmovbl	%edi, %r11d
	vminss	%xmm6, %xmm5, %xmm2
	cmovbl	%eax, %edi
	vmaxss	%xmm5, %xmm6, %xmm5
	vucomiss	%xmm5, %xmm1
	movl	%edi, %ebx
	cmovbl	%r14d, %ebx
	vminss	%xmm5, %xmm1, %xmm6
	vmaxss	%xmm1, %xmm5, %xmm1
	cmovael	%r14d, %edi
	vucomiss	%xmm2, %xmm0
	movl	%r11d, %eax
	cmovbl	%r9d, %eax
	movl	%eax, -128(%rsp)        # 4-byte Spill
	cmovael	%r9d, %r11d
	vmaxss	%xmm0, %xmm2, %xmm5
	vucomiss	%xmm6, %xmm5
	movl	%ebx, %r9d
	cmovbl	%r11d, %r9d
	cmovbl	%ebx, %r11d
	movq	-104(%rsp), %r14        # 8-byte Reload
	movl	320(%rsp,%rsi,4), %eax
	movl	%eax, -80(%rsp)         # 4-byte Spill
	movl	%edi, 296(%rsp,%rsi,4)
	leaq	60(%rsp,%rsi,4), %rax
	movl	%r11d, 300(%rsp,%rsi,4)
	movq	-56(%rsp), %rbx         # 8-byte Reload
	movq	-48(%rsp), %rdi         # 8-byte Reload
	movl	60(%rsp,%rsi,4), %r11d
	movl	%r9d, 304(%rsp,%rsi,4)
	movq	%rax, %r9
	leaq	320(%rsp,%rsi,4), %rax
	movq	%rax, -96(%rsp)         # 8-byte Spill
	movl	-128(%rsp), %eax        # 4-byte Reload
	movl	%eax, 308(%rsp,%rsi,4)
	movl	64(%rsp,%rsi,4), %eax
	movl	%eax, -32(%rsp)         # 4-byte Spill
	vminss	%xmm2, %xmm0, %xmm0
	vminss	%xmm6, %xmm5, %xmm2
	vmaxss	%xmm5, %xmm6, %xmm5
	vmovss	%xmm1, 40(%rsp,%rsi,4)
	vmovss	%xmm5, 44(%rsp,%rsi,4)
	vmovss	%xmm2, 48(%rsp,%rsi,4)
	vmovss	%xmm0, 52(%rsp,%rsi,4)
.LBB8_28:                               # %next59.rv.i.thread
                                        #   in Loop: Header=BB8_14 Depth=4
	leaq	64(%rsp,%rsi,4), %rax
	movq	%rax, -128(%rsp)        # 8-byte Spill
	movl	-80(%rsp), %eax         # 4-byte Reload
	jmp	.LBB8_35
	.p2align	4, 0x90
.LBB8_14:                               # %while_body5.rv.i
                                        #   Parent Loop BB8_2 Depth=1
                                        #     Parent Loop BB8_12 Depth=2
                                        #       Parent Loop BB8_13 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB8_18 Depth 5
	vmovd	%ebp, %xmm0
	movslq	%r13d, %r13
	movl	320(%rsp,%r13,4), %edx
	movl	64(%rsp,%r13,4), %ebp
	addl	$-1, %r13d
	vucomiss	%xmm0, %xmm3
	jbe	.LBB8_15
# BB#16:                                # %if_else.rv.i
                                        #   in Loop: Header=BB8_14 Depth=4
	movslq	%ecx, %rsi
	addq	$-1, %rsi
	shlq	$8, %rsi
	addq	%r14, %rsi
	vmovaps	(%r10,%rsi), %ymm0
	vfmadd213ps	%ymm10, %ymm7, %ymm0
	vmovaps	(%r8,%rsi), %ymm1
	vfmadd213ps	%ymm11, %ymm8, %ymm1
	vmovaps	(%r15,%rsi), %ymm2
	vfmadd213ps	%ymm11, %ymm8, %ymm2
	vmovaps	(%rbx,%rsi), %ymm5
	vfmadd213ps	%ymm12, %ymm9, %ymm5
	vmovaps	(%r12,%rsi), %ymm6
	vfmadd213ps	%ymm12, %ymm9, %ymm6
	vmovaps	(%rdi,%rsi), %ymm14
	vfmadd213ps	%ymm10, %ymm7, %ymm14
	vpmaxsd	%ymm1, %ymm5, %ymm1
	vpminsd	%ymm6, %ymm2, %ymm2
	vpminsd	%ymm4, %ymm0, %ymm0
	vpmaxsd	%ymm14, %ymm13, %ymm5
	vpmaxsd	%ymm1, %ymm5, %ymm5
	vpminsd	%ymm0, %ymm2, %ymm0
	vpcmpgtd	%ymm0, %ymm5, %ymm0
	vmovmskps	%ymm0, %r9d
	xorl	$255, %r9d
	jne	.LBB8_17
.LBB8_15:                               # %while_head1.rv.i.backedge
                                        #   in Loop: Header=BB8_14 Depth=4
	movl	%edx, %ecx
	testl	%edx, %edx
	jg	.LBB8_14
.LBB8_37:                               # %break64.rv.i
                                        #   in Loop: Header=BB8_13 Depth=3
	movl	%edx, %ecx
	testl	%edx, %edx
	js	.LBB8_38
.LBB8_39:                               # %while_head.rv.i.backedge
                                        #   in Loop: Header=BB8_13 Depth=3
	movl	%edx, %ecx
	testl	%edx, %edx
	jne	.LBB8_13
	jmp	.LBB8_46
.LBB8_38:                               # %if_then68.rv.i
                                        #   in Loop: Header=BB8_13 Depth=3
	vmovd	%ebp, %xmm0
	movslq	%r13d, %r13
	movl	320(%rsp,%r13,4), %edx
	movl	64(%rsp,%r13,4), %ebp
	addl	$-1, %r13d
	vucomiss	%xmm0, %xmm3
	jbe	.LBB8_39
# BB#40:                                # %head.rv.i.preheader
                                        #   in Loop: Header=BB8_12 Depth=2
	notl	%ecx
	movslq	%ecx, %rax
	imulq	$208, %rax, %rsi
	addq	624(%rsp), %rsi         # 8-byte Folded Reload
	jmp	.LBB8_41
.LBB8_42:                               # %if_else_crit.rv.i22
                                        #   in Loop: Header=BB8_41 Depth=3
	vandps	%xmm2, %xmm15, %xmm2
	vmovaps	%xmm2, 576(%rsp)        # 16-byte Spill
	vmovd	-108(%rsp), %xmm15      # 4-byte Folded Reload
	vmovaps	32(%rsp), %xmm3         # 16-byte Reload
	vmulps	-80(%rsp), %xmm3, %xmm14 # 16-byte Folded Reload
	vmovaps	%xmm4, %xmm3
	vcmpneq_usps	.LCPI8_6, %xmm3, %xmm2
	vmovaps	%xmm2, -80(%rsp)        # 16-byte Spill
	vpbroadcastd	%xmm15, %xmm2
	vmulps	%xmm3, %xmm2, %xmm15
	vmovaps	(%rsp), %xmm2           # 16-byte Reload
	vfmadd132ps	-32(%rsp), %xmm14, %xmm2 # 16-byte Folded Reload
	vmulps	672(%rsp), %xmm3, %xmm3 # 16-byte Folded Reload
	vfmadd132ps	-16(%rsp), %xmm2, %xmm1 # 16-byte Folded Reload
	vxorps	%xmm1, %xmm6, %xmm2
	vcmpleps	%xmm15, %xmm2, %xmm1
	vcmpleps	%xmm2, %xmm3, %xmm3
	vandps	-80(%rsp), %xmm1, %xmm1 # 16-byte Folded Reload
	vandps	%xmm3, %xmm1, %xmm1
	vmovdqa	576(%rsp), %xmm3        # 16-byte Reload
	vptest	%xmm1, %xmm3
	je	.LBB8_44
# BB#43:                                # %if_then.rv.i24
                                        #   in Loop: Header=BB8_41 Depth=3
	vpand	%xmm3, %xmm1, %xmm1
	vmovaps	%xmm4, %xmm6
	vrcpps	%xmm6, %xmm3
	vbroadcastss	.LCPI8_2(%rip), %xmm4
	vfnmadd213ps	%xmm4, %xmm3, %xmm6
	vfmadd132ps	%xmm3, %xmm3, %xmm6
	vmulps	%xmm2, %xmm6, %xmm2
	vbroadcastss	.LCPI8_5(%rip), %xmm3
	vblendvps	%xmm1, %xmm2, %xmm3, %xmm1
	vpermilpd	$1, %xmm1, %xmm3 # xmm3 = xmm1[1,0]
	vpminsd	%xmm3, %xmm1, %xmm3
	vpshufd	$57, %xmm3, %xmm4       # xmm4 = xmm3[1,2,3,0]
	vpminsd	%xmm4, %xmm3, %xmm3
	vcmpeqps	%xmm3, %xmm1, %xmm1
	vmovmskps	%xmm1, %eax
	tzcntl	%eax, %eax
	movl	(%rsi,%rax,4), %r9d
                                        # kill: %EAX<def> %EAX<kill> %RAX<kill> %RAX<def>
	andl	$3, %eax
	vmulps	%xmm0, %xmm6, %xmm0
	vmulps	%xmm5, %xmm6, %xmm1
	movl	$2147483647, %ecx       # imm = 0x7FFFFFFF
	andl	%ecx, %r9d
	movl	%r9d, 28(%rsp)          # 4-byte Spill
	vmovaps	%xmm2, 784(%rsp)
	movl	784(%rsp,%rax,4), %ecx
	movl	%ecx, -108(%rsp)        # 4-byte Spill
	vmovaps	%xmm0, 800(%rsp)
	movl	800(%rsp,%rax,4), %ecx
	movl	%ecx, 24(%rsp)          # 4-byte Spill
	vmovaps	%xmm1, 816(%rsp)
	movl	816(%rsp,%rax,4), %eax
	movl	%eax, 20(%rsp)          # 4-byte Spill
	jmp	.LBB8_44
	.p2align	4, 0x90
.LBB8_41:                               # %while_head.rv.i9
                                        #   Parent Loop BB8_2 Depth=1
                                        #     Parent Loop BB8_12 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovaps	-48(%rsi), %xmm3
	vmovaps	-32(%rsi), %xmm0
	vmovaps	-16(%rsi), %xmm2
	vmovaps	752(%rsp), %xmm15       # 16-byte Reload
	vmovaps	%xmm0, -32(%rsp)        # 16-byte Spill
	vmulps	%xmm0, %xmm15, %xmm1
	vmovaps	768(%rsp), %xmm14       # 16-byte Reload
	vmovaps	%xmm3, -80(%rsp)        # 16-byte Spill
	vfmadd231ps	%xmm3, %xmm14, %xmm1
	vmovaps	736(%rsp), %xmm6        # 16-byte Reload
	vmovaps	%xmm2, -16(%rsp)        # 16-byte Spill
	vfmadd231ps	%xmm2, %xmm6, %xmm1
	vandps	.LCPI8_4(%rip), %xmm1, %xmm0
	vmovaps	%xmm0, -96(%rsp)        # 16-byte Spill
	vmovaps	-192(%rsi), %xmm2
	vmovaps	-176(%rsi), %xmm4
	vmovaps	-160(%rsi), %xmm5
	vbroadcastss	.LCPI8_3(%rip), %xmm3
	vandps	%xmm3, %xmm1, %xmm0
	vmovaps	%xmm0, -128(%rsp)       # 16-byte Spill
	vsubps	720(%rsp), %xmm2, %xmm1 # 16-byte Folded Reload
	vsubps	704(%rsp), %xmm5, %xmm3 # 16-byte Folded Reload
	vsubps	688(%rsp), %xmm4, %xmm0 # 16-byte Folded Reload
	vmulps	%xmm1, %xmm15, %xmm2
	vmulps	%xmm3, %xmm14, %xmm4
	vmulps	%xmm0, %xmm6, %xmm5
	vmovaps	%xmm0, (%rsp)           # 16-byte Spill
	vfmsub231ps	%xmm0, %xmm14, %xmm2
	vmovaps	%xmm1, 32(%rsp)         # 16-byte Spill
	vfmsub231ps	%xmm1, %xmm6, %xmm4
	vmovaps	-96(%rsp), %xmm14       # 16-byte Reload
	vmovaps	-128(%rsp), %xmm6       # 16-byte Reload
	vmovaps	%xmm3, %xmm1
	vmulps	-80(%rsi), %xmm4, %xmm0
	vfmsub231ps	%xmm1, %xmm15, %xmm5
	vmulps	-128(%rsi), %xmm4, %xmm4
	vfmadd231ps	-96(%rsi), %xmm5, %xmm0
	vfmadd231ps	-144(%rsi), %xmm5, %xmm4
	vfmadd231ps	-64(%rsi), %xmm2, %xmm0
	vfmadd231ps	-112(%rsi), %xmm2, %xmm4
	vxorps	%xmm0, %xmm6, %xmm0
	vxorps	%xmm4, %xmm6, %xmm5
	vxorps	%xmm4, %xmm4, %xmm4
	vcmpleps	%xmm0, %xmm4, %xmm2
	vcmpleps	%xmm5, %xmm4, %xmm4
	vandps	%xmm2, %xmm4, %xmm15
	vaddps	%xmm5, %xmm0, %xmm2
	vmovaps	%xmm14, %xmm4
	vcmpleps	%xmm14, %xmm2, %xmm2
	vptest	%xmm2, %xmm15
	jne	.LBB8_42
.LBB8_44:                               # %next.rv.i
                                        #   in Loop: Header=BB8_41 Depth=3
	cmpl	$0, 12(%rsi)
	leaq	208(%rsi), %rsi
	jns	.LBB8_41
# BB#45:                                # %lambda_2661674_vectorize.exit
                                        #   in Loop: Header=BB8_12 Depth=2
	testl	%edx, %edx
	jne	.LBB8_12
	.p2align	4, 0x90
.LBB8_46:                               # %exit
                                        #   in Loop: Header=BB8_2 Depth=1
	movq	616(%rsp), %rdx         # 8-byte Reload
	leaq	1(%rdx), %rax
	shlq	$4, %rdx
	movq	608(%rsp), %rcx         # 8-byte Reload
	movl	28(%rsp), %esi          # 4-byte Reload
	movl	%esi, (%rcx,%rdx)
	movl	-108(%rsp), %esi        # 4-byte Reload
	movl	%esi, 4(%rcx,%rdx)
	movl	24(%rsp), %esi          # 4-byte Reload
	movl	%esi, 8(%rcx,%rdx)
	movl	20(%rsp), %esi          # 4-byte Reload
	movl	%esi, 12(%rcx,%rdx)
	movq	%rax, %rdx
	cmpq	592(%rsp), %rax         # 8-byte Folded Reload
	vmovaps	656(%rsp), %xmm3        # 16-byte Reload
	vmovss	.LCPI8_1(%rip), %xmm6   # xmm6 = mem[0],zero,zero,zero
	jne	.LBB8_2
.LBB8_47:                               # %if_else
	addq	$840, %rsp              # imm = 0x348
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.Lfunc_end8:
	.size	cpu_intersect_bvh8_tri4_single_avx2, .Lfunc_end8-cpu_intersect_bvh8_tri4_single_avx2
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI8_0:
	.quad	.LBB8_33
	.quad	.LBB8_32
	.quad	.LBB8_31
	.quad	.LBB8_30
	.quad	.LBB8_29
	.quad	.LBB8_27

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI9_0:
	.long	2147483647              # float NaN
.LCPI9_1:
	.long	841731191               # float 9.99999993E-9
.LCPI9_2:
	.long	1065353216              # float 1
.LCPI9_3:
	.long	2147483648              # float -0
.LCPI9_5:
	.long	2139095039              # float 3.40282347E+38
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI9_4:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.text
	.globl	cpu_intersect_bvh4_single_avx2
	.p2align	4, 0x90
	.type	cpu_intersect_bvh4_single_avx2,@function
cpu_intersect_bvh4_single_avx2:         # @cpu_intersect_bvh4_single_avx2
# BB#0:                                 # %cpu_intersect_bvh4_single_avx2_start
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$808, %rsp              # imm = 0x328
	movq	%rdx, -16(%rsp)         # 8-byte Spill
	movq	%rsi, -24(%rsp)         # 8-byte Spill
	testl	%ecx, %ecx
	jle	.LBB9_62
# BB#1:                                 # %if_then.lr.ph
	movq	(%rdi), %r9
	movq	8(%rdi), %rax
	movl	%ecx, %ecx
	movq	%rcx, -32(%rsp)         # 8-byte Spill
	movq	%rax, 8(%rsp)           # 8-byte Spill
	leaq	192(%rax), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	xorl	%edx, %edx
	vbroadcastss	.LCPI9_0(%rip), %xmm2
	vmovss	.LCPI9_1(%rip), %xmm3   # xmm3 = mem[0],zero,zero,zero
	vbroadcastss	.LCPI9_3(%rip), %xmm0
	vmovaps	%xmm0, 288(%rsp)        # 16-byte Spill
                                        # implicit-def: %EAX
	movl	%eax, -88(%rsp)         # 4-byte Spill
                                        # implicit-def: %EAX
	movl	%eax, -92(%rsp)         # 4-byte Spill
	vmovaps	%xmm2, 304(%rsp)        # 16-byte Spill
	movq	%r9, -112(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB9_2:                                # %if_then
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB9_12 Depth 2
                                        #       Child Loop BB9_13 Depth 3
                                        #         Child Loop BB9_14 Depth 4
                                        #           Child Loop BB9_18 Depth 5
                                        #       Child Loop BB9_56 Depth 3
	movq	%rdx, %rcx
	shlq	$5, %rcx
	movq	-24(%rsp), %rax         # 8-byte Reload
	vmovss	(%rax,%rcx), %xmm6      # xmm6 = mem[0],zero,zero,zero
	vmovss	4(%rax,%rcx), %xmm4     # xmm4 = mem[0],zero,zero,zero
	vmovss	8(%rax,%rcx), %xmm7     # xmm7 = mem[0],zero,zero,zero
	vmovss	16(%rax,%rcx), %xmm5    # xmm5 = mem[0],zero,zero,zero
	vmovss	20(%rax,%rcx), %xmm8    # xmm8 = mem[0],zero,zero,zero
	vmovss	24(%rax,%rcx), %xmm12   # xmm12 = mem[0],zero,zero,zero
	movl	12(%rax,%rcx), %ebp
	movl	28(%rax,%rcx), %eax
	movl	%eax, -116(%rsp)        # 4-byte Spill
	vandps	%xmm2, %xmm5, %xmm0
	vucomiss	%xmm3, %xmm0
	jae	.LBB9_3
# BB#4:                                 # %if_then.i
                                        #   in Loop: Header=BB9_2 Depth=1
	vmovmskps	%xmm5, %ecx
	shll	$31, %ecx
	orl	$841731191, %ecx        # imm = 0x322BCC77
	vmovd	%ecx, %xmm9
	jmp	.LBB9_5
	.p2align	4, 0x90
.LBB9_3:                                # %if_else.i
                                        #   in Loop: Header=BB9_2 Depth=1
	vmovss	.LCPI9_2(%rip), %xmm0   # xmm0 = mem[0],zero,zero,zero
	vdivss	%xmm5, %xmm0, %xmm9
.LBB9_5:                                # %safe_rcp_cont
                                        #   in Loop: Header=BB9_2 Depth=1
	vandps	%xmm2, %xmm8, %xmm1
	vucomiss	%xmm3, %xmm1
	jae	.LBB9_6
# BB#7:                                 # %if_then.i31
                                        #   in Loop: Header=BB9_2 Depth=1
	vmovmskps	%xmm8, %ecx
	shll	$31, %ecx
	orl	$841731191, %ecx        # imm = 0x322BCC77
	vmovd	%ecx, %xmm1
	jmp	.LBB9_8
	.p2align	4, 0x90
.LBB9_6:                                # %if_else.i30
                                        #   in Loop: Header=BB9_2 Depth=1
	vmovss	.LCPI9_2(%rip), %xmm0   # xmm0 = mem[0],zero,zero,zero
	vdivss	%xmm8, %xmm0, %xmm1
.LBB9_8:                                # %safe_rcp_cont1
                                        #   in Loop: Header=BB9_2 Depth=1
	vandps	%xmm2, %xmm12, %xmm2
	vucomiss	%xmm3, %xmm2
	movq	%rdx, -8(%rsp)          # 8-byte Spill
	jae	.LBB9_9
# BB#10:                                # %if_then.i28
                                        #   in Loop: Header=BB9_2 Depth=1
	vmovmskps	%xmm12, %ecx
	shll	$31, %ecx
	orl	$841731191, %ecx        # imm = 0x322BCC77
	vmovd	%ecx, %xmm2
	jmp	.LBB9_11
	.p2align	4, 0x90
.LBB9_9:                                # %if_else.i27
                                        #   in Loop: Header=BB9_2 Depth=1
	vmovss	.LCPI9_2(%rip), %xmm0   # xmm0 = mem[0],zero,zero,zero
	vdivss	%xmm12, %xmm0, %xmm2
.LBB9_11:                               # %body
                                        #   in Loop: Header=BB9_2 Depth=1
	xorl	%ebx, %ebx
	vxorps	%xmm0, %xmm0, %xmm0
	vucomiss	%xmm0, %xmm12
	seta	%bl
	xorl	%r14d, %r14d
	vucomiss	%xmm0, %xmm8
	seta	%r14b
	xorl	%r15d, %r15d
	vucomiss	%xmm0, %xmm5
	seta	%r15b
	vmulss	%xmm1, %xmm4, %xmm3
	vmovaps	%xmm4, -64(%rsp)        # 16-byte Spill
	vmulss	%xmm2, %xmm7, %xmm4
	vmovaps	288(%rsp), %xmm0        # 16-byte Reload
	vxorps	%xmm0, %xmm3, %xmm13
	vxorps	%xmm0, %xmm4, %xmm3
	vmovaps	%xmm7, -80(%rsp)        # 16-byte Spill
	vmovaps	%xmm6, %xmm7
	vmulss	%xmm9, %xmm7, %xmm6
	vxorps	%xmm0, %xmm6, %xmm0
	movl	$0, 16(%rsp)
	movl	$2139095039, 552(%rsp)  # imm = 0x7F7FFFFF
	shll	$4, %ebx
	shll	$4, %r14d
	shlq	$4, %r15
	movl	%r15d, %r8d
	xorl	$16, %r8d
	leal	32(%r14), %r12d
	xorl	$48, %r14d
	leal	64(%rbx), %r10d
	xorl	$80, %ebx
	vmovd	%ebp, %xmm4
	vbroadcastss	%xmm9, %xmm15
	vbroadcastss	%xmm1, %xmm14
	vbroadcastss	%xmm2, %xmm9
	vbroadcastss	%xmm0, %xmm10
	vbroadcastss	%xmm13, %xmm0
	vbroadcastss	%xmm3, %xmm3
	vpbroadcastd	%xmm4, %xmm11
	vbroadcastss	%xmm5, %xmm1
	vmovaps	%xmm1, 464(%rsp)        # 16-byte Spill
	vbroadcastss	%xmm8, %xmm1
	vmovaps	%xmm1, 448(%rsp)        # 16-byte Spill
	vbroadcastss	%xmm12, %xmm1
	vmovaps	%xmm1, 432(%rsp)        # 16-byte Spill
	vbroadcastss	-80(%rsp), %xmm1 # 16-byte Folded Reload
	vmovaps	%xmm1, 416(%rsp)        # 16-byte Spill
	vbroadcastss	-64(%rsp), %xmm1 # 16-byte Folded Reload
	vmovaps	%xmm1, 400(%rsp)        # 16-byte Spill
	vbroadcastss	%xmm7, %xmm1
	vmovaps	%xmm1, 384(%rsp)        # 16-byte Spill
	movl	$-1, -84(%rsp)          # 4-byte Folded Spill
	movl	$1, %edx
	xorl	%r13d, %r13d
	movq	%rbx, -104(%rsp)        # 8-byte Spill
.LBB9_12:                               # %while_head1.rv.i.preheader.lr.ph
                                        #   Parent Loop BB9_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB9_13 Depth 3
                                        #         Child Loop BB9_14 Depth 4
                                        #           Child Loop BB9_18 Depth 5
                                        #       Child Loop BB9_56 Depth 3
	vmovd	-116(%rsp), %xmm12      # 4-byte Folded Reload
	vpbroadcastd	%xmm12, %xmm13
	movl	%edx, %ecx
	.p2align	4, 0x90
.LBB9_13:                               # %while_head1.rv.i.preheader
                                        #   Parent Loop BB9_2 Depth=1
                                        #     Parent Loop BB9_12 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB9_14 Depth 4
                                        #           Child Loop BB9_18 Depth 5
	testl	%ecx, %ecx
	jg	.LBB9_14
	jmp	.LBB9_53
.LBB9_17:                               # %if_then.rv.i.preheader
                                        #   in Loop: Header=BB9_14 Depth=4
	movslq	%r13d, %rcx
	leaq	556(%rsp), %rax
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, -80(%rsp)         # 8-byte Spill
	leaq	20(%rsp), %rax
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, -48(%rsp)         # 8-byte Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB9_18:                               # %if_then.rv.i
                                        #   Parent Loop BB9_2 Depth=1
                                        #     Parent Loop BB9_12 Depth=2
                                        #       Parent Loop BB9_13 Depth=3
                                        #         Parent Loop BB9_14 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	tzcntl	%edi, %r9d
	movslq	96(%rsi,%r9,4), %r11
	testq	%r11, %r11
	je	.LBB9_23
# BB#19:                                # %if_else24.rv.i
                                        #   in Loop: Header=BB9_18 Depth=5
	movq	%rcx, -64(%rsp)         # 8-byte Spill
	movl	%r11d, %ecx
	notl	%ecx
	movq	%r11, %rax
	movslq	%ecx, %rcx
	imulq	$208, %rcx, %rcx
	shlq	$7, %rax
	addq	8(%rsp), %rcx           # 8-byte Folded Reload
	testl	%r11d, %r11d
	movq	-112(%rsp), %rbx        # 8-byte Reload
	leaq	-128(%rbx,%rax), %rax
	cmovsq	%rcx, %rax
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	vmovdqa	%xmm5, 528(%rsp)
	andl	$3, %r9d
	vmovd	528(%rsp,%r9,4), %xmm8  # xmm8 = mem[0],zero,zero,zero
	vmovd	%ebp, %xmm1
	vucomiss	%xmm1, %xmm8
	jae	.LBB9_20
# BB#21:                                # %if_then_crit.rv.i
                                        #   in Loop: Header=BB9_18 Depth=5
	movq	-64(%rsp), %rcx         # 8-byte Reload
	movq	-48(%rsp), %rax         # 8-byte Reload
	movl	%edx, (%rax,%rcx,4)
	movq	-80(%rsp), %rax         # 8-byte Reload
	movl	%ebp, (%rax,%rcx,4)
	vmovd	%xmm8, %ebp
	movl	%r11d, %edx
	jmp	.LBB9_22
	.p2align	4, 0x90
.LBB9_20:                               # %if_else26.rv.i
                                        #   in Loop: Header=BB9_18 Depth=5
	movq	-64(%rsp), %rcx         # 8-byte Reload
	movq	-48(%rsp), %rax         # 8-byte Reload
	movl	%r11d, (%rax,%rcx,4)
	movq	-80(%rsp), %rax         # 8-byte Reload
	vmovd	%xmm8, (%rax,%rcx,4)
.LBB9_22:                               # %next27.rv.i
                                        #   in Loop: Header=BB9_18 Depth=5
	leal	-1(%rdi), %eax
	addq	$1, %rcx
	andl	%edi, %eax
	movl	%eax, %edi
	jne	.LBB9_18
.LBB9_23:                               # %if_then.rv.i.break.rv.i_crit_edge
                                        #   in Loop: Header=BB9_14 Depth=4
	addl	%ecx, %r13d
	cmpl	$2, %ecx
	jge	.LBB9_24
# BB#51:                                # %next68.rv.i
                                        #   in Loop: Header=BB9_14 Depth=4
	testl	%ecx, %ecx
	movq	-112(%rsp), %r9         # 8-byte Reload
	movq	-104(%rsp), %rbx        # 8-byte Reload
	jne	.LBB9_15
	jmp	.LBB9_52
.LBB9_24:                               # %if_then31.rv.i
                                        #   in Loop: Header=BB9_14 Depth=4
	movq	-112(%rsp), %r9         # 8-byte Reload
	movq	-104(%rsp), %rbx        # 8-byte Reload
	jne	.LBB9_25
# BB#49:                                # %if_then_crit63.rv.i
                                        #   in Loop: Header=BB9_14 Depth=4
	movslq	%r13d, %rcx
	vmovss	548(%rsp,%rcx,4), %xmm8 # xmm8 = mem[0],zero,zero,zero
	vmovd	552(%rsp,%rcx,4), %xmm5 # xmm5 = mem[0],zero,zero,zero
	vucomiss	%xmm5, %xmm8
	jae	.LBB9_15
# BB#50:                                # %if_then65.rv.i
                                        #   in Loop: Header=BB9_14 Depth=4
	leaq	-1(%rcx), %rax
	movl	16(%rsp,%rax,4), %esi
	movl	16(%rsp,%rcx,4), %edi
	vmovd	%xmm5, 552(%rsp,%rax,4)
	vmovss	%xmm8, 552(%rsp,%rcx,4)
	movl	%edi, 16(%rsp,%rax,4)
	movl	%esi, 16(%rsp,%rcx,4)
	jmp	.LBB9_15
.LBB9_25:                               # %if_then31.rv.i
                                        #   in Loop: Header=BB9_14 Depth=4
	movslq	%r13d, %rsi
	cmpl	$3, %ecx
	jne	.LBB9_26
# BB#41:                                # %if_then_crit53.rv.i
                                        #   in Loop: Header=BB9_14 Depth=4
	leaq	-1(%rsi), %rcx
	vmovss	548(%rsp,%rsi,4), %xmm5 # xmm5 = mem[0],zero,zero,zero
	vmovss	552(%rsp,%rsi,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm5
	jae	.LBB9_42
# BB#43:                                # %if_then55.rv.i
                                        #   in Loop: Header=BB9_14 Depth=4
	movl	16(%rsp,%rcx,4), %eax
	movl	16(%rsp,%rsi,4), %edi
	vmovss	%xmm1, 552(%rsp,%rcx,4)
	vmovss	%xmm5, 552(%rsp,%rsi,4)
	movl	%edi, 16(%rsp,%rcx,4)
	movl	%eax, 16(%rsp,%rsi,4)
	vmovaps	%xmm1, %xmm8
	jmp	.LBB9_44
.LBB9_42:                               #   in Loop: Header=BB9_14 Depth=4
	vmovaps	%xmm5, %xmm8
	vmovaps	%xmm1, %xmm5
.LBB9_44:                               # %next56.rv.i
                                        #   in Loop: Header=BB9_14 Depth=4
	leaq	-2(%rsi), %rdi
	vmovss	544(%rsp,%rsi,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm5
	jbe	.LBB9_45
# BB#46:                                # %if_then58.rv.i
                                        #   in Loop: Header=BB9_14 Depth=4
	movl	16(%rsp,%rdi,4), %r9d
	movl	16(%rsp,%rsi,4), %eax
	vmovss	%xmm5, 552(%rsp,%rdi,4)
	vmovss	%xmm1, 552(%rsp,%rsi,4)
	movl	%eax, 16(%rsp,%rdi,4)
	movl	%r9d, 16(%rsp,%rsi,4)
	movq	-104(%rsp), %rbx        # 8-byte Reload
	movq	-112(%rsp), %r9         # 8-byte Reload
	vucomiss	%xmm8, %xmm5
	jb	.LBB9_48
	jmp	.LBB9_15
.LBB9_45:                               #   in Loop: Header=BB9_14 Depth=4
	vmovaps	%xmm1, %xmm5
	vucomiss	%xmm8, %xmm5
	jae	.LBB9_15
.LBB9_48:                               # %if_then61.rv.i
                                        #   in Loop: Header=BB9_14 Depth=4
	movl	16(%rsp,%rdi,4), %eax
	movl	16(%rsp,%rcx,4), %esi
	vmovss	%xmm8, 552(%rsp,%rdi,4)
	vmovss	%xmm5, 552(%rsp,%rcx,4)
	movl	%esi, 16(%rsp,%rdi,4)
	movl	%eax, 16(%rsp,%rcx,4)
	jmp	.LBB9_15
.LBB9_26:                               # %if_else37.rv.i
                                        #   in Loop: Header=BB9_14 Depth=4
	leaq	-2(%rsi), %r9
	leaq	-3(%rsi), %rcx
	vmovss	540(%rsp,%rsi,4), %xmm5 # xmm5 = mem[0],zero,zero,zero
	vmovss	544(%rsp,%rsi,4), %xmm8 # xmm8 = mem[0],zero,zero,zero
	vucomiss	%xmm8, %xmm5
	jae	.LBB9_27
# BB#28:                                # %if_then39.rv.i
                                        #   in Loop: Header=BB9_14 Depth=4
	movl	16(%rsp,%rcx,4), %eax
	movl	16(%rsp,%r9,4), %edi
	vmovss	%xmm8, 552(%rsp,%rcx,4)
	vmovss	%xmm5, 552(%rsp,%r9,4)
	movl	%edi, 16(%rsp,%rcx,4)
	movl	%eax, 16(%rsp,%r9,4)
	vmovaps	%xmm5, %xmm1
	jmp	.LBB9_29
.LBB9_27:                               #   in Loop: Header=BB9_14 Depth=4
	vmovaps	%xmm8, %xmm1
	vmovaps	%xmm5, %xmm8
.LBB9_29:                               # %next40.rv.i
                                        #   in Loop: Header=BB9_14 Depth=4
	leaq	-1(%rsi), %rdi
	vmovss	548(%rsp,%rsi,4), %xmm4 # xmm4 = mem[0],zero,zero,zero
	vmovss	552(%rsp,%rsi,4), %xmm5 # xmm5 = mem[0],zero,zero,zero
	vucomiss	%xmm5, %xmm4
	jae	.LBB9_30
# BB#31:                                # %if_then42.rv.i
                                        #   in Loop: Header=BB9_14 Depth=4
	movl	16(%rsp,%rdi,4), %r11d
	movl	16(%rsp,%rsi,4), %eax
	vmovss	%xmm5, 552(%rsp,%rdi,4)
	vmovss	%xmm4, 552(%rsp,%rsi,4)
	movl	%eax, 16(%rsp,%rdi,4)
	movl	%r11d, 16(%rsp,%rsi,4)
	vmovaps	%xmm4, %xmm2
	vucomiss	%xmm5, %xmm8
	jb	.LBB9_34
	jmp	.LBB9_33
.LBB9_30:                               #   in Loop: Header=BB9_14 Depth=4
	vmovaps	%xmm5, %xmm2
	vmovaps	%xmm4, %xmm5
	vucomiss	%xmm5, %xmm8
	jae	.LBB9_33
.LBB9_34:                               # %if_then45.rv.i
                                        #   in Loop: Header=BB9_14 Depth=4
	movl	16(%rsp,%rcx,4), %r11d
	movl	16(%rsp,%rdi,4), %eax
	vmovss	%xmm5, 552(%rsp,%rcx,4)
	vmovss	%xmm8, 552(%rsp,%rdi,4)
	movl	%eax, 16(%rsp,%rcx,4)
	movl	%r11d, 16(%rsp,%rdi,4)
	vucomiss	%xmm2, %xmm1
	jb	.LBB9_37
	jmp	.LBB9_36
.LBB9_33:                               #   in Loop: Header=BB9_14 Depth=4
	vmovaps	%xmm5, %xmm8
	vucomiss	%xmm2, %xmm1
	jae	.LBB9_36
.LBB9_37:                               # %if_then48.rv.i
                                        #   in Loop: Header=BB9_14 Depth=4
	movl	16(%rsp,%r9,4), %eax
	movl	16(%rsp,%rsi,4), %ecx
	vmovss	%xmm2, 552(%rsp,%r9,4)
	vmovss	%xmm1, 552(%rsp,%rsi,4)
	movl	%ecx, 16(%rsp,%r9,4)
	movl	%eax, 16(%rsp,%rsi,4)
	vucomiss	%xmm8, %xmm2
	jb	.LBB9_40
	jmp	.LBB9_39
.LBB9_36:                               #   in Loop: Header=BB9_14 Depth=4
	vmovaps	%xmm1, %xmm2
	vucomiss	%xmm8, %xmm2
	jae	.LBB9_39
.LBB9_40:                               # %if_then51.rv.i
                                        #   in Loop: Header=BB9_14 Depth=4
	movl	16(%rsp,%r9,4), %eax
	movl	16(%rsp,%rdi,4), %ecx
	vmovss	%xmm8, 552(%rsp,%r9,4)
	vmovss	%xmm2, 552(%rsp,%rdi,4)
	movl	%ecx, 16(%rsp,%r9,4)
	movl	%eax, 16(%rsp,%rdi,4)
.LBB9_39:                               #   in Loop: Header=BB9_14 Depth=4
	movq	-112(%rsp), %r9         # 8-byte Reload
	movq	-104(%rsp), %rbx        # 8-byte Reload
	jmp	.LBB9_15
	.p2align	4, 0x90
.LBB9_14:                               # %while_body5.rv.i
                                        #   Parent Loop BB9_2 Depth=1
                                        #     Parent Loop BB9_12 Depth=2
                                        #       Parent Loop BB9_13 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB9_18 Depth 5
	vmovd	%ebp, %xmm5
	movslq	%r13d, %r13
	movl	16(%rsp,%r13,4), %edx
	movl	552(%rsp,%r13,4), %ebp
	addl	$-1, %r13d
	vucomiss	%xmm5, %xmm12
	jbe	.LBB9_15
# BB#16:                                # %if_else.rv.i
                                        #   in Loop: Header=BB9_14 Depth=4
	movslq	%ecx, %rsi
	addq	$-1, %rsi
	shlq	$7, %rsi
	addq	%r9, %rsi
	vmovaps	(%r8,%rsi), %xmm5
	vfmadd213ps	%xmm10, %xmm15, %xmm5
	vmovaps	(%r15,%rsi), %xmm4
	vfmadd213ps	%xmm10, %xmm15, %xmm4
	vmovaps	(%r14,%rsi), %xmm7
	vfmadd213ps	%xmm0, %xmm14, %xmm7
	vmovaps	(%r12,%rsi), %xmm6
	vfmadd213ps	%xmm0, %xmm14, %xmm6
	vmovaps	(%rbx,%rsi), %xmm1
	vfmadd213ps	%xmm3, %xmm9, %xmm1
	vmovaps	(%r10,%rsi), %xmm2
	vfmadd213ps	%xmm3, %xmm9, %xmm2
	vpmaxsd	%xmm5, %xmm7, %xmm5
	vpminsd	%xmm6, %xmm4, %xmm4
	vpmaxsd	%xmm1, %xmm11, %xmm1
	vpminsd	%xmm13, %xmm2, %xmm2
	vpmaxsd	%xmm5, %xmm1, %xmm5
	vpminsd	%xmm2, %xmm4, %xmm1
	vpcmpgtd	%xmm1, %xmm5, %xmm1
	vmovmskps	%xmm1, %edi
	xorl	$15, %edi
	jne	.LBB9_17
.LBB9_15:                               # %while_head1.rv.i.backedge
                                        #   in Loop: Header=BB9_14 Depth=4
	movl	%edx, %ecx
	testl	%edx, %edx
	jg	.LBB9_14
.LBB9_52:                               # %break73.rv.i
                                        #   in Loop: Header=BB9_13 Depth=3
	movl	%edx, %ecx
	testl	%edx, %edx
	js	.LBB9_53
.LBB9_54:                               # %while_head.rv.i.backedge
                                        #   in Loop: Header=BB9_13 Depth=3
	movl	%edx, %ecx
	testl	%edx, %edx
	jne	.LBB9_13
	jmp	.LBB9_61
.LBB9_53:                               # %if_then77.rv.i
                                        #   in Loop: Header=BB9_13 Depth=3
	vmovd	%ebp, %xmm1
	movslq	%r13d, %r13
	movl	16(%rsp,%r13,4), %edx
	movl	552(%rsp,%r13,4), %ebp
	addl	$-1, %r13d
	vucomiss	%xmm1, %xmm12
	jbe	.LBB9_54
# BB#55:                                # %head.rv.i.preheader
                                        #   in Loop: Header=BB9_12 Depth=2
	notl	%ecx
	movslq	%ecx, %rax
	imulq	$208, %rax, %r11
	addq	(%rsp), %r11            # 8-byte Folded Reload
	jmp	.LBB9_56
.LBB9_57:                               # %if_else_crit.rv.i22
                                        #   in Loop: Header=BB9_56 Depth=3
	vandps	%xmm2, %xmm1, %xmm1
	vmovaps	%xmm1, 272(%rsp)        # 16-byte Spill
	vmovd	-116(%rsp), %xmm1       # 4-byte Folded Reload
	vmovaps	320(%rsp), %xmm2        # 16-byte Reload
	vmulps	352(%rsp), %xmm2, %xmm2 # 16-byte Folded Reload
	vfmadd132ps	368(%rsp), %xmm2, %xmm8 # 16-byte Folded Reload
	vcmpneq_usps	%xmm4, %xmm13, %xmm7
	vpbroadcastd	%xmm1, %xmm1
	vmulps	%xmm13, %xmm1, %xmm1
	vmulps	%xmm13, %xmm11, %xmm4
	vmovaps	336(%rsp), %xmm2        # 16-byte Reload
	vfmadd132ps	-48(%rsp), %xmm8, %xmm2 # 16-byte Folded Reload
	vxorps	%xmm2, %xmm12, %xmm8
	vmovdqa	272(%rsp), %xmm2        # 16-byte Reload
	vcmpleps	%xmm1, %xmm8, %xmm1
	vcmpleps	%xmm8, %xmm4, %xmm4
	vandps	%xmm7, %xmm1, %xmm1
	vandps	%xmm4, %xmm1, %xmm1
	vptest	%xmm1, %xmm2
	je	.LBB9_59
# BB#58:                                # %if_then.rv.i24
                                        #   in Loop: Header=BB9_56 Depth=3
	vpand	%xmm2, %xmm1, %xmm1
	vrcpps	%xmm13, %xmm2
	vbroadcastss	.LCPI9_2(%rip), %xmm4
	vfnmadd213ps	%xmm4, %xmm2, %xmm13
	vfmadd132ps	%xmm2, %xmm2, %xmm13
	vmulps	%xmm8, %xmm13, %xmm2
	vbroadcastss	.LCPI9_5(%rip), %xmm4
	vblendvps	%xmm1, %xmm2, %xmm4, %xmm1
	vpermilpd	$1, %xmm1, %xmm4 # xmm4 = xmm1[1,0]
	vpminsd	%xmm4, %xmm1, %xmm4
	vmovaps	%xmm6, %xmm7
	vpshufd	$57, %xmm4, %xmm6       # xmm6 = xmm4[1,2,3,0]
	vpminsd	%xmm6, %xmm4, %xmm4
	vcmpeqps	%xmm4, %xmm1, %xmm1
	vmovmskps	%xmm1, %eax
	tzcntl	%eax, %eax
	movl	(%r11,%rax,4), %esi
                                        # kill: %EAX<def> %EAX<kill> %RAX<kill> %RAX<def>
	andl	$3, %eax
	vmulps	%xmm7, %xmm13, %xmm1
	vmulps	%xmm5, %xmm13, %xmm4
	movl	$2147483647, %ecx       # imm = 0x7FFFFFFF
	andl	%ecx, %esi
	movl	%esi, -84(%rsp)         # 4-byte Spill
	vmovaps	%xmm2, 480(%rsp)
	movl	480(%rsp,%rax,4), %ecx
	movl	%ecx, -116(%rsp)        # 4-byte Spill
	vmovaps	%xmm1, 496(%rsp)
	movl	496(%rsp,%rax,4), %ecx
	movl	%ecx, -88(%rsp)         # 4-byte Spill
	vmovaps	%xmm4, 512(%rsp)
	movl	512(%rsp,%rax,4), %eax
	movl	%eax, -92(%rsp)         # 4-byte Spill
	jmp	.LBB9_59
	.p2align	4, 0x90
.LBB9_56:                               # %while_head.rv.i9
                                        #   Parent Loop BB9_2 Depth=1
                                        #     Parent Loop BB9_12 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovaps	-48(%r11), %xmm4
	vmovaps	-32(%r11), %xmm1
	vmovaps	-16(%r11), %xmm2
	vmovaps	448(%rsp), %xmm13       # 16-byte Reload
	vmovaps	%xmm1, 368(%rsp)        # 16-byte Spill
	vmulps	%xmm1, %xmm13, %xmm1
	vmovaps	464(%rsp), %xmm5        # 16-byte Reload
	vmovaps	%xmm4, 352(%rsp)        # 16-byte Spill
	vfmadd231ps	%xmm4, %xmm5, %xmm1
	vmovaps	%xmm5, %xmm6
	vmovaps	432(%rsp), %xmm8        # 16-byte Reload
	vmovaps	%xmm2, -48(%rsp)        # 16-byte Spill
	vfmadd231ps	%xmm2, %xmm8, %xmm1
	vandps	.LCPI9_4(%rip), %xmm1, %xmm2
	vmovaps	%xmm2, -64(%rsp)        # 16-byte Spill
	vmovaps	-192(%r11), %xmm2
	vmovaps	-176(%r11), %xmm5
	vmovaps	-160(%r11), %xmm4
	vbroadcastss	.LCPI9_3(%rip), %xmm7
	vandps	%xmm7, %xmm1, %xmm1
	vmovaps	%xmm1, -80(%rsp)        # 16-byte Spill
	vsubps	416(%rsp), %xmm4, %xmm4 # 16-byte Folded Reload
	vsubps	400(%rsp), %xmm5, %xmm12 # 16-byte Folded Reload
	vsubps	384(%rsp), %xmm2, %xmm5 # 16-byte Folded Reload
	vmulps	%xmm4, %xmm6, %xmm1
	vmovaps	%xmm6, %xmm7
	vmulps	%xmm12, %xmm8, %xmm2
	vmulps	%xmm5, %xmm13, %xmm6
	vmovaps	%xmm4, 336(%rsp)        # 16-byte Spill
	vfmsub231ps	%xmm4, %xmm13, %xmm2
	vmovaps	-64(%rsp), %xmm13       # 16-byte Reload
	vmovaps	%xmm5, 320(%rsp)        # 16-byte Spill
	vfmsub231ps	%xmm5, %xmm8, %xmm1
	vmovaps	%xmm12, %xmm8
	vmovaps	-80(%rsp), %xmm12       # 16-byte Reload
	vmulps	-80(%r11), %xmm1, %xmm4
	vfmsub231ps	%xmm8, %xmm7, %xmm6
	vmulps	-128(%r11), %xmm1, %xmm1
	vfmadd231ps	-96(%r11), %xmm2, %xmm4
	vfmadd231ps	-144(%r11), %xmm2, %xmm1
	vfmadd231ps	-64(%r11), %xmm6, %xmm4
	vfmadd231ps	-112(%r11), %xmm6, %xmm1
	vxorps	%xmm4, %xmm12, %xmm6
	vxorps	%xmm1, %xmm12, %xmm5
	vxorps	%xmm2, %xmm2, %xmm2
	vcmpleps	%xmm6, %xmm2, %xmm1
	vxorps	%xmm4, %xmm4, %xmm4
	vcmpleps	%xmm5, %xmm2, %xmm2
	vandps	%xmm1, %xmm2, %xmm1
	vaddps	%xmm5, %xmm6, %xmm2
	vcmpleps	%xmm13, %xmm2, %xmm2
	vptest	%xmm2, %xmm1
	jne	.LBB9_57
.LBB9_59:                               # %next.rv.i
                                        #   in Loop: Header=BB9_56 Depth=3
	cmpl	$0, 12(%r11)
	leaq	208(%r11), %r11
	jns	.LBB9_56
# BB#60:                                # %lambda_2663893_vectorize.exit
                                        #   in Loop: Header=BB9_12 Depth=2
	testl	%edx, %edx
	jne	.LBB9_12
	.p2align	4, 0x90
.LBB9_61:                               # %exit
                                        #   in Loop: Header=BB9_2 Depth=1
	movq	-8(%rsp), %rdx          # 8-byte Reload
	leaq	1(%rdx), %rax
	shlq	$4, %rdx
	movq	-16(%rsp), %rcx         # 8-byte Reload
	movl	-84(%rsp), %esi         # 4-byte Reload
	movl	%esi, (%rcx,%rdx)
	movl	-116(%rsp), %esi        # 4-byte Reload
	movl	%esi, 4(%rcx,%rdx)
	movl	-88(%rsp), %esi         # 4-byte Reload
	movl	%esi, 8(%rcx,%rdx)
	movl	-92(%rsp), %esi         # 4-byte Reload
	movl	%esi, 12(%rcx,%rdx)
	movq	%rax, %rdx
	cmpq	-32(%rsp), %rax         # 8-byte Folded Reload
	vmovaps	304(%rsp), %xmm2        # 16-byte Reload
	vmovss	.LCPI9_1(%rip), %xmm3   # xmm3 = mem[0],zero,zero,zero
	jne	.LBB9_2
.LBB9_62:                               # %if_else
	addq	$808, %rsp              # imm = 0x328
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end9:
	.size	cpu_intersect_bvh4_single_avx2, .Lfunc_end9-cpu_intersect_bvh4_single_avx2

	.globl	gpu_occluded_nvvm
	.p2align	4, 0x90
	.type	gpu_occluded_nvvm,@function
gpu_occluded_nvvm:                      # @gpu_occluded_nvvm
# BB#0:                                 # %gpu_occluded_nvvm_start
	retq
.Lfunc_end10:
	.size	gpu_occluded_nvvm, .Lfunc_end10-gpu_occluded_nvvm

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI11_0:
	.long	1065353216              # float 1
.LCPI11_1:
	.long	2147483648              # float -0
.LCPI11_2:
	.long	841731191               # float 9.99999993E-9
.LCPI11_3:
	.long	2139095039              # float 3.40282347E+38
.LCPI11_5:
	.long	4286578687              # float -3.40282347E+38
.LCPI11_6:
	.long	2147483647              # 0x7fffffff
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI11_4:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5
.LCPI11_7:
	.zero	32
.LCPI11_8:
	.zero	32,255
	.text
	.globl	cpu_occluded_bvh4_packet8_avx2
	.p2align	4, 0x90
	.type	cpu_occluded_bvh4_packet8_avx2,@function
cpu_occluded_bvh4_packet8_avx2:         # @cpu_occluded_bvh4_packet8_avx2
# BB#0:                                 # %cpu_occluded_bvh4_packet8_avx2_start
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$3424, %rsp             # imm = 0xD60
                                        # kill: %ECX<def> %ECX<kill> %RCX<def>
	movq	%rdx, 80(%rsp)          # 8-byte Spill
	movq	%rsi, 72(%rsp)          # 8-byte Spill
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	cmpl	$8, %ecx
	jl	.LBB11_38
# BB#1:                                 # %head.preheader.lr.ph
	movq	(%rdi), %r9
	movq	8(%rdi), %r11
	movq	24(%rsp), %rax          # 8-byte Reload
	shrl	$3, %eax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	leaq	192(%r11), %rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	xorl	%esi, %esi
	vbroadcastss	.LCPI11_0(%rip), %ymm0
	vmovaps	%ymm0, 448(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI11_1(%rip), %ymm0
	vmovaps	%ymm0, 768(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI11_2(%rip), %ymm0
	vmovaps	%ymm0, 736(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI11_1(%rip), %ymm0
	vmovaps	%ymm0, 512(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI11_2(%rip), %ymm0
	vmovaps	%ymm0, 704(%rsp)        # 32-byte Spill
	vbroadcastss	.LCPI11_3(%rip), %ymm6
                                        # implicit-def: %YMM0
	vmovaps	%ymm0, 192(%rsp)        # 32-byte Spill
                                        # implicit-def: %YMM0
	vmovaps	%ymm0, 160(%rsp)        # 32-byte Spill
	.p2align	4, 0x90
.LBB11_2:                               # %body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_3 Depth 2
                                        #       Child Loop BB11_4 Depth 3
                                        #         Child Loop BB11_7 Depth 4
                                        #         Child Loop BB11_11 Depth 4
                                        #       Child Loop BB11_27 Depth 3
                                        #         Child Loop BB11_28 Depth 4
	movq	%rsi, %rcx
	shlq	$8, %rcx
	movq	72(%rsp), %rax          # 8-byte Reload
	vmovups	(%rax,%rcx), %ymm0
	vmovaps	%ymm0, 576(%rsp)        # 32-byte Spill
	vmovups	32(%rax,%rcx), %ymm0
	vmovaps	%ymm0, 544(%rsp)        # 32-byte Spill
	vmovups	64(%rax,%rcx), %ymm15
	vmovups	96(%rax,%rcx), %ymm11
	vrcpps	%ymm11, %ymm0
	vmovaps	%ymm0, %ymm1
	vmovaps	448(%rsp), %ymm10       # 32-byte Reload
	vfnmadd213ps	%ymm10, %ymm11, %ymm1
	vfmadd132ps	%ymm0, %ymm0, %ymm1
	vxorps	%ymm0, %ymm0, %ymm0
	vcmpltps	%ymm11, %ymm0, %ymm0
	vmovaps	768(%rsp), %ymm12       # 32-byte Reload
	vxorps	%ymm12, %ymm11, %ymm2
	vmovups	128(%rax,%rcx), %ymm3
	vrcpps	%ymm3, %ymm9
	vmovaps	%ymm9, %ymm4
	vfnmadd213ps	%ymm10, %ymm3, %ymm4
	vfmadd132ps	%ymm9, %ymm9, %ymm4
	vblendvps	%ymm0, %ymm11, %ymm2, %ymm0
	vmovups	160(%rax,%rcx), %ymm5
	vrcpps	%ymm5, %ymm2
	vmovaps	%ymm2, %ymm7
	vfnmadd213ps	%ymm10, %ymm5, %ymm7
	vfmadd132ps	%ymm2, %ymm2, %ymm7
	vmovups	192(%rax,%rcx), %ymm9
	vmovdqu	224(%rax,%rcx), %ymm13
	vmovaps	736(%rsp), %ymm8        # 32-byte Reload
	vcmpnlt_uqps	%ymm8, %ymm0, %ymm0
	vmovaps	512(%rsp), %ymm10       # 32-byte Reload
	vmovaps	%ymm11, 384(%rsp)       # 32-byte Spill
	vandps	%ymm10, %ymm11, %ymm2
	vmovaps	704(%rsp), %ymm11       # 32-byte Reload
	vorps	%ymm11, %ymm2, %ymm2
	vblendvps	%ymm0, %ymm1, %ymm2, %ymm0
	vxorps	%ymm14, %ymm14, %ymm14
	vcmpltps	%ymm3, %ymm14, %ymm1
	vxorps	%ymm12, %ymm3, %ymm2
	vblendvps	%ymm1, %ymm3, %ymm2, %ymm1
	vcmpnlt_uqps	%ymm8, %ymm1, %ymm1
	vmovaps	%ymm3, 352(%rsp)        # 32-byte Spill
	vandps	%ymm10, %ymm3, %ymm2
	vorps	%ymm11, %ymm2, %ymm2
	vblendvps	%ymm1, %ymm4, %ymm2, %ymm2
	vcmpltps	%ymm5, %ymm14, %ymm1
	vxorps	%ymm12, %ymm5, %ymm4
	vblendvps	%ymm1, %ymm5, %ymm4, %ymm1
	vcmpnlt_uqps	%ymm8, %ymm1, %ymm1
	vmovaps	%ymm5, 1024(%rsp)       # 32-byte Spill
	vandps	%ymm10, %ymm5, %ymm4
	vorps	%ymm11, %ymm4, %ymm4
	vblendvps	%ymm1, %ymm7, %ymm4, %ymm3
	vmulps	544(%rsp), %ymm2, %ymm5 # 32-byte Folded Reload
	vmovaps	%ymm15, 1056(%rsp)      # 32-byte Spill
	vmulps	%ymm3, %ymm15, %ymm11
	vmulps	576(%rsp), %ymm0, %ymm1 # 32-byte Folded Reload
	vmovdqa	%ymm13, 224(%rsp)       # 32-byte Spill
	vmovdqa	%ymm13, 32(%rsp)
	movl	$0, 1088(%rsp)
	vmovaps	%ymm6, 1344(%rsp)
	movl	$1, %r15d
	movl	$255, %r10d
	movl	$0, %r14d
	vmovaps	%ymm9, %ymm8
	vpcmpeqd	%ymm4, %ymm4, %ymm4
	vmovdqa	%ymm4, 416(%rsp)        # 32-byte Spill
	vpcmpeqd	%ymm4, %ymm4, %ymm4
	vmovdqa	%ymm4, 480(%rsp)        # 32-byte Spill
.LBB11_3:                               # %while_head.rv.i.outer
                                        #   Parent Loop BB11_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB11_4 Depth 3
                                        #         Child Loop BB11_7 Depth 4
                                        #         Child Loop BB11_11 Depth 4
                                        #       Child Loop BB11_27 Depth 3
                                        #         Child Loop BB11_28 Depth 4
	vmovaps	%ymm8, %ymm4
	jmp	.LBB11_4
.LBB11_6:                               # %if_else12.rv.i.preheader
                                        #   in Loop: Header=BB11_4 Depth=3
	movslq	%r14d, %rdi
	leaq	1088(%rsp,%rdi,4), %rcx
	shlq	$5, %rdi
	leaq	1344(%rsp,%rdi), %rdi
.LBB11_7:                               # %if_else12.rv.i
                                        #   Parent Loop BB11_2 Depth=1
                                        #     Parent Loop BB11_3 Depth=2
                                        #       Parent Loop BB11_4 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	(%rcx), %r15d
	testl	%r15d, %r15d
	je	.LBB11_37
# BB#8:                                 # %if_else13.rv.i
                                        #   in Loop: Header=BB11_7 Depth=4
	vmovaps	(%rdi), %ymm4
	vcmpltps	%ymm8, %ymm4, %ymm10
	vmovmskps	%ymm10, %ebx
	addq	$-32, %rdi
	addl	$-1, %r14d
	addq	$-4, %rcx
	testl	%ebx, %ebx
	jne	.LBB11_9
	jmp	.LBB11_7
	.p2align	4, 0x90
.LBB11_4:                               # %while_head.rv.i
                                        #   Parent Loop BB11_2 Depth=1
                                        #     Parent Loop BB11_3 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB11_7 Depth 4
                                        #         Child Loop BB11_11 Depth 4
	testl	%r15d, %r15d
	je	.LBB11_37
# BB#5:                                 # %while_body.rv.i
                                        #   in Loop: Header=BB11_4 Depth=3
	vmovaps	32(%rsp), %ymm8
	vcmpltps	%ymm8, %ymm4, %ymm10
	vmovmskps	%ymm10, %ecx
	testl	%ecx, %ecx
	je	.LBB11_6
.LBB11_9:                               # %while_head16.rv.i.preheader
                                        #   in Loop: Header=BB11_4 Depth=3
	testl	%r15d, %r15d
	jle	.LBB11_10
	.p2align	4, 0x90
.LBB11_11:                              # %while_body20.rv.i
                                        #   Parent Loop BB11_2 Depth=1
                                        #     Parent Loop BB11_3 Depth=2
                                        #       Parent Loop BB11_4 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movslq	%r14d, %rbx
	movl	1088(%rsp,%rbx,4), %r12d
	movq	%rbx, %rcx
	shlq	$5, %rcx
	vmovaps	1344(%rsp,%rcx), %ymm4
	addl	$-1, %ebx
	movslq	%r15d, %rdi
	addq	$-1, %rdi
	shlq	$7, %rdi
	movslq	96(%r9,%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB11_25
# BB#12:                                # %if_else23.rv.i
                                        #   in Loop: Header=BB11_11 Depth=4
	vbroadcastss	(%r9,%rdi), %ymm8
	vfmsub213ps	%ymm1, %ymm0, %ymm8
	vbroadcastss	32(%r9,%rdi), %ymm10
	vfmsub213ps	%ymm5, %ymm2, %ymm10
	vbroadcastss	64(%r9,%rdi), %ymm12
	vfmsub213ps	%ymm11, %ymm3, %ymm12
	vbroadcastss	16(%r9,%rdi), %ymm13
	vfmsub213ps	%ymm1, %ymm0, %ymm13
	vbroadcastss	48(%r9,%rdi), %ymm14
	vfmsub213ps	%ymm5, %ymm2, %ymm14
	vbroadcastss	80(%r9,%rdi), %ymm15
	vpminsd	%ymm13, %ymm8, %ymm7
	vpmaxsd	%ymm8, %ymm13, %ymm8
	vfmsub213ps	%ymm11, %ymm3, %ymm15
	vpminsd	%ymm14, %ymm10, %ymm13
	vpmaxsd	%ymm10, %ymm14, %ymm10
	vpminsd	%ymm15, %ymm12, %ymm14
	vpmaxsd	%ymm12, %ymm15, %ymm12
	vpmaxsd	%ymm7, %ymm13, %ymm7
	vpminsd	%ymm10, %ymm8, %ymm10
	vpmaxsd	%ymm14, %ymm9, %ymm8
	vpminsd	32(%rsp), %ymm12, %ymm12
	vpmaxsd	%ymm7, %ymm8, %ymm8
	vpminsd	%ymm12, %ymm10, %ymm7
	vpcmpgtd	%ymm7, %ymm8, %ymm10
	vmovmskps	%ymm10, %eax
	xorl	%r15d, %r15d
	cmpl	$255, %eax
	je	.LBB11_14
# BB#13:                                # %if_then26.rv.i
                                        #   in Loop: Header=BB11_11 Depth=4
	vxorps	.LCPI11_8, %ymm10, %ymm4
	movq	%rcx, %rax
	shlq	$7, %rax
	movl	%ecx, %ebx
	notl	%ebx
	movslq	%ebx, %rbx
	imulq	$208, %rbx, %rbx
	vblendvps	%ymm4, %ymm8, %ymm6, %ymm4
	addq	%r11, %rbx
	testl	%ecx, %ecx
	leaq	-128(%r9,%rax), %rax
	cmovsq	%rbx, %rax
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	movl	$1, %r15d
	movl	%r14d, %ebx
	movl	%ecx, %r12d
.LBB11_14:                              # %next28.rv.i
                                        #   in Loop: Header=BB11_11 Depth=4
	movslq	100(%r9,%rdi), %rdx
	testq	%rdx, %rdx
	je	.LBB11_23
# BB#15:                                # %if_else31.rv.i
                                        #   in Loop: Header=BB11_11 Depth=4
	vbroadcastss	4(%r9,%rdi), %ymm7
	vfmsub213ps	%ymm1, %ymm0, %ymm7
	vbroadcastss	36(%r9,%rdi), %ymm8
	vfmsub213ps	%ymm5, %ymm2, %ymm8
	vbroadcastss	68(%r9,%rdi), %ymm10
	vfmsub213ps	%ymm11, %ymm3, %ymm10
	vbroadcastss	20(%r9,%rdi), %ymm12
	vfmsub213ps	%ymm1, %ymm0, %ymm12
	vbroadcastss	52(%r9,%rdi), %ymm13
	vfmsub213ps	%ymm5, %ymm2, %ymm13
	vbroadcastss	84(%r9,%rdi), %ymm14
	vpminsd	%ymm12, %ymm7, %ymm15
	vpmaxsd	%ymm7, %ymm12, %ymm7
	vfmsub213ps	%ymm11, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm8, %ymm12
	vpmaxsd	%ymm8, %ymm13, %ymm8
	vpminsd	%ymm14, %ymm10, %ymm13
	vpmaxsd	%ymm10, %ymm14, %ymm10
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm8, %ymm7, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm8
	vpminsd	32(%rsp), %ymm10, %ymm10
	vpmaxsd	%ymm12, %ymm8, %ymm8
	vpminsd	%ymm10, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm8, %ymm10
	vmovmskps	%ymm10, %eax
	cmpl	$255, %eax
	je	.LBB11_17
# BB#16:                                # %if_then35.rv.i
                                        #   in Loop: Header=BB11_11 Depth=4
	vxorps	.LCPI11_8, %ymm10, %ymm7
	movl	%edx, %eax
	notl	%eax
	movq	%rdx, %rcx
	shlq	$7, %rcx
	addl	$1, %r15d
	cltq
	imulq	$208, %rax, %rax
	addq	%r11, %rax
	testl	%edx, %edx
	leaq	-128(%r9,%rcx), %rcx
	cmovsq	%rax, %rcx
	movslq	%ebx, %rax
	movl	%r12d, 1092(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm4, 1344(%rsp,%rax)
	vblendvps	%ymm7, %ymm8, %ymm6, %ymm4
	addl	$1, %ebx
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	movl	%edx, %r12d
.LBB11_17:                              # %next38.rv.i
                                        #   in Loop: Header=BB11_11 Depth=4
	movslq	104(%r9,%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB11_23
# BB#18:                                # %if_else41.rv.i
                                        #   in Loop: Header=BB11_11 Depth=4
	vbroadcastss	8(%r9,%rdi), %ymm7
	vfmsub213ps	%ymm1, %ymm0, %ymm7
	vbroadcastss	40(%r9,%rdi), %ymm8
	vfmsub213ps	%ymm5, %ymm2, %ymm8
	vbroadcastss	72(%r9,%rdi), %ymm10
	vfmsub213ps	%ymm11, %ymm3, %ymm10
	vbroadcastss	24(%r9,%rdi), %ymm12
	vfmsub213ps	%ymm1, %ymm0, %ymm12
	vbroadcastss	56(%r9,%rdi), %ymm13
	vfmsub213ps	%ymm5, %ymm2, %ymm13
	vbroadcastss	88(%r9,%rdi), %ymm14
	vpminsd	%ymm12, %ymm7, %ymm15
	vpmaxsd	%ymm7, %ymm12, %ymm7
	vfmsub213ps	%ymm11, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm8, %ymm12
	vpmaxsd	%ymm8, %ymm13, %ymm8
	vpminsd	%ymm14, %ymm10, %ymm13
	vpmaxsd	%ymm10, %ymm14, %ymm10
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm8, %ymm7, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm8
	vpminsd	32(%rsp), %ymm10, %ymm10
	vpmaxsd	%ymm12, %ymm8, %ymm8
	vpminsd	%ymm10, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm8, %ymm10
	vmovmskps	%ymm10, %eax
	cmpl	$255, %eax
	je	.LBB11_20
# BB#19:                                # %if_then45.rv.i
                                        #   in Loop: Header=BB11_11 Depth=4
	vxorps	.LCPI11_8, %ymm10, %ymm7
	movl	%ecx, %eax
	notl	%eax
	movq	%rcx, %rdx
	shlq	$7, %rdx
	addl	$1, %r15d
	cltq
	imulq	$208, %rax, %rax
	addq	%r11, %rax
	testl	%ecx, %ecx
	leaq	-128(%r9,%rdx), %rdx
	cmovsq	%rax, %rdx
	movslq	%ebx, %rax
	movl	%r12d, 1092(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm4, 1344(%rsp,%rax)
	vblendvps	%ymm7, %ymm8, %ymm6, %ymm4
	addl	$1, %ebx
	prefetcht0	(%rdx)
	prefetcht0	64(%rdx)
	movl	%ecx, %r12d
.LBB11_20:                              # %next48.rv.i
                                        #   in Loop: Header=BB11_11 Depth=4
	movslq	108(%r9,%rdi), %rcx
	testq	%rcx, %rcx
	je	.LBB11_23
# BB#21:                                # %if_else51.rv.i
                                        #   in Loop: Header=BB11_11 Depth=4
	vbroadcastss	12(%r9,%rdi), %ymm7
	vfmsub213ps	%ymm1, %ymm0, %ymm7
	vbroadcastss	44(%r9,%rdi), %ymm8
	vfmsub213ps	%ymm5, %ymm2, %ymm8
	vbroadcastss	76(%r9,%rdi), %ymm10
	vfmsub213ps	%ymm11, %ymm3, %ymm10
	vbroadcastss	28(%r9,%rdi), %ymm12
	vfmsub213ps	%ymm1, %ymm0, %ymm12
	vbroadcastss	60(%r9,%rdi), %ymm13
	vfmsub213ps	%ymm5, %ymm2, %ymm13
	vbroadcastss	92(%r9,%rdi), %ymm14
	vpminsd	%ymm12, %ymm7, %ymm15
	vpmaxsd	%ymm7, %ymm12, %ymm7
	vfmsub213ps	%ymm11, %ymm3, %ymm14
	vpminsd	%ymm13, %ymm8, %ymm12
	vpmaxsd	%ymm8, %ymm13, %ymm8
	vpminsd	%ymm14, %ymm10, %ymm13
	vpmaxsd	%ymm10, %ymm14, %ymm10
	vpmaxsd	%ymm15, %ymm12, %ymm12
	vpminsd	%ymm8, %ymm7, %ymm7
	vpmaxsd	%ymm13, %ymm9, %ymm8
	vpminsd	32(%rsp), %ymm10, %ymm10
	vpmaxsd	%ymm12, %ymm8, %ymm8
	vpminsd	%ymm10, %ymm7, %ymm7
	vpcmpgtd	%ymm7, %ymm8, %ymm10
	vmovmskps	%ymm10, %eax
	cmpl	$255, %eax
	jne	.LBB11_22
.LBB11_23:                              # %unlikely_cont_cascading_cascading.rv.i
                                        #   in Loop: Header=BB11_11 Depth=4
	testl	%r15d, %r15d
	jne	.LBB11_24
	jmp	.LBB11_25
	.p2align	4, 0x90
.LBB11_22:                              # %unlikely_cont_cascading_cascading.rv.i.thread1
                                        #   in Loop: Header=BB11_11 Depth=4
	vxorps	.LCPI11_8, %ymm10, %ymm7
	movq	%rcx, %rax
	shlq	$7, %rax
	movl	%ecx, %edx
	notl	%edx
	movslq	%edx, %rdx
	imulq	$208, %rdx, %rdx
	addq	%r11, %rdx
	testl	%ecx, %ecx
	leaq	-128(%r9,%rax), %rax
	cmovsq	%rdx, %rax
	movslq	%ebx, %rdx
	movl	%r12d, 1092(%rsp,%rdx,4)
	addq	$1, %rdx
	shlq	$5, %rdx
	vmovaps	%ymm4, 1344(%rsp,%rdx)
	vblendvps	%ymm7, %ymm8, %ymm6, %ymm4
	addl	$1, %ebx
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	movl	%ecx, %r12d
.LBB11_24:                              # %while_head16.rv.i.backedge
                                        #   in Loop: Header=BB11_11 Depth=4
	movl	%r12d, %r15d
	movl	%ebx, %r14d
	testl	%r12d, %r12d
	jg	.LBB11_11
.LBB11_25:                              # %break69.rv.i
                                        #   in Loop: Header=BB11_4 Depth=3
	movl	%ebx, %r14d
	movl	%r12d, %r15d
	testl	%r12d, %r12d
	jns	.LBB11_4
	jmp	.LBB11_26
	.p2align	4, 0x90
.LBB11_10:                              #   in Loop: Header=BB11_3 Depth=2
	movl	%r15d, %r12d
	movl	%r14d, %ebx
.LBB11_26:                              # %if_then73.rv.i
                                        #   in Loop: Header=BB11_3 Depth=2
	notl	%r12d
	movslq	%ebx, %r14
	movl	1088(%rsp,%r14,4), %r15d
	movq	%r14, %rax
	shlq	$5, %rax
	vmovaps	1344(%rsp,%rax), %ymm8
	addl	$-1, %r14d
	movslq	%r12d, %r12
	imulq	$208, %r12, %r13
	addq	88(%rsp), %r13          # 8-byte Folded Reload
	vmovaps	%ymm8, 96(%rsp)         # 32-byte Spill
.LBB11_27:                              # %while_head74.rv.i
                                        #   Parent Loop BB11_2 Depth=1
                                        #     Parent Loop BB11_3 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB11_28 Depth 4
	movq	%r13, %rbx
	xorl	%edi, %edi
	jmp	.LBB11_28
.LBB11_30:                              # %if_else_crit.rv.i
                                        #   in Loop: Header=BB11_28 Depth=4
	vmovaps	%ymm15, 672(%rsp)       # 32-byte Spill
	vmovaps	%ymm12, 640(%rsp)       # 32-byte Spill
	vmovaps	%ymm14, 128(%rsp)       # 32-byte Spill
	vmovaps	992(%rsp), %ymm14       # 32-byte Reload
	vpand	%ymm7, %ymm8, %ymm8
	vbroadcastss	-112(%rbx), %ymm12
	vbroadcastss	-144(%rbx), %ymm15
	vbroadcastss	-128(%rbx), %ymm7
	vmulps	960(%rsp), %ymm7, %ymm7 # 32-byte Folded Reload
	vfmadd231ps	256(%rsp), %ymm15, %ymm7 # 32-byte Folded Reload
	vfmadd231ps	%ymm12, %ymm10, %ymm7
	vmovaps	608(%rsp), %ymm13       # 32-byte Reload
	vxorps	%ymm7, %ymm13, %ymm12
	vxorps	%ymm7, %ymm7, %ymm7
	vcmpleps	%ymm12, %ymm7, %ymm10
	vptest	%ymm10, %ymm8
	je	.LBB11_34
# BB#31:                                # %if_else_crit88.rv.i
                                        #   in Loop: Header=BB11_28 Depth=4
	vbroadcastsd	.LCPI11_4(%rip), %ymm7
	vandps	672(%rsp), %ymm7, %ymm15 # 32-byte Folded Reload
	vpand	%ymm8, %ymm10, %ymm10
	vaddps	128(%rsp), %ymm12, %ymm7 # 32-byte Folded Reload
	vmovaps	%ymm12, %ymm8
	vcmpleps	%ymm15, %ymm7, %ymm12
	vptest	%ymm12, %ymm10
	je	.LBB11_34
# BB#32:                                # %if_else_crit93.rv.i
                                        #   in Loop: Header=BB11_28 Depth=4
	vmovaps	%ymm8, 320(%rsp)        # 32-byte Spill
	vpand	%ymm10, %ymm12, %ymm10
	vmulps	288(%rsp), %ymm14, %ymm7 # 32-byte Folded Reload
	vmulps	832(%rsp), %ymm15, %ymm12 # 32-byte Folded Reload
	vmovaps	640(%rsp), %ymm8        # 32-byte Reload
	vfmadd132ps	896(%rsp), %ymm7, %ymm8 # 32-byte Folded Reload
	vmovaps	800(%rsp), %ymm14       # 32-byte Reload
	vfmadd132ps	864(%rsp), %ymm8, %ymm14 # 32-byte Folded Reload
	vcmpneq_usps	.LCPI11_7, %ymm15, %ymm7
	vmovaps	%ymm13, %ymm8
	vmulps	%ymm15, %ymm9, %ymm13
	vxorps	%ymm14, %ymm8, %ymm8
	vcmpleps	%ymm12, %ymm8, %ymm12
	vcmpleps	%ymm8, %ymm13, %ymm13
	vandps	%ymm7, %ymm12, %ymm7
	vandps	%ymm13, %ymm7, %ymm12
	vptest	%ymm12, %ymm10
	je	.LBB11_34
# BB#33:                                # %if_else_crit98.rv.i
                                        #   in Loop: Header=BB11_28 Depth=4
	vpand	%ymm10, %ymm12, %ymm7
	vpcmpeqd	.LCPI11_7, %ymm7, %ymm10
	vpxor	.LCPI11_8, %ymm10, %ymm10
	vbroadcastss	.LCPI11_5(%rip), %ymm12
	vmaskmovps	%ymm12, %ymm10, 32(%rsp)
	vrcpps	%ymm15, %ymm10
	vmovaps	448(%rsp), %ymm12       # 32-byte Reload
	vfnmadd213ps	%ymm12, %ymm10, %ymm15
	vfmadd132ps	%ymm10, %ymm10, %ymm15
	vblendvps	%ymm7, %ymm15, %ymm12, %ymm10
	vmulps	128(%rsp), %ymm10, %ymm12 # 32-byte Folded Reload
	vmulps	%ymm10, %ymm8, %ymm8
	vbroadcastss	.LCPI11_6(%rip), %ymm13
	vandps	928(%rsp), %ymm13, %ymm13 # 32-byte Folded Reload
	vmulps	320(%rsp), %ymm10, %ymm10 # 32-byte Folded Reload
	vmovaps	224(%rsp), %ymm14       # 32-byte Reload
	vblendvps	%ymm7, %ymm8, %ymm14, %ymm14
	vmovaps	%ymm14, 224(%rsp)       # 32-byte Spill
	vmovaps	192(%rsp), %ymm8        # 32-byte Reload
	vblendvps	%ymm7, %ymm12, %ymm8, %ymm8
	vmovaps	%ymm8, 192(%rsp)        # 32-byte Spill
	vmovaps	160(%rsp), %ymm8        # 32-byte Reload
	vblendvps	%ymm7, %ymm10, %ymm8, %ymm8
	vmovaps	%ymm8, 160(%rsp)        # 32-byte Spill
	vmovaps	416(%rsp), %ymm8        # 32-byte Reload
	vblendvps	%ymm7, %ymm13, %ymm8, %ymm8
	vmovmskps	%ymm7, %r8d
	vmovaps	%ymm8, 416(%rsp)        # 32-byte Spill
	vmovaps	%ymm8, 480(%rsp)        # 32-byte Spill
	jmp	.LBB11_34
	.p2align	4, 0x90
.LBB11_28:                              # %if_then80.rv.i
                                        #   Parent Loop BB11_2 Depth=1
                                        #     Parent Loop BB11_3 Depth=2
                                        #       Parent Loop BB11_27 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	(%rbx), %eax
	vmovd	%eax, %xmm7
	vpbroadcastd	%xmm7, %ymm7
	cmpl	$-1, %eax
	je	.LBB11_3
# BB#29:                                # %if_else81.rv.i
                                        #   in Loop: Header=BB11_28 Depth=4
	vmovdqa	%ymm7, 928(%rsp)        # 32-byte Spill
	vmovaps	32(%rsp), %ymm10
	vbroadcastss	-48(%rbx), %ymm7
	vbroadcastss	-32(%rbx), %ymm8
	vmovaps	352(%rsp), %ymm12       # 32-byte Reload
	vmovaps	%ymm8, 992(%rsp)        # 32-byte Spill
	vmulps	%ymm8, %ymm12, %ymm15
	vmovaps	%ymm7, 896(%rsp)        # 32-byte Spill
	vfmadd231ps	384(%rsp), %ymm7, %ymm15 # 32-byte Folded Reload
	vbroadcastss	-16(%rbx), %ymm7
	vmovaps	1024(%rsp), %ymm14      # 32-byte Reload
	vmovaps	%ymm7, 864(%rsp)        # 32-byte Spill
	vfmadd231ps	%ymm7, %ymm14, %ymm15
	vbroadcastss	-64(%rbx), %ymm7
	vmovaps	%ymm7, 128(%rsp)        # 32-byte Spill
	vbroadcastss	-80(%rbx), %ymm7
	vmovaps	%ymm7, 256(%rsp)        # 32-byte Spill
	vbroadcastss	-96(%rbx), %ymm7
	vmovaps	%ymm7, 288(%rsp)        # 32-byte Spill
	vbroadcastss	-192(%rbx), %ymm13
	vbroadcastss	-176(%rbx), %ymm8
	vbroadcastss	-160(%rbx), %ymm12
	vmovaps	%ymm10, 832(%rsp)       # 32-byte Spill
	vcmpltps	%ymm10, %ymm4, %ymm7
	vmovaps	%ymm7, 320(%rsp)        # 32-byte Spill
	vandps	512(%rsp), %ymm15, %ymm7 # 32-byte Folded Reload
	vmovaps	%ymm7, 608(%rsp)        # 32-byte Spill
	vsubps	1056(%rsp), %ymm12, %ymm10 # 32-byte Folded Reload
	vsubps	544(%rsp), %ymm8, %ymm8 # 32-byte Folded Reload
	vsubps	576(%rsp), %ymm13, %ymm12 # 32-byte Folded Reload
	vmulps	384(%rsp), %ymm10, %ymm13 # 32-byte Folded Reload
	vmulps	%ymm8, %ymm14, %ymm7
	vmovaps	%ymm10, 800(%rsp)       # 32-byte Spill
	vfmsub231ps	352(%rsp), %ymm10, %ymm7 # 32-byte Folded Reload
	vfmsub231ps	%ymm12, %ymm14, %ymm13
	vmovaps	%ymm13, 960(%rsp)       # 32-byte Spill
	vmulps	256(%rsp), %ymm13, %ymm10 # 32-byte Folded Reload
	vmovaps	%ymm7, 256(%rsp)        # 32-byte Spill
	vmovaps	288(%rsp), %ymm13       # 32-byte Reload
	vfmadd213ps	%ymm10, %ymm7, %ymm13
	vmulps	352(%rsp), %ymm12, %ymm10 # 32-byte Folded Reload
	vmovaps	%ymm8, 288(%rsp)        # 32-byte Spill
	vfmsub231ps	384(%rsp), %ymm8, %ymm10 # 32-byte Folded Reload
	vmovaps	128(%rsp), %ymm7        # 32-byte Reload
	vfmadd213ps	%ymm13, %ymm10, %ymm7
	vxorps	608(%rsp), %ymm7, %ymm14 # 32-byte Folded Reload
	vxorps	%ymm7, %ymm7, %ymm7
	vcmpleps	%ymm14, %ymm7, %ymm8
	vmovdqa	320(%rsp), %ymm7        # 32-byte Reload
	xorl	%r8d, %r8d
	vptest	%ymm8, %ymm7
	jne	.LBB11_30
.LBB11_34:                              # %rv_ballot_cont_cascading_cascading.rv.i
                                        #   in Loop: Header=BB11_28 Depth=4
	vmovaps	96(%rsp), %ymm8         # 32-byte Reload
	andnl	%r10d, %r8d, %r10d
	je	.LBB11_37
# BB#35:                                # %range_step.rv.i
                                        #   in Loop: Header=BB11_28 Depth=4
	addq	$1, %rdi
	addq	$4, %rbx
	cmpq	$4, %rdi
	jl	.LBB11_28
# BB#36:                                # %if_else77.rv.i
                                        #   in Loop: Header=BB11_27 Depth=3
	imulq	$208, %r12, %rax
	addq	$1, %r12
	addq	$208, %r13
	cmpl	$0, 204(%r11,%rax)
	jns	.LBB11_27
	jmp	.LBB11_3
	.p2align	4, 0x90
.LBB11_37:                              # %exit
                                        #   in Loop: Header=BB11_2 Depth=1
	movq	%rsi, %rax
	shlq	$7, %rax
	movq	80(%rsp), %rcx          # 8-byte Reload
	vmovaps	480(%rsp), %ymm0        # 32-byte Reload
	vmovups	%ymm0, (%rcx,%rax)
	vmovaps	224(%rsp), %ymm0        # 32-byte Reload
	vmovups	%ymm0, 32(%rcx,%rax)
	vmovaps	192(%rsp), %ymm0        # 32-byte Reload
	vmovups	%ymm0, 64(%rcx,%rax)
	vmovaps	160(%rsp), %ymm0        # 32-byte Reload
	vmovups	%ymm0, 96(%rcx,%rax)
	addq	$1, %rsi
	cmpq	24(%rsp), %rsi          # 8-byte Folded Reload
	jl	.LBB11_2
.LBB11_38:                              # %if_else
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.Lfunc_end11:
	.size	cpu_occluded_bvh4_packet8_avx2, .Lfunc_end11-cpu_occluded_bvh4_packet8_avx2

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI12_0:
	.long	1065353216              # float 1
.LCPI12_1:
	.long	2147483648              # float -0
.LCPI12_2:
	.long	841731191               # float 9.99999993E-9
.LCPI12_3:
	.long	1                       # 0x1
.LCPI12_4:
	.long	2                       # float 2.80259693E-45
.LCPI12_5:
	.long	4                       # float 5.60519386E-45
.LCPI12_6:
	.long	32                      # 0x20
.LCPI12_7:
	.long	128                     # 0x80
.LCPI12_8:
	.long	64                      # 0x40
.LCPI12_9:
	.long	2139095039              # float 3.40282347E+38
.LCPI12_11:
	.long	2147483647              # 0x7fffffff
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI12_10:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI12_12:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
.LCPI12_14:
	.zero	16
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5
.LCPI12_13:
	.zero	32,255
	.text
	.globl	cpu_intersect_bvh8_tri4_hybrid8_avx2
	.p2align	4, 0x90
	.type	cpu_intersect_bvh8_tri4_hybrid8_avx2,@function
cpu_intersect_bvh8_tri4_hybrid8_avx2:   # @cpu_intersect_bvh8_tri4_hybrid8_avx2
# BB#0:                                 # %cpu_intersect_bvh8_tri4_hybrid8_avx2_start
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$5024, %rsp             # imm = 0x13A0
                                        # kill: %ECX<def> %ECX<kill> %RCX<def>
	movq	%rdx, 928(%rsp)         # 8-byte Spill
	movq	%rsi, 920(%rsp)         # 8-byte Spill
	movq	%rcx, 232(%rsp)         # 8-byte Spill
	cmpl	$8, %ecx
	jl	.LBB12_10
# BB#1:                                 # %head.preheader.lr.ph
	movq	(%rdi), %r9
	movq	8(%rdi), %rcx
	movq	232(%rsp), %rax         # 8-byte Reload
	shrl	$3, %eax
	movq	%rax, 232(%rsp)         # 8-byte Spill
	movq	%rcx, 32(%rsp)          # 8-byte Spill
	leaq	192(%rcx), %rax
	movq	%rax, 336(%rsp)         # 8-byte Spill
	xorl	%r10d, %r10d
	vbroadcastss	.LCPI12_0(%rip), %ymm0
	vmovaps	%ymm0, 1376(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI12_1(%rip), %ymm0
	vmovaps	%ymm0, 2208(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI12_2(%rip), %ymm0
	vmovaps	%ymm0, 2176(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI12_1(%rip), %ymm0
	vmovaps	%ymm0, 1408(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI12_2(%rip), %ymm0
	vmovaps	%ymm0, 2144(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI12_3(%rip), %ymm0
	vmovaps	%ymm0, 2112(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI12_4(%rip), %ymm0
	vmovaps	%ymm0, 2080(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI12_5(%rip), %ymm0
	vmovaps	%ymm0, 2048(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI12_6(%rip), %ymm0
	vmovaps	%ymm0, 2016(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI12_7(%rip), %ymm0
	vmovaps	%ymm0, 1984(%rsp)       # 32-byte Spill
	vbroadcastss	.LCPI12_8(%rip), %ymm0
	vmovaps	%ymm0, 1952(%rsp)       # 32-byte Spill
	vpcmpeqd	%ymm12, %ymm12, %ymm12
	vbroadcastss	.LCPI12_9(%rip), %ymm13
                                        # implicit-def: %EAX
	movl	%eax, 84(%rsp)          # 4-byte Spill
                                        # implicit-def: %EAX
	movl	%eax, 88(%rsp)          # 4-byte Spill
	movq	%r9, 344(%rsp)          # 8-byte Spill
	vmovaps	%ymm13, 1024(%rsp)      # 32-byte Spill
	.p2align	4, 0x90
.LBB12_2:                               # %body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB12_4 Depth 2
                                        #       Child Loop BB12_5 Depth 3
                                        #         Child Loop BB12_72 Depth 4
                                        #           Child Loop BB12_73 Depth 5
                                        #             Child Loop BB12_74 Depth 6
                                        #               Child Loop BB12_75 Depth 7
                                        #                 Child Loop BB12_79 Depth 8
                                        #             Child Loop BB12_102 Depth 6
                                        #       Child Loop BB12_14 Depth 3
                                        #       Child Loop BB12_61 Depth 3
                                        #         Child Loop BB12_62 Depth 4
	movq	%rsp, 936(%rsp)         # 8-byte Spill
	movq	%r10, %rcx
	shlq	$8, %rcx
	movq	920(%rsp), %rax         # 8-byte Reload
	vmovups	(%rax,%rcx), %ymm0
	vmovaps	%ymm0, 1504(%rsp)       # 32-byte Spill
	vmovups	32(%rax,%rcx), %ymm0
	vmovaps	%ymm0, 1472(%rsp)       # 32-byte Spill
	vmovups	64(%rax,%rcx), %ymm0
	vmovaps	%ymm0, 1440(%rsp)       # 32-byte Spill
	vmovups	96(%rax,%rcx), %ymm15
	vrcpps	%ymm15, %ymm0
	vmovaps	%ymm0, %ymm2
	vmovaps	1376(%rsp), %ymm6       # 32-byte Reload
	vfnmadd213ps	%ymm6, %ymm15, %ymm2
	vfmadd132ps	%ymm0, %ymm0, %ymm2
	vxorps	%ymm7, %ymm7, %ymm7
	vcmpltps	%ymm15, %ymm7, %ymm1
	vmovaps	2208(%rsp), %ymm14      # 32-byte Reload
	vxorps	%ymm14, %ymm15, %ymm0
	vmovups	128(%rax,%rcx), %ymm11
	vrcpps	%ymm11, %ymm3
	vmovaps	%ymm3, %ymm4
	vfnmadd213ps	%ymm6, %ymm11, %ymm4
	vfmadd132ps	%ymm3, %ymm3, %ymm4
	vblendvps	%ymm1, %ymm15, %ymm0, %ymm0
	vmovups	160(%rax,%rcx), %ymm8
	vrcpps	%ymm8, %ymm3
	vmovaps	%ymm3, %ymm5
	vfnmadd213ps	%ymm6, %ymm8, %ymm5
	vfmadd132ps	%ymm3, %ymm3, %ymm5
	vmovups	192(%rax,%rcx), %ymm3
	vmovaps	%ymm3, 960(%rsp)        # 32-byte Spill
	vmovaps	2176(%rsp), %ymm6       # 32-byte Reload
	vcmpnlt_uqps	%ymm6, %ymm0, %ymm0
	vmovaps	1408(%rsp), %ymm9       # 32-byte Reload
	vandps	%ymm9, %ymm15, %ymm3
	vmovaps	2144(%rsp), %ymm10      # 32-byte Reload
	vorps	%ymm10, %ymm3, %ymm3
	vblendvps	%ymm0, %ymm2, %ymm3, %ymm0
	vmovaps	%ymm0, 1088(%rsp)       # 32-byte Spill
	vxorps	%ymm14, %ymm11, %ymm0
	vcmpltps	%ymm11, %ymm7, %ymm3
	vblendvps	%ymm3, %ymm11, %ymm0, %ymm0
	vcmpnlt_uqps	%ymm6, %ymm0, %ymm0
	vandps	%ymm9, %ymm11, %ymm2
	vorps	%ymm10, %ymm2, %ymm2
	vblendvps	%ymm0, %ymm4, %ymm2, %ymm0
	vmovaps	%ymm0, 1056(%rsp)       # 32-byte Spill
	vcmpltps	%ymm8, %ymm7, %ymm4
	vxorps	%ymm14, %ymm8, %ymm0
	vblendvps	%ymm4, %ymm8, %ymm0, %ymm0
	vcmpnlt_uqps	%ymm6, %ymm0, %ymm0
	vandps	%ymm9, %ymm8, %ymm2
	vorps	%ymm10, %ymm2, %ymm2
	vblendvps	%ymm0, %ymm5, %ymm2, %ymm9
	vmovups	224(%rax,%rcx), %ymm0
	vmovaps	%ymm0, 192(%rsp)        # 32-byte Spill
	vpcmpeqd	%ymm7, %ymm1, %ymm1
	vmovdqa	2112(%rsp), %ymm2       # 32-byte Reload
	vpandn	%ymm2, %ymm1, %ymm5
	vblendvps	%ymm3, 2080(%rsp), %ymm7, %ymm3 # 32-byte Folded Reload
	vblendvps	%ymm4, 2048(%rsp), %ymm7, %ymm4 # 32-byte Folded Reload
	vorps	%ymm5, %ymm3, %ymm3
	vorps	%ymm4, %ymm3, %ymm3
	vpsrld	$2, %ymm3, %ymm4
	vpsrld	$1, %ymm3, %ymm3
	vmovdqa	2016(%rsp), %ymm7       # 32-byte Reload
	vpandn	%ymm7, %ymm1, %ymm5
	vpand	%ymm2, %ymm4, %ymm1
	vpand	%ymm2, %ymm3, %ymm3
	vpxor	%ymm7, %ymm5, %ymm4
	vpslld	$5, %ymm1, %ymm1
	vpslld	$5, %ymm3, %ymm3
	vpor	1984(%rsp), %ymm1, %ymm6 # 32-byte Folded Reload
	vpor	1952(%rsp), %ymm3, %ymm3 # 32-byte Folded Reload
	vmovdqa	%ymm4, 2464(%rsp)
	vpxor	%ymm7, %ymm3, %ymm1
	vmovdqa	%ymm1, 2912(%rsp)
	vpxor	%ymm7, %ymm6, %ymm1
	vmovdqa	%ymm1, 2432(%rsp)
	vmovaps	1472(%rsp), %ymm7       # 32-byte Reload
	vmovaps	1056(%rsp), %ymm0       # 32-byte Reload
	vmulps	%ymm0, %ymm7, %ymm1
	vmovdqa	%ymm5, 2368(%rsp)
	vmovaps	1504(%rsp), %ymm4       # 32-byte Reload
	vmovaps	1088(%rsp), %ymm10      # 32-byte Reload
	vmulps	%ymm10, %ymm4, %ymm2
	vmovdqa	%ymm3, 2336(%rsp)
	vxorps	%ymm14, %ymm1, %ymm3
	vmovdqa	%ymm6, 2400(%rsp)
	vmovaps	%ymm2, 352(%rsp)        # 32-byte Spill
	vxorps	%ymm14, %ymm2, %ymm5
	vmovaps	%ymm14, %ymm2
	vmovaps	%ymm5, 2592(%rsp)
	vmovaps	1440(%rsp), %ymm5       # 32-byte Reload
	vmulps	%ymm9, %ymm5, %ymm14
	vmovaps	%ymm3, 2560(%rsp)
	vxorps	%ymm2, %ymm14, %ymm3
	vmovaps	%ymm3, 2528(%rsp)
	vmovaps	%ymm4, %ymm2
	vmovaps	%ymm2, 2880(%rsp)
	vmovaps	%ymm7, %ymm2
	vmovaps	%ymm2, 2848(%rsp)
	vmovaps	%ymm5, 2816(%rsp)
	vmovaps	%ymm15, 2304(%rsp)      # 32-byte Spill
	vmovaps	%ymm15, 2784(%rsp)
	vmovaps	%ymm1, %ymm15
	vmovaps	%ymm0, %ymm4
	vmovaps	%ymm10, %ymm2
	vmovaps	960(%rsp), %ymm1        # 32-byte Reload
	vmovaps	%ymm11, 2272(%rsp)      # 32-byte Spill
	vmovaps	%ymm11, 2752(%rsp)
	vmovaps	%ymm8, 2240(%rsp)       # 32-byte Spill
	vmovaps	%ymm8, 2720(%rsp)
	vmovaps	%ymm2, 2688(%rsp)
	vmovaps	%ymm4, 2656(%rsp)
	vmovaps	%ymm9, 2624(%rsp)
	vmovaps	%ymm1, 2496(%rsp)
	vmovdqa	192(%rsp), %ymm0        # 32-byte Reload
	vmovdqa	%ymm0, 256(%rsp)
	vmovdqa	%ymm0, 1184(%rsp)
	vmovdqa	%ymm12, 1152(%rsp)
	vmovdqa	%ymm12, 1600(%rsp)
	movl	$0, 1696(%rsp)
	vmovaps	%ymm13, 2944(%rsp)
	movl	$1, %r14d
	xorl	%r11d, %r11d
	vmovaps	%ymm1, %ymm8
	vmovaps	%ymm9, 1120(%rsp)       # 32-byte Spill
	vmovaps	%ymm15, 1536(%rsp)      # 32-byte Spill
	movq	%r10, 320(%rsp)         # 8-byte Spill
	testl	%r14d, %r14d
	jne	.LBB12_4
	jmp	.LBB12_9
.LBB12_68:                              #   in Loop: Header=BB12_4 Depth=2
	vpcmpeqd	%ymm12, %ymm12, %ymm12
	vmovaps	1024(%rsp), %ymm13      # 32-byte Reload
	vmovaps	960(%rsp), %ymm1        # 32-byte Reload
	vmovaps	1088(%rsp), %ymm2       # 32-byte Reload
	vmovaps	1056(%rsp), %ymm4       # 32-byte Reload
	vmovaps	1120(%rsp), %ymm9       # 32-byte Reload
	.p2align	4, 0x90
.LBB12_3:                               # %while_head.rv.i
                                        #   in Loop: Header=BB12_4 Depth=2
	testl	%r14d, %r14d
	je	.LBB12_9
.LBB12_4:                               # %while_head9.rv.i.preheader
                                        #   Parent Loop BB12_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB12_5 Depth 3
                                        #         Child Loop BB12_72 Depth 4
                                        #           Child Loop BB12_73 Depth 5
                                        #             Child Loop BB12_74 Depth 6
                                        #               Child Loop BB12_75 Depth 7
                                        #                 Child Loop BB12_79 Depth 8
                                        #             Child Loop BB12_102 Depth 6
                                        #       Child Loop BB12_14 Depth 3
                                        #       Child Loop BB12_61 Depth 3
                                        #         Child Loop BB12_62 Depth 4
	movslq	%r11d, %r11
	jmp	.LBB12_5
.LBB12_6:                               #   in Loop: Header=BB12_5 Depth=3
	movq	%r11, 328(%rsp)         # 8-byte Spill
.LBB12_7:                               # %next194.rv.i
                                        #   in Loop: Header=BB12_5 Depth=3
	movq	328(%rsp), %rcx         # 8-byte Reload
	movl	1696(%rsp,%rcx,4), %r14d
	testl	%r14d, %r14d
	je	.LBB12_8
# BB#69:                                # %if_else197.rv.i
                                        #   in Loop: Header=BB12_5 Depth=3
	leaq	-1(%rcx), %rax
	shlq	$5, %rcx
	vmovaps	2944(%rsp,%rcx), %ymm8
	movq	%rax, %r11
	movq	320(%rsp), %r10         # 8-byte Reload
	vpcmpeqd	%ymm12, %ymm12, %ymm12
	vmovaps	1024(%rsp), %ymm13      # 32-byte Reload
	vmovaps	960(%rsp), %ymm1        # 32-byte Reload
	vmovaps	1088(%rsp), %ymm2       # 32-byte Reload
	vmovaps	1056(%rsp), %ymm4       # 32-byte Reload
	vmovaps	1120(%rsp), %ymm9       # 32-byte Reload
	vmovaps	1536(%rsp), %ymm15      # 32-byte Reload
	.p2align	4, 0x90
.LBB12_5:                               # %while_head9.rv.i
                                        #   Parent Loop BB12_2 Depth=1
                                        #     Parent Loop BB12_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB12_72 Depth 4
                                        #           Child Loop BB12_73 Depth 5
                                        #             Child Loop BB12_74 Depth 6
                                        #               Child Loop BB12_75 Depth 7
                                        #                 Child Loop BB12_79 Depth 8
                                        #             Child Loop BB12_102 Depth 6
	vcmpltps	256(%rsp), %ymm8, %ymm0
	vmovmskps	%ymm0, %ecx
	testl	%ecx, %ecx
	je	.LBB12_6
# BB#11:                                # %if_then13.rv.i
                                        #   in Loop: Header=BB12_5 Depth=3
	popcntl	%ecx, %eax
	cmpl	$6, %eax
	ja	.LBB12_13
# BB#12:                                #   in Loop: Header=BB12_5 Depth=3
	movl	%r14d, 252(%rsp)        # 4-byte Spill
	movq	%r11, 328(%rsp)         # 8-byte Spill
	.p2align	4, 0x90
.LBB12_72:                              # %body.rv.i
                                        #   Parent Loop BB12_2 Depth=1
                                        #     Parent Loop BB12_4 Depth=2
                                        #       Parent Loop BB12_5 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB12_73 Depth 5
                                        #             Child Loop BB12_74 Depth 6
                                        #               Child Loop BB12_75 Depth 7
                                        #                 Child Loop BB12_79 Depth 8
                                        #             Child Loop BB12_102 Depth 6
	movq	%rcx, 952(%rsp)         # 8-byte Spill
	tzcntl	%ecx, %eax
	movl	2496(%rsp,%rax,4), %edx
	movl	256(%rsp,%rax,4), %ecx
	movl	%ecx, 44(%rsp)          # 4-byte Spill
	vbroadcastss	2688(%rsp,%rax,4), %ymm8
	vbroadcastss	2656(%rsp,%rax,4), %ymm10
	vbroadcastss	2624(%rsp,%rax,4), %ymm11
	vbroadcastss	2592(%rsp,%rax,4), %ymm15
	vbroadcastss	2560(%rsp,%rax,4), %ymm3
	vbroadcastss	2528(%rsp,%rax,4), %ymm7
	vbroadcastss	2784(%rsp,%rax,4), %xmm0
	vmovaps	%xmm0, 1008(%rsp)       # 16-byte Spill
	vbroadcastss	2752(%rsp,%rax,4), %xmm0
	vmovaps	%xmm0, 1312(%rsp)       # 16-byte Spill
	vbroadcastss	2720(%rsp,%rax,4), %xmm0
	vmovaps	%xmm0, 1296(%rsp)       # 16-byte Spill
	vbroadcastss	2880(%rsp,%rax,4), %xmm0
	vmovaps	%xmm0, 1280(%rsp)       # 16-byte Spill
	vbroadcastss	2816(%rsp,%rax,4), %xmm0
	vmovaps	%xmm0, 1264(%rsp)       # 16-byte Spill
	vbroadcastss	2848(%rsp,%rax,4), %xmm0
	vmovaps	%xmm0, 1248(%rsp)       # 16-byte Spill
	movslq	2400(%rsp,%rax,4), %rbx
	movslq	2464(%rsp,%rax,4), %rcx
	movq	%rcx, 240(%rsp)         # 8-byte Spill
	movslq	2368(%rsp,%rax,4), %r13
	movslq	2336(%rsp,%rax,4), %r10
	movslq	2432(%rsp,%rax,4), %r11
	movq	%rax, 944(%rsp)         # 8-byte Spill
	movslq	2912(%rsp,%rax,4), %r12
	movl	$0, 640(%rsp)
	movl	$2139095039, 384(%rsp)  # imm = 0x7F7FFFFF
	vmovd	%edx, %xmm5
	vpbroadcastd	%xmm5, %ymm0
	vpbroadcastd	%xmm5, %xmm1
	vmovdqa	%xmm1, 1232(%rsp)       # 16-byte Spill
	movl	$-1, 92(%rsp)           # 4-byte Folded Spill
	xorl	%r15d, %r15d
	movl	252(%rsp), %r8d         # 4-byte Reload
	movq	%rbx, 64(%rsp)          # 8-byte Spill
.LBB12_73:                              # %while_head1.rv.i.preheader.lr.ph
                                        #   Parent Loop BB12_2 Depth=1
                                        #     Parent Loop BB12_4 Depth=2
                                        #       Parent Loop BB12_5 Depth=3
                                        #         Parent Loop BB12_72 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB12_74 Depth 6
                                        #               Child Loop BB12_75 Depth 7
                                        #                 Child Loop BB12_79 Depth 8
                                        #             Child Loop BB12_102 Depth 6
	vmovd	44(%rsp), %xmm12        # 4-byte Folded Reload
	vpbroadcastd	%xmm12, %ymm13
	movl	%r8d, %edi
	movq	240(%rsp), %rax         # 8-byte Reload
	.p2align	4, 0x90
.LBB12_74:                              # %while_head1.rv.i.preheader
                                        #   Parent Loop BB12_2 Depth=1
                                        #     Parent Loop BB12_4 Depth=2
                                        #       Parent Loop BB12_5 Depth=3
                                        #         Parent Loop BB12_72 Depth=4
                                        #           Parent Loop BB12_73 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB12_75 Depth 7
                                        #                 Child Loop BB12_79 Depth 8
	testl	%edi, %edi
	jg	.LBB12_75
	jmp	.LBB12_99
.LBB12_78:                              # %if_then.rv.i.preheader
                                        #   in Loop: Header=BB12_75 Depth=7
	movslq	%r15d, %rax
	leaq	388(%rsp), %rcx
	leaq	(%rcx,%rax,4), %rcx
	movq	%rcx, 96(%rsp)          # 8-byte Spill
	leaq	644(%rsp), %rcx
	leaq	(%rcx,%rax,4), %rax
	movq	%rax, 160(%rsp)         # 8-byte Spill
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB12_79:                              # %if_then.rv.i
                                        #   Parent Loop BB12_2 Depth=1
                                        #     Parent Loop BB12_4 Depth=2
                                        #       Parent Loop BB12_5 Depth=3
                                        #         Parent Loop BB12_72 Depth=4
                                        #           Parent Loop BB12_73 Depth=5
                                        #             Parent Loop BB12_74 Depth=6
                                        #               Parent Loop BB12_75 Depth=7
                                        # =>              This Inner Loop Header: Depth=8
	tzcntl	%r14d, %eax
	movslq	192(%rdi,%rax,4), %rbx
	testq	%rbx, %rbx
	je	.LBB12_84
# BB#80:                                # %if_else24.rv.i
                                        #   in Loop: Header=BB12_79 Depth=8
	movq	%rcx, 192(%rsp)         # 8-byte Spill
	movl	%ebx, %r9d
	notl	%r9d
	movq	%rbx, %rsi
	shlq	$8, %rsi
	movslq	%r9d, %rcx
	movq	344(%rsp), %r9          # 8-byte Reload
	imulq	$208, %rcx, %rcx
	addq	32(%rsp), %rcx          # 8-byte Folded Reload
	testl	%ebx, %ebx
	leaq	-256(%r9,%rsi), %rsi
	cmovsq	%rcx, %rsi
	prefetcht0	(%rsi)
	prefetcht0	64(%rsi)
	prefetcht0	128(%rsi)
	prefetcht0	192(%rsi)
	vmovd	%eax, %xmm1
	vpermps	%ymm5, %ymm1, %ymm6
	vmovd	%edx, %xmm1
	vucomiss	%xmm1, %xmm6
	jae	.LBB12_81
# BB#82:                                # %if_then_crit.rv.i14
                                        #   in Loop: Header=BB12_79 Depth=8
	movq	192(%rsp), %rcx         # 8-byte Reload
	movq	160(%rsp), %rax         # 8-byte Reload
	movl	%r8d, (%rax,%rcx,4)
	movq	96(%rsp), %rax          # 8-byte Reload
	movl	%edx, (%rax,%rcx,4)
	vmovd	%xmm6, %edx
	movl	%ebx, %r8d
	jmp	.LBB12_83
	.p2align	4, 0x90
.LBB12_81:                              # %if_else28.rv.i
                                        #   in Loop: Header=BB12_79 Depth=8
	movq	192(%rsp), %rcx         # 8-byte Reload
	movq	160(%rsp), %rax         # 8-byte Reload
	movl	%ebx, (%rax,%rcx,4)
	movq	96(%rsp), %rax          # 8-byte Reload
	vmovss	%xmm6, (%rax,%rcx,4)
.LBB12_83:                              # %next29.rv.i15
                                        #   in Loop: Header=BB12_79 Depth=8
	leal	-1(%r14), %eax
	addq	$1, %rcx
	andl	%r14d, %eax
	movl	%eax, %r14d
	jne	.LBB12_79
.LBB12_84:                              # %if_then.rv.i.break.rv.i16_crit_edge
                                        #   in Loop: Header=BB12_75 Depth=7
	addl	%ecx, %r15d
	cmpl	$2, %ecx
	movq	240(%rsp), %rax         # 8-byte Reload
	jge	.LBB12_85
# BB#97:                                # %next59.rv.i
                                        #   in Loop: Header=BB12_75 Depth=7
	testl	%ecx, %ecx
	movq	64(%rsp), %rbx          # 8-byte Reload
	jne	.LBB12_76
	jmp	.LBB12_98
.LBB12_85:                              # %if_then33.rv.i
                                        #   in Loop: Header=BB12_75 Depth=7
	addl	$-2, %ecx
	cmpl	$5, %ecx
	movq	64(%rsp), %rbx          # 8-byte Reload
	ja	.LBB12_87
# BB#86:                                # %if_then33.rv.i
                                        #   in Loop: Header=BB12_75 Depth=7
	jmpq	*.LJTI12_0(,%rcx,8)
.LBB12_94:                              # %if_then_crit57.rv.i
                                        #   in Loop: Header=BB12_75 Depth=7
	movslq	%r15d, %rax
	leaq	636(%rsp,%rax,4), %rcx
	movq	%rcx, 160(%rsp)         # 8-byte Spill
	movl	636(%rsp,%rax,4), %edi
	leaq	380(%rsp,%rax,4), %r14
	vmovss	380(%rsp,%rax,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	leaq	640(%rsp,%rax,4), %rcx
	movq	%rcx, 192(%rsp)         # 8-byte Spill
	movl	640(%rsp,%rax,4), %ecx
	leaq	384(%rsp,%rax,4), %rsi
	movq	%rsi, 96(%rsp)          # 8-byte Spill
	vmovss	384(%rsp,%rax,4), %xmm2 # xmm2 = mem[0],zero,zero,zero
	vucomiss	%xmm2, %xmm1
	movl	%ecx, %eax
	cmovbl	%edi, %eax
	vminss	%xmm2, %xmm1, %xmm4
	cmovbl	%ecx, %edi
	vmaxss	%xmm1, %xmm2, %xmm1
	vmovd	%xmm1, %ecx
.LBB12_95:                              # %next59.rv.i.thread
                                        #   in Loop: Header=BB12_75 Depth=7
	vmovd	%xmm4, %r9d
.LBB12_96:                              # %next59.rv.i.thread
                                        #   in Loop: Header=BB12_75 Depth=7
	movq	160(%rsp), %rsi         # 8-byte Reload
	movl	%edi, (%rsi)
	movl	%ecx, (%r14)
	movq	192(%rsp), %rcx         # 8-byte Reload
	movl	%eax, (%rcx)
	movq	96(%rsp), %rax          # 8-byte Reload
	movl	%r9d, (%rax)
	movq	344(%rsp), %r9          # 8-byte Reload
	movq	240(%rsp), %rax         # 8-byte Reload
	jmp	.LBB12_76
.LBB12_93:                              # %if_then_crit56.rv.i
                                        #   in Loop: Header=BB12_75 Depth=7
	movslq	%r15d, %rsi
	movl	632(%rsp,%rsi,4), %ecx
	vmovss	376(%rsp,%rsi,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	leaq	636(%rsp,%rsi,4), %rax
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movl	636(%rsp,%rsi,4), %eax
	leaq	380(%rsp,%rsi,4), %r14
	vmovss	380(%rsp,%rsi,4), %xmm2 # xmm2 = mem[0],zero,zero,zero
	leaq	640(%rsp,%rsi,4), %rdi
	movq	%rdi, 192(%rsp)         # 8-byte Spill
	movl	640(%rsp,%rsi,4), %edi
	movl	%edi, 48(%rsp)          # 4-byte Spill
	leaq	384(%rsp,%rsi,4), %rdi
	movq	%rdi, 96(%rsp)          # 8-byte Spill
	movl	384(%rsp,%rsi,4), %r9d
	vucomiss	%xmm2, %xmm1
	movl	%eax, %edi
	cmovbl	%ecx, %edi
	vminss	%xmm2, %xmm1, %xmm4
	vmaxss	%xmm1, %xmm2, %xmm1
	cmovbl	%eax, %ecx
	movl	48(%rsp), %eax          # 4-byte Reload
	movl	%ecx, 632(%rsp,%rsi,4)
	vmovss	%xmm1, 376(%rsp,%rsi,4)
	vmovd	%xmm4, %ecx
	jmp	.LBB12_96
.LBB12_92:                              # %if_then_crit55.rv.i
                                        #   in Loop: Header=BB12_75 Depth=7
	movslq	%r15d, %rcx
	movl	628(%rsp,%rcx,4), %eax
	vmovss	372(%rsp,%rcx,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	movl	632(%rsp,%rcx,4), %r9d
	vmovss	376(%rsp,%rcx,4), %xmm2 # xmm2 = mem[0],zero,zero,zero
	leaq	636(%rsp,%rcx,4), %rsi
	movq	%rsi, 160(%rsp)         # 8-byte Spill
	movl	636(%rsp,%rcx,4), %ebx
	leaq	380(%rsp,%rcx,4), %rsi
	movq	%rsi, 144(%rsp)         # 8-byte Spill
	vmovss	380(%rsp,%rcx,4), %xmm4 # xmm4 = mem[0],zero,zero,zero
	leaq	640(%rsp,%rcx,4), %rsi
	movq	%rsi, 192(%rsp)         # 8-byte Spill
	movl	640(%rsp,%rcx,4), %r14d
	leaq	384(%rsp,%rcx,4), %rsi
	movq	%rsi, 96(%rsp)          # 8-byte Spill
	vmovss	384(%rsp,%rcx,4), %xmm5 # xmm5 = mem[0],zero,zero,zero
	vucomiss	%xmm2, %xmm1
	movl	%r9d, %edi
	cmovbl	%eax, %edi
	vminss	%xmm2, %xmm1, %xmm6
	cmovbl	%r9d, %eax
	vmaxss	%xmm1, %xmm2, %xmm1
	vucomiss	%xmm5, %xmm4
	movl	%r14d, %esi
	cmovbl	%ebx, %esi
	vminss	%xmm5, %xmm4, %xmm2
	cmovbl	%r14d, %ebx
	vmaxss	%xmm4, %xmm5, %xmm4
	vucomiss	%xmm4, %xmm1
	movl	%ebx, %r9d
	cmovbl	%eax, %r9d
	vminss	%xmm4, %xmm1, %xmm5
	vmaxss	%xmm1, %xmm4, %xmm1
	cmovael	%eax, %ebx
	vucomiss	%xmm2, %xmm6
	movl	%esi, %eax
	cmovbl	%edi, %eax
	vminss	%xmm2, %xmm6, %xmm4
	cmovael	%edi, %esi
	vmaxss	%xmm6, %xmm2, %xmm2
	vucomiss	%xmm5, %xmm2
	movl	%r9d, %edi
	cmovbl	%esi, %edi
	vminss	%xmm5, %xmm2, %xmm6
	vmaxss	%xmm2, %xmm5, %xmm2
	cmovbl	%r9d, %esi
	movl	%ebx, 628(%rsp,%rcx,4)
	movq	64(%rsp), %rbx          # 8-byte Reload
	vmovss	%xmm1, 372(%rsp,%rcx,4)
	movl	%esi, 632(%rsp,%rcx,4)
	movq	144(%rsp), %r14         # 8-byte Reload
	vmovss	%xmm2, 376(%rsp,%rcx,4)
	vmovd	%xmm6, %ecx
	jmp	.LBB12_95
.LBB12_87:                              # %if_else51.rv.i
                                        #   in Loop: Header=BB12_75 Depth=7
	movslq	%r15d, %rsi
	movq	%rsi, 896(%rsp)         # 8-byte Spill
	movl	612(%rsp,%rsi,4), %edi
	vmovss	356(%rsp,%rsi,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	movl	616(%rsp,%rsi,4), %eax
	vmovss	360(%rsp,%rsi,4), %xmm2 # xmm2 = mem[0],zero,zero,zero
	movl	620(%rsp,%rsi,4), %r14d
	vmovss	364(%rsp,%rsi,4), %xmm4 # xmm4 = mem[0],zero,zero,zero
	movl	624(%rsp,%rsi,4), %r9d
	vmovss	368(%rsp,%rsi,4), %xmm6 # xmm6 = mem[0],zero,zero,zero
	movl	628(%rsp,%rsi,4), %ebx
	vmovss	372(%rsp,%rsi,4), %xmm5 # xmm5 = mem[0],zero,zero,zero
	vmovss	%xmm5, 28(%rsp)         # 4-byte Spill
	movl	632(%rsp,%rsi,4), %ecx
	movl	%ecx, 80(%rsp)          # 4-byte Spill
	vmovss	376(%rsp,%rsi,4), %xmm5 # xmm5 = mem[0],zero,zero,zero
	vmovss	%xmm5, 248(%rsp)        # 4-byte Spill
	movl	636(%rsp,%rsi,4), %ecx
	movl	%ecx, 160(%rsp)         # 4-byte Spill
	vmovss	380(%rsp,%rsi,4), %xmm5 # xmm5 = mem[0],zero,zero,zero
	vmovss	%xmm5, 128(%rsp)        # 4-byte Spill
	movl	640(%rsp,%rsi,4), %ecx
	movl	%ecx, 72(%rsp)          # 4-byte Spill
	vmovss	384(%rsp,%rsi,4), %xmm9 # xmm9 = mem[0],zero,zero,zero
	vucomiss	%xmm2, %xmm1
	movl	%eax, %esi
	cmovbl	%edi, %esi
	vminss	%xmm2, %xmm1, %xmm5
	cmovbl	%eax, %edi
	vmaxss	%xmm1, %xmm2, %xmm1
	vucomiss	%xmm6, %xmm4
	movl	%r9d, %ecx
	cmovbl	%r14d, %ecx
	vminss	%xmm6, %xmm4, %xmm2
	cmovbl	%r9d, %r14d
	vmaxss	%xmm4, %xmm6, %xmm4
	vucomiss	%xmm4, %xmm1
	movl	%r14d, %eax
	cmovbl	%edi, %eax
	vminss	%xmm4, %xmm1, %xmm6
	cmovael	%edi, %r14d
	vmaxss	%xmm1, %xmm4, %xmm1
	vmovss	%xmm1, 192(%rsp)        # 4-byte Spill
	vucomiss	%xmm2, %xmm5
	movl	%ecx, %r9d
	cmovbl	%esi, %ecx
	movl	%ecx, 96(%rsp)          # 4-byte Spill
	vminss	%xmm2, %xmm5, %xmm1
	vmovss	%xmm1, 144(%rsp)        # 4-byte Spill
	cmovael	%esi, %r9d
	vmaxss	%xmm5, %xmm2, %xmm1
	vucomiss	%xmm6, %xmm1
	movl	%eax, %ecx
	cmovbl	%r9d, %ecx
	movl	%ecx, 288(%rsp)         # 4-byte Spill
	vminss	%xmm6, %xmm1, %xmm2
	vmovss	%xmm2, 76(%rsp)         # 4-byte Spill
	cmovbl	%eax, %r9d
	movl	%r9d, 48(%rsp)          # 4-byte Spill
	vmaxss	%xmm1, %xmm6, %xmm1
	vmovss	%xmm1, 304(%rsp)        # 4-byte Spill
	vmovss	28(%rsp), %xmm2         # 4-byte Reload
                                        # xmm2 = mem[0],zero,zero,zero
	vmovss	248(%rsp), %xmm4        # 4-byte Reload
                                        # xmm4 = mem[0],zero,zero,zero
	vucomiss	%xmm4, %xmm2
	movl	80(%rsp), %ecx          # 4-byte Reload
	movl	%ecx, %eax
	cmovbl	%ebx, %eax
	vminss	%xmm4, %xmm2, %xmm1
	cmovbl	%ecx, %ebx
	vmaxss	%xmm2, %xmm4, %xmm2
	vmovss	128(%rsp), %xmm5        # 4-byte Reload
                                        # xmm5 = mem[0],zero,zero,zero
	vucomiss	%xmm9, %xmm5
	movl	72(%rsp), %ecx          # 4-byte Reload
	movl	%ecx, %r9d
	movl	160(%rsp), %esi         # 4-byte Reload
	cmovbl	%esi, %r9d
	vminss	%xmm9, %xmm5, %xmm4
	cmovbl	%ecx, %esi
	vmaxss	%xmm5, %xmm9, %xmm5
	vucomiss	%xmm5, %xmm2
	movl	%esi, %ecx
	cmovbl	%ebx, %ecx
	vminss	%xmm5, %xmm2, %xmm6
	cmovael	%ebx, %esi
	vmaxss	%xmm2, %xmm5, %xmm9
	vucomiss	%xmm4, %xmm1
	movl	%r9d, %ebx
	cmovbl	%eax, %ebx
	vminss	%xmm4, %xmm1, %xmm2
	vmovss	%xmm2, 128(%rsp)        # 4-byte Spill
	cmovael	%eax, %r9d
	vmaxss	%xmm1, %xmm4, %xmm1
	vucomiss	%xmm6, %xmm1
	movl	%ecx, %edi
	cmovbl	%r9d, %edi
	vminss	%xmm6, %xmm1, %xmm2
	cmovbl	%ecx, %r9d
	vmaxss	%xmm1, %xmm6, %xmm1
	vmovss	192(%rsp), %xmm4        # 4-byte Reload
                                        # xmm4 = mem[0],zero,zero,zero
	vmovss	%xmm9, 160(%rsp)        # 4-byte Spill
	vucomiss	%xmm9, %xmm4
	movl	%esi, %eax
	cmovbl	%r14d, %eax
	vminss	%xmm9, %xmm4, %xmm4
	cmovael	%r14d, %esi
	vmovss	76(%rsp), %xmm5         # 4-byte Reload
                                        # xmm5 = mem[0],zero,zero,zero
	vucomiss	%xmm2, %xmm5
	movl	%edi, %ecx
	movl	288(%rsp), %r14d        # 4-byte Reload
	cmovbl	%r14d, %ecx
	movl	%ecx, 28(%rsp)          # 4-byte Spill
	vminss	%xmm2, %xmm5, %xmm6
	vmovss	%xmm6, 80(%rsp)         # 4-byte Spill
	cmovael	%r14d, %edi
	vmaxss	%xmm5, %xmm2, %xmm2
	vucomiss	%xmm4, %xmm2
	movl	%eax, %ecx
	cmovbl	%edi, %ecx
	movl	%ecx, 76(%rsp)          # 4-byte Spill
	vminss	%xmm4, %xmm2, %xmm5
	vmovss	%xmm5, 288(%rsp)        # 4-byte Spill
	cmovbl	%eax, %edi
	vmaxss	%xmm2, %xmm4, %xmm5
	vmovss	%xmm5, 72(%rsp)         # 4-byte Spill
	vmovss	304(%rsp), %xmm4        # 4-byte Reload
                                        # xmm4 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm4
	movl	%r9d, %eax
	movl	48(%rsp), %ecx          # 4-byte Reload
	cmovbl	%ecx, %eax
	vminss	%xmm1, %xmm4, %xmm2
	cmovael	%ecx, %r9d
	vmaxss	%xmm4, %xmm1, %xmm6
	vmovss	144(%rsp), %xmm4        # 4-byte Reload
                                        # xmm4 = mem[0],zero,zero,zero
	vmovss	128(%rsp), %xmm1        # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm4
	movl	%ebx, %ecx
	movl	96(%rsp), %r14d         # 4-byte Reload
	cmovbl	%r14d, %ecx
	movl	%ecx, 48(%rsp)          # 4-byte Spill
	cmovael	%r14d, %ebx
	vmaxss	%xmm4, %xmm1, %xmm1
	vucomiss	%xmm2, %xmm1
	vminss	%xmm2, %xmm1, %xmm9
	vmaxss	%xmm1, %xmm2, %xmm4
	movl	%eax, %r14d
	cmovbl	%ebx, %r14d
	cmovbl	%eax, %ebx
	vucomiss	%xmm5, %xmm6
	movl	%edi, %eax
	cmovbl	%r9d, %eax
	cmovbl	%edi, %r9d
	vucomiss	288(%rsp), %xmm4 # 4-byte Folded Reload
	movl	76(%rsp), %ecx          # 4-byte Reload
	movl	%ecx, %edi
	cmovbl	%ebx, %edi
	movl	%edi, 96(%rsp)          # 4-byte Spill
	cmovbl	%ecx, %ebx
	vmovss	80(%rsp), %xmm5         # 4-byte Reload
                                        # xmm5 = mem[0],zero,zero,zero
	vucomiss	%xmm5, %xmm9
	movl	28(%rsp), %ecx          # 4-byte Reload
	movl	%ecx, %edi
	cmovbl	%r14d, %edi
	cmovbl	%ecx, %r14d
	movq	896(%rsp), %rcx         # 8-byte Reload
	movl	%esi, 612(%rsp,%rcx,4)
	vmovss	192(%rsp), %xmm2        # 4-byte Reload
                                        # xmm2 = mem[0],zero,zero,zero
	vmaxss	160(%rsp), %xmm2, %xmm2 # 4-byte Folded Reload
	vmovss	%xmm2, 304(%rsp)        # 4-byte Spill
	movl	%r9d, 616(%rsp,%rcx,4)
	leaq	636(%rsp,%rcx,4), %rsi
	movq	%rsi, 160(%rsp)         # 8-byte Spill
	movl	%eax, 620(%rsp,%rcx,4)
	leaq	380(%rsp,%rcx,4), %rsi
	movl	%ebx, 624(%rsp,%rcx,4)
	movq	64(%rsp), %rbx          # 8-byte Reload
	leaq	640(%rsp,%rcx,4), %rax
	movq	%rax, 192(%rsp)         # 8-byte Spill
	movl	96(%rsp), %eax          # 4-byte Reload
	movl	%eax, 628(%rsp,%rcx,4)
	leaq	384(%rsp,%rcx,4), %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	vmovss	144(%rsp), %xmm2        # 4-byte Reload
                                        # xmm2 = mem[0],zero,zero,zero
	vminss	128(%rsp), %xmm2, %xmm2 # 4-byte Folded Reload
	vmovss	%xmm2, 144(%rsp)        # 4-byte Spill
	vmovss	72(%rsp), %xmm2         # 4-byte Reload
                                        # xmm2 = mem[0],zero,zero,zero
	vminss	%xmm2, %xmm6, %xmm1
	vmovss	%xmm1, 128(%rsp)        # 4-byte Spill
	vmaxss	%xmm6, %xmm2, %xmm2
	vmovss	288(%rsp), %xmm1        # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	vminss	%xmm1, %xmm4, %xmm6
	vmovss	%xmm6, 28(%rsp)         # 4-byte Spill
	vmaxss	%xmm4, %xmm1, %xmm1
	vminss	%xmm5, %xmm9, %xmm6
	vmaxss	%xmm9, %xmm5, %xmm9
	vmovss	304(%rsp), %xmm4        # 4-byte Reload
                                        # xmm4 = mem[0],zero,zero,zero
	vmovss	%xmm4, 356(%rsp,%rcx,4)
	vmovss	%xmm2, 360(%rsp,%rcx,4)
	vmovss	128(%rsp), %xmm2        # 4-byte Reload
                                        # xmm2 = mem[0],zero,zero,zero
	vmovss	%xmm2, 364(%rsp,%rcx,4)
	vmovss	%xmm1, 368(%rsp,%rcx,4)
	vmovss	28(%rsp), %xmm1         # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, 372(%rsp,%rcx,4)
	movl	%r14d, 632(%rsp,%rcx,4)
	movq	%rsi, %r14
	movl	48(%rsp), %eax          # 4-byte Reload
	vmovss	%xmm9, 376(%rsp,%rcx,4)
	vmovd	%xmm6, %ecx
	vmovd	144(%rsp), %xmm1        # 4-byte Folded Reload
                                        # xmm1 = mem[0],zero,zero,zero
	vmovd	%xmm1, %r9d
	jmp	.LBB12_96
.LBB12_91:                              # %if_then_crit54.rv.i
                                        #   in Loop: Header=BB12_75 Depth=7
	movslq	%r15d, %rsi
	movl	624(%rsp,%rsi,4), %eax
	vmovss	368(%rsp,%rsi,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	movl	628(%rsp,%rsi,4), %ecx
	vmovss	372(%rsp,%rsi,4), %xmm2 # xmm2 = mem[0],zero,zero,zero
	movl	632(%rsp,%rsi,4), %ebx
	vmovss	376(%rsp,%rsi,4), %xmm4 # xmm4 = mem[0],zero,zero,zero
	leaq	636(%rsp,%rsi,4), %rdi
	movq	%rdi, 160(%rsp)         # 8-byte Spill
	movl	636(%rsp,%rsi,4), %r14d
	leaq	380(%rsp,%rsi,4), %rdi
	movq	%rdi, 144(%rsp)         # 8-byte Spill
	vmovss	380(%rsp,%rsi,4), %xmm5 # xmm5 = mem[0],zero,zero,zero
	leaq	640(%rsp,%rsi,4), %rdi
	movq	%rdi, 192(%rsp)         # 8-byte Spill
	movl	640(%rsp,%rsi,4), %edi
	movl	%edi, 48(%rsp)          # 4-byte Spill
	leaq	384(%rsp,%rsi,4), %rdi
	movq	%rdi, 96(%rsp)          # 8-byte Spill
	movl	384(%rsp,%rsi,4), %r9d
	vucomiss	%xmm2, %xmm1
	movl	%ecx, %edi
	cmovbl	%eax, %edi
	movl	%edi, 128(%rsp)         # 4-byte Spill
	vminss	%xmm2, %xmm1, %xmm6
	cmovbl	%ecx, %eax
	vmaxss	%xmm1, %xmm2, %xmm1
	vucomiss	%xmm5, %xmm4
	movl	%r14d, %ecx
	cmovbl	%ebx, %ecx
	vminss	%xmm5, %xmm4, %xmm2
	cmovbl	%r14d, %ebx
	vmaxss	%xmm4, %xmm5, %xmm4
	vucomiss	%xmm4, %xmm1
	movl	%ebx, %edi
	cmovbl	%eax, %edi
	vminss	%xmm4, %xmm1, %xmm5
	vmaxss	%xmm1, %xmm4, %xmm1
	cmovael	%eax, %ebx
	vucomiss	%xmm2, %xmm6
	movl	%ecx, %r14d
	movl	128(%rsp), %eax         # 4-byte Reload
	cmovbl	%eax, %r14d
	vminss	%xmm2, %xmm6, %xmm4
	cmovael	%eax, %ecx
	vmaxss	%xmm6, %xmm2, %xmm2
	vucomiss	%xmm5, %xmm2
	vminss	%xmm5, %xmm2, %xmm6
	movl	%edi, %eax
	cmovbl	%ecx, %eax
	vmaxss	%xmm2, %xmm5, %xmm2
	cmovbl	%edi, %ecx
	movl	%ebx, 624(%rsp,%rsi,4)
	movq	64(%rsp), %rbx          # 8-byte Reload
	vmovss	%xmm1, 368(%rsp,%rsi,4)
	movl	%ecx, 628(%rsp,%rsi,4)
	vmovss	%xmm2, 372(%rsp,%rsi,4)
	movl	%eax, 632(%rsp,%rsi,4)
	movl	48(%rsp), %eax          # 4-byte Reload
	movl	%r14d, %edi
	vmovss	%xmm6, 376(%rsp,%rsi,4)
	movq	144(%rsp), %r14         # 8-byte Reload
	vmovd	%xmm4, %ecx
	jmp	.LBB12_96
.LBB12_90:                              # %if_then_crit53.rv.i
                                        #   in Loop: Header=BB12_75 Depth=7
	movslq	%r15d, %rbx
	movl	620(%rsp,%rbx,4), %r9d
	vmovss	364(%rsp,%rbx,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	movl	624(%rsp,%rbx,4), %eax
	vmovss	368(%rsp,%rbx,4), %xmm2 # xmm2 = mem[0],zero,zero,zero
	movl	628(%rsp,%rbx,4), %edi
	vmovss	372(%rsp,%rbx,4), %xmm4 # xmm4 = mem[0],zero,zero,zero
	movl	632(%rsp,%rbx,4), %r14d
	vmovss	376(%rsp,%rbx,4), %xmm6 # xmm6 = mem[0],zero,zero,zero
	leaq	636(%rsp,%rbx,4), %rsi
	movq	%rsi, 160(%rsp)         # 8-byte Spill
	movl	636(%rsp,%rbx,4), %esi
	movl	%esi, 48(%rsp)          # 4-byte Spill
	vucomiss	%xmm2, %xmm1
	movl	%eax, %esi
	cmovbl	%r9d, %esi
	vminss	%xmm2, %xmm1, %xmm5
	cmovbl	%eax, %r9d
	vmaxss	%xmm1, %xmm2, %xmm1
	vucomiss	%xmm6, %xmm4
	movl	%r14d, %ecx
	cmovbl	%edi, %ecx
	vminss	%xmm6, %xmm4, %xmm2
	cmovbl	%r14d, %edi
	vmaxss	%xmm4, %xmm6, %xmm4
	vucomiss	%xmm4, %xmm1
	movl	%edi, %r14d
	cmovbl	%r9d, %r14d
	vminss	%xmm4, %xmm1, %xmm6
	vmaxss	%xmm1, %xmm4, %xmm1
	cmovael	%r9d, %edi
	vucomiss	%xmm2, %xmm5
	movl	%ecx, %eax
	cmovbl	%esi, %eax
	movl	%eax, 96(%rsp)          # 4-byte Spill
	cmovael	%esi, %ecx
	vmaxss	%xmm5, %xmm2, %xmm4
	vucomiss	%xmm6, %xmm4
	movl	%r14d, %esi
	cmovbl	%ecx, %esi
	cmovbl	%r14d, %ecx
	movl	640(%rsp,%rbx,4), %eax
	movl	%edi, 620(%rsp,%rbx,4)
	leaq	380(%rsp,%rbx,4), %r14
	movl	%ecx, 624(%rsp,%rbx,4)
	movl	380(%rsp,%rbx,4), %ecx
	movl	%esi, 628(%rsp,%rbx,4)
	movl	48(%rsp), %edi          # 4-byte Reload
	leaq	640(%rsp,%rbx,4), %r9
	movq	%r9, 192(%rsp)          # 8-byte Spill
	movl	96(%rsp), %esi          # 4-byte Reload
	movl	%esi, 632(%rsp,%rbx,4)
	movl	384(%rsp,%rbx,4), %r9d
	vminss	%xmm2, %xmm5, %xmm2
	vminss	%xmm6, %xmm4, %xmm5
	vmaxss	%xmm4, %xmm6, %xmm4
	vmovss	%xmm1, 364(%rsp,%rbx,4)
	vmovss	%xmm4, 368(%rsp,%rbx,4)
	vmovss	%xmm5, 372(%rsp,%rbx,4)
	vmovss	%xmm2, 376(%rsp,%rbx,4)
	jmp	.LBB12_89
.LBB12_88:                              # %if_then_crit52.rv.i
                                        #   in Loop: Header=BB12_75 Depth=7
	movslq	%r15d, %rbx
	movl	616(%rsp,%rbx,4), %r9d
	vmovss	360(%rsp,%rbx,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	movl	620(%rsp,%rbx,4), %eax
	vmovss	364(%rsp,%rbx,4), %xmm2 # xmm2 = mem[0],zero,zero,zero
	movl	624(%rsp,%rbx,4), %edi
	vmovss	368(%rsp,%rbx,4), %xmm4 # xmm4 = mem[0],zero,zero,zero
	movl	628(%rsp,%rbx,4), %r14d
	vmovss	372(%rsp,%rbx,4), %xmm6 # xmm6 = mem[0],zero,zero,zero
	leaq	636(%rsp,%rbx,4), %rsi
	movq	%rsi, 160(%rsp)         # 8-byte Spill
	movl	636(%rsp,%rbx,4), %esi
	movl	%esi, 48(%rsp)          # 4-byte Spill
	vucomiss	%xmm2, %xmm1
	movl	%eax, %esi
	cmovbl	%r9d, %esi
	vminss	%xmm2, %xmm1, %xmm5
	cmovbl	%eax, %r9d
	vmaxss	%xmm1, %xmm2, %xmm1
	vucomiss	%xmm6, %xmm4
	movl	%r14d, %ecx
	cmovbl	%edi, %ecx
	vminss	%xmm6, %xmm4, %xmm2
	cmovbl	%r14d, %edi
	vmaxss	%xmm4, %xmm6, %xmm4
	vucomiss	%xmm4, %xmm1
	movl	%edi, %r14d
	cmovbl	%r9d, %r14d
	vminss	%xmm4, %xmm1, %xmm6
	vmaxss	%xmm1, %xmm4, %xmm1
	cmovael	%r9d, %edi
	vucomiss	%xmm2, %xmm5
	movl	%ecx, %eax
	cmovbl	%esi, %eax
	movl	%eax, 96(%rsp)          # 4-byte Spill
	cmovael	%esi, %ecx
	vmaxss	%xmm5, %xmm2, %xmm4
	vucomiss	%xmm6, %xmm4
	movl	%r14d, %esi
	cmovbl	%ecx, %esi
	cmovbl	%r14d, %ecx
	movl	640(%rsp,%rbx,4), %eax
	movl	%edi, 616(%rsp,%rbx,4)
	leaq	380(%rsp,%rbx,4), %r14
	movl	%ecx, 620(%rsp,%rbx,4)
	movl	380(%rsp,%rbx,4), %ecx
	movl	%esi, 624(%rsp,%rbx,4)
	movl	48(%rsp), %edi          # 4-byte Reload
	leaq	640(%rsp,%rbx,4), %r9
	movq	%r9, 192(%rsp)          # 8-byte Spill
	movl	96(%rsp), %esi          # 4-byte Reload
	movl	%esi, 628(%rsp,%rbx,4)
	movl	384(%rsp,%rbx,4), %r9d
	vminss	%xmm2, %xmm5, %xmm2
	vminss	%xmm6, %xmm4, %xmm5
	vmaxss	%xmm4, %xmm6, %xmm4
	vmovss	%xmm1, 360(%rsp,%rbx,4)
	vmovss	%xmm4, 364(%rsp,%rbx,4)
	vmovss	%xmm5, 368(%rsp,%rbx,4)
	vmovss	%xmm2, 372(%rsp,%rbx,4)
.LBB12_89:                              # %next59.rv.i.thread
                                        #   in Loop: Header=BB12_75 Depth=7
	leaq	384(%rsp,%rbx,4), %rsi
	movq	%rsi, 96(%rsp)          # 8-byte Spill
	movq	64(%rsp), %rbx          # 8-byte Reload
	jmp	.LBB12_96
	.p2align	4, 0x90
.LBB12_75:                              # %while_body5.rv.i
                                        #   Parent Loop BB12_2 Depth=1
                                        #     Parent Loop BB12_4 Depth=2
                                        #       Parent Loop BB12_5 Depth=3
                                        #         Parent Loop BB12_72 Depth=4
                                        #           Parent Loop BB12_73 Depth=5
                                        #             Parent Loop BB12_74 Depth=6
                                        # =>            This Loop Header: Depth=7
                                        #                 Child Loop BB12_79 Depth 8
	vmovd	%edx, %xmm5
	movslq	%r15d, %r15
	movl	640(%rsp,%r15,4), %r8d
	movl	384(%rsp,%r15,4), %edx
	addl	$-1, %r15d
	vucomiss	%xmm5, %xmm12
	jbe	.LBB12_76
# BB#77:                                # %if_else.rv.i
                                        #   in Loop: Header=BB12_75 Depth=7
	movslq	%edi, %rdi
	addq	$-1, %rdi
	shlq	$8, %rdi
	addq	%r9, %rdi
	vmovaps	(%rax,%rdi), %ymm5
	vfmadd213ps	%ymm15, %ymm8, %ymm5
	vmovaps	(%r13,%rdi), %ymm6
	vfmadd213ps	%ymm15, %ymm8, %ymm6
	vmovaps	(%r12,%rdi), %ymm9
	vfmadd213ps	%ymm3, %ymm10, %ymm9
	vmovaps	(%r10,%rdi), %ymm2
	vfmadd213ps	%ymm3, %ymm10, %ymm2
	vmovaps	(%r11,%rdi), %ymm1
	vfmadd213ps	%ymm7, %ymm11, %ymm1
	vmovaps	(%rbx,%rdi), %ymm4
	vfmadd213ps	%ymm7, %ymm11, %ymm4
	vpmaxsd	%ymm5, %ymm9, %ymm5
	vpminsd	%ymm2, %ymm6, %ymm2
	vpmaxsd	%ymm1, %ymm0, %ymm1
	vpminsd	%ymm13, %ymm4, %ymm4
	vpmaxsd	%ymm5, %ymm1, %ymm5
	vpminsd	%ymm4, %ymm2, %ymm1
	vpcmpgtd	%ymm1, %ymm5, %ymm1
	vmovmskps	%ymm1, %r14d
	xorl	$255, %r14d
	jne	.LBB12_78
.LBB12_76:                              # %while_head1.rv.i.backedge
                                        #   in Loop: Header=BB12_75 Depth=7
	movl	%r8d, %edi
	testl	%r8d, %r8d
	jg	.LBB12_75
.LBB12_98:                              # %break64.rv.i
                                        #   in Loop: Header=BB12_74 Depth=6
	movl	%r8d, %edi
	testl	%r8d, %r8d
	js	.LBB12_99
.LBB12_100:                             # %while_head.rv.i1.backedge
                                        #   in Loop: Header=BB12_74 Depth=6
	movl	%r8d, %edi
	testl	%r8d, %r8d
	jne	.LBB12_74
	jmp	.LBB12_107
.LBB12_99:                              # %if_then68.rv.i
                                        #   in Loop: Header=BB12_74 Depth=6
	vmovd	%edx, %xmm1
	movslq	%r15d, %r15
	movl	640(%rsp,%r15,4), %r8d
	movl	384(%rsp,%r15,4), %edx
	addl	$-1, %r15d
	vucomiss	%xmm1, %xmm12
	jbe	.LBB12_100
# BB#101:                               # %head.rv.i31.preheader
                                        #   in Loop: Header=BB12_73 Depth=5
	notl	%edi
	movslq	%edi, %rax
	imulq	$208, %rax, %rdi
	addq	336(%rsp), %rdi         # 8-byte Folded Reload
	jmp	.LBB12_102
.LBB12_103:                             # %if_else_crit.rv.i.i
                                        #   in Loop: Header=BB12_102 Depth=6
	vmovaps	%xmm2, 304(%rsp)        # 16-byte Spill
	vmovaps	%xmm5, 896(%rsp)        # 16-byte Spill
	vpand	%xmm13, %xmm6, %xmm12
	vmovd	44(%rsp), %xmm1         # 4-byte Folded Reload
	vmovaps	%xmm4, %xmm5
	vmulps	1232(%rsp), %xmm5, %xmm13 # 16-byte Folded Reload
	vmulps	288(%rsp), %xmm9, %xmm2 # 16-byte Folded Reload
	vpbroadcastd	%xmm1, %xmm1
	vmulps	%xmm5, %xmm1, %xmm1
	vcmpneq_usps	.LCPI12_14, %xmm5, %xmm6
	vmovaps	48(%rsp), %xmm5         # 16-byte Reload
	vfmadd132ps	128(%rsp), %xmm2, %xmm5 # 16-byte Folded Reload
	vmovaps	160(%rsp), %xmm2        # 16-byte Reload
	vfmadd132ps	144(%rsp), %xmm5, %xmm2 # 16-byte Folded Reload
	vxorps	192(%rsp), %xmm2, %xmm5 # 16-byte Folded Reload
	vcmpleps	%xmm1, %xmm5, %xmm1
	vcmpleps	%xmm5, %xmm13, %xmm2
	vandps	%xmm6, %xmm1, %xmm1
	vandps	%xmm2, %xmm1, %xmm6
	vptest	%xmm6, %xmm12
	je	.LBB12_105
# BB#104:                               # %if_then.rv.i.i
                                        #   in Loop: Header=BB12_102 Depth=6
	vpand	%xmm12, %xmm6, %xmm1
	vmovaps	%xmm4, %xmm6
	vrcpps	%xmm6, %xmm2
	vbroadcastss	.LCPI12_0(%rip), %xmm4
	vfnmadd213ps	%xmm4, %xmm2, %xmm6
	vfmadd132ps	%xmm2, %xmm2, %xmm6
	vmulps	%xmm5, %xmm6, %xmm2
	vbroadcastss	.LCPI12_9(%rip), %xmm4
	vblendvps	%xmm1, %xmm2, %xmm4, %xmm1
	vpermilpd	$1, %xmm1, %xmm4 # xmm4 = xmm1[1,0]
	vpminsd	%xmm4, %xmm1, %xmm4
	vpshufd	$57, %xmm4, %xmm5       # xmm5 = xmm4[1,2,3,0]
	vpminsd	%xmm5, %xmm4, %xmm4
	vcmpeqps	%xmm4, %xmm1, %xmm1
	vmovmskps	%xmm1, %eax
	tzcntl	%eax, %eax
	movl	(%rdi,%rax,4), %esi
                                        # kill: %EAX<def> %EAX<kill> %RAX<kill> %RAX<def>
	andl	$3, %eax
	vmulps	896(%rsp), %xmm6, %xmm1 # 16-byte Folded Reload
	vmulps	304(%rsp), %xmm6, %xmm4 # 16-byte Folded Reload
	movl	$2147483647, %ecx       # imm = 0x7FFFFFFF
	andl	%ecx, %esi
	movl	%esi, 92(%rsp)          # 4-byte Spill
	vmovaps	%xmm2, 1328(%rsp)
	movl	1328(%rsp,%rax,4), %ecx
	movl	%ecx, 44(%rsp)          # 4-byte Spill
	vmovaps	%xmm1, 1344(%rsp)
	movl	1344(%rsp,%rax,4), %ecx
	movl	%ecx, 88(%rsp)          # 4-byte Spill
	vmovaps	%xmm4, 1360(%rsp)
	movl	1360(%rsp,%rax,4), %eax
	movl	%eax, 84(%rsp)          # 4-byte Spill
	jmp	.LBB12_105
	.p2align	4, 0x90
.LBB12_102:                             # %while_head.rv.i.i
                                        #   Parent Loop BB12_2 Depth=1
                                        #     Parent Loop BB12_4 Depth=2
                                        #       Parent Loop BB12_5 Depth=3
                                        #         Parent Loop BB12_72 Depth=4
                                        #           Parent Loop BB12_73 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	vmovaps	-48(%rdi), %xmm4
	vmovaps	-32(%rdi), %xmm1
	vmovaps	-16(%rdi), %xmm2
	vmovaps	1312(%rsp), %xmm9       # 16-byte Reload
	vmovaps	%xmm1, 128(%rsp)        # 16-byte Spill
	vmulps	%xmm1, %xmm9, %xmm1
	vmovaps	1008(%rsp), %xmm5       # 16-byte Reload
	vmovaps	%xmm4, 288(%rsp)        # 16-byte Spill
	vfmadd231ps	%xmm4, %xmm5, %xmm1
	vmovaps	%xmm5, %xmm4
	vmovaps	1296(%rsp), %xmm12      # 16-byte Reload
	vmovaps	%xmm2, 144(%rsp)        # 16-byte Spill
	vfmadd231ps	%xmm2, %xmm12, %xmm1
	vandps	.LCPI12_12(%rip), %xmm1, %xmm2
	vmovaps	%xmm2, 96(%rsp)         # 16-byte Spill
	vmovaps	-192(%rdi), %xmm2
	vmovaps	-176(%rdi), %xmm5
	vmovaps	%xmm5, 160(%rsp)        # 16-byte Spill
	vmovaps	-160(%rdi), %xmm5
	vmovaps	%xmm5, 48(%rsp)         # 16-byte Spill
	vbroadcastss	.LCPI12_1(%rip), %xmm6
	vandps	%xmm6, %xmm1, %xmm1
	vmovaps	%xmm1, 192(%rsp)        # 16-byte Spill
	vsubps	1280(%rsp), %xmm2, %xmm13 # 16-byte Folded Reload
	vmulps	%xmm13, %xmm9, %xmm5
	vmovaps	48(%rsp), %xmm1         # 16-byte Reload
	vsubps	1264(%rsp), %xmm1, %xmm6 # 16-byte Folded Reload
	vmovaps	160(%rsp), %xmm1        # 16-byte Reload
	vsubps	1248(%rsp), %xmm1, %xmm1 # 16-byte Folded Reload
	vmulps	%xmm6, %xmm4, %xmm2
	vmulps	%xmm1, %xmm12, %xmm4
	vmovaps	%xmm6, 160(%rsp)        # 16-byte Spill
	vfmsub231ps	%xmm6, %xmm9, %xmm4
	vmovaps	%xmm13, %xmm9
	vfmsub231ps	%xmm9, %xmm12, %xmm2
	vmovaps	96(%rsp), %xmm12        # 16-byte Reload
	vmulps	-80(%rdi), %xmm2, %xmm6
	vmovaps	%xmm1, 48(%rsp)         # 16-byte Spill
	vfmsub231ps	1008(%rsp), %xmm1, %xmm5 # 16-byte Folded Reload
	vmulps	-128(%rdi), %xmm2, %xmm2
	vfmadd231ps	-96(%rdi), %xmm4, %xmm6
	vfmadd231ps	-144(%rdi), %xmm4, %xmm2
	vfmadd231ps	-64(%rdi), %xmm5, %xmm6
	vfmadd231ps	-112(%rdi), %xmm5, %xmm2
	vmovaps	192(%rsp), %xmm1        # 16-byte Reload
	vxorps	%xmm6, %xmm1, %xmm5
	vxorps	%xmm2, %xmm1, %xmm4
	vxorps	%xmm2, %xmm2, %xmm2
	vcmpleps	%xmm5, %xmm2, %xmm1
	vcmpleps	%xmm4, %xmm2, %xmm2
	vandps	%xmm1, %xmm2, %xmm6
	vmovaps	%xmm4, %xmm2
	vaddps	%xmm2, %xmm5, %xmm1
	vmovaps	%xmm12, %xmm4
	vcmpleps	%xmm12, %xmm1, %xmm13
	vptest	%xmm13, %xmm6
	jne	.LBB12_103
.LBB12_105:                             # %next.rv.i.i
                                        #   in Loop: Header=BB12_102 Depth=6
	cmpl	$0, 12(%rdi)
	leaq	208(%rdi), %rdi
	jns	.LBB12_102
# BB#106:                               # %lambda_2679233_vectorize.exit.i
                                        #   in Loop: Header=BB12_73 Depth=5
	testl	%r8d, %r8d
	jne	.LBB12_73
	.p2align	4, 0x90
.LBB12_107:                             # %exit246.rv.i
                                        #   in Loop: Header=BB12_72 Depth=4
	movl	92(%rsp), %edi          # 4-byte Reload
	testl	%edi, %edi
	js	.LBB12_71
# BB#70:                                # %if_then240.rv.i
                                        #   in Loop: Header=BB12_72 Depth=4
	movq	944(%rsp), %rdx         # 8-byte Reload
	movl	%edx, %eax
	andl	$7, %eax
	movl	44(%rsp), %esi          # 4-byte Reload
	movl	%esi, 1184(%rsp,%rdx,4)
	movl	88(%rsp), %ecx          # 4-byte Reload
	movl	%ecx, 1664(%rsp,%rdx,4)
	movl	84(%rsp), %ecx          # 4-byte Reload
	movl	%ecx, 1632(%rsp,%rdx,4)
	movl	%edi, 1152(%rsp,%rdx,4)
	movl	$-1, 1600(%rsp,%rdx,4)
	vmovaps	256(%rsp), %ymm0
	vmovaps	%ymm0, 1568(%rsp)
	movl	%esi, 1568(%rsp,%rax,4)
	vmovdqa	1568(%rsp), %ymm0
	vmovdqa	%ymm0, 256(%rsp)
.LBB12_71:                              # %next245.rv.i
                                        #   in Loop: Header=BB12_72 Depth=4
	movq	952(%rsp), %rcx         # 8-byte Reload
	leal	-1(%rcx), %eax
	andl	%ecx, %eax
	movl	%eax, %ecx
	jne	.LBB12_72
	jmp	.LBB12_7
	.p2align	4, 0x90
.LBB12_13:                              # %while_head14.rv.i.preheader
                                        #   in Loop: Header=BB12_4 Depth=2
	movl	%r14d, %edx
	.p2align	4, 0x90
.LBB12_14:                              # %while_head14.rv.i
                                        #   Parent Loop BB12_2 Depth=1
                                        #     Parent Loop BB12_4 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	testl	%edx, %edx
	jle	.LBB12_15
# BB#16:                                # %while_body18.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movslq	%r11d, %rbx
	movl	1696(%rsp,%rbx,4), %r14d
	movq	%rbx, %rdi
	shlq	$5, %rdi
	vmovaps	2944(%rsp,%rdi), %ymm8
	leal	-1(%rbx), %ecx
	movslq	%edx, %rdx
	addq	$-1, %rdx
	shlq	$8, %rdx
	movslq	192(%r9,%rdx), %rsi
	testq	%rsi, %rsi
	je	.LBB12_17
# BB#18:                                # %if_else21.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	vbroadcastss	(%r9,%rdx), %ymm0
	vmovaps	352(%rsp), %ymm7        # 32-byte Reload
	vfmsub213ps	%ymm7, %ymm2, %ymm0
	vbroadcastss	64(%r9,%rdx), %ymm3
	vfmsub213ps	%ymm15, %ymm4, %ymm3
	vbroadcastss	128(%r9,%rdx), %ymm5
	vfmsub213ps	%ymm14, %ymm9, %ymm5
	vbroadcastss	32(%r9,%rdx), %ymm6
	vfmsub213ps	%ymm7, %ymm2, %ymm6
	vbroadcastss	96(%r9,%rdx), %ymm7
	vfmsub213ps	%ymm15, %ymm4, %ymm7
	vbroadcastss	160(%r9,%rdx), %ymm10
	vpminsd	%ymm6, %ymm0, %ymm11
	vpmaxsd	%ymm0, %ymm6, %ymm0
	vfmsub213ps	%ymm14, %ymm9, %ymm10
	vpminsd	%ymm7, %ymm3, %ymm6
	vpmaxsd	%ymm3, %ymm7, %ymm3
	vpminsd	%ymm10, %ymm5, %ymm7
	vpmaxsd	%ymm5, %ymm10, %ymm5
	vpmaxsd	%ymm11, %ymm6, %ymm6
	vpminsd	%ymm3, %ymm0, %ymm3
	vpmaxsd	%ymm7, %ymm1, %ymm0
	vpminsd	256(%rsp), %ymm5, %ymm5
	vpmaxsd	%ymm6, %ymm0, %ymm0
	vpminsd	%ymm5, %ymm3, %ymm3
	vpcmpgtd	%ymm3, %ymm0, %ymm3
	vmovmskps	%ymm3, %eax
	xorl	%r8d, %r8d
	cmpl	$255, %eax
	jne	.LBB12_20
# BB#19:                                #   in Loop: Header=BB12_14 Depth=3
	movl	%ecx, %r11d
	jmp	.LBB12_23
	.p2align	4, 0x90
.LBB12_20:                              # %if_then24.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	vpxor	%ymm12, %ymm3, %ymm3
	vblendvps	%ymm3, %ymm0, %ymm13, %ymm0
	vcmpltps	%ymm8, %ymm0, %ymm3
	vptest	%ymm3, %ymm3
	jne	.LBB12_22
# BB#21:                                # %if_else25.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	leaq	2944(%rsp,%rdi), %rax
	movl	%esi, 1696(%rsp,%rbx,4)
	vmovaps	%ymm0, (%rax)
	movl	$1, %r8d
	jmp	.LBB12_23
.LBB12_22:                              # %if_then_crit.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movl	%esi, %eax
	notl	%eax
	movq	%rsi, %rcx
	shlq	$8, %rcx
	cltq
	imulq	$208, %rax, %rax
	addq	32(%rsp), %rax          # 8-byte Folded Reload
	testl	%esi, %esi
	leaq	-256(%r9,%rcx), %rcx
	cmovsq	%rax, %rcx
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	prefetcht0	128(%rcx)
	prefetcht0	192(%rcx)
	movl	$1, %r8d
	vmovaps	%ymm0, %ymm8
	movl	%esi, %r14d
	.p2align	4, 0x90
.LBB12_23:                              # %next30.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movslq	196(%r9,%rdx), %rsi
	testq	%rsi, %rsi
	je	.LBB12_58
# BB#24:                                # %if_else33.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	vbroadcastss	4(%r9,%rdx), %ymm0
	vmovaps	352(%rsp), %ymm7        # 32-byte Reload
	vfmsub213ps	%ymm7, %ymm2, %ymm0
	vbroadcastss	68(%r9,%rdx), %ymm3
	vfmsub213ps	%ymm15, %ymm4, %ymm3
	vbroadcastss	132(%r9,%rdx), %ymm5
	vfmsub213ps	%ymm14, %ymm9, %ymm5
	vbroadcastss	36(%r9,%rdx), %ymm6
	vfmsub213ps	%ymm7, %ymm2, %ymm6
	vbroadcastss	100(%r9,%rdx), %ymm7
	vfmsub213ps	%ymm15, %ymm4, %ymm7
	vbroadcastss	164(%r9,%rdx), %ymm10
	vpminsd	%ymm6, %ymm0, %ymm11
	vpmaxsd	%ymm0, %ymm6, %ymm0
	vfmsub213ps	%ymm14, %ymm9, %ymm10
	vpminsd	%ymm7, %ymm3, %ymm6
	vpmaxsd	%ymm3, %ymm7, %ymm3
	vpminsd	%ymm10, %ymm5, %ymm7
	vpmaxsd	%ymm5, %ymm10, %ymm5
	vpmaxsd	%ymm11, %ymm6, %ymm6
	vpminsd	%ymm3, %ymm0, %ymm3
	vpmaxsd	%ymm7, %ymm1, %ymm0
	vpminsd	256(%rsp), %ymm5, %ymm5
	vpmaxsd	%ymm6, %ymm0, %ymm0
	vpminsd	%ymm5, %ymm3, %ymm3
	vpcmpgtd	%ymm3, %ymm0, %ymm3
	vmovmskps	%ymm3, %eax
	cmpl	$255, %eax
	je	.LBB12_28
# BB#25:                                # %if_then37.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	vpxor	%ymm12, %ymm3, %ymm3
	addl	$1, %r8d
	vblendvps	%ymm3, %ymm0, %ymm13, %ymm0
	vcmpltps	%ymm8, %ymm0, %ymm3
	vptest	%ymm3, %ymm3
	jne	.LBB12_27
# BB#26:                                # %if_else40.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movslq	%r11d, %rax
	addl	$1, %r11d
	movl	%esi, 1700(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm0, 2944(%rsp,%rax)
	jmp	.LBB12_28
.LBB12_27:                              # %if_then_crit41.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movq	%rsi, %rax
	shlq	$8, %rax
	movl	%esi, %ecx
	notl	%ecx
	movslq	%r11d, %rdi
	addl	$1, %r11d
	movslq	%ecx, %rcx
	imulq	$208, %rcx, %rcx
	addq	32(%rsp), %rcx          # 8-byte Folded Reload
	testl	%esi, %esi
	leaq	-256(%r9,%rax), %rax
	cmovsq	%rcx, %rax
	movl	%r14d, 1700(%rsp,%rdi,4)
	leaq	1(%rdi), %rcx
	shlq	$5, %rcx
	vmovaps	%ymm8, 2944(%rsp,%rcx)
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	vmovaps	%ymm0, %ymm8
	movl	%esi, %r14d
	.p2align	4, 0x90
.LBB12_28:                              # %next47.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movslq	200(%r9,%rdx), %rsi
	testq	%rsi, %rsi
	je	.LBB12_58
# BB#29:                                # %if_else50.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	vbroadcastss	8(%r9,%rdx), %ymm0
	vbroadcastss	72(%r9,%rdx), %ymm3
	vmovaps	352(%rsp), %ymm7        # 32-byte Reload
	vfmsub213ps	%ymm7, %ymm2, %ymm0
	vfmsub213ps	%ymm15, %ymm4, %ymm3
	vbroadcastss	136(%r9,%rdx), %ymm5
	vfmsub213ps	%ymm14, %ymm9, %ymm5
	vbroadcastss	40(%r9,%rdx), %ymm6
	vfmsub213ps	%ymm7, %ymm2, %ymm6
	vbroadcastss	104(%r9,%rdx), %ymm7
	vfmsub213ps	%ymm15, %ymm4, %ymm7
	vbroadcastss	168(%r9,%rdx), %ymm10
	vpminsd	%ymm6, %ymm0, %ymm11
	vpmaxsd	%ymm0, %ymm6, %ymm0
	vfmsub213ps	%ymm14, %ymm9, %ymm10
	vpminsd	%ymm7, %ymm3, %ymm6
	vpmaxsd	%ymm3, %ymm7, %ymm3
	vpminsd	%ymm10, %ymm5, %ymm7
	vpmaxsd	%ymm5, %ymm10, %ymm5
	vpmaxsd	%ymm11, %ymm6, %ymm6
	vpminsd	%ymm3, %ymm0, %ymm3
	vpmaxsd	%ymm7, %ymm1, %ymm0
	vpminsd	256(%rsp), %ymm5, %ymm5
	vpmaxsd	%ymm6, %ymm0, %ymm0
	vpminsd	%ymm5, %ymm3, %ymm3
	vpcmpgtd	%ymm3, %ymm0, %ymm3
	vmovmskps	%ymm3, %eax
	cmpl	$255, %eax
	je	.LBB12_33
# BB#30:                                # %if_then54.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	vpxor	%ymm12, %ymm3, %ymm3
	vblendvps	%ymm3, %ymm0, %ymm13, %ymm0
	addl	$1, %r8d
	vcmpltps	%ymm8, %ymm0, %ymm3
	vptest	%ymm3, %ymm3
	jne	.LBB12_32
# BB#31:                                # %if_else57.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movslq	%r11d, %rax
	addl	$1, %r11d
	movl	%esi, 1700(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm0, 2944(%rsp,%rax)
	jmp	.LBB12_33
.LBB12_32:                              # %if_then_crit58.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movl	%esi, %eax
	notl	%eax
	movq	%rsi, %rcx
	shlq	$8, %rcx
	movslq	%r11d, %rdi
	addl	$1, %r11d
	cltq
	imulq	$208, %rax, %rax
	addq	32(%rsp), %rax          # 8-byte Folded Reload
	testl	%esi, %esi
	leaq	-256(%r9,%rcx), %rcx
	cmovsq	%rax, %rcx
	movl	%r14d, 1700(%rsp,%rdi,4)
	leaq	1(%rdi), %rax
	shlq	$5, %rax
	vmovaps	%ymm8, 2944(%rsp,%rax)
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	prefetcht0	128(%rcx)
	prefetcht0	192(%rcx)
	vmovaps	%ymm0, %ymm8
	movl	%esi, %r14d
	.p2align	4, 0x90
.LBB12_33:                              # %next64.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movslq	204(%r9,%rdx), %rsi
	testq	%rsi, %rsi
	je	.LBB12_58
# BB#34:                                # %if_else67.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	vbroadcastss	12(%r9,%rdx), %ymm0
	vbroadcastss	76(%r9,%rdx), %ymm3
	vmovaps	352(%rsp), %ymm7        # 32-byte Reload
	vfmsub213ps	%ymm7, %ymm2, %ymm0
	vfmsub213ps	%ymm15, %ymm4, %ymm3
	vbroadcastss	140(%r9,%rdx), %ymm5
	vfmsub213ps	%ymm14, %ymm9, %ymm5
	vbroadcastss	44(%r9,%rdx), %ymm6
	vfmsub213ps	%ymm7, %ymm2, %ymm6
	vbroadcastss	108(%r9,%rdx), %ymm7
	vfmsub213ps	%ymm15, %ymm4, %ymm7
	vbroadcastss	172(%r9,%rdx), %ymm10
	vpminsd	%ymm6, %ymm0, %ymm11
	vpmaxsd	%ymm0, %ymm6, %ymm0
	vfmsub213ps	%ymm14, %ymm9, %ymm10
	vpminsd	%ymm7, %ymm3, %ymm6
	vpmaxsd	%ymm3, %ymm7, %ymm3
	vpminsd	%ymm10, %ymm5, %ymm7
	vpmaxsd	%ymm5, %ymm10, %ymm5
	vpmaxsd	%ymm11, %ymm6, %ymm6
	vpminsd	%ymm3, %ymm0, %ymm3
	vpmaxsd	%ymm7, %ymm1, %ymm0
	vpminsd	256(%rsp), %ymm5, %ymm5
	vpmaxsd	%ymm6, %ymm0, %ymm0
	vpminsd	%ymm5, %ymm3, %ymm3
	vpcmpgtd	%ymm3, %ymm0, %ymm3
	vmovmskps	%ymm3, %eax
	cmpl	$255, %eax
	je	.LBB12_38
# BB#35:                                # %if_then71.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	vpxor	%ymm12, %ymm3, %ymm3
	vblendvps	%ymm3, %ymm0, %ymm13, %ymm0
	addl	$1, %r8d
	vcmpltps	%ymm8, %ymm0, %ymm3
	vptest	%ymm3, %ymm3
	jne	.LBB12_37
# BB#36:                                # %if_else74.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movslq	%r11d, %rax
	addl	$1, %r11d
	movl	%esi, 1700(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm0, 2944(%rsp,%rax)
	jmp	.LBB12_38
.LBB12_37:                              # %if_then_crit75.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movl	%esi, %eax
	notl	%eax
	movq	%rsi, %rcx
	shlq	$8, %rcx
	movslq	%r11d, %rdi
	addl	$1, %r11d
	cltq
	imulq	$208, %rax, %rax
	addq	32(%rsp), %rax          # 8-byte Folded Reload
	testl	%esi, %esi
	leaq	-256(%r9,%rcx), %rcx
	cmovsq	%rax, %rcx
	movl	%r14d, 1700(%rsp,%rdi,4)
	leaq	1(%rdi), %rax
	shlq	$5, %rax
	vmovaps	%ymm8, 2944(%rsp,%rax)
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	prefetcht0	128(%rcx)
	prefetcht0	192(%rcx)
	vmovaps	%ymm0, %ymm8
	movl	%esi, %r14d
	.p2align	4, 0x90
.LBB12_38:                              # %next81.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movslq	208(%r9,%rdx), %rsi
	testq	%rsi, %rsi
	je	.LBB12_58
# BB#39:                                # %if_else84.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	vbroadcastss	16(%r9,%rdx), %ymm0
	vmovaps	352(%rsp), %ymm7        # 32-byte Reload
	vfmsub213ps	%ymm7, %ymm2, %ymm0
	vbroadcastss	80(%r9,%rdx), %ymm3
	vfmsub213ps	%ymm15, %ymm4, %ymm3
	vbroadcastss	144(%r9,%rdx), %ymm5
	vfmsub213ps	%ymm14, %ymm9, %ymm5
	vbroadcastss	48(%r9,%rdx), %ymm6
	vfmsub213ps	%ymm7, %ymm2, %ymm6
	vbroadcastss	112(%r9,%rdx), %ymm7
	vfmsub213ps	%ymm15, %ymm4, %ymm7
	vbroadcastss	176(%r9,%rdx), %ymm10
	vpminsd	%ymm6, %ymm0, %ymm11
	vpmaxsd	%ymm0, %ymm6, %ymm0
	vfmsub213ps	%ymm14, %ymm9, %ymm10
	vpminsd	%ymm7, %ymm3, %ymm6
	vpmaxsd	%ymm3, %ymm7, %ymm3
	vpminsd	%ymm10, %ymm5, %ymm7
	vpmaxsd	%ymm5, %ymm10, %ymm5
	vpmaxsd	%ymm11, %ymm6, %ymm6
	vpminsd	%ymm3, %ymm0, %ymm3
	vpmaxsd	%ymm7, %ymm1, %ymm0
	vpminsd	256(%rsp), %ymm5, %ymm5
	vpmaxsd	%ymm6, %ymm0, %ymm0
	vpminsd	%ymm5, %ymm3, %ymm3
	vpcmpgtd	%ymm3, %ymm0, %ymm3
	vmovmskps	%ymm3, %eax
	cmpl	$255, %eax
	je	.LBB12_43
# BB#40:                                # %if_then88.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	vpxor	%ymm12, %ymm3, %ymm3
	vblendvps	%ymm3, %ymm0, %ymm13, %ymm0
	addl	$1, %r8d
	vcmpltps	%ymm8, %ymm0, %ymm3
	vptest	%ymm3, %ymm3
	jne	.LBB12_42
# BB#41:                                # %if_else91.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movslq	%r11d, %rax
	addl	$1, %r11d
	movl	%esi, 1700(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm0, 2944(%rsp,%rax)
	jmp	.LBB12_43
.LBB12_42:                              # %if_then_crit92.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movl	%esi, %eax
	notl	%eax
	movq	%rsi, %rcx
	shlq	$8, %rcx
	movslq	%r11d, %rdi
	addl	$1, %r11d
	cltq
	imulq	$208, %rax, %rax
	addq	32(%rsp), %rax          # 8-byte Folded Reload
	testl	%esi, %esi
	leaq	-256(%r9,%rcx), %rcx
	cmovsq	%rax, %rcx
	movl	%r14d, 1700(%rsp,%rdi,4)
	leaq	1(%rdi), %rax
	shlq	$5, %rax
	vmovaps	%ymm8, 2944(%rsp,%rax)
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	prefetcht0	128(%rcx)
	prefetcht0	192(%rcx)
	vmovaps	%ymm0, %ymm8
	movl	%esi, %r14d
	.p2align	4, 0x90
.LBB12_43:                              # %next98.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movslq	212(%r9,%rdx), %rsi
	testq	%rsi, %rsi
	je	.LBB12_58
# BB#44:                                # %if_else101.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	vbroadcastss	20(%r9,%rdx), %ymm0
	vmovaps	352(%rsp), %ymm7        # 32-byte Reload
	vfmsub213ps	%ymm7, %ymm2, %ymm0
	vbroadcastss	84(%r9,%rdx), %ymm3
	vfmsub213ps	%ymm15, %ymm4, %ymm3
	vbroadcastss	148(%r9,%rdx), %ymm5
	vfmsub213ps	%ymm14, %ymm9, %ymm5
	vbroadcastss	52(%r9,%rdx), %ymm6
	vfmsub213ps	%ymm7, %ymm2, %ymm6
	vbroadcastss	116(%r9,%rdx), %ymm7
	vfmsub213ps	%ymm15, %ymm4, %ymm7
	vbroadcastss	180(%r9,%rdx), %ymm10
	vpminsd	%ymm6, %ymm0, %ymm11
	vpmaxsd	%ymm0, %ymm6, %ymm0
	vfmsub213ps	%ymm14, %ymm9, %ymm10
	vpminsd	%ymm7, %ymm3, %ymm6
	vpmaxsd	%ymm3, %ymm7, %ymm3
	vpminsd	%ymm10, %ymm5, %ymm7
	vpmaxsd	%ymm5, %ymm10, %ymm5
	vpmaxsd	%ymm11, %ymm6, %ymm6
	vpminsd	%ymm3, %ymm0, %ymm3
	vpmaxsd	%ymm7, %ymm1, %ymm0
	vpminsd	256(%rsp), %ymm5, %ymm5
	vpmaxsd	%ymm6, %ymm0, %ymm0
	vpminsd	%ymm5, %ymm3, %ymm3
	vpcmpgtd	%ymm3, %ymm0, %ymm3
	vmovmskps	%ymm3, %eax
	cmpl	$255, %eax
	je	.LBB12_48
# BB#45:                                # %if_then105.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	vpxor	%ymm12, %ymm3, %ymm3
	vblendvps	%ymm3, %ymm0, %ymm13, %ymm0
	addl	$1, %r8d
	vcmpltps	%ymm8, %ymm0, %ymm3
	vptest	%ymm3, %ymm3
	jne	.LBB12_47
# BB#46:                                # %if_else108.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movslq	%r11d, %rax
	addl	$1, %r11d
	movl	%esi, 1700(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm0, 2944(%rsp,%rax)
	jmp	.LBB12_48
.LBB12_47:                              # %if_then_crit109.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movq	%rsi, %rax
	shlq	$8, %rax
	movl	%esi, %ecx
	notl	%ecx
	movslq	%r11d, %rdi
	addl	$1, %r11d
	movslq	%ecx, %rcx
	imulq	$208, %rcx, %rcx
	addq	32(%rsp), %rcx          # 8-byte Folded Reload
	testl	%esi, %esi
	leaq	-256(%r9,%rax), %rax
	cmovsq	%rcx, %rax
	movl	%r14d, 1700(%rsp,%rdi,4)
	leaq	1(%rdi), %rcx
	shlq	$5, %rcx
	vmovaps	%ymm8, 2944(%rsp,%rcx)
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	vmovaps	%ymm0, %ymm8
	movl	%esi, %r14d
	.p2align	4, 0x90
.LBB12_48:                              # %next115.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movslq	216(%r9,%rdx), %rsi
	testq	%rsi, %rsi
	je	.LBB12_58
# BB#49:                                # %if_else118.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	vbroadcastss	24(%r9,%rdx), %ymm0
	vmovaps	352(%rsp), %ymm7        # 32-byte Reload
	vfmsub213ps	%ymm7, %ymm2, %ymm0
	vbroadcastss	88(%r9,%rdx), %ymm3
	vfmsub213ps	%ymm15, %ymm4, %ymm3
	vbroadcastss	152(%r9,%rdx), %ymm5
	vfmsub213ps	%ymm14, %ymm9, %ymm5
	vbroadcastss	56(%r9,%rdx), %ymm6
	vfmsub213ps	%ymm7, %ymm2, %ymm6
	vbroadcastss	120(%r9,%rdx), %ymm7
	vfmsub213ps	%ymm15, %ymm4, %ymm7
	vbroadcastss	184(%r9,%rdx), %ymm10
	vpminsd	%ymm6, %ymm0, %ymm11
	vpmaxsd	%ymm0, %ymm6, %ymm0
	vfmsub213ps	%ymm14, %ymm9, %ymm10
	vpminsd	%ymm7, %ymm3, %ymm6
	vpmaxsd	%ymm3, %ymm7, %ymm3
	vpminsd	%ymm10, %ymm5, %ymm7
	vpmaxsd	%ymm5, %ymm10, %ymm5
	vpmaxsd	%ymm11, %ymm6, %ymm6
	vpminsd	%ymm3, %ymm0, %ymm3
	vpmaxsd	%ymm7, %ymm1, %ymm0
	vpminsd	256(%rsp), %ymm5, %ymm5
	vpmaxsd	%ymm6, %ymm0, %ymm0
	vpminsd	%ymm5, %ymm3, %ymm3
	vpcmpgtd	%ymm3, %ymm0, %ymm3
	vmovmskps	%ymm3, %eax
	cmpl	$255, %eax
	je	.LBB12_53
# BB#50:                                # %if_then122.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	vpxor	%ymm12, %ymm3, %ymm3
	vblendvps	%ymm3, %ymm0, %ymm13, %ymm0
	addl	$1, %r8d
	vcmpltps	%ymm8, %ymm0, %ymm3
	vptest	%ymm3, %ymm3
	jne	.LBB12_52
# BB#51:                                # %if_else125.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movslq	%r11d, %rax
	addl	$1, %r11d
	movl	%esi, 1700(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm0, 2944(%rsp,%rax)
	jmp	.LBB12_53
.LBB12_52:                              # %if_then_crit126.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movl	%esi, %eax
	notl	%eax
	movq	%rsi, %rcx
	shlq	$8, %rcx
	movslq	%r11d, %rdi
	addl	$1, %r11d
	cltq
	imulq	$208, %rax, %rax
	addq	32(%rsp), %rax          # 8-byte Folded Reload
	testl	%esi, %esi
	leaq	-256(%r9,%rcx), %rcx
	cmovsq	%rax, %rcx
	movl	%r14d, 1700(%rsp,%rdi,4)
	leaq	1(%rdi), %rax
	shlq	$5, %rax
	vmovaps	%ymm8, 2944(%rsp,%rax)
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	prefetcht0	128(%rcx)
	prefetcht0	192(%rcx)
	vmovaps	%ymm0, %ymm8
	movl	%esi, %r14d
	.p2align	4, 0x90
.LBB12_53:                              # %next132.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movslq	220(%r9,%rdx), %rsi
	testq	%rsi, %rsi
	je	.LBB12_58
# BB#54:                                # %if_else135.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	vbroadcastss	28(%r9,%rdx), %ymm0
	vmovaps	352(%rsp), %ymm7        # 32-byte Reload
	vfmsub213ps	%ymm7, %ymm2, %ymm0
	vbroadcastss	92(%r9,%rdx), %ymm3
	vfmsub213ps	%ymm15, %ymm4, %ymm3
	vbroadcastss	156(%r9,%rdx), %ymm5
	vfmsub213ps	%ymm14, %ymm9, %ymm5
	vbroadcastss	60(%r9,%rdx), %ymm6
	vfmsub213ps	%ymm7, %ymm2, %ymm6
	vbroadcastss	124(%r9,%rdx), %ymm7
	vfmsub213ps	%ymm15, %ymm4, %ymm7
	vbroadcastss	188(%r9,%rdx), %ymm10
	vpminsd	%ymm6, %ymm0, %ymm11
	vpmaxsd	%ymm0, %ymm6, %ymm0
	vfmsub213ps	%ymm14, %ymm9, %ymm10
	vpminsd	%ymm7, %ymm3, %ymm6
	vpmaxsd	%ymm3, %ymm7, %ymm3
	vpminsd	%ymm10, %ymm5, %ymm7
	vpmaxsd	%ymm5, %ymm10, %ymm5
	vpmaxsd	%ymm11, %ymm6, %ymm6
	vpminsd	%ymm3, %ymm0, %ymm3
	vpmaxsd	%ymm7, %ymm1, %ymm0
	vpminsd	256(%rsp), %ymm5, %ymm5
	vpmaxsd	%ymm6, %ymm0, %ymm0
	vpminsd	%ymm5, %ymm3, %ymm3
	vpcmpgtd	%ymm3, %ymm0, %ymm3
	vmovmskps	%ymm3, %eax
	cmpl	$255, %eax
	je	.LBB12_58
# BB#55:                                # %if_then139.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	vpxor	%ymm12, %ymm3, %ymm3
	vblendvps	%ymm3, %ymm0, %ymm13, %ymm0
	addl	$1, %r8d
	vcmpltps	%ymm8, %ymm0, %ymm3
	vptest	%ymm3, %ymm3
	jne	.LBB12_57
# BB#56:                                # %if_else142.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movslq	%r11d, %rax
	addl	$1, %r11d
	movl	%esi, 1700(%rsp,%rax,4)
	addq	$1, %rax
	shlq	$5, %rax
	vmovaps	%ymm0, 2944(%rsp,%rax)
	jmp	.LBB12_58
.LBB12_57:                              # %if_then_crit143.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movq	%rsi, %rax
	shlq	$8, %rax
	movl	%esi, %ecx
	notl	%ecx
	movslq	%ecx, %rcx
	imulq	$208, %rcx, %rcx
	addq	32(%rsp), %rcx          # 8-byte Folded Reload
	testl	%esi, %esi
	leaq	-256(%r9,%rax), %rax
	cmovsq	%rcx, %rax
	movslq	%r11d, %rcx
	addl	$1, %r11d
	movl	%r14d, 1700(%rsp,%rcx,4)
	addq	$1, %rcx
	shlq	$5, %rcx
	vmovaps	%ymm8, 2944(%rsp,%rcx)
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	vmovaps	%ymm0, %ymm8
	movl	%esi, %r14d
	.p2align	4, 0x90
.LBB12_58:                              # %unlikely_cont_cascading_cascading.rv.i
                                        #   in Loop: Header=BB12_14 Depth=3
	movl	%r14d, %edx
	testl	%r8d, %r8d
	jne	.LBB12_14
	jmp	.LBB12_59
	.p2align	4, 0x90
.LBB12_15:                              #   in Loop: Header=BB12_4 Depth=2
	movl	%edx, %r14d
	testl	%r14d, %r14d
	jns	.LBB12_3
	jmp	.LBB12_60
	.p2align	4, 0x90
.LBB12_17:                              #   in Loop: Header=BB12_4 Depth=2
	movl	%ecx, %r11d
.LBB12_59:                              # %break164.rv.i
                                        #   in Loop: Header=BB12_4 Depth=2
	testl	%r14d, %r14d
	jns	.LBB12_3
.LBB12_60:                              # %if_then168.rv.i
                                        #   in Loop: Header=BB12_4 Depth=2
	movl	%r14d, %eax
	notl	%eax
	movslq	%r11d, %r11
	movslq	%eax, %r8
	movl	1696(%rsp,%r11,4), %r14d
	movq	%r11, %rax
	shlq	$5, %rax
	vmovaps	2944(%rsp,%rax), %ymm8
	addl	$-1, %r11d
	imulq	$208, %r8, %rdx
	addq	336(%rsp), %rdx         # 8-byte Folded Reload
.LBB12_61:                              # %while_head169.rv.i
                                        #   Parent Loop BB12_2 Depth=1
                                        #     Parent Loop BB12_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB12_62 Depth 4
	movq	%rdx, %rsi
	xorl	%ecx, %ecx
	jmp	.LBB12_62
.LBB12_64:                              # %if_else_crit179.rv.i
                                        #   in Loop: Header=BB12_62 Depth=4
	vpand	%ymm7, %ymm6, %ymm1
	vmulps	160(%rsp), %ymm3, %ymm3 # 32-byte Folded Reload
	vcmpneq_usps	%ymm2, %ymm4, %ymm6
	vmulps	960(%rsp), %ymm4, %ymm7 # 32-byte Folded Reload
	vfmadd132ps	192(%rsp), %ymm3, %ymm15 # 32-byte Folded Reload
	vfmadd132ps	96(%rsp), %ymm15, %ymm11 # 32-byte Folded Reload
	vmulps	256(%rsp), %ymm4, %ymm10
	vxorps	%ymm11, %ymm5, %ymm3
	vcmpleps	%ymm10, %ymm3, %ymm5
	vcmpleps	%ymm3, %ymm7, %ymm7
	vandps	%ymm6, %ymm5, %ymm5
	vandps	%ymm7, %ymm5, %ymm5
	vptest	%ymm5, %ymm1
	je	.LBB12_66
# BB#65:                                # %if_else_crit184.rv.i
                                        #   in Loop: Header=BB12_62 Depth=4
	vrcpps	%ymm4, %ymm6
	vpand	%ymm1, %ymm5, %ymm5
	vmovaps	1376(%rsp), %ymm1       # 32-byte Reload
	vfnmadd213ps	%ymm1, %ymm6, %ymm4
	vfmadd132ps	%ymm6, %ymm6, %ymm4
	vblendvps	%ymm5, %ymm4, %ymm1, %ymm6
	vmulps	%ymm6, %ymm3, %ymm3
	vpbroadcastd	.LCPI12_11(%rip), %ymm7
	vpand	%ymm7, %ymm0, %ymm0
	vmulps	%ymm6, %ymm13, %ymm7
	vmulps	%ymm6, %ymm12, %ymm6
	vpcmpeqd	%ymm2, %ymm5, %ymm5
	vpxor	.LCPI12_13, %ymm5, %ymm5
	vmaskmovps	%ymm3, %ymm5, 1184(%rsp)
	vmaskmovps	%ymm7, %ymm5, 1664(%rsp)
	vmaskmovps	%ymm6, %ymm5, 1632(%rsp)
	vpmaskmovd	%ymm0, %ymm5, 1152(%rsp)
	vpmaskmovd	%ymm0, %ymm5, 1600(%rsp)
	vmaskmovps	%ymm3, %ymm5, 256(%rsp)
	jmp	.LBB12_66
	.p2align	4, 0x90
.LBB12_62:                              # %if_then175.rv.i
                                        #   Parent Loop BB12_2 Depth=1
                                        #     Parent Loop BB12_4 Depth=2
                                        #       Parent Loop BB12_61 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	(%rsi), %eax
	vmovd	%eax, %xmm0
	vpbroadcastd	%xmm0, %ymm0
	cmpl	$-1, %eax
	je	.LBB12_68
# BB#63:                                # %if_else176.rv.i
                                        #   in Loop: Header=BB12_62 Depth=4
	vbroadcastss	-48(%rsi), %ymm3
	vbroadcastss	-32(%rsi), %ymm1
	vmovaps	2272(%rsp), %ymm2       # 32-byte Reload
	vmovaps	%ymm1, 160(%rsp)        # 32-byte Spill
	vmulps	%ymm1, %ymm2, %ymm12
	vmovaps	2304(%rsp), %ymm1       # 32-byte Reload
	vmovaps	%ymm3, 192(%rsp)        # 32-byte Spill
	vfmadd231ps	%ymm3, %ymm1, %ymm12
	vbroadcastss	-16(%rsi), %ymm3
	vmovaps	2240(%rsp), %ymm9       # 32-byte Reload
	vmovaps	%ymm3, 96(%rsp)         # 32-byte Spill
	vfmadd231ps	%ymm3, %ymm9, %ymm12
	vbroadcastsd	.LCPI12_10(%rip), %ymm3
	vandps	%ymm3, %ymm12, %ymm4
	vbroadcastss	-128(%rsi), %ymm5
	vbroadcastss	-96(%rsi), %ymm6
	vbroadcastss	-144(%rsi), %ymm7
	vbroadcastss	-192(%rsi), %ymm13
	vbroadcastss	-160(%rsi), %ymm11
	vbroadcastss	-176(%rsi), %ymm3
	vsubps	1472(%rsp), %ymm3, %ymm3 # 32-byte Folded Reload
	vmulps	%ymm3, %ymm9, %ymm10
	vsubps	1440(%rsp), %ymm11, %ymm11 # 32-byte Folded Reload
	vsubps	1504(%rsp), %ymm13, %ymm15 # 32-byte Folded Reload
	vfmsub231ps	%ymm11, %ymm2, %ymm10
	vmulps	%ymm10, %ymm7, %ymm7
	vmulps	%ymm10, %ymm6, %ymm6
	vmulps	%ymm11, %ymm1, %ymm10
	vfmsub231ps	%ymm15, %ymm9, %ymm10
	vfmadd213ps	%ymm7, %ymm10, %ymm5
	vbroadcastss	-80(%rsi), %ymm7
	vfmadd231ps	%ymm10, %ymm7, %ymm6
	vbroadcastss	-112(%rsi), %ymm7
	vmulps	%ymm15, %ymm2, %ymm10
	vfmsub231ps	%ymm3, %ymm1, %ymm10
	vfmadd213ps	%ymm5, %ymm10, %ymm7
	vbroadcastss	-64(%rsi), %ymm13
	vandps	1408(%rsp), %ymm12, %ymm5 # 32-byte Folded Reload
	vfmadd231ps	%ymm10, %ymm13, %ymm6
	vxorps	%ymm7, %ymm5, %ymm12
	vxorps	%ymm6, %ymm5, %ymm13
	vxorps	%ymm1, %ymm1, %ymm1
	vcmpleps	%ymm12, %ymm1, %ymm6
	vxorps	%ymm2, %ymm2, %ymm2
	vcmpleps	%ymm13, %ymm1, %ymm7
	vandps	%ymm6, %ymm7, %ymm6
	vaddps	%ymm12, %ymm13, %ymm7
	vcmpleps	%ymm4, %ymm7, %ymm7
	vptest	%ymm7, %ymm6
	jne	.LBB12_64
.LBB12_66:                              # %next189.rv.i
                                        #   in Loop: Header=BB12_62 Depth=4
	addq	$1, %rcx
	addq	$4, %rsi
	cmpq	$4, %rcx
	vmovaps	1536(%rsp), %ymm15      # 32-byte Reload
	jl	.LBB12_62
# BB#67:                                # %if_else172.rv.i
                                        #   in Loop: Header=BB12_61 Depth=3
	imulq	$208, %r8, %rax
	addq	$1, %r8
	addq	$208, %rdx
	movq	32(%rsp), %rcx          # 8-byte Reload
	cmpl	$0, 204(%rcx,%rax)
	jns	.LBB12_61
	jmp	.LBB12_68
.LBB12_8:                               #   in Loop: Header=BB12_2 Depth=1
	movq	320(%rsp), %r10         # 8-byte Reload
	vpcmpeqd	%ymm12, %ymm12, %ymm12
	vmovaps	1024(%rsp), %ymm13      # 32-byte Reload
	.p2align	4, 0x90
.LBB12_9:                               # %exit
                                        #   in Loop: Header=BB12_2 Depth=1
	vmovaps	1184(%rsp), %ymm0
	vmovaps	1664(%rsp), %ymm1
	vmovaps	1632(%rsp), %ymm2
	vmovaps	1152(%rsp), %ymm3
	movq	%r10, %rax
	shlq	$7, %rax
	movq	928(%rsp), %rcx         # 8-byte Reload
	vmovups	%ymm3, (%rcx,%rax)
	vmovups	%ymm0, 32(%rcx,%rax)
	vmovups	%ymm1, 64(%rcx,%rax)
	vmovups	%ymm2, 96(%rcx,%rax)
	movq	936(%rsp), %rsp         # 8-byte Reload
	addq	$1, %r10
	cmpq	232(%rsp), %r10         # 8-byte Folded Reload
	jl	.LBB12_2
.LBB12_10:                              # %if_else
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.Lfunc_end12:
	.size	cpu_intersect_bvh8_tri4_hybrid8_avx2, .Lfunc_end12-cpu_intersect_bvh8_tri4_hybrid8_avx2
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI12_0:
	.quad	.LBB12_94
	.quad	.LBB12_93
	.quad	.LBB12_92
	.quad	.LBB12_91
	.quad	.LBB12_90
	.quad	.LBB12_88

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI13_0:
	.long	2147483647              # float NaN
.LCPI13_1:
	.long	841731191               # float 9.99999993E-9
.LCPI13_2:
	.long	1065353216              # float 1
.LCPI13_3:
	.long	2147483648              # float -0
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI13_4:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
.LCPI13_5:
	.zero	16
	.text
	.globl	cpu_occluded_bvh4_single_avx2
	.p2align	4, 0x90
	.type	cpu_occluded_bvh4_single_avx2,@function
cpu_occluded_bvh4_single_avx2:          # @cpu_occluded_bvh4_single_avx2
# BB#0:                                 # %cpu_occluded_bvh4_single_avx2_start
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$856, %rsp              # imm = 0x358
	movq	%rdx, 56(%rsp)          # 8-byte Spill
	movq	%rsi, 48(%rsp)          # 8-byte Spill
	testl	%ecx, %ecx
	jle	.LBB13_39
# BB#1:                                 # %if_then.lr.ph
	movq	(%rdi), %rbx
	movq	8(%rdi), %rax
	movq	%rax, -8(%rsp)          # 8-byte Spill
	movl	%ecx, %eax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	xorl	%esi, %esi
	vbroadcastss	.LCPI13_0(%rip), %xmm2
	vmovss	.LCPI13_1(%rip), %xmm3  # xmm3 = mem[0],zero,zero,zero
	vbroadcastss	.LCPI13_3(%rip), %xmm0
	vmovaps	%xmm0, 128(%rsp)        # 16-byte Spill
                                        # implicit-def: %EAX
	movl	%eax, -120(%rsp)        # 4-byte Spill
                                        # implicit-def: %EAX
	movl	%eax, -124(%rsp)        # 4-byte Spill
	vmovaps	%xmm2, 144(%rsp)        # 16-byte Spill
	movq	%rbx, -104(%rsp)        # 8-byte Spill
	jmp	.LBB13_3
.LBB13_2:                               # %lambda_2672495_vectorize.exit.thread
                                        #   in Loop: Header=BB13_3 Depth=1
	tzcntl	%edi, %eax
	vrcpps	%xmm2, %xmm1
	vmovaps	%xmm2, %xmm3
	vbroadcastss	.LCPI13_2(%rip), %xmm2
	vfnmadd213ps	%xmm2, %xmm1, %xmm3
	vfmadd132ps	%xmm1, %xmm1, %xmm3
	vmulps	%xmm13, %xmm3, %xmm0
	movl	192(%rdx,%rax,4), %ecx
                                        # kill: %EAX<def> %EAX<kill> %RAX<kill> %RAX<def>
	andl	$3, %eax
	vmulps	%xmm5, %xmm3, %xmm1
	vmulps	%xmm7, %xmm3, %xmm2
	movl	$2147483647, %edx       # imm = 0x7FFFFFFF
	andl	%edx, %ecx
	vmovaps	%xmm0, 272(%rsp)
	movl	272(%rsp,%rax,4), %edi
	vmovaps	%xmm1, 288(%rsp)
	movl	288(%rsp,%rax,4), %edx
	movl	%edx, -120(%rsp)        # 4-byte Spill
	vmovaps	%xmm2, 304(%rsp)
	movl	304(%rsp,%rax,4), %eax
	movl	%eax, -124(%rsp)        # 4-byte Spill
	movq	-40(%rsp), %rsi         # 8-byte Reload
	jmp	.LBB13_38
	.p2align	4, 0x90
.LBB13_3:                               # %if_then
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB13_13 Depth 2
                                        #       Child Loop BB13_16 Depth 3
                                        #         Child Loop BB13_25 Depth 4
                                        #           Child Loop BB13_19 Depth 5
                                        #       Child Loop BB13_32 Depth 3
	movq	%rsi, %rcx
	shlq	$5, %rcx
	movq	48(%rsp), %rax          # 8-byte Reload
	vmovss	(%rax,%rcx), %xmm8      # xmm8 = mem[0],zero,zero,zero
	vmovss	4(%rax,%rcx), %xmm4     # xmm4 = mem[0],zero,zero,zero
	vmovss	8(%rax,%rcx), %xmm5     # xmm5 = mem[0],zero,zero,zero
	vmovss	16(%rax,%rcx), %xmm7    # xmm7 = mem[0],zero,zero,zero
	vmovss	20(%rax,%rcx), %xmm6    # xmm6 = mem[0],zero,zero,zero
	vmovss	24(%rax,%rcx), %xmm13   # xmm13 = mem[0],zero,zero,zero
	movl	12(%rax,%rcx), %ebp
	movl	28(%rax,%rcx), %eax
	vandps	%xmm2, %xmm7, %xmm0
	vucomiss	%xmm3, %xmm0
	jae	.LBB13_5
# BB#4:                                 # %if_then.i
                                        #   in Loop: Header=BB13_3 Depth=1
	vmovmskps	%xmm7, %ecx
	shll	$31, %ecx
	orl	$841731191, %ecx        # imm = 0x322BCC77
	vmovd	%ecx, %xmm0
	jmp	.LBB13_6
	.p2align	4, 0x90
.LBB13_5:                               # %if_else.i
                                        #   in Loop: Header=BB13_3 Depth=1
	vmovss	.LCPI13_2(%rip), %xmm0  # xmm0 = mem[0],zero,zero,zero
	vdivss	%xmm7, %xmm0, %xmm0
.LBB13_6:                               # %safe_rcp_cont
                                        #   in Loop: Header=BB13_3 Depth=1
	vandps	%xmm2, %xmm6, %xmm1
	vucomiss	%xmm3, %xmm1
	jae	.LBB13_8
# BB#7:                                 # %if_then.i37
                                        #   in Loop: Header=BB13_3 Depth=1
	vmovmskps	%xmm6, %ecx
	shll	$31, %ecx
	orl	$841731191, %ecx        # imm = 0x322BCC77
	vmovd	%ecx, %xmm1
	jmp	.LBB13_9
	.p2align	4, 0x90
.LBB13_8:                               # %if_else.i36
                                        #   in Loop: Header=BB13_3 Depth=1
	vmovss	.LCPI13_2(%rip), %xmm1  # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm6, %xmm1, %xmm1
.LBB13_9:                               # %safe_rcp_cont1
                                        #   in Loop: Header=BB13_3 Depth=1
	vandps	%xmm2, %xmm13, %xmm2
	vucomiss	%xmm3, %xmm2
	movq	%rsi, -40(%rsp)         # 8-byte Spill
	jae	.LBB13_11
# BB#10:                                # %if_then.i34
                                        #   in Loop: Header=BB13_3 Depth=1
	vmovmskps	%xmm13, %ecx
	shll	$31, %ecx
	orl	$841731191, %ecx        # imm = 0x322BCC77
	vmovd	%ecx, %xmm2
	jmp	.LBB13_12
	.p2align	4, 0x90
.LBB13_11:                              # %if_else.i33
                                        #   in Loop: Header=BB13_3 Depth=1
	vmovss	.LCPI13_2(%rip), %xmm2  # xmm2 = mem[0],zero,zero,zero
	vdivss	%xmm13, %xmm2, %xmm2
.LBB13_12:                              # %body
                                        #   in Loop: Header=BB13_3 Depth=1
	xorl	%edx, %edx
	vxorps	%xmm3, %xmm3, %xmm3
	vucomiss	%xmm3, %xmm13
	seta	%dl
	xorl	%ecx, %ecx
	vucomiss	%xmm3, %xmm6
	seta	%cl
	xorl	%r8d, %r8d
	vucomiss	%xmm3, %xmm7
	seta	%r8b
	vmulss	%xmm2, %xmm5, %xmm3
	vmovaps	%xmm6, -80(%rsp)        # 16-byte Spill
	vmulss	%xmm1, %xmm4, %xmm6
	vmovaps	%xmm5, -96(%rsp)        # 16-byte Spill
	vmovaps	128(%rsp), %xmm5        # 16-byte Reload
	vmovaps	%xmm4, -64(%rsp)        # 16-byte Spill
	vxorps	%xmm5, %xmm3, %xmm4
	vxorps	%xmm5, %xmm6, %xmm3
	vmulss	%xmm0, %xmm8, %xmm6
	vxorps	%xmm5, %xmm6, %xmm6
	movl	$0, 600(%rsp)
	movl	$2139095039, 344(%rsp)  # imm = 0x7F7FFFFF
	shll	$4, %ecx
	shll	$4, %edx
	shlq	$4, %r8
	movl	%r8d, %r11d
	xorl	$16, %r11d
	leal	32(%rcx), %r14d
	xorl	$48, %ecx
	leal	64(%rdx), %r15d
	xorl	$80, %edx
	movl	%eax, -116(%rsp)        # 4-byte Spill
	vmovd	%eax, %xmm15
	vmovd	%ebp, %xmm5
	vbroadcastss	%xmm0, %xmm10
	vbroadcastss	%xmm1, %xmm14
	vbroadcastss	%xmm2, %xmm12
	vbroadcastss	%xmm6, %xmm9
	vbroadcastss	%xmm3, %xmm3
	vbroadcastss	%xmm4, %xmm4
	vpbroadcastd	%xmm5, %xmm11
	vmovaps	%xmm8, %xmm1
	vpbroadcastd	%xmm15, %xmm8
	vbroadcastss	%xmm7, %xmm0
	vmovaps	%xmm0, 64(%rsp)         # 16-byte Spill
	vbroadcastss	-80(%rsp), %xmm0 # 16-byte Folded Reload
	vmovaps	%xmm0, (%rsp)           # 16-byte Spill
	vbroadcastss	%xmm13, %xmm0
	vmovaps	%xmm0, 256(%rsp)        # 16-byte Spill
	vbroadcastss	-96(%rsp), %xmm0 # 16-byte Folded Reload
	vmovaps	%xmm0, 240(%rsp)        # 16-byte Spill
	vbroadcastss	%xmm1, %xmm0
	vmovaps	%xmm0, 224(%rsp)        # 16-byte Spill
	vbroadcastss	-64(%rsp), %xmm0 # 16-byte Folded Reload
	vmovaps	%xmm0, 208(%rsp)        # 16-byte Spill
	xorl	%r10d, %r10d
	movl	$1, %esi
	movq	%rdx, -112(%rsp)        # 8-byte Spill
.LBB13_13:                              # %while_head1.rv.i.preheader.preheader
                                        #   Parent Loop BB13_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB13_16 Depth 3
                                        #         Child Loop BB13_25 Depth 4
                                        #           Child Loop BB13_19 Depth 5
                                        #       Child Loop BB13_32 Depth 3
	movl	%esi, %r13d
	movl	%r10d, %r12d
	jmp	.LBB13_16
.LBB13_14:                              # %if_then35.rv.i
                                        #   in Loop: Header=BB13_16 Depth=3
	vmovd	%ebp, %xmm0
	movslq	%r12d, %r10
	movl	600(%rsp,%r10,4), %esi
	movl	344(%rsp,%r10,4), %ebp
	addl	$-1, %r10d
	vucomiss	%xmm0, %xmm15
	ja	.LBB13_31
	jmp	.LBB13_30
.LBB13_15:                              # %break.rv.i.break31.rv.i_crit_edge
                                        #   in Loop: Header=BB13_16 Depth=3
	leal	-1(%r12,%rbx), %r10d
	movl	%esi, %r13d
	movq	-104(%rsp), %rbx        # 8-byte Reload
	movq	-112(%rsp), %rdx        # 8-byte Reload
	jmp	.LBB13_29
	.p2align	4, 0x90
.LBB13_16:                              # %while_head1.rv.i.preheader
                                        #   Parent Loop BB13_3 Depth=1
                                        #     Parent Loop BB13_13 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB13_25 Depth 4
                                        #           Child Loop BB13_19 Depth 5
	testl	%r13d, %r13d
	jg	.LBB13_25
	jmp	.LBB13_14
.LBB13_18:                              # %if_then.rv.i.preheader
                                        #   in Loop: Header=BB13_25 Depth=4
	movslq	%r10d, %rdx
	leaq	348(%rsp), %rax
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, -32(%rsp)         # 8-byte Spill
	leaq	604(%rsp), %rax
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB13_19:                              # %if_then.rv.i
                                        #   Parent Loop BB13_3 Depth=1
                                        #     Parent Loop BB13_13 Depth=2
                                        #       Parent Loop BB13_16 Depth=3
                                        #         Parent Loop BB13_25 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	tzcntl	%edi, %eax
	movslq	96(%r9,%rax,4), %r13
	testq	%r13, %r13
	je	.LBB13_23
# BB#20:                                # %if_else24.rv.i
                                        #   in Loop: Header=BB13_19 Depth=5
	movq	%rax, -64(%rsp)         # 8-byte Spill
	movl	%r13d, %eax
	notl	%eax
	movq	%r13, %rdx
	movq	%rdx, -96(%rsp)         # 8-byte Spill
	shlq	$7, -96(%rsp)           # 8-byte Folded Spill
	cltq
	imulq	$208, %rax, %rax
	addq	-8(%rsp), %rax          # 8-byte Folded Reload
	testl	%r13d, %r13d
	movq	%rbx, -80(%rsp)         # 8-byte Spill
	movq	-104(%rsp), %rbx        # 8-byte Reload
	movq	-96(%rsp), %rdx         # 8-byte Reload
	leaq	-128(%rbx,%rdx), %rbx
	cmovsq	%rax, %rbx
	prefetcht0	(%rbx)
	prefetcht0	64(%rbx)
	movq	-80(%rsp), %rbx         # 8-byte Reload
	leal	-1(%rdi), %eax
	movl	%eax, -96(%rsp)         # 4-byte Spill
	movq	-64(%rsp), %rax         # 8-byte Reload
	andl	$3, %eax
	movq	%rax, -64(%rsp)         # 8-byte Spill
	movq	16(%rsp), %rax          # 8-byte Reload
	movl	%esi, (%rax,%rbx,4)
	movq	-32(%rsp), %rsi         # 8-byte Reload
	movl	%ebp, (%rsi,%rbx,4)
	leaq	1(%rbx), %rbx
	vmovdqa	%xmm5, 320(%rsp)
	movq	-64(%rsp), %rax         # 8-byte Reload
	movl	320(%rsp,%rax,4), %ebp
	movl	-96(%rsp), %eax         # 4-byte Reload
	andl	%edi, %eax
	movl	%eax, %edi
	movl	%r13d, %esi
	jne	.LBB13_19
# BB#21:                                # %while_head1.rv.i.backedge.loopexit
                                        #   in Loop: Header=BB13_25 Depth=4
	addl	%ebx, %r10d
.LBB13_22:                              # %while_head1.rv.i.backedge
                                        #   in Loop: Header=BB13_25 Depth=4
	movq	-104(%rsp), %rbx        # 8-byte Reload
	movq	-112(%rsp), %rdx        # 8-byte Reload
	jmp	.LBB13_28
.LBB13_23:                              # %break.rv.i
                                        #   in Loop: Header=BB13_25 Depth=4
	testl	%ebx, %ebx
	je	.LBB13_15
# BB#24:                                # %break.rv.i.while_head1.rv.i.backedge_crit_edge
                                        #   in Loop: Header=BB13_25 Depth=4
	movl	%r10d, %r10d
	addq	%rbx, %r10
	movl	%esi, %r13d
	jmp	.LBB13_22
	.p2align	4, 0x90
.LBB13_25:                              # %while_body5.rv.i
                                        #   Parent Loop BB13_3 Depth=1
                                        #     Parent Loop BB13_13 Depth=2
                                        #       Parent Loop BB13_16 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB13_19 Depth 5
	vmovd	%ebp, %xmm5
	movslq	%r12d, %r10
	movl	600(%rsp,%r10,4), %esi
	movl	344(%rsp,%r10,4), %ebp
	addl	$-1, %r10d
	vucomiss	%xmm5, %xmm15
	jbe	.LBB13_27
# BB#26:                                # %if_else.rv.i
                                        #   in Loop: Header=BB13_25 Depth=4
	movslq	%r13d, %r9
	addq	$-1, %r9
	shlq	$7, %r9
	addq	%rbx, %r9
	vmovaps	(%r11,%r9), %xmm5
	vfmadd213ps	%xmm9, %xmm10, %xmm5
	vmovaps	(%r8,%r9), %xmm7
	vfmadd213ps	%xmm9, %xmm10, %xmm7
	vmovaps	(%rcx,%r9), %xmm6
	vfmadd213ps	%xmm3, %xmm14, %xmm6
	vmovaps	(%r14,%r9), %xmm1
	vfmadd213ps	%xmm3, %xmm14, %xmm1
	vmovaps	(%rdx,%r9), %xmm2
	vfmadd213ps	%xmm4, %xmm12, %xmm2
	vmovaps	(%r15,%r9), %xmm0
	vfmadd213ps	%xmm4, %xmm12, %xmm0
	vpmaxsd	%xmm5, %xmm6, %xmm5
	vpminsd	%xmm1, %xmm7, %xmm1
	vpmaxsd	%xmm2, %xmm11, %xmm2
	vpminsd	%xmm8, %xmm0, %xmm0
	vpmaxsd	%xmm5, %xmm2, %xmm5
	vpminsd	%xmm0, %xmm1, %xmm0
	vpcmpgtd	%xmm0, %xmm5, %xmm0
	vmovmskps	%xmm0, %edi
	xorl	$15, %edi
	jne	.LBB13_18
.LBB13_27:                              #   in Loop: Header=BB13_25 Depth=4
	movl	%esi, %r13d
.LBB13_28:                              # %while_head1.rv.i.backedge
                                        #   in Loop: Header=BB13_25 Depth=4
	movl	%r10d, %r12d
	testl	%r13d, %r13d
	jg	.LBB13_25
.LBB13_29:                              # %break31.rv.i
                                        #   in Loop: Header=BB13_16 Depth=3
	movl	%r10d, %r12d
	movl	%r13d, %esi
	testl	%r13d, %r13d
	js	.LBB13_14
.LBB13_30:                              # %while_head.rv.i.backedge
                                        #   in Loop: Header=BB13_16 Depth=3
	movl	%esi, %r13d
	movl	%r10d, %r12d
	testl	%esi, %esi
	jne	.LBB13_16
	jmp	.LBB13_37
	.p2align	4, 0x90
.LBB13_31:                              # %head.rv.i.preheader
                                        #   in Loop: Header=BB13_13 Depth=2
	notl	%r13d
	movslq	%r13d, %rax
	imulq	$208, %rax, %rdx
	addq	-8(%rsp), %rdx          # 8-byte Folded Reload
	.p2align	4, 0x90
.LBB13_32:                              # %while_head.rv.i5
                                        #   Parent Loop BB13_3 Depth=1
                                        #     Parent Loop BB13_13 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovaps	144(%rdx), %xmm1
	vmovaps	160(%rdx), %xmm0
	vmovaps	176(%rdx), %xmm6
	vmovaps	%xmm0, 192(%rsp)        # 16-byte Spill
	vmulps	(%rsp), %xmm0, %xmm0    # 16-byte Folded Reload
	vmovaps	64(%rsp), %xmm2         # 16-byte Reload
	vmovaps	%xmm1, 176(%rsp)        # 16-byte Spill
	vfmadd231ps	%xmm1, %xmm2, %xmm0
	vmovaps	256(%rsp), %xmm13       # 16-byte Reload
	vmovaps	%xmm6, 16(%rsp)         # 16-byte Spill
	vfmadd231ps	%xmm6, %xmm13, %xmm0
	vandps	.LCPI13_4(%rip), %xmm0, %xmm1
	vmovaps	%xmm1, -96(%rsp)        # 16-byte Spill
	vmovaps	(%rdx), %xmm1
	vmovaps	%xmm1, -80(%rsp)        # 16-byte Spill
	vmovaps	16(%rdx), %xmm1
	vmovaps	%xmm1, -32(%rsp)        # 16-byte Spill
	vmovaps	32(%rdx), %xmm1
	vbroadcastss	.LCPI13_3(%rip), %xmm6
	vandps	%xmm6, %xmm0, %xmm0
	vmovaps	%xmm0, -64(%rsp)        # 16-byte Spill
	vsubps	240(%rsp), %xmm1, %xmm5 # 16-byte Folded Reload
	vmulps	%xmm5, %xmm2, %xmm2
	vmovaps	-80(%rsp), %xmm0        # 16-byte Reload
	vsubps	224(%rsp), %xmm0, %xmm1 # 16-byte Folded Reload
	vmovaps	-32(%rsp), %xmm0        # 16-byte Reload
	vsubps	208(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
	vmulps	(%rsp), %xmm1, %xmm7    # 16-byte Folded Reload
	vmulps	%xmm0, %xmm13, %xmm6
	vmovaps	%xmm0, -32(%rsp)        # 16-byte Spill
	vfmsub231ps	64(%rsp), %xmm0, %xmm7 # 16-byte Folded Reload
	vmovaps	%xmm1, 160(%rsp)        # 16-byte Spill
	vfmsub231ps	%xmm1, %xmm13, %xmm2
	vmulps	112(%rdx), %xmm2, %xmm1
	vmovaps	%xmm5, -80(%rsp)        # 16-byte Spill
	vfmsub231ps	(%rsp), %xmm5, %xmm6 # 16-byte Folded Reload
	vmulps	64(%rdx), %xmm2, %xmm0
	vfmadd231ps	96(%rdx), %xmm6, %xmm1
	vfmadd231ps	48(%rdx), %xmm6, %xmm0
	vfmadd231ps	128(%rdx), %xmm7, %xmm1
	vfmadd231ps	80(%rdx), %xmm7, %xmm0
	vmovaps	-64(%rsp), %xmm2        # 16-byte Reload
	vxorps	%xmm1, %xmm2, %xmm5
	vmovaps	%xmm2, %xmm6
	vxorps	%xmm0, %xmm2, %xmm7
	vxorps	%xmm1, %xmm1, %xmm1
	vcmpleps	%xmm5, %xmm1, %xmm0
	vcmpleps	%xmm7, %xmm1, %xmm1
	vandps	%xmm0, %xmm1, %xmm0
	vaddps	%xmm7, %xmm5, %xmm1
	vmovaps	-96(%rsp), %xmm2        # 16-byte Reload
	vcmpleps	%xmm2, %xmm1, %xmm13
	vmovaps	%xmm2, %xmm1
	vptest	%xmm13, %xmm0
	jne	.LBB13_34
.LBB13_33:                              # %next.rv.i31
                                        #   in Loop: Header=BB13_32 Depth=3
	cmpl	$0, 204(%rdx)
	leaq	208(%rdx), %rdx
	jns	.LBB13_32
	jmp	.LBB13_36
.LBB13_34:                              # %if_else_crit.rv.i24
                                        #   in Loop: Header=BB13_32 Depth=3
	vandps	%xmm13, %xmm0, %xmm0
	vmovaps	%xmm0, 112(%rsp)        # 16-byte Spill
	vcmpneq_usps	.LCPI13_5, %xmm1, %xmm0
	vmovaps	%xmm0, 96(%rsp)         # 16-byte Spill
	vmulps	%xmm1, %xmm8, %xmm0
	vmovaps	%xmm0, 80(%rsp)         # 16-byte Spill
	vmovaps	160(%rsp), %xmm0        # 16-byte Reload
	vmulps	176(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
	vmovaps	%xmm1, %xmm2
	vmulps	%xmm2, %xmm11, %xmm1
	vmovaps	-32(%rsp), %xmm13       # 16-byte Reload
	vfmadd132ps	192(%rsp), %xmm0, %xmm13 # 16-byte Folded Reload
	vmovaps	-80(%rsp), %xmm0        # 16-byte Reload
	vfmadd132ps	16(%rsp), %xmm13, %xmm0 # 16-byte Folded Reload
	vxorps	%xmm0, %xmm6, %xmm13
	vcmpleps	80(%rsp), %xmm13, %xmm0 # 16-byte Folded Reload
	vcmpleps	%xmm13, %xmm1, %xmm6
	vandps	96(%rsp), %xmm0, %xmm1  # 16-byte Folded Reload
	vmovdqa	112(%rsp), %xmm0        # 16-byte Reload
	vandps	%xmm6, %xmm1, %xmm1
	vptest	%xmm1, %xmm0
	je	.LBB13_33
# BB#35:                                # %if_else_crit5.rv.i
                                        #   in Loop: Header=BB13_32 Depth=3
	vpand	%xmm0, %xmm1, %xmm1
	vmovmskps	%xmm1, %edi
	testl	%edi, %edi
	je	.LBB13_33
	jmp	.LBB13_2
	.p2align	4, 0x90
.LBB13_36:                              # %while_head.rv.i.outer.loopexit
                                        #   in Loop: Header=BB13_13 Depth=2
	testl	%esi, %esi
	movq	-112(%rsp), %rdx        # 8-byte Reload
	jne	.LBB13_13
	.p2align	4, 0x90
.LBB13_37:                              #   in Loop: Header=BB13_3 Depth=1
	movl	$-1, %ecx
	movq	-40(%rsp), %rsi         # 8-byte Reload
	movl	-116(%rsp), %edi        # 4-byte Reload
.LBB13_38:                              # %exit
                                        #   in Loop: Header=BB13_3 Depth=1
	movq	%rsi, %rax
	shlq	$4, %rax
	addq	$1, %rsi
	movq	56(%rsp), %rdx          # 8-byte Reload
	movl	%ecx, (%rdx,%rax)
	movl	%edi, 4(%rdx,%rax)
	movl	-120(%rsp), %ecx        # 4-byte Reload
	movl	%ecx, 8(%rdx,%rax)
	movl	-124(%rsp), %ecx        # 4-byte Reload
	movl	%ecx, 12(%rdx,%rax)
	cmpq	40(%rsp), %rsi          # 8-byte Folded Reload
	vmovaps	144(%rsp), %xmm2        # 16-byte Reload
	vmovss	.LCPI13_1(%rip), %xmm3  # xmm3 = mem[0],zero,zero,zero
	jne	.LBB13_3
.LBB13_39:                              # %if_else
	addq	$856, %rsp              # imm = 0x358
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end13:
	.size	cpu_occluded_bvh4_single_avx2, .Lfunc_end13-cpu_occluded_bvh4_single_avx2

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI14_0:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI14_1:
	.long	2147483648              # 0x80000000
.LCPI14_2:
	.long	1065353216              # float 1
	.text
	.globl	lambda_2678206_vectorize
	.p2align	4, 0x90
	.type	lambda_2678206_vectorize,@function
lambda_2678206_vectorize:               # @lambda_2678206_vectorize
# BB#0:                                 # %lambda_2678206_start.rv
	subq	$24, %rsp
	notl	%ecx
	movslq	%edi, %rdi
	vbroadcastss	12(%r8), %xmm0
	vmovaps	%xmm0, -96(%rsp)        # 16-byte Spill
	vbroadcastss	16(%r8), %xmm0
	vmovaps	%xmm0, -112(%rsp)       # 16-byte Spill
	vbroadcastss	20(%r8), %xmm13
	vbroadcastss	4(%r8), %xmm0
	vmovaps	%xmm0, -48(%rsp)        # 16-byte Spill
	vbroadcastss	8(%r8), %xmm0
	vmovaps	%xmm0, -64(%rsp)        # 16-byte Spill
	vbroadcastss	(%r8), %xmm0
	vmovaps	%xmm0, -80(%rsp)        # 16-byte Spill
	movslq	%ecx, %rax
	imulq	$208, %rax, %rax
	addq	32(%rsp), %rax
	vbroadcastss	.LCPI14_1(%rip), %xmm0
	vmovaps	%xmm0, -128(%rsp)       # 16-byte Spill
	.p2align	4, 0x90
.LBB14_1:                               # %while_head.rv
                                        # =>This Inner Loop Header: Depth=1
	vmovaps	144(%rax,%rdi,4), %xmm7
	vmovaps	160(%rax,%rdi,4), %xmm6
	vmovaps	176(%rax,%rdi,4), %xmm14
	vmovaps	-112(%rsp), %xmm5       # 16-byte Reload
	vmulps	%xmm6, %xmm5, %xmm0
	vmovaps	-96(%rsp), %xmm2        # 16-byte Reload
	vfmadd231ps	%xmm7, %xmm2, %xmm0
	vfmadd231ps	%xmm14, %xmm13, %xmm0
	vandps	.LCPI14_0(%rip), %xmm0, %xmm15
	vmovaps	32(%rax,%rdi,4), %xmm3
	vmovaps	16(%rax,%rdi,4), %xmm4
	vmovaps	(%rax,%rdi,4), %xmm1
	vsubps	-48(%rsp), %xmm4, %xmm8 # 16-byte Folded Reload
	vmulps	%xmm8, %xmm13, %xmm4
	vandps	-128(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
	vsubps	-64(%rsp), %xmm3, %xmm9 # 16-byte Folded Reload
	vsubps	-80(%rsp), %xmm1, %xmm10 # 16-byte Folded Reload
	vmulps	%xmm9, %xmm2, %xmm1
	vmulps	%xmm10, %xmm5, %xmm3
	vfmsub231ps	%xmm9, %xmm5, %xmm4
	vfmsub231ps	%xmm10, %xmm13, %xmm1
	vmulps	112(%rax,%rdi,4), %xmm1, %xmm5
	vfmsub231ps	%xmm8, %xmm2, %xmm3
	vmulps	64(%rax,%rdi,4), %xmm1, %xmm1
	vfmadd231ps	96(%rax,%rdi,4), %xmm4, %xmm5
	vfmadd231ps	48(%rax,%rdi,4), %xmm4, %xmm1
	vfmadd231ps	128(%rax,%rdi,4), %xmm3, %xmm5
	vfmadd231ps	80(%rax,%rdi,4), %xmm3, %xmm1
	vxorps	%xmm5, %xmm0, %xmm3
	vxorps	%xmm1, %xmm0, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vcmpleps	%xmm3, %xmm5, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vcmpleps	%xmm4, %xmm5, %xmm5
	vandps	%xmm1, %xmm5, %xmm11
	vaddps	%xmm4, %xmm3, %xmm1
	vcmpleps	%xmm15, %xmm1, %xmm12
	vptest	%xmm12, %xmm11
	jne	.LBB14_2
.LBB14_5:                               # %next.rv
                                        #   in Loop: Header=BB14_1 Depth=1
	cmpl	$0, 204(%rax)
	leaq	208(%rax), %rax
	jns	.LBB14_1
	jmp	.LBB14_6
.LBB14_2:                               # %if_else_crit.rv
                                        #   in Loop: Header=BB14_1 Depth=1
	vpand	%xmm12, %xmm11, %xmm12
	vcmpneq_usps	%xmm2, %xmm15, %xmm1
	vbroadcastss	52(%r8), %xmm5
	vmulps	%xmm5, %xmm15, %xmm5
	vmulps	%xmm10, %xmm7, %xmm7
	vfmadd213ps	%xmm7, %xmm6, %xmm8
	vfmadd213ps	%xmm8, %xmm14, %xmm9
	vbroadcastss	48(%r8), %xmm6
	vmulps	%xmm6, %xmm15, %xmm6
	vxorps	%xmm9, %xmm0, %xmm0
	vcmpleps	%xmm5, %xmm0, %xmm5
	vcmpleps	%xmm0, %xmm6, %xmm6
	vandps	%xmm1, %xmm5, %xmm1
	vandps	%xmm6, %xmm1, %xmm5
	vptest	%xmm5, %xmm12
	je	.LBB14_5
# BB#3:                                 # %if_else_crit5.rv
                                        #   in Loop: Header=BB14_1 Depth=1
	vpand	%xmm12, %xmm5, %xmm1
	vmovmskps	%xmm1, %ecx
	testl	%ecx, %ecx
	je	.LBB14_5
# BB#4:                                 # %if_then.rv
	tzcntl	%ecx, %ecx
	vrcpps	%xmm15, %xmm1
	vbroadcastss	.LCPI14_2(%rip), %xmm2
	vfnmadd213ps	%xmm2, %xmm1, %xmm15
	vfmadd132ps	%xmm1, %xmm1, %xmm15
	vmulps	%xmm0, %xmm15, %xmm0
	movl	%ecx, %edi
	andl	$3, %edi
	vmovaps	%xmm0, -32(%rsp)
	vmovss	-32(%rsp,%rdi,4), %xmm0 # xmm0 = mem[0],zero,zero,zero
	vmulps	%xmm3, %xmm15, %xmm1
	vmovaps	%xmm1, -16(%rsp)
	vmovss	-16(%rsp,%rdi,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	vmulps	%xmm4, %xmm15, %xmm2
	vmovaps	%xmm2, (%rsp)
	vmovss	(%rsp,%rdi,4), %xmm2    # xmm2 = mem[0],zero,zero,zero
	movl	$2147483647, %edi       # imm = 0x7FFFFFFF
	andl	192(%rax,%rcx,4), %edi
	vmovss	%xmm0, (%rdx)
	vmovss	%xmm1, 4(%rdx)
	vmovss	%xmm2, 8(%rdx)
	movl	%edi, 12(%rdx)
	movb	$1, (%rsi)
	addq	$24, %rsp
	retq
.LBB14_6:                               # %break.rv
	addq	$24, %rsp
	retq
.Lfunc_end14:
	.size	lambda_2678206_vectorize, .Lfunc_end14-lambda_2678206_vectorize

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI15_0:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
.LCPI15_3:
	.zero	16
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI15_1:
	.long	2147483648              # 0x80000000
.LCPI15_2:
	.long	1065353216              # float 1
	.text
	.globl	lambda_2664871_vectorize
	.p2align	4, 0x90
	.type	lambda_2664871_vectorize,@function
lambda_2664871_vectorize:               # @lambda_2664871_vectorize
# BB#0:                                 # %lambda_2664871_start.rv
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, -24(%rsp)         # 8-byte Spill
	movq	104(%rsp), %rbp
	movl	(%rbp), %ecx
	testl	%ecx, %ecx
	je	.LBB15_14
# BB#1:                                 # %while_head1.rv.preheader.lr.ph
	movq	152(%rsp), %r12
	movq	144(%rsp), %r11
	movq	128(%rsp), %rbx
	addl	%edi, %r8d
	movl	168(%rsp), %r14d
	addl	%edi, %r14d
	movl	160(%rsp), %eax
	addl	%edi, %eax
	movq	%rsi, -72(%rsp)         # 8-byte Spill
	movl	136(%rsp), %r10d
	addl	%edi, %r10d
	addl	%edi, %r9d
	addl	96(%rsp), %edi
	movslq	%r9d, %r9
	movslq	%eax, %r13
	movq	%r11, %rax
	movslq	%r8d, %r8
	movslq	%edi, %r15
	movslq	%r10d, %r11
	movq	%r12, %rsi
	movq	-72(%rsp), %r10         # 8-byte Reload
	movslq	%r14d, %r12
	.p2align	4, 0x90
.LBB15_2:                               # %while_head1.rv.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB15_3 Depth 2
                                        #       Child Loop BB15_7 Depth 3
                                        #     Child Loop BB15_16 Depth 2
	testl	%ecx, %ecx
	jle	.LBB15_12
	.p2align	4, 0x90
.LBB15_3:                               # %while_body5.rv
                                        #   Parent Loop BB15_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB15_7 Depth 3
	vmovss	(%rsi), %xmm1           # xmm1 = mem[0],zero,zero,zero
	movslq	(%rdx), %rdi
	movl	(%r10,%rdi,4), %edi
	movl	%edi, (%rbp)
	movslq	(%rdx), %rdi
	movl	(%rax,%rdi,4), %edi
	movl	%edi, (%rsi)
	decl	(%rdx)
	vmovd	52(%rbx), %xmm0         # xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	jbe	.LBB15_4
# BB#5:                                 # %rv_align_cont.rv
                                        #   in Loop: Header=BB15_3 Depth=2
	movslq	%ecx, %rcx
	addq	$-1, %rcx
	shlq	$8, %rcx
	addq	112(%rsp), %rcx
	vbroadcastss	32(%rbx), %ymm1
	vbroadcastss	44(%rbx), %ymm2
	vmovaps	(%r11,%rcx), %ymm3
	vfmadd213ps	%ymm2, %ymm1, %ymm3
	vbroadcastss	24(%rbx), %ymm4
	vbroadcastss	28(%rbx), %ymm5
	vbroadcastss	36(%rbx), %ymm6
	vmovaps	(%r9,%rcx), %ymm7
	vfmadd213ps	%ymm6, %ymm4, %ymm7
	vfmadd231ps	(%r15,%rcx), %ymm4, %ymm6
	vbroadcastss	40(%rbx), %ymm4
	vmovaps	(%r13,%rcx), %ymm8
	vfmadd213ps	%ymm4, %ymm5, %ymm8
	vfmadd231ps	(%r12,%rcx), %ymm5, %ymm4
	vfmadd231ps	(%r8,%rcx), %ymm1, %ymm2
	vpbroadcastd	%xmm0, %ymm0
	vpminsd	%ymm0, %ymm3, %ymm1
	vpmaxsd	%ymm7, %ymm8, %ymm0
	vpminsd	%ymm4, %ymm6, %ymm3
	vpbroadcastd	48(%rbx), %ymm4
	vpmaxsd	%ymm2, %ymm4, %ymm2
	vpmaxsd	%ymm0, %ymm2, %ymm0
	vpminsd	%ymm1, %ymm3, %ymm1
	vpcmpgtd	%ymm1, %ymm0, %ymm1
	vmovmskps	%ymm1, %r14d
	xorl	$255, %r14d
	jne	.LBB15_6
.LBB15_4:                               # %while_head1.rv.backedge
                                        #   in Loop: Header=BB15_3 Depth=2
	movl	(%rbp), %ecx
	testl	%ecx, %ecx
	jg	.LBB15_3
	jmp	.LBB15_11
.LBB15_6:                               # %if_then.rv.preheader
                                        #   in Loop: Header=BB15_3 Depth=2
	movl	$0, -64(%rsp)           # 4-byte Folded Spill
	.p2align	4, 0x90
.LBB15_7:                               # %if_then.rv
                                        #   Parent Loop BB15_2 Depth=1
                                        #     Parent Loop BB15_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	tzcntl	%r14d, %edi
	movq	%rdi, -112(%rsp)        # 8-byte Spill
	movslq	192(%rcx,%rdi,4), %rdi
	testq	%rdi, %rdi
	je	.LBB15_9
# BB#8:                                 # %if_else24.rv
                                        #   in Loop: Header=BB15_7 Depth=3
	movq	%rdi, -96(%rsp)         # 8-byte Spill
                                        # kill: %EDI<def> %EDI<kill> %RDI<kill>
	notl	%edi
	movq	-96(%rsp), %rax         # 8-byte Reload
	movq	%rax, -128(%rsp)        # 8-byte Spill
	movslq	%edi, %rdi
	imulq	$208, %rdi, %rax
	shlq	$8, -128(%rsp)          # 8-byte Folded Spill
	addq	120(%rsp), %rax
	movq	%rax, -48(%rsp)         # 8-byte Spill
	cmpl	$0, -96(%rsp)           # 4-byte Folded Reload
	movq	112(%rsp), %rax
	movq	-128(%rsp), %rdi        # 8-byte Reload
	leaq	-256(%rax,%rdi), %rax
	cmovsq	-48(%rsp), %rax         # 8-byte Folded Reload
	prefetcht0	(%rax)
	prefetcht0	64(%rax)
	prefetcht0	128(%rax)
	prefetcht0	192(%rax)
	vmovss	-112(%rsp), %xmm1       # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	vpermps	%ymm0, %ymm1, %ymm1
	leal	-1(%r14), %eax
	movl	%eax, -128(%rsp)        # 4-byte Spill
	movslq	(%rdx), %rax
	leaq	1(%rax), %rdi
	addl	$-1, -64(%rsp)          # 4-byte Folded Spill
	movl	%edi, (%rdx)
	movl	(%rbp), %edi
	movl	%edi, 4(%r10,%rax,4)
	movl	(%rsi), %eax
	movl	%eax, -112(%rsp)        # 4-byte Spill
	movslq	(%rdx), %rdi
	movq	144(%rsp), %rax
	movl	-112(%rsp), %r10d       # 4-byte Reload
	movl	%r10d, (%rax,%rdi,4)
	movq	-72(%rsp), %r10         # 8-byte Reload
	movq	-96(%rsp), %rax         # 8-byte Reload
	movl	%eax, (%rbp)
	vmovss	%xmm1, (%rsi)
	movl	-128(%rsp), %eax        # 4-byte Reload
	andl	%r14d, %eax
	movl	%eax, %r14d
	movq	144(%rsp), %rax
	jne	.LBB15_7
	jmp	.LBB15_4
.LBB15_9:                               # %unlikely_cont29.rv
                                        #   in Loop: Header=BB15_3 Depth=2
	cmpl	$0, -64(%rsp)           # 4-byte Folded Reload
	jne	.LBB15_4
# BB#10:                                # %unlikely_cont29.rv.unlikely_cont34.rv.loopexit_crit_edge
                                        #   in Loop: Header=BB15_2 Depth=1
	movl	(%rbp), %ecx
	.p2align	4, 0x90
.LBB15_11:                              # %unlikely_cont34.rv
                                        #   in Loop: Header=BB15_2 Depth=1
	testl	%ecx, %ecx
	js	.LBB15_12
.LBB15_13:                              # %while_head.rv.backedge
                                        #   in Loop: Header=BB15_2 Depth=1
	movl	(%rbp), %ecx
	testl	%ecx, %ecx
	jne	.LBB15_2
	jmp	.LBB15_14
.LBB15_12:                              # %if_then37.rv
                                        #   in Loop: Header=BB15_2 Depth=1
	vmovss	(%rsi), %xmm1           # xmm1 = mem[0],zero,zero,zero
	movslq	(%rdx), %rax
	movl	(%r10,%rax,4), %eax
	movl	%eax, (%rbp)
	movslq	(%rdx), %rax
	movq	144(%rsp), %rdi
	movl	(%rdi,%rax,4), %eax
	movl	%eax, (%rsi)
	movq	144(%rsp), %rax
	decl	(%rdx)
	vmovss	52(%rbx), %xmm0         # xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	jbe	.LBB15_13
# BB#15:                                # %body.rv
                                        #   in Loop: Header=BB15_2 Depth=1
	notl	%ecx
	movslq	%ecx, %rax
	vbroadcastss	12(%rbx), %xmm13
	vbroadcastss	16(%rbx), %xmm14
	vbroadcastss	20(%rbx), %xmm4
	vbroadcastss	8(%rbx), %xmm1
	vmovaps	%xmm1, -96(%rsp)        # 16-byte Spill
	vbroadcastss	4(%rbx), %xmm1
	vmovaps	%xmm1, -128(%rsp)       # 16-byte Spill
	vbroadcastss	(%rbx), %xmm1
	vmovaps	%xmm1, -112(%rsp)       # 16-byte Spill
	vbroadcastss	%xmm0, %xmm0
	vmovaps	%xmm0, -64(%rsp)        # 16-byte Spill
	imulq	$208, %rax, %rcx
	addq	120(%rsp), %rcx
	.p2align	4, 0x90
.LBB15_16:                              # %while_head.rv.i
                                        #   Parent Loop BB15_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovaps	144(%rcx), %xmm0
	vmovaps	160(%rcx), %xmm15
	vmovaps	176(%rcx), %xmm2
	vmulps	%xmm15, %xmm14, %xmm1
	vfmadd231ps	%xmm0, %xmm13, %xmm1
	vmovaps	%xmm2, -48(%rsp)        # 16-byte Spill
	vfmadd231ps	%xmm2, %xmm4, %xmm1
	vandps	.LCPI15_0(%rip), %xmm1, %xmm7
	vmovaps	(%rcx), %xmm6
	vmovaps	16(%rcx), %xmm2
	vmovaps	32(%rcx), %xmm3
	vbroadcastss	.LCPI15_1(%rip), %xmm5
	vandps	%xmm5, %xmm1, %xmm5
	vsubps	-96(%rsp), %xmm3, %xmm8 # 16-byte Folded Reload
	vsubps	-128(%rsp), %xmm2, %xmm9 # 16-byte Folded Reload
	vsubps	-112(%rsp), %xmm6, %xmm10 # 16-byte Folded Reload
	vmulps	%xmm8, %xmm13, %xmm1
	vmulps	%xmm9, %xmm4, %xmm2
	vmulps	%xmm10, %xmm14, %xmm3
	vfmsub231ps	%xmm8, %xmm14, %xmm2
	vfmsub231ps	%xmm10, %xmm4, %xmm1
	vmulps	112(%rcx), %xmm1, %xmm6
	vfmsub231ps	%xmm9, %xmm13, %xmm3
	vmulps	64(%rcx), %xmm1, %xmm1
	vfmadd231ps	96(%rcx), %xmm2, %xmm6
	vfmadd231ps	48(%rcx), %xmm2, %xmm1
	vfmadd231ps	128(%rcx), %xmm3, %xmm6
	vfmadd231ps	80(%rcx), %xmm3, %xmm1
	vxorps	%xmm6, %xmm5, %xmm6
	vxorps	%xmm1, %xmm5, %xmm1
	vxorps	%xmm3, %xmm3, %xmm3
	vcmpleps	%xmm6, %xmm3, %xmm2
	vcmpleps	%xmm1, %xmm3, %xmm3
	vandps	%xmm2, %xmm3, %xmm11
	vaddps	%xmm1, %xmm6, %xmm2
	vcmpleps	%xmm7, %xmm2, %xmm12
	vptest	%xmm12, %xmm11
	jne	.LBB15_17
.LBB15_20:                              # %next.rv.i
                                        #   in Loop: Header=BB15_16 Depth=2
	cmpl	$0, 204(%rcx)
	leaq	208(%rcx), %rcx
	movq	144(%rsp), %rax
	jns	.LBB15_16
	jmp	.LBB15_13
.LBB15_17:                              # %if_else_crit.rv.i
                                        #   in Loop: Header=BB15_16 Depth=2
	vpand	%xmm12, %xmm11, %xmm12
	vcmpneq_usps	.LCPI15_3, %xmm7, %xmm11
	vmulps	%xmm10, %xmm0, %xmm0
	vfmadd213ps	%xmm0, %xmm15, %xmm9
	vfmadd132ps	-48(%rsp), %xmm9, %xmm8 # 16-byte Folded Reload
	vmulps	-64(%rsp), %xmm7, %xmm3 # 16-byte Folded Reload
	vbroadcastss	48(%rbx), %xmm0
	vmulps	%xmm0, %xmm7, %xmm2
	vxorps	%xmm8, %xmm5, %xmm0
	vcmpleps	%xmm3, %xmm0, %xmm3
	vcmpleps	%xmm0, %xmm2, %xmm5
	vandps	%xmm11, %xmm3, %xmm2
	vmovaps	%xmm7, %xmm3
	vandps	%xmm5, %xmm2, %xmm5
	vptest	%xmm5, %xmm12
	je	.LBB15_20
# BB#18:                                # %if_else_crit5.rv.i
                                        #   in Loop: Header=BB15_16 Depth=2
	vpand	%xmm12, %xmm5, %xmm2
	vmovmskps	%xmm2, %eax
	testl	%eax, %eax
	je	.LBB15_20
# BB#19:                                # %if_then.rv.i
	tzcntl	%eax, %eax
	vrcpps	%xmm3, %xmm2
	vmovaps	%xmm3, %xmm4
	vbroadcastss	.LCPI15_2(%rip), %xmm3
	vfnmadd213ps	%xmm3, %xmm2, %xmm4
	vfmadd132ps	%xmm2, %xmm2, %xmm4
	movl	%eax, %edx
	andl	$3, %edx
	vmulps	%xmm0, %xmm4, %xmm0
	vmovaps	%xmm0, -16(%rsp)
	vmovss	-16(%rsp,%rdx,4), %xmm0 # xmm0 = mem[0],zero,zero,zero
	vmulps	%xmm6, %xmm4, %xmm2
	vmovaps	%xmm2, (%rsp)
	vmovd	(%rsp,%rdx,4), %xmm2    # xmm2 = mem[0],zero,zero,zero
	vmulps	%xmm1, %xmm4, %xmm1
	vmovaps	%xmm1, 16(%rsp)
	vmovss	16(%rsp,%rdx,4), %xmm1  # xmm1 = mem[0],zero,zero,zero
	movl	$2147483647, %edx       # imm = 0x7FFFFFFF
	andl	192(%rcx,%rax,4), %edx
	movq	-24(%rsp), %rax         # 8-byte Reload
	vmovss	%xmm0, (%rax)
	vmovd	%xmm2, 4(%rax)
	vmovss	%xmm1, 8(%rax)
	movl	%edx, 12(%rax)
.LBB15_14:                              # %exit.rv
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.Lfunc_end15:
	.size	lambda_2664871_vectorize, .Lfunc_end15-lambda_2664871_vectorize

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI16_0:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
.LCPI16_3:
	.zero	16
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI16_1:
	.long	2147483648              # 0x80000000
.LCPI16_2:
	.long	1065353216              # float 1
	.text
	.globl	lambda_2670059_vectorize
	.p2align	4, 0x90
	.type	lambda_2670059_vectorize,@function
lambda_2670059_vectorize:               # @lambda_2670059_vectorize
# BB#0:                                 # %lambda_2670059_start.rv
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movq	128(%rsp), %r11
	movl	(%r11), %ebx
	testl	%ebx, %ebx
	je	.LBB16_14
# BB#1:                                 # %while_head1.rv.preheader.lr.ph
	movq	136(%rsp), %rax
	movq	96(%rsp), %r15
	addl	%edi, %edx
	movl	144(%rsp), %r14d
	addl	%edi, %r14d
	addl	%edi, %esi
	movl	80(%rsp), %ebp
	addl	%edi, %ebp
	addl	%edi, %r9d
	addl	88(%rsp), %edi
	movslq	%r9d, %r9
	movslq	%ebp, %r10
	movslq	%edi, %r13
	movslq	%esi, %r12
	movslq	%r14d, %r14
	movq	%r15, %rbp
	movq	120(%rsp), %rsi
	movslq	%edx, %rdx
	.p2align	4, 0x90
.LBB16_2:                               # %while_head1.rv.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB16_3 Depth 2
                                        #       Child Loop BB16_7 Depth 3
                                        #     Child Loop BB16_16 Depth 2
	testl	%ebx, %ebx
	jle	.LBB16_12
	.p2align	4, 0x90
.LBB16_3:                               # %while_body5.rv
                                        #   Parent Loop BB16_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB16_7 Depth 3
	vmovss	(%r8), %xmm1            # xmm1 = mem[0],zero,zero,zero
	movslq	(%rax), %rdi
	movl	(%rbp,%rdi,4), %edi
	movl	%edi, (%r11)
	movslq	(%rax), %rdi
	movl	(%rsi,%rdi,4), %edi
	movl	%edi, (%r8)
	decl	(%rax)
	vmovd	52(%rcx), %xmm8         # xmm8 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm8
	jbe	.LBB16_4
# BB#5:                                 # %rv_align_cont.rv
                                        #   in Loop: Header=BB16_3 Depth=2
	movslq	%ebx, %rbx
	addq	$-1, %rbx
	shlq	$7, %rbx
	addq	104(%rsp), %rbx
	vbroadcastss	32(%rcx), %xmm1
	vbroadcastss	44(%rcx), %xmm2
	vmovaps	(%r14,%rbx), %xmm3
	vfmadd213ps	%xmm2, %xmm1, %xmm3
	vbroadcastss	24(%rcx), %xmm4
	vbroadcastss	28(%rcx), %xmm5
	vbroadcastss	36(%rcx), %xmm6
	vmovaps	(%r9,%rbx), %xmm7
	vfmadd213ps	%xmm6, %xmm4, %xmm7
	vfmadd231ps	(%r12,%rbx), %xmm4, %xmm6
	vbroadcastss	40(%rcx), %xmm4
	vmovaps	(%r10,%rbx), %xmm0
	vfmadd213ps	%xmm4, %xmm5, %xmm0
	vfmadd231ps	(%rdx,%rbx), %xmm5, %xmm4
	vfmadd231ps	(%r13,%rbx), %xmm1, %xmm2
	vpbroadcastd	%xmm8, %xmm1
	vpminsd	%xmm1, %xmm3, %xmm1
	vpmaxsd	%xmm7, %xmm0, %xmm0
	vpminsd	%xmm4, %xmm6, %xmm3
	vpbroadcastd	48(%rcx), %xmm4
	vpmaxsd	%xmm2, %xmm4, %xmm2
	vpmaxsd	%xmm0, %xmm2, %xmm0
	vpminsd	%xmm1, %xmm3, %xmm1
	vpcmpgtd	%xmm1, %xmm0, %xmm1
	vmovmskps	%xmm1, %r15d
	xorl	$15, %r15d
	jne	.LBB16_6
.LBB16_4:                               # %while_head1.rv.backedge
                                        #   in Loop: Header=BB16_3 Depth=2
	movl	(%r11), %ebx
	testl	%ebx, %ebx
	jg	.LBB16_3
	jmp	.LBB16_11
.LBB16_6:                               # %if_then.rv.preheader
                                        #   in Loop: Header=BB16_3 Depth=2
	movl	$0, -112(%rsp)          # 4-byte Folded Spill
	.p2align	4, 0x90
.LBB16_7:                               # %if_then.rv
                                        #   Parent Loop BB16_2 Depth=1
                                        #     Parent Loop BB16_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	tzcntl	%r15d, %edi
	movq	%rdi, -128(%rsp)        # 8-byte Spill
	movslq	96(%rbx,%rdi,4), %rdi
	testq	%rdi, %rdi
	je	.LBB16_9
# BB#8:                                 # %if_else24.rv
                                        #   in Loop: Header=BB16_7 Depth=3
	movq	%rdi, %rbp
	movq	%rbp, -96(%rsp)         # 8-byte Spill
	notl	%edi
	movq	%rbp, %rsi
	shlq	$7, %rsi
	movslq	%edi, %rdi
	imulq	$208, %rdi, %rdi
	addq	112(%rsp), %rdi
	testl	%ebp, %ebp
	movq	104(%rsp), %rbp
	leaq	-128(%rbp,%rsi), %rsi
	cmovsq	%rdi, %rsi
	prefetcht0	(%rsi)
	prefetcht0	64(%rsi)
	vmovdqa	%xmm0, (%rsp)
	movq	-128(%rsp), %rsi        # 8-byte Reload
	andl	$3, %esi
	vmovss	(%rsp,%rsi,4), %xmm1    # xmm1 = mem[0],zero,zero,zero
	leal	-1(%r15), %esi
	movl	%esi, -128(%rsp)        # 4-byte Spill
	movslq	(%rax), %rsi
	leaq	1(%rsi), %rdi
	addl	$-1, -112(%rsp)         # 4-byte Folded Spill
	movl	%edi, (%rax)
	movl	(%r11), %edi
	movq	96(%rsp), %rbp
	movl	%edi, 4(%rbp,%rsi,4)
	movl	(%r8), %ebp
	movslq	(%rax), %rdi
	movq	120(%rsp), %rsi
	movl	%ebp, (%rsi,%rdi,4)
	movq	120(%rsp), %rsi
	movq	-96(%rsp), %rdi         # 8-byte Reload
	movl	%edi, (%r11)
	vmovss	%xmm1, (%r8)
	movl	-128(%rsp), %edi        # 4-byte Reload
	andl	%r15d, %edi
	movl	%edi, %r15d
	movq	96(%rsp), %rbp
	jne	.LBB16_7
	jmp	.LBB16_4
.LBB16_9:                               # %unlikely_cont27.rv
                                        #   in Loop: Header=BB16_3 Depth=2
	cmpl	$0, -112(%rsp)          # 4-byte Folded Reload
	jne	.LBB16_4
# BB#10:                                # %unlikely_cont27.rv.unlikely_cont32.rv.loopexit_crit_edge
                                        #   in Loop: Header=BB16_2 Depth=1
	movl	(%r11), %ebx
	.p2align	4, 0x90
.LBB16_11:                              # %unlikely_cont32.rv
                                        #   in Loop: Header=BB16_2 Depth=1
	testl	%ebx, %ebx
	js	.LBB16_12
.LBB16_13:                              # %while_head.rv.backedge
                                        #   in Loop: Header=BB16_2 Depth=1
	movl	(%r11), %ebx
	testl	%ebx, %ebx
	jne	.LBB16_2
	jmp	.LBB16_14
.LBB16_12:                              # %if_then35.rv
                                        #   in Loop: Header=BB16_2 Depth=1
	vmovss	(%r8), %xmm1            # xmm1 = mem[0],zero,zero,zero
	movslq	(%rax), %rdi
	movl	(%rbp,%rdi,4), %edi
	movl	%edi, (%r11)
	movslq	(%rax), %rdi
	movl	(%rsi,%rdi,4), %edi
	movl	%edi, (%r8)
	decl	(%rax)
	vmovd	52(%rcx), %xmm0         # xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	jbe	.LBB16_13
# BB#15:                                # %body.rv
                                        #   in Loop: Header=BB16_2 Depth=1
	notl	%ebx
	movslq	%ebx, %rdi
	vbroadcastss	12(%rcx), %xmm15
	vbroadcastss	16(%rcx), %xmm3
	vbroadcastss	20(%rcx), %xmm4
	vbroadcastss	(%rcx), %xmm1
	vmovaps	%xmm1, -128(%rsp)       # 16-byte Spill
	vbroadcastss	8(%rcx), %xmm1
	vmovaps	%xmm1, -96(%rsp)        # 16-byte Spill
	vbroadcastss	4(%rcx), %xmm1
	vmovaps	%xmm1, -112(%rsp)       # 16-byte Spill
	vpbroadcastd	%xmm0, %xmm0
	vmovdqa	%xmm0, -80(%rsp)        # 16-byte Spill
	imulq	$208, %rdi, %rbx
	addq	112(%rsp), %rbx
	.p2align	4, 0x90
.LBB16_16:                              # %while_head.rv.i
                                        #   Parent Loop BB16_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovaps	144(%rbx), %xmm14
	vmovaps	160(%rbx), %xmm13
	vmovaps	176(%rbx), %xmm1
	vmulps	%xmm13, %xmm3, %xmm0
	vfmadd231ps	%xmm14, %xmm15, %xmm0
	vmovaps	%xmm1, -64(%rsp)        # 16-byte Spill
	vfmadd231ps	%xmm1, %xmm4, %xmm0
	vandps	.LCPI16_0(%rip), %xmm0, %xmm2
	vmovaps	(%rbx), %xmm1
	vmovaps	16(%rbx), %xmm5
	vmovaps	32(%rbx), %xmm6
	vsubps	-128(%rsp), %xmm1, %xmm10 # 16-byte Folded Reload
	vsubps	-96(%rsp), %xmm6, %xmm1 # 16-byte Folded Reload
	vbroadcastss	.LCPI16_1(%rip), %xmm6
	vandps	%xmm6, %xmm0, %xmm8
	vsubps	-112(%rsp), %xmm5, %xmm9 # 16-byte Folded Reload
	vmulps	%xmm10, %xmm3, %xmm0
	vmulps	%xmm1, %xmm15, %xmm5
	vmulps	%xmm9, %xmm4, %xmm6
	vfmsub231ps	%xmm9, %xmm15, %xmm0
	vfmsub231ps	%xmm10, %xmm4, %xmm5
	vmulps	112(%rbx), %xmm5, %xmm7
	vfmsub231ps	%xmm1, %xmm3, %xmm6
	vmulps	64(%rbx), %xmm5, %xmm5
	vfmadd231ps	96(%rbx), %xmm6, %xmm7
	vfmadd231ps	48(%rbx), %xmm6, %xmm5
	vfmadd231ps	128(%rbx), %xmm0, %xmm7
	vfmadd231ps	80(%rbx), %xmm0, %xmm5
	vxorps	%xmm7, %xmm8, %xmm0
	vxorps	%xmm5, %xmm8, %xmm5
	vxorps	%xmm7, %xmm7, %xmm7
	vcmpleps	%xmm0, %xmm7, %xmm6
	vcmpleps	%xmm5, %xmm7, %xmm7
	vandps	%xmm6, %xmm7, %xmm11
	vaddps	%xmm5, %xmm0, %xmm6
	vcmpleps	%xmm2, %xmm6, %xmm12
	vptest	%xmm12, %xmm11
	jne	.LBB16_17
.LBB16_20:                              # %next.rv.i
                                        #   in Loop: Header=BB16_16 Depth=2
	cmpl	$0, 204(%rbx)
	leaq	208(%rbx), %rbx
	movq	120(%rsp), %rsi
	movq	96(%rsp), %rbp
	jns	.LBB16_16
	jmp	.LBB16_13
.LBB16_17:                              # %if_else_crit.rv.i
                                        #   in Loop: Header=BB16_16 Depth=2
	vpand	%xmm12, %xmm11, %xmm12
	vcmpneq_usps	.LCPI16_3, %xmm2, %xmm11
	vbroadcastss	48(%rcx), %xmm7
	vmulps	%xmm7, %xmm2, %xmm7
	vmulps	%xmm10, %xmm14, %xmm6
	vfmadd213ps	%xmm6, %xmm13, %xmm9
	vmulps	-80(%rsp), %xmm2, %xmm6 # 16-byte Folded Reload
	vfmadd132ps	-64(%rsp), %xmm9, %xmm1 # 16-byte Folded Reload
	vxorps	%xmm1, %xmm8, %xmm1
	vcmpleps	%xmm6, %xmm1, %xmm6
	vcmpleps	%xmm1, %xmm7, %xmm7
	vandps	%xmm11, %xmm6, %xmm6
	vandps	%xmm7, %xmm6, %xmm6
	vmovaps	%xmm2, %xmm7
	vptest	%xmm6, %xmm12
	je	.LBB16_20
# BB#18:                                # %if_else_crit5.rv.i
                                        #   in Loop: Header=BB16_16 Depth=2
	vpand	%xmm12, %xmm6, %xmm6
	vmovmskps	%xmm6, %esi
	testl	%esi, %esi
	je	.LBB16_20
# BB#19:                                # %if_then.rv.i
	tzcntl	%esi, %eax
	vrcpps	%xmm7, %xmm2
	vbroadcastss	.LCPI16_2(%rip), %xmm3
	vfnmadd213ps	%xmm3, %xmm2, %xmm7
	vfmadd132ps	%xmm2, %xmm2, %xmm7
	movl	%eax, %ecx
	andl	$3, %ecx
	vmulps	%xmm1, %xmm7, %xmm1
	vmovaps	%xmm1, -48(%rsp)
	vmovss	-48(%rsp,%rcx,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	vmulps	%xmm0, %xmm7, %xmm0
	vmovaps	%xmm0, -32(%rsp)
	vmovd	-32(%rsp,%rcx,4), %xmm0 # xmm0 = mem[0],zero,zero,zero
	vmulps	%xmm5, %xmm7, %xmm2
	vmovaps	%xmm2, -16(%rsp)
	vmovd	-16(%rsp,%rcx,4), %xmm2 # xmm2 = mem[0],zero,zero,zero
	movl	$2147483647, %ecx       # imm = 0x7FFFFFFF
	andl	192(%rbx,%rax,4), %ecx
	movq	152(%rsp), %rax
	vmovss	%xmm1, (%rax)
	vmovd	%xmm0, 4(%rax)
	vmovd	%xmm2, 8(%rax)
	movl	%ecx, 12(%rax)
.LBB16_14:                              # %exit.rv
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end16:
	.size	lambda_2670059_vectorize, .Lfunc_end16-lambda_2670059_vectorize

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI17_0:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI17_1:
	.long	2147483648              # 0x80000000
.LCPI17_2:
	.long	1065353216              # float 1
.LCPI17_3:
	.long	2139095039              # float 3.40282347E+38
	.text
	.globl	lambda_2675440_vectorize
	.p2align	4, 0x90
	.type	lambda_2675440_vectorize,@function
lambda_2675440_vectorize:               # @lambda_2675440_vectorize
# BB#0:                                 # %lambda_2675440_start.rv
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%r9, -96(%rsp)          # 8-byte Spill
	movq	104(%rsp), %r15
	movl	(%r15), %ebx
	testl	%ebx, %ebx
	je	.LBB17_45
# BB#1:                                 # %while_head1.rv.preheader.lr.ph
	movq	112(%rsp), %r13
	movq	96(%rsp), %rbp
	movq	72(%rsp), %r12
	addl	%edi, %esi
	movl	120(%rsp), %r9d
	addl	%edi, %r9d
	movl	88(%rsp), %r11d
	addl	%edi, %r11d
	movl	128(%rsp), %r10d
	addl	%edi, %r10d
	movl	136(%rsp), %r14d
	addl	%edi, %r14d
	addl	64(%rsp), %edi
	movslq	%r11d, %rax
	movq	%rax, -72(%rsp)         # 8-byte Spill
	movslq	%r10d, %r10
	movq	%r12, %rax
	movslq	%r9d, %r9
	movslq	%edi, %r11
	movslq	%esi, %rsi
	movslq	%r14d, %r12
	movq	80(%rsp), %rdi
	leaq	192(%rdi), %rdi
	movq	%rdi, -88(%rsp)         # 8-byte Spill
	vmovaps	.LCPI17_0(%rip), %xmm8  # xmm8 = [9223372034707292159,9223372034707292159]
	vxorps	%xmm9, %xmm9, %xmm9
	movq	%r10, -120(%rsp)        # 8-byte Spill
	movq	%r9, -104(%rsp)         # 8-byte Spill
	jmp	.LBB17_9
.LBB17_2:                               # %unlikely_cont69.rv.unlikely_cont74.rv.loopexit_crit_edge
                                        #   in Loop: Header=BB17_9 Depth=1
	movl	(%r15), %ebx
	testl	%ebx, %ebx
	jns	.LBB17_44
.LBB17_3:                               # %if_then77.rv
                                        #   in Loop: Header=BB17_9 Depth=1
	vmovd	(%rdx), %xmm0           # xmm0 = mem[0],zero,zero,zero
	movslq	(%rcx), %rdi
	movl	(%rbp,%rdi,4), %edi
	movl	%edi, (%r15)
	movslq	(%rcx), %rdi
	movl	(%r8,%rdi,4), %edi
	movl	%edi, (%rdx)
	decl	(%rcx)
	vmovss	52(%r13), %xmm1         # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm0, %xmm1
	jbe	.LBB17_44
# BB#4:                                 # %body.rv
                                        #   in Loop: Header=BB17_9 Depth=1
	notl	%ebx
	movslq	%ebx, %rdi
	imulq	$208, %rdi, %rbx
	addq	-88(%rsp), %rbx         # 8-byte Folded Reload
	jmp	.LBB17_7
.LBB17_5:                               # %if_else_crit.rv.i
                                        #   in Loop: Header=BB17_7 Depth=2
	vpand	%xmm4, %xmm6, %xmm4
	vcmpneq_usps	%xmm9, %xmm10, %xmm1
	vmulps	%xmm3, %xmm14, %xmm0
	vbroadcastss	52(%r13), %xmm3
	vmulps	%xmm3, %xmm10, %xmm3
	vfmadd213ps	%xmm0, %xmm13, %xmm12
	vbroadcastss	48(%r13), %xmm0
	vmulps	%xmm0, %xmm10, %xmm6
	vfmadd213ps	%xmm12, %xmm11, %xmm2
	vxorps	%xmm2, %xmm15, %xmm0
	vcmpleps	%xmm3, %xmm0, %xmm2
	vcmpleps	%xmm0, %xmm6, %xmm3
	vandps	%xmm1, %xmm2, %xmm1
	vandps	%xmm3, %xmm1, %xmm1
	vptest	%xmm1, %xmm4
	je	.LBB17_8
# BB#6:                                 # %if_then.rv.i
                                        #   in Loop: Header=BB17_7 Depth=2
	vpand	%xmm4, %xmm1, %xmm1
	vrcpps	%xmm10, %xmm2
	vbroadcastss	.LCPI17_2(%rip), %xmm3
	vfnmadd213ps	%xmm3, %xmm2, %xmm10
	vfmadd132ps	%xmm2, %xmm2, %xmm10
	vmulps	%xmm0, %xmm10, %xmm0
	vbroadcastss	.LCPI17_3(%rip), %xmm2
	vblendvps	%xmm1, %xmm0, %xmm2, %xmm1
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vpminsd	%xmm2, %xmm1, %xmm2
	vpshufd	$57, %xmm2, %xmm3       # xmm3 = xmm2[1,2,3,0]
	vpminsd	%xmm3, %xmm2, %xmm2
	vcmpeqps	%xmm2, %xmm1, %xmm1
	vmovmskps	%xmm1, %edi
	movq	%rax, %rbp
	tzcntl	%edi, %r10d
	movl	%r10d, %edi
	andl	$3, %edi
	vmovaps	%xmm0, -64(%rsp)
	vmovss	-64(%rsp,%rdi,4), %xmm0 # xmm0 = mem[0],zero,zero,zero
	vmulps	%xmm7, %xmm10, %xmm1
	vmovaps	%xmm1, -48(%rsp)
	vmovss	-48(%rsp,%rdi,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	vmulps	%xmm5, %xmm10, %xmm2
	vmovaps	%xmm2, -32(%rsp)
	vmovss	-32(%rsp,%rdi,4), %xmm2 # xmm2 = mem[0],zero,zero,zero
	movl	(%rbx,%r10,4), %r10d
	movl	$2147483647, %edi       # imm = 0x7FFFFFFF
	andl	%edi, %r10d
	movq	-96(%rsp), %rdi         # 8-byte Reload
	vmovss	%xmm0, (%rdi)
	vmovss	%xmm1, 4(%rdi)
	vmovss	%xmm2, 8(%rdi)
	movl	%r10d, 12(%rdi)
	movq	-120(%rsp), %r10        # 8-byte Reload
	movq	96(%rsp), %rbp
	vmovss	%xmm0, 52(%r13)
	jmp	.LBB17_8
	.p2align	4, 0x90
.LBB17_7:                               # %while_head.rv.i
                                        #   Parent Loop BB17_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovaps	-48(%rbx), %xmm14
	vbroadcastss	12(%r13), %xmm5
	vmovaps	-32(%rbx), %xmm13
	vmovaps	-16(%rbx), %xmm11
	vbroadcastss	16(%r13), %xmm7
	vmulps	%xmm13, %xmm7, %xmm0
	vfmadd231ps	%xmm14, %xmm5, %xmm0
	vbroadcastss	20(%r13), %xmm4
	vfmadd231ps	%xmm11, %xmm4, %xmm0
	vandps	%xmm8, %xmm0, %xmm10
	vmovaps	-192(%rbx), %xmm3
	vmovaps	-176(%rbx), %xmm1
	vmovaps	-160(%rbx), %xmm2
	vbroadcastss	.LCPI17_1(%rip), %xmm6
	vandps	%xmm6, %xmm0, %xmm15
	vbroadcastss	4(%r13), %xmm6
	vsubps	%xmm6, %xmm1, %xmm12
	vbroadcastss	8(%r13), %xmm6
	vsubps	%xmm6, %xmm2, %xmm2
	vbroadcastss	(%r13), %xmm6
	vsubps	%xmm6, %xmm3, %xmm3
	vmulps	%xmm12, %xmm4, %xmm6
	vmulps	%xmm2, %xmm5, %xmm0
	vmulps	%xmm3, %xmm7, %xmm1
	vfmsub213ps	%xmm1, %xmm12, %xmm5
	vfmsub213ps	%xmm0, %xmm3, %xmm4
	vmulps	-80(%rbx), %xmm4, %xmm0
	vfmsub213ps	%xmm6, %xmm2, %xmm7
	vmulps	-128(%rbx), %xmm4, %xmm1
	vfmadd231ps	-96(%rbx), %xmm7, %xmm0
	vfmadd231ps	-144(%rbx), %xmm7, %xmm1
	vfmadd231ps	-64(%rbx), %xmm5, %xmm0
	vfmadd231ps	-112(%rbx), %xmm5, %xmm1
	vxorps	%xmm0, %xmm15, %xmm7
	vxorps	%xmm1, %xmm15, %xmm5
	vaddps	%xmm5, %xmm7, %xmm0
	vcmpleps	%xmm7, %xmm9, %xmm1
	vcmpleps	%xmm5, %xmm9, %xmm6
	vcmpleps	%xmm10, %xmm0, %xmm4
	vandps	%xmm1, %xmm6, %xmm6
	vptest	%xmm4, %xmm6
	jne	.LBB17_5
.LBB17_8:                               # %next.rv.i
                                        #   in Loop: Header=BB17_7 Depth=2
	cmpl	$0, 12(%rbx)
	leaq	208(%rbx), %rbx
	jns	.LBB17_7
	jmp	.LBB17_44
	.p2align	4, 0x90
.LBB17_9:                               # %while_head1.rv.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB17_40 Depth 2
                                        #       Child Loop BB17_11 Depth 3
                                        #     Child Loop BB17_7 Depth 2
	testl	%ebx, %ebx
	jg	.LBB17_40
	jmp	.LBB17_3
.LBB17_10:                              # %if_then.rv.preheader
                                        #   in Loop: Header=BB17_40 Depth=2
	movl	$0, -108(%rsp)          # 4-byte Folded Spill
	.p2align	4, 0x90
.LBB17_11:                              # %if_then.rv
                                        #   Parent Loop BB17_9 Depth=1
                                        #     Parent Loop BB17_40 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	tzcntl	%r14d, %r15d
	movslq	96(%rbx,%r15,4), %r9
	testq	%r9, %r9
	je	.LBB17_18
# BB#12:                                # %if_else24.rv
                                        #   in Loop: Header=BB17_11 Depth=3
	movq	%r9, %rdi
	shlq	$7, %rdi
	movq	%rdi, -80(%rsp)         # 8-byte Spill
	movl	%r9d, %edi
	notl	%edi
	movslq	%edi, %rdi
	imulq	$208, %rdi, %rdi
	addq	80(%rsp), %rdi
	movq	%r9, -128(%rsp)         # 8-byte Spill
	testl	%r9d, %r9d
	movq	%rax, %r10
	movq	-80(%rsp), %rax         # 8-byte Reload
	leaq	-128(%r10,%rax), %r10
	cmovsq	%rdi, %r10
	prefetcht0	(%r10)
	prefetcht0	64(%r10)
	vmovdqa	%xmm2, -16(%rsp)
	andl	$3, %r15d
	vmovss	-16(%rsp,%r15,4), %xmm0 # xmm0 = mem[0],zero,zero,zero
	movslq	(%rcx), %rax
	leal	1(%rax), %r15d
	vucomiss	(%rdx), %xmm0
	movl	%r15d, (%rcx)
	jae	.LBB17_14
# BB#13:                                # %if_then_crit.rv
                                        #   in Loop: Header=BB17_11 Depth=3
	movq	104(%rsp), %rdi
	movq	%r8, %r10
	movq	%rdi, %r8
	movl	(%r8), %eax
	movslq	%r15d, %rdi
	movq	%r8, %r15
	movq	%r10, %r8
	movq	96(%rsp), %rbp
	movl	%eax, (%rbp,%rdi,4)
	movl	(%rdx), %r10d
	movslq	(%rcx), %rdi
	movl	%r10d, (%r8,%rdi,4)
	movq	-128(%rsp), %rdi        # 8-byte Reload
	movl	%edi, (%r15)
	vmovss	%xmm0, (%rdx)
	jmp	.LBB17_15
	.p2align	4, 0x90
.LBB17_14:                              # %if_else26.rv
                                        #   in Loop: Header=BB17_11 Depth=3
	movq	96(%rsp), %rbp
	movq	-128(%rsp), %rdi        # 8-byte Reload
	movl	%edi, 4(%rbp,%rax,4)
	movslq	(%rcx), %rdi
	vmovss	%xmm0, (%r8,%rdi,4)
	movq	104(%rsp), %r15
.LBB17_15:                              # %next27.rv
                                        #   in Loop: Header=BB17_11 Depth=3
	movq	-104(%rsp), %r9         # 8-byte Reload
	addl	$1, -108(%rsp)          # 4-byte Folded Spill
	leal	-1(%r14), %edi
	andl	%r14d, %edi
	movl	%edi, %r14d
	movq	72(%rsp), %r10
	movq	%r10, %rax
	movq	-120(%rsp), %r10        # 8-byte Reload
	jne	.LBB17_11
.LBB17_16:                              # %unlikely_cont29.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movl	-108(%rsp), %edi        # 4-byte Reload
	cmpl	$2, %edi
	jge	.LBB17_19
# BB#17:                                # %unlikely_cont69.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	testl	%edi, %edi
	jne	.LBB17_42
	jmp	.LBB17_2
.LBB17_18:                              #   in Loop: Header=BB17_40 Depth=2
	movq	104(%rsp), %r15
	movq	-104(%rsp), %r9         # 8-byte Reload
	jmp	.LBB17_16
.LBB17_19:                              # %likely_cont32.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	jne	.LBB17_23
# BB#20:                                # %if_then_crit63.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movslq	(%rcx), %rbx
	vmovd	-4(%r8,%rbx,4), %xmm0   # xmm0 = mem[0],zero,zero,zero
	vmovss	(%r8,%rbx,4), %xmm1     # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	jae	.LBB17_42
# BB#21:                                # %if_then65.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movq	96(%rsp), %rdi
	movq	%rax, %r14
	movl	-4(%rdi,%rbx,4), %r10d
	movq	96(%rsp), %rdi
	movl	(%rdi,%rbx,4), %edi
	vmovss	%xmm1, -4(%r8,%rbx,4)
	vmovd	%xmm0, (%r8,%rbx,4)
	movq	96(%rsp), %rbp
	movl	%edi, -4(%rbp,%rbx,4)
	movq	96(%rsp), %rdi
	movl	%r10d, (%rdi,%rbx,4)
.LBB17_22:                              # %while_head1.rv.backedge
                                        #   in Loop: Header=BB17_40 Depth=2
	movq	-120(%rsp), %r10        # 8-byte Reload
	movq	96(%rsp), %rbp
	jmp	.LBB17_42
.LBB17_23:                              # %likely_cont35.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movslq	(%rcx), %rbx
	movq	%rbx, %r14
	cmpl	$3, %edi
	jne	.LBB17_30
# BB#24:                                # %if_then_crit53.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	leaq	-1(%rbx), %rdi
	vmovss	-4(%r8,%r14,4), %xmm0   # xmm0 = mem[0],zero,zero,zero
	vmovss	(%r8,%r14,4), %xmm1     # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	movq	%rdi, -128(%rsp)        # 8-byte Spill
	jae	.LBB17_26
# BB#25:                                # %if_then55.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movq	%rdi, %r10
	movq	96(%rsp), %rdi
	movl	(%rdi,%r10,4), %eax
	movq	96(%rsp), %rdi
	movl	(%rdi,%r14,4), %edi
	vmovss	%xmm1, (%r8,%r10,4)
	vmovss	%xmm0, (%r8,%r14,4)
	movq	96(%rsp), %rbp
	movl	%edi, (%rbp,%r10,4)
	movq	-120(%rsp), %r10        # 8-byte Reload
	movq	96(%rsp), %rdi
	movl	%eax, (%rdi,%r14,4)
	movq	96(%rsp), %rbp
	vmovss	(%r8,%r14,4), %xmm1     # xmm1 = mem[0],zero,zero,zero
.LBB17_26:                              # %next56.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	addq	$-2, %rbx
	vmovd	-8(%r8,%r14,4), %xmm0   # xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm0, %xmm1
	jbe	.LBB17_28
# BB#27:                                # %if_then58.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movq	96(%rsp), %rdi
	movl	(%rdi,%rbx,4), %eax
	movq	96(%rsp), %rdi
	movl	(%rdi,%r14,4), %edi
	vmovss	%xmm1, (%r8,%rbx,4)
	vmovd	%xmm0, (%r8,%r14,4)
	movq	96(%rsp), %rbp
	movl	%edi, (%rbp,%rbx,4)
	movq	96(%rsp), %rdi
	movl	%eax, (%rdi,%r14,4)
	movq	96(%rsp), %rbp
	vmovd	(%r8,%rbx,4), %xmm0     # xmm0 = mem[0],zero,zero,zero
.LBB17_28:                              # %next59.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movq	72(%rsp), %rax
	movq	-128(%rsp), %r14        # 8-byte Reload
	vmovss	(%r8,%r14,4), %xmm1     # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	jae	.LBB17_42
# BB#29:                                # %if_then61.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movq	96(%rsp), %rdi
	movl	(%rdi,%rbx,4), %r10d
	movq	96(%rsp), %rdi
	movl	(%rdi,%r14,4), %edi
	vmovss	%xmm1, (%r8,%rbx,4)
	vmovd	%xmm0, (%r8,%r14,4)
	movq	96(%rsp), %rbp
	movl	%edi, (%rbp,%rbx,4)
	movq	96(%rsp), %rdi
	movl	%r10d, (%rdi,%r14,4)
	movq	72(%rsp), %r10
	movq	%r10, %rax
	jmp	.LBB17_22
.LBB17_30:                              # %if_else37.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movq	%rbx, %r15
	vmovss	-12(%r8,%r14,4), %xmm0  # xmm0 = mem[0],zero,zero,zero
	movq	%r8, %rbp
	movq	%r14, -128(%rsp)        # 8-byte Spill
	vmovss	-8(%r8,%r14,4), %xmm1   # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	jae	.LBB17_32
# BB#31:                                # %if_then39.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movq	96(%rsp), %rdi
	movq	%rdi, %r10
	movq	-128(%rsp), %rbx        # 8-byte Reload
	movl	-12(%r10,%rbx,4), %eax
	movl	-8(%r10,%rbx,4), %r8d
	movq	%rbp, %rdi
	vmovss	%xmm1, -12(%rdi,%rbx,4)
	vmovss	%xmm0, -8(%rdi,%rbx,4)
	movl	%r8d, -12(%r10,%rbx,4)
	movl	%eax, -8(%r10,%rbx,4)
.LBB17_32:                              # %next40.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movq	%rbp, %rdi
	movq	-128(%rsp), %rbx        # 8-byte Reload
	vmovss	-4(%rdi,%rbx,4), %xmm0  # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdi,%r15,4), %xmm1    # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	jae	.LBB17_34
# BB#33:                                # %if_then42.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movq	96(%rsp), %r8
	movq	-128(%rsp), %rbx        # 8-byte Reload
	movl	-4(%r8,%rbx,4), %eax
	movq	%r15, %r10
	movl	(%r8,%r10,4), %r9d
	movq	%rbp, %rdi
	vmovss	%xmm1, -4(%rdi,%rbx,4)
	vmovss	%xmm0, (%rdi,%r10,4)
	movl	%r9d, -4(%r8,%rbx,4)
	movl	%eax, (%r8,%r10,4)
	vmovss	-4(%rdi,%rbx,4), %xmm0  # xmm0 = mem[0],zero,zero,zero
.LBB17_34:                              # %next43.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movq	-128(%rsp), %rdi        # 8-byte Reload
	vmovss	-12(%rbp,%rdi,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	jbe	.LBB17_36
# BB#35:                                # %if_then45.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movq	96(%rsp), %rdi
	movq	%rdi, %r10
	movq	-128(%rsp), %rbx        # 8-byte Reload
	movl	-12(%r10,%rbx,4), %eax
	movl	-4(%r10,%rbx,4), %r8d
	movq	%rbp, %rdi
	vmovss	%xmm0, -12(%rdi,%rbx,4)
	vmovss	%xmm1, -4(%rdi,%rbx,4)
	movl	%r8d, -12(%r10,%rbx,4)
	movl	%eax, -4(%r10,%rbx,4)
.LBB17_36:                              # %next46.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movq	%rbp, %rdi
	movq	-128(%rsp), %rbx        # 8-byte Reload
	vmovd	-8(%rdi,%rbx,4), %xmm0  # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdi,%r15,4), %xmm1    # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	jae	.LBB17_38
# BB#37:                                # %if_then48.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movq	96(%rsp), %r8
	movq	-128(%rsp), %rbx        # 8-byte Reload
	movl	-8(%r8,%rbx,4), %eax
	movl	(%r8,%r15,4), %r10d
	movq	%rbp, %rdi
	vmovss	%xmm1, -8(%rdi,%rbx,4)
	vmovd	%xmm0, (%rdi,%r15,4)
	movl	%r10d, -8(%r8,%rbx,4)
	movl	%eax, (%r8,%r15,4)
	vmovd	-8(%rdi,%rbx,4), %xmm0  # xmm0 = mem[0],zero,zero,zero
.LBB17_38:                              # %next49.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movq	%rbp, %r8
	movq	-128(%rsp), %rdi        # 8-byte Reload
	vmovss	-4(%r8,%rdi,4), %xmm1   # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	movq	104(%rsp), %r15
	movq	96(%rsp), %rbp
	movq	72(%rsp), %r10
	movq	%r10, %rax
	movq	-120(%rsp), %r10        # 8-byte Reload
	movq	-104(%rsp), %r9         # 8-byte Reload
	jae	.LBB17_42
# BB#39:                                # %if_then51.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movq	-128(%rsp), %r14        # 8-byte Reload
	movl	-8(%rbp,%r14,4), %edi
	movl	-4(%rbp,%r14,4), %ebx
	vmovss	%xmm1, -8(%r8,%r14,4)
	vmovd	%xmm0, -4(%r8,%r14,4)
	movl	%ebx, -8(%rbp,%r14,4)
	movl	%edi, -4(%rbp,%r14,4)
	jmp	.LBB17_42
	.p2align	4, 0x90
.LBB17_40:                              # %while_body5.rv
                                        #   Parent Loop BB17_9 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB17_11 Depth 3
	vmovss	(%rdx), %xmm1           # xmm1 = mem[0],zero,zero,zero
	movslq	(%rcx), %rdi
	movl	(%rbp,%rdi,4), %edi
	movl	%edi, (%r15)
	movslq	(%rcx), %rdi
	movl	(%r8,%rdi,4), %edi
	movl	%edi, (%rdx)
	decl	(%rcx)
	vmovd	52(%r13), %xmm0         # xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	jbe	.LBB17_42
# BB#41:                                # %rv_align_cont.rv
                                        #   in Loop: Header=BB17_40 Depth=2
	movslq	%ebx, %rbx
	addq	$-1, %rbx
	shlq	$7, %rbx
	addq	%rax, %rbx
	vbroadcastss	28(%r13), %xmm1
	vbroadcastss	40(%r13), %xmm2
	vmovaps	(%r12,%rbx), %xmm3
	vfmadd213ps	%xmm2, %xmm1, %xmm3
	vfmadd231ps	(%r10,%rbx), %xmm1, %xmm2
	vbroadcastss	24(%r13), %xmm1
	vbroadcastss	32(%r13), %xmm4
	vbroadcastss	36(%r13), %xmm5
	movq	-72(%rsp), %rdi         # 8-byte Reload
	vmovaps	(%rdi,%rbx), %xmm6
	vfmadd213ps	%xmm5, %xmm1, %xmm6
	vfmadd231ps	(%r11,%rbx), %xmm1, %xmm5
	vbroadcastss	44(%r13), %xmm1
	vmovaps	(%r9,%rbx), %xmm7
	vfmadd213ps	%xmm1, %xmm4, %xmm7
	vfmadd231ps	(%rsi,%rbx), %xmm4, %xmm1
	vpbroadcastd	48(%r13), %xmm4
	vpbroadcastd	%xmm0, %xmm0
	vpmaxsd	%xmm6, %xmm2, %xmm2
	vpminsd	%xmm3, %xmm5, %xmm3
	vpmaxsd	%xmm7, %xmm4, %xmm4
	vpminsd	%xmm0, %xmm1, %xmm0
	vpmaxsd	%xmm2, %xmm4, %xmm2
	vpminsd	%xmm0, %xmm3, %xmm0
	vpcmpgtd	%xmm0, %xmm2, %xmm0
	vmovmskps	%xmm0, %r14d
	xorl	$15, %r14d
	jne	.LBB17_10
.LBB17_42:                              # %while_head1.rv.backedge
                                        #   in Loop: Header=BB17_40 Depth=2
	movl	(%r15), %ebx
	testl	%ebx, %ebx
	jg	.LBB17_40
# BB#43:                                # %unlikely_cont74.rv
                                        #   in Loop: Header=BB17_9 Depth=1
	testl	%ebx, %ebx
	js	.LBB17_3
.LBB17_44:                              # %while_head.rv.backedge
                                        #   in Loop: Header=BB17_9 Depth=1
	movl	(%r15), %ebx
	testl	%ebx, %ebx
	jne	.LBB17_9
.LBB17_45:                              # %next.rv
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end17:
	.size	lambda_2675440_vectorize, .Lfunc_end17-lambda_2675440_vectorize

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI18_0:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI18_1:
	.long	2147483648              # 0x80000000
.LCPI18_2:
	.long	1065353216              # float 1
.LCPI18_3:
	.long	2139095039              # float 3.40282347E+38
	.text
	.globl	lambda_2661674_vectorize
	.p2align	4, 0x90
	.type	lambda_2661674_vectorize,@function
lambda_2661674_vectorize:               # @lambda_2661674_vectorize
# BB#0:                                 # %lambda_2661674_start.rv
	notl	%r8d
	movslq	%edi, %rax
	movslq	%r8d, %rdx
	imulq	$208, %rdx, %rdx
	leaq	176(%rcx,%rdx), %rcx
	vmovaps	.LCPI18_0(%rip), %xmm8  # xmm8 = [9223372034707292159,9223372034707292159]
	vbroadcastss	.LCPI18_1(%rip), %xmm10
	vxorps	%xmm9, %xmm9, %xmm9
	jmp	.LBB18_1
.LBB18_2:                               # %if_else_crit.rv
                                        #   in Loop: Header=BB18_1 Depth=1
	vandps	%xmm0, %xmm6, %xmm0
	vmovaps	%xmm0, -72(%rsp)        # 16-byte Spill
	vmulps	%xmm3, %xmm15, %xmm0
	vcmpneq_usps	%xmm9, %xmm11, %xmm3
	vbroadcastss	52(%r9), %xmm6
	vmulps	%xmm6, %xmm11, %xmm6
	vfmadd213ps	%xmm0, %xmm14, %xmm1
	vbroadcastss	48(%r9), %xmm0
	vmulps	%xmm0, %xmm11, %xmm2
	vfmadd213ps	%xmm1, %xmm12, %xmm13
	vxorps	%xmm13, %xmm4, %xmm0
	vcmpleps	%xmm6, %xmm0, %xmm1
	vcmpleps	%xmm0, %xmm2, %xmm2
	vandps	%xmm3, %xmm1, %xmm1
	vandps	%xmm2, %xmm1, %xmm1
	vmovdqa	-72(%rsp), %xmm2        # 16-byte Reload
	vptest	%xmm1, %xmm2
	je	.LBB18_4
# BB#3:                                 # %if_then.rv
                                        #   in Loop: Header=BB18_1 Depth=1
	vpand	%xmm2, %xmm1, %xmm1
	vrcpps	%xmm11, %xmm2
	vbroadcastss	.LCPI18_2(%rip), %xmm3
	vfnmadd213ps	%xmm3, %xmm2, %xmm11
	vfmadd132ps	%xmm2, %xmm2, %xmm11
	vmulps	%xmm0, %xmm11, %xmm0
	vbroadcastss	.LCPI18_3(%rip), %xmm2
	vblendvps	%xmm1, %xmm0, %xmm2, %xmm1
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vpminsd	%xmm2, %xmm1, %xmm2
	vpshufd	$57, %xmm2, %xmm3       # xmm3 = xmm2[1,2,3,0]
	vpminsd	%xmm3, %xmm2, %xmm2
	vcmpeqps	%xmm2, %xmm1, %xmm1
	vmovmskps	%xmm1, %edx
	tzcntl	%edx, %edx
	movl	16(%rcx,%rdx,4), %edi
                                        # kill: %EDX<def> %EDX<kill> %RDX<kill> %RDX<def>
	andl	$3, %edx
	vmovaps	%xmm0, -56(%rsp)
	vmovss	-56(%rsp,%rdx,4), %xmm0 # xmm0 = mem[0],zero,zero,zero
	vmulps	%xmm7, %xmm11, %xmm1
	vmovaps	%xmm1, -40(%rsp)
	vmovss	-40(%rsp,%rdx,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	vmulps	%xmm5, %xmm11, %xmm2
	vmovaps	%xmm2, -24(%rsp)
	vmovss	-24(%rsp,%rdx,4), %xmm2 # xmm2 = mem[0],zero,zero,zero
	andl	$2147483647, %edi       # imm = 0x7FFFFFFF
	vmovss	%xmm0, (%rsi)
	vmovss	%xmm1, 4(%rsi)
	vmovss	%xmm2, 8(%rsi)
	movl	%edi, 12(%rsi)
	vmovss	%xmm0, 52(%r9)
	jmp	.LBB18_4
	.p2align	4, 0x90
.LBB18_1:                               # %while_head.rv
                                        # =>This Inner Loop Header: Depth=1
	vmovaps	-32(%rcx,%rax,4), %xmm15
	vbroadcastss	12(%r9), %xmm5
	vmovaps	-16(%rcx,%rax,4), %xmm14
	vmovaps	(%rcx,%rax,4), %xmm12
	vbroadcastss	16(%r9), %xmm0
	vmulps	%xmm14, %xmm0, %xmm4
	vfmadd231ps	%xmm15, %xmm5, %xmm4
	vbroadcastss	20(%r9), %xmm6
	vfmadd231ps	%xmm12, %xmm6, %xmm4
	vmovaps	-144(%rcx,%rax,4), %xmm1
	vmovaps	-160(%rcx,%rax,4), %xmm7
	vmovaps	-176(%rcx,%rax,4), %xmm2
	vbroadcastss	(%r9), %xmm3
	vsubps	%xmm3, %xmm2, %xmm3
	vbroadcastss	8(%r9), %xmm2
	vsubps	%xmm2, %xmm1, %xmm13
	vbroadcastss	4(%r9), %xmm1
	vsubps	%xmm1, %xmm7, %xmm1
	vmulps	%xmm3, %xmm0, %xmm7
	vmulps	%xmm13, %xmm5, %xmm2
	vfmsub213ps	%xmm7, %xmm1, %xmm5
	vmulps	%xmm1, %xmm6, %xmm7
	vfmsub213ps	%xmm2, %xmm3, %xmm6
	vandps	%xmm8, %xmm4, %xmm11
	vfmsub213ps	%xmm7, %xmm13, %xmm0
	vmulps	-64(%rcx,%rax,4), %xmm6, %xmm2
	vandps	%xmm10, %xmm4, %xmm4
	vmulps	-112(%rcx,%rax,4), %xmm6, %xmm6
	vfmadd231ps	-80(%rcx,%rax,4), %xmm0, %xmm2
	vfmadd231ps	-128(%rcx,%rax,4), %xmm0, %xmm6
	vfmadd231ps	-48(%rcx,%rax,4), %xmm5, %xmm2
	vfmadd231ps	-96(%rcx,%rax,4), %xmm5, %xmm6
	vxorps	%xmm2, %xmm4, %xmm7
	vxorps	%xmm6, %xmm4, %xmm5
	vcmpleps	%xmm7, %xmm9, %xmm0
	vcmpleps	%xmm5, %xmm9, %xmm2
	vandps	%xmm0, %xmm2, %xmm6
	vaddps	%xmm5, %xmm7, %xmm0
	vcmpleps	%xmm11, %xmm0, %xmm0
	vptest	%xmm0, %xmm6
	jne	.LBB18_2
.LBB18_4:                               # %next.rv
                                        #   in Loop: Header=BB18_1 Depth=1
	cmpl	$0, 28(%rcx)
	leaq	208(%rcx), %rcx
	jns	.LBB18_1
# BB#5:                                 # %if_then33.rv
	retq
.Lfunc_end18:
	.size	lambda_2661674_vectorize, .Lfunc_end18-lambda_2661674_vectorize

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI19_0:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI19_1:
	.long	2147483648              # 0x80000000
.LCPI19_2:
	.long	1065353216              # float 1
.LCPI19_3:
	.long	2139095039              # float 3.40282347E+38
	.text
	.globl	lambda_2663893_vectorize
	.p2align	4, 0x90
	.type	lambda_2663893_vectorize,@function
lambda_2663893_vectorize:               # @lambda_2663893_vectorize
# BB#0:                                 # %lambda_2663893_start.rv
	notl	%edx
	movslq	%edi, %rax
	movslq	%edx, %rcx
	imulq	$208, %rcx, %rcx
	leaq	176(%r8,%rcx), %rcx
	vmovaps	.LCPI19_0(%rip), %xmm8  # xmm8 = [9223372034707292159,9223372034707292159]
	vbroadcastss	.LCPI19_1(%rip), %xmm10
	vxorps	%xmm9, %xmm9, %xmm9
	jmp	.LBB19_1
.LBB19_2:                               # %if_else_crit.rv
                                        #   in Loop: Header=BB19_1 Depth=1
	vandps	%xmm7, %xmm0, %xmm0
	vmovaps	%xmm0, -72(%rsp)        # 16-byte Spill
	vmulps	%xmm3, %xmm15, %xmm0
	vfmadd213ps	%xmm0, %xmm14, %xmm1
	vcmpneq_usps	%xmm9, %xmm11, %xmm3
	vbroadcastss	52(%rsi), %xmm0
	vmulps	%xmm0, %xmm11, %xmm7
	vbroadcastss	48(%rsi), %xmm0
	vmulps	%xmm0, %xmm11, %xmm2
	vfmadd213ps	%xmm1, %xmm12, %xmm13
	vxorps	%xmm13, %xmm4, %xmm0
	vcmpleps	%xmm7, %xmm0, %xmm1
	vcmpleps	%xmm0, %xmm2, %xmm2
	vandps	%xmm3, %xmm1, %xmm1
	vandps	%xmm2, %xmm1, %xmm1
	vmovdqa	-72(%rsp), %xmm2        # 16-byte Reload
	vptest	%xmm1, %xmm2
	je	.LBB19_4
# BB#3:                                 # %if_then.rv
                                        #   in Loop: Header=BB19_1 Depth=1
	vpand	%xmm2, %xmm1, %xmm1
	vrcpps	%xmm11, %xmm2
	vbroadcastss	.LCPI19_2(%rip), %xmm3
	vfnmadd213ps	%xmm3, %xmm2, %xmm11
	vfmadd132ps	%xmm2, %xmm2, %xmm11
	vmulps	%xmm0, %xmm11, %xmm0
	vbroadcastss	.LCPI19_3(%rip), %xmm2
	vblendvps	%xmm1, %xmm0, %xmm2, %xmm1
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vpminsd	%xmm2, %xmm1, %xmm2
	vpshufd	$57, %xmm2, %xmm3       # xmm3 = xmm2[1,2,3,0]
	vpminsd	%xmm3, %xmm2, %xmm2
	vcmpeqps	%xmm2, %xmm1, %xmm1
	vmovmskps	%xmm1, %edx
	tzcntl	%edx, %edx
	movl	16(%rcx,%rdx,4), %edi
                                        # kill: %EDX<def> %EDX<kill> %RDX<kill> %RDX<def>
	andl	$3, %edx
	vmovaps	%xmm0, -56(%rsp)
	vmovss	-56(%rsp,%rdx,4), %xmm0 # xmm0 = mem[0],zero,zero,zero
	vmulps	%xmm6, %xmm11, %xmm1
	vmovaps	%xmm1, -40(%rsp)
	vmovss	-40(%rsp,%rdx,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	vmulps	%xmm5, %xmm11, %xmm2
	vmovaps	%xmm2, -24(%rsp)
	vmovss	-24(%rsp,%rdx,4), %xmm2 # xmm2 = mem[0],zero,zero,zero
	andl	$2147483647, %edi       # imm = 0x7FFFFFFF
	vmovss	%xmm0, (%r9)
	vmovss	%xmm1, 4(%r9)
	vmovss	%xmm2, 8(%r9)
	movl	%edi, 12(%r9)
	vmovss	%xmm0, 52(%rsi)
	jmp	.LBB19_4
	.p2align	4, 0x90
.LBB19_1:                               # %while_head.rv
                                        # =>This Inner Loop Header: Depth=1
	vmovaps	-32(%rcx,%rax,4), %xmm15
	vbroadcastss	12(%rsi), %xmm5
	vmovaps	-16(%rcx,%rax,4), %xmm14
	vmovaps	(%rcx,%rax,4), %xmm12
	vbroadcastss	16(%rsi), %xmm0
	vmulps	%xmm14, %xmm0, %xmm4
	vfmadd231ps	%xmm15, %xmm5, %xmm4
	vbroadcastss	20(%rsi), %xmm6
	vfmadd231ps	%xmm12, %xmm6, %xmm4
	vmovaps	-144(%rcx,%rax,4), %xmm1
	vmovaps	-160(%rcx,%rax,4), %xmm3
	vmovaps	-176(%rcx,%rax,4), %xmm7
	vbroadcastss	8(%rsi), %xmm2
	vsubps	%xmm2, %xmm1, %xmm13
	vbroadcastss	4(%rsi), %xmm1
	vsubps	%xmm1, %xmm3, %xmm1
	vbroadcastss	(%rsi), %xmm3
	vsubps	%xmm3, %xmm7, %xmm3
	vmulps	%xmm1, %xmm6, %xmm7
	vmulps	%xmm3, %xmm0, %xmm2
	vfmsub213ps	%xmm7, %xmm13, %xmm0
	vmulps	%xmm13, %xmm5, %xmm7
	vfmsub213ps	%xmm7, %xmm3, %xmm6
	vandps	%xmm8, %xmm4, %xmm11
	vfmsub213ps	%xmm2, %xmm1, %xmm5
	vmulps	-64(%rcx,%rax,4), %xmm6, %xmm2
	vandps	%xmm10, %xmm4, %xmm4
	vmulps	-112(%rcx,%rax,4), %xmm6, %xmm7
	vfmadd231ps	-80(%rcx,%rax,4), %xmm0, %xmm2
	vfmadd231ps	-128(%rcx,%rax,4), %xmm0, %xmm7
	vfmadd231ps	-48(%rcx,%rax,4), %xmm5, %xmm2
	vfmadd231ps	-96(%rcx,%rax,4), %xmm5, %xmm7
	vxorps	%xmm2, %xmm4, %xmm6
	vxorps	%xmm7, %xmm4, %xmm5
	vcmpleps	%xmm6, %xmm9, %xmm0
	vcmpleps	%xmm5, %xmm9, %xmm2
	vandps	%xmm0, %xmm2, %xmm0
	vaddps	%xmm5, %xmm6, %xmm2
	vcmpleps	%xmm11, %xmm2, %xmm7
	vptest	%xmm7, %xmm0
	jne	.LBB19_2
.LBB19_4:                               # %next.rv
                                        #   in Loop: Header=BB19_1 Depth=1
	cmpl	$0, 28(%rcx)
	leaq	208(%rcx), %rcx
	jns	.LBB19_1
# BB#5:                                 # %if_then33.rv
	retq
.Lfunc_end19:
	.size	lambda_2663893_vectorize, .Lfunc_end19-lambda_2663893_vectorize

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI20_0:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI20_1:
	.long	2147483648              # 0x80000000
.LCPI20_2:
	.long	1065353216              # float 1
.LCPI20_3:
	.long	2139095039              # float 3.40282347E+38
	.text
	.globl	lambda_2678908_vectorize
	.p2align	4, 0x90
	.type	lambda_2678908_vectorize,@function
lambda_2678908_vectorize:               # @lambda_2678908_vectorize
# BB#0:                                 # %lambda_2678908_start.rv
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	movq	%rsi, %r12
	movq	%rcx, %rsi
	movl	(%r8), %r14d
	testl	%r14d, %r14d
	je	.LBB20_32
# BB#1:                                 # %while_head1.rv.preheader.lr.ph
	movq	128(%rsp), %r11
	movq	96(%rsp), %rax
	movl	104(%rsp), %r15d
	addl	%edi, %r15d
	movq	%rsi, -128(%rsp)        # 8-byte Spill
	movl	120(%rsp), %esi
	addl	%edi, %esi
	movl	144(%rsp), %ecx
	addl	%edi, %ecx
	movl	168(%rsp), %ebp
	addl	%edi, %ebp
	addl	%edi, %edx
	addl	112(%rsp), %edi
	movslq	%esi, %rbx
	movq	-128(%rsp), %rsi        # 8-byte Reload
	movslq	%edi, %rdi
	movslq	%edx, %rdx
	movq	%rdx, -24(%rsp)         # 8-byte Spill
	movslq	%ecx, %rcx
	movq	%rcx, -32(%rsp)         # 8-byte Spill
	movslq	%r15d, %r10
	movslq	%ebp, %r13
	movq	160(%rsp), %rcx
	leaq	192(%rcx), %rcx
	movq	%rcx, -40(%rsp)         # 8-byte Spill
	movq	%rbx, %rbp
	movq	%rdi, %rbx
	movq	152(%rsp), %rdi
	vmovaps	.LCPI20_0(%rip), %xmm10 # xmm10 = [9223372034707292159,9223372034707292159]
	vxorps	%xmm11, %xmm11, %xmm11
	movq	%r12, -120(%rsp)        # 8-byte Spill
	movq	%rbp, -56(%rsp)         # 8-byte Spill
	movq	%rbx, -64(%rsp)         # 8-byte Spill
	jmp	.LBB20_2
.LBB20_28:                              # %unlikely_cont60.rv.unlikely_cont65.rv.loopexit_crit_edge
                                        #   in Loop: Header=BB20_2 Depth=1
	movl	(%r8), %r14d
	testl	%r14d, %r14d
	jns	.LBB20_31
.LBB20_30:                              # %if_then68.rv
                                        #   in Loop: Header=BB20_2 Depth=1
	vmovd	(%r9), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movslq	(%r11), %rcx
	movl	(%r12,%rcx,4), %ecx
	movl	%ecx, (%r8)
	movslq	(%r11), %rcx
	movl	(%rsi,%rcx,4), %ecx
	movl	%ecx, (%r9)
	decl	(%r11)
	vmovd	52(%rax), %xmm1         # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm0, %xmm1
	jbe	.LBB20_31
# BB#33:                                # %body.rv
                                        #   in Loop: Header=BB20_2 Depth=1
	notl	%r14d
	movslq	%r14d, %rcx
	imulq	$208, %rcx, %rdx
	addq	-40(%rsp), %rdx         # 8-byte Folded Reload
	jmp	.LBB20_34
.LBB20_35:                              # %if_else_crit.rv.i
                                        #   in Loop: Header=BB20_34 Depth=2
	vpand	%xmm4, %xmm6, %xmm4
	vbroadcastss	48(%rax), %xmm0
	vmulps	%xmm0, %xmm8, %xmm1
	vmulps	%xmm3, %xmm14, %xmm0
	vbroadcastss	52(%rax), %xmm3
	vmulps	%xmm3, %xmm8, %xmm3
	vcmpneq_usps	%xmm11, %xmm8, %xmm6
	vfmadd213ps	%xmm0, %xmm13, %xmm2
	vfmadd213ps	%xmm2, %xmm9, %xmm12
	vxorps	%xmm12, %xmm15, %xmm0
	vcmpleps	%xmm3, %xmm0, %xmm2
	vcmpleps	%xmm0, %xmm1, %xmm1
	vandps	%xmm6, %xmm2, %xmm2
	vandps	%xmm1, %xmm2, %xmm1
	vptest	%xmm1, %xmm4
	je	.LBB20_37
# BB#36:                                # %if_then.rv.i
                                        #   in Loop: Header=BB20_34 Depth=2
	vpand	%xmm4, %xmm1, %xmm1
	vrcpps	%xmm8, %xmm2
	vbroadcastss	.LCPI20_2(%rip), %xmm3
	vfnmadd213ps	%xmm3, %xmm2, %xmm8
	vfmadd132ps	%xmm2, %xmm2, %xmm8
	vmulps	%xmm0, %xmm8, %xmm0
	vbroadcastss	.LCPI20_3(%rip), %xmm2
	vblendvps	%xmm1, %xmm0, %xmm2, %xmm1
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vpminsd	%xmm2, %xmm1, %xmm2
	vpshufd	$57, %xmm2, %xmm3       # xmm3 = xmm2[1,2,3,0]
	vpminsd	%xmm3, %xmm2, %xmm2
	vcmpeqps	%xmm2, %xmm1, %xmm1
	vmovmskps	%xmm1, %ecx
	tzcntl	%ecx, %ecx
	movl	%ecx, %esi
	andl	$3, %esi
	vmovaps	%xmm0, -16(%rsp)
	vmovss	-16(%rsp,%rsi,4), %xmm0 # xmm0 = mem[0],zero,zero,zero
	vmulps	%xmm7, %xmm8, %xmm1
	vmovaps	%xmm1, (%rsp)
	vmovss	(%rsp,%rsi,4), %xmm1    # xmm1 = mem[0],zero,zero,zero
	vmulps	%xmm5, %xmm8, %xmm2
	vmovaps	%xmm2, 16(%rsp)
	vmovss	16(%rsp,%rsi,4), %xmm2  # xmm2 = mem[0],zero,zero,zero
	movq	-128(%rsp), %rsi        # 8-byte Reload
	movl	(%rdx,%rcx,4), %r14d
	movl	$2147483647, %ecx       # imm = 0x7FFFFFFF
	andl	%ecx, %r14d
	movq	136(%rsp), %rcx
	vmovss	%xmm0, (%rcx)
	vmovss	%xmm1, 4(%rcx)
	vmovss	%xmm2, 8(%rcx)
	movl	%r14d, 12(%rcx)
	vmovss	%xmm0, 52(%rax)
	jmp	.LBB20_37
	.p2align	4, 0x90
.LBB20_34:                              # %while_head.rv.i
                                        #   Parent Loop BB20_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovaps	-48(%rdx), %xmm14
	vbroadcastss	12(%rax), %xmm5
	vmovaps	-32(%rdx), %xmm13
	vmovaps	-16(%rdx), %xmm9
	vbroadcastss	16(%rax), %xmm7
	vmulps	%xmm13, %xmm7, %xmm0
	vfmadd231ps	%xmm14, %xmm5, %xmm0
	vbroadcastss	20(%rax), %xmm4
	vfmadd231ps	%xmm9, %xmm4, %xmm0
	vandps	%xmm10, %xmm0, %xmm8
	vmovaps	-192(%rdx), %xmm1
	vmovaps	-176(%rdx), %xmm2
	vmovaps	-160(%rdx), %xmm6
	vbroadcastss	.LCPI20_1(%rip), %xmm3
	vandps	%xmm3, %xmm0, %xmm15
	vbroadcastss	(%rax), %xmm3
	vsubps	%xmm3, %xmm1, %xmm3
	vmulps	%xmm3, %xmm7, %xmm0
	vbroadcastss	8(%rax), %xmm1
	vsubps	%xmm1, %xmm6, %xmm12
	vbroadcastss	4(%rax), %xmm6
	vsubps	%xmm6, %xmm2, %xmm2
	vmulps	%xmm12, %xmm5, %xmm6
	vmulps	%xmm2, %xmm4, %xmm1
	vfmsub213ps	%xmm1, %xmm12, %xmm7
	vfmsub213ps	%xmm6, %xmm3, %xmm4
	vmulps	-80(%rdx), %xmm4, %xmm1
	vfmsub213ps	%xmm0, %xmm2, %xmm5
	vmulps	-128(%rdx), %xmm4, %xmm0
	vfmadd231ps	-96(%rdx), %xmm7, %xmm1
	vfmadd231ps	-144(%rdx), %xmm7, %xmm0
	vfmadd231ps	-64(%rdx), %xmm5, %xmm1
	vfmadd231ps	-112(%rdx), %xmm5, %xmm0
	vxorps	%xmm1, %xmm15, %xmm7
	vxorps	%xmm0, %xmm15, %xmm5
	vaddps	%xmm5, %xmm7, %xmm0
	vcmpleps	%xmm7, %xmm11, %xmm1
	vcmpleps	%xmm5, %xmm11, %xmm6
	vcmpleps	%xmm8, %xmm0, %xmm4
	vandps	%xmm1, %xmm6, %xmm6
	vptest	%xmm4, %xmm6
	jne	.LBB20_35
.LBB20_37:                              # %next.rv.i
                                        #   in Loop: Header=BB20_34 Depth=2
	cmpl	$0, 12(%rdx)
	leaq	208(%rdx), %rdx
	jns	.LBB20_34
	jmp	.LBB20_31
	.p2align	4, 0x90
.LBB20_2:                               # %while_head1.rv.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB20_3 Depth 2
                                        #       Child Loop BB20_7 Depth 3
                                        #     Child Loop BB20_34 Depth 2
	testl	%r14d, %r14d
	jg	.LBB20_3
	jmp	.LBB20_30
.LBB20_6:                               # %if_then.rv.preheader
                                        #   in Loop: Header=BB20_3 Depth=2
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB20_7:                               # %if_then.rv
                                        #   Parent Loop BB20_2 Depth=1
                                        #     Parent Loop BB20_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	tzcntl	%r15d, %r12d
	movslq	192(%rdx,%r12,4), %r14
	testq	%r14, %r14
	je	.LBB20_8
# BB#9:                                 # %if_else24.rv
                                        #   in Loop: Header=BB20_7 Depth=3
	movq	%rdi, -104(%rsp)        # 8-byte Spill
	movl	%r14d, %ecx
	notl	%ecx
	movq	%r14, %rsi
	shlq	$8, %rsi
	movslq	%ecx, %rcx
	imulq	$208, %rcx, %rcx
	addq	160(%rsp), %rcx
	testl	%r14d, %r14d
	movq	152(%rsp), %rdi
	leaq	-256(%rdi,%rsi), %rsi
	cmovsq	%rcx, %rsi
	prefetcht0	(%rsi)
	prefetcht0	64(%rsi)
	prefetcht0	128(%rsi)
	prefetcht0	192(%rsi)
	vmovd	%r12d, %xmm0
	vpermps	%ymm2, %ymm0, %ymm0
	movslq	(%r11), %rcx
	leal	1(%rcx), %esi
	vucomiss	(%r9), %xmm0
	movl	%esi, (%r11)
	jae	.LBB20_10
# BB#11:                                # %if_then_crit.rv
                                        #   in Loop: Header=BB20_7 Depth=3
	movl	(%r8), %ecx
	movslq	%esi, %rsi
	movq	-120(%rsp), %rbx        # 8-byte Reload
	movl	%ecx, (%rbx,%rsi,4)
	movl	(%r9), %r12d
	movslq	(%r11), %rsi
	movq	-128(%rsp), %rcx        # 8-byte Reload
	movl	%r12d, (%rcx,%rsi,4)
	movq	%rbx, %r12
	movq	%rcx, %rsi
	movl	%r14d, (%r8)
	vmovss	%xmm0, (%r9)
	jmp	.LBB20_12
	.p2align	4, 0x90
.LBB20_10:                              # %if_else28.rv
                                        #   in Loop: Header=BB20_7 Depth=3
	movq	-120(%rsp), %r12        # 8-byte Reload
	movl	%r14d, 4(%r12,%rcx,4)
	movslq	(%r11), %rcx
	movq	-128(%rsp), %rsi        # 8-byte Reload
	vmovss	%xmm0, (%rsi,%rcx,4)
.LBB20_12:                              # %next29.rv
                                        #   in Loop: Header=BB20_7 Depth=3
	movq	-56(%rsp), %rbp         # 8-byte Reload
	movq	-64(%rsp), %rbx         # 8-byte Reload
	movq	-104(%rsp), %rdi        # 8-byte Reload
	addl	$1, %edi
	leal	-1(%r15), %ecx
	andl	%r15d, %ecx
	movl	%ecx, %r15d
	jne	.LBB20_7
# BB#13:                                # %unlikely_cont31.rv
                                        #   in Loop: Header=BB20_3 Depth=2
	cmpl	$2, %edi
	jge	.LBB20_14
.LBB20_27:                              # %unlikely_cont60.rv
                                        #   in Loop: Header=BB20_3 Depth=2
	testl	%edi, %edi
	movq	152(%rsp), %rdi
	jne	.LBB20_4
	jmp	.LBB20_28
.LBB20_8:                               #   in Loop: Header=BB20_3 Depth=2
	movq	-120(%rsp), %r12        # 8-byte Reload
	movq	-56(%rsp), %rbp         # 8-byte Reload
	movq	-64(%rsp), %rbx         # 8-byte Reload
	cmpl	$2, %edi
	jl	.LBB20_27
.LBB20_14:                              # %likely_cont34.rv
                                        #   in Loop: Header=BB20_3 Depth=2
	leal	-2(%rdi), %ecx
	cmpl	$4, %ecx
	movq	%rdi, %rdx
	movq	152(%rsp), %rdi
	ja	.LBB20_16
# BB#15:                                # %likely_cont34.rv
                                        #   in Loop: Header=BB20_3 Depth=2
	jmpq	*.LJTI20_0(,%rcx,8)
.LBB20_24:                              # %if_then_crit57.rv
                                        #   in Loop: Header=BB20_3 Depth=2
	movslq	(%r11), %rcx
	leaq	-4(%r12,%rcx,4), %rdx
	movq	%rdx, -96(%rsp)         # 8-byte Spill
	movl	-4(%r12,%rcx,4), %r14d
	leaq	-4(%rsi,%rcx,4), %rdx
	movq	%rdx, -104(%rsp)        # 8-byte Spill
	vmovss	-4(%rsi,%rcx,4), %xmm0  # xmm0 = mem[0],zero,zero,zero
	leaq	(%r12,%rcx,4), %rdx
	movq	%rdx, -80(%rsp)         # 8-byte Spill
	movl	(%r12,%rcx,4), %esi
	movq	-128(%rsp), %rdx        # 8-byte Reload
	leaq	(%rdx,%rcx,4), %rdx
	movq	%rdx, -72(%rsp)         # 8-byte Spill
	movq	-128(%rsp), %rdx        # 8-byte Reload
	vmovss	(%rdx,%rcx,4), %xmm1    # xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	movl	%esi, %ecx
	cmovbl	%r14d, %ecx
	vminss	%xmm1, %xmm0, %xmm2
	cmovbl	%esi, %r14d
	movq	-128(%rsp), %rsi        # 8-byte Reload
	vmaxss	%xmm0, %xmm1, %xmm0
	vmovd	%xmm0, %r15d
.LBB20_25:                              # %unlikely_cont60.rv.thread
                                        #   in Loop: Header=BB20_3 Depth=2
	vmovd	%xmm2, -108(%rsp)       # 4-byte Folded Spill
.LBB20_26:                              # %unlikely_cont60.rv.thread
                                        #   in Loop: Header=BB20_3 Depth=2
	movq	-96(%rsp), %rdx         # 8-byte Reload
	movl	%r14d, (%rdx)
	movq	-104(%rsp), %rdx        # 8-byte Reload
	movl	%r15d, (%rdx)
	movq	-80(%rsp), %rdx         # 8-byte Reload
	movl	%ecx, (%rdx)
	movq	-72(%rsp), %rcx         # 8-byte Reload
	movl	-108(%rsp), %edx        # 4-byte Reload
	movl	%edx, (%rcx)
	jmp	.LBB20_4
.LBB20_23:                              # %if_then_crit56.rv
                                        #   in Loop: Header=BB20_3 Depth=2
	movslq	(%r11), %rcx
	movl	-8(%r12,%rcx,4), %esi
	movq	-128(%rsp), %rdx        # 8-byte Reload
	vmovss	-8(%rdx,%rcx,4), %xmm0  # xmm0 = mem[0],zero,zero,zero
	leaq	-4(%r12,%rcx,4), %rdx
	movq	%rdx, -96(%rsp)         # 8-byte Spill
	movl	-4(%r12,%rcx,4), %r15d
	movq	-128(%rsp), %rdx        # 8-byte Reload
	leaq	-4(%rdx,%rcx,4), %rdx
	movq	%rdx, -104(%rsp)        # 8-byte Spill
	movq	-128(%rsp), %rdx        # 8-byte Reload
	vmovss	-4(%rdx,%rcx,4), %xmm1  # xmm1 = mem[0],zero,zero,zero
	leaq	(%r12,%rcx,4), %rdx
	movq	%rdx, -80(%rsp)         # 8-byte Spill
	movl	(%r12,%rcx,4), %edx
	movl	%edx, -84(%rsp)         # 4-byte Spill
	movq	-128(%rsp), %rdx        # 8-byte Reload
	leaq	(%rdx,%rcx,4), %rdx
	movq	%rdx, -72(%rsp)         # 8-byte Spill
	movq	-128(%rsp), %rdx        # 8-byte Reload
	movl	(%rdx,%rcx,4), %edx
	movl	%edx, -108(%rsp)        # 4-byte Spill
	vucomiss	%xmm1, %xmm0
	movl	%r15d, %r14d
	cmovbl	%esi, %r14d
	vminss	%xmm1, %xmm0, %xmm2
	vmaxss	%xmm0, %xmm1, %xmm0
	cmovbl	%r15d, %esi
	movl	%esi, -8(%r12,%rcx,4)
	movq	-128(%rsp), %rsi        # 8-byte Reload
	vmovss	%xmm0, -8(%rsi,%rcx,4)
	movl	-84(%rsp), %ecx         # 4-byte Reload
	vmovd	%xmm2, %r15d
	jmp	.LBB20_26
.LBB20_22:                              # %if_then_crit55.rv
                                        #   in Loop: Header=BB20_3 Depth=2
	movslq	(%r11), %rcx
	movl	-12(%r12,%rcx,4), %r14d
	vmovss	-12(%rsi,%rcx,4), %xmm0 # xmm0 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rdx        # 8-byte Reload
	movl	-8(%rdx,%rcx,4), %r12d
	vmovss	-8(%rsi,%rcx,4), %xmm1  # xmm1 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rdx        # 8-byte Reload
	leaq	-4(%rdx,%rcx,4), %rdx
	movq	%rdx, -96(%rsp)         # 8-byte Spill
	movq	-120(%rsp), %rdx        # 8-byte Reload
	movl	-4(%rdx,%rcx,4), %r15d
	leaq	-4(%rsi,%rcx,4), %rdx
	movq	%rdx, -104(%rsp)        # 8-byte Spill
	vmovss	-4(%rsi,%rcx,4), %xmm2  # xmm2 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rdx        # 8-byte Reload
	leaq	(%rdx,%rcx,4), %rdx
	movq	%rdx, -80(%rsp)         # 8-byte Spill
	movq	-120(%rsp), %rdx        # 8-byte Reload
	movl	(%rdx,%rcx,4), %esi
	movq	-128(%rsp), %rdx        # 8-byte Reload
	leaq	(%rdx,%rcx,4), %rdx
	movq	%rdx, -72(%rsp)         # 8-byte Spill
	movq	-128(%rsp), %rdx        # 8-byte Reload
	vmovss	(%rdx,%rcx,4), %xmm3    # xmm3 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	movl	%r12d, %edx
	cmovbl	%r14d, %edx
	vminss	%xmm1, %xmm0, %xmm4
	cmovbl	%r12d, %r14d
	vmaxss	%xmm0, %xmm1, %xmm0
	vucomiss	%xmm3, %xmm2
	movl	%esi, %r12d
	cmovbl	%r15d, %r12d
	vminss	%xmm3, %xmm2, %xmm1
	cmovbl	%esi, %r15d
	vmaxss	%xmm2, %xmm3, %xmm2
	vucomiss	%xmm2, %xmm0
	movl	%r15d, %esi
	cmovbl	%r14d, %esi
	vminss	%xmm2, %xmm0, %xmm3
	vmaxss	%xmm0, %xmm2, %xmm0
	cmovael	%r14d, %r15d
	vucomiss	%xmm1, %xmm4
	movl	%r12d, %edi
	cmovbl	%edx, %edi
	movl	%edi, -84(%rsp)         # 4-byte Spill
	vminss	%xmm1, %xmm4, %xmm2
	cmovael	%edx, %r12d
	vmaxss	%xmm4, %xmm1, %xmm1
	vucomiss	%xmm3, %xmm1
	movl	%esi, %r14d
	cmovbl	%r12d, %r14d
	vminss	%xmm3, %xmm1, %xmm4
	vmaxss	%xmm1, %xmm3, %xmm1
	cmovbl	%esi, %r12d
	movq	-128(%rsp), %rsi        # 8-byte Reload
	movq	-120(%rsp), %rdx        # 8-byte Reload
	movl	%r15d, -12(%rdx,%rcx,4)
	vmovss	%xmm0, -12(%rsi,%rcx,4)
	movq	-120(%rsp), %rdx        # 8-byte Reload
	movl	%r12d, -8(%rdx,%rcx,4)
	movq	-64(%rsp), %rbx         # 8-byte Reload
	movq	-56(%rsp), %rbp         # 8-byte Reload
	movq	152(%rsp), %rdi
	movq	-120(%rsp), %r12        # 8-byte Reload
	vmovss	%xmm1, -8(%rsi,%rcx,4)
	movl	-84(%rsp), %ecx         # 4-byte Reload
	vmovd	%xmm4, %r15d
	jmp	.LBB20_25
.LBB20_16:                              # %likely_cont49.rv
                                        #   in Loop: Header=BB20_3 Depth=2
	movslq	(%r11), %rbp
	cmpl	$7, %edx
	jne	.LBB20_17
# BB#18:                                # %if_then_crit52.rv
                                        #   in Loop: Header=BB20_3 Depth=2
	movq	-120(%rsp), %rbx        # 8-byte Reload
	movl	-24(%rbx,%rbp,4), %ecx
	movl	%ecx, -96(%rsp)         # 4-byte Spill
	movq	-128(%rsp), %rcx        # 8-byte Reload
	vmovss	-24(%rcx,%rbp,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	movl	-20(%rbx,%rbp,4), %esi
	vmovss	-20(%rcx,%rbp,4), %xmm2 # xmm2 = mem[0],zero,zero,zero
	movl	-16(%rbx,%rbp,4), %edi
	vmovss	-16(%rcx,%rbp,4), %xmm3 # xmm3 = mem[0],zero,zero,zero
	movl	-12(%rbx,%rbp,4), %r12d
	vmovss	-12(%rcx,%rbp,4), %xmm4 # xmm4 = mem[0],zero,zero,zero
	movl	-8(%rbx,%rbp,4), %edx
	movl	%edx, -104(%rsp)        # 4-byte Spill
	movl	-8(%rcx,%rbp,4), %edx
	movl	%edx, -80(%rsp)         # 4-byte Spill
	movl	-4(%rbx,%rbp,4), %r14d
	movl	-4(%rcx,%rbp,4), %edx
	movl	%edx, -44(%rsp)         # 4-byte Spill
	movl	(%rbx,%rbp,4), %edx
	movl	%edx, -84(%rsp)         # 4-byte Spill
	vucomiss	%xmm2, %xmm1
	movl	%esi, %r15d
	movl	-96(%rsp), %edx         # 4-byte Reload
	cmovbl	%edx, %r15d
	vminss	%xmm2, %xmm1, %xmm0
	cmovbl	%esi, %edx
	vmaxss	%xmm1, %xmm2, %xmm1
	vucomiss	%xmm4, %xmm3
	movl	%r12d, %esi
	cmovbl	%edi, %esi
	vminss	%xmm4, %xmm3, %xmm2
	cmovbl	%r12d, %edi
	vmaxss	%xmm3, %xmm4, %xmm3
	vucomiss	%xmm3, %xmm1
	movl	%edi, %r12d
	cmovbl	%edx, %r12d
	vminss	%xmm3, %xmm1, %xmm4
	cmovael	%edx, %edi
	vucomiss	%xmm2, %xmm0
	movl	%esi, %edx
	cmovbl	%r15d, %edx
	movl	%edx, -96(%rsp)         # 4-byte Spill
	cmovael	%r15d, %esi
	vmaxss	%xmm0, %xmm2, %xmm5
	vucomiss	%xmm4, %xmm5
	movl	%r12d, %edx
	cmovbl	%esi, %edx
	cmovbl	%r12d, %esi
	movq	%rbx, %r12
	movl	(%rcx,%rbp,4), %ebx
	movl	%ebx, -108(%rsp)        # 4-byte Spill
	movl	%edi, -24(%r12,%rbp,4)
	movl	-44(%rsp), %r15d        # 4-byte Reload
	vmaxss	%xmm1, %xmm3, %xmm1
	vmovss	%xmm1, -24(%rcx,%rbp,4)
	movl	%esi, -20(%r12,%rbp,4)
	movq	%rcx, %rsi
	movl	-84(%rsp), %ecx         # 4-byte Reload
	vmaxss	%xmm5, %xmm4, %xmm1
	vmovss	%xmm1, -20(%rsi,%rbp,4)
	movl	%edx, -16(%r12,%rbp,4)
	vminss	%xmm4, %xmm5, %xmm1
	vmovss	%xmm1, -16(%rsi,%rbp,4)
	movl	-96(%rsp), %edx         # 4-byte Reload
	movl	%edx, -12(%r12,%rbp,4)
	leaq	-4(%r12,%rbp,4), %rdx
	movq	%rdx, -96(%rsp)         # 8-byte Spill
	vminss	%xmm2, %xmm0, %xmm0
	vmovss	%xmm0, -12(%rsi,%rbp,4)
	movl	-104(%rsp), %edx        # 4-byte Reload
	movl	%edx, -8(%r12,%rbp,4)
	leaq	-4(%rsi,%rbp,4), %rdx
	movq	%rdx, -104(%rsp)        # 8-byte Spill
	movl	-80(%rsp), %edx         # 4-byte Reload
	movl	%edx, -8(%rsi,%rbp,4)
	leaq	(%r12,%rbp,4), %rdx
	movq	%rdx, -80(%rsp)         # 8-byte Spill
	leaq	(%rsi,%rbp,4), %rdx
	movq	%rdx, -72(%rsp)         # 8-byte Spill
.LBB20_19:                              # %unlikely_cont60.rv.thread
                                        #   in Loop: Header=BB20_3 Depth=2
	movq	152(%rsp), %rdi
	movq	-56(%rsp), %rbp         # 8-byte Reload
	movq	-64(%rsp), %rbx         # 8-byte Reload
	jmp	.LBB20_26
.LBB20_21:                              # %if_then_crit54.rv
                                        #   in Loop: Header=BB20_3 Depth=2
	movslq	(%r11), %r15
	movl	-16(%r12,%r15,4), %r14d
	vmovss	-16(%rsi,%r15,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	movl	-12(%r12,%r15,4), %esi
	movq	-128(%rsp), %rcx        # 8-byte Reload
	vmovss	-12(%rcx,%r15,4), %xmm2 # xmm2 = mem[0],zero,zero,zero
	movl	-8(%r12,%r15,4), %edx
	movq	-128(%rsp), %rcx        # 8-byte Reload
	vmovss	-8(%rcx,%r15,4), %xmm3  # xmm3 = mem[0],zero,zero,zero
	leaq	-4(%r12,%r15,4), %rcx
	movq	%rcx, -96(%rsp)         # 8-byte Spill
	movl	-4(%r12,%r15,4), %ebx
	movq	-128(%rsp), %rcx        # 8-byte Reload
	vmovss	-4(%rcx,%r15,4), %xmm4  # xmm4 = mem[0],zero,zero,zero
	movl	(%r12,%r15,4), %edi
	vucomiss	%xmm2, %xmm1
	movl	%esi, %r12d
	cmovbl	%r14d, %r12d
	vminss	%xmm2, %xmm1, %xmm0
	cmovbl	%esi, %r14d
	vmaxss	%xmm1, %xmm2, %xmm1
	vucomiss	%xmm4, %xmm3
	movl	%ebx, %esi
	cmovbl	%edx, %esi
	vminss	%xmm4, %xmm3, %xmm2
	cmovbl	%ebx, %edx
	vmaxss	%xmm3, %xmm4, %xmm3
	vucomiss	%xmm3, %xmm1
	movl	%edx, %ecx
	cmovbl	%r14d, %ecx
	vminss	%xmm3, %xmm1, %xmm4
	vmaxss	%xmm1, %xmm3, %xmm1
	cmovael	%r14d, %edx
	vucomiss	%xmm2, %xmm0
	movl	%esi, %r14d
	cmovbl	%r12d, %r14d
	cmovael	%r12d, %esi
	vmaxss	%xmm0, %xmm2, %xmm3
	vucomiss	%xmm4, %xmm3
	movl	%ecx, %r12d
	cmovbl	%esi, %r12d
	cmovbl	%ecx, %esi
	movq	-128(%rsp), %rcx        # 8-byte Reload
	movl	(%rcx,%r15,4), %ecx
	movl	%ecx, -108(%rsp)        # 4-byte Spill
	movq	-120(%rsp), %rcx        # 8-byte Reload
	movl	%edx, -16(%rcx,%r15,4)
	movq	-128(%rsp), %rcx        # 8-byte Reload
	leaq	-4(%rcx,%r15,4), %rcx
	movq	%rcx, -104(%rsp)        # 8-byte Spill
	movq	-128(%rsp), %rcx        # 8-byte Reload
	vmovss	%xmm1, -16(%rcx,%r15,4)
	movq	-120(%rsp), %rcx        # 8-byte Reload
	movl	%esi, -12(%rcx,%r15,4)
	movq	-128(%rsp), %rsi        # 8-byte Reload
	movq	-120(%rsp), %rcx        # 8-byte Reload
	leaq	(%rcx,%r15,4), %rcx
	movq	%rcx, -80(%rsp)         # 8-byte Spill
	vmaxss	%xmm3, %xmm4, %xmm1
	vmovss	%xmm1, -12(%rsi,%r15,4)
	movq	-120(%rsp), %rcx        # 8-byte Reload
	movl	%r12d, -8(%rcx,%r15,4)
	movl	%edi, %ecx
	movq	-64(%rsp), %rbx         # 8-byte Reload
	movq	-56(%rsp), %rbp         # 8-byte Reload
	movq	152(%rsp), %rdi
	movq	-120(%rsp), %r12        # 8-byte Reload
	leaq	(%rsi,%r15,4), %rdx
	movq	%rdx, -72(%rsp)         # 8-byte Spill
	vminss	%xmm2, %xmm0, %xmm0
	vminss	%xmm4, %xmm3, %xmm1
	vmovss	%xmm1, -8(%rsi,%r15,4)
	vmovd	%xmm0, %r15d
	jmp	.LBB20_26
.LBB20_20:                              # %if_then_crit53.rv
                                        #   in Loop: Header=BB20_3 Depth=2
	movslq	(%r11), %r15
	movl	-20(%r12,%r15,4), %ebp
	vmovss	-20(%rsi,%r15,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	movl	-16(%r12,%r15,4), %esi
	movq	-128(%rsp), %rcx        # 8-byte Reload
	vmovss	-16(%rcx,%r15,4), %xmm2 # xmm2 = mem[0],zero,zero,zero
	movl	-12(%r12,%r15,4), %ebx
	movq	-128(%rsp), %rcx        # 8-byte Reload
	vmovss	-12(%rcx,%r15,4), %xmm3 # xmm3 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rcx        # 8-byte Reload
	movl	-8(%rcx,%r15,4), %r12d
	movq	-128(%rsp), %rcx        # 8-byte Reload
	vmovss	-8(%rcx,%r15,4), %xmm4  # xmm4 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rcx        # 8-byte Reload
	movl	-4(%rcx,%r15,4), %r14d
	movq	-128(%rsp), %rcx        # 8-byte Reload
	movl	-4(%rcx,%r15,4), %ecx
	movl	%ecx, -44(%rsp)         # 4-byte Spill
	movq	-120(%rsp), %rcx        # 8-byte Reload
	movl	(%rcx,%r15,4), %edi
	vucomiss	%xmm2, %xmm1
	movl	%esi, %ecx
	cmovbl	%ebp, %ecx
	vminss	%xmm2, %xmm1, %xmm0
	cmovbl	%esi, %ebp
	vmaxss	%xmm1, %xmm2, %xmm1
	vucomiss	%xmm4, %xmm3
	movl	%r12d, %esi
	cmovbl	%ebx, %esi
	vminss	%xmm4, %xmm3, %xmm2
	cmovbl	%r12d, %ebx
	vmaxss	%xmm3, %xmm4, %xmm3
	vucomiss	%xmm3, %xmm1
	movl	%ebx, %edx
	cmovbl	%ebp, %edx
	vminss	%xmm3, %xmm1, %xmm4
	cmovael	%ebp, %ebx
	vucomiss	%xmm2, %xmm0
	movl	%esi, %ebp
	cmovbl	%ecx, %ebp
	movl	%ebp, -80(%rsp)         # 4-byte Spill
	cmovael	%ecx, %esi
	vmaxss	%xmm0, %xmm2, %xmm5
	vucomiss	%xmm4, %xmm5
	movl	%edx, %r12d
	cmovbl	%esi, %r12d
	cmovbl	%edx, %esi
	movq	-128(%rsp), %rcx        # 8-byte Reload
	movl	(%rcx,%r15,4), %ecx
	movl	%ecx, -108(%rsp)        # 4-byte Spill
	movq	-120(%rsp), %rcx        # 8-byte Reload
	movl	%ebx, -20(%rcx,%r15,4)
	vmaxss	%xmm1, %xmm3, %xmm1
	movq	-128(%rsp), %rcx        # 8-byte Reload
	vmovss	%xmm1, -20(%rcx,%r15,4)
	movq	-120(%rsp), %rcx        # 8-byte Reload
	movl	%esi, -16(%rcx,%r15,4)
	movq	-128(%rsp), %rsi        # 8-byte Reload
	movq	-120(%rsp), %rcx        # 8-byte Reload
	leaq	-4(%rcx,%r15,4), %rcx
	movq	%rcx, -96(%rsp)         # 8-byte Spill
	vmaxss	%xmm5, %xmm4, %xmm1
	vmovss	%xmm1, -16(%rsi,%r15,4)
	movq	-120(%rsp), %rcx        # 8-byte Reload
	movl	%r12d, -12(%rcx,%r15,4)
	movl	%edi, %ecx
	movq	-64(%rsp), %rbx         # 8-byte Reload
	movq	-56(%rsp), %rbp         # 8-byte Reload
	movq	152(%rsp), %rdi
	movq	-120(%rsp), %r12        # 8-byte Reload
	leaq	-4(%rsi,%r15,4), %rdx
	movq	%rdx, -104(%rsp)        # 8-byte Spill
	vminss	%xmm4, %xmm5, %xmm1
	vmovss	%xmm1, -12(%rsi,%r15,4)
	movl	-80(%rsp), %edx         # 4-byte Reload
	movl	%edx, -8(%r12,%r15,4)
	leaq	(%r12,%r15,4), %rdx
	movq	%rdx, -80(%rsp)         # 8-byte Spill
	vminss	%xmm2, %xmm0, %xmm0
	vmovss	%xmm0, -8(%rsi,%r15,4)
	leaq	(%rsi,%r15,4), %rdx
	movq	%rdx, -72(%rsp)         # 8-byte Spill
	movl	-44(%rsp), %r15d        # 4-byte Reload
	jmp	.LBB20_26
.LBB20_17:                              # %if_else51.rv
                                        #   in Loop: Header=BB20_3 Depth=2
	movq	-120(%rsp), %rbx        # 8-byte Reload
	movl	-28(%rbx,%rbp,4), %edx
	movq	-128(%rsp), %rcx        # 8-byte Reload
	vmovss	-28(%rcx,%rbp,4), %xmm0 # xmm0 = mem[0],zero,zero,zero
	movl	-24(%rbx,%rbp,4), %r15d
	vmovss	-24(%rcx,%rbp,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	movl	-20(%rbx,%rbp,4), %r12d
	vmovss	-20(%rcx,%rbp,4), %xmm3 # xmm3 = mem[0],zero,zero,zero
	movl	-16(%rbx,%rbp,4), %r14d
	vmovss	-16(%rcx,%rbp,4), %xmm7 # xmm7 = mem[0],zero,zero,zero
	movl	-12(%rbx,%rbp,4), %esi
	movl	%esi, -96(%rsp)         # 4-byte Spill
	vmovss	-12(%rcx,%rbp,4), %xmm4 # xmm4 = mem[0],zero,zero,zero
	movl	-8(%rbx,%rbp,4), %edi
	vmovss	-8(%rcx,%rbp,4), %xmm5  # xmm5 = mem[0],zero,zero,zero
	movl	-4(%rbx,%rbp,4), %esi
	movl	%esi, -104(%rsp)        # 4-byte Spill
	vmovss	-4(%rcx,%rbp,4), %xmm12 # xmm12 = mem[0],zero,zero,zero
	movl	(%rbx,%rbp,4), %esi
	movl	%esi, -72(%rsp)         # 4-byte Spill
	vmovss	(%rcx,%rbp,4), %xmm6    # xmm6 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	movl	%r15d, %ecx
	cmovbl	%edx, %ecx
	vminss	%xmm1, %xmm0, %xmm2
	cmovbl	%r15d, %edx
	vmaxss	%xmm0, %xmm1, %xmm0
	vucomiss	%xmm7, %xmm3
	movl	%r14d, %r15d
	cmovbl	%r12d, %r15d
	vminss	%xmm7, %xmm3, %xmm1
	cmovbl	%r14d, %r12d
	vmaxss	%xmm3, %xmm7, %xmm3
	vucomiss	%xmm3, %xmm0
	movl	%r12d, %esi
	cmovbl	%edx, %esi
	vminss	%xmm3, %xmm0, %xmm7
	cmovael	%edx, %r12d
	vmaxss	%xmm0, %xmm3, %xmm9
	vucomiss	%xmm1, %xmm2
	movl	%r15d, %edx
	cmovbl	%ecx, %edx
	movl	%edx, -108(%rsp)        # 4-byte Spill
	vminss	%xmm1, %xmm2, %xmm8
	cmovael	%ecx, %r15d
	vmaxss	%xmm2, %xmm1, %xmm0
	vucomiss	%xmm7, %xmm0
	movl	%esi, %ecx
	cmovbl	%r15d, %ecx
	movl	%ecx, -80(%rsp)         # 4-byte Spill
	vminss	%xmm7, %xmm0, %xmm3
	cmovbl	%esi, %r15d
	vmaxss	%xmm0, %xmm7, %xmm7
	vucomiss	%xmm5, %xmm4
	movl	%edi, %ecx
	movl	%ecx, %edx
	movl	-96(%rsp), %edi         # 4-byte Reload
	cmovbl	%edi, %edx
	vminss	%xmm5, %xmm4, %xmm0
	cmovbl	%ecx, %edi
	movl	%edi, %ebx
	vmaxss	%xmm4, %xmm5, %xmm1
	vucomiss	%xmm6, %xmm12
	movl	-72(%rsp), %esi         # 4-byte Reload
	movl	%esi, %ecx
	movl	-104(%rsp), %edi        # 4-byte Reload
	cmovbl	%edi, %ecx
	vminss	%xmm6, %xmm12, %xmm2
	cmovbl	%esi, %edi
	vmaxss	%xmm12, %xmm6, %xmm4
	vucomiss	%xmm4, %xmm1
	movl	%edi, %esi
	cmovbl	%ebx, %esi
	vminss	%xmm4, %xmm1, %xmm6
	cmovael	%ebx, %edi
	vmaxss	%xmm1, %xmm4, %xmm13
	vucomiss	%xmm2, %xmm0
	movl	%ecx, %ebx
	cmovbl	%edx, %ebx
	vminss	%xmm2, %xmm0, %xmm12
	cmovael	%edx, %ecx
	vmaxss	%xmm0, %xmm2, %xmm0
	vucomiss	%xmm6, %xmm0
	movl	%esi, %edx
	cmovbl	%ecx, %edx
	vminss	%xmm6, %xmm0, %xmm1
	cmovbl	%esi, %ecx
	vmaxss	%xmm0, %xmm6, %xmm4
	vucomiss	%xmm13, %xmm9
	movl	%edi, %esi
	cmovbl	%r12d, %esi
	vminss	%xmm13, %xmm9, %xmm0
	cmovael	%r12d, %edi
	movl	%edi, -104(%rsp)        # 4-byte Spill
	vucomiss	%xmm1, %xmm3
	movl	%edx, %edi
	movl	-80(%rsp), %r12d        # 4-byte Reload
	cmovbl	%r12d, %edi
	movl	%edi, -96(%rsp)         # 4-byte Spill
	vminss	%xmm1, %xmm3, %xmm6
	cmovael	%r12d, %edx
	vmaxss	%xmm3, %xmm1, %xmm1
	vucomiss	%xmm0, %xmm1
	movl	%esi, %r14d
	cmovbl	%edx, %r14d
	vminss	%xmm0, %xmm1, %xmm2
	cmovbl	%esi, %edx
	vmaxss	%xmm1, %xmm0, %xmm0
	vucomiss	%xmm4, %xmm7
	movl	%ecx, %esi
	cmovbl	%r15d, %esi
	vminss	%xmm4, %xmm7, %xmm5
	cmovael	%r15d, %ecx
	vmaxss	%xmm7, %xmm4, %xmm1
	vucomiss	%xmm12, %xmm8
	movl	%ebx, %edi
	movl	-108(%rsp), %r15d       # 4-byte Reload
	cmovbl	%r15d, %ebx
	movl	%ebx, -84(%rsp)         # 4-byte Spill
	cmovael	%r15d, %edi
	vmaxss	%xmm8, %xmm12, %xmm4
	vucomiss	%xmm5, %xmm4
	vminss	%xmm5, %xmm4, %xmm3
	vmaxss	%xmm4, %xmm5, %xmm4
	movl	%esi, %r15d
	cmovbl	%edi, %r15d
	cmovbl	%esi, %edi
	movl	%edi, %ebx
	vucomiss	%xmm0, %xmm1
	movl	%edx, %r12d
	cmovbl	%ecx, %r12d
	cmovbl	%edx, %ecx
	vucomiss	%xmm2, %xmm4
	movl	%r14d, %edx
	cmovbl	%ebx, %edx
	movl	%edx, -72(%rsp)         # 4-byte Spill
	cmovbl	%r14d, %ebx
	vucomiss	%xmm6, %xmm3
	movl	-96(%rsp), %edx         # 4-byte Reload
	movl	%edx, %r14d
	cmovbl	%r15d, %r14d
	cmovbl	%edx, %r15d
	movq	-120(%rsp), %rdi        # 8-byte Reload
	movl	-104(%rsp), %esi        # 4-byte Reload
	movl	%esi, -28(%rdi,%rbp,4)
	vmaxss	%xmm9, %xmm13, %xmm5
	movq	-128(%rsp), %rsi        # 8-byte Reload
	vmovss	%xmm5, -28(%rsi,%rbp,4)
	movl	%ecx, -24(%rdi,%rbp,4)
	movl	-84(%rsp), %ecx         # 4-byte Reload
	leaq	-4(%rdi,%rbp,4), %rdx
	movq	%rdx, -96(%rsp)         # 8-byte Spill
	vmaxss	%xmm1, %xmm0, %xmm5
	vmovss	%xmm5, -24(%rsi,%rbp,4)
	movl	%r12d, -20(%rdi,%rbp,4)
	movq	%rdi, %r12
	leaq	-4(%rsi,%rbp,4), %rdx
	movq	%rdx, -104(%rsp)        # 8-byte Spill
	vminss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, -20(%rsi,%rbp,4)
	movl	%ebx, -16(%r12,%rbp,4)
	leaq	(%r12,%rbp,4), %rdx
	movq	%rdx, -80(%rsp)         # 8-byte Spill
	vmaxss	%xmm4, %xmm2, %xmm0
	vmovss	%xmm0, -16(%rsi,%rbp,4)
	movl	-72(%rsp), %edx         # 4-byte Reload
	movl	%edx, -12(%r12,%rbp,4)
	leaq	(%rsi,%rbp,4), %rdx
	movq	%rdx, -72(%rsp)         # 8-byte Spill
	vminss	%xmm12, %xmm8, %xmm0
	vminss	%xmm2, %xmm4, %xmm1
	vminss	%xmm6, %xmm3, %xmm2
	vmaxss	%xmm3, %xmm6, %xmm3
	vmovss	%xmm1, -12(%rsi,%rbp,4)
	movl	%r15d, -8(%r12,%rbp,4)
	vmovss	%xmm3, -8(%rsi,%rbp,4)
	vmovd	%xmm2, %r15d
	vmovd	%xmm0, -108(%rsp)       # 4-byte Folded Spill
	jmp	.LBB20_19
	.p2align	4, 0x90
.LBB20_3:                               # %while_body5.rv
                                        #   Parent Loop BB20_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB20_7 Depth 3
	vmovd	(%r9), %xmm1            # xmm1 = mem[0],zero,zero,zero
	movslq	(%r11), %rcx
	movl	(%r12,%rcx,4), %ecx
	movl	%ecx, (%r8)
	movslq	(%r11), %rcx
	movl	(%rsi,%rcx,4), %ecx
	movl	%ecx, (%r9)
	decl	(%r11)
	vmovd	52(%rax), %xmm0         # xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	jbe	.LBB20_4
# BB#5:                                 # %rv_align_cont.rv
                                        #   in Loop: Header=BB20_3 Depth=2
	movslq	%r14d, %rdx
	addq	$-1, %rdx
	shlq	$8, %rdx
	addq	%rdi, %rdx
	vbroadcastss	24(%rax), %ymm1
	vbroadcastss	28(%rax), %ymm2
	vbroadcastss	32(%rax), %ymm3
	vbroadcastss	36(%rax), %ymm4
	vmovaps	(%rbp,%rdx), %ymm5
	vfmadd213ps	%ymm4, %ymm1, %ymm5
	movq	-32(%rsp), %rcx         # 8-byte Reload
	vfmadd231ps	(%rcx,%rdx), %ymm1, %ymm4
	vbroadcastss	40(%rax), %ymm1
	vmovaps	(%rbx,%rdx), %ymm6
	vfmadd213ps	%ymm1, %ymm2, %ymm6
	vfmadd231ps	(%r13,%rdx), %ymm2, %ymm1
	vbroadcastss	44(%rax), %ymm2
	movq	-24(%rsp), %rcx         # 8-byte Reload
	vmovaps	(%rcx,%rdx), %ymm7
	vfmadd213ps	%ymm2, %ymm3, %ymm7
	vfmadd231ps	(%r10,%rdx), %ymm3, %ymm2
	vpmaxsd	%ymm5, %ymm6, %ymm3
	vpminsd	%ymm1, %ymm4, %ymm1
	vpbroadcastd	48(%rax), %ymm4
	vpbroadcastd	%xmm0, %ymm0
	vpmaxsd	%ymm7, %ymm4, %ymm4
	vpminsd	%ymm0, %ymm2, %ymm0
	vpmaxsd	%ymm3, %ymm4, %ymm2
	vpminsd	%ymm0, %ymm1, %ymm0
	vpcmpgtd	%ymm0, %ymm2, %ymm0
	vmovmskps	%ymm0, %r15d
	xorl	$255, %r15d
	jne	.LBB20_6
.LBB20_4:                               # %while_head1.rv.backedge
                                        #   in Loop: Header=BB20_3 Depth=2
	movl	(%r8), %r14d
	testl	%r14d, %r14d
	jg	.LBB20_3
# BB#29:                                # %unlikely_cont65.rv
                                        #   in Loop: Header=BB20_2 Depth=1
	testl	%r14d, %r14d
	js	.LBB20_30
.LBB20_31:                              # %while_head.rv.backedge
                                        #   in Loop: Header=BB20_2 Depth=1
	movl	(%r8), %r14d
	testl	%r14d, %r14d
	jne	.LBB20_2
.LBB20_32:                              # %next.rv
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.Lfunc_end20:
	.size	lambda_2678908_vectorize, .Lfunc_end20-lambda_2678908_vectorize
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI20_0:
	.quad	.LBB20_24
	.quad	.LBB20_23
	.quad	.LBB20_22
	.quad	.LBB20_21
	.quad	.LBB20_20

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI21_0:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
.LCPI21_3:
	.zero	16
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI21_1:
	.long	2147483648              # 0x80000000
.LCPI21_2:
	.long	1065353216              # float 1
	.text
	.globl	lambda_2672495_vectorize
	.p2align	4, 0x90
	.type	lambda_2672495_vectorize,@function
lambda_2672495_vectorize:               # @lambda_2672495_vectorize
# BB#0:                                 # %lambda_2672495_start.rv
	subq	$24, %rsp
	movq	32(%rsp), %r8
	notl	%ecx
	movslq	%edi, %rdi
	vbroadcastss	12(%r8), %xmm14
	vbroadcastss	16(%r8), %xmm1
	vbroadcastss	20(%r8), %xmm2
	vbroadcastss	8(%r8), %xmm0
	vmovaps	%xmm0, -48(%rsp)        # 16-byte Spill
	vbroadcastss	(%r8), %xmm0
	vmovaps	%xmm0, -64(%rsp)        # 16-byte Spill
	vbroadcastss	4(%r8), %xmm0
	vmovaps	%xmm0, -80(%rsp)        # 16-byte Spill
	movslq	%ecx, %rax
	imulq	$208, %rax, %rax
	addq	%r9, %rax
	vbroadcastss	.LCPI21_1(%rip), %xmm0
	vmovaps	%xmm0, -96(%rsp)        # 16-byte Spill
	.p2align	4, 0x90
.LBB21_1:                               # %while_head.rv
                                        # =>This Inner Loop Header: Depth=1
	vmovaps	144(%rax,%rdi,4), %xmm7
	vmovaps	160(%rax,%rdi,4), %xmm13
	vmovaps	176(%rax,%rdi,4), %xmm0
	vmulps	%xmm13, %xmm1, %xmm4
	vfmadd231ps	%xmm7, %xmm14, %xmm4
	vmovaps	%xmm0, -112(%rsp)       # 16-byte Spill
	vfmadd231ps	%xmm0, %xmm2, %xmm4
	vandps	.LCPI21_0(%rip), %xmm4, %xmm15
	vmovaps	32(%rax,%rdi,4), %xmm5
	vmovaps	16(%rax,%rdi,4), %xmm6
	vmovaps	(%rax,%rdi,4), %xmm3
	vandps	-96(%rsp), %xmm4, %xmm4 # 16-byte Folded Reload
	vsubps	-48(%rsp), %xmm5, %xmm8 # 16-byte Folded Reload
	vmulps	%xmm8, %xmm14, %xmm5
	vsubps	-64(%rsp), %xmm3, %xmm10 # 16-byte Folded Reload
	vsubps	-80(%rsp), %xmm6, %xmm9 # 16-byte Folded Reload
	vmulps	%xmm10, %xmm1, %xmm3
	vmulps	%xmm9, %xmm2, %xmm6
	vfmsub231ps	%xmm9, %xmm14, %xmm3
	vfmsub231ps	%xmm10, %xmm2, %xmm5
	vmulps	112(%rax,%rdi,4), %xmm5, %xmm0
	vfmsub231ps	%xmm8, %xmm1, %xmm6
	vmulps	64(%rax,%rdi,4), %xmm5, %xmm5
	vfmadd231ps	96(%rax,%rdi,4), %xmm6, %xmm0
	vfmadd231ps	48(%rax,%rdi,4), %xmm6, %xmm5
	vfmadd231ps	128(%rax,%rdi,4), %xmm3, %xmm0
	vfmadd231ps	80(%rax,%rdi,4), %xmm3, %xmm5
	vxorps	%xmm0, %xmm4, %xmm6
	vxorps	%xmm5, %xmm4, %xmm5
	vxorps	%xmm3, %xmm3, %xmm3
	vcmpleps	%xmm6, %xmm3, %xmm0
	vcmpleps	%xmm5, %xmm3, %xmm3
	vandps	%xmm0, %xmm3, %xmm11
	vaddps	%xmm5, %xmm6, %xmm0
	vcmpleps	%xmm15, %xmm0, %xmm12
	vptest	%xmm12, %xmm11
	jne	.LBB21_2
.LBB21_5:                               # %next.rv
                                        #   in Loop: Header=BB21_1 Depth=1
	cmpl	$0, 204(%rax)
	leaq	208(%rax), %rax
	jns	.LBB21_1
	jmp	.LBB21_6
.LBB21_2:                               # %if_else_crit.rv
                                        #   in Loop: Header=BB21_1 Depth=1
	vandps	%xmm12, %xmm11, %xmm0
	vmovaps	%xmm0, -128(%rsp)       # 16-byte Spill
	vcmpneq_usps	.LCPI21_3, %xmm15, %xmm11
	vbroadcastss	52(%r8), %xmm3
	vmulps	%xmm3, %xmm15, %xmm0
	vmulps	%xmm10, %xmm7, %xmm3
	vbroadcastss	48(%r8), %xmm7
	vmulps	%xmm7, %xmm15, %xmm7
	vfmadd213ps	%xmm3, %xmm13, %xmm9
	vfmadd132ps	-112(%rsp), %xmm9, %xmm8 # 16-byte Folded Reload
	vxorps	%xmm8, %xmm4, %xmm3
	vcmpleps	%xmm0, %xmm3, %xmm0
	vcmpleps	%xmm3, %xmm7, %xmm4
	vandps	%xmm11, %xmm0, %xmm0
	vandps	%xmm4, %xmm0, %xmm4
	vmovdqa	-128(%rsp), %xmm0       # 16-byte Reload
	vptest	%xmm4, %xmm0
	je	.LBB21_5
# BB#3:                                 # %if_else_crit5.rv
                                        #   in Loop: Header=BB21_1 Depth=1
	vpand	%xmm0, %xmm4, %xmm0
	vmovmskps	%xmm0, %ecx
	testl	%ecx, %ecx
	je	.LBB21_5
# BB#4:                                 # %if_then.rv
	tzcntl	%ecx, %ecx
	vrcpps	%xmm15, %xmm0
	vbroadcastss	.LCPI21_2(%rip), %xmm1
	vfnmadd213ps	%xmm1, %xmm0, %xmm15
	vfmadd132ps	%xmm0, %xmm0, %xmm15
	vmulps	%xmm3, %xmm15, %xmm0
	movl	%ecx, %edi
	andl	$3, %edi
	vmovaps	%xmm0, -32(%rsp)
	vmovss	-32(%rsp,%rdi,4), %xmm0 # xmm0 = mem[0],zero,zero,zero
	vmulps	%xmm6, %xmm15, %xmm1
	vmovaps	%xmm1, -16(%rsp)
	vmovss	-16(%rsp,%rdi,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	vmulps	%xmm5, %xmm15, %xmm2
	vmovaps	%xmm2, (%rsp)
	vmovss	(%rsp,%rdi,4), %xmm2    # xmm2 = mem[0],zero,zero,zero
	movl	$2147483647, %edi       # imm = 0x7FFFFFFF
	andl	192(%rax,%rcx,4), %edi
	vmovss	%xmm0, (%rsi)
	vmovss	%xmm1, 4(%rsi)
	vmovss	%xmm2, 8(%rsi)
	movl	%edi, 12(%rsi)
	movb	$1, (%rdx)
	addq	$24, %rsp
	retq
.LBB21_6:                               # %break.rv
	addq	$24, %rsp
	retq
.Lfunc_end21:
	.size	lambda_2672495_vectorize, .Lfunc_end21-lambda_2672495_vectorize

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI22_0:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI22_1:
	.long	2147483648              # 0x80000000
.LCPI22_2:
	.long	1065353216              # float 1
	.text
	.globl	lambda_2665177_vectorize
	.p2align	4, 0x90
	.type	lambda_2665177_vectorize,@function
lambda_2665177_vectorize:               # @lambda_2665177_vectorize
# BB#0:                                 # %lambda_2665177_start.rv
	subq	$24, %rsp
	movq	32(%rsp), %r8
	notl	%ecx
	movslq	%edi, %rdi
	vbroadcastss	12(%r8), %xmm0
	vmovaps	%xmm0, -96(%rsp)        # 16-byte Spill
	vbroadcastss	16(%r8), %xmm0
	vmovaps	%xmm0, -112(%rsp)       # 16-byte Spill
	vbroadcastss	20(%r8), %xmm14
	vbroadcastss	8(%r8), %xmm0
	vmovaps	%xmm0, -48(%rsp)        # 16-byte Spill
	vbroadcastss	4(%r8), %xmm0
	vmovaps	%xmm0, -64(%rsp)        # 16-byte Spill
	vbroadcastss	(%r8), %xmm0
	vmovaps	%xmm0, -80(%rsp)        # 16-byte Spill
	movslq	%ecx, %rax
	imulq	$208, %rax, %rax
	addq	%r9, %rax
	vbroadcastss	.LCPI22_1(%rip), %xmm0
	vmovaps	%xmm0, -128(%rsp)       # 16-byte Spill
	.p2align	4, 0x90
.LBB22_1:                               # %while_head.rv
                                        # =>This Inner Loop Header: Depth=1
	vmovaps	144(%rax,%rdi,4), %xmm7
	vmovaps	160(%rax,%rdi,4), %xmm13
	vmovaps	176(%rax,%rdi,4), %xmm15
	vmovaps	-112(%rsp), %xmm2       # 16-byte Reload
	vmulps	%xmm13, %xmm2, %xmm0
	vmovaps	-96(%rsp), %xmm6        # 16-byte Reload
	vfmadd231ps	%xmm7, %xmm6, %xmm0
	vfmadd231ps	%xmm15, %xmm14, %xmm0
	vandps	.LCPI22_0(%rip), %xmm0, %xmm3
	vmovaps	32(%rax,%rdi,4), %xmm4
	vmovaps	16(%rax,%rdi,4), %xmm5
	vmovaps	(%rax,%rdi,4), %xmm1
	vandps	-128(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
	vsubps	-48(%rsp), %xmm4, %xmm8 # 16-byte Folded Reload
	vsubps	-64(%rsp), %xmm5, %xmm9 # 16-byte Folded Reload
	vsubps	-80(%rsp), %xmm1, %xmm10 # 16-byte Folded Reload
	vmulps	%xmm8, %xmm6, %xmm1
	vmulps	%xmm9, %xmm14, %xmm4
	vmulps	%xmm10, %xmm2, %xmm5
	vfmsub231ps	%xmm8, %xmm2, %xmm4
	vfmsub231ps	%xmm10, %xmm14, %xmm1
	vmulps	112(%rax,%rdi,4), %xmm1, %xmm2
	vfmsub231ps	%xmm9, %xmm6, %xmm5
	vmulps	64(%rax,%rdi,4), %xmm1, %xmm1
	vfmadd231ps	96(%rax,%rdi,4), %xmm4, %xmm2
	vfmadd231ps	48(%rax,%rdi,4), %xmm4, %xmm1
	vfmadd231ps	128(%rax,%rdi,4), %xmm5, %xmm2
	vfmadd231ps	80(%rax,%rdi,4), %xmm5, %xmm1
	vxorps	%xmm2, %xmm0, %xmm5
	vxorps	%xmm1, %xmm0, %xmm4
	vxorps	%xmm2, %xmm2, %xmm2
	vcmpleps	%xmm5, %xmm2, %xmm1
	vxorps	%xmm6, %xmm6, %xmm6
	vcmpleps	%xmm4, %xmm2, %xmm2
	vandps	%xmm1, %xmm2, %xmm11
	vaddps	%xmm4, %xmm5, %xmm1
	vcmpleps	%xmm3, %xmm1, %xmm12
	vptest	%xmm12, %xmm11
	jne	.LBB22_2
.LBB22_5:                               # %next.rv
                                        #   in Loop: Header=BB22_1 Depth=1
	cmpl	$0, 204(%rax)
	leaq	208(%rax), %rax
	jns	.LBB22_1
	jmp	.LBB22_6
.LBB22_2:                               # %if_else_crit.rv
                                        #   in Loop: Header=BB22_1 Depth=1
	vpand	%xmm12, %xmm11, %xmm12
	vcmpneq_usps	%xmm6, %xmm3, %xmm1
	vmovaps	%xmm3, %xmm11
	vmulps	%xmm10, %xmm7, %xmm2
	vfmadd213ps	%xmm2, %xmm13, %xmm9
	vfmadd213ps	%xmm9, %xmm15, %xmm8
	vbroadcastss	52(%r8), %xmm2
	vmulps	%xmm2, %xmm11, %xmm2
	vbroadcastss	48(%r8), %xmm3
	vmulps	%xmm3, %xmm11, %xmm3
	vxorps	%xmm8, %xmm0, %xmm0
	vcmpleps	%xmm2, %xmm0, %xmm2
	vcmpleps	%xmm0, %xmm3, %xmm3
	vandps	%xmm1, %xmm2, %xmm1
	vandps	%xmm3, %xmm1, %xmm3
	vptest	%xmm3, %xmm12
	je	.LBB22_5
# BB#3:                                 # %if_else_crit5.rv
                                        #   in Loop: Header=BB22_1 Depth=1
	vpand	%xmm12, %xmm3, %xmm1
	vmovmskps	%xmm1, %ecx
	testl	%ecx, %ecx
	je	.LBB22_5
# BB#4:                                 # %if_then.rv
	tzcntl	%ecx, %ecx
	vrcpps	%xmm11, %xmm1
	vbroadcastss	.LCPI22_2(%rip), %xmm2
	vfnmadd213ps	%xmm2, %xmm1, %xmm11
	vfmadd132ps	%xmm1, %xmm1, %xmm11
	movl	%ecx, %edi
	andl	$3, %edi
	vmulps	%xmm0, %xmm11, %xmm0
	vmovaps	%xmm0, -32(%rsp)
	vmovss	-32(%rsp,%rdi,4), %xmm0 # xmm0 = mem[0],zero,zero,zero
	vmulps	%xmm5, %xmm11, %xmm1
	vmovaps	%xmm1, -16(%rsp)
	vmovss	-16(%rsp,%rdi,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	vmulps	%xmm4, %xmm11, %xmm2
	vmovaps	%xmm2, (%rsp)
	vmovss	(%rsp,%rdi,4), %xmm2    # xmm2 = mem[0],zero,zero,zero
	movl	$2147483647, %edi       # imm = 0x7FFFFFFF
	andl	192(%rax,%rcx,4), %edi
	vmovss	%xmm0, (%rsi)
	vmovss	%xmm1, 4(%rsi)
	vmovss	%xmm2, 8(%rsi)
	movl	%edi, 12(%rsi)
	movb	$1, (%rdx)
	addq	$24, %rsp
	retq
.LBB22_6:                               # %break.rv
	addq	$24, %rsp
	retq
.Lfunc_end22:
	.size	lambda_2665177_vectorize, .Lfunc_end22-lambda_2665177_vectorize

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI23_0:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI23_1:
	.long	2147483648              # 0x80000000
.LCPI23_2:
	.long	1065353216              # float 1
	.text
	.globl	lambda_2670365_vectorize
	.p2align	4, 0x90
	.type	lambda_2670365_vectorize,@function
lambda_2670365_vectorize:               # @lambda_2670365_vectorize
# BB#0:                                 # %lambda_2670365_start.rv
	subq	$24, %rsp
	movq	32(%rsp), %rax
	notl	%r8d
	movslq	%edi, %rdi
	vbroadcastss	12(%rcx), %xmm0
	vmovaps	%xmm0, -96(%rsp)        # 16-byte Spill
	vbroadcastss	16(%rcx), %xmm14
	vbroadcastss	20(%rcx), %xmm15
	vbroadcastss	(%rcx), %xmm0
	vmovaps	%xmm0, -48(%rsp)        # 16-byte Spill
	vbroadcastss	8(%rcx), %xmm0
	vmovaps	%xmm0, -64(%rsp)        # 16-byte Spill
	vbroadcastss	4(%rcx), %xmm0
	vmovaps	%xmm0, -80(%rsp)        # 16-byte Spill
	movslq	%r8d, %rsi
	imulq	$208, %rsi, %rsi
	addq	%rdx, %rsi
	vbroadcastss	.LCPI23_1(%rip), %xmm0
	vmovaps	%xmm0, -112(%rsp)       # 16-byte Spill
	.p2align	4, 0x90
.LBB23_1:                               # %while_head.rv
                                        # =>This Inner Loop Header: Depth=1
	vmovaps	144(%rsi,%rdi,4), %xmm7
	vmovaps	160(%rsi,%rdi,4), %xmm13
	vmovaps	176(%rsi,%rdi,4), %xmm0
	vmulps	%xmm13, %xmm14, %xmm3
	vmovaps	-96(%rsp), %xmm1        # 16-byte Reload
	vfmadd231ps	%xmm7, %xmm1, %xmm3
	vmovaps	%xmm0, -128(%rsp)       # 16-byte Spill
	vfmadd231ps	%xmm0, %xmm15, %xmm3
	vandps	.LCPI23_0(%rip), %xmm3, %xmm6
	vmovaps	32(%rsi,%rdi,4), %xmm4
	vmovaps	16(%rsi,%rdi,4), %xmm5
	vmovaps	(%rsi,%rdi,4), %xmm0
	vsubps	-48(%rsp), %xmm0, %xmm10 # 16-byte Folded Reload
	vsubps	-64(%rsp), %xmm4, %xmm4 # 16-byte Folded Reload
	vandps	-112(%rsp), %xmm3, %xmm8 # 16-byte Folded Reload
	vsubps	-80(%rsp), %xmm5, %xmm9 # 16-byte Folded Reload
	vmulps	%xmm10, %xmm14, %xmm0
	vmulps	%xmm4, %xmm1, %xmm3
	vmulps	%xmm9, %xmm15, %xmm5
	vfmsub231ps	%xmm9, %xmm1, %xmm0
	vfmsub231ps	%xmm10, %xmm15, %xmm3
	vmulps	112(%rsi,%rdi,4), %xmm3, %xmm1
	vfmsub231ps	%xmm4, %xmm14, %xmm5
	vmulps	64(%rsi,%rdi,4), %xmm3, %xmm2
	vfmadd231ps	96(%rsi,%rdi,4), %xmm5, %xmm1
	vfmadd231ps	48(%rsi,%rdi,4), %xmm5, %xmm2
	vfmadd231ps	128(%rsi,%rdi,4), %xmm0, %xmm1
	vfmadd231ps	80(%rsi,%rdi,4), %xmm0, %xmm2
	vxorps	%xmm1, %xmm8, %xmm3
	vxorps	%xmm2, %xmm8, %xmm5
	vmovaps	%xmm6, %xmm2
	vxorps	%xmm1, %xmm1, %xmm1
	vcmpleps	%xmm3, %xmm1, %xmm0
	vxorps	%xmm6, %xmm6, %xmm6
	vcmpleps	%xmm5, %xmm1, %xmm1
	vandps	%xmm0, %xmm1, %xmm11
	vaddps	%xmm5, %xmm3, %xmm0
	vcmpleps	%xmm2, %xmm0, %xmm12
	vptest	%xmm12, %xmm11
	jne	.LBB23_2
.LBB23_5:                               # %next.rv
                                        #   in Loop: Header=BB23_1 Depth=1
	cmpl	$0, 204(%rsi)
	leaq	208(%rsi), %rsi
	jns	.LBB23_1
	jmp	.LBB23_6
.LBB23_2:                               # %if_else_crit.rv
                                        #   in Loop: Header=BB23_1 Depth=1
	vpand	%xmm12, %xmm11, %xmm11
	vcmpneq_usps	%xmm6, %xmm2, %xmm0
	vbroadcastss	48(%rcx), %xmm1
	vmulps	%xmm1, %xmm2, %xmm6
	vmovaps	%xmm2, %xmm1
	vmulps	%xmm10, %xmm7, %xmm2
	vfmadd213ps	%xmm2, %xmm13, %xmm9
	vbroadcastss	52(%rcx), %xmm2
	vmulps	%xmm2, %xmm1, %xmm2
	vfmadd132ps	-128(%rsp), %xmm9, %xmm4 # 16-byte Folded Reload
	vxorps	%xmm4, %xmm8, %xmm4
	vcmpleps	%xmm2, %xmm4, %xmm2
	vcmpleps	%xmm4, %xmm6, %xmm6
	vandps	%xmm0, %xmm2, %xmm0
	vmovaps	%xmm1, %xmm2
	vandps	%xmm6, %xmm0, %xmm6
	vptest	%xmm6, %xmm11
	je	.LBB23_5
# BB#3:                                 # %if_else_crit5.rv
                                        #   in Loop: Header=BB23_1 Depth=1
	vpand	%xmm11, %xmm6, %xmm0
	vmovmskps	%xmm0, %edx
	testl	%edx, %edx
	je	.LBB23_5
# BB#4:                                 # %if_then.rv
	tzcntl	%edx, %ecx
	vrcpps	%xmm2, %xmm0
	vbroadcastss	.LCPI23_2(%rip), %xmm1
	vfnmadd213ps	%xmm1, %xmm0, %xmm2
	vfmadd132ps	%xmm0, %xmm0, %xmm2
	movl	%ecx, %edx
	andl	$3, %edx
	vmulps	%xmm4, %xmm2, %xmm0
	vmovaps	%xmm0, -32(%rsp)
	vmovss	-32(%rsp,%rdx,4), %xmm0 # xmm0 = mem[0],zero,zero,zero
	vmulps	%xmm3, %xmm2, %xmm1
	vmovaps	%xmm1, -16(%rsp)
	vmovss	-16(%rsp,%rdx,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	vmulps	%xmm5, %xmm2, %xmm2
	vmovaps	%xmm2, (%rsp)
	vmovss	(%rsp,%rdx,4), %xmm2    # xmm2 = mem[0],zero,zero,zero
	movl	$2147483647, %edx       # imm = 0x7FFFFFFF
	andl	192(%rsi,%rcx,4), %edx
	vmovss	%xmm0, (%rax)
	vmovss	%xmm1, 4(%rax)
	vmovss	%xmm2, 8(%rax)
	movl	%edx, 12(%rax)
	movb	$1, (%r9)
	addq	$24, %rsp
	retq
.LBB23_6:                               # %break.rv
	addq	$24, %rsp
	retq
.Lfunc_end23:
	.size	lambda_2670365_vectorize, .Lfunc_end23-lambda_2670365_vectorize

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI24_0:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI24_1:
	.long	2147483648              # 0x80000000
.LCPI24_2:
	.long	1065353216              # float 1
.LCPI24_3:
	.long	2139095039              # float 3.40282347E+38
	.text
	.globl	lambda_2675782_vectorize
	.p2align	4, 0x90
	.type	lambda_2675782_vectorize,@function
lambda_2675782_vectorize:               # @lambda_2675782_vectorize
# BB#0:                                 # %lambda_2675782_start.rv
	notl	%r9d
	movslq	%edi, %rax
	movslq	%r9d, %rdx
	imulq	$208, %rdx, %rdx
	leaq	176(%rcx,%rdx), %rcx
	vmovaps	.LCPI24_0(%rip), %xmm8  # xmm8 = [9223372034707292159,9223372034707292159]
	vbroadcastss	.LCPI24_1(%rip), %xmm10
	vxorps	%xmm9, %xmm9, %xmm9
	jmp	.LBB24_1
.LBB24_2:                               # %if_else_crit.rv
                                        #   in Loop: Header=BB24_1 Depth=1
	vpand	%xmm0, %xmm6, %xmm6
	vcmpneq_usps	%xmm9, %xmm11, %xmm0
	vmovaps	%xmm0, -72(%rsp)        # 16-byte Spill
	vmulps	%xmm3, %xmm15, %xmm0
	vbroadcastss	52(%rsi), %xmm3
	vmulps	%xmm3, %xmm11, %xmm3
	vfmadd213ps	%xmm0, %xmm14, %xmm13
	vbroadcastss	48(%rsi), %xmm0
	vmulps	%xmm0, %xmm11, %xmm2
	vfmadd213ps	%xmm13, %xmm12, %xmm1
	vxorps	%xmm1, %xmm4, %xmm0
	vcmpleps	%xmm3, %xmm0, %xmm1
	vcmpleps	%xmm0, %xmm2, %xmm2
	vandps	-72(%rsp), %xmm1, %xmm1 # 16-byte Folded Reload
	vandps	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm6
	je	.LBB24_4
# BB#3:                                 # %if_then.rv
                                        #   in Loop: Header=BB24_1 Depth=1
	vpand	%xmm6, %xmm1, %xmm1
	vrcpps	%xmm11, %xmm2
	vbroadcastss	.LCPI24_2(%rip), %xmm3
	vfnmadd213ps	%xmm3, %xmm2, %xmm11
	vfmadd132ps	%xmm2, %xmm2, %xmm11
	vmulps	%xmm0, %xmm11, %xmm0
	vbroadcastss	.LCPI24_3(%rip), %xmm2
	vblendvps	%xmm1, %xmm0, %xmm2, %xmm1
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vpminsd	%xmm2, %xmm1, %xmm2
	vpshufd	$57, %xmm2, %xmm3       # xmm3 = xmm2[1,2,3,0]
	vpminsd	%xmm3, %xmm2, %xmm2
	vcmpeqps	%xmm2, %xmm1, %xmm1
	vmovmskps	%xmm1, %edx
	tzcntl	%edx, %edx
	movl	16(%rcx,%rdx,4), %edi
                                        # kill: %EDX<def> %EDX<kill> %RDX<kill> %RDX<def>
	andl	$3, %edx
	vmovaps	%xmm0, -56(%rsp)
	vmovss	-56(%rsp,%rdx,4), %xmm0 # xmm0 = mem[0],zero,zero,zero
	vmulps	%xmm7, %xmm11, %xmm1
	vmovaps	%xmm1, -40(%rsp)
	vmovss	-40(%rsp,%rdx,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	vmulps	%xmm5, %xmm11, %xmm2
	vmovaps	%xmm2, -24(%rsp)
	vmovss	-24(%rsp,%rdx,4), %xmm2 # xmm2 = mem[0],zero,zero,zero
	andl	$2147483647, %edi       # imm = 0x7FFFFFFF
	vmovss	%xmm0, (%r8)
	vmovss	%xmm1, 4(%r8)
	vmovss	%xmm2, 8(%r8)
	movl	%edi, 12(%r8)
	vmovss	%xmm0, 52(%rsi)
	jmp	.LBB24_4
	.p2align	4, 0x90
.LBB24_1:                               # %while_head.rv
                                        # =>This Inner Loop Header: Depth=1
	vmovaps	-32(%rcx,%rax,4), %xmm15
	vbroadcastss	12(%rsi), %xmm5
	vmovaps	-16(%rcx,%rax,4), %xmm14
	vmovaps	(%rcx,%rax,4), %xmm12
	vbroadcastss	16(%rsi), %xmm0
	vmulps	%xmm14, %xmm0, %xmm4
	vfmadd231ps	%xmm15, %xmm5, %xmm4
	vbroadcastss	20(%rsi), %xmm6
	vfmadd231ps	%xmm12, %xmm6, %xmm4
	vmovaps	-144(%rcx,%rax,4), %xmm1
	vmovaps	-160(%rcx,%rax,4), %xmm2
	vmovaps	-176(%rcx,%rax,4), %xmm3
	vbroadcastss	4(%rsi), %xmm7
	vsubps	%xmm7, %xmm2, %xmm13
	vbroadcastss	8(%rsi), %xmm7
	vsubps	%xmm7, %xmm1, %xmm1
	vbroadcastss	(%rsi), %xmm7
	vsubps	%xmm7, %xmm3, %xmm3
	vmulps	%xmm1, %xmm5, %xmm7
	vmulps	%xmm3, %xmm0, %xmm2
	vfmsub213ps	%xmm2, %xmm13, %xmm5
	vmulps	%xmm13, %xmm6, %xmm2
	vfmsub213ps	%xmm2, %xmm1, %xmm0
	vandps	%xmm8, %xmm4, %xmm11
	vfmsub213ps	%xmm7, %xmm3, %xmm6
	vmulps	-64(%rcx,%rax,4), %xmm6, %xmm2
	vandps	%xmm10, %xmm4, %xmm4
	vmulps	-112(%rcx,%rax,4), %xmm6, %xmm6
	vfmadd231ps	-80(%rcx,%rax,4), %xmm0, %xmm2
	vfmadd231ps	-128(%rcx,%rax,4), %xmm0, %xmm6
	vfmadd231ps	-48(%rcx,%rax,4), %xmm5, %xmm2
	vfmadd231ps	-96(%rcx,%rax,4), %xmm5, %xmm6
	vxorps	%xmm2, %xmm4, %xmm7
	vxorps	%xmm6, %xmm4, %xmm5
	vcmpleps	%xmm7, %xmm9, %xmm0
	vcmpleps	%xmm5, %xmm9, %xmm2
	vandps	%xmm0, %xmm2, %xmm6
	vaddps	%xmm5, %xmm7, %xmm0
	vcmpleps	%xmm11, %xmm0, %xmm0
	vptest	%xmm0, %xmm6
	jne	.LBB24_2
.LBB24_4:                               # %next.rv
                                        #   in Loop: Header=BB24_1 Depth=1
	cmpl	$0, 28(%rcx)
	leaq	208(%rcx), %rcx
	jns	.LBB24_1
# BB#5:                                 # %if_then33.rv
	retq
.Lfunc_end24:
	.size	lambda_2675782_vectorize, .Lfunc_end24-lambda_2675782_vectorize

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI25_0:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI25_1:
	.long	2147483648              # 0x80000000
.LCPI25_2:
	.long	1065353216              # float 1
.LCPI25_3:
	.long	2139095039              # float 3.40282347E+38
	.text
	.globl	lambda_2679233_vectorize
	.p2align	4, 0x90
	.type	lambda_2679233_vectorize,@function
lambda_2679233_vectorize:               # @lambda_2679233_vectorize
# BB#0:                                 # %lambda_2679233_start.rv
	notl	%r9d
	movslq	%edi, %rax
	movslq	%r9d, %rsi
	imulq	$208, %rsi, %rsi
	leaq	176(%rdx,%rsi), %rdx
	vbroadcastss	.LCPI25_1(%rip), %xmm10
	vxorps	%xmm9, %xmm9, %xmm9
	jmp	.LBB25_1
.LBB25_2:                               # %if_else_crit.rv
                                        #   in Loop: Header=BB25_1 Depth=1
	vandps	%xmm0, %xmm5, %xmm0
	vmovaps	%xmm0, -72(%rsp)        # 16-byte Spill
	vbroadcastss	48(%rcx), %xmm0
	vmulps	%xmm0, %xmm11, %xmm3
	vmulps	%xmm8, %xmm15, %xmm0
	vbroadcastss	52(%rcx), %xmm5
	vmulps	%xmm5, %xmm11, %xmm5
	vcmpneq_usps	%xmm9, %xmm11, %xmm2
	vfmadd213ps	%xmm0, %xmm14, %xmm1
	vfmadd213ps	%xmm1, %xmm12, %xmm13
	vxorps	%xmm13, %xmm4, %xmm0
	vcmpleps	%xmm5, %xmm0, %xmm1
	vcmpleps	%xmm0, %xmm3, %xmm3
	vandps	%xmm2, %xmm1, %xmm1
	vmovdqa	-72(%rsp), %xmm2        # 16-byte Reload
	vandps	%xmm3, %xmm1, %xmm1
	vptest	%xmm1, %xmm2
	je	.LBB25_4
# BB#3:                                 # %if_then.rv
                                        #   in Loop: Header=BB25_1 Depth=1
	vpand	%xmm2, %xmm1, %xmm1
	vrcpps	%xmm11, %xmm2
	vbroadcastss	.LCPI25_2(%rip), %xmm3
	vfnmadd213ps	%xmm3, %xmm2, %xmm11
	vfmadd132ps	%xmm2, %xmm2, %xmm11
	vmulps	%xmm0, %xmm11, %xmm0
	vbroadcastss	.LCPI25_3(%rip), %xmm2
	vblendvps	%xmm1, %xmm0, %xmm2, %xmm1
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vpminsd	%xmm2, %xmm1, %xmm2
	vpshufd	$57, %xmm2, %xmm3       # xmm3 = xmm2[1,2,3,0]
	vpminsd	%xmm3, %xmm2, %xmm2
	vcmpeqps	%xmm2, %xmm1, %xmm1
	vmovmskps	%xmm1, %esi
	tzcntl	%esi, %esi
	movl	16(%rdx,%rsi,4), %edi
                                        # kill: %ESI<def> %ESI<kill> %RSI<kill> %RSI<def>
	andl	$3, %esi
	vmovaps	%xmm0, -56(%rsp)
	vmovss	-56(%rsp,%rsi,4), %xmm0 # xmm0 = mem[0],zero,zero,zero
	vmulps	%xmm7, %xmm11, %xmm1
	vmovaps	%xmm1, -40(%rsp)
	vmovss	-40(%rsp,%rsi,4), %xmm1 # xmm1 = mem[0],zero,zero,zero
	vmulps	%xmm6, %xmm11, %xmm2
	vmovaps	%xmm2, -24(%rsp)
	vmovss	-24(%rsp,%rsi,4), %xmm2 # xmm2 = mem[0],zero,zero,zero
	andl	$2147483647, %edi       # imm = 0x7FFFFFFF
	vmovss	%xmm0, (%r8)
	vmovss	%xmm1, 4(%r8)
	vmovss	%xmm2, 8(%r8)
	movl	%edi, 12(%r8)
	vmovss	%xmm0, 52(%rcx)
	jmp	.LBB25_4
	.p2align	4, 0x90
.LBB25_1:                               # %while_head.rv
                                        # =>This Inner Loop Header: Depth=1
	vmovaps	-32(%rdx,%rax,4), %xmm15
	vbroadcastss	12(%rcx), %xmm6
	vmovaps	-16(%rdx,%rax,4), %xmm14
	vmovaps	(%rdx,%rax,4), %xmm12
	vbroadcastss	16(%rcx), %xmm0
	vmulps	%xmm14, %xmm0, %xmm4
	vfmadd231ps	%xmm15, %xmm6, %xmm4
	vbroadcastss	20(%rcx), %xmm5
	vfmadd231ps	%xmm12, %xmm5, %xmm4
	vmovaps	-144(%rdx,%rax,4), %xmm1
	vmovaps	-160(%rdx,%rax,4), %xmm7
	vmovaps	-176(%rdx,%rax,4), %xmm2
	vbroadcastss	(%rcx), %xmm3
	vsubps	%xmm3, %xmm2, %xmm8
	vmulps	%xmm8, %xmm0, %xmm2
	vbroadcastss	8(%rcx), %xmm3
	vsubps	%xmm3, %xmm1, %xmm13
	vbroadcastss	4(%rcx), %xmm1
	vsubps	%xmm1, %xmm7, %xmm1
	vmulps	%xmm1, %xmm5, %xmm3
	vfmsub213ps	%xmm3, %xmm13, %xmm0
	vmulps	%xmm13, %xmm6, %xmm3
	vfmsub213ps	%xmm3, %xmm8, %xmm5
	vandps	.LCPI25_0(%rip), %xmm4, %xmm11
	vfmsub213ps	%xmm2, %xmm1, %xmm6
	vmulps	-64(%rdx,%rax,4), %xmm5, %xmm2
	vandps	%xmm10, %xmm4, %xmm4
	vmulps	-112(%rdx,%rax,4), %xmm5, %xmm3
	vfmadd231ps	-80(%rdx,%rax,4), %xmm0, %xmm2
	vfmadd231ps	-128(%rdx,%rax,4), %xmm0, %xmm3
	vfmadd231ps	-48(%rdx,%rax,4), %xmm6, %xmm2
	vfmadd231ps	-96(%rdx,%rax,4), %xmm6, %xmm3
	vxorps	%xmm2, %xmm4, %xmm7
	vxorps	%xmm3, %xmm4, %xmm6
	vcmpleps	%xmm7, %xmm9, %xmm0
	vcmpleps	%xmm6, %xmm9, %xmm2
	vandps	%xmm0, %xmm2, %xmm5
	vaddps	%xmm6, %xmm7, %xmm0
	vcmpleps	%xmm11, %xmm0, %xmm0
	vptest	%xmm0, %xmm5
	jne	.LBB25_2
.LBB25_4:                               # %next.rv
                                        #   in Loop: Header=BB25_1 Depth=1
	cmpl	$0, 28(%rdx)
	leaq	208(%rdx), %rdx
	jns	.LBB25_1
# BB#5:                                 # %if_then33.rv
	retq
.Lfunc_end25:
	.size	lambda_2679233_vectorize, .Lfunc_end25-lambda_2679233_vectorize

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI26_0:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.text
	.globl	xfabsf_avx2
	.p2align	4, 0x90
	.type	xfabsf_avx2,@function
xfabsf_avx2:                            # @xfabsf_avx2
	.cfi_startproc
# BB#0:                                 # %entry
	vbroadcastsd	.LCPI26_0(%rip), %ymm1
	vandps	%ymm1, %ymm0, %ymm0
	retq
.Lfunc_end26:
	.size	xfabsf_avx2, .Lfunc_end26-xfabsf_avx2
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI27_0:
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.quad	9223372034707292159     # 0x7fffffff7fffffff
	.text
	.globl	xfabsf_sse
	.p2align	4, 0x90
	.type	xfabsf_sse,@function
xfabsf_sse:                             # @xfabsf_sse
	.cfi_startproc
# BB#0:                                 # %entry
	andps	.LCPI27_0(%rip), %xmm0
	retq
.Lfunc_end27:
	.size	xfabsf_sse, .Lfunc_end27-xfabsf_sse
	.cfi_endproc


	.section	".note.GNU-stack","",@progbits
