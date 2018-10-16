Ray Tracing Kernels
-------------------

This archive contains:

- The source of our ray tracing kernels (*.impala):
    * kernels.impala : BVH traversal kernels (single, packet & hybrid)
    * export.impala : Exported variants of the traversal kernels
    * stack.impala : Stack structure used during traversal
    * sort.impala : Sorting networks
    * intrinsics*.impala, runtime.impala : Functionality provided by the compiler
    * intersection.impala : Intersection routines
    * vector.impala : Operations on 2D, 3D, and 4D vectors
    * common.impala : Utilities

- The resulting x86 assembly (kernels.s)

Building
--------

In order to build to the kernels, you will need to compile and install the AnyDSL compiler framework: https://github.com/AnyDSL
You will find instructions on how to do this here: https://anydsl.github.io/Build-Instructions.html
Once this is done, just run make in the source directory. This produces both the kernels.s and kernels.ll files.
