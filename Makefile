CLANG=clang
IMPALA=impala
CFLAGS=-O3 -ffast-math -mavx2 -mavx -mfma

all: kernels.s

kernels.s: kernels.ll
	$(CLANG) $(CFLAGS) -c kernels.ll -S -o kernels.s

kernels.ll: kernels.impala intersection.impala ray_layout.impala stack.impala sort.impala vector.impala common.impala export.impala intrinsics.impala intrinsics_cpu.impala intrinsics_thorin.impala runtime.impala
	$(IMPALA) -O3 -emit-llvm $^ -o kernels
