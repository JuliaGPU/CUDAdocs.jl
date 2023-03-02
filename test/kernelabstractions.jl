import KernelAbstractions
using Test

include(joinpath(dirname(pathof(KernelAbstractions)), "..", "test", "testsuite.jl"))

using CUDA
using CUDA.CUDAKernels

if CUDA.functional()
    CUDA.versioninfo()
    CUDA.allowscalar(false)
    Testsuite.testsuite(()->CUDABackend(false, false), backend, CUDA, CuArray, CUDA.CuDeviceArray)
    for (PreferBlocks, AlwaysInline) in Iterators.product((true, false), (true, false))
        Testsuite.unittest_testsuite(()->CUDABackend{PreferBlocks, AlwaysInline}, backend, CUDA, CuArray, CUDA.CuDeviceArray)
    end
end
